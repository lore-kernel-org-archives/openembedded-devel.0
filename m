Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0259BECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:56:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.32831.1661482563994580621
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=m785xN8Z;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482562; i=@fujitsu.com;
	bh=ONhioE0o5pJgCk4Arr6g4IAo2tCkb/thUQjAXk1Bn+Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=m785xN8ZpMW0FsYeOZuBdDmJa2kkF2AladK01ntqIC6JUxaVNiBhjWiwi7Rrwoowl
	 CwUEF6s+IZqe98qpL9SzIhq5oYoVj4VsKywNIkYo0pSC7rXlgSjtNnAf3FaULEPFLU
	 lbNsKC2pcCluaVOrF8ZPboe7iCYA9fjmsW1fXnxig+bR876DAp8rM32spuRhpODlZU
	 UktoYu+IRYThmgkz7aq3/WWhg0wdcECb3G0WYMcl8MNegmh9zViGPI+8WewPFJnYwv
	 YgS38gkYZOnEtQx1OCGfE+nEsFrRCifafp2ttsj18SAEc04hzhAf4l924yd0FsMlOu
	 Oy0MpBNlHNfLg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORpOtoxpF
  s8O6KisXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFgxhamgk/WFTtmfGZpYDxu0sXIxSEk8JBR
  ov3/XXYI5yqTxMbjm1ghnFOMEoveNwI5nBxsAuoSj2++ZgSxRQT0JZbO3sMMYjMLqEp0X1zDD
  mILC/hKzL3ynAnEZgGKr948H8jm4OAVcJe4eNMHJCwhoCAx5eF7sFZOAQ+Jj/u3soDYQkAlz8
  5tAovzCghKnJz5hAVivITEwRcvmCF6lSROrPgINlJCoFLixuNUiLCaxFWg1gmMgrOQdM9C0r2
  AkWkVo3VSUWZ6RkluYmaOrqGBga6hoamusZGuoYWlXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYBCnFCvs3cF4eeVPvUOMkhxMSqK8+s/Yk4X4kvJTKjMSizPii0pzUosPM
  cpwcChJ8KqZcCQLCRalpqdWpGXmACMKJi3BwaMkwistCpTmLS5IzC3OTIdInWK05Jg6+99+Zo
  7lYHLm17YDzEIsefl5qVLivL6mQA0CIA0ZpXlw42BRf4lRVkqYl5GBgUGIpyC1KDezBFX+FaM
  4B6OSMG+qIdAUnsy8Eritr4AOYgI6SGoDO8hBJYkIKakGJt0zs6sr2S9u397bvm5+9iG3O2V/
  m3su6XSy+1sKT8gzVmJ7MvWYzZ15Vytjfn6eG3jgWWJjnnfZHqfmbdJab1IaqjbI/li6YrG3r
  vGdAO3gWGHzPTtO9n9V7ko8Z7HhZ6l98rn+kJk2u4ves7+2OdybV3vBsuaWlvbhT1Uptu1ct8
  +pGBzNPML8cb5F5VXjGT0HS6/sF9zNMa9EpXPPKbPwuXPmhGyz0Z1S3FNtLjLfbtHrKZfmLHF
  ksV3JGqOuzN5qK9c1Q9DqyI9P/kpad5d+166SDEzeJK/9j00g6lvk8l7dog1My55/aC14Yd93
  NbPwqMTthYHbP+T618hfNd75q2BN37WjOz6mZfZ7KrEUZyQaajEXFScCAAwaF1J1AwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1661482561!168375!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15098 invoked from network); 26 Aug 2022 02:56:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:56:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4FC081AC
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:56:01 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 43C591AB
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:56:01 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:55:59 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade  1.47.0 -> 1.48.0
Date: Fri, 26 Aug 2022 10:57:06 +0800
Message-ID: <1661482626-30776-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661482626-30776-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1661482626-30776-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:56:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98459

From: Xu Huan <xuhuan.fnst@fujitsu.com>

0001-absl-always-use-asm-sgidefs.h.patch
removed since it's included in 1.48.0

abseil-ppc-fixes.patch
refreshed for new version

License-Update:
  Add the contents of Mozilla Public License to license file.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../0001-absl-always-use-asm-sgidefs.h.patch  | 33 -------------------
 .../python3-grpcio/abseil-ppc-fixes.patch     | 28 +++++++++++++---
 ...cio_1.47.0.bb => python3-grpcio_1.48.0.bb} |  5 ++-
 3 files changed, 25 insertions(+), 41 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.47.0.bb => python3-grpcio_1.48.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
