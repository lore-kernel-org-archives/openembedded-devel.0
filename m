Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFEAC004D4
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:57 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.2064.1674324094311231906
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hqunF+Hv;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id m3-20020a17090a414300b00229ef93c5b0so7072521pjg.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onEkt8ehE1cmwpU8sNmV6QqiWzqU5NoJT5ts0vVnNwM=;
        b=hqunF+HvmKZEg/btVsXgpXyNgwuqlGhV6Zz8pV6Fpbw0MFeqd9DIL9zNEwMblQaExU
         l0f8T52j4LRUJS7rWjNsKEe09bRUA3ZB1IVrOUFvSgPfLbv2OyUUZ/gAMe2cNPF30Nol
         bgzOGU3NxEJxE6H700FeERHqMS/Nc9Ibe1rgt1Y4uwWL9aV7FPBbGSfhf7ntlBwN5W0B
         dUS5IsoX2e0XuC+ud96hV8MsMRsL5woNFrzQwTsFs+910pZC6y+0+5AIO+6TKWZcEdm7
         VPJAPqJpZbOuUB2Zf2toYOJ3ojBEI4aFDMdhjU4jMAKoqlF4lzXifXEH8WQaL7eQy0kq
         ODLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onEkt8ehE1cmwpU8sNmV6QqiWzqU5NoJT5ts0vVnNwM=;
        b=KSAe472ov50SaN++gj0nEPj1Pomq0Z5UzlxNsxT6waxxTbSoZEkYnfhD2z9HCK203l
         7Go8z3fwQ+9fVDVjGi+HcuJD/mbtLYxOWhbSfYIOiKcXVTGd1xh+6UaObWmiLB2MlUD1
         CgwUpKoxKjzgUP6QgDCATiH3IobffSWLmDD2UBbPGWNGNBR/1Bs4lqD9LY1DNGcmxHeK
         wC20YmoQEGbyvpvDwXh7A9MblwLSuDgk51Y01F3yolKfO2sR0Ixqi21H/poZ/qz3eOQG
         rwZb5Mp3vUor8NqA95SFwbp4ZuA2KfvmrW22G3JP3X0X/wx0ruDeIQkvCSPPaIo9ZAOy
         r7pA==
X-Gm-Message-State: AFqh2krKZl3fqJ6TkHB24saqmUAE+NzMNNFt6qllNMw0eePV9cvFKxg/
	ZJunxcpD3DWhlWS5cubCiltW1rcKH5h4eQ==
X-Google-Smtp-Source: AMrXdXugTPi+8sDRr6RTw5zun3Wdw39Q2dj2qKqlfq+AM13vL69m6UA4DkFetfO0U/SAe2/QENIafA==
X-Received: by 2002:a17:90b:4f8b:b0:22b:b9d9:48e7 with SMTP id qe11-20020a17090b4f8b00b0022bb9d948e7mr5067830pjb.39.1674324108242;
        Sat, 21 Jan 2023 10:01:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 30/30] poppler: cmake: Do not use -isystem
Date: Sat, 21 Jan 2023 10:01:21 -0800
Message-Id: <20230121180121.1229895-30-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100697

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-Do-not-use-isystem.patch       | 192 ++++++++++++++++++
 .../poppler/poppler_23.01.0.bb                |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch b/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch
