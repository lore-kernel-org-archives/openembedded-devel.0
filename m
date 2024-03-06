Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD686C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:47 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.7758.1709714671660334230
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=B36MkSiF;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714671; x=1741250671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aL6/d4Hf7HkoJedaP82yo34jLi2WkOAeRhJb54T7+Vw=;
  b=B36MkSiFhKHVpB0ndTFuNMwvWXtjyT68U0YeIgLIU5CueEA70N9Y+ICD
   S4WyPUpX3woYTaQ7fojXC8d9UQ9k7q+dfRK5mLudzMPgLptyvfPR3WI9Y
   vwnNYU5nLwug99qQx/DQmLGkAcQxyhjydh8spxj4MPt4SUUdK8a5BMd6z
   pv/Ctnij8CbM/dlX9iLZdA9SSOgHkyfYD5yvsI87MhHGRh7QztPJ5PxAS
   mfYa1CO4ejC4c7tQOSGfGZsi0C5vrOO8Zx4zLWH/7HsdzxSM78mtrb0xH
   CNObPeQNmdAHxdXCGFLMi2GTsgNzcIXMMwhdKLlPhgxh5HldR+WEc1EKQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139397652"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139397652"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 495695EA65
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 84B5FD21CB
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 09A7241189
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B01461A006A;
	Wed,  6 Mar 2024 16:44:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/26] python3-grpcio(-tools): upgrade 1.60.1 -> 1.62.0
Date: Wed,  6 Mar 2024 16:43:21 +0800
Message-Id: <1709714608-19296-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-0.727300-10.000000
X-TMASE-MatchedRID: yLHOPqhdQyWdsbtv2+OMzH1zro62qhdClHLUcNM85dpXGTbsQqHbkhAF
	x2ZWP6wibN7gOVCV8aeVrB5X3SpPp5g3EScxi1qS5p1ddw6V4RsxXH/dlhvLvyIIO0VwKeOL2d8
	mtRIRsUMkw8PwVHl/nwXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZ0fdJMjDg/DLO/T
	5SZgJlw/8nAxd+PLLVUPmpD1xtH/w9B/Upv1v66rV6XLSrxpShv8jdqvFOu+K8XrdT+OO1kCMvx
	YNZkZ6i7QHQxPxLQSSAMuqetGVetksDkkP3zIjq3QfwsVk0Ubv+efAnnZBiL5K13zeQcKlRy3ZB
	2ZbXwPoU1Uhvg0vryaWY5uOUQPRyd88p0+UY+sIpjSWxFQe5APYTgx/QtSE9gnRrdS6fVYVv7x3
	ueV/CoJ1lxYrbNcB4gr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109159

From: Wang Mingyu <wangmy@fujitsu.com>

0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
abseil-ppc-fixes.patch
refreshed for 1.62.0

Changelog:
==========
-[metadata] Allow non application/grpc content-type values.
-[BoringSSL] Update third_party/boringssl-with-bazel.
-[GPR] Removed GPR_BACKWARDS_COMPATIBILITY_MODE.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tools_1.60.1.bb => python3-grpcio-tools_1.62.0.bb} |  2 +-
 ...-zlib-Include-unistd.h-for-open-close-C-APIs.patch |  7 +++----
 .../python/python3-grpcio/abseil-ppc-fixes.patch      | 11 +++++------
 ...hon3-grpcio_1.60.1.bb => python3-grpcio_1.62.0.bb} |  2 +-
 4 files changed, 10 insertions(+), 12 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.60.1.bb => python3-grpcio-tools_1.62.0.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.60.1.bb => python3-grpcio_1.62.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.0.bb
index 07f5fe4c2..a8c0ad91f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.60.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.62.0.bb
@@ -12,7 +12,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "da08224ab8675c6d464b988bd8ca02cccd2bf0275bceefe8f6219bfd4a4f5e85"
+SRC_URI[sha256sum] = "7fca6ecfbbf0549058bb29dcc6e435d885b878d07701e77ac58e1e1f591736dc"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
index a5e767029..34ef7874e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
@@ -1,4 +1,4 @@
-From 6ede7d01b18a4d9eeaccd25f5c1ab9985cb65307 Mon Sep 17 00:00:00 2001
+From 671618df3e48619f0c7a5a3acd8982374a5e43db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 12 Feb 2023 21:25:04 -0800
 Subject: [PATCH] zlib: Include unistd.h for open/close C APIs
@@ -6,16 +6,15 @@ Subject: [PATCH] zlib: Include unistd.h for open/close C APIs
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  third_party/zlib/gzguts.h | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/third_party/zlib/gzguts.h b/third_party/zlib/gzguts.h
-index 57faf37..3c700c2 100644
+index f937504..341a68d 100644
 --- a/third_party/zlib/gzguts.h
 +++ b/third_party/zlib/gzguts.h
-@@ -19,6 +19,7 @@
+@@ -18,6 +18,7 @@
  #endif
  
  #include <stdio.h>
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
index 4bb60b6e2..f39a9616d 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -1,4 +1,4 @@
-From 9cec6297effa9fab6f0c71e342046daceecd7d4d Mon Sep 17 00:00:00 2001
+From 102dcce6610e6606fffd3a4986f84eb52177f8c8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 13 Mar 2021 10:26:25 -0800
 Subject: [PATCH] An all-in-one patch that fixes several issues:
@@ -13,7 +13,6 @@ Sourced from void linux
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
-
 ---
  .../abseil-cpp/absl/base/internal/unscaledcycleclock.cc   | 4 ++--
  .../absl/base/internal/unscaledcycleclock_config.h        | 3 ++-
@@ -22,7 +21,7 @@ Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
  4 files changed, 12 insertions(+), 5 deletions(-)
 
 diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-index b1c396c..d62bfd6 100644
+index 05e0e7b..f11fecb 100644
 --- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
 +++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
@@ -58,10 +57,10 @@ index 24b324a..5e232c1 100644
  #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
  #else
 diff --git a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
-index 5786322..72c7c46 100644
+index 3dd6ba1..9f0601c 100644
 --- a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
 +++ b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
-@@ -33,6 +33,10 @@
+@@ -36,6 +36,10 @@
  #include <csignal>
  #include <cstdio>
  
@@ -72,7 +71,7 @@ index 5786322..72c7c46 100644
  #include "absl/base/attributes.h"
  #include "absl/base/internal/raw_logging.h"
  #include "absl/base/macros.h"
-@@ -174,8 +178,10 @@ void* GetProgramCounter(void* const vuc) {
+@@ -177,8 +181,10 @@ void* GetProgramCounter(void* const vuc) {
      return reinterpret_cast<void*>(context->uc_mcontext.pc);
  #elif defined(__powerpc64__)
      return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.62.0.bb
index b00f8681c..ceb22f0e2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.60.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.0.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            "
-SRC_URI[sha256sum] = "dd1d3a8d1d2e50ad9b59e10aa7f07c7d1be2b367f3f2d33c5fade96ed5460962"
+SRC_URI[sha256sum] = "748496af9238ac78dcd98cce65421f1adce28c3979393e3609683fcd7f3880d7"
 
 RDEPENDS:${PN} = "python3-protobuf \
                   python3-setuptools \
-- 
2.34.1


