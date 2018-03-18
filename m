Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 358BB788E0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 19:08:51 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id r82so1038849wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 12:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Xv9fOmEf2jjOKK6Z4SfU28gng9r30dKzAQDhgo/KuYM=;
	b=utg5j1eLsbwyC843jAN1mUK83o1NJPqZJXomqecZnNvfCdyy8N6mXjw1MTH+h0lELe
	oS/RFw9Ja6375VBFUx1CG8WjqRFE3oBxzzEKSswz7xjqvhay1i5b6GWffXyex0TY0Lk2
	XSNFn6c6XITDfeoizVET4KRN8A/jx6mzi0i4PKTk6myivNAnQ67HoubWXNnw6LtoKVVX
	h1P7TfseaKqTVHYLfy2m8AY4RPCqd7iq16O0g/IyVfAoZdA0lb9VIdkc+idE0LBsuzcm
	GGKqTnVfXvhKzJ/0mSPLb+Wy8zClp0zpMnZoiau8B2zFU2qFD0tBoOKfDBNjM7MwZoMq
	epOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Xv9fOmEf2jjOKK6Z4SfU28gng9r30dKzAQDhgo/KuYM=;
	b=bgqBzzocNylhhxjYjBGgNfDzXTkOLzqrm8197BBwOST1gpMlTYmkVMRGJZfBlO/GZ3
	yC+0/VW5zvkRdUBRfoF8kqBHjJdelcZHXZvwBrS1/hV14A5cTGv9qkZpebJDbTWE0+j3
	RsdD/nToB9QkZ1g7gjTz5k1IB3YLaG3de+EnAjaqCOapTwtxBy60r3/YFOP4g7CXwGXs
	eQj+cXEKudWqhefQNOs7ZrsWbuFyqFdfppx4BC497i+x7SSjPgnDAt3QaYqTcp7Gdthf
	05CQm9vvorCbU3+T9gpxoPj62bI1NbS8k/zl6lZxuX1N0xd1Fri4Lo+HnlEN/7wY+2w6
	fksw==
X-Gm-Message-State: AElRT7EDKpgwXgqIIw7FqOZd7FB3nFMyvIGqS36Of95cDsxKE6rFiNHG
	C3y5NAiV6TVByjZw8toF3Tn3Gg==
X-Google-Smtp-Source: AG47ELulHg5sPEAoQxvYJqlFTAshsLx7Ra2yG17a6AGzs5wBdC4/flOd9yGXaNnsmmK1kV3qqLupPw==
X-Received: by 10.28.58.144 with SMTP id h138mr6420605wma.42.1521400132513;
	Sun, 18 Mar 2018 12:08:52 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b78:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	b8sm11614531wrf.29.2018.03.18.12.08.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Mar 2018 12:08:52 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 20:08:33 +0100
