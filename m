Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5C3736BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 12:45:06 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so150052501wgy.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kc9rRcQmUP1S+4B9YpF5eM0efxdifABj8BSwj2XByFc=;
	b=ygk0TX9Mk7k+79CfZvwIat5bsAfcTv/GF4LthXajKwVtMtn9K17rFg0eyqTI42MQk7
	/r5KGZW/rZHPHNExGQ3tmtLlFapp2VV2wGFgigWhSqfd3vPN12XikBeAJBWmJo9yTCkP
	a7WjnT3MJiiiXW0IIQ4TImiUPMMcMV1CDUX7rppBYpnjzUWQWdaijRtVna1LeLlLSzRh
	YN5zOA4Qj1D2ZcS87c6BjXjnADy4J9P/vADDZdi9uRSIfWqT0ANdZSHvi/lFVUcKrFue
	KFh87JOke9ICmS8GsZWQCu8vQNtviChb5/zQX/uZtEtTh5Eprjf723928U9d++uYZsG3
	Kk6g==
X-Received: by 10.194.185.207 with SMTP id fe15mr29964620wjc.92.1430225107764; 
	Tue, 28 Apr 2015 05:45:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	fa8sm16251776wib.14.2015.04.28.05.45.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Apr 2015 05:45:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Apr 2015 14:45:07 +0200
Message-Id: <1430225107-10530-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH] nodejs: fix qemuarm build without thumb and drop unused patch
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
X-List-Received-Date: Tue, 28 Apr 2015 12:45:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 ----------------------
 .../nodejs/nodejs/enable-armv5e-build.patch        | 22 ++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb   |  4 +-
 3 files changed, 25 insertions(+), 61 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch

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
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch b/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
new file mode 100644
index 0000000..cc7c9ab
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
@@ -0,0 +1,22 @@
+Building for qemuarm without thumb enabled is using -march=armv5e which isn't
+recognized here. Fix it by adding __ARM_ARCH_5E__.
+
+v0.12.2 branch of node doesn't seem to be affected, because it's using
+different version of v8
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr node-v0.12.2/deps/v8/src/base/atomicops_internals_arm_gcc.h node-v0.12.2-fix/deps/v8/src/base/atomicops_internals_arm_gcc.h
+--- node-v0.12.2/deps/v8/src/base/atomicops_internals_arm_gcc.h	2015-04-01 00:13:01.000000000 +0200
++++ node-v0.12.2-fix/deps/v8/src/base/atomicops_internals_arm_gcc.h	2015-04-28 14:30:43.119509207 +0200
+@@ -156,7 +156,7 @@
+ 
+ // This tests against any known ARMv5 variant.
+ #elif defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || \
+-      defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
++      defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
+ 
+ // The kernel also provides a helper function to perform an atomic
+ // compare-and-swap operation at the hard-wired address 0xffff0fc0.
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
index 945d9b4..0e789f9 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.12.2.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
 
 DEPENDS = "openssl"
 
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz"
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+    file://enable-armv5e-build.patch \
+"
 SRC_URI[md5sum] = "b7f4a9f2e361a7026789a7d6c45a6d30"
 SRC_URI[sha256sum] = "ac7e78ade93e633e7ed628532bb8e650caba0c9c33af33581957f3382e2a772d"
 
-- 
2.3.5


