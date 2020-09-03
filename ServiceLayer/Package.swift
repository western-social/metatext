// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ServiceLayer",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "ServiceLayer",
            targets: ["ServiceLayer"]),
        .library(
            name: "ServiceLayerMocks",
            targets: ["ServiceLayerMocks"])
    ],
    dependencies: [
        .package(url: "https://github.com/groue/CombineExpectations.git", .upToNextMajor(from: "0.5.0")),
        .package(path: "DB"),
        .package(path: "Mastodon")
    ],
    targets: [
        .target(
            name: "ServiceLayer",
            dependencies: ["DB"]),
        .target(
            name: "ServiceLayerMocks",
            dependencies: ["ServiceLayer", .product(name: "MastodonStubs", package: "Mastodon")]),
        .testTarget(
            name: "ServiceLayerTests",
            dependencies: ["CombineExpectations", "ServiceLayerMocks"])
    ]
)
