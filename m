Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F097C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 09:39:40 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.5302.1648633179535032644
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 02:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 22U9db0Z026170
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 02:39:37 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 22U9daUk024268
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 02:39:37 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 30 Mar 2022 02:39:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 02:39:36 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 30 Mar 2022 02:39:35 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] wxwidgets: 3.1.4 -> 3.1.5
Date: Wed, 30 Mar 2022 17:39:32 +0800
Message-ID: <20220330093933.12701-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Mar 2022 09:39:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96267

From: Kai Kang <kai.kang@windriver.com>

* correct LICENSE name which should be 'WXWindows' according to
  https://www.wxwidgets.org/about/licence/
  remove the 'wxWidgets' license file and use the one in oe-core
* native wx-conf from wxwidgets is required by python3-wxgtk4, so extend
  wxwidgets-native and remove packageconfig opengl for -native.
* add patch to correct library names
* add packageconfig 'curl'

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/licenses/wxWidgets                    | 54 -------------------
 .../wxwidgets/fix-libdir-for-multilib.patch   | 10 ++--
 .../not-append-system-name-to-lib-name.patch  | 28 ++++++++++
 .../{wxwidgets_git.bb => wxwidgets_3.1.5.bb}  | 15 ++++--
 4 files changed, 43 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/licenses/wxWidgets
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_git.bb => wxwidgets_3.1.5.bb} (90%)

