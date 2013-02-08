Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1U3u37-00008q-N6
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 20:56:12 +0100
Received: by mail-ee0-f41.google.com with SMTP id c13so2193429eek.14
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Feb 2013 11:39:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=ICZ+vIpI0HgLJi4DTWImqU4Yq1Q0ZOArNdCVsxKruSY=;
	b=kqHHWQxBy9f9L5CV7wN/q9l/4V4zro3zLR18rx9IaqyvH8dPMQLI9P9b1hkYa4ChWD
	9GQVghIGxAdwcslpoL2jIYMLRRuU65dAZQFxlFhPDfuuu5+vZG6BNtD+84ZWnMy1LbgV
	W6qDawH32A9lXspTe2ylH7ycGluFg28qzRkaZbVr2Inxqsum3Wb1S78VB/sgJH4q9ODV
	J9Mru/fGlhe0zy1DZISOeu51OvNj7neNsQQZ6v2xY5JcHOlMGWgOKGTXfCQIE1EIQio4
	JrLX6SnhtT9KQRYu8dAvy5AaLvRsGHcQWNod0kvwbgUJG6pqudw2BKFchBHqwLuCSAa8
	ZWiQ==
X-Received: by 10.14.4.69 with SMTP id 45mr19538463eei.0.1360352399457;
	Fri, 08 Feb 2013 11:39:59 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id b2sm48927552eep.9.2013.02.08.11.39.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 11:39:58 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 20:39:48 +0100
Message-Id: <1360352388-5423-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.2
X-Gm-Message-State: ALoCoQlsdxR+XmkfCcV6VflCZAaoEN+g2rr5ORUu+D08QpINF+yzaOO3Dd2azB7aJb/76qkaAi/A
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCHv2] nodejs: add 0.8.18
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
X-List-Received-Date: Fri, 08 Feb 2013 19:56:14 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 ++++++++++++++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 42 +++++++++++++++
 2 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
new file mode 100644
index 0000000..6268d69
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
@@ -0,0 +1,60 @@
+From bf701e7cb3616631a354ed9ecbed6dd16f60c60d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 30 Jan 2013 10:43:47 +0100
+Subject: [PATCH] gcc has a builtin define to denote hard abi when in use, e.g.
+ when using -mfloat-abi=hard it will define __ARM_PCS_VFP to 1 and therefore
+ we should check that to determine which calling convention is in use and not
+ __VFP_FP__ which merely indicates presence of VFP unit
+
+The fix has been provided by Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Forwarded
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ deps/v8/src/arm/assembler-arm.cc | 4 ++--
+ deps/v8/src/platform-linux.cc    | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/deps/v8/src/arm/assembler-arm.cc b/deps/v8/src/arm/assembler-arm.cc
+index 1787d15..c64ef58 100644
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
+ 
+diff --git a/deps/v8/src/platform-linux.cc b/deps/v8/src/platform-linux.cc
+index ed9eb79..10d1879 100644
+--- a/deps/v8/src/platform-linux.cc
++++ b/deps/v8/src/platform-linux.cc
+@@ -170,7 +170,7 @@ bool OS::ArmCpuHasFeature(CpuFeature feature) {
+ // calling this will return 1.0 and otherwise 0.0.
+ static void ArmUsingHardFloatHelper() {
+   asm("mov r0, #0":::"r0");
+-#if defined(__VFP_FP__) && !defined(__SOFTFP__)
++#if defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
+   // Load 0x3ff00000 into r1 using instructions available in both ARM
+   // and Thumb mode.
+   asm("mov r1, #3":::"r1");
+@@ -195,7 +195,7 @@ static void ArmUsingHardFloatHelper() {
+ #else
+   asm("vmov d0, r0, r1");
+ #endif  // __thumb__
+-#endif  // defined(__VFP_FP__) && !defined(__SOFTFP__)
++#endif  // defined(__ARM_PCS_VFP) && !defined(__SOFTFP__)
+   asm("mov r1, #0":::"r1");
+ }
+ 
+-- 
+1.8.1
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
new file mode 100644
index 0000000..4c4a18c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
+"
+SRC_URI[md5sum] = "25ed6aa5710ac46b867ff3f17a4da1d6"
+SRC_URI[sha256sum] = "1d63dd42f9bd22f087585ddf80a881c6acbe1664891b1dda3b71306fe9ae00f9"
+
+S = "${WORKDIR}/node-v${PV}"
+
+# v8 errors out if you have set CCACHE
+CCACHE = ""
+
+ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--with-arm-float-abi=hard', '--with-arm-float-abi=softfp', d)}"
+ARCHFLAGS ?= ""
+
+# Node is way too cool to use proper autotools, so we install two wrappers to forcefully inject proper arch cflags to workaround gypi
+do_configure () {
+  export LD="${CXX}"
+
+  ./configure --prefix=${prefix} --without-snapshot ${ARCHFLAGS}
+}
+
+do_compile () {
+  export LD="${CXX}"
+  make BUILDTYPE=Release
+}
+
+do_install () {
+  DESTDIR=${D} oe_runmake install
+}
+
+RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
+RDEPENDS_${PN}_virtclass-native = "curl-native python-native"
+
+FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules ${libdir}/dtrace"
+BBCLASSEXTEND = "native"
-- 
1.8.1.2



