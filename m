Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A7ACD98F0
	for <webhook@archiver.kernel.org>; Sun, 21 Jun 2026 12:12:22 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22991.1782043939154058313
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Jun 2026 05:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GgyTYpx1;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so20575765e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Jun 2026 05:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782043937; x=1782648737; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ge3XtYou0QWguqP8W212MJ+OfiTuMJ0jzEwB1qOIbU0=;
        b=GgyTYpx1rTj2KOwy02cB1/fkoHPw5uOpDCACkaagAhzkdUryIDRrrMeFRdngFRLtol
         DCaoaI/nxxCsLR1CaBK3eOfJUC7TLdTmC+v1LSCTfCrc0+pUe5PEN/Ymd7nelwyjodaK
         r7YUjMDFW/zGVhf/NGyaGKhGJAgid1cVi2LWmamPFtg57gA63Vls7rNKmP5T16uLV4vh
         6qBGKy9d6Ie6QuZ/dLTfzwHQMN1rGtJ4WhxzNGof/Zl/hZGDAptsRpyyCjfZZl4NLLpA
         gTRqfxeFHY+uvHclPGq4xFFVsQ/M7m6dajuQkALejB3yUEOC87pAluOg/A+EA1Z+TRSa
         cjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782043937; x=1782648737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ge3XtYou0QWguqP8W212MJ+OfiTuMJ0jzEwB1qOIbU0=;
        b=gPk+HQ/mOUpiCwWx4MOw58cWecexZeLCxN9WR9xwK/AryLj2YR5V4bEV8tfcRdWCQ0
         xLrE26imSJYpmh8Jyb8ZeOEvkWvD7phT3zCpdTqUrQEbwVW3Kw9rXKFQkDVmShc10R+n
         Oc7XBOq7Et5uoYBulf51lM5SCFjDq3A4sINLiKm+GhKo4OfXRcmWFVgONItDkXdF/R9B
         EwScnQabp5VtKmCVcRcwpMitXb2WY3rsZjlV7hbYo4AgW/h6jbdyb3SbrwpjttY+9NS7
         YKa2hB3fanEETHWZn/ME0daCeFucaXSmKLwN+EFclOFyJdxZTcJwaRN6p4oQSlNOD3OJ
         MvOg==
X-Gm-Message-State: AOJu0Yw/fMbTjFHQ3VrsSKbxeMTQbebWmUgAbMAI90jtUqO+kumhnvKm
	nYl2hDGU3AsOVnXWp+/gaEciPDe+oKkqegkVUhMd0tbvypr8QrEIyD8HUNbyJ8ki
X-Gm-Gg: AfdE7cl4yAchVp3SxKFWVWmbbVUa0El3HPp+Ot7+sMFTcShGYra1lWfCKF5d/fuROuj
	B2KDvMFlmPGSAnw78gSqwWBC8KCyVPeh1fCRk5MNuOwVxivUlTNEAncYCqaidHqZ4dJd1jqlPEb
	2fUoP5PVK9p9wmsG3neNScJAI0FkgEvDsp87J+AT9ckFVoR41BKKAcov9eq6Td+W3oNv/K+Iq5I
	G4Ew2J5YA7zqs7urliepmLFjtY0BJw+GlNbAP530aKkVLSl+jwqEoCzk1pOHpBeTwfxP0eKaTDr
	h2OKRIfbEh4nC7WJ6FH43X3OI3PmJ5cus+KJrzQdelK+bfd0Lwll2qb8+9U9MY8EkOxEvE6m7Fw
	GeBx86uS26vk0mSAG542BJPkEggcrFIWhSP39czq/TIm1f+I9UbVGsE36ZhlWTS5xetv+x15jEF
	RjO5N7TWOKS2x5ljkmcAh444HWqj+L8Jt8NWSSY+XetMidOQinpCFJrZdI1pQ=
X-Received: by 2002:a05:600c:8b10:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-4923f58988dmr192703855e9.28.1782043937250;
        Sun, 21 Jun 2026 05:12:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666712cceesm16420865f8f.35.2026.06.21.05.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 05:12:16 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] jansson: move to oe-core
Date: Sun, 21 Jun 2026 14:12:13 +0200
Message-ID: <20260621121213.4003526-1-alex@linutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Jun 2026 12:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127684

