Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 252A460CEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jan 2014 18:05:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jan 2014 10:05:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,743,1384329600"; d="scan'208";a="466727474"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2014 10:04:07 -0800
Received: from irsswdev001.ir.intel.com (irsswdev001.ir.intel.com
	[163.33.195.157])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	s0TI47Fi005707; Wed, 29 Jan 2014 18:04:07 GMT
Received: from irsswdev001.ir.intel.com (localhost [127.0.0.1])
	by irsswdev001.ir.intel.com with ESMTP id s0TI47cK009392;
	Wed, 29 Jan 2014 18:04:07 GMT
Received: (from kmsywula@localhost)
	by irsswdev001.ir.intel.com with œ id s0TI43sc009381;
	Wed, 29 Jan 2014 18:04:03 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Jan 2014 18:03:28 +0000
Message-Id: <1391018608-8719-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.12.2
Cc: koen@dominion.thruhere.net
Subject: [PATCH] nodejs 0.8.18: update to 0.10.25
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jan 2014 18:05:09 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

Regenerated Khem's patch for assembler-arm.cc, skipped:
deps/v8/src/platform-linux.cc since it is already correct
in current nodejs version

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 ...erating-Khem-s-patch-for-assembler-arm.cc.patch | 31 +++++++++++
 ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 ----------------------
 .../nodejs/{nodejs_0.8.18.bb => nodejs_0.10.25.bb} | 12 ++---
 3 files changed, 37 insertions(+), 66 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patch-for-assembler-arm.cc.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.8.18.bb => nodejs_0.10.25.bb} (73%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patch-for-assembler-arm.cc.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patch-for-assembler-arm.cc.patch
new file mode 100644
index 0000000..19b4b6d
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Regenerating-Khem-s-patch-for-assembler-arm.cc.patch
@@ -0,0 +1,31 @@
+From 9febf23ae39c6b7a49b3e9a43319ec9dca8ea771 Mon Sep 17 00:00:00 2001
+From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
+Date: Wed, 29 Jan 2014 17:32:13 +0000
+Subject: [PATCH] Regenerating Khem's patch for assembler-arm.cc
+
+deps/v8/src/platform-linux.cc is already fixed in this version of nodejs,
+so no need to patch it again.
+---
+ deps/v8/src/arm/assembler-arm.cc | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/deps/v8/src/arm/assembler-arm.cc b/deps/v8/src/arm/assembler-arm.cc
+index 9be62a4..f919ff1 100644
+--- a/deps/v8/src/arm/assembler-arm.cc
++++ b/deps/v8/src/arm/assembler-arm.cc
+@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
+   // If the compiler is allowed to use VFP then we can use VFP too in our code
+   // generation even when generating snapshots. ARMv7 and hardware floating
+   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
+-#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
++#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) \
+     && !defined(__SOFTFP__)
+   answer |= 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
+-#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__)
++#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP)
+         // && !defined(__SOFTFP__)
+ #endif  // _arm__
+   if (answer & (1u << ARMv7)) {
+-- 
+1.7.12.2
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
deleted file mode 100644
index 6268d69..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From bf701e7cb3616631a354ed9ecbed6dd16f60c60d Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 30 Jan 2013 10:43:47 +0100
-Subject: [PATCH] gcc has a builtin define to denote hard abi when in use, e.g.
- when using -mfloat-abi=hard it will define __ARM_PCS_VFP to 1 and therefore
- we should check that to determine which calling convention is in use and not
- __VFP_FP__ which merely indicates presence of VFP unit
-
-The fix has been provided by Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Forwarded
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- deps/v8/src/arm/assembler-arm.cc | 4 ++--
- deps/v8/src/platform-linux.cc    | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/deps/v8/src/arm/assembler-arm.cc b/deps/v8/src/arm/assembler-arm.cc
-index 1787d15..c64ef58 100644
---- a/deps/v8/src/arm/assembler-arm.cc
-+++ b/deps/v8/src/arm/assembler-arm.cc
-@@ -71,10 +71,10 @@ static unsigned CpuFeaturesImpliedByCompiler() {
-   // If the compiler is allowed to use VFP then we can use VFP too in our code
-   // generation even when generating snapshots. ARMv7 and hardware floating
-   // point support implies VFPv3, see ARM DDI 0406B, page A1-6.
--#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__) \
-+#if defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP) \
-     && !defined(__SOFTFP__)
-   answer |= 1u << VFP3 | 1u << ARMv7 | 1u << VFP2;
--#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__VFP_FP__)
-+#endif  // defined(CAN_USE_ARMV7_INSTRUCTIONS) && defined(__ARM_PCS_VFP)
-         // && !defined(__SOFTFP__)
- #endif  // _arm__
- 
-diff --git a/deps/v8/src/platform-linux.cc b/deps/v8/src/platform-linux.cc
-index ed9eb79..10d1879 100644
---- a/deps/v8/src/platform-linux.cc
-+++ b/deps/v8/src/platform-linux.cc
-@@ -170,7 +170,7 @@ bool OS::ArmCpuHasFeature(CpuFeature feature) {
- // calling this will return 1.0 and otherwise 0.0.
- static void ArmUsingHardFloatHelper() {
-   asm("mov r0, #0":::"r0");
--#if defined(__VFP_FP__) && !defined(__SOFTFP__)
-+#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
-   // Load 0x3ff00000 into r1 using instructions available in both ARM
-   // and Thumb mode.
-   asm("mov r1, #3":::"r1");
-@@ -195,7 +195,7 @@ static void ArmUsingHardFloatHelper() {
- #else
-   asm("vmov d0, r0, r1");
- #endif  // __thumb__
--#endif  // defined(__VFP_FP__) && !defined(__SOFTFP__)
-+#endif  // defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
-   asm("mov r1, #0":::"r1");
- }
- 
--- 
-1.8.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
similarity index 73%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
index ec9e4cf..a6e8c3f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.25.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4a31e6c424761191227143b86f58a1ef"
 
 DEPENDS = "openssl"
 
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
-           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
-"
-SRC_URI[md5sum] = "25ed6aa5710ac46b867ff3f17a4da1d6"
-SRC_URI[sha256sum] = "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda3b71306fe9ae00f9"
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
+#           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch 
+
+SRC_URI[md5sum] = "153bdbf77b4473df2600b8ce123ef331"
+SRC_URI[sha256sum] = "46eef3b9d5475a2081dc2b2f7cf1f4c3a56824d1fc9b04e7ed1d7a88e8f6b36f"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
1.7.12.2