deleted file mode 100644
index be516ca508..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-absl-always-use-asm-sgidefs.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 8f21fdfb83b0fa844a9f1f03a86a9ca46642d85e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 9 Apr 2020 13:06:27 -0700
-Subject: [PATCH 1/2] absl: always use <asm/sgidefs.h>
-
-Fixes mips/musl build, since sgidefs.h is not present on all C libraries
-but on linux asm/sgidefs.h is there and contains same definitions, using
-that makes it portable.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- third_party/abseil-cpp/absl/base/internal/direct_mmap.h | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
---- a/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
-+++ b/third_party/abseil-cpp/absl/base/internal/direct_mmap.h
-@@ -41,13 +41,9 @@
- 
- #ifdef __mips__
- // Include definitions of the ABI currently in use.
--#ifdef __BIONIC__
--// Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
-+// bionic/musl C libs don't have sgidefs.h, but do have asm/sgidefs.h, which has the
- // definitions we need.
- #include <asm/sgidefs.h>
--#else
--#include <sgidefs.h>
--#endif  // __BIONIC__
- #endif  // __mips__
- 
- // SYS_mmap and SYS_munmap are not defined in Android.
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
index e8048fe940..304e389936 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -8,7 +8,16 @@ An all-in-one patch that fixes several issues:
 Sourced from void linux
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
+---
+ absl/base/internal/unscaledcycleclock.cc    | 4 ++--
+ absl/base/internal/unscaledcycleclock.h     | 3 ++-
+ absl/debugging/internal/examine_stack.cc    | 8 +++++++-
+ absl/debugging/internal/stacktrace_config.h | 2 +-
+ 4 files changed, 12 insertions(+), 5 deletions(-)
 
+diff --git a/absl/base/internal/unscaledcycleclock.cc b/absl/base/internal/unscaledcycleclock.cc
+index b1c396c..d62bfd6 100644
 --- a/absl/base/internal/unscaledcycleclock.cc
 +++ b/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
@@ -20,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #ifdef __GLIBC__
  #include <sys/platform/ppc.h>
  #elif defined(__FreeBSD__)
-@@ -59,7 +59,7 @@ double UnscaledCycleClock::Frequency() {
+@@ -58,7 +58,7 @@ double UnscaledCycleClock::Frequency() {
    return base_internal::NominalCPUFrequency();
  }
  
@@ -29,6 +38,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  int64_t UnscaledCycleClock::Now() {
  #ifdef __GLIBC__
+diff --git a/absl/base/internal/unscaledcycleclock.h b/absl/base/internal/unscaledcycleclock.h
+index 2cbeae3..683a5ef 100644
 --- a/absl/base/internal/unscaledcycleclock.h
 +++ b/absl/base/internal/unscaledcycleclock.h
 @@ -46,7 +46,8 @@
@@ -38,12 +49,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 -    defined(__powerpc__) || defined(__ppc__) || defined(__riscv) ||     \
 +    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
 +    defined(__riscv) ||     \
-     defined(_M_IX86) || defined(_M_X64)
+     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
  #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
  #else
+diff --git a/absl/debugging/internal/examine_stack.cc b/absl/debugging/internal/examine_stack.cc
+index 5bdd341..a784e0d 100644
 --- a/absl/debugging/internal/examine_stack.cc
 +++ b/absl/debugging/internal/examine_stack.cc
-@@ -27,6 +27,10 @@
+@@ -33,6 +33,10 @@
  #include <csignal>
  #include <cstdio>
  
@@ -54,7 +67,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "absl/base/attributes.h"
  #include "absl/base/internal/raw_logging.h"
  #include "absl/base/macros.h"
-@@ -63,8 +67,10 @@ void* GetProgramCounter(void* vuc) {
+@@ -174,8 +178,10 @@ void* GetProgramCounter(void* const vuc) {
      return reinterpret_cast<void*>(context->uc_mcontext.pc);
  #elif defined(__powerpc64__)
      return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
@@ -66,9 +79,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #elif defined(__riscv)
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
+diff --git a/absl/debugging/internal/stacktrace_config.h b/absl/debugging/internal/stacktrace_config.h
+index 3929b1b..23d5e50 100644
 --- a/absl/debugging/internal/stacktrace_config.h
 +++ b/absl/debugging/internal/stacktrace_config.h
-@@ -59,7 +59,7 @@
+@@ -60,7 +60,7 @@
  #elif defined(__i386__) || defined(__x86_64__)
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_x86-inl.inc"
@@ -77,3 +92,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_powerpc-inl.inc"
  #elif defined(__aarch64__)
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.48.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.48.0.bb
index 24c6e53447..3292a8eebe 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.48.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Google gRPC"
 HOMEPAGE = "http://www.grpc.io/"
 SECTION = "devel/python"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6e4cf218112648d22420a84281b68b88"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
 DEPENDS += "${PYTHON_PN}-protobuf"
 
@@ -10,10 +10,9 @@ SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
 SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://boring_ssl.patch \
                                 file://mips_bigendian.patch \
-                                file://0001-absl-always-use-asm-sgidefs.h.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
-SRC_URI[sha256sum] = "5dbba95fab9b35957b4977b8904fc1fa56b302f9051eff4d7716ebb0c087f801"
+SRC_URI[sha256sum] = "eaf4bb73819863440727195411ab3b5c304f6663625e66f348e91ebe0a039306"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1


