Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3499FE7719D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.30364.1735032445679290682
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GiKPWzxJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032446; x=1766568446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=A8XPi8XvC3kPZcwZGPU3bKdlS4zWXDIMduIkkQ7TP4Q=;
  b=GiKPWzxJxFmCsXls4p6ycYLAkoGzmvhPV1+s2fdT19elnYtwJNn/OLQz
   EVuseca+jykmN6f1ZEpWnDHRsksBRf05E+zwtFsJutGc1Bsr7H0f1AkWR
   nKOrMbLj6DFMRlYjIUugnsYVQaITwOj+8I9SaIjoHsrX1fbd6eoZtp/28
   gCc8DAjp4ehRK8iw0F9gFxzxDy1mxqpQwXmMnSD+IJye1XmrRSdqXgQ3F
   ucvuDvyi00wgHWidq8GMeykMyDaRNW7HdJYzBbafi65JJO6OohSzhzMyo
   3ClTfstA++TLUDWSQ1hsQLHgIAxbzcFA6o6GPPn730gzaKOZOKdTz6ZZR
   A==;
X-CSE-ConnectionGUID: lySPVIjBT1KnsPup/Q/5sw==
X-CSE-MsgGUID: jmJBW0ibReqiPeAT6vCoQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184746896"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184746896"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:24 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 98E03E428A
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 69E7CCF7EB
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E88F96B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8FD281A0073;
	Tue, 24 Dec 2024 17:27:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/67] python3-grpcio: upgrade 1.67.1 -> 1.68.1
Date: Tue, 24 Dec 2024 17:26:25 +0800
Message-Id: <1735032421-13513-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.102300-10.000000
X-TMASE-MatchedRID: OIStEy/X03Cjz0nOeth/yYL5ja7E+OhykdS3kPlaZyVkDFfw8NSG/L4x
	GTyJB0n6Cseo5GIVbMaK8WnR386CVm0Xr+fj3ww/8t4fUUGeErSXBPRemiwRNb5/tqn0MloNvwU
	evDt+uW7rCDPw9MoAWAeK67cMzl2i2zLeGRsnt5EZgmFGHqyx6xgff28UuvITpR1YIl7PWZ+ETM
	jf6aTOJ4GxcC+BF04oF/q6px2NM/mUUpG8SniXOG2+CcjCvpMwrB85uDT3cKRVAfMSyLkNgRq33
	JzyEQA+1JHB1JT+1hUsNXgHJGHmOuVaI0j/eUAPxi///JpaHQPwUenwsKlntBTOgoXsEMnyveYm
	FYIsxldtstWbdUtkaTOU0DmKJatfONYaidaivouZUG41i0Kjm0rh/hn4JkBnTPm/MsQarwMUjg2
	Osr6EZ/8nAxd+PLLVv/njZi/u3KuoGSK7rXzPTZXi1z8zt1TRDcK8n+cR7XKbKItl61J/yZ+inT
	K0bC9eKrauXd3MZDV14F7EJL9ePEcFa+shdq4fFG5IVfj19b5fBBGf64SQkv78SX1vy1SBu7qiA
	vaz79BuNrE/HSI8ZY0bxlPl+wnU3kVi7Oe8TS+qBBhtzPlTslPJnXL2yNYdkuo847l05tDEzMyA
	msz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114506

From: Wang Mingyu <wangmy@fujitsu.com>

port_def.inc
abseil-ppc-fixes.patch
refreshed for 1.68.1

