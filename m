Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S2YQf-0003Ti-5U
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Feb 2012 02:34:05 +0100
Received: from mizar.localdomain (87.14.251.210) by smtp206.alice.it
	(8.6.023.02) id 4F1836AD05100EB9; Wed, 29 Feb 2012 02:25:39 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Feb 2012 02:25:24 +0100
Message-Id: <1330478725-31090-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1330478725-31090-1-git-send-email-andrea.adami@gmail.com>
References: <1330478725-31090-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH] klibc_1.5.25: Fetcher and QA fixes
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
X-List-Received-Date: Wed, 29 Feb 2012 01:34:05 -0000

* fix unfetchable SRC_URI and use git fetcher instead
* and remove checksums file
* adapt ${S}
* fix QA about non -staticdev package contains static .a library
* fix QA about /bin installed but not shipped
* fix license and relative QA
* bump INC_PR
* patchset untouched awaiting klibc_2.0, expected in March 2012

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-devtools/klibc/klcc-cross_1.5.25.bb    |    1 -
 .../klibc/klibc-checksums_1.5.25.inc               |    2 --
 .../klibc/klibc-static-utils_1.5.25.bb             |    1 -
 .../recipes-devtools/klibc/klibc-utils_1.5.25.bb   |    1 -
 meta-initramfs/recipes-devtools/klibc/klibc.inc    |   10 +++++-----
 .../recipes-devtools/klibc/klibc_1.5.25.bb         |   11 ++++-------
 6 files changed, 9 insertions(+), 17 deletions(-)
 delete mode 100644 meta-initramfs/recipes-devtools/klibc/klibc-checksums_1.5.25.inc

diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.25.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.25.bb
index 922c8d8..ad7c07e 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.25.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_1.5.25.bb
@@ -1,7 +1,6 @@
 PR = "${INC_PR}.0"
 
 require klibc.inc
-require klibc-checksums_${PV}.inc
 
 export KLCC_INST = "${STAGING_DIR_TARGET}/lib/klibc"
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-checksums_1.5.25.inc b/meta-initramfs/recipes-devtools/klibc/klibc-checksums_1.5.25.inc
deleted file mode 100644
index ebba658..0000000
--- a/meta-initramfs/recipes-devtools/klibc/klibc-checksums_1.5.25.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-SRC_URI[md5sum] = "5bc4dcd63e9142b934787729133c2766"
-SRC_URI[sha256sum] = "0b910ec0b2a97d4c775ed06e44ad7bca7be150efdf2a77a19253a573e16367d3"
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.25.bb b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.25.bb
index c9749f0..484134e 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.25.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-static-utils_1.5.25.bb
@@ -14,4 +14,3 @@ FILES_${PN} = ""
 
 require klibc-utils.inc
 require klibc.inc
-require klibc-checksums_${PV}.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.25.bb b/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.25.bb
index b26dda4..37cab84 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.25.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils_1.5.25.bb
@@ -14,4 +14,3 @@ FILES_${PN} = ""
 
 require klibc-utils.inc
 require klibc.inc
-require klibc-checksums_${PV}.inc
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 1b1f7c6..bd365da 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 DESCRIPTION = "klibc is intended to be a minimalistic libc subset for \
 use with initramfs.  It is deliberately written for small size, \
 minimal entaglement, and portability, not speed."
-LICENSE = "BSD-ADV"
+LICENSE = "BSD-3-Clause & GPL-2.0 & Zlib"
 LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8b"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -12,7 +12,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 # debugsources.list: No such file or directory:
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
 KLIBC_ARCH_armeb = 'arm'
@@ -23,8 +23,8 @@ KLIBC_ARCH_i586 = 'i386'
 KLIBC_ARCH_i686 = 'i386'
 KLIBC_ARCH_pentium = 'i386'
 
-KLIBC_FETCHDIR = "1.5"
-SRC_URI = "${KERNELORG_MIRROR}/linux/libs/klibc/${KLIBC_FETCHDIR}/klibc-${PV}.tar.bz2"
+SRCREV = "ff0a614bd724f6c4c6a5014a9955dc1bc028f336"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/klibc/klibc.git;protocol=git"
 
 SRC_URI_append_linux-gnueabi = " file://klibc-config-eabi.patch"
 SRC_URI_append_linux-uclibceabi = " file://klibc-config-eabi.patch"
@@ -36,7 +36,7 @@ SRC_URI += "file://fstype-sane-vfat-and-jffs2-for-1.5.patch \
             file://staging.patch \
             "
 
-S = "${WORKDIR}/klibc-${PV}"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
                 'CROSS_COMPILE=${TARGET_PREFIX}' \
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
index a313bfd..8a50628 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klibc_1.5.25.bb
@@ -8,8 +8,9 @@ do_install() {
 
         # the crosscompiler is packaged by klcc-cross
         # remove klcc
-        # remove also from FILES_libklibc-dev
         rm ${D}${base_bindir}/klcc
+        # remove now empty dir
+        rmdir ${D}${base_bindir}
 
         # remove Linux headers .install and ..install.cmd files
         find ${D}${base_libdir}/klibc/include -name '.install' -delete
@@ -21,15 +22,11 @@ do_install() {
 
 }
 
-PACKAGES = "libklibc libklibc-dev"
+PACKAGES = "libklibc libklibc-staticdev libklibc-dev"
 FILES_libklibc = "${base_libdir}/klibc-*.so"
+FILES_libklibc-staticdev = "${base_libdir}/klibc/lib/libc.a"
 FILES_libklibc-dev = "${base_libdir}/klibc.so \
                       ${base_libdir}/klibc/lib/* \
                       ${base_libdir}/klibc/include/* \
                       "
-# see above
-# do not package it in -dev
-#                      ${base_bindir}/klcc \
-
 require klibc.inc
-require klibc-checksums_${PV}.inc
-- 
1.7.3.4



