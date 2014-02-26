Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9536F3A6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 23:35:23 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c13so967320eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 15:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pllln1cn35PJAiPAXBlag9xTtrvQ2EPjz5EEgeH/Xvs=;
	b=SWnx8zCC/TQs2FXqC2AWzsnY9vVjgUp20z4ySVu9BkBXvbxeL3JcJSP3sqK8Bkow5h
	uLQ23otYuUwWmnsxILVSrRherTBMUjdm1/u4DucB/t24KT9/ayg0RWeCK3ZHhTc9U9Yg
	U4uXbUIjmdliItuCZVS5dx9XRGHQcsJiIXR4hHq+hMF+I2O93sK1L9pEsWeZiST8yrPP
	boabUpCc5Kht/Zc6wBVdkUq9aNTKu8bbV/BBjyjkW/iMeGTLqjphlrEPAAeROTv3bOK1
	KDYONYWAZH3/GklDCI1OTGQ6boJ14pxnMGb7KCfQAELFZYhgOaKAr1yjhwlrXIk0Oq9G
	PjBw==
X-Received: by 10.15.23.66 with SMTP id g42mr9897432eeu.9.1393457724306;
	Wed, 26 Feb 2014 15:35:24 -0800 (PST)
Received: from mizar.localdomain ([95.232.250.139])
	by mx.google.com with ESMTPSA id m1sm9574637een.7.2014.02.26.15.35.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Feb 2014 15:35:23 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2014 00:35:18 +0100
Message-Id: <1393457718-17349-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] klibc: oe-stylize the recipes (cosmetic changes only)
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
X-List-Received-Date: Wed, 26 Feb 2014 23:35:26 -0000

While there, clean up and fix couple of typos in the comments.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klcc-cross_2.0.3.bb     | 23 +++++-----
 .../klibc/klibc-static-utils_2.0.3.bb              | 11 ++---
 .../recipes-devtools/klibc/klibc-utils.inc         | 15 +++----
 .../recipes-devtools/klibc/klibc-utils_2.0.3.bb    | 11 ++---
 meta-initramfs/recipes-devtools/klibc/klibc.inc    | 52 ++++++++++------------
 .../recipes-devtools/klibc/klibc_2.0.3.bb          |  9 ++--
 6 files changed, 55 insertions(+), 66 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
index 068b3d5..3089f20 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
@@ -1,25 +1,26 @@
-require klibc.inc
 SUMMARY = "The klcc crosscompiler for klibc"
-
-SRC_URI += "file://use-env-for-perl.patch"
-
 DEPENDS = "klibc"
 
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+SRC_URI += "file://use-env-for-perl.patch"
 
 inherit cross
 
+# disable task already run in klibc recipe
+do_configure[noexec] = "1"
 do_compile() {
     oe_runmake 'INSTALLDIR=${STAGING_DIR_TARGET}${target_libdir}/klibc' klcc
 }
-
+# The linux-libc-headers and klibc custom headers are not machine-specific
+# but are installed into machine sysroot.
+# Klcc wrapper is hardcoding some of these paths thus, to keep the recipe
+# arch-specific, we force the rebuild of klcc-cross for each machine.
+do_compile[vardeps] += "MACHINE"
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 klcc/klcc ${D}${bindir}/${TARGET_PREFIX}klcc
 }
 
-# disable task already run in klibc recipe
-do_configure[noexec] = "1"
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 
 # disable unneeded tasks
 do_package[noexec] = "1"
@@ -29,8 +30,4 @@ do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_tar[noexec] = "1"
 
-# The linux-libc-headers and klibc custom headers are not machine-specific
-# but are installed into machine sysroot.
-# Klcc wrapper is hardcoding som eof these paths thus, to keep te recipe
-# arch-specific, we force the rebuild of klcc-cross for each machine.
-do_compile[vardeps] += "MACHINE"
+require klibc.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
index 36d4f12..4bf34c5 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
@@ -1,15 +1,16 @@
-KLIBC_UTILS_VARIANT = "static"
-KLIBC_UTILS_PKGNAME = "klibc-static-utils"
-
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+SUMMARY = "klibc utils for initramfs statically compiled"
 
 do_install() {
     :
 }
 
 PACKAGES_${PN} = "${PN}"
+
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 FILES_${PN} = ""
 
 require klibc-utils.inc
 require klibc.inc
