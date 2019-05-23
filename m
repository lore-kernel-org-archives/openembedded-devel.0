Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 96E067E3FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r7so4851354wrr.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=5cyEZeoJ2ppKOZCb0xS+p9h4oMEZv1qbM1XoS7gC2YQ=;
	b=uW3n0zLFe5Jyt4PId3nR4u4deLPfFl96AiTSxl2Xbwd3zD0NavUVUt/1qi5mmhyDDr
	IvMbp9rAaFLP3T5MEQlkm5tRPwfbd0o3VjxPaNZpKZgkKlxdepBP1+EGiZCAY56rUTog
	L8TgaQMiZUs0WHcJC/uVg3nrfE5fcPfQ5cWZ06DQAFgknQIbzQomN/f9rO+8YCVrFEj9
	IJ7QJ1MuxzPongACWQxrUnC2VNe//KK4CbFgNgxTLrbUTydIs2vpXdBqdV40G2ba9/8P
	bPzLqEpR3RrX8l10x6m+ftIeZBhM5rqCAhBkdq9n1AWEfimQ74HjWoPxmuShitjpfhbJ
	jpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=5cyEZeoJ2ppKOZCb0xS+p9h4oMEZv1qbM1XoS7gC2YQ=;
	b=nU/u8Fy3h2uRIwl1BAMMKcI1LcE73eiZSOSb5wACKh7+xXYP52KKnDmgm9ZlKFG/ks
	9c4OPtafj6dgUNl5ZgepnYGEWC/dpSqQUJk3T3WJ7bELhGzna2BUbKFE9UCMq+ooAJs6
	vSEDYeY1P4u2lRsSKDSI7TkI55tCxelyqrZkFAF1UKULXxTXYd7wXFb1KotW/Uf6dXPE
	AzKkW+oy0wcO+w2wHxIGu45deMTQ/Cj6s3U4o/FHh6jsuC6fEVvGirMbvlQiYFQz16ol
	C8bS3O7DDBzCu2c19rxK1rnRldaVphe+jNojA55yu7FL//sn0nYXBp38FeHInsT6bGHS
	MQ3A==
X-Gm-Message-State: APjAAAW2tuaVdv0lBoVVQwDrgk0KXrHV6pAoHN/qXUJ9F1Ak+RvaVQ4r
	LPr7zVjXsjXG76CC47d2Ljaz1BZ9Dbc=
X-Google-Smtp-Source: APXvYqx1bN7iW6PteV0fOc4UEDN20blswxJBRIxIJmZMxZTiuDI0KC6AL+hwtobzGleYX/FiqrD3hA==
X-Received: by 2002:adf:9e46:: with SMTP id v6mr594482wre.141.1558594165575;
	Wed, 22 May 2019 23:49:25 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:38 +0200
Message-Id: <20190523064859.24336-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 20/41] exiv2: initial add 0.27.0
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
X-List-Received-Date: Thu, 23 May 2019 06:49:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* exiv2 0.27 lives in several layers currently:
  meta-webos-ports / meta-luneos / meta-qt5-extra
* Now meta-gnome will require it for nautilus -> gexiv2
  => move it up in layer hierarchy
* This recipe was taken from meta-qt5-extra
* Patches were taken from Fedora before they moved to 0.27.1 [1]
* From my experience as soon as upstream will create a successor of
  0.27.1 they move tarballs from builds [2] -> archive [3]
  To avoid missing sources let's stick on 0.27.0.

