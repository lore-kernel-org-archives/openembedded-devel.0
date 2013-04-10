Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPxwU-0001MT-1X
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:32:14 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so325921eaj.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 09:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=8DliWNVagVkH8ktizE7tm4HDiRiRpm+UBMh+V0I6ttE=;
	b=hZyxVXI+YU0nxd+xne3zi1VECvJJTxQb2cigvDZiUQPB1bmpn9a8SjEG9yNFOrVDKw
	Nvv4+3rT/EoR47gb+5q4YxLRkz16PLZXxEocewNmTh5vYEhCWTMBIcqf7ZLH0wNfOwqh
	LXtRNXMYtPe/LedobYIvKN9huCIJVc3/b9x4BKJmAq2sLwXn2lhcRAgsAyFJXgPechTp
	iL/fTuHTX4KD9KRreMVZuOsKW5qJ2HKoHExu0rRshthCtjGelNCN5udtPIK0vHMYfnmi
	jypXxZs6PKbt0wHGcE+smhaSmo7n5/uH2NkJZcvN35fmJBf9t9JtHcln4mnhkUBzz956
	86Dw==
X-Received: by 10.14.182.72 with SMTP id n48mr7154751eem.3.1365610491932;
	Wed, 10 Apr 2013 09:14:51 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id d47sm673685eem.9.2013.04.10.09.14.50
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 09:14:50 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2013 18:14:15 +0200
Message-Id: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQklv8ILEna6OEhekEk6he+lnlSCH3x9YK+SiFaEnY3WjL3o9hXW03tVrxab7Z00oKx3V6ey
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 1/8] nodejs: add 0.8.18
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
X-List-Received-Date: Wed, 10 Apr 2013 16:32:14 -0000

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
1.8.1.4



