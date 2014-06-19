Return-Path: <koen.kooi@linaro.org>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A8C8B70197
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 11:19:44 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x13so2103624wgg.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 04:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2oWm9qJJEIRHk3RGdwN/ZiYUk+/I+SlGCReXP4zqJSg=;
	b=KrEl1REU85fnaF/l2p5HJIe1/Z6W1sY3l+OkzjCmvrk7zYe+gWnllK/NSgI47uFbku
	ghA//OLg9vOsSLAF/1++DI55qJqMkC0btTi5cmYrexN6/DtNV/oeHOXa01FkcbI/Z4Fm
	OwQZlbgjoaU+WmKHW4B/lLmQ0Dj7/GIVNN/doLtV/BqBrzPMeCIckkAwsXEhVliIICkD
	eS9JIAlq7376AyXkH2Ibv9THkie+rh/V6OBsVaOg6DzGHc9ZqwZLOuyHlflzg/GkIVov
	SDbBjKx6YBB0F1vppckPrHVZL+pggD2BKhmPWV5yE4Az/wk82KoRly0O4mKE9SK4LR2g
	UgFg==
X-Gm-Message-State: ALoCoQlow5Ijtg+TWWJ2/8N+bT4BEnQnJW6noUnoG9Vk3woTmRr1xg0pzdD9i0JpxPyczJB7DR+I
X-Received: by 10.194.189.81 with SMTP id gg17mr4184480wjc.107.1403176785738; 
	Thu, 19 Jun 2014 04:19:45 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by mx.google.com with ESMTPSA id ub8sm10675699wib.0.2014.06.19.04.19.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 04:19:45 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 13:19:42 +0200
Message-Id: <1403176782-30997-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] libsdl-image: use pkg-config for libSDL detection
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
X-List-Received-Date: Thu, 19 Jun 2014 11:19:48 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 ...igure-use-pkg-config-for-libSDL-detection.patch | 38 ++++++++++++++++++++++
 .../libsdl-image/libsdl-image_1.2.12.bb            |  6 ++--
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/libsdl-image/libsdl-image/0001-configure-use-pkg-config-for-libSDL-detection.patch

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image/0001-configure-use-pkg-config-for-libSDL-detection.patch b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image/0001-configure-use-pkg-config-for-libSDL-detection.patch
new file mode 100644
index 0000000..192ee16
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image/0001-configure-use-pkg-config-for-libSDL-detection.patch
@@ -0,0 +1,38 @@
+From 644ec4d18eb83a0ca826001ebfb7f4782cb8db0f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Thu, 19 Jun 2014 13:16:21 +0200
+Subject: [PATCH] configure: use pkg-config for libSDL detection
+
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+---
+ configure.in | 14 ++++++--------
+ 1 file changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index e7010e9..cbb536d 100644
+--- a/configure.in
++++ b/configure.in
+@@ -113,14 +113,12 @@ find_lib()
+ }
+ 
+ dnl Check for SDL
+-SDL_VERSION=1.2.10
+-AC_SUBST(SDL_VERSION)
+-AM_PATH_SDL($SDL_VERSION,
+-            :,
+-           AC_MSG_ERROR([*** SDL version $SDL_VERSION not found!])
+-)
+-CFLAGS="$CFLAGS $SDL_CFLAGS"
+-LIBS="$LIBS $SDL_LIBS"
++PKG_CHECK_MODULES([LIBSDL], [sdl > 1.2.10], [
++  CFLAGS="$CFLAGS $LIBSDL_CFLAGS"
++  LIBS="$LIBS $LIBSDL_LIBS"
++], [
++  AC_MSG_ERROR([$LIBXML_PKG_ERRORS])
++])
+ saved_LIBS="$LIBS"
+ 
+ dnl Check command-line options
+-- 
+1.9.3
+
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
index 4c5fe29..bc49ff8 100644
--- a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
+++ b/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=613734b7586e1580ef944961c6d62227"
 
 DEPENDS = "tiff zlib libpng jpeg virtual/libsdl"
 
-SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz"
+SRC_URI = "http://www.libsdl.org/projects/SDL_image/release/SDL_image-${PV}.tar.gz \
+           file://0001-configure-use-pkg-config-for-libSDL-detection.patch \
+          "
 SRC_URI[md5sum] = "a0f9098ebe5400f0bdc9b62e60797ecb"
 SRC_URI[sha256sum] = "0b90722984561004de84847744d566809dbb9daf732a9e503b91a1b5a84e5699"
 
@@ -14,8 +16,6 @@ S = "${WORKDIR}/SDL_image-${PV}"
 
 inherit autotools
 
-export SDL_CONFIG = "${STAGING_BINDIR_CROSS}/sdl-config"
-
 # Disable the run-time loading of the libs and bring back the soname dependencies.
 EXTRA_OECONF += "--disable-jpg-shared --disable-png-shared -disable-tif-shared"
 
-- 
1.9.3


