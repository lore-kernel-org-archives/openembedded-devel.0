Return-Path: <philip.balister@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id E00126D582
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 00:14:38 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id e9so1718503qcy.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 16:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E40JiCSnDQVyscsJgVJtbpTBJc+2IIaSbdz6wqthAnA=;
	b=A8h4pLbqkUkLW1aZ/tIRNxWavJbnQBpMdySWTaXkBYsrXwup8694opdoma9BtATac0
	5/Z2sTe7d9Dr9pIgA7TBc7DPCXHDdBPvJC4J9Ha3VYQIRkqRybwCqmOHwcHl52FI9ogp
	6fEBXcPkgM5Oa6H32WIWwzuP1fCz695jX90oeX0b6VJuwftrTkP7j0veXDbZzpd+0+vC
	O1PMc+dJ1BEodOoD/4rV/dGLJUgEnDnm7EEKxPjDIlxJ3NxNdJ4GyKWFqrjC6zSycrgM
	Rb74OUKgysTLxLTrP9is6eXkEutmYbc7FPexz9PI5RYu/CSr+XMwET6K9U0760vnvOKo
	XkLg==
X-Received: by 10.49.117.196 with SMTP id kg4mr6422579qeb.21.1384474480677;
	Thu, 14 Nov 2013 16:14:40 -0800 (PST)
Received: from localhost.localdomain
	(pool-108-44-82-190.ronkva.east.verizon.net. [108.44.82.190])
	by mx.google.com with ESMTPSA id a9sm834102qed.6.2013.11.14.16.14.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2013 16:14:40 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2013 19:14:12 -0500
Message-Id: <1384474452-14955-2-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1384474452-14955-1-git-send-email-philip@balister.org>
References: <1384474452-14955-1-git-send-email-philip@balister.org>
Subject: [meta-oe][PATCH 2/2] gnuradio : Remove recipes. Now lives in meta-sdr.
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
X-List-Received-Date: Fri, 15 Nov 2013 00:14:39 -0000

https://github.com/balister/meta-sdr

