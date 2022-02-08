// SPDX-License-Identifier: UNLISCENSED

pragma solidity ^0.8.4;

// import boilerplate code
import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// inherit erc721 
contract NFT is ERC721URIStorage {
    //keep track of tokenIDs
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //pass name of token and symbol
    constructor() ERC721 ("ParlayNFT", "PARLAY") {
        console.log("This is my NFT contract");
    }
    //get nft
    function makeNFT() public {
        //getting current tokenID
        uint256 newItemId = _tokenIds.current();
        //mint 
        _safeMint(msg.sender, newItemId);
        //set data
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/YQDG");
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
        // set delay in mint time
        _tokenIds.increment();
    }
}