new file mode 100644
index 0000000000..44a22963af
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-cmake-Do-not-use-isystem.patch
@@ -0,0 +1,192 @@
+From 51a2a1e4d8ca4040a6a7eac398cb704da35f39e5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Jan 2023 03:09:08 -0800
+Subject: [PATCH] cmake: Do not use -isystem
+
+isystem dirs are searched before the regular system dirs
+this exposes an interesting include ordering problem when using
+clang + libc++, when including C++ headers like <cstdlib>
+
+cstdlib includes stdlib.h and in case of libc++, this should be coming
+from libc++ as well, which is then eventually including system stdlib.h
+
+libc++ has added a check for checking this order recently, which means
+if cstlib ends up including system stdlib.h before libc++ provided
+stdlib.h it errors out
+
+/mnt/b/yoe/master/build/tmp/work/riscv64-yoe-linux/thrift/0.17.0-r0/recipe-sysroot/usr/include/c++/v1/cstdlib:90:5: error: <cstdlib> tried including <stdlib.h> but didn't find libc++'s <stdlib.h> header.           This usually means that your header search paths are not configured properly.           The header search paths should contain the C++ Standard Library headers before           any C Standard Library, and you are probably using compiler flags that make that           not be the case.
+    ^
+
+The reason is that include_directories with SYSTEM property adds the
+directory via -system and some of these directories point to sysroot
+e.g. OPENSSL_INCLUDE_DIR which ends up adding -isystem
+<sysroot>/usr/include and causes the system stdlib.h to included before
+libc++ stdlib.h
+
+A fix is to use -idirafter which preserved the effects of system headers
+but instead of prepending, it will append to system headers and the
+issue is addressed
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt         |  4 ++--
+ glib/CMakeLists.txt    |  4 ++--
+ qt5/src/CMakeLists.txt |  4 ++--
+ qt6/src/CMakeLists.txt |  4 ++--
+ test/CMakeLists.txt    |  6 +++---
+ utils/CMakeLists.txt   | 10 +++++-----
+ 6 files changed, 16 insertions(+), 16 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 4768ac8..cdc014d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -603,10 +603,10 @@ add_library(poppler ${poppler_SRCS})
+ if (OpenJPEG_FOUND)
+   # check if we can remove this when we depend on newer openjpeg versions, 2.5 seems fixed
+   # target openjp2 may lack interface include directories
+-  target_include_directories(poppler SYSTEM PRIVATE ${OPENJPEG_INCLUDE_DIRS})
++  target_include_directories(poppler  PRIVATE ${OPENJPEG_INCLUDE_DIRS})
+ endif()
+ if(USE_CMS)
+-  target_include_directories(poppler SYSTEM PRIVATE ${LCMS2_INCLUDE_DIR})
++  target_include_directories(poppler  PRIVATE ${LCMS2_INCLUDE_DIR})
+ endif()
+ generate_export_header(poppler BASE_NAME poppler-private EXPORT_FILE_NAME "${CMAKE_CURRENT_BINARY_DIR}/poppler_private_export.h")
+ set_target_properties(poppler PROPERTIES VERSION 126.0.0 SOVERSION 126)
+diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
+index 52e8687..08ab39a 100644
+--- a/glib/CMakeLists.txt
++++ b/glib/CMakeLists.txt
+@@ -4,7 +4,7 @@ include_directories(
+ )
+ 
+ include_directories(
+-  SYSTEM
++  
+   ${GLIB2_INCLUDE_DIRS}
+   ${CAIRO_INCLUDE_DIRS}
+ )
+@@ -96,7 +96,7 @@ if(MINGW AND BUILD_SHARED_LIBS)
+     set_target_properties(poppler-glib PROPERTIES SUFFIX "-${POPPLER_GLIB_SOVERSION}${CMAKE_SHARED_LIBRARY_SUFFIX}")
+ endif()
+ target_link_libraries(poppler-glib poppler PkgConfig::GLIB2 ${CAIRO_LIBRARIES} Freetype::Freetype)
+-target_include_directories(poppler-glib SYSTEM PRIVATE ${CAIRO_INCLUDE_DIRS})
++target_include_directories(poppler-glib  PRIVATE ${CAIRO_INCLUDE_DIRS})
+ install(TARGETS poppler-glib RUNTIME DESTINATION bin LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+ install(FILES
+diff --git a/qt5/src/CMakeLists.txt b/qt5/src/CMakeLists.txt
+index 5db3a6c..f242d29 100644
+--- a/qt5/src/CMakeLists.txt
++++ b/qt5/src/CMakeLists.txt
+@@ -45,11 +45,11 @@ if(MINGW AND BUILD_SHARED_LIBS)
+ endif()
+ target_link_libraries(poppler-qt5 poppler Qt5::Core Qt5::Gui Qt5::Xml Freetype::Freetype)
+ if (ENABLE_NSS3)
+-    target_include_directories(poppler-qt5 SYSTEM PRIVATE ${NSS3_INCLUDE_DIRS})
++    target_include_directories(poppler-qt5  PRIVATE ${NSS3_INCLUDE_DIRS})
+ endif()
+ if(USE_CMS)
+     target_link_libraries(poppler-qt5 poppler ${LCMS2_LIBRARIES})
+-    target_include_directories(poppler-qt5 SYSTEM PRIVATE ${LCMS2_INCLUDE_DIR})
++    target_include_directories(poppler-qt5  PRIVATE ${LCMS2_INCLUDE_DIR})
+ endif()
+ install(TARGETS poppler-qt5 RUNTIME DESTINATION bin LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+diff --git a/qt6/src/CMakeLists.txt b/qt6/src/CMakeLists.txt
+index cd91975..6c42e12 100644
+--- a/qt6/src/CMakeLists.txt
++++ b/qt6/src/CMakeLists.txt
+@@ -45,11 +45,11 @@ if(MINGW AND BUILD_SHARED_LIBS)
+ endif()
+ target_link_libraries(poppler-qt6 poppler Qt6::Core Qt6::Gui Freetype::Freetype)
+ if (ENABLE_NSS3)
+-    target_include_directories(poppler-qt6 SYSTEM PRIVATE ${NSS3_INCLUDE_DIRS})
++    target_include_directories(poppler-qt6  PRIVATE ${NSS3_INCLUDE_DIRS})
+ endif()
+ if(USE_CMS)
+     target_link_libraries(poppler-qt6 poppler ${LCMS2_LIBRARIES})
+-    target_include_directories(poppler-qt6 SYSTEM PRIVATE ${LCMS2_INCLUDE_DIR})
++    target_include_directories(poppler-qt6  PRIVATE ${LCMS2_INCLUDE_DIR})
+ endif()
+ install(TARGETS poppler-qt6 RUNTIME DESTINATION bin LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+ 
+diff --git a/test/CMakeLists.txt b/test/CMakeLists.txt
+index afa1352..9bd3b9a 100644
+--- a/test/CMakeLists.txt
++++ b/test/CMakeLists.txt
+@@ -23,7 +23,7 @@ if (GTK_FOUND)
+   )
+   poppler_add_test(gtk-test BUILD_GTK_TESTS ${gtk_splash_test_SRCS})
+   target_link_libraries(gtk-test ${CAIRO_LIBRARIES} poppler-glib PkgConfig::GTK3)
+-  target_include_directories(gtk-test SYSTEM PRIVATE ${CAIRO_INCLUDE_DIRS})
++  target_include_directories(gtk-test  PRIVATE ${CAIRO_INCLUDE_DIRS})
+ 
+   if (HAVE_CAIRO)
+ 
+@@ -35,7 +35,7 @@ if (GTK_FOUND)
+     )
+     poppler_add_test(pdf-inspector BUILD_GTK_TESTS ${pdf_inspector_SRCS})
+     target_link_libraries(pdf-inspector ${CAIRO_LIBRARIES} Freetype::Freetype ${common_libs} PkgConfig::GTK3 poppler)
+-    target_include_directories(pdf-inspector SYSTEM PRIVATE ${CAIRO_INCLUDE_DIRS})
++    target_include_directories(pdf-inspector  PRIVATE ${CAIRO_INCLUDE_DIRS})
+     target_compile_definitions(pdf-inspector PRIVATE -DSRC_DIR="${CMAKE_CURRENT_SOURCE_DIR}")
+   endif ()
+ 
+@@ -59,7 +59,7 @@ if (HAVE_CAIRO)
+       )
+     add_executable(cairo-thread-test ${cairo_thread_test_SRCS})
+     target_link_libraries(cairo-thread-test ${CAIRO_LIBRARIES} Freetype::Freetype Threads::Threads poppler)
+-    target_include_directories(cairo-thread-test SYSTEM PRIVATE ${CAIRO_INCLUDE_DIRS})
++    target_include_directories(cairo-thread-test  PRIVATE ${CAIRO_INCLUDE_DIRS})
+   endif ()
+ endif ()
+ 
+diff --git a/utils/CMakeLists.txt b/utils/CMakeLists.txt
+index 1c3ebcb..bc1840a 100644
+--- a/utils/CMakeLists.txt
++++ b/utils/CMakeLists.txt
+@@ -16,7 +16,7 @@ add_executable(pdftoppm ${pdftoppm_SOURCES})
+ target_link_libraries(pdftoppm ${common_libs})
+ if(LCMS2_FOUND)
+   target_link_libraries(pdftoppm ${LCMS2_LIBRARIES})
+-  target_include_directories(pdftoppm SYSTEM PRIVATE ${LCMS2_INCLUDE_DIR})
++  target_include_directories(pdftoppm  PRIVATE ${LCMS2_INCLUDE_DIR})
+ endif()
+ install(TARGETS pdftoppm DESTINATION bin)
+ install(FILES pdftoppm.1 DESTINATION ${CMAKE_INSTALL_MANDIR}/man1)
+@@ -37,10 +37,10 @@ if (HAVE_CAIRO)
+   add_definitions(${CAIRO_CFLAGS})
+   add_executable(pdftocairo ${pdftocairo_SOURCES})
+   target_link_libraries(pdftocairo ${CAIRO_LIBRARIES} Freetype::Freetype ${common_libs})
+-  target_include_directories(pdftocairo SYSTEM PRIVATE ${CAIRO_INCLUDE_DIRS})
++  target_include_directories(pdftocairo  PRIVATE ${CAIRO_INCLUDE_DIRS})
+   if(LCMS2_FOUND)
+     target_link_libraries(pdftocairo ${LCMS2_LIBRARIES})
+-    target_include_directories(pdftocairo SYSTEM PRIVATE ${LCMS2_INCLUDE_DIR})
++    target_include_directories(pdftocairo  PRIVATE ${LCMS2_INCLUDE_DIR})
+   endif()
+   install(TARGETS pdftocairo DESTINATION bin)
+   install(FILES pdftocairo.1 DESTINATION ${CMAKE_INSTALL_MANDIR}/man1)
+@@ -99,7 +99,7 @@ if (ENABLE_NSS3)
+     pdfsig.cc
+   )
+   add_executable(pdfsig ${pdfsig_SOURCES})
+-  target_include_directories(pdfsig SYSTEM PRIVATE ${NSS3_INCLUDE_DIRS})
++  target_include_directories(pdfsig  PRIVATE ${NSS3_INCLUDE_DIRS})
+   target_link_libraries(pdfsig ${common_libs})
+   install(TARGETS pdfsig DESTINATION bin)
+   install(FILES pdfsig.1 DESTINATION ${CMAKE_INSTALL_MANDIR}/man1)
+@@ -114,7 +114,7 @@ add_executable(pdftops ${pdftops_SOURCES})
+ target_link_libraries(pdftops ${common_libs})
+ if(LCMS2_FOUND)
+   target_link_libraries(pdftops ${LCMS2_LIBRARIES})
+-  target_include_directories(pdftops SYSTEM PRIVATE ${LCMS2_INCLUDE_DIR})
++  target_include_directories(pdftops  PRIVATE ${LCMS2_INCLUDE_DIR})
+ endif()
+ install(TARGETS pdftops DESTINATION bin)
+ install(FILES pdftops.1 DESTINATION ${CMAKE_INSTALL_MANDIR}/man1)
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-support/poppler/poppler_23.01.0.bb b/meta-oe/recipes-support/poppler/poppler_23.01.0.bb
index 849c35812d..4d1a089d7b 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.01.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.01.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
+           file://0001-cmake-Do-not-use-isystem.patch \
            "
 SRC_URI[sha256sum] = "fae9b88d3d5033117d38477b79220cfd0d8e252c278ec870ab1832501741fd94"
 
-- 
2.39.1