Added in oe-core commit:
https://git.openembedded.org/openembedded-core/commit/?id=2b6e7d092b4a21930186682ebf085848b2e49de5

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 .../jansson/0001-Honour-multilib-paths.patch  | 63 -------------------
 ...ols-starting-with-json_-and-jansson_.patch | 29 ---------
 .../jansson/jansson_2.15.0.bb                 | 20 ------
 4 files changed, 113 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
 delete mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch
 delete mode 100644 meta-oe/recipes-extended/jansson/jansson_2.15.0.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 7c2df00207..ea474349b2 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -348,7 +348,6 @@ RDEPENDS:packagegroup-meta-oe-extended = "\
     indent \
     iotop \
     isomd5sum \
-    jansson \
     jpnevulator \
     libblockdev \
     libcec \
diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch b/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
deleted file mode 100644
index 513d109459..0000000000
--- a/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From e66885e66a2ce7fd916933b12d1ba523a25141e4 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Mon, 3 Oct 2022 13:25:05 +0100
-Subject: [PATCH] Honour multilib paths
-
-Upstream-Status: Pending
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- CMakeLists.txt | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 39b9ad365f78..bf297e936a72 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -20,8 +20,8 @@ endif ()
- 
- # Set some nicer output dirs.
- set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
--set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
--set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
-+set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
-+set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
- set(JANSSON_TEMP_DIR ${CMAKE_CURRENT_BINARY_DIR}/tmp)
- 
- # Give the debug version a different postfix for windows,
-@@ -573,14 +573,14 @@ endif ()
- #
- 
- # Allow the user to override installation directories.
--set(JANSSON_INSTALL_LIB_DIR       lib CACHE PATH "Installation directory for libraries")
-+set(JANSSON_INSTALL_LIB_DIR       ${CMAKE_INSTALL_LIBDIR} CACHE PATH "Installation directory for libraries")
- set(JANSSON_INSTALL_BIN_DIR       bin CACHE PATH "Installation directory for executables")
- set(JANSSON_INSTALL_INCLUDE_DIR   include CACHE PATH "Installation directory for header files")
- 
- if(WIN32 AND NOT CYGWIN)
-   set(DEF_INSTALL_CMAKE_DIR cmake)
- else()
--  set(DEF_INSTALL_CMAKE_DIR lib/cmake/jansson)
-+  set(DEF_INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/jansson)
- endif()
- 
- set(JANSSON_INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
-@@ -633,8 +633,8 @@ option(JANSSON_INSTALL "Generate installation target" ON)
- if (JANSSON_INSTALL)
-   install(TARGETS jansson
-           EXPORT janssonTargets
--          LIBRARY DESTINATION "lib"
--          ARCHIVE DESTINATION "lib"
-+          LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
-+          ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
-           RUNTIME DESTINATION "bin"
-           INCLUDES DESTINATION "include")
- 
-@@ -644,7 +644,7 @@ if (JANSSON_INSTALL)
-   # Install the pkg-config.
-   install(FILES
-           ${CMAKE_CURRENT_BINARY_DIR}/jansson.pc
--          DESTINATION lib/pkgconfig)
-+          DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
- 
-   # Install the configs.
-   install(FILES
diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch b/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch
deleted file mode 100644
index a1c17d1d8e..0000000000
--- a/meta-oe/recipes-extended/jansson/jansson/0001-Only-export-symbols-starting-with-json_-and-jansson_.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e5c38614fb7e0bdbcaec6db6133fa62cfed62818 Mon Sep 17 00:00:00 2001
-From: Jaeyoon Jung <jaeyoon.jung@lge.com>
-Date: Wed, 15 Jan 2025 22:11:54 +0900
-Subject: [PATCH] Only export symbols starting with "json_" and "jansson_" for
- cmake
-
-It's already done by the commit 7c707a7 and bcb6b6f, but not for cmake.
-This makes symbols in the same visibility as built with libtool.
-
-Upstream-Status: Submitted [https://github.com/akheron/jansson/pull/704]
-Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
----
- CMakeLists.txt | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3394236..52b9934 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -325,6 +325,9 @@ if(JANSSON_BUILD_SHARED_LIBS)
- # some linkers may only support --version-script
-       file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/jansson.sym" "JANSSON_${JANSSON_SOVERSION} {
-     global:
-+          json_*;
-+          jansson_*;
-+    local:
-           *;
- };
- ")
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.15.0.bb b/meta-oe/recipes-extended/jansson/jansson_2.15.0.bb
deleted file mode 100644
index 829ac1ad49..0000000000
--- a/meta-oe/recipes-extended/jansson/jansson_2.15.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Jansson is a C library for encoding, decoding and manipulating JSON data"
-HOMEPAGE = "http://www.digip.org/jansson/"
-BUGTRACKER = "https://github.com/akheron/jansson/issues"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d9911525d4128bee234ee2d3ccaa2537"
-
-SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
-           file://0001-Honour-multilib-paths.patch \
-           file://0001-Only-export-symbols-starting-with-json_-and-jansson_.patch \
-           "
-SRC_URI[sha256sum] = "a7eac7765000373165f9373eb748be039c10b2efc00be9af3467ec92357d8954"
-
-UPSTREAM_CHECK_URI = "https://github.com/akheron/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-
-inherit cmake pkgconfig
-
-EXTRA_OECMAKE = "-DJANSSON_BUILD_SHARED_LIBS=${@ 'OFF' if d.getVar('DISABLE_STATIC') == '' else 'ON' }"
-
-BBCLASSEXTEND = "native"
-- 
2.47.3