Signed-off-by: Philip Balister <philip@balister.org>
---
 ...n-t-add-usr-include-and-usr-lib-to-config.patch |  58 ------------
 .../gnuradio/0001-gr-trellis-Kill-docs-hard.patch  |  38 --------
 .../recipes-connectivity/gnuradio/gnuradio_git.bb  | 100 ---------------------
 3 files changed, 196 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-buildsys-don-t-add-usr-include-and-usr-lib-to-config.patch
 delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-Kill-docs-hard.patch
 delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb

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
diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-Kill-docs-hard.patch b/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-Kill-docs-hard.patch
deleted file mode 100644
index 38c3a10..0000000
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-gr-trellis-Kill-docs-hard.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 473342055e423384e2b17cc0957613299382fb79 Mon Sep 17 00:00:00 2001
-From: Philip Balister <philip@balister.org>
-Date: Mon, 17 Jun 2013 10:58:29 -0400
-Subject: [PATCH] gr-trellis : Kill docs hard.
-
-Signed-off-by: Philip Balister <philip@balister.org>
----
- gr-trellis/CMakeLists.txt | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/gr-trellis/CMakeLists.txt b/gr-trellis/CMakeLists.txt
-index 16a3e7c..95e1420 100644
---- a/gr-trellis/CMakeLists.txt
-+++ b/gr-trellis/CMakeLists.txt
-@@ -50,12 +50,6 @@ if(ENABLE_GR_TRELLIS)
- include(GrPackage)
- CPACK_SET(CPACK_COMPONENT_GROUP_TRELLIS_DESCRIPTION "GNU Radio Trellis Blocks")
- 
--CPACK_COMPONENT("trellis_docs"
--    GROUP        "Trellis"
--    DISPLAY_NAME "Documentation"
--    DESCRIPTION  "Doxygen HTML and XML"
--)
--
- CPACK_COMPONENT("trellis_runtime"
-     GROUP        "Trellis"
-     DISPLAY_NAME "Runtime"
-@@ -95,7 +89,6 @@ CPACK_COMPONENT("trellis_swig"
- # Add subdirectories
- ########################################################################
- add_subdirectory(src/lib)
--add_subdirectory(doc)
- if(ENABLE_PYTHON)
-     add_subdirectory(grc)
-     add_subdirectory(src/python)
--- 
-1.7.11.7
-
diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb b/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
deleted file mode 100644
index 1a78575..0000000
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb
+++ /dev/null
@@ -1,100 +0,0 @@
-DESCRIPTION = "GNU Radio"
-URL = "http://gnuradio.org"
-SECTION =  "apps"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "gsl fftwf python alsa-lib boost cppunit \
-           swig-native python-numpy python-cheetah-native orc"
-
-#Available PACKAGECONFIG options are qt grc uhd
-PACKAGECONFIG ??= "qtgui grc uhd"
-
-PACKAGECONFIG[uhd] = "-DENABLE_GR_UHD=ON,-DENABLE_GR_UHD=OFF,uhd,"
-PACKAGECONFIG[grc] = "-DENABLE_GRC=ON,-DENABLE_GRC=OFF,python-pygtk python-cheetah, "
-
-PACKAGECONFIG[qtgui] = "-DENABLE_GR_QTGUI=ON,-DENABLE_GR_QTGUI=OFF,qt4-x11-free qwt, "
-
-
-inherit distutils-base cmake pkgconfig
-
-export BUILD_SYS
-export HOST_SYS="${MULTIMACH_TARGET_SYS}"
-
-RDEPENDS_${PN} = "python-core python-audio python-threading python-codecs \
-                  python-lang python-textutils python-shell python-pickle \
-                  python-compiler python-pkgutil python-pydoc python-mmap \
-                  python-netclient python-difflib \
-                  python-pprint python-numpy  \
-"
-RDEPENDS_${PN}-grc = "python-pygtk python-lxml python-cheetah python-netserver"
-
-C_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-do_configure_prepend() {
-    ${BUILD_CC} ${S}/gr-vocoder/lib/codec2/generate_codebook.c -o ${S}/gr-vocoder/lib/generate_codebook -lm
-    echo "ADD_EXECUTABLE(generate_codebook IMPORTED)" >${S}/gr-vocoder/lib/generate_codebook.txt
-    echo "SET_PROPERTY(TARGET generate_codebook APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)" >>${S}/gr-vocoder/lib/generate_codebook.txt
-    echo 'SET_TARGET_PROPERTIES(generate_codebook PROPERTIES IMPORTED_LOCATION_RELEASE "${S}/gr-vocoder/lib/generate_codebook")' >>${S}/gr-vocoder/lib/generate_codebook.txt
-}
-
-do_compile_prepend() {
-    cp ${S}/gr-vocoder/lib/codec2/defines.h ${OECMAKE_BUILDPATH}/gr-vocoder/lib/codec2
-}
-
-PACKAGES += " \
-    ${PN}-grc \
-    ${PN}-examples \
-"
-
-FILES_${PN}-grc = "${datadir}/gnuradio/grc"
-FILES_${PN}-examples = "${datadir}/gnuradio/examples"
-
-FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/gnuradio"
-FILES_${PN} += "${datadir}/gnuradio/modtool"
-# The following needs fixing upstream
-FILES_${PN} += "${prefix}/etc/gnuradio"
-
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
-                    ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
-                    ${datadir}/gnuradio/examples/*/.debug \
-"
-
-PV = "3.6.5"
-
-FILESPATHPKG_prepend = "gnuradio-git:"
-
-SRCREV = "a7b3a9339106aaba72195b693dfeaa98f194e0d5"
-
-# Make it easy to test against developer repos and branches
-GIT_REPO = "gnuradio.git"
-GIT_BRANCH = "master"
-
-SRC_URI = "git://git.gnuradio.org/${GIT_REPO};branch=${GIT_BRANCH} \
-           file://0001-gr-trellis-Kill-docs-hard.patch \
-"
-
-S="${WORKDIR}/git"
-
-OECMAKE_BUILDPATH = "${S}/build"
-OECMAKE_SOURCEPATH = "${S}"
-
-EXTRA_OECMAKE = "-DENABLE_GR_ATSC=FALSE \
-                 -DENABLE_GR_FCD=OFF \
-                 -DENABLE_GR_WXGUI=OFF \
-                 -DENABLE_GR_VIDEO_SDL=OFF \
-                 -DENABLE_SPHINX=OFF -DENABLE_DOXYGEN=OFF \
-                 -DIMPORT_EXECUTABLES=${S}/gr-vocoder/lib/generate_codebook.txt \
-                 -DQT_HEADERS_DIR=${STAGING_INCDIR}/qt4 \
-                 -DQT_QTCORE_INCLUDE_DIR=${STAGING_INCDIR}/qt4/QtCore \
-                 -DQT_LIBRARY_DIR=${STAGING_LIBDIR} \
-                 -DQT_QTCORE_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtCore.so \
-                 -DQT_QTGUI_LIBRARY_RELEASE=${STAGING_LIBDIR}/libQtGui.so \
-                 ${@base_contains('TUNE_FEATURES', 'neon', \
-                     '-Dhave_mfpu_neon=1', '-Dhave_mfpu_neon=0', d)} \
-"
-
-inherit distutils-base cmake pkgconfig
-
-EXTRA_OEMAKE = "-C ${OECMAKE_BUILDPATH}"
-
-- 
1.8.3.1


