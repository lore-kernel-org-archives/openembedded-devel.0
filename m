Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3B81C6BDA7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:14 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so343366eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=NxtKTC/Bpuq7ECw98P/mDE4RGH1w1yUdAvpVUdfHhKE=;
	b=Sl01aph7/iCdowSLwPZG0lLhU3FSt6vuHHpD1uG88BOArXge6JET5/cw/WpN3x6ZG3
	6FHZdIC4exa33QHLMUrsqSaFt3KGAi/lzPWGlJONFrMFWFYDkzdCH9YUnD5mbTrowpRs
	o8amvFOk1GEEKLMd8N7C/Y/lXZ21Vy8iX1381RqB78dMoW37V/H/KacRIMjF80xDIKXu
	E1qH2XC/YYq784rTVNFl14n4/m75aRzj/YppJkALEWNcFhg4Kr/6AfY0MPRN/rSauBZx
	WRgD2D93Ll3c3c6aj8q7ykwsKZ3pbnuiNYCXS23+ke4cEWZCETG5puMum4ZsA0TEApEs
	MiRg==
X-Received: by 10.15.100.198 with SMTP id bn46mr5314701eeb.11.1377791474616;
	Thu, 29 Aug 2013 08:51:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm47155975eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:12 +0200
Message-Id: <1a1a019bfa724b5642c98eb59d37da64b30deb24.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 19/66] gnuradio: Add PACKAGECONFIG for jack and portaudio
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:14 -0000

* remove unused
  0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...n-t-add-usr-include-and-usr-lib-to-config.patch | 58 ----------------------
 .../gnuradio/allow-to-disable-jack-portaudio.patch | 34 +++++++++++++
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  |  4 ++
 3 files changed, 38 insertions(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
 create mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/allow-to-disable-jack-portaudio.patch

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch b/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
deleted file mode 100644
index 7caaf51..0000000
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From a130153ae84d8bb5914879cef94df09f06825c10 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Sat, 18 Jun 2011 11:25:36 +0200
-Subject: [PATCH] buildsys: don't add /usr/include and /usr/lib to configure tests for libusb
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- config/usrp_libusb.m4 |   13 -------------
- 1 files changed, 0 insertions(+), 13 deletions(-)
-
-diff --git a/config/usrp_libusb.m4 b/config/usrp_libusb.m4
-index cc3410f..b421820 100644
---- a/config/usrp_libusb.m4
-+++ b/config/usrp_libusb.m4
-@@ -117,10 +117,6 @@ AC_DEFUN([USRP_LIBUSB], [
-       dnl configured to find this header.
-       AC_LANG_PUSH(C)
-       save_CPPFLAGS="$CPPFLAGS"
--      if test x$USB_INCLUDEDIR != x; then
--        USB_INCLUDES="-I$USB_INCLUDEDIR"
--        CPPFLAGS="$USB_INCLUDES"
--      fi
-       AC_MSG_CHECKING([$libusb_name for header $usb_header])
-       AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
-         #include "$usb_header"
-@@ -172,9 +168,6 @@ AC_DEFUN([USRP_LIBUSB], [
-             *)
-               AC_LANG_PUSH(C)
-               save_CPPFLAGS="$CPPFLAGS"
--              if test x$USB_INCLUDEDIR != x; then
--                CPPFLAGS="$USB_INCLUDES"
--              fi
-               save_LIBS="$LIBS"
-               LIBS="$USB_LIBS"
-               AC_MSG_CHECKING([$libusb_name for symbol usb_debug in library $usb_lib_name])
-@@ -217,9 +210,6 @@ AC_DEFUN([USRP_LIBUSB], [
-     dnl final error checking, mostly to create #define's
-     AC_LANG_PUSH(C)
-     save_CPPFLAGS="$CPPFLAGS"
--    if test x$USB_INCLUDEDIR != x; then
--      CPPFLAGS="$USB_INCLUDES"
--    fi
-     dnl Check for the header.
-     AC_CHECK_HEADERS([$usb_header], [], [libusbok=no])
-     CPPFLAGS="$save_CPPFLAGS"
-@@ -231,9 +221,6 @@ AC_DEFUN([USRP_LIBUSB], [
-       dnl check for the library (again)
-       AC_LANG_PUSH(C)
-       save_CPPFLAGS="$CPPFLAGS"
--      if test x$USB_INCLUDEDIR != x; then
--        CPPFLAGS="$USB_INCLUDES"
--      fi
-       save_LIBS="$LIBS"
-       LIBS="$USB_LIBS"
-       AC_CHECK_LIB([$usb_lib_name], [$usb_lib_func], [], [
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/allow-to-disable-jack-portaudio.patch b/meta-oe/recipes-connectivity/gnuradio/gnuradio/allow-to-disable-jack-portaudio.patch
new file mode 100644
index 0000000..58c4485
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio/allow-to-disable-jack-portaudio.patch
@@ -0,0 +1,34 @@
+--- ./gr-audio/lib/CMakeLists.txt.orig	2013-08-25 21:30:42.279818436 +0200
++++ ./gr-audio/lib/CMakeLists.txt	2013-08-25 21:30:27.263817898 +0200
+@@ -75,6 +75,7 @@
+ ########################################################################
+ ## Jack Support
+ ########################################################################
++if(ENABLE_JACK)
+ find_package(Jack)
+ 
+ if(JACK_FOUND)
+@@ -90,6 +91,7 @@
+     list(APPEND gr_audio_confs ${CMAKE_CURRENT_SOURCE_DIR}/jack/gr-audio-jack.conf)
+ 
+ endif(JACK_FOUND)
++endif(ENABLE_JACK)
+ 
+ ########################################################################
+ ## OSX Support
+@@ -117,6 +119,7 @@
+ ########################################################################
+ ## PortAudio Support
+ ########################################################################
++IF(ENABLE_PORTAUDIO)
+ find_package(Portaudio)
+ 
+ if(PORTAUDIO_FOUND)
+@@ -132,6 +135,7 @@
+     list(APPEND gr_audio_confs ${CMAKE_CURRENT_SOURCE_DIR}/portaudio/gr-audio-portaudio.conf)
+ 
+ endif(PORTAUDIO_FOUND)
++endif(ENABLE_PORTAUDIO)
+ 
+ ########################################################################
+ ## Windows Support
diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
index b0fc630..6cec02b 100644
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
@@ -15,6 +15,9 @@ PACKAGECONFIG[grc] = "-DENABLE_GRC=ON,-DENABLE_GRC=OFF,python-pygtk python-cheet
 
 PACKAGECONFIG[qtgui] = "-DENABLE_GR_QTGUI=ON,-DENABLE_GR_QTGUI=OFF,qt4-x11-free qwt, "
 
+PACKAGECONFIG[portaudio] = "-DENABLE_PORTAUDIO=ON,-DENABLE_PORTAUDIO=OFF,portaudio-v19, "
+PACKAGECONFIG[jack] = "-DENABLE_JACK=ON,-DENABLE_JACK=OFF,jack, "
+
 
 inherit distutils-base cmake pkgconfig
 
@@ -72,6 +75,7 @@ GIT_BRANCH = "master"
 
 SRC_URI = "git://git.gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH};protocol=git \
            file://0001-gr-trellis-Kill-docs-hard.patch \
+           file://allow-to-disable-jack-portaudio.patch \
 "
 
 S="${WORKDIR}/git"
-- 
1.8.3.2


