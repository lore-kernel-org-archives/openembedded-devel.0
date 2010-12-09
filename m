Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQjvz-00009y-U0
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:05:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 72CDE314B86C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:04:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id HzPPLKkWl5LB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:59 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 7E95E314B8DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:55 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 09 Dec 2010 17:03:55 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:03:47 +0000
Message-Id: <1291914227-25068-8-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 8/8] gst-ffmpeg: remove unpinned versions
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
X-List-Received-Date: Thu, 09 Dec 2010 17:05:38 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../gst-ffmpeg-0.10.4/configure-hack.diff          |   10 ------
 .../gst-ffmpeg-0.10.6/configure-hack.diff          |   10 ------
 .../gst-ffmpeg-0.10.7/configure-hack.diff          |   12 -------
 recipes/gstreamer/gst-ffmpeg_0.10.10.bb            |   30 -----------------
 recipes/gstreamer/gst-ffmpeg_0.10.4.bb             |   34 -------------------
 recipes/gstreamer/gst-ffmpeg_0.10.6.bb             |   35 --------------------
 recipes/gstreamer/gst-ffmpeg_0.10.7.bb             |   35 --------------------
 recipes/gstreamer/gst-ffmpeg_0.10.8.bb             |   31 -----------------
 8 files changed, 0 insertions(+), 197 deletions(-)
 delete mode 100644 recipes/gstreamer/gst-ffmpeg-0.10.4/configure-hack.diff
 delete mode 100644 recipes/gstreamer/gst-ffmpeg-0.10.6/configure-hack.diff
 delete mode 100644 recipes/gstreamer/gst-ffmpeg-0.10.7/configure-hack.diff
 delete mode 100644 recipes/gstreamer/gst-ffmpeg_0.10.10.bb
 delete mode 100644 recipes/gstreamer/gst-ffmpeg_0.10.4.bb
 delete mode 100644 recipes/gstreamer/gst-ffmpeg_0.10.6.bb
 delete mode 100644 recipes/gstreamer/gst-ffmpeg_0.10.7.bb
 delete mode 100644 recipes/gstreamer/gst-ffmpeg_0.10.8.bb

