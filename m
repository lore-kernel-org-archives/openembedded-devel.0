Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id C70D46FF77
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 15:45:50 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n135so1602425qka.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Dec 2015 07:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3NMuMGCereQqV24wXjJqljBQ+7IEY5hiYOYxJkUXEGc=;
	b=vYUB8ZTVtVHyXESq1vxZdfWtWS7uuI1ZmsF/RJPGte5XDmazsYBBIofUpXDOpMuOrl
	X5JRGf4LaT/18m7168Dhk/VGiVO/Okpij8Oofu80vbJQ6+o+jocj8XyBTsaM1q429Doj
	89P2l97bhr8v21EyBVwbUoPJxurGAJ9+oN0DwjUJW7mvfyxmbOJRo+1fR9zeQo+lozQd
	n8CDd5fzg7EZKEamTcVW5s97stjX68c1Fqc4nxO9DoSkwul36wVD1UcysMra5qxjzzL/
	sBMWdmNVxWs1Bydr1f6QBnpgBGYYJypuDfP7dVcw8qxthupw0vmlBXhG5sWpWiEfHyQq
	RWFw==
X-Received: by 10.55.22.29 with SMTP id g29mr33326360qkh.100.1450799150950;
	Tue, 22 Dec 2015 07:45:50 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	g90sm15497728qgg.45.2015.12.22.07.45.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Dec 2015 07:45:50 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Dec 2015 10:45:25 -0500
Message-Id: <1450799125-5013-2-git-send-email-twoerner@gmail.com>
X-Mailer: git-send-email 2.6.3.368.gf34be46
In-Reply-To: <1450799125-5013-1-git-send-email-twoerner@gmail.com>
References: <1450799125-5013-1-git-send-email-twoerner@gmail.com>
Subject: [meta-oe][PATCH v4 1/1] nodejs: cleanup and update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Dec 2015 15:45:51 -0000

Remove old nodejs4_0.4.12 and update nodejs_0.12.7 to the latest stable
nodejs_4.2.3.

Nodejs is picky about which architectures it supports. The supported arch
mapping required some updating to bring it up to date with the current nodejs
code. Add COMPATIBLE_MACHINE entries so it only builds for the supported
architectures.

ARM cores that don't support at least VFP2 have been dropped:

    https://groups.google.com/forum/#!topic/v8-users/aSOFbaAQvMk

    "Due the increasing cost of the keeping the "no-VFPv2" port of V8 working
    on ARM, we are planning on making 3.17 the last V8 release that that
    supports ARM chips without VFPv2. Starting with the 3.18 release, the
    minimal V8 requirements will increase to ARMv6 + VFPv2. In order to
    simplify maintenance, we will also remove the "pre-VFP2" ARM code from the
    V8 code base."

