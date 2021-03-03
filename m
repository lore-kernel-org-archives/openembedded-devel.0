Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web09.22.1614809398690150809
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 14:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ldrN2i40;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id i10so8139170pfk.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 14:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wRJKYw0eiTPfuL+1+tzJWRSsY05rVslb3C4/CZTo2ak=;
        b=ldrN2i40KFC43nWame2SMSiY6ryV7K8cE2BGD5ZvuYn0QZsiWFQPHAUVJNFwc0X/JC
         iTbHPiAyRENOGr00Z8uTuR2g4st4bORXW6sClBoXe4lMWFZFNwxo/j0qEE8U3yK/nfiT
         t0GPl32/S903kYj4KhnXmmhryPlslwMgsOoHxncq8EZeH5tpP/5dD6L0WtmSqYj4FpaZ
         FYqxyzeT7RlcYN1MBS5taDFnOzeFztRvkVRXw/mdHGz9JntMsriSm9YEDXJ5BmfGQcZl
         zN8zisWko4pEkLHc2QPikgB5a4Kyx5LyqaiIP5HjdrYYfjYXzoaWlFQbrBk55sqsjZKj
         FPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wRJKYw0eiTPfuL+1+tzJWRSsY05rVslb3C4/CZTo2ak=;
        b=WnJ5AMG2FQyrU3r52DHQEJFAEDaj2nxEnwLwCrsg3bsXBfxNxmkz32A657xXyQ31Ze
         FxDvWHlP9nMus+lIRuijNiogpLFttfy0eJVga8gPYjfyXbgqRQhxrKmrtt21Y2nVTQuS
         fyZ0Zc8/As/IlsarUiw89FaNK1qnKTnoSAYZ+wITt326cleYQG8v6EaUbeoJkHsGMoSA
         TWy149PXpk8RIoZD7iOY3B84sudpG1iV6Vsil6JxvUCZTwJqZ8mKZtDieNqMd+jLr/s/
         PnEr8qdNqrUUmTnE2ed73aZRA8rQPtovw8QxEwD/4wsg7afqyBP4ZAqnehMm+USH+gaQ
         hnsg==
X-Gm-Message-State: AOAM530sPSo5zOcUDfJzRY/oUBx27tEUDz7X8f6ytI0Q2sqlWLO+NTnt
	LODwCHv63ILKv4arMukOuXR396CiIsVjSA==
X-Google-Smtp-Source: ABdhPJxr+GNPP2BNcCZ3AbVoiqiZ4/qNf1OyeibueDJBwZCeQtYx2SWZsNQuQhixGY6qlu36eydozA==
X-Received: by 2002:a63:d710:: with SMTP id d16mr918253pgg.123.1614809397587;
        Wed, 03 Mar 2021 14:09:57 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id z28sm26018340pfr.38.2021.03.03.14.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 14:09:57 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Pascal Bach <pascal.bach@siemens.com>
Subject: [meta-oe][PATCH] libyui,libyui-ncurses: Upgrade to 4.0.0
Date: Wed,  3 Mar 2021 14:09:55 -0800
Message-Id: <20210303220955.2917679-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Pascal Bach <pascal.bach@siemens.com>
---
 ...-the-error-of-can-t-find-header-file.patch | 22 +++---------
 ...0003-Simplify-ncurses-finding-module.patch | 35 -------------------
 ...rses_2.55.0.bb => libyui-ncurses_4.0.0.bb} |  7 +---
 .../libyui/0001-Fix-build-with-clang.patch    | 10 +++---
 ...Use-relative-install-paths-for-CMake.patch |  8 ++---
 .../{libyui_3.10.0.bb => libyui_4.0.0.bb}     | 10 ++----
 6 files changed, 17 insertions(+), 75 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0003-Simplify-ncurses-finding-module.patch
 rename meta-oe/recipes-graphics/libyui/{libyui-ncurses_2.55.0.bb => libyui-ncurses_4.0.0.bb} (77%)
 rename meta-oe/recipes-graphics/libyui/{libyui_3.10.0.bb => libyui_4.0.0.bb} (86%)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Fix-the-error-of-can-t-find-header-file.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Fix-the-error-of-can-t-find-header-file.patch
