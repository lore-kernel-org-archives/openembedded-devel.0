Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1TWJIa-0001g6-Ax
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Nov 2012 05:01:01 +0100
Received: by mail-ie0-f175.google.com with SMTP id c13so3640037ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2012 19:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=x/hybMN1PZKkW42PMVyMY2b0pIVqSwIV3OmJMK9NV8M=;
	b=ZDcnNqFxxqM5YP341Bjp5u4vA/uF4XJOJPQrGdb2E1P9rogiLjiX10MRQDG523VSY0
	v+NfvD/gIIwPvsDtngNExZVZ+WhPcgBzbPGfrVYGwXlBHBnETOvu1G/ZKhwvBVLKD2P4
	96EQW9wFKpkMhxZvOYRNZ3muvHOax5LR/zdTzAoeaNOCMHIeLOe515Zmt1IEV0UkkuSg
	XhxXO82QWWjIjAA56KxEWCWyjHEapHvuzFEwvcOs9L0XiifLu8CqnI+HJMPB995FbIsn
	VJEGyLYdpiviH4lISDN28zHpEpEK4zJvDfpDCBq4Bt0uEHmnfmbZb9n6H/bo+7tycMwc
	vUTg==
Received: by 10.50.157.200 with SMTP id wo8mr6818766igb.29.1352346432939;
	Wed, 07 Nov 2012 19:47:12 -0800 (PST)
Received: from localhost.localdomain (c-107-5-165-158.hsd1.mi.comcast.net.
	[107.5.165.158])
	by mx.google.com with ESMTPS id yf6sm3839323igb.0.2012.11.07.19.47.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Nov 2012 19:47:12 -0800 (PST)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Nov 2012 22:46:39 -0500
Message-Id: <1352346399-25856-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQm/akCkA8thT5EwMt1PhDpcnF4p0mgw73Y7oJiAopoEEGWfD1xb3cr+39W4uj/IbPKEPVkn
Subject: [meta-oe] nodejs: add 0.8.14
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
X-List-Received-Date: Thu, 08 Nov 2012 04:01:04 -0000

From: Jason Kridner <jdk@ti.com>

Signed-off-by: Jason Kridner <jdk@ti.com>
---
 .../nodejs/0001-Fix-hardfloat-detection.patch      |   44 ++++++++++++++++++++
 .../nodejs/nodejs/0002-Enable-NEON.patch           |   27 ++++++++++++
 ...0003-Resolve-bad-rpath-issue-when-linking.patch |   29 +++++++++++++
 meta-oe/recipes-devtools/nodejs/nodejs_0.8.14.bb   |   35 ++++++++++++++++
 4 files changed, 135 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Fix-hardfloat-detection.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0003-Resolve-bad-rpath-issue-when-linking.patch
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs_0.8.14.bb

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Fix-hardfloat-detection.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Fix-hardfloat-detection.patch
new file mode 100644
index 0000000..558446d
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Fix-hardfloat-detection.patch
@@ -0,0 +1,44 @@
+From 0ffc68a4d2fec6ad246e60f3a4d5a0b3b489733e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Nov 2012 11:51:26 -0500
+Subject: [PATCH] Fix hardfloat detection
+
+gcc has a builtin define to denote hard abi when in use, e.g. when
+using -mfloat-abi=hard it will define __ARM_PCS_VFP to 1 and therefore
+we should check that to determine which calling convention is in use
+and not __VFP_FP__ which merely indicates presence of VFP unit
+
+The fix has been provided by Khem Raj <raj.khem@gmail.com>
+
+Updated to v0.8 branch and resubmitted by Jason Kridner <jdk@ti.com>
+
+Upstream-Status: Forwarded
+---
+ deps/v8/src/platform-linux.cc |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
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
+1.7.9.5
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
new file mode 100644
index 0000000..2b83ff8
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0002-Enable-NEON.patch
@@ -0,0 +1,27 @@
+From 8891cb4cae57a6b7db54edb33a43743c4b09c53a Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jdk@ti.com>
+Date: Wed, 7 Nov 2012 14:43:55 -0500
+Subject: [PATCH] Enable NEON
+
+Read this was necessary on a blog.
+
+http://www.code-with-passion.com/2012/11/07/cross-compiling-nodejs-and-node-modules-for-armbeaglebone/
+---
+ deps/v8/build/common.gypi |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/deps/v8/build/common.gypi b/deps/v8/build/common.gypi
+index 7a780cc..237f53f 100644
+--- a/deps/v8/build/common.gypi
++++ b/deps/v8/build/common.gypi
+@@ -29,6 +29,7 @@
+ 
+ {
+   'variables': {
++    'arm_neon%': 1,
+     'use_system_v8%': 0,
+     'msvs_use_common_release': 0,
+     'gcc_version%': 'unknown',
+-- 
+1.7.9.5
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
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.8.14.bb b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.14.bb
new file mode 100644
index 0000000..2cd37b2
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_0.8.14.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
+HOMEPAGE = "http://nodejs.org"
+LICENSE = "MIT & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=95a589a3257ab7dfe37d8a8379e3c72d"
+
+DEPENDS = "openssl"
+
+SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
+           file://0001-Fix-hardfloat-detection.patch \
+           file://0002-Enable-NEON.patch \
+           file://0003-Resolve-bad-rpath-issue-when-linking.patch \
+          "
+SRC_URI[md5sum] = "284fd2c7578064c339d9cf6a3a475ac7"
+SRC_URI[sha256sum] = "e5ce2aadb4df3ea4ca7a021106ffe09d286474476454038e9ed0135eac18e6d0"
+
+S = "${WORKDIR}/node-v${PV}"
+
+# v8 errors out if you have set CCACHE
+CCACHE = ""
+
+do_configure () {
+  export LD="${CXX}"
+  #./configure --without-snapshot --dest-cpu=arm --dest-os=linux --prefix=${prefix}
+  ./configure --prefix=${prefix} --without-snapshot
+}
+
+do_install () {
+  DESTDIR=${D} oe_runmake install
+}
+
+RDEPENDS_${PN} = "curl python-shell python-datetime python-subprocess python-crypt python-textutils python-netclient "
+RDEPENDS_${PN}_virtclass-native = "curl-native python-native"
+
+FILES_${PN} += "${libdir}/node/wafadmin ${libdir}/node_modules"
+BBCLASSEXTEND = "native"
-- 
1.7.9.5



