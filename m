Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B483C02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 15:23:13 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.10611.1739028184817777718
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Feb 2025 07:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=XlK6lteP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202502081523014bd0826537eb255d18-wylov2@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202502081523014bd0826537eb255d18
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 08 Feb 2025 16:23:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=61x8blEIwkD8DZ4t1bRQh7Um1rCa8cTuiOJhC48fJH8=;
 b=XlK6ltePAiXeSZO3BVGY/PI/87GUX1bMx4f3HuyyeELVzGgYpJQFM/8YGtSXTuDP7j3zD3
 9eQ/e/f6Zvb5ca/Swnf82abI5ajNXYUeQwtcR1py9JbPuQj5p1FqPfZfSKMuEHwSeIxjQKZJ
 n3NXVqQuXzxFzEKmqQA7yxQnjHbaYgpNpDXY4VlaO3V72Ljw0nGuj2tTVhKjG9reemDqeLfg
 Q1WRtIBwutKC/1018vp3w00pmVHq3fmDNzXiOtIoUBFd4vOXAir2ge0ruAQ/UhZrY8Xb4RXS
 i6fKARu/VX6cg1JXwrrPKxBwn6VmU5OFHzsR1814l1ZMls6vWKJ3M2ig==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 4/4] grpc: add licenses from third party components
Date: Sat,  8 Feb 2025 16:22:13 +0100
Message-Id: <20250208152213.2471440-1-peter.marko@siemens.com>
In-Reply-To: <20250208150308.2451484-4-peter.marko@siemens.com>
References: <20250208150308.2451484-4-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 15:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115313

From: Peter Marko <peter.marko@siemens.com>

There are 9 (out of 24) third party components used for build.
Add their licenses.

SUB third_party/abseil-cpp            .. not used (unbundled)
    third_party/address_sorting       .. USED
SUB third_party/benchmark             .. not used (testing)
SUB third_party/bloaty                .. not used (testing)
SUB third_party/boringssl-with-bazel  .. not used (unbundled; openssl)
    third_party/cares                 .. not used (unbundled)
SUB third_party/envoy-api             .. USED
SUB third_party/googleapis            .. USED
SUB third_party/googletest            .. not used (testing)
    third_party/objective_c           .. not used (build helpers)
SUB third_party/opencensus-proto      .. USED
SUB third_party/opentelemetry         .. not used (gRPC_BUILD_GRPCPP_OTEL_PLUGIN)
SUB third_party/opentelemetry-cpp     .. not used (gRPC_BUILD_GRPCPP_OTEL_PLUGIN)
SUB third_party/protobuf              .. not used (unbundled)
SUB third_party/protoc-gen-validate   .. USED
    third_party/py                    .. not used (build helpers)
    third_party/rake-compiler-dock    .. not used (build helpers)
SUB third_party/re2                   .. not used (unbundled)
    third_party/toolchains            .. not used (build helpers)
    third_party/upb                   .. USED
    third_party/utf8_range            .. USED
SUB third_party/xds                   .. USED
    third_party/xxhash                .. USED
SUB third_party/zlib                  .. not used (unbundled)

* address_sorting - BSD-3-CLAUSE (already in main license)
  https://github.com/grpc/grpc/blob/master/third_party/address_sorting/LICENSE
* envoy-api - Apache-2.0 (already in main license)
  https://github.com/envoyproxy/data-plane-api/blob/4de3c74cf21a9958c1cf26d8993c55c6e0d28b49/LICENSE
* googleapis - Apache-2.0 (already in main license)
  https://github.com/googleapis/googleapis/blob/fe8ba054ad4f7eca946c2d14a63c3f07c0b586a0/LICENSE
* opencensus-proto - Apache-2.0 (already in main license)
  https://github.com/census-instrumentation/opencensus-proto/blob/4aa53e15cbf1a47bc9087e6cfdca214c1eea4e89/LICENSE
* protoc-gen-validate - Apache-2.0 (already in main license)
  https://github.com/bufbuild/protoc-gen-validate/blob/32c2415389a3538082507ae537e7edd9578c64ed/LICENSE
* upb - BSD-3-Clause (already present in main LICENSE)
  there is a note in all files
* utf8_range - MIT
  https://github.com/grpc/grpc/blob/master/third_party/utf8_range/LICENSE
* xds - Apache-2.0 (already in main license)
  https://github.com/cncf/xds/blob/3a472e524827f72d1ad621c4983dd5af54c46776/LICENSE
* xxhash - BSD-2-Clause
  https://github.com/grpc/grpc/blob/master/third_party/xxhash/LICENSE

License-Update: added missing licenses

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: added missing LIC_FILES_CHKSUM update

 meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
index 6e729e9734..f47a933afc 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
@@ -3,8 +3,12 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
 (C++, Node.js, Python, Ruby, Objective-C, PHP, C#)"
 HOMEPAGE = "https://github.com/grpc/grpc"
 SECTION = "libs"
-LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
+LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0 & MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906 \
+    file://third_party/utf8_range/LICENSE;md5=d4974d297231477b2ff507c35d61c13c \
+    file://third_party/xxhash/LICENSE;md5=cdfe7764d5685d8e08b3df302885d7f3 \
+"
 
 DEPENDS = "abseil-cpp c-ares openssl protobuf protobuf-native re2 zlib"
 DEPENDS:append:class-target = " grpc-native"