index 045f3cafab..1affe84f6e 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Fix-the-error-of-can-t-find-header-file.patch
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-Fix-the-error-of-can-t-find-header-file.patch
@@ -16,8 +16,6 @@ Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
  src/ncursesw.h       | 4 ++--
  6 files changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/src/NCApplication.cc b/src/NCApplication.cc
-index 5bcf969..510f034 100644
 --- a/src/NCApplication.cc
 +++ b/src/NCApplication.cc
 @@ -23,7 +23,7 @@
@@ -29,8 +27,6 @@ index 5bcf969..510f034 100644
  
  #define  YUILogComponent "ncurses"
  #include <yui/YUILog.h>
-diff --git a/src/NCstyle.h b/src/NCstyle.h
-index a40d5a8..3657917 100644
 --- a/src/NCstyle.h
 +++ b/src/NCstyle.h
 @@ -25,7 +25,7 @@
@@ -42,8 +38,6 @@ index a40d5a8..3657917 100644
  
  #include <iosfwd>
  #include <string>
-diff --git a/src/NCurses.h b/src/NCurses.h
-index a07c6bf..d17d3c3 100644
 --- a/src/NCurses.h
 +++ b/src/NCurses.h
 @@ -34,7 +34,7 @@
@@ -55,8 +49,6 @@ index a07c6bf..d17d3c3 100644
  #include <wchar.h>
  
  #include "ncursesw.h"
-diff --git a/src/ncursesp.h b/src/ncursesp.h
-index d478347..2fcfea5 100644
 --- a/src/ncursesp.h
 +++ b/src/ncursesp.h
 @@ -28,7 +28,7 @@
