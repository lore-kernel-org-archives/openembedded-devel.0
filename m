Received: from mail-ee0-f52.google.com ([74.125.83.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URmqq-0001Wk-Sc
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Apr 2013 19:06:32 +0200
Received: by mail-ee0-f52.google.com with SMTP id d17so2199692eek.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=LaCnT/uuC/k/tb5bJqbwXptydrTOnAVmJEe5AnJJ/+E=;
	b=jJPOxwOgm/peoU3Erk4vouegce8UMPuZglTiFnzMh7ibtg3yMDOedAmt3/SyAJ+xLF
	25YsMntNvr5brrRqNwPzOgY/u5nGjwtJwxgaNYp/Nr8yXEv4IZrRQKAQ4kce0s6uAahg
	EvGXjXCn516ryg3MBlQHdZFnX4Q8Dfshg3ZYb8Ou6GPjSK4LA6DxiuUTKrIYKDaE+Fgh
	Rfh56Kv9EWnv1fxtQp/4eULTl5D43muUMFnE2D55I0dYr1XZ88r5VzhK04033eLa3JOB
	vLCpB2G7dFRl+2h/bZvfbYWgEAGdppdjbCeHaBGwduZbsfZIH/FIh8B7uGzBKVhq1YGr
	JjWQ==
X-Received: by 10.15.31.197 with SMTP id y45mr63727192eeu.18.1366044508047;
	Mon, 15 Apr 2013 09:48:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id i53sm27787199eeu.5.2013.04.15.09.48.26
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 09:48:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Apr 2013 18:48:31 +0200
Message-Id: <1366044511-12997-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][RFC] nodejs: upgrade to 0.10.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 17:06:34 -0000

* 0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch seems
  to be resolved by https://chromiumcodereview.appspot.com/10713009

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 ----------------------
 .../nodejs/{nodejs_0.8.18.bb => nodejs_0.10.4.bb}  | 10 ++--
 2 files changed, 5 insertions(+), 65 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.8.18.bb => nodejs_0.10.4.bb} (76%)

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
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.4.bb
similarity index 76%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_0.10.4.bb
index ec9e4cf..3d81ccf 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.10.4.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
+# tools/wrk is under Apache-2.0
+LICENSE = "MIT & BSD & Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1b19aee7bf088151c559f3ec9f830b44"
 
 DEPENDS = "openssl"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
-           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
 "
-SRC_URI[md5sum] = "25ed6aa5710ac46b867ff3f17a4da1d6"
-SRC_URI[sha256sum] = "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda3b71306fe9ae00f9"
+SRC_URI[md5sum] = "a4554450864af89c4420c54349b62295"
+SRC_URI[sha256sum] = "1c960d2822447a9e4f7c46b832ff05e86743033c6643d644975af1cbf6a44fb8"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
1.8.1.5