diff --git a/meta-oe/licenses/wxWidgets b/meta-oe/licenses/wxWidgets
deleted file mode 100644
index 0f6b9d6a8..000000000
--- a/meta-oe/licenses/wxWidgets
+++ /dev/null
@@ -1,54 +0,0 @@
-                wxWindows Library Licence, Version 3.1
-                ======================================
-
-  Copyright (c) 1998-2005 Julian Smart, Robert Roebling et al
-
-  Everyone is permitted to copy and distribute verbatim copies
-  of this licence document, but changing it is not allowed.
-
-                       WXWINDOWS LIBRARY LICENCE
-     TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
-
-  This library is free software; you can redistribute it and/or modify it
-  under the terms of the GNU Library General Public Licence as published by
-  the Free Software Foundation; either version 2 of the Licence, or (at
-  your option) any later version.
-
-  This library is distributed in the hope that it will be useful, but
-  WITHOUT ANY WARRANTY; without even the implied warranty of
-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Library
-  General Public Licence for more details.
-
-  You should have received a copy of the GNU Library General Public Licence
-  along with this software, usually in a file named COPYING.LIB.  If not,
-  write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
-  Boston, MA 02110-1301 USA.
-
-  EXCEPTION NOTICE
-
-  1. As a special exception, the copyright holders of this library give
-  permission for additional uses of the text contained in this release of
-  the library as licenced under the wxWindows Library Licence, applying
-  either version 3.1 of the Licence, or (at your option) any later version of
-  the Licence as published by the copyright holders of version
-  3.1 of the Licence document.
-
-  2. The exception is that you may use, copy, link, modify and distribute
-  under your own terms, binary object code versions of works based
-  on the Library.
-
-  3. If you copy code from files distributed under the terms of the GNU
-  General Public Licence or the GNU Library General Public Licence into a
-  copy of this library, as this licence permits, the exception does not
-  apply to the code that you add in this way.  To avoid misleading anyone as
-  to the status of such modified files, you must delete this exception
-  notice from such code and/or adjust the licensing conditions notice
-  accordingly.
-
-  4. If you write modifications of your own for this library, it is your
-  choice whether to permit this exception to apply to your modifications.
-  If you do not wish that, you must delete the exception notice from such
-  code and/or adjust the licensing conditions notice accordingly.
-
-
-
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
index 637e54b2b..555ed47ad 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multilib.patch
@@ -12,10 +12,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  4 files changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index e30d3db934..8f93c57108 100644
+index 4063020552..253d415210 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -37,7 +37,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
+@@ -43,7 +43,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
  # Initialize variables for quick access to wx root dir in sub dirs
  set(wxSOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
  set(wxBINARY_DIR ${CMAKE_BINARY_DIR})
@@ -25,10 +25,10 @@ index e30d3db934..8f93c57108 100644
  # parse the version number from wx/version.h and include in wxMAJOR_VERSION and wxMINOR_VERSION
  file(READ include/wx/version.h WX_VERSION_H_CONTENTS)
 diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index 6978cc2725..ed16ee5635 100644
+index 91d11acba2..f361d50a27 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
-@@ -52,7 +52,7 @@ function(wx_write_config_inplace)
+@@ -57,7 +57,7 @@ function(wx_write_config_inplace)
      execute_process(
          COMMAND
          ${CMAKE_COMMAND} -E create_symlink
@@ -53,7 +53,7 @@ index c33dd3946c..51e47e05b3 100644
 +        RUNTIME_OUTPUT_DIRECTORY "${wxOUTPUT_DIR}"
          )
  
-     if(MSVC)
+     if(wxBUILD_PIC)
 diff --git a/build/cmake/install.cmake b/build/cmake/install.cmake
 index 968dff859e..c850c51844 100644
 --- a/build/cmake/install.cmake
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
new file mode 100644
index 000000000..ef6963375
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name-to-lib-name.patch
@@ -0,0 +1,28 @@
+It appends system name to library names for cross compile. For example, the
+library name is libwx_baseu-3.1-Linux.so rather than libwx_baseu-3.1.so. It is
+not appropriate for oe.
+
+Upsteam-Status: Pending [oe specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ build/cmake/functions.cmake | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
+index 53cd6a1ace..95efa17fe4 100644
+--- a/build/cmake/functions.cmake
++++ b/build/cmake/functions.cmake
+@@ -211,9 +211,9 @@ function(wx_set_target_properties target_name is_base)
+         endif()
+     else()
+         set(cross_target "")
+-        if (CMAKE_CROSSCOMPILING)
+-            set(cross_target "-${CMAKE_SYSTEM_NAME}")
+-        endif ()
++        #if (CMAKE_CROSSCOMPILING)
++        #    set(cross_target "-${CMAKE_SYSTEM_NAME}")
++        #endif ()
+ 
+         set_target_properties(${target_name}
+             PROPERTIES
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
similarity index 90%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index b4420a18e..f9349b02a 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_git.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "wxWidgets is a free and open source cross-platform C++ framework
 HOMEPAGE = "https://www.wxwidgets.org/"
 BUGTRACKER = "https://trac.wxwidgets.org/"
 
-# wxWidgets licence is a modified version of LGPL explicitly allowing not
+# WXwindows licence is a modified version of LGPL explicitly allowing not
 # distributing the sources of an application using the library even in the
 # case of static linking.
-LICENSE = "wxWidgets"
+LICENSE = "WXwindows"
 LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake', d)}
@@ -26,15 +26,16 @@ SRC_URI = " \
     file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
     file://fix-libdir-for-multilib.patch \
     file://respect-DESTDIR-when-create-link.patch \
+    file://not-append-system-name-to-lib-name.patch \
 "
-PV = "3.1.4"
-SRCREV= "6cdaedd42ba59331b3dc4ead50e0bac76ae14c19"
+SRCREV= "9c0a8be1dc32063d91ed1901fd5fcd54f4f955a1"
 S = "${WORKDIR}/git"
 
 # These can be either 'builtin' or 'sys' and builtin means cloned soures are
 # build. So these cannot be PACKAGECONFIGs and let's use libs where we can (see
 # DEPENDS)
 EXTRA_OECMAKE += " \
+    -DwxUSE_GLCANVAS_EGL=OFF \
     -DwxUSE_LIBJPEG=sys \
     -DwxUSE_LIBPNG=sys \
     -DwxUSE_LIBTIFF=sys \
@@ -46,6 +47,7 @@ EXTRA_OECMAKE:append:libc-musl = " \
 "
 
 PACKAGECONFIG ?= "gtk ${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}"
+PACKAGECONFIG:remove:class-native = "opengl"
 
 # Note on toolkit-PACKAGECONFIGs: select exactly one of 'no_gui' / 'gtk' / 'qt'
 PACKAGECONFIG[no_gui] = "-DwxUSE_GUI=OFF,,,,,qt gtk opengl"
@@ -69,9 +71,10 @@ PACKAGECONFIG[gstreamer] = "-DwxUSE_MEDIACTRL=ON,-DwxUSE_MEDIACTRL=OFF,gstreamer
 PACKAGECONFIG[libsecret] = "-DwxUSE_SECRETSTORE=ON,-DwxUSE_SECRETSTORE=OFF,libsecret,,,no_gui"
 PACKAGECONFIG[lzma] = "-DwxUSE_LIBLZMA=ON,-DwxUSE_LIBLZMA=OFF,xz"
 PACKAGECONFIG[mspack] = "-DwxUSE_LIBMSPACK=ON,-DwxUSE_LIBMSPACK=OFF,libmspack"
-PACKAGECONFIG[opengl] = ",,libglu"
+PACKAGECONFIG[opengl] = "-DwxUSE_OPENGL=ON,-DwxUSE_OPENGL=OFF,libglu"
 PACKAGECONFIG[sdl_audio] = "-DwxUSE_LIBSDL=ON,-DwxUSE_LIBSDL=OFF,libsdl2"
 PACKAGECONFIG[webkit] = "-DwxUSE_WEBVIEW_WEBKIT=ON,-DwxUSE_WEBVIEW_WEBKIT=OFF,webkitgtk,,,no_gui"
+PACKAGECONFIG[curl] = "-DwxUSE_WEBREQUEST_CURL=ON,-DwxUSE_WEBREQUEST_CURL=OFF,curl"
 
 do_compile:append() {
     # if not at re-compile
@@ -108,3 +111,5 @@ FILES:${PN}-dev += " \
     ${libdir}/wx/include/ \
     ${libdir}/wx/config/ \
 "
+
+BBCLASSEXTEND = "native"
-- 
2.17.1