0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
removed since it's included in 1.68.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...f-Disable-musttail-attribute-on-mips.patch |  6 +-
 ...67.1.bb => python3-grpcio-tools_1.68.1.bb} |  2 +-
 ...aledcycleclock-remove-RISC-V-support.patch | 79 -------------------
 .../python3-grpcio/abseil-ppc-fixes.patch     | 16 ++--
 ...cio_1.67.1.bb => python3-grpcio_1.68.1.bb} |  3 +-
 5 files changed, 15 insertions(+), 91 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.67.1.bb => python3-grpcio-tools_1.68.1.bb} (86%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.67.1.bb => python3-grpcio_1.68.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
index bf13c71cdd..0f6844df57 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools/0001-protobuf-Disable-musttail-attribute-on-mips.patch
@@ -1,4 +1,4 @@
-From 028a02fa7f03a3bcd590624d32b09100129e096a Mon Sep 17 00:00:00 2001
+From 7d2d5d39b7dcf9b6336d78b9e977b0550f7afe9e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 16 Sep 2022 19:09:15 -0700
 Subject: [PATCH] protobuf: Disable musttail attribute on mips
@@ -13,10 +13,10 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/third_party/protobuf/src/google/protobuf/port_def.inc b/third_party/protobuf/src/google/protobuf/port_def.inc
-index 2b13718..8875e3e 100644
+index 37d80e5..c136654 100644
 --- a/third_party/protobuf/src/google/protobuf/port_def.inc
 +++ b/third_party/protobuf/src/google/protobuf/port_def.inc
-@@ -242,6 +242,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
+@@ -222,6 +222,7 @@ static_assert(PROTOBUF_ABSL_MIN(20230125, 3),
  #error PROTOBUF_TAILCALL was previously defined
  #endif
  #if ABSL_HAVE_CPP_ATTRIBUTE(clang::musttail) && !defined(__arm__) &&  \
diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.68.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.68.1.bb
index 9e8abeb0fe..88183189a3 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.68.1.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "d9657f5ddc62b52f58904e6054b7d8a8909ed08a1e28b734be3a707087bcf004"
+SRC_URI[sha256sum] = "2413a17ad16c9c821b36e4a67fc64c37b9e4636ab1c3a07778018801378739ba"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
deleted file mode 100644
index 63ec2e23d1..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From ee0e37b02d0d28279e103653688bf7203275ec47 Mon Sep 17 00:00:00 2001
-From: aurel32 <aurelien@aurel32.net>
-Date: Fri, 22 Mar 2024 14:21:13 -0700
-Subject: [PATCH] PR #1644: unscaledcycleclock: remove RISC-V support
-
-Imported from GitHub PR https://github.com/abseil/abseil-cpp/pull/1644
-
-Starting with Linux 6.6 [1], RDCYCLE is a privileged instruction on RISC-V and can't be used directly from userland. There is a sysctl option to change that as a transition period, but it will eventually disappear.
-
-The RDTIME instruction is another less accurate alternative, however its frequency varies from board to board, and there is currently now way to get its frequency from userland [2].
-
-Therefore this patch just removes the code for unscaledcycleclock on RISC-V. Without processor specific implementation, abseil relies on std::chrono::steady_clock::now().time_since_epoch() which is basically a wrapper around clock_gettime (CLOCK_MONOTONIC), which in turns use __vdso_clock_gettime(). On RISC-V this VDSO is just a wrapper around RDTIME correctly scaled to use nanoseconds units.
-
-This fixes the testsuite on riscv64, tested on a VisionFive 2 board.
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cc4c07c89aada16229084eeb93895c95b7eabaa3
-[2] https://github.com/abseil/abseil-cpp/pull/1631
-Merge 43356a2548cfde76e164d446cb69004b488c6a71 into 76f8011beabdaee872b5fde7546e02407b220cb1
-
-Merging this change closes #1644
-
-COPYBARA_INTEGRATE_REVIEW=https://github.com/abseil/abseil-cpp/pull/1644 from aurel32:rv64-no-unscaledcycleclock 43356a2548cfde76e164d446cb69004b488c6a71
-PiperOrigin-RevId: 618286262
-Change-Id: Ie4120a727e7d0bb185df6e06ea145c780ebe6652
-
-Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/7335a36d]
-[Adapted to apply on top of meta-oe's patch stack]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- .../absl/base/internal/unscaledcycleclock.cc         | 12 ------------
- .../absl/base/internal/unscaledcycleclock_config.h   |  5 ++---
- 2 files changed, 2 insertions(+), 15 deletions(-)
-
-diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-index f11fecb..103b4f6 100644
---- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-+++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-@@ -121,18 +121,6 @@ double UnscaledCycleClock::Frequency() {
-   return aarch64_timer_frequency;
- }
- 
--#elif defined(__riscv)
--
--int64_t UnscaledCycleClock::Now() {
--  int64_t virtual_timer_value;
--  asm volatile("rdcycle %0" : "=r"(virtual_timer_value));
--  return virtual_timer_value;
--}
--
--double UnscaledCycleClock::Frequency() {
--  return base_internal::NominalCPUFrequency();
--}
--
- #elif defined(_M_IX86) || defined(_M_X64)
- 
- #pragma intrinsic(__rdtsc)
-diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
-index 5e232c1..83552fc 100644
---- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
-+++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
-@@ -22,7 +22,6 @@
- // The following platforms have an implementation of a hardware counter.
- #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
-     ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
--    defined(__riscv) ||     \
-     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
- #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
- #else
-@@ -54,8 +53,8 @@
- #if ABSL_USE_UNSCALED_CYCLECLOCK
- // This macro can be used to test if UnscaledCycleClock::Frequency()
- // is NominalCPUFrequency() on a particular platform.
--#if (defined(__i386__) || defined(__x86_64__) || defined(__riscv) || \
--     defined(_M_IX86) || defined(_M_X64))
-+#if (defined(__i386__) || defined(__x86_64__) || defined(_M_IX86) || \
-+     defined(_M_X64))
- #define ABSL_INTERNAL_UNSCALED_CYCLECLOCK_FREQUENCY_IS_CPU_FREQUENCY
- #endif
- #endif
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
index 1daebfa19d..69e06a7918 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -1,5 +1,5 @@
 From a2ec96a96ff7ba016e800212a942b9f29f255415 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
