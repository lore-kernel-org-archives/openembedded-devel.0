Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03055C0219E
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 15:04:23 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.10241.1739027057435342980
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Feb 2025 07:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=YSwZ6+my;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202502081504158852714bd0f4281523-cxc64x@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202502081504158852714bd0f4281523
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 08 Feb 2025 16:04:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=HbS+Bz1QKcicYX8plMrBiNa3uyV540LvAoDU0z+OvRU=;
 b=YSwZ6+myCFjyhWsKP27hdwAVqCya4iIhWxJ9xDammyM+xpopq5GJb2BxRAY33tEZWRq+2V
 o0WQPjUlYlma88iPGTykmftEh8MCYTQQkCP63dvYXehm0YQXbS9j6f3uVNKc9GhSKcN8emiy
 Wn+B4mVp+6hrH/21ICz5acndyrltvy6nFD0UDj45dvmeGg1nynJrrAar7/9jwiMyEbWtJi5u
 6yfZekFgHBh+dp2htnJ8yfSPquA612lU5sfaqnHyntmPmHDD9q7RLgBHeeVbwrjG9GsdOk28
 tMWLsRvSuufZYn1sFtkwNP5qqT58TlQjEov6vFEAmPJ6z6QNEXfm15Ow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 4/4] grpc: add licenses from third party components
Date: Sat,  8 Feb 2025 16:03:08 +0100
Message-Id: <20250208150308.2451484-4-peter.marko@siemens.com>
In-Reply-To: <20250208150308.2451484-1-peter.marko@siemens.com>
References: <20250208150308.2451484-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Feb 2025 15:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115312

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

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
index 6e729e9734..131f33a75e 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.68.0.bb
@@ -3,7 +3,7 @@ Provides gRPC libraries for multiple languages written on top of shared C core l
 (C++, Node.js, Python, Ruby, Objective-C, PHP, C#)"
 HOMEPAGE = "https://github.com/grpc/grpc"
 SECTION = "libs"
-LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0"
+LICENSE = "Apache-2.0 & BSD-3-Clause & MPL-2.0 & MIT & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
 DEPENDS = "abseil-cpp c-ares openssl protobuf protobuf-native re2 zlib"