Message-Id: <20180318190833.1393-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180318190833.1393-1-schnitzeltony@gmail.com>
References: <20180318190833.1393-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] poppler: update 0.57.0 -> 0.62.0
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
X-List-Received-Date: Sun, 18 Mar 2018 19:08:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* poppler moved from autotools to cmake
* qt4 backend was removed
* build tested with all and none in packageconfig

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...0001-Do-not-overwrite-all-our-build-flags.patch | 36 +++++++++
 ...dd-manadatory-options-to-find-qt4-qt5-moc.patch | 91 ----------------------
 .../0002-fix-gcc-6-math-ambiguous-errors.patch     | 11 ---
 meta-oe/recipes-support/poppler/poppler_0.57.0.bb  | 55 -------------
 meta-oe/recipes-support/poppler/poppler_0.62.0.bb  | 55 +++++++++++++
 5 files changed, 91 insertions(+), 157 deletions(-)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch
 delete mode 100644 meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch
 delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.57.0.bb
 create mode 100644 meta-oe/recipes-support/poppler/poppler_0.62.0.bb

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
new file mode 100644
index 000000000..5b66a8a9c
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
@@ -0,0 +1,36 @@
+From b6fc6c36d359a50503138cd87d7147faf6dff893 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 17 Mar 2018 20:52:10 +0100
+Subject: [PATCH] Do not overwrite all our build flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ cmake/modules/PopplerMacros.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cmake/modules/PopplerMacros.cmake b/cmake/modules/PopplerMacros.cmake
+index ccb2790..f29481e 100644
+--- a/cmake/modules/PopplerMacros.cmake
++++ b/cmake/modules/PopplerMacros.cmake
+@@ -98,6 +98,7 @@ if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
+   set(CMAKE_BUILD_TYPE RelWithDebInfo)
+ endif(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
+ 
++if(false)
+ if(CMAKE_COMPILER_IS_GNUCXX)
+   # set the default compile warnings
+   set(_warn "-Wall -Wextra -Wpedantic")
+@@ -159,4 +160,5 @@ if(CMAKE_C_COMPILER MATCHES "icc")
+   set(CMAKE_C_FLAGS_DEBUG            "-O2 -g -Ob0 -noalign ${_save_cflags}")
+   set(CMAKE_C_FLAGS_DEBUGFULL        "-g -Ob0 -noalign ${_save_cflags}")
+ endif(CMAKE_C_COMPILER MATCHES "icc")
++endif(false)
+ 
+-- 
+2.14.3
+
diff --git a/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch b/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch
deleted file mode 100644
index 4e80d240f..000000000
--- a/meta-oe/recipes-support/poppler/poppler/0001-add-manadatory-options-to-find-qt4-qt5-moc.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 91b6275f0e91c25beb040b4ef9484053ae305d86 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 26 May 2015 12:45:47 +0200
-Subject: [PATCH] add manadatory options to find qt4/qt5 moc
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 55 ++++++++-----------------------------------------------
- 1 file changed, 8 insertions(+), 47 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c4cfc2c..8e961c7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -712,25 +712,10 @@ AC_SUBST(POPPLER_QT4_LIBS)
- AC_SUBST(POPPLER_QT4_TEST_LIBS)
- 
- if test x$enable_poppler_qt4 = xyes; then
--  AC_CHECK_TOOL(MOCQT4, moc)
--  AC_MSG_CHECKING([for Qt4 moc])
--  mocversion=`$MOCQT4 -v 2>&1`
--  mocversiongrep=`echo $mocversion | grep "Qt 4"`
--  if test x"$mocversiongrep" != x"$mocversion"; then
--    AC_MSG_RESULT([no])
--    # moc was not the qt4 one, try with moc-qt4
--    AC_CHECK_TOOL(MOCQT42, moc-qt4)
--    AC_MSG_CHECKING([for Qt4 moc-qt4])
--    mocversion=`$MOCQT42 -v 2>&1`
--    mocversiongrep=`echo $mocversion | grep "Qt 4"`
--    if test x"$mocversiongrep" != x"$mocversion"; then
--      # no valid moc found
--      enable_poppler_qt4=no;
--      MOCQT4="not found"
--    else
--      MOCQT4=$MOCQT42
--    fi
--  fi
-+  AC_ARG_WITH([moc-qt4],
-+              AS_HELP_STRING([--with-moc-qt4], [Set location of qt4 moc]),
-+              [MOCQT4=$withval]
-+  )
-   AC_SUBST(MOCQT4)
-   AC_MSG_RESULT([$MOCQT4])
- fi
-@@ -769,34 +754,10 @@ AC_SUBST(POPPLER_QT5_LIBS)
- AC_SUBST(POPPLER_QT5_TEST_LIBS)
- 
- if test x$enable_poppler_qt5 = xyes; then
--  AC_CHECK_TOOL(MOCQT5, moc)
--  AC_MSG_CHECKING([for Qt5 moc])
--  mocversion=`$MOCQT5 -v 2>&1`
--  mocversiongrep=`echo $mocversion | grep -E "Qt 5|moc 5"`
--  if test x"$mocversiongrep" != x"$mocversion"; then
--    AC_MSG_RESULT([no])
--    # moc was not the qt5 one, try with moc-qt5
--    AC_CHECK_TOOL(MOCQT52, moc-qt5)
--    AC_MSG_CHECKING([for Qt5 moc-qt5])
--    mocversion=`$MOCQT52 -v 2>&1`
--    mocversiongrep=`echo $mocversion | grep -E "Qt 5|moc-qt5 5|moc 5"`
--    if test x"$mocversiongrep" != x"$mocversion"; then
--      AC_CHECK_TOOL(QTCHOOSER, qtchooser)
--      AC_MSG_CHECKING([for qtchooser])
--      qt5tooldir=`QT_SELECT=qt5 qtchooser -print-env | grep QTTOOLDIR | cut -d '=' -f 2 | cut -d \" -f 2`
--      mocversion=`$qt5tooldir/moc -v 2>&1`
--      mocversiongrep=`echo $mocversion | grep -E "Qt 5|moc 5"`
--      if test x"$mocversiongrep" != x"$mocversion"; then
--        # no valid moc found
--        enable_poppler_qt5=no;
--        MOCQT5="not found"
--      else
--        MOCQT5=$qt5tooldir/moc
--      fi
--    else
--      MOCQT5=$MOCQT52
--    fi
--  fi
-+  AC_ARG_WITH([moc-qt5],
-+              AS_HELP_STRING([--with-moc-qt5], [Set location of qt5 moc]),
-+              [MOCQT5=$withval]
-+  )
-   AC_SUBST(MOCQT5)
-   AC_MSG_RESULT([$MOCQT5])
- fi
--- 
-2.5.5
-
diff --git a/meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch b/meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch
deleted file mode 100644
index 406009f4f..000000000
--- a/meta-oe/recipes-support/poppler/poppler/0002-fix-gcc-6-math-ambiguous-errors.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- poppler-0.45.0/poppler/CairoOutputDev.cc.orig	2016-06-17 14:23:35.399083929 -0400
-+++ poppler-0.45.0/poppler/CairoOutputDev.cc	2016-06-17 14:36:53.351097825 -0400
-@@ -42,7 +42,7 @@
- #endif
- 
- #include <string.h>
--#include <math.h>
-+#include <cmath>
- #include <assert.h>
- #include <cairo.h>
- 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.57.0.bb b/meta-oe/recipes-support/poppler/poppler_0.57.0.bb
deleted file mode 100644
index 63b77aafe..000000000
--- a/meta-oe/recipes-support/poppler/poppler_0.57.0.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "Poppler is a PDF rendering library based on the xpdf-3.0 code base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = " \
-    http://poppler.freedesktop.org/${BP}.tar.xz \
-    file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
-    file://0002-fix-gcc-6-math-ambiguous-errors.patch \
-"
-SRC_URI[md5sum] = "bc5a191741604552c90d484103229374"
-SRC_URI[sha256sum] = "0ea37de71b7db78212ebc79df59f99b66409a29c2eac4d882dae9f2397fe44d8"
-
-DEPENDS = "fontconfig zlib cairo lcms"
-
-inherit autotools pkgconfig gtk-doc gobject-introspection
-
-PACKAGECONFIG ??= "jpeg openjpeg png tiff nss ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
-PACKAGECONFIG[jpeg] = "--enable-dctdecoder=libjpeg,--enable-dctdecoder=none,jpeg"
-PACKAGECONFIG[png] = "--enable-libpng,--disable-libpng,libpng"
-PACKAGECONFIG[tiff] = "--enable-libtiff,--disable-libtiff,tiff"
-PACKAGECONFIG[curl] = "--enable-libcurl,--disable-libcurl,curl"
-PACKAGECONFIG[openjpeg] = "--enable-libopenjpeg=openjpeg2,--disable-libopenjpeg,openjpeg"
-PACKAGECONFIG[qt5] = "--enable-poppler-qt5 --with-moc-qt5=${STAGING_BINDIR_NATIVE}/qt5/moc,--disable-poppler-qt5,qtbase qttools-native"
-PACKAGECONFIG[qt4e] = "--enable-poppler-qt4 --with-moc-qt4=${STAGING_BINDIR_NATIVE}/moc4,--disable-poppler-qt4,qt4-embedded"
-PACKAGECONFIG[nss] = "--enable-libnss,--disable-libnss,nss"
-
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-
-EXTRA_OECONF = "\
-    --enable-xpdf-headers \
-    --disable-gtk-test \
-    --enable-zlib \
-"
-
-do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/poppler/.libs"
-}
-
-# Adjust library names when building for QT4e
-QT4E_PATCHES = "${@bb.utils.contains('PACKAGECONFIG', 'qt4e', 'file://fix-qt4e-library-dependencies.patch', '', d)}"
-SRC_URI_append = "${QT4E_PATCHES}"
-
-# check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
-def get_poppler_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU') in [ 'soft' ]:
-        return "--enable-fixedpoint"
-    return ""
-
-EXTRA_OECONF += "${@get_poppler_fpu_setting(bb, d)}"
-
-PACKAGES =+ "libpoppler libpoppler-glib"
-FILES_libpoppler = "${libdir}/libpoppler.so.*"
-FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
-
-RDEPENDS_libpoppler = "poppler-data"
diff --git a/meta-oe/recipes-support/poppler/poppler_0.62.0.bb b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
new file mode 100644
index 000000000..696621938
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler_0.62.0.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Poppler is a PDF rendering library based on the xpdf-3.0 code base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+SRC_URI = " \
+    http://poppler.freedesktop.org/${BP}.tar.xz \
+    file://0001-Do-not-overwrite-all-our-build-flags.patch \
+"
+SRC_URI[md5sum] = "42b801f2defaccb6b6cf1bf783ee1552"
+SRC_URI[sha256sum] = "5b9a73dfd4d6f61d165ada1e4f0abd2d420494bf9d0b1c15d0db3f7b83a729c6"
+
+DEPENDS = "fontconfig zlib cairo lcms"
+
+inherit cmake pkgconfig gobject-introspection
+
+PACKAGECONFIG ??= "jpeg openjpeg png tiff nss ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON -DENABLE_DCTDECODER=libjpeg,-DWITH_JPEG=OFF -DENABLE_DCTDECODER=none,jpeg"
+PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng"
+PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff"
+PACKAGECONFIG[curl] = "-DENABLE_LIBCURL=ON,-DENABLE_LIBCURL=OFF,curl"
+PACKAGECONFIG[openjpeg] = "-DENABLE_LIBOPENJPEG=openjpeg2,-DENABLE_LIBOPENJPEG=none,openjpeg"
+PACKAGECONFIG[qt5] = "-DENABLE_QT5=ON,-DENABLE_QT5=OFF,qtbase qttools-native"
+PACKAGECONFIG[nss] = "-DWITH_NSS3=ON,-DWITH_NSS3=OFF,nss"
+
+# surprise - did not expect this to work :)
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
+
+SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
+
+EXTRA_OECMAKE += " \
+    -DENABLE_XPDF_HEADERS=ON \
+    -DBUILD_GTK_TESTS=OFF \
+    -DENABLE_ZLIB=ON \
+"
+
+do_configure_append() {
+    # poppler macro uses pkg-config to check for g-ir runtimes. Something
+    # makes them point to /usr/bin. Align them to sysroot - that's where the
+    # git-wrappers are:
+    sed -i 's: ${bindir}/g-ir: ${STAGING_BINDIR}/g-ir:' ${B}/build.ninja
+}
+
+# check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
+def get_poppler_fpu_setting(bb, d):
+    if d.getVar('TARGET_FPU') in [ 'soft' ]:
+        return "-DUSE_FIXEDPOINT=ON"
+    return ""
+
+EXTRA_OECMAKE += "${@get_poppler_fpu_setting(bb, d)}"
+
+PACKAGES =+ "libpoppler libpoppler-glib"
+FILES_libpoppler = "${libdir}/libpoppler.so.*"
+FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
+
+RDEPENDS_libpoppler = "poppler-data"
-- 
2.14.3


