Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEC6C36010
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.61524.1742893323169219465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tYB7brYC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893324; x=1774429324;
  h=from:to:cc:subject:date:message-id;
  bh=kJs3pKaFTIOPp5kD7qfkab7SjqsDKu3JVyuzHt9lYRY=;
  b=tYB7brYCBjlRAbtotJ2G9IfVr/AUGEvgdSICR0cBPaFRUUZ76AJELiq5
   uFYvvPwZ17jjME4rSit1thzDvn9/HQ/Ht66Nj6/efWQMg5NiGTVrYXD/s
   Oq9+euxxms8BaeoJI2TPksPF5Sq6fKDoHGAD15ZalwykwtKvhwbZ8hTn9
   v02jLR9Ypq2CMnJlzPOW5N4aHSDjSlrjxsyliWJLUS69Jie9aEEUts/mp
   X+vKAqKVXyd6e8qpvhRQ7k0xR+tpuR2oZaBHTkCtuw7wKUA7KlunZ6jX2
   mI8rtvlvEnsUB3EqvwhP0DnUY867rHnCVrPGUAi5gTZ7SVaz61nANVcgZ
   w==;
X-CSE-ConnectionGUID: drs7//4ERUu9HeJ68mflVQ==
X-CSE-MsgGUID: MT6/qxb5QXqIYxKiOttOyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="196914794"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="196914794"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 28FAFE60A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:01:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E07ACD4BC7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:01:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AEA0F1A0078;
	Tue, 25 Mar 2025 17:01:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/45] abseil-cpp: upgrade 20250127.0 -> 20250127.1
Date: Tue, 25 Mar 2025 17:01:08 +0800
Message-Id: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116225

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch
removed since it's inclued in 20250127.1

abseil-cpp/0004-abseil-ppc-fixes.patch
refreshed for 20250127.1

Changelog:
=============
- Added support for Bazel 8.0
- Added support for Bazel Platforms for better portability
- Added ABSL_ATTRIBUTE_VIEW and ABSL_ATTRIBUTE_OWNER for diagnosing certain lifetime issues
- Many performance improvements
- A security issue in hash container create/resize has been fixed. Note that the latest patch releases for previous LTS versions also address this issue.
- Bazel BUILD files now reference repositories by their canonical names from the Bazel Central Registry.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-hint-space-instruction-to-strip-PAC.patch | 32 -------------------
 .../abseil-cpp/0004-abseil-ppc-fixes.patch    | 11 +++----
 ...20250127.0.bb => abseil-cpp_20250127.1.bb} |  7 ++--
 3 files changed, 7 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20250127.0.bb => abseil-cpp_20250127.1.bb} (87%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch
deleted file mode 100644
index a235797de9..0000000000
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5852b47a81e5334a667d1e12dbfa55c0f8111100 Mon Sep 17 00:00:00 2001
-From: Derek Mauro <dmauro@google.com>
-Date: Fri, 7 Feb 2025 08:49:06 -0800
-Subject: [PATCH] Actually use the hint space instruction to strip PAC bits for
- return addresses in stack traces as the comment says
-
-https://android.googlesource.com/platform/libcore/+/71f2c75111e87091616f0f3b86bea6c4d345dad1/src/hotspot/os_cpu/linux_aarch64/pauth_linux_aarch64.inline.hpp
-
-PiperOrigin-RevId: 724360415
-Change-Id: I691160e43354131a04919765ce283e07c3c933a9
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
-Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/5852b47a81e5334a667d1e12dbfa55c0f8111100]
----
- absl/debugging/internal/stacktrace_aarch64-inl.inc | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/absl/debugging/internal/stacktrace_aarch64-inl.inc b/absl/debugging/internal/stacktrace_aarch64-inl.inc
-index 4490c4e13cae..dccadaeb7c24 100644
---- a/absl/debugging/internal/stacktrace_aarch64-inl.inc
-+++ b/absl/debugging/internal/stacktrace_aarch64-inl.inc
-@@ -188,7 +188,9 @@ inline void* ClearPacBits(void* ptr) {
-   // compatibility with ARM platforms that do not support pointer
-   // authentication, we use the hint space instruction XPACLRI instead. Hint
-   // space instructions behave as NOPs on unsupported platforms.
--  asm("xpaclri" : "+r"(x30));
-+#define ABSL_XPACLRI_HINT "hint #0x7;"
-+  asm(ABSL_XPACLRI_HINT : "+r"(x30));  // asm("xpaclri" : "+r"(x30));
-+#undef ABSL_XPACLRI_HINT
-   return x30;
- }
- 
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
index ba0cd66920..a0b99dd206 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
@@ -1,4 +1,4 @@
-From f9607924225ca59fb6c60222e6424b84e6f70029 Mon Sep 17 00:00:00 2001
+From 5891332fecd3bf707b58dda56b4b3f80583b5ef9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Sep 2024 20:53:06 +0800
 Subject: [PATCH] abseil: ppc fixes
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 12 insertions(+), 5 deletions(-)
 
 diff --git a/absl/base/internal/unscaledcycleclock.cc b/absl/base/internal/unscaledcycleclock.cc
-index a0bf3a65..103b4f6a 100644
+index 68f92730..5dbfaab6 100644
 --- a/absl/base/internal/unscaledcycleclock.cc
 +++ b/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
@@ -86,10 +86,10 @@ index 3dd6ba1a..f923b055 100644
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
 diff --git a/absl/debugging/internal/stacktrace_config.h b/absl/debugging/internal/stacktrace_config.h
-index 3929b1b7..23d5e504 100644
+index 88949fe9..4e26a6b7 100644
 --- a/absl/debugging/internal/stacktrace_config.h
 +++ b/absl/debugging/internal/stacktrace_config.h
-@@ -60,7 +60,7 @@
+@@ -67,7 +67,7 @@
  #elif defined(__i386__) || defined(__x86_64__)
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_x86-inl.inc"
@@ -98,6 +98,3 @@ index 3929b1b7..23d5e504 100644
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_powerpc-inl.inc"
  #elif defined(__aarch64__)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.1.bb
similarity index 87%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.1.bb
index f217d4daf8..5368dfaada 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250127.1.bb
@@ -7,15 +7,14 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-SRCREV = "9ac7062b1860d895fb5a8cbf58c3e9ef8f674b5f"
+SRCREV = "d9e4955c65cd4367dd6bf46f4ccb8cd3d100540b"
 BRANCH = "lts_2025_01_27"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
-           file://0001-absl-always-use-asm-sgidefs.h.patch             \
+           file://0001-absl-always-use-asm-sgidefs.h.patch \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
            file://0004-abseil-ppc-fixes.patch \
-           file://0001-Actually-use-the-hint-space-instruction-to-strip-PAC.patch \
-          "
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


