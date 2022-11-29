// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.7;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

/*
 * 任务 1：
 * 通过 Chainlink Data Feed 获得 link，eth 和 btc 的 usd 价格
 * 参考视频教程：https://www.bilibili.com/video/BV1ed4y1N7Uv?p=3
 * 
 * 任务 1 完成标志：
 * 1. 通过命令 "yarn hardhat test" 使得单元测试 1-6 通过
 * 2. 通过 Remix 在 goerli 测试网部署，并且测试执行是否如预期
*/

contract DataFeedTask {
    AggregatorV3Interface internal linkPriceFeed;
    AggregatorV3Interface internal btcPriceFeed;
    AggregatorV3Interface internal ethPriceFeed;
    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

     /**
     * 步骤 1 - 在构造这里初始化 3 个 Aggregator
     * 
     * 注意：
     * 通过 Remix 部署在非本地环境中时
     * 查看 aggregator 的地址 https://docs.chain.link/docs/ethereum-addresses/#Goerli%20Testnet，获得 Aggregator 合约地址
     * 本地环境中相关参数已经在测试脚本中配置
     * 
     *  
     * 
     *  
     *  linkPriceFeed = AggregatorV3Interface(0xb4c4a493AB6356497713A78FFA6c60FB53517c63);
     *   btcPriceFeed = AggregatorV3Interface(0xA39434A63A52E749F02807ae27335515BA4b07F7);
     *   ethPriceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
     * 
     *  */


    constructor(
        address _linkPriceFeed,
        address _btcPriceFeed,
        address _ethPriceFeed) {
        owner = msg.sender;
        
        //修改以下 solidity 代码
        linkPriceFeed = AggregatorV3Interface(0x5FbDB2315678afecb367f032d93F642f64180aa3);
        btcPriceFeed = AggregatorV3Interface(0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512);
        ethPriceFeed = AggregatorV3Interface(0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0);
    }

    /**
     * 步骤 2 - 完成 getLinkLatestPrice 函数 
     * 获得 link/usd 的价格数据
     */
    function getLinkLatestPrice() public view returns (int256) {
        //在此添加并且修改 solidity 代码
        (,int256 answer, , ,)=linkPriceFeed.latestRoundData();
        return answer;
    }

    /**
     * 步骤 3 - 完成 getBtcLatestPrice 函数
     * 获得 btc/usd 的价格数据
     */  
    function getBtcLatestPrice() public view returns (int256) {
        //在此添加并且修改 solidity 代码
        (,int256 answer, , ,)=btcPriceFeed.latestRoundData();
        return answer;
    }

    /**
     * 步骤 4 - 完成 getEthLatestPrice 函数
     * 获得 eth/usd 的价格数据
     */
    function getEthLatestPrice() public view returns (int256) {
        //在此添加并且修改 solidity 代码
        
       (,int256 answer, , ,)=ethPriceFeed.latestRoundData();
        return answer;
    }

    /**
     * 步骤 5 - 通过 Remix 将合约部署合约（使用 goerli 网络）
     * 
     * 任务成功标志：
     * 合约部署成功
     * 获取 link/usd, btc/usd, eth/usd 价格
     */ 
    
    function getLinkPriceFeed() public view returns (AggregatorV3Interface) {
        return linkPriceFeed;
    }

    function getBtcPriceFeed() public view returns (AggregatorV3Interface) {
        return btcPriceFeed;
    }
 
    function getEthPriceFeed() public view returns (AggregatorV3Interface) {
        return ethPriceFeed;
    }
}