@@ -68,8 +60,6 @@ index d478347..2fcfea5 100644
  
  class NCursesPanel : public NCursesWindow
  {
-diff --git a/src/ncursesw.cc b/src/ncursesw.cc
-index 3c771af..bb83210 100644
 --- a/src/ncursesw.cc
 +++ b/src/ncursesw.cc
 @@ -47,7 +47,7 @@
@@ -81,21 +71,19 @@ index 3c771af..bb83210 100644
  #undef line
  #undef columns
  
-diff --git a/src/ncursesw.h b/src/ncursesw.h
-index d25923a..c140d37 100644
 --- a/src/ncursesw.h
 +++ b/src/ncursesw.h
-@@ -27,8 +27,8 @@
+@@ -27,11 +27,11 @@
  
  #include <iosfwd>
  
 -#include <ncursesw/curses.h>
--#include <ncursesw/etip.h>
 +#include <curses.h>
+ #ifndef NCURSES_CXX_IMPEXP
+ #define NCURSES_CXX_IMPEXP NCURSES_EXPORT_GENERAL_IMPORT
+ #endif
+-#include <ncursesw/etip.h>
 +#include <etip.h>
  #include <cstdio>
  #include <cstdarg>
  #include <climits>
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0003-Simplify-ncurses-finding-module.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0003-Simplify-ncurses-finding-module.patch
deleted file mode 100644
index 2520ac46fe..0000000000
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0003-Simplify-ncurses-finding-module.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c2291fe28dc5682f81804941512431642975cf21 Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@siemens.com>
-Date: Mon, 29 Oct 2018 18:17:32 +0100
-Subject: [PATCH] Simplify ncurses finding module
-
-CMake will automatically look in the right locations, there is no need to
-re-implement the logic with a for loop and NO_DEFAULT_PATH.
-
-It is already done like this to file the headers.
-
-Upstream-Status: Submitted [https://github.com/libyui/libyui-ncurses/pull/73]
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
----
- cmake/Modules/FindCurses6.cmake | 8 +++-----
- 1 file changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/cmake/Modules/FindCurses6.cmake b/cmake/Modules/FindCurses6.cmake
-index 0bf02c3..e298d5d 100644
---- a/cmake/Modules/FindCurses6.cmake
-+++ b/cmake/Modules/FindCurses6.cmake
-@@ -5,11 +5,9 @@
- #  CURSES6_LIBRARIES - The libraries needed to use Curses6
- #  CURSES6_DEFINITIONS - Compiler switches required for using Curses6
- 
--FOREACH(path ${CMAKE_LIBRARY_PATH} /usr/${LIB_DIR})
--  FIND_LIBRARY(CURSES6_NCURSESW_LIBRARY NAMES ncursesw PATHS ${path}/ncurses6 ${path} NO_DEFAULT_PATH)
--  FIND_LIBRARY(CURSES6_PANELW_LIBRARY NAMES panelw PATHS ${path}/ncurses6 ${path} NO_DEFAULT_PATH)
--  FIND_LIBRARY(CURSES6_TINFO_LIBRARY NAMES tinfo PATHS ${path}/ncurses6 ${path} NO_DEFAULT_PATH)
--ENDFOREACH()
-+FIND_LIBRARY(CURSES6_NCURSESW_LIBRARY NAMES ncursesw PATH_SUFFIXES ncurses6)
-+FIND_LIBRARY(CURSES6_PANELW_LIBRARY NAMES panelw PATH_SUFFIXES ncurses6)
-+FIND_LIBRARY(CURSES6_TINFO_LIBRARY NAMES tinfo PATH_SUFFIXES ncurses6)
- 
- SET(CURSES6_LIBRARIES ${CURSES6_NCURSESW_LIBRARY} ${CURSES6_PANELW_LIBRARY})
- # tinfo is optional (in 12.1 is not there)
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
similarity index 77%
rename from meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
rename to meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
index 15c40ee31f..5efbb44901 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_2.55.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
@@ -5,12 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
 "
 
 SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
-           file://0003-Simplify-ncurses-finding-module.patch \
           "
 
 SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
 
-SRCREV = "e89fcc53c27c3a3bf559d43190289c3ce4f335b1"
+SRCREV = "37d3a1e815a47f536b4f694f139f279cc93a3854"
 
 S = "${WORKDIR}/git"
 
@@ -25,16 +24,12 @@ EXTRA_OECMAKE_append_toolchain-clang = " -DENABLE_WERROR=OFF"
 
 do_configure_prepend () {
     cd ${S}
-    git checkout bootstrap.sh
-    sed -i "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" bootstrap.sh
-    ./bootstrap.sh
     if [ -e ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so ]; then
         mkdir -p ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
         cp ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib/libyui.so* ${PKG_CONFIG_SYSROOT_DIR}${base_prefix}/usr/lib64/
     fi
     cd -
     sed -i -e "s#\${YPREFIX}#\${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${S}/CMakeLists.txt
-    sed -i -e "s#/usr#${PKG_CONFIG_SYSROOT_DIR}${base_prefix}&#" ${PKG_CONFIG_SYSROOT_DIR}${libdir}/cmake/libyui/LibyuiLibraryDepends-release.cmake
 }
 
 do_install_append () {
diff --git a/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-build-with-clang.patch b/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-build-with-clang.patch
index b03723ac04..d3463ca056 100644
--- a/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-build-with-clang.patch
+++ b/meta-oe/recipes-graphics/libyui/libyui/0001-Fix-build-with-clang.patch
@@ -329,10 +329,10 @@ Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/123]
  /**
 --- a/src/YMenuButton.h
 +++ b/src/YMenuButton.h
-@@ -29,7 +29,7 @@
+@@ -28,7 +28,7 @@
+ #include "YMenuWidget.h"
  #include "YMenuItem.h"
  
- class YMenuItem;
 -class YMenuButtonPrivate;
 +struct YMenuButtonPrivate;
  
@@ -428,7 +428,7 @@ Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/123]
  typedef YRadioButtonList::iterator		YRadioButtonListIterator;
 --- a/src/YRichText.h
 +++ b/src/YRichText.h
-@@ -30,7 +30,7 @@
+@@ -31,7 +31,7 @@
  #include "ImplPtr.h"
  
  
@@ -538,7 +538,7 @@ Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/123]
  /**
 --- a/src/YTimezoneSelector.cc
 +++ b/src/YTimezoneSelector.cc
-@@ -32,7 +32,7 @@
+@@ -34,7 +34,7 @@ using std::string;
  
  class YTimezoneSelectorPrivate
  {
@@ -560,7 +560,7 @@ Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/123]
  /**
 --- a/src/YUILog.h
 +++ b/src/YUILog.h
-@@ -64,7 +64,7 @@
+@@ -66,7 +66,7 @@ using std::endl;
  
  
  
diff --git a/meta-oe/recipes-graphics/libyui/libyui/0001-Use-relative-install-paths-for-CMake.patch b/meta-oe/recipes-graphics/libyui/libyui/0001-Use-relative-install-paths-for-CMake.patch
index 11a1678a4b..fc7f819d32 100644
--- a/meta-oe/recipes-graphics/libyui/libyui/0001-Use-relative-install-paths-for-CMake.patch
+++ b/meta-oe/recipes-graphics/libyui/libyui/0001-Use-relative-install-paths-for-CMake.patch
@@ -16,13 +16,13 @@ _PREFIX variants.
 Upstream-Status: Submitted [https://github.com/libyui/libyui/pull/140]
 Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
 ---
- buildtools/LibyuiCommon.cmake | 35 ++++++++++++++---------------------
+ legacy-buildtools/LibyuiCommon.cmake | 35 ++++++++++++++---------------------
  1 file changed, 14 insertions(+), 21 deletions(-)
 
-diff --git a/buildtools/LibyuiCommon.cmake b/buildtools/LibyuiCommon.cmake
+diff --git a/legacy-buildtools/LibyuiCommon.cmake b/legacy-buildtools/LibyuiCommon.cmake
 index e6fbefd..5e2fc0d 100644
---- a/buildtools/LibyuiCommon.cmake
-+++ b/buildtools/LibyuiCommon.cmake
+--- a/legacy-buildtools/LibyuiCommon.cmake
++++ b/legacy-buildtools/LibyuiCommon.cmake
 @@ -258,13 +258,6 @@ MACRO( SET_ENVIRONMENT )	# setup the environment vars
  
    SET( INSTALL_DOC_DIR "${DOC_DIR}" )
diff --git a/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb b/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
similarity index 86%
rename from meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
rename to meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
index d7f529e313..bdbbb031a3 100644
--- a/meta-oe/recipes-graphics/libyui/libyui_3.10.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui_4.0.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "git://github.com/libyui/libyui.git \
            file://0001-Use-relative-install-paths-for-CMake.patch \
            "
 
-SRCREV = "de9134007d2d029fe5809ce48f57fe218e6ffe16"
-SRCREV_FORMAT = "default"
+SRCREV = "af06143017fc5f18c4b6488ba4aed26bcc43ff6e"
+
 S = "${WORKDIR}/git"
 
 inherit cmake gettext pkgconfig
@@ -22,12 +22,6 @@ EXTRA_OECMAKE += "-DENABLE_WERROR=OFF"
 
 BBCLASSEXTEND = "native nativesdk"
 
-do_configure_prepend () {
-        (cd ${S} &&
-        ./bootstrap.sh &&
-        cd -)
-}
-
 do_install_append () {
         if [ "${libdir}" = "${base_prefix}/usr/lib" ] && [ -d ${D}/usr/lib64 ]; then
             mv ${D}/usr/lib64 ${D}/usr/lib
-- 
2.30.1