+From: Khem Raj <raj.khem@gmail.com> 
 Date: Sat, 13 Mar 2021 10:26:25 -0800
 Subject: [PATCH] An all-in-one patch that fixes several issues:
 
@@ -13,6 +13,7 @@ Sourced from void linux
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  .../abseil-cpp/absl/base/internal/unscaledcycleclock.cc   | 4 ++--
  .../absl/base/internal/unscaledcycleclock_config.h        | 3 ++-
@@ -21,7 +22,7 @@ Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
  4 files changed, 12 insertions(+), 5 deletions(-)
 
 diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-index 05e0e7b..f11fecb 100644
+index a0bf3a6..103b4f6 100644
 --- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
 +++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
@@ -43,17 +44,17 @@ index 05e0e7b..f11fecb 100644
  int64_t UnscaledCycleClock::Now() {
  #ifdef __GLIBC__
 diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
-index 24b324a..5e232c1 100644
+index 43a3dab..196a853 100644
 --- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
 +++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
 @@ -21,7 +21,8 @@
  
  // The following platforms have an implementation of a hardware counter.
  #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
--    defined(__powerpc__) || defined(__ppc__) || defined(__riscv) ||     \
+-    defined(__powerpc__) || defined(__ppc__) || defined(_M_IX86) ||     \
 +    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
-+    defined(__riscv) ||     \
-     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
++    defined(_M_IX86) ||     \
+     (defined(_M_X64) && !defined(_M_ARM64EC))
  #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
  #else
 diff --git a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
@@ -96,3 +97,6 @@ index 3929b1b..23d5e50 100644
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_powerpc-inl.inc"
  #elif defined(__aarch64__)
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.67.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.68.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.67.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.68.1.bb
index c574033a11..6967483ace 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.67.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.68.1.bb
@@ -11,9 +11,8 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            file://0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch;patchdir=third_party/boringssl-with-bazel/src/ \
            file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
-           file://0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
            "
-SRC_URI[sha256sum] = "3dc2ed4cabea4dc14d5e708c2b426205956077cc5de419b4d4079315017e9732"
+SRC_URI[sha256sum] = "44a8502dd5de653ae6a73e2de50a401d84184f0331d0ac3daeb044e66d5c5054"
 
 RDEPENDS:${PN} = "python3-protobuf"
 
-- 
2.43.0


