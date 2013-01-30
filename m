Received: from mail-ee0-f53.google.com ([74.125.83.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1U0UYU-0000pT-8B
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2013 11:06:14 +0100
Received: by mail-ee0-f53.google.com with SMTP id e53so679424eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2013 01:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=2uM4XbAwpJIAsmpJXPTQCFWNN0Tk/deDMXqEFN2dn2Q=;
	b=IYQl4G6ldC/svJPWVv/QM0E2mt0UUGXr7nma66UFGWZcVdVtyvp7h+/WS6YLEVIExD
	MpDdOsoGXQy7Mqn4akeLpw6mfVHOWgCI8QBZiYx33eHGi8wyY9ksnpwBrd8clSGLaItu
	RvFtEMReKNsXYPDq+SRbdjhCqC7RMe2Ymwcgz4aOrDYBQS8agsFnwaEHj8A4WIXkXBjn
	hk33y59HZtK6la3hP1aZA934jmpV60+uyaj4D/3XLgnU55UdBYXlcPUy/uFGnwr7l18L
	ORgQmnYbjyoA90StXQ2AMNWwEgVWaGX2gjxIaj69VOdRB3bfaruxKssBrEamej+id3ii
	13KQ==
X-Received: by 10.14.2.5 with SMTP id 5mr13372318eee.30.1359539428881;
	Wed, 30 Jan 2013 01:50:28 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d3sm1097758eeo.13.2013.01.30.01.50.27
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 01:50:28 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Jan 2013 10:50:18 +0100
Message-Id: <1359539418-6925-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
X-Gm-Message-State: ALoCoQncdT+vnbV2GYaOKuH2QWLMR6JDm1m9PQE/1XoolXlszt+YPo1/tBm6na+8tHNm96jGW5UZ
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][[RFC][PATCHv2] nodejs: add 0.8.18
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
X-List-Received-Date: Wed, 30 Jan 2013 10:06:14 -0000

The hardfp patch is a forward port from the 0.6.x version in meta-oe, the upstream version doesn't work. I don't know why __SOFTFP__ isn't getting defined, but checking for the PCS version of VFP is a lot safer and actually works.

Runtime tested on armv7a/angstrom

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...uiltin-define-to-denote-hard-abi-when-in-.patch | 60 ++++++++++++++++++++
 ...0003-Resolve-bad-rpath-issue-when-linking.patch | 29 ++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb   | 64 ++++++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
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
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
new file mode 100644
index 0000000..b7e8b6c
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
@@ -0,0 +1,29 @@
+From aaf38f17911941d979074e4d5f8475f4ad5595a8 Mon Sep 17 00:00:00 2001
+From: Nathan Rajlich <nathan@tootallnate.net>
+Date: Tue, 9 Oct 2012 09:49:00 -0700
+Subject: [PATCH] Resolve bad rpath issue when linking
+
+See http://piscisaureus.no.de/libuv/2012-10-09#16:42:44.577 to
+understand the issue.
+
+Added to OE by Jason Kridner <jdk@ti.com>
+---
+ common.gypi |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/common.gypi b/common.gypi
+index b26d2f3..8ae671b 100644
+--- a/common.gypi
++++ b/common.gypi
+@@ -163,7 +163,7 @@
+       [ 'OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris"', {
+         'cflags': [ '-Wall', '-pthread', ],
+         'cflags_cc': [ '-fno-rtti', '-fno-exceptions' ],
+-        'ldflags': [ '-pthread', '-rdynamic' ],
++        'ldflags': [ '-pthread' ],
+         'conditions': [
+           [ 'target_arch=="ia32"', {
+             'cflags': [ '-m32' ],
+-- 
+1.7.9.5
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
new file mode 100644
index 0000000..9b39251
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.18.bb
@@ -0,0 +1,64 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+           file://0001-gcc-has-a-builtin-define-to-denote-hard-abi-when-in-.patch \
+           file://0003-Resolve-bad-rpath-issue-when-linking.patch \
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
+  echo '#!/bin/sh' > ${WORKDIR}/gcc
+  echo '${CC} $@' >> ${WORKDIR}/gcc
+
+  echo '#!/bin/sh' > ${WORKDIR}/g++
+  echo '${CXX} $@'>> ${WORKDIR}/g++
+
+  echo '#!/bin/sh' > ${WORKDIR}/ld
+  echo '${CXX} $@'>> ${WORKDIR}/ld
+
+  chmod +x ${WORKDIR}/gcc ${WORKDIR}/g++ ${WORKDIR}/ld
+
+  export PATH=${WORKDIR}:${PATH}
+  export CC=gcc
+  export CXX=g++
+  export LD=ld
+
+  ./configure --prefix=${prefix} --without-snapshot ${ARCHFLAGS}
+}
+
+do_compile_virtclass-native () {
+  make BUILDTYPE=Release
+}
+
+do_compile () {
+  export PATH=${WORKDIR}:${PATH}
+  export CC=gcc
+  export CXX=g++
+  export LD=ld
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
1.8.1



