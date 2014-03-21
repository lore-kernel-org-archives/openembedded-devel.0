Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 66F326FA30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 22:59:39 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2347731eei.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 15:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bmqg2bjztqTU7qViX6sZ3u22YaV3iIW/runLZ6aEXjA=;
	b=hb14Ka0MSUO39gVVv6SyteSR69SZ21NujNkLzR76+bspP/DJtuopJjG1vC7fcwwT1F
	YkjNU0ciZEP2aJoC0SGuLCUKn4iA+jW1ywaivDuhQ3O/FgdG9DKYB28PM3aKarSrJ2oH
	9p+WJBWM+IOE4lkEb9EBZwYt+gpd6mP+e948vrBWRSwLRaR3bi0VjOrx+xYObvGaUCF8
	ofkkN21LXTCIKGceipzTUuOldwZju9MqkPRfuoYoLs17AJ/UjlEavxFZjducZ18G4yjr
	k+yaPCtdlJ1RoMGirG50nfX8GeLAVNQclb74jU0BNRVXKdwh+R/gLqKqlS0on6XjFf/U
	eTKg==
X-Received: by 10.14.211.66 with SMTP id v42mr49746127eeo.31.1395442779804;
	Fri, 21 Mar 2014 15:59:39 -0700 (PDT)
Received: from mizar.localdomain
	(host42-251-dynamic.54-79-r.retail.telecomitalia.it. [79.54.251.42])
	by mx.google.com with ESMTPSA id o7sm14725067eew.25.2014.03.21.15.59.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Mar 2014 15:59:39 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Mar 2014 23:59:26 +0100
Message-Id: <1395442766-4319-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH v2] klibc: restylize a bit the recipes
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
X-List-Received-Date: Fri, 21 Mar 2014 22:59:40 -0000

No runtime changes.
Reorder and fix some typos in the comments.
Remove unneeded empty do_install from utils.
Fix bogus PACKAGES_${PN} = "${PN}".

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klcc-cross_2.0.3.bb     | 24 +++++-----
 .../klibc/klibc-static-utils_2.0.3.bb              | 13 +++---
 .../recipes-devtools/klibc/klibc-utils.inc         | 14 ++----
 .../recipes-devtools/klibc/klibc-utils_2.0.3.bb    | 13 +++---
 meta-initramfs/recipes-devtools/klibc/klibc.inc    | 52 ++++++++++------------
 .../recipes-devtools/klibc/klibc_2.0.3.bb          |  9 ++--
 6 files changed, 52 insertions(+), 73 deletions(-)

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
index 068b3d5..7187ba4 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.3.bb
@@ -1,25 +1,29 @@
-require klibc.inc
 SUMMARY = "The klcc crosscompiler for klibc"
-
-SRC_URI += "file://use-env-for-perl.patch"
-
 DEPENDS = "klibc"
 
+require klibc.inc
+
 FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 
+SRC_URI += "file://use-env-for-perl.patch"
+
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
 
 # disable unneeded tasks
 do_package[noexec] = "1"
@@ -28,9 +32,3 @@ do_package_write_ipk[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_tar[noexec] = "1"
-
-# The linux-libc-headers and klibc custom headers are not machine-specific
-# but are installed into machine sysroot.
-# Klcc wrapper is hardcoding som eof these paths thus, to keep te recipe
-# arch-specific, we force the rebuild of klcc-cross for each machine.
-do_compile[vardeps] += "MACHINE"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
index 36d4f12..c835fd6 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_2.0.3.bb
@@ -1,15 +1,12 @@
-KLIBC_UTILS_VARIANT = "static"
-KLIBC_UTILS_PKGNAME = "klibc-static-utils"
+SUMMARY = "klibc utils for initramfs statically compiled"
 
 FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 
-do_install() {
-    :
-}
-
-PACKAGES_${PN} = "${PN}"
+PACKAGES = "${PN}"
 FILES_${PN} = ""
 
+KLIBC_UTILS_VARIANT = "static"
+KLIBC_UTILS_PKGNAME = "klibc-static-utils"
+
 require klibc-utils.inc
 require klibc.inc
-SUMMARY = "klibc utils for initramfs statically compiled"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index a626c96..9014f52 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -1,12 +1,6 @@
-KLIBC_UTILS_VARIANT ?= "shared"
-KLIBC_UTILS_PKGNAME ?= "klibc-utils"
-
-# losetup goes in ${base_sbindir}
-
-do_install_append() {
+do_install() {
     install -d ${D}${base_bindir}
     install -d ${D}${base_sbindir}
-
     # debian packages kinit + kinit.shared but only sh.shared
     if [ "${KLIBC_UTILS_VARIANT}" = "shared" ]; then
         install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
@@ -16,7 +10,6 @@ do_install_append() {
         install -m 755 usr/dash/sh ${D}${base_bindir}/sh
         install -m 755 usr/kinit/kinit ${D}${base_bindir}/kinit
     fi
-
     install -m 755 usr/gzip/gzip ${D}${base_bindir}
     install -m 755 usr/kinit/fstype/${KLIBC_UTILS_VARIANT}/fstype ${D}${base_bindir}
     install -m 755 usr/kinit/ipconfig/${KLIBC_UTILS_VARIANT}/ipconfig ${D}${base_bindir}
@@ -32,6 +25,7 @@ do_install_append() {
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/halt ${D}${base_bindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/kill ${D}${base_bindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ln ${D}${base_bindir}
+    # losetup goes in ${base_sbindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/losetup ${D}${base_sbindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/ls ${D}${base_bindir}
     install -m 755 usr/utils/${KLIBC_UTILS_VARIANT}/minips ${D}${base_bindir}
@@ -54,15 +48,13 @@ do_install_append() {
     ln -s gzip ${D}${base_bindir}/zcat
 }
 
-EXTRA_KLIBC_DEPS = '${@base_conditional("KLIBC_UTILS_VARIANT", "shared", "${THIS_LIBKLIBC}", "", d)}'
+EXTRA_KLIBC_DEPS = "${@base_conditional('KLIBC_UTILS_VARIANT', 'shared', '${THIS_LIBKLIBC}', '', d)}"
 
 PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
 
 python populate_packages_prepend () {
-
     base_bin_dir = d.expand('${base_bindir}')
     do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='${EXTRA_KLIBC_DEPS}', allow_links=True, allow_dirs=True)
-
     base_sbin_dir = d.expand('${base_sbindir}')
     do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='${EXTRA_KLIBC_DEPS}', allow_dirs=True)
 }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
index d3cebad..fc53bec 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_2.0.3.bb
@@ -1,15 +1,12 @@
-KLIBC_UTILS_VARIANT = "shared"
-KLIBC_UTILS_PKGNAME = "klibc-utils"
+SUMMARY = "klibc utils for initramfs"
 
 FILESPATH =. "${FILE_DIRNAME}/klibc-${PV}:"
 
-do_install() {
-    :
-}
-
-PACKAGES_${PN} = "${PN}"
+PACKAGES = "${PN}"
 FILES_${PN} = ""
 
+KLIBC_UTILS_VARIANT = "shared"
+KLIBC_UTILS_PKGNAME = "klibc-utils"
+
 require klibc-utils.inc
 require klibc.inc
-SUMMARY = "klibc utils for initramfs"
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