[1] https://src.fedoraproject.org/rpms/exiv2/tree/master
[2] https://exiv2.org/builds/
[3] https://www.exiv2.org/archive.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/exiv2/exiv2.bb        |  26 ++++
 ...es-only-installed-with-the-exiv2-app.patch |  41 ++++++
 ...nings-about-missing-PDB-files-in-3rd.patch |  64 +++++++++
 ...-to-exiv2-xmp-to-avoid-name-conflict.patch |  82 ++++++++++++
 ...nstall-header-files-without-globbing.patch | 111 ++++++++++++++++
 ...t-installation-dir-for-generated-doc.patch |  28 ++++
 ...t-installation-dir-for-cmake-config-.patch | 124 ++++++++++++++++++
 ...psdk-Build-with-DBanAllEntityUsage-1.patch |  34 +++++
 ...compile-warnings-in-ExpatAdapter.cpp.patch |  31 +++++
 ...e-for-being-compatible-with-more-dis.patch |  27 ++++
 ...ate-install-exiv2ConfigVersion.cmake.patch |  50 +++++++
 11 files changed, 618 insertions(+)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2.bb
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-cmake-man-pages-only-installed-with-the-exiv2-app.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0002-cmake-ignore-warnings-about-missing-PDB-files-in-3rd.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0003-cmake-Rename-xmp-to-exiv2-xmp-to-avoid-name-conflict.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0004-cmake-Install-header-files-without-globbing.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0005-cmake-Use-correct-installation-dir-for-generated-doc.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0006-cmake-Use-correct-installation-dir-for-cmake-config-.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0007-xmpsdk-Build-with-DBanAllEntityUsage-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0008-xmpsdk-Fix-compile-warnings-in-ExpatAdapter.cpp.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0009-Fixes-in-.pc-file-for-being-compatible-with-more-dis.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0010-create-install-exiv2ConfigVersion.cmake.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2.bb b/meta-oe/recipes-support/exiv2/exiv2.bb
new file mode 100644
index 000000000..26aef7163
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Exif, Iptc and XMP metadata manipulation library and tools"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
+
+DEPENDS = "zlib expat"
+
+SRC_URI = " \
+    https://exiv2.org/releases/${BPN}-${PV}-Source.tar.gz \
+    file://0001-cmake-man-pages-only-installed-with-the-exiv2-app.patch \
+    file://0002-cmake-ignore-warnings-about-missing-PDB-files-in-3rd.patch \
+    file://0003-cmake-Rename-xmp-to-exiv2-xmp-to-avoid-name-conflict.patch \
+    file://0004-cmake-Install-header-files-without-globbing.patch \
+    file://0005-cmake-Use-correct-installation-dir-for-generated-doc.patch \
+    file://0006-cmake-Use-correct-installation-dir-for-cmake-config-.patch \
+    file://0007-xmpsdk-Build-with-DBanAllEntityUsage-1.patch \
+    file://0008-xmpsdk-Fix-compile-warnings-in-ExpatAdapter.cpp.patch \
+    file://0009-Fixes-in-.pc-file-for-being-compatible-with-more-dis.patch \
+    file://0010-create-install-exiv2ConfigVersion.cmake.patch \
+"
+SRC_URI[md5sum] = "57d58c9cef127c5fa24bf0e1fbbd1f8c"
+SRC_URI[sha256sum] = "ee88bc81539b73c65010651785d094fad0b39760a424b3c16c17e1856cfef2d7"
+PV = "0.27.0"
+S = "${WORKDIR}/${BPN}-${PV}-Source"
+
+inherit cmake gettext
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-cmake-man-pages-only-installed-with-the-exiv2-app.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-cmake-man-pages-only-installed-with-the-exiv2-app.patch
new file mode 100644
index 000000000..889e8f877
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-cmake-man-pages-only-installed-with-the-exiv2-app.patch
@@ -0,0 +1,41 @@
+From d1c609b320eadbe7089b0482353ffef576813ca2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Luis=20D=C3=ADaz=20M=C3=A1s?= <piponazo@gmail.com>
+Date: Tue, 18 Dec 2018 08:05:16 +0100
+Subject: [PATCH 22/70] cmake: man pages only installed with the exiv2 app
+
+---
+ CMakeLists.txt     | 3 ---
+ src/CMakeLists.txt | 7 +------
+ 2 files changed, 1 insertion(+), 9 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 8dfd9d97..e98cfac1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -106,6 +106,3 @@ configure_file(cmake/exiv2.pc.in exiv2.pc @ONLY)
+ install(FILES ${CMAKE_BINARY_DIR}/exiv2.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ 
+ include(cmake/printSummary.cmake)
+-
+-# That's all Folks!
+-##
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index ca24006e..0d093924 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -273,11 +273,6 @@ if(EXIV2_BUILD_EXIV2_COMMAND)
+     endif()
+ 
+     install(TARGETS exiv2 RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
++    install( FILES exiv2.1 DESTINATION ${CMAKE_INSTALL_MANDIR}/man1 )
+ endif()
+ 
+-# ******************************************************************************
+-# Man page
+-install( FILES exiv2.1 DESTINATION ${CMAKE_INSTALL_MANDIR}/man1 )
+-
+-# That's all Folks!
+-##
+-- 
+2.17.2
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0002-cmake-ignore-warnings-about-missing-PDB-files-in-3rd.patch b/meta-oe/recipes-support/exiv2/exiv2/0002-cmake-ignore-warnings-about-missing-PDB-files-in-3rd.patch
new file mode 100644
index 000000000..84c07222a
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0002-cmake-ignore-warnings-about-missing-PDB-files-in-3rd.patch
@@ -0,0 +1,64 @@
+From e57f311e629762fbf2b08d9a5b1e0cad1035b42f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Luis=20D=C3=ADaz=20M=C3=A1s?= <piponazo@gmail.com>
+Date: Tue, 18 Dec 2018 10:33:11 +0100
+Subject: [PATCH 35/70] cmake: ignore warnings about missing PDB files in 3rd
+ party libs
+
+---
+ samples/CMakeLists.txt | 11 +++++++++++
+ src/CMakeLists.txt     |  4 ++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/samples/CMakeLists.txt b/samples/CMakeLists.txt
+index a3e491e0..4e8c14c6 100644
+--- a/samples/CMakeLists.txt
++++ b/samples/CMakeLists.txt
+@@ -43,6 +43,9 @@ foreach(entry ${SAMPLES})
+     add_test( ${target}_test ${target} )
+     target_include_directories(${target} PRIVATE ${CMAKE_SOURCE_DIR}/src) # To find unused.h
+     install( TARGETS ${target} RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
++    if (MSVC)
++        set_target_properties(${target} PROPERTIES LINK_FLAGS "/ignore:4099")
++    endif()
+ endforeach()
+ 
+ ###################################
+@@ -69,6 +72,11 @@ list(APPEND APPLICATIONS exiv2json)
+ 
+ install( TARGETS metacopy pathtest exiv2json RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
+ 
++if (MSVC)
++    set_target_properties(exiv2json PROPERTIES LINK_FLAGS "/ignore:4099")
++    set_target_properties(metacopy PROPERTIES LINK_FLAGS "/ignore:4099")
++endif()
++
+ if( EXPAT_FOUND )
+     add_executable(        geotag    geotag.cpp)
+     list(APPEND APPLICATIONS geotag)
+@@ -103,6 +111,9 @@ foreach(application ${APPLICATIONS})
+     if( EXIV2_ENABLE_PNG )
+         target_link_libraries( ${application} PRIVATE ${ZLIB_LIBRARIES} )
+     endif()
++    if (MSVC)
++        set_target_properties(${application} PROPERTIES LINK_FLAGS "/ignore:4099")
++    endif()
+ endforeach()
+ 
+ # ******************************************************************************
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 0d093924..adb285b1 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -274,5 +274,9 @@ if(EXIV2_BUILD_EXIV2_COMMAND)
+ 
+     install(TARGETS exiv2 RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
+     install( FILES exiv2.1 DESTINATION ${CMAKE_INSTALL_MANDIR}/man1 )
++
++    if (MSVC)
++        set_target_properties(exiv2 PROPERTIES LINK_FLAGS "/ignore:4099")
++    endif()
+ endif()
+ 
+-- 
+2.17.2
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0003-cmake-Rename-xmp-to-exiv2-xmp-to-avoid-name-conflict.patch b/meta-oe/recipes-support/exiv2/exiv2/0003-cmake-Rename-xmp-to-exiv2-xmp-to-avoid-name-conflict.patch
new file mode 100644
index 000000000..08a307341
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0003-cmake-Rename-xmp-to-exiv2-xmp-to-avoid-name-conflict.patch
@@ -0,0 +1,82 @@
+From 89509d7a3915ba474cbc3f8c85ab9bec4954ceda Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 2 Jan 2019 10:38:22 +0100
+Subject: [PATCH 64/70] cmake: Rename xmp to exiv2-xmp to avoid name conflicts
+
+There is already a libxmp file by the xmp project on https://xmp.sf.net.
+To avoid issues prefix with exiv2.
+
+Fixes #624
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+---
+ src/CMakeLists.txt    |  2 +-
+ xmpsdk/CMakeLists.txt | 14 +++++++-------
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index adb285b1..2aeae733 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -147,7 +147,7 @@ target_include_directories(exiv2lib_int PRIVATE ${ZLIB_INCLUDE_DIR})
+ target_include_directories(exiv2lib PRIVATE ${ZLIB_INCLUDE_DIR})
+ 
+ if (EXIV2_ENABLE_XMP)
+-    target_link_libraries(exiv2lib PUBLIC xmp)
++    target_link_libraries(exiv2lib PUBLIC exiv2-xmp)
+ elseif(EXIV2_ENABLE_EXTERNAL_XMP)
+     target_link_libraries(exiv2lib PUBLIC ${XMPSDK_LIBRARY})
+     target_include_directories(exiv2lib PUBLIC ${XMPSDK_INCLUDE_DIR})
+diff --git a/xmpsdk/CMakeLists.txt b/xmpsdk/CMakeLists.txt
+index a4c1fe6c..fa521043 100644
+--- a/xmpsdk/CMakeLists.txt
++++ b/xmpsdk/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-add_library(xmp STATIC
++add_library(exiv2-xmp STATIC
+     src/ExpatAdapter.cpp
+     src/MD5.cpp
+     src/ParseRDF.cpp
+@@ -26,12 +26,12 @@ add_library(xmp STATIC
+     include/XMP_Version.h
+ )
+ 
+-target_link_libraries(xmp 
++target_link_libraries(exiv2-xmp
+     PRIVATE 
+         ${EXPAT_LIBRARY}
+ )
+ 
+-target_include_directories(xmp
++target_include_directories(exiv2-xmp
+     PUBLIC 
+         $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/xmpsdk/include>
+     PRIVATE 
+@@ -39,20 +39,20 @@ target_include_directories(xmp
+ )
+ 
+ if (MSVC)
+-    target_compile_definitions(xmp PRIVATE XML_STATIC)
++    target_compile_definitions(exiv2-xmp PRIVATE XML_STATIC)
+ endif()
+ 
+ check_include_file( "stdint.h"  EXV_HAVE_STDINT_H )
+ if (EXV_HAVE_STDINT_H)
+-    target_compile_definitions(xmp PRIVATE EXV_HAVE_STDINT_H)
++    target_compile_definitions(exiv2-xmp PRIVATE EXV_HAVE_STDINT_H)
+ endif()
+ 
+ if (BUILD_SHARED_LIBS)
+-    set_property(TARGET xmp PROPERTY POSITION_INDEPENDENT_CODE ON)
++    set_property(TARGET exiv2-xmp PROPERTY POSITION_INDEPENDENT_CODE ON)
+ endif()
+ 
+ # 1119  Install libxmp.a for use by third party applications (Thanks, Emmanuel)
+-install(TARGETS xmp EXPORT exiv2Config
++install(TARGETS exiv2-xmp EXPORT exiv2Config
+         LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
+         ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ )
+-- 
+2.17.2
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0004-cmake-Install-header-files-without-globbing.patch b/meta-oe/recipes-support/exiv2/exiv2/0004-cmake-Install-header-files-without-globbing.patch
new file mode 100644
index 000000000..4503375f3
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0004-cmake-Install-header-files-without-globbing.patch
@@ -0,0 +1,111 @@
+From 0b34ccb9a3b26cd1c5267c6a5c15e9fa1a665adb Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 2 Jan 2019 10:59:30 +0100
+Subject: [PATCH 65/70] cmake: Install header files without globbing
+
+Fixes #627
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+---
+ CMakeLists.txt               |  1 +
+ include/CMakeLists.txt       |  1 +
+ include/exiv2/CMakeLists.txt | 51 ++++++++++++++++++++++++++++++++++++
+ src/CMakeLists.txt           |  4 ---
+ 4 files changed, 53 insertions(+), 4 deletions(-)
+ create mode 100644 include/CMakeLists.txt
+ create mode 100644 include/exiv2/CMakeLists.txt
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 183cdd2e..ce4d2202 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -76,6 +76,7 @@ endif()
+ 
+ include(cmake/compilerFlagsExiv2.cmake REQUIRED)
+ 
++add_subdirectory( include )
+ add_subdirectory( src )
+ 
+ if( EXIV2_BUILD_UNIT_TESTS )
+diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
+new file mode 100644
+index 00000000..01b43a6c
+--- /dev/null
++++ b/include/CMakeLists.txt
+@@ -0,0 +1 @@
++add_subdirectory(exiv2)
+diff --git a/include/exiv2/CMakeLists.txt b/include/exiv2/CMakeLists.txt
+new file mode 100644
+index 00000000..60080f1c
+--- /dev/null
++++ b/include/exiv2/CMakeLists.txt
+@@ -0,0 +1,51 @@
++install(FILES
++            asfvideo.hpp
++            basicio.hpp
++            bigtiffimage.hpp
++            bmpimage.hpp
++            config.h
++            convert.hpp
++            cr2image.hpp
++            crwimage.hpp
++            datasets.hpp
++            easyaccess.hpp
++            epsimage.hpp
++            error.hpp
++            exif.hpp
++            exiv2.hpp
++            futils.hpp
++            gifimage.hpp
++            http.hpp
++            image.hpp
++            ini.hpp
++            iptc.hpp
++            jp2image.hpp
++            jpgimage.hpp
++            matroskavideo.hpp
++            metadatum.hpp
++            mrwimage.hpp
++            orfimage.hpp
++            pgfimage.hpp
++            pngimage.hpp
++            preview.hpp
++            properties.hpp
++            psdimage.hpp
++            quicktimevideo.hpp
++            rafimage.hpp
++            riffvideo.hpp
++            rw2image.hpp
++            rwlock.hpp
++            slice.hpp
++            ssh.hpp
++            tags.hpp
++            tgaimage.hpp
++            tiffimage.hpp
++            types.hpp
++            utilsvideo.hpp
++            value.hpp
++            version.hpp
++            webpimage.hpp
++            xmp_exiv2.hpp
++            xmpsidecar.hpp
++        DESTINATION
++            ${CMAKE_INSTALL_INCLUDEDIR}/exiv2)
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index adb285b1..04d8a2a0 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -225,10 +225,6 @@ install(TARGETS exiv2lib EXPORT exiv2Config
+     ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
+ )
+ 
+-install(DIRECTORY ../include/exiv2
+-    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
+-    FILES_MATCHING PATTERN "*.h*")
+-
+ install(FILES
+     ${CMAKE_BINARY_DIR}/exv_conf.h
+     ${CMAKE_BINARY_DIR}/exiv2lib_export.h
+-- 
+2.17.2
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0005-cmake-Use-correct-installation-dir-for-generated-doc.patch b/meta-oe/recipes-support/exiv2/exiv2/0005-cmake-Use-correct-installation-dir-for-generated-doc.patch
new file mode 100644
index 000000000..5a53c955f
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0005-cmake-Use-correct-installation-dir-for-generated-doc.patch
@@ -0,0 +1,28 @@
+From f8f63a8b4033549d47384c6e2b1972ae1a2775fc Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 2 Jan 2019 10:28:57 +0100
+Subject: [PATCH 66/70] cmake: Use correct installation dir for generated docs
+
+Fixes #623
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+---
+ cmake/generateDoc.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/generateDoc.cmake b/cmake/generateDoc.cmake
+index a3aea727..16823946 100644
+--- a/cmake/generateDoc.cmake
++++ b/cmake/generateDoc.cmake
+@@ -21,7 +21,7 @@ macro(generate_documentation DOX_CONFIG_FILE)
+     set(DOXY_CONFIG "${CMAKE_CURRENT_BINARY_DIR}/doxy.config")
+     add_custom_target(doc ${DOXYGEN_EXECUTABLE} ${DOXY_CONFIG})
+ 
+-    install(DIRECTORY "${PROJECT_BINARY_DIR}/doc/html/" DESTINATION "share/doc/lib${PROJECT_NAME}")
++    install(DIRECTORY "${PROJECT_BINARY_DIR}/doc/html/" DESTINATION ${CMAKE_INSTALL_DOCDIR})
+ 
+     set_property(DIRECTORY APPEND PROPERTY ADDITIONAL_MAKE_CLEAN_FILES doc)
+ endmacro()
+-- 
+2.17.2
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0006-cmake-Use-correct-installation-dir-for-cmake-config-.patch b/meta-oe/recipes-support/exiv2/exiv2/0006-cmake-Use-correct-installation-dir-for-cmake-config-.patch
new file mode 100644
index 000000000..0bba2af49
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0006-cmake-Use-correct-installation-dir-for-cmake-config-.patch
@@ -0,0 +1,124 @@
+From 420e4631da1372da1be06af8f6032429c1f14d02 Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Thu, 3 Jan 2019 10:18:27 +0100
+Subject: [PATCH 67/70] cmake: Use correct installation dir for cmake config
+ files
+
+This is the path cmake will look for those files by default. At least on
+UNIX systems.
+
+Fixes #623
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+---
+ releasenotes/CYGWIN/ReadMe.txt | 2 +-
+ releasenotes/Darwin/ReadMe.txt | 2 +-
+ releasenotes/Linux/ReadMe.txt  | 1 +
+ releasenotes/MinGW/ReadMe.txt  | 2 +-
+ releasenotes/msvc/ReadMe.txt   | 2 +-
+ releasenotes/releasenotes.txt  | 5 +++++
+ src/CMakeLists.txt             | 2 +-
+ 7 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/releasenotes/CYGWIN/ReadMe.txt b/releasenotes/CYGWIN/ReadMe.txt
+index 9161ca34..bba70fe6 100644
+--- a/releasenotes/CYGWIN/ReadMe.txt
++++ b/releasenotes/CYGWIN/ReadMe.txt
+@@ -7,9 +7,9 @@ Structure of the bundle:
+ bin/exiv2.exe                             exiv2 and sample applications
+ bin/cygexiv2-27.dll                       DLL
+ lib/libexiv2.dll.a & libxmp.a             link libraries
++lib/cmake/exiv2                           consume CMake files
+ lib/pkgconfig/exiv2.pc                    pkg-config file
+ share/man                                 man pages
+-share/exiv2/cmake                         consume CMake files
+ samples/exifprint.cpp                     sample code
+ logs                                      build and test logs
+ 
+diff --git a/releasenotes/Darwin/ReadMe.txt b/releasenotes/Darwin/ReadMe.txt
+index d3e61177..57910713 100644
+--- a/releasenotes/Darwin/ReadMe.txt
++++ b/releasenotes/Darwin/ReadMe.txt
+@@ -6,10 +6,10 @@ Structure of the bundle
+ 
+ bin/exiv2                                 exiv2 and sample applications
+ lib/libexiv2.0.27.0.0.dylib & libxmp.a    libraries
++lib/cmake/exiv2                           consume CMake files
+ lib/pkgconfig/exiv2.pc                    pkg-config file
+ include/exiv2/                            include files
+ share/man                                 man pages
+-share/exiv2/cmake                         consume CMake files
+ samples/exifprint.cpp                     sample code
+ logs                                      build and test logs
+ 
+diff --git a/releasenotes/Linux/ReadMe.txt b/releasenotes/Linux/ReadMe.txt
+index 03348302..0737b3a4 100644
+--- a/releasenotes/Linux/ReadMe.txt
++++ b/releasenotes/Linux/ReadMe.txt
+@@ -7,6 +7,7 @@ Structure of the bundle:
+ bin/exiv2                                 exiv2 and sample applications
+ lib/libexiv2.so.0.27.0.0 & libxmp.a       libraries
+ lib/pkgconfig/exiv2.pc                    pkg-config file
++lib/cmake/exiv2                           consume CMake files
+ include/exiv2/                            include files
+ share/                                    man pages
+ samples/exifprint.cpp                     sample code
+diff --git a/releasenotes/MinGW/ReadMe.txt b/releasenotes/MinGW/ReadMe.txt
+index 884d7502..98cd7770 100644
+--- a/releasenotes/MinGW/ReadMe.txt
++++ b/releasenotes/MinGW/ReadMe.txt
+@@ -7,10 +7,10 @@ Structure of the bundle:
+ bin/exiv2.exe                             exiv2 and sample applications
+ bin/msys-exiv2-27.dll                     exiv2 dll
+ lib/libexiv2.dll.a & libxmp.a             link libraries
++lib/cmake/exiv2                           consume CMake files
+ lib/pkgconfig/exiv2.pc                    pkg-config file
+ include/exiv2/                            include files
+ share/man                                 man pages
+-share/exiv2/cmake                         consume CMake files
+ samples/exifprint.cpp                     sample code
+ logs                                      build and test logs
+ 
+diff --git a/releasenotes/msvc/ReadMe.txt b/releasenotes/msvc/ReadMe.txt
+index de1dcbfe..e625ab49 100644
+--- a/releasenotes/msvc/ReadMe.txt
++++ b/releasenotes/msvc/ReadMe.txt
+@@ -7,8 +7,8 @@ Structure of the bundle:
+ bin/exiv2.exe                             exiv2 and sample applications
+ bin/exiv2.dll                             dll
+ lib/exiv2.lib & xmp.lib                   link libraries
++lib/cmake/exiv2                           consume CMake files
+ include/exiv2/                            include files
+-share/exiv2/cmake                         consume CMake files
+ samples/exifprint.cpp                     sample code
+ logs                                      build and test logs
+ 
+diff --git a/releasenotes/releasenotes.txt b/releasenotes/releasenotes.txt
+index b71b4519..226c078b 100644
+--- a/releasenotes/releasenotes.txt
++++ b/releasenotes/releasenotes.txt
+@@ -1,3 +1,8 @@
++Exiv2 v0.27.1
++-------------
++
++#623 Use correct installation path for generated docs and cmake config files
++
+ Exiv2 v0.27.0
+ -------------
+ 
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index adb285b1..4a05ee4f 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -234,7 +234,7 @@ install(FILES
+     ${CMAKE_BINARY_DIR}/exiv2lib_export.h
+     DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/exiv2)
+ 
+-install(EXPORT exiv2Config DESTINATION "share/exiv2/cmake")
++install(EXPORT exiv2Config DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/exiv2")
+ 
+ # ******************************************************************************
+ # exiv2 application
+-- 
+2.17.2
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0007-xmpsdk-Build-with-DBanAllEntityUsage-1.patch b/meta-oe/recipes-support/exiv2/exiv2/0007-xmpsdk-Build-with-DBanAllEntityUsage-1.patch
new file mode 100644
index 000000000..0983447dd
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0007-xmpsdk-Build-with-DBanAllEntityUsage-1.patch
@@ -0,0 +1,34 @@
+From e44d1dbe769f3b60a3d671be310f4af4f9490e6b Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Thu, 3 Jan 2019 10:31:25 +0100
+Subject: [PATCH 68/70] xmpsdk: Build with -DBanAllEntityUsage=1
+
+Prevent a denial-service-attack related to XML entity expansion
+("billion laughs attack").
+See https://bugzilla.redhat.com/show_bug.cgi?id=888769
+
+Search for BanAllEntityUsage in xmpsdk/src/ExpatAdapter.cpp
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+---
+ xmpsdk/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/xmpsdk/CMakeLists.txt b/xmpsdk/CMakeLists.txt
+index fa521043..ae011dc3 100644
+--- a/xmpsdk/CMakeLists.txt
++++ b/xmpsdk/CMakeLists.txt
+@@ -38,6 +38,10 @@ target_include_directories(exiv2-xmp
+         ${EXPAT_INCLUDE_DIR}
+ )
+ 
++# Prevent a denial-service-attack related to XML entity expansion
++# ("billion laughs attack").
++# See https://bugzilla.redhat.com/show_bug.cgi?id=888769
++target_compile_definitions(exiv2-xmp PRIVATE BanAllEntityUsage=1)
+ if (MSVC)
+     target_compile_definitions(exiv2-xmp PRIVATE XML_STATIC)
+ endif()
+-- 
+2.17.2
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0008-xmpsdk-Fix-compile-warnings-in-ExpatAdapter.cpp.patch b/meta-oe/recipes-support/exiv2/exiv2/0008-xmpsdk-Fix-compile-warnings-in-ExpatAdapter.cpp.patch
new file mode 100644
index 000000000..7f351249b
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0008-xmpsdk-Fix-compile-warnings-in-ExpatAdapter.cpp.patch
@@ -0,0 +1,31 @@
+From dac6bb6043fc046f7cbad73c281eb258a981267f Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Thu, 3 Jan 2019 10:41:40 +0100
+Subject: [PATCH 69/70] xmpsdk: Fix compile warnings in ExpatAdapter.cpp
+
+The code has been enabled with -DBanAllEntityUsage=1
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+---
+ xmpsdk/src/ExpatAdapter.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/xmpsdk/src/ExpatAdapter.cpp b/xmpsdk/src/ExpatAdapter.cpp
+index 79669f52..09117c75 100644
+--- a/xmpsdk/src/ExpatAdapter.cpp
++++ b/xmpsdk/src/ExpatAdapter.cpp
+@@ -484,7 +484,10 @@ static void CommentHandler ( void * userData, XMP_StringPtr comment )
+ static void StartDoctypeDeclHandler ( void * userData, XMP_StringPtr doctypeName,
+ 									  XMP_StringPtr sysid, XMP_StringPtr pubid, int has_internal_subset )
+ {
+-	IgnoreParam(userData);
++	IgnoreParam(doctypeName);
++	IgnoreParam(sysid);
++	IgnoreParam(pubid);
++	IgnoreParam(has_internal_subset);
+ 
+ 	ExpatAdapter * thiz = (ExpatAdapter*)userData;
+ 
+-- 
+2.17.2
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0009-Fixes-in-.pc-file-for-being-compatible-with-more-dis.patch b/meta-oe/recipes-support/exiv2/exiv2/0009-Fixes-in-.pc-file-for-being-compatible-with-more-dis.patch
new file mode 100644
index 000000000..c65f13bc3
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0009-Fixes-in-.pc-file-for-being-compatible-with-more-dis.patch
@@ -0,0 +1,27 @@
+From ae9eb90108c0f6a3f2030cf4e4ae907a8b203b6a Mon Sep 17 00:00:00 2001
+From: Luis Diaz Mas <piponazo@gmail.com>
+Date: Sat, 12 Jan 2019 13:39:12 +0100
+Subject: [PATCH 79/98] Fixes in .pc file for being compatible with more
+ distributions
+
+---
+ cmake/exiv2.pc.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/exiv2.pc.in b/cmake/exiv2.pc.in
+index e477696d..9018472b 100644
+--- a/cmake/exiv2.pc.in
++++ b/cmake/exiv2.pc.in
+@@ -1,7 +1,7 @@
+ prefix=@CMAKE_INSTALL_PREFIX@
+ exec_prefix=${prefix}
+-libdir=${prefix}/lib
+-includedir=${prefix}/include
++libdir=${prefix}/@CMAKE_INSTALL_LIBDIR@
++includedir=${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
+ 
+ Name: exiv2
+ Description: @PROJECT_DESCRIPTION@
+-- 
+2.17.2
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2/0010-create-install-exiv2ConfigVersion.cmake.patch b/meta-oe/recipes-support/exiv2/exiv2/0010-create-install-exiv2ConfigVersion.cmake.patch
new file mode 100644
index 000000000..0aacb70da
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0010-create-install-exiv2ConfigVersion.cmake.patch
@@ -0,0 +1,50 @@
+From 487567b209ca40e56f9357b89c907253a7be8bf0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Wed, 24 Apr 2019 18:59:13 +0200
+Subject: [PATCH] create & install exiv2ConfigVersion.cmake
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Backport [1]
+
+[1] https://github.com/Exiv2/exiv2/commit/ce0284bc1f5cef635583130a7e807f70f034bc01
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/CMakeLists.txt | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 6418bbd..f0b663a 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -7,6 +7,7 @@ if( EXIV2_BUILD_UNIT_TESTS )
+ endif()
+ 
+ 
++include(CMakePackageConfigHelpers)
+ include_directories(${CMAKE_CURRENT_BINARY_DIR})
+ 
+ 
+@@ -218,6 +219,7 @@ if( ICONV_FOUND )
+     target_link_libraries( exiv2lib PRIVATE Iconv::Iconv )
+ endif()
+ 
++write_basic_package_version_file(exiv2ConfigVersion.cmake COMPATIBILITY ExactVersion)
+ 
+ install(TARGETS exiv2lib EXPORT exiv2Config
+     RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
+@@ -232,6 +234,9 @@ install(FILES
+ 
+ install(EXPORT exiv2Config DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/exiv2")
+ 
++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/exiv2ConfigVersion.cmake DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/exiv2")
++
++
+ # ******************************************************************************
+ # exiv2 application
+ 
+-- 
+2.20.1
+
-- 
2.20.1