-SUMMARY = "klibc utils for initramfs statically compiled"
+
+KLIBC_UTILS_VARIANT = "static"
+KLIBC_UTILS_PKGNAME = "klibc-static-utils"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index a626c96..05431dc 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -1,12 +1,8 @@
-KLIBC_UTILS_VARIANT ?= "shared"
-KLIBC_UTILS_PKGNAME ?= "klibc-utils"
-
-# losetup goes in ${base_sbindir}
+EXTRA_KLIBC_DEPS = "${@base_conditional('KLIBC_UTILS_VARIANT', 'shared', '${THIS_LIBKLIBC}', '', d)}"
 
 do_install_append() {
     install -d ${D}${base_bindir}
     install -d ${D}${base_sbindir}
-
     # debian packages kinit + kinit.shared but only sh.shared
     if [ "${KLIBC_UTILS_VARIANT}" = "shared" ]; then
         install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
@@ -16,7 +12,6 @@ do_install_append() {
         install -m 755 usr/dash/sh ${D}${base_bindir}/sh
         install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
     fi
-
     install -m 755 usr/gzip/gzip ${D}${base_bindir}
     install -m 755 usr/kinit/fstype/${KLIBC_UTILS_VARIANT}/fstype ${D}${base_bindir}
     install -m 755 usr/kinit/ipconfig/${KLIBC_UTILS_VARIANT}/ipconfig ${D}${base_bindir}
@@ -32,6 +27,7 @@ do_install_append() {
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/halt ${D}${base_bindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/kill ${D}${base_bindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ln ${D}${base_bindir}
+    # losetup goes in ${base_sbindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/losetup ${D}${base_sbindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/minips ${D}${base_bindir}
@@ -54,15 +50,14 @@ do_install_append() {
     ln -s gzip ${D}${base_bindir}/zcat
 }
 
-EXTRA_KLIBC_DEPS = '${@base_conditional("KLIBC_UTILS_VARIANT", "shared", "${THIS_LIBKLIBC}", "", d)}'
-
 PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
 
 python populate_packages_prepend () {
-
     base_bin_dir = d.expand('${base_bindir}')
     do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='${EXTRA_KLIBC_DEPS}', allow_links=True, allow_dirs=True)
-
     base_sbin_dir = d.expand('${base_sbindir}')
     do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='${EXTRA_KLIBC_DEPS}', allow_dirs=True)
 }
+
+KLIBC_UTILS_VARIANT ?= "shared"
+KLIBC_UTILS_PKGNAME ?= "klibc-utils"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
index d3cebad..9da6e05 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
@@ -1,15 +1,16 @@
-KLIBC_UTILS_VARIANT = "shared"
-KLIBC_UTILS_PKGNAME = "klibc-utils"
-
-FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
+SUMMARY = "klibc utils for initramfs"
 
 do_install() {
     :
 }
 
 PACKAGES_${PN} = "${PN}"
+
+FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 FILES_${PN} = ""
 
 require klibc-utils.inc
 require klibc.inc
-SUMMARY = "klibc utils for initramfs"
+
+KLIBC_UTILS_VARIANT = "shared"
+KLIBC_UTILS_PKGNAME = "klibc-utils"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 983681a..b4f0cab 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -1,44 +1,22 @@
-DEPENDS = "linux-libc-headers perl-native"
-SECTION = "libs"
 DESCRIPTION = "klibc is intended to be a minimalistic libc subset for \
 use with initramfs.  It is deliberately written for small size, \
 minimal entaglement, and portability, not speed."
+SECTION = "libs"
 LICENSE = "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
-
-# Prevents do_package failures with:
-# debugsources.list: No such file or directory:
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-KLIBC_ARCH = '${TARGET_ARCH}'
-KLIBC_ARCH_aarch64 = 'arm64'
-KLIBC_ARCH_armeb = 'arm'
-KLIBC_ARCH_mipsel = 'mips'
-KLIBC_ARCH_x86 = 'i386'
-KLIBC_ARCH_x86-64 = 'x86_64'
-KLIBC_ARCH_i486 = 'i386'
-KLIBC_ARCH_i586 = 'i386'
-KLIBC_ARCH_i686 = 'i386'
-KLIBC_ARCH_pentium = 'i386'
-KLIBC_ARCH_powerpc = 'ppc'
-KLIBC_ARCH_powerpc64 = 'ppc64'
-
-export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
-
+DEPENDS = "linux-libc-headers perl-native"
 SRCREV = "f0440baf7f2dc1d9a25863c184d0a8fb73c4ee6c"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
 
+SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
 SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch \
                                  file://armv4-fix-v4bx.patch \
-"
+                                 "
 SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch \
                                     file://armv4-fix-v4bx.patch \
-"
-
+                                    "
 SRC_URI += "file://klibc-linux-libc-dev.patch \
             file://staging.patch \
-"
+            "
 
 S = "${WORKDIR}/git"
 
@@ -48,10 +26,26 @@ EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'prefix=${exec_prefix}' \
                 'INSTALLROOT=${D}' \
                 'SHLIBDIR=${libdir}' \
-"
+                "
+
+export FIX_ARMV4_EABI_BX = "${FIX_V4BX}"
 
 do_configure () {
     ln -sf "${STAGING_DIR_TARGET}${exec_prefix}" linux
 }
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+KLIBC_ARCH = "${TARGET_ARCH}"
+KLIBC_ARCH_aarch64 = "arm64"
+KLIBC_ARCH_armeb = "arm"
+KLIBC_ARCH_mipsel = "mips"
+KLIBC_ARCH_x86 = "i386"
+KLIBC_ARCH_x86-64 = "x86_64"
+KLIBC_ARCH_i486 = "i386"
+KLIBC_ARCH_i586 = "i386"
+KLIBC_ARCH_i686 = "i386"
+KLIBC_ARCH_pentium = "i386"
+KLIBC_ARCH_powerpc = "ppc"
+KLIBC_ARCH_powerpc64 = "ppc64"
 THIS_LIBKLIBC = "libklibc (= ${PV})"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
index e97d2c7..bc80f38 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_2.0.3.bb
@@ -1,23 +1,24 @@
+SUMMARY = "klibc, a small C library for use with initramfs"
+
 do_install() {
     oe_runmake install
-
     # the crosscompiler is packaged by klcc-cross
     # remove klcc
     rm ${D}${bindir}/klcc
     # remove now empty dir
     rmdir ${D}${bindir}
-
     install -d ${D}${libdir}
     install -m 755 usr/klibc/klibc-*.so ${D}${libdir}
     (cd  ${D}${libdir}; ln -s klibc-*.so klibc.so)
 }
 
 PACKAGES = "libklibc libklibc-staticdev libklibc-dev"
+
 FILES_libklibc = "${libdir}/klibc-*.so"
 FILES_libklibc-staticdev = "${libdir}/klibc/lib/libc.a"
 FILES_libklibc-dev = "${libdir}/klibc.so \
                       ${libdir}/klibc/lib/* \
                       ${libdir}/klibc/include/* \
-"
+                      "
+
 require klibc.inc
-SUMMARY = "klibc, a small C library for use with initramfs"
-- 
1.8.1.5


