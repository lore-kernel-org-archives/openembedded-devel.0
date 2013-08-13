Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id A5C3A6B67D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2013 22:30:10 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Aug 2013 15:30:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,873,1367996400"; d="scan'208";a="281576334"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Aug 2013 15:30:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Aug 2013 23:30:03 +0100
Message-Id: <43bf3e59f6a19386136dba15dd745f6f6c8c715c.1376432969.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1376432969.git.paul.eggleton@linux.intel.com>
References: <cover.1376432969.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1376432969.git.paul.eggleton@linux.intel.com>
References: <cover.1376432969.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/3] libav: remove
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
X-List-Received-Date: Tue, 13 Aug 2013 22:30:10 -0000

This is now in OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-configure-enable-pic-for-AArch64.patch    |  27 -----
 meta-oe/recipes-multimedia/libav/libav.inc         | 127 ---------------------
 meta-oe/recipes-multimedia/libav/libav_0.8.4.bb    |  28 -----
 meta-oe/recipes-multimedia/libav/libav_git.bb      |  23 ----
 4 files changed, 205 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav-0.8.4/0001-configure-enable-pic-for-AArch64.patch
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav.inc
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav_0.8.4.bb
 delete mode 100644 meta-oe/recipes-multimedia/libav/libav_git.bb