diff --git a/recipes/gstreamer/gst-ffmpeg-0.10.4/configure-hack.diff b/recipes/gstreamer/gst-ffmpeg-0.10.4/configure-hack.diff
deleted file mode 100644
index 0c3b5b1..0000000
--- a/recipes/gstreamer/gst-ffmpeg-0.10.4/configure-hack.diff
+++ /dev/null
@@ -1,10 +0,0 @@
---- /tmp/configure.ac	2008-07-03 19:47:44.000000000 +0200
-+++ gst-ffmpeg-0.10.4/configure.ac	2008-07-03 19:47:57.000000000 +0200
-@@ -294,7 +294,6 @@
-   AC_SUBST(FFMPEG_CO_DIR)
-   AC_SUBST(FFMPEG_SVN)
-   AC_SUBST(FFMPEG_REVISION)
--  AC_CONFIG_SUBDIRS(gst-libs/ext/ffmpeg)
-   AC_MSG_NOTICE([Using included FFMpeg code])
- fi
- 
diff --git a/recipes/gstreamer/gst-ffmpeg-0.10.6/configure-hack.diff b/recipes/gstreamer/gst-ffmpeg-0.10.6/configure-hack.diff
deleted file mode 100644
index 0c3b5b1..0000000
--- a/recipes/gstreamer/gst-ffmpeg-0.10.6/configure-hack.diff
+++ /dev/null
@@ -1,10 +0,0 @@
---- /tmp/configure.ac	2008-07-03 19:47:44.000000000 +0200
-+++ gst-ffmpeg-0.10.4/configure.ac	2008-07-03 19:47:57.000000000 +0200
-@@ -294,7 +294,6 @@
-   AC_SUBST(FFMPEG_CO_DIR)
-   AC_SUBST(FFMPEG_SVN)
-   AC_SUBST(FFMPEG_REVISION)
--  AC_CONFIG_SUBDIRS(gst-libs/ext/ffmpeg)
-   AC_MSG_NOTICE([Using included FFMpeg code])
- fi
- 
diff --git a/recipes/gstreamer/gst-ffmpeg-0.10.7/configure-hack.diff b/recipes/gstreamer/gst-ffmpeg-0.10.7/configure-hack.diff
deleted file mode 100644
index 874ba57..0000000
--- a/recipes/gstreamer/gst-ffmpeg-0.10.7/configure-hack.diff
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: gst-ffmpeg-0.10.7/configure.ac
-===================================================================
---- gst-ffmpeg-0.10.7.orig/configure.ac	2009-03-21 00:44:01.000000000 +0000
-+++ gst-ffmpeg-0.10.7/configure.ac	2009-03-30 20:45:05.000000000 +0000
-@@ -337,7 +337,6 @@
-   AC_SUBST(FFMPEG_SVN)
-   AC_SUBST(FFMPEG_REVISION)
-   AC_SUBST(FFMPEG_EXTERNALS_REVISION)
--  AC_CONFIG_SUBDIRS(gst-libs/ext/ffmpeg)
-   AC_MSG_NOTICE([Using included FFMpeg code])
- fi
- 
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.10.bb b/recipes/gstreamer/gst-ffmpeg_0.10.10.bb
deleted file mode 100644
index c5fec35..0000000
--- a/recipes/gstreamer/gst-ffmpeg_0.10.10.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "FFmpeg-based GStreamer plug-in"
-SECTION = "multimedia"
-PRIORITY = "optional"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
-
-PR = "r1"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
-           file://lower-rank.diff \
-"
-
-SRC_URI[md5sum] = "447292deff5f3748444e6a5fba41da29"
-SRC_URI[sha256sum] = "697114483444a0a469028857a1d58145c99e6f5d2cd7edd8cb04cdc3fc72ad94"
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
-
-EXTRA_OECONF = " --with-system-ffmpeg "
-
-# We do this because the install program is called with -s which causes it to
-# call "strip" and it then mangles cross compiled stuff..
-PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
-
-# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
-CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.4.bb b/recipes/gstreamer/gst-ffmpeg_0.10.4.bb
deleted file mode 100644
index a80c8dd..0000000
--- a/recipes/gstreamer/gst-ffmpeg_0.10.4.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "FFmpeg-based GStreamer plug-in"
-SECTION = "multimedia"
-PRIORITY = "optional"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
-PR = "r7"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
-           file://configure-hack.diff \
-"
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
-
-EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
-		--disable-vorbis --disable-vorbistest --disable-encoders \
-		--disable-v4l --disable-audio-oss --disable-dv1394 \
-		--disable-vhook --with-system-ffmpeg --disable-ffserver \
-		--enable-pp --disable-decoder-vorbis"
-
-# We do this because the install program is called with -s which causes it to
-# call "strip" and it then mangles cross compiled stuff..
-PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
-
-# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
-CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
-
-
-SRC_URI[md5sum] = "761cbbc0b5f077449082d0ea7527941e"
-SRC_URI[sha256sum] = "840015b4e0f0e7248b178eafc37476d6eb9aea3876eb3b07e2a66b430b526da2"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.6.bb b/recipes/gstreamer/gst-ffmpeg_0.10.6.bb
deleted file mode 100644
index 2ca8a95..0000000
--- a/recipes/gstreamer/gst-ffmpeg_0.10.6.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "FFmpeg-based GStreamer plug-in"
-SECTION = "multimedia"
-PRIORITY = "optional"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
-PR = "r1"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
-           file://configure-hack.diff \
-           file://lower-rank.diff \
-"
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
-
-EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
-		--disable-vorbis --disable-vorbistest --disable-encoders \
-		--disable-v4l --disable-audio-oss --disable-dv1394 \
-		--disable-vhook --with-system-ffmpeg --disable-ffserver \
-		--enable-pp --disable-decoder-vorbis"
-
-# We do this because the install program is called with -s which causes it to
-# call "strip" and it then mangles cross compiled stuff..
-PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
-
-# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
-CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
-
-
-SRC_URI[md5sum] = "063a8184916426d6b79a97dea9636a78"
-SRC_URI[sha256sum] = "c9a5f4c9b1eddd7cb042d83390072f832f19f3712d023e4d6568391e5eb4878a"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.7.bb b/recipes/gstreamer/gst-ffmpeg_0.10.7.bb
deleted file mode 100644
index caaf374..0000000
--- a/recipes/gstreamer/gst-ffmpeg_0.10.7.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "FFmpeg-based GStreamer plug-in"
-SECTION = "multimedia"
-PRIORITY = "optional"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
-PR = "r2"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
-           file://configure-hack.diff \
-           file://lower-rank.diff \
-"
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
-
-EXTRA_OECONF = "--disable-sdltest --disable-ffplay --disable-freetypetest \
-		--disable-vorbis --disable-vorbistest --disable-encoders \
-		--disable-v4l --disable-audio-oss --disable-dv1394 \
-		--disable-vhook --with-system-ffmpeg --disable-ffserver \
-		--enable-pp --disable-decoder-vorbis"
-
-# We do this because the install program is called with -s which causes it to
-# call "strip" and it then mangles cross compiled stuff..
-PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
-
-# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
-CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
-
-
-SRC_URI[md5sum] = "6be89b26592f36ef631b22a68b8e06c4"
-SRC_URI[sha256sum] = "94bd5110a03837145afe5c81760f22bd7bef9ef455f4417340eeeb2b12e54fb0"
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.8.bb b/recipes/gstreamer/gst-ffmpeg_0.10.8.bb
deleted file mode 100644
index fa42b91..0000000
--- a/recipes/gstreamer/gst-ffmpeg_0.10.8.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "FFmpeg-based GStreamer plug-in"
-SECTION = "multimedia"
-PRIORITY = "optional"
-LICENSE = "LGPL"
-HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
-
-inherit autotools pkgconfig
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
-           file://lower-rank.diff \
-"
-
-PR = "r4"
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
-
-EXTRA_OECONF = " --with-system-ffmpeg "
-
-# We do this because the install program is called with -s which causes it to
-# call "strip" and it then mangles cross compiled stuff..
-PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
-
-# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
-CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
-
-
-SRC_URI[md5sum] = "a7177f85c87d404a3c0d511b835129d1"
-SRC_URI[sha256sum] = "d9e056793d05bf0b6f4989b27d3107c2f223a14205ee54be403bbe52945c8853"
-- 
1.7.2.3