Additionally, gcc no longer supports a VFPv2 option:

    https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-mfpu-1460

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../nodejs/nodejs/enable-armv5e-build.patch        | 22 ----------
 .../nodejs/nodejs4/libev-cross-cc_0.4.12.patch     | 13 ------
 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb  | 49 ----------------------
 .../nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb}   | 18 ++++----
 4 files changed, 11 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
 rename meta-oe/recipes-devtools/nodejs/{nodejs_0.12.7.bb => nodejs_4.2.3.bb} (84%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch b/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
deleted file mode 100644
index cc7c9ab..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/enable-armv5e-build.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Building for qemuarm without thumb enabled is using -march=armv5e which isn't
-recognized here. Fix it by adding __ARM_ARCH_5E__.
-
-v0.12.2 branch of node doesn't seem to be affected, because it's using
-different version of v8
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-diff -uNr node-v0.12.2/deps/v8/src/base/atomicops_internals_arm_gcc.h node-v0.12.2-fix/deps/v8/src/base/atomicops_internals_arm_gcc.h
---- node-v0.12.2/deps/v8/src/base/atomicops_internals_arm_gcc.h	2015-04-01 00:13:01.000000000 +0200
-+++ node-v0.12.2-fix/deps/v8/src/base/atomicops_internals_arm_gcc.h	2015-04-28 14:30:43.119509207 +0200
-@@ -156,7 +156,7 @@
- 
- // This tests against any known ARMv5 variant.
- #elif defined(__ARM_ARCH_5__) || defined(__ARM_ARCH_5T__) || \
--      defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
-+      defined(__ARM_ARCH_5E__) || defined(__ARM_ARCH_5TE__) || defined(__ARM_ARCH_5TEJ__)
- 
- // The kernel also provides a helper function to perform an atomic
- // compare-and-swap operation at the hard-wired address 0xffff0fc0.
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch b/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
deleted file mode 100644
index 2b9838f..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs4/libev-cross-cc_0.4.12.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-diff --git a/deps/libev/wscript b/deps/libev/wscript
-index 4f6c9a8..1796749 100644
---- a/deps/libev/wscript
-+++ b/deps/libev/wscript
-@@ -58,7 +58,7 @@ def configure(conf):
-           return 0;
-       }
-   """
--  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=True,
-+  conf.check_cc(fragment=code, define_name="HAVE_CLOCK_SYSCALL", execute=False,
-                 msg="Checking for SYS_clock_gettime")
- 
-   have_librt = conf.check(lib='rt', uselib_store='RT')
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
deleted file mode 100644
index c73cefc..0000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs4_0.4.12.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "nodeJS Evented I/O for V8 JavaScript"
-HOMEPAGE = "http://nodejs.org"
-LICENSE = "MIT & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d6237f3a840aef5b7880fb4e49eecfe5"
-
-DEPENDS = "openssl"
-
-PNBLACKLIST[nodejs4] ?= "Used only by currently blacklisted cloud9 and fails to build for qemuarm with thumb: error: #error For thumb inter-working we require an architecture which supports blx"
-
-SRC_URI = " \
-    http://nodejs.org/dist/node-v${PV}.tar.gz \
-    file://libev-cross-cc_${PV}.patch \
-"
-SRC_URI[md5sum] = "a6375eaa43db5356bf443e25b828ae16"
-SRC_URI[sha256sum] = "c01af05b933ad4d2ca39f63cac057f54f032a4d83cff8711e42650ccee24fce4"
-
-S = "${WORKDIR}/node-v${PV}"
-
-# v8 errors out if you have set CCACHE
-CCACHE = ""
-
-do_configure () {
-    sed -i -e 's:/usr/lib:${STAGING_LIBDIR}:g' wscript
-    sed -i -e 's:/usr/local/lib:${STAGING_LIBDIR}:g' wscript
-    ./configure --prefix=${prefix} --without-snapshot
-}
-
-do_compile () {
-    make
-}
-
-do_install () {
-    oe_runmake install DESTDIR=${D}
-
-    # fix namespace conflicts with other nodejs recipes
-    mv ${D}${bindir}/node ${D}${bindir}/node4
-    mv ${D}${bindir}/node-waf ${D}${bindir}/node4-waf
-
-    mv ${D}${includedir}/node ${D}${includedir}/node4
-
-    mv ${D}${libdir}/node ${D}${libdir}/node4
-    mv ${D}${libdir}/pkgconfig/nodejs.pc ${D}${libdir}/pkgconfig/nodejs4.pc
-    sed -i -e s:include/node:include/node4: ${D}${libdir}/pkgconfig/nodejs4.pc
-
-    mv ${D}${datadir}/man/man1/node.1 ${D}${datadir}/man/man1/node4.1
-}
-
-FILES_${PN} += "${libdir}/node4/wafadmin"
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
similarity index 84%
rename from meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
index 41eb5ee..66a3c11 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_0.12.7.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.2.3.bb
@@ -1,16 +1,19 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=14115ff11211df04b031ec7d40b6d31b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ee90ba97d933fc8d56e97812b7dd62e9"
 
 DEPENDS = "openssl"
 
+COMPATIBLE_MACHINE_armv4 = "(!.*armv4).*"
+COMPATIBLE_MACHINE_armv5 = "(!.*armv5).*"
+COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
+
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.gz \
-    file://enable-armv5e-build.patch \
     file://no-registry.patch \
 "
-SRC_URI[md5sum] = "5523ec4347d7fe6b0f6dda1d1c7799d5"
-SRC_URI[sha256sum] = "b23d64df051c9c969b0c583f802d5d71de342e53067127a5061415be7e12f39d"
+SRC_URI[md5sum] = "529a8abd4ca5a2225636767d3f14c382"
+SRC_URI[sha256sum] = "5008ade5feb4b089f59163f66bffddc113f27de5d78edf203e39435c2c5d554f"
 
 S = "${WORKDIR}/node-v${PV}"
 
@@ -20,10 +23,11 @@ CCACHE = ""
 def map_nodejs_arch(a, d):
     import re
 
-    if   re.match('p(pc|owerpc)(|64)', a): return 'ppc'
-    elif re.match('i.86$', a): return 'ia32'
+    if   re.match('i.86$', a): return 'ia32'
     elif re.match('x86_64$', a): return 'x64'
-    elif re.match('arm64$', a): return 'arm'
+    elif re.match('aarch64$', a): return 'arm64'
+    elif re.match('powerpc64$', a): return 'ppc64'
+    elif re.match('powerpc$', a): return 'ppc'
     return a
 
 ARCHFLAGS_arm = "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', '--with-arm-float-abi=hard', '--with-arm-float-abi=softfp', d)}"
-- 
2.6.0.rc3