diff --git a/meta-oe/recipes-multimedia/libav/libav-0.8.4/0001-configure-enable-pic-for-AArch64.patch b/meta-oe/recipes-multimedia/libav/libav-0.8.4/0001-configure-enable-pic-for-AArch64.patch
deleted file mode 100644
index 5f2df43..0000000
--- a/meta-oe/recipes-multimedia/libav/libav-0.8.4/0001-configure-enable-pic-for-AArch64.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
-From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-Date: Thu, 10 Jan 2013 12:42:19 +0100
-Subject: [PATCH] configure: enable pic for AArch64
-
-Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-Upstream-Status: Backport
----
- configure |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- git.orig/configure
-+++ git/configure
-@@ -2390,11 +2390,11 @@ EOF
- 
- check_host_cflags -std=c99
- check_host_cflags -Wall
- 
- case "$arch" in
--    alpha|ia64|mips|parisc|sparc)
-+    alpha|ia64|mips|parisc|sparc|aarch64)
-         spic=$shared
-     ;;
-     x86)
-         subarch="x86_32"
-         check_cc <<EOF && subarch="x86_64"
diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
deleted file mode 100644
index 0155b4b..0000000
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ /dev/null
@@ -1,127 +0,0 @@
-DESCRIPTION = "Libav is a complete, cross-platform solution to record, convert and stream audio and video."
-HOMEPAGE = "http://libav.org/"
-SECTION = "libs"
-LICENSE = "GPLv2+"
-
-# Provides ffmpeg compat, see http://libav.org/about.html
-PROVIDES = "ffmpeg"
-
-ARM_INSTRUCTION_SET = "arm"
-
-# faac faad2 lame schroedinger libgsm
-DEPENDS = "x264 virtual/libsdl zlib libogg libvorbis libvpx libtheora"
-
-INC_PR = "r8"
-
-inherit autotools pkgconfig
-
-#    --enable-libgsm
-#    --enable-libmp3lame
-#    --enable-libschroedinger
-#    --enable-libvpx
-
-B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
-
-FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit-frame-pointer -O4 -ffast-math"
-BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-
-EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"
-EXTRA_FFCONF ?= ""
-
-PACKAGECONFIG ??= "bzip2"
-PACKAGECONFIG[jack] = "--enable-indev=jack,--disable-indev=jack,jack"
-PACKAGECONFIG[bzip2] = "--enable-bzlib,--disable-bzlib,bzip2"
-
-EXTRA_OECONF = " \
-    --enable-shared \
-    --enable-pthreads \
-    --enable-gpl \
-    --enable-avfilter \
-    \
-    --cross-prefix=${TARGET_PREFIX} \
-    --prefix=${prefix} \
-    \
-    --enable-avserver \
-    --enable-avplay \
-    --enable-x11grab \
-    --enable-libtheora  \
-    --enable-libvorbis \
-    --enable-libx264 \
-    --arch=${TARGET_ARCH} \
-    --target-os="linux" \
-    --enable-cross-compile \
-    --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
-    --extra-ldflags="${TARGET_LDFLAGS}" \
-    --sysroot="${STAGING_DIR_TARGET}" \
-    --enable-hardcoded-tables \
-    ${EXTRA_FFCONF} \
-"
-
-#| yasm not found, use --disable-yasm for a crippled build
-EXTRA_OECONF_append_x86-64 = " --disable-yasm"
-EXTRA_OECONF_append_x86 = " --disable-yasm"
-
-do_configure() {
-    # We don't have TARGET_PREFIX-pkgconfig
-    sed -i '/pkg_config_default="${cross_prefix}${pkg_config_default}"/d' ${S}/configure
-    mkdir -p ${B}
-    cd ${B}
-    ${S}/configure ${EXTRA_OECONF}
-    sed -i -e s:Os:O4:g ${B}/config.h
-}
-
-do_install_append() {
-    install -m 0644 ${S}/libavfilter/*.h ${D}${includedir}/libavfilter/
-}
-
-FFMPEG_LIBS = "libavcodec libavdevice libavformat \
-               libavutil libpostproc libswscale libavfilter"
-
-PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
-
-RSUGGESTS_${PN} = "mplayer"
-FILES_${PN} = "${bindir}"
-FILES_${PN}-dev = "${includedir}/${PN}"
-
-FILES_${PN}-vhook = "${libdir}/vhook"
-FILES_${PN}-vhook-dbg += "${libdir}/vhook/.debug"
-
-FILES_ffmpeg-x264-presets = "${datadir}/*.avpreset"
-
-LEAD_SONAME = "libavcodec.so"
-
-FILES_${PN}-dev = "${includedir}"
-
-python populate_packages_prepend() {
-    av_libdir = d.expand('${libdir}')
-    av_pkgconfig = d.expand('${libdir}/pkgconfig')
-
-    # Runtime package
-    do_split_packages(d, av_libdir, '^lib(.*)\.so\..*',
-                      output_pattern='lib%s',
-                      description='libav %s library',
-                      extra_depends='',
-                      prepend=True,
-                      allow_links=True)
-
-    # Development packages (-dev, -staticdev)
-    do_split_packages(d, av_libdir, '^lib(.*)\.so$',
-                      output_pattern='lib%s-dev',
-                      description='libav %s development package',
-                      extra_depends='${PN}-dev',
-                      prepend=True,
-                      allow_links=True)
-    do_split_packages(d, av_pkgconfig, '^lib(.*)\.pc$',
-                      output_pattern='lib%s-dev',
-                      description='libav %s development package',
-                      extra_depends='${PN}-dev',
-                      prepend=True)
-    do_split_packages(d, av_libdir, '^lib(.*)\.a$',
-                      output_pattern='lib%s-staticdev',
-                      description='libav %s development package - static library',
-                      extra_depends='${PN}-dev',
-                      prepend=True,
-                      allow_links=True)
-}
-
-PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|postproc).*"
diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb b/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb
deleted file mode 100644
index b48ae96..0000000
--- a/meta-oe/recipes-multimedia/libav/libav_0.8.4.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require libav.inc
-
-EXTRA_OECONF += " \
-    --enable-postproc \
-"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/libav-0.8.4:"
-
-SRC_URI_append = " \
-    file://0001-configure-enable-pic-for-AArch64.patch \
-"
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-PV = "0.8.4+git${SRCPV}"
-PR = "${INC_PR}.0"
-
-# When bumping SRCREV make sure you bump PR here and in dependant
-# recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
-# changes
-SRCREV = "2c8ce46250ff78191fe6565876ddc4bc03fdf519"
-SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.8"
-
-S = "${WORKDIR}/git"
-
-
diff --git a/meta-oe/recipes-multimedia/libav/libav_git.bb b/meta-oe/recipes-multimedia/libav/libav_git.bb
deleted file mode 100644
index d12bd9d..0000000
--- a/meta-oe/recipes-multimedia/libav/libav_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require libav.inc
-
-LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
-                    file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-
-DEPENDS += "libpostproc"
-PV = "0.8.99+git${SRCPV}"
-PR = "${INC_PR}.0"
-
-DEFAULT_PREFERENCE = "-1"
-
-# When bumping SRCREV make sure you bump PR here and in dependant
-# recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
-# changes
-SRCREV = "4673a5a761f329af0aa56fc84f34ed898188bfa2"
-SRC_URI = "git://git.libav.org/libav.git;protocol=git"
-
-S = "${WORKDIR}/git"
-
-# postproc has been split
-EXTRA_OECONF := "${@oe_filter_out('--enable-postproc', '${EXTRA_OECONF}', d)}"
-- 
1.8.1.2


