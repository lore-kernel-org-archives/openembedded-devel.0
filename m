Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC9BC433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 17:06:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.136.1664816794386457440
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 10:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GgfyciH4;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id nb11so23562532ejc.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Oct 2022 10:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=voQs/ClDXq3vabZo44xcJV1bcPzfr235AZJFR4YWQoc=;
        b=GgfyciH4JN1Uc9U8mWLo1IZ0CjRNmIC9gQTUzd9U59SbXi0pdkOdyfa6kxaxy7LieJ
         hKT/blpuVSj0vYkg6JviYpWk4ACgFfj8gFN5si1QZw+st17Fo8eqOstfezb/RwpjLNXw
         LOjZsrz231yUIwkg1vOJQ9Itd9SEvebMF5VDmSrlkvAQcpKJ/nyCfYrnaiNE+HO0+Uz9
         gy6Vfkdq3qDeqxvNPR+5yQvhQmfElo7DthRdQDUYyxWsob29AQgD0iz5+JIJEz/FUhfr
         LYT5vMIz/nhqPwxe0y+GidOf2HmU5k4OExgHApyopumdquIlWBECTl9vGphJjiguP05F
         JGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=voQs/ClDXq3vabZo44xcJV1bcPzfr235AZJFR4YWQoc=;
        b=oMOjrJZET9R8gcEUqhl4+KDPo8FkN2/T50e3K83rkSB1c2UBUD90soplur20gL1MpL
         h5D2WxJeOBvNx76/up9YNlxSajCBi11cB60fHl9TfuuGdDtesui8I2dUjeqfj5l9l883
         uUjYJBzL0efh0DMMIFDUTwLxKXzRzGKesUL9Cn00a7/jkWffjy6xMwmXnOd+bW3f94Sw
         Dc8w9aKA8mhge7ITbygBYdmA6fW++YdHbYYdwOQnaRgRK9oWafIzo0BXuIGCMjAkDTUj
         J+72SDngtp1GrMrE+o4JtH17bq47N8nedUZ3qLX2pdgkGvy1tOPolk8vQ98AUoz7Jxhu
         W/AA==
X-Gm-Message-State: ACrzQf3T2QTJnL9p2AwKzZe29Nsoc3Igpg15DRZotOPKzWZCE7wmCnrs
	9oU34FbQC1Jvm58JC29h/k00SRerSZw=
X-Google-Smtp-Source: 
 AMsMyM4xRgGtcK1VU/GMAXvJj6Cij6D7ac0mREJrejR3hbWmPYbCS1H5JZGpCAyu8l9hwm1I2TnCbA==
X-Received: by 2002:a17:906:2699:b0:781:a473:9791 with SMTP id
 t25-20020a170906269900b00781a4739791mr15744870ejc.644.1664816792419;
        Mon, 03 Oct 2022 10:06:32 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 v1-20020a056402174100b004589ac5d0c9sm6342329edx.45.2022.10.03.10.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 10:06:31 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 1/3] jansson: Honour multilib paths
Date: Mon,  3 Oct 2022 18:06:21 +0100
Message-Id: <20221003170623.26207-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Oct 2022 17:06:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99040

When multilib is enabled, builds fail during package_qa:

ERROR: jansson-2.14-r0 do_package: QA Issue: jansson: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/libjansson.a
  /usr/lib/pkgconfig
  /usr/lib/cmake
  /usr/lib/pkgconfig/jansson.pc
  /usr/lib/cmake/jansson
  /usr/lib/cmake/jansson/janssonTargets-noconfig.cmake
  /usr/lib/cmake/jansson/janssonConfig.cmake
  /usr/lib/cmake/jansson/janssonConfigVersion.cmake
  /usr/lib/cmake/jansson/janssonTargets.cmake
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
jansson: 10 installed and not shipped files. [installed-vs-shipped]
ERROR: jansson-2.14-r0 do_package: Fatal QA errors were found, failing task.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../jansson/0001-Honour-multilib-paths.patch  | 63 +++++++++++++++++++
 .../recipes-extended/jansson/jansson_2.14.bb  |  4 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch

diff --git a/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch b/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
new file mode 100644
index 000000000000..513d1094593a
--- /dev/null
+++ b/meta-oe/recipes-extended/jansson/jansson/0001-Honour-multilib-paths.patch
@@ -0,0 +1,63 @@
+From e66885e66a2ce7fd916933b12d1ba523a25141e4 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Mon, 3 Oct 2022 13:25:05 +0100
+Subject: [PATCH] Honour multilib paths
+
+Upstream-Status: Pending
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ CMakeLists.txt | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 39b9ad365f78..bf297e936a72 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -20,8 +20,8 @@ endif ()
+ 
+ # Set some nicer output dirs.
+ set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
+-set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
+-set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
++set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
++set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR})
+ set(JANSSON_TEMP_DIR ${CMAKE_CURRENT_BINARY_DIR}/tmp)
+ 
+ # Give the debug version a different postfix for windows,
+@@ -573,14 +573,14 @@ endif ()
+ #
+ 
+ # Allow the user to override installation directories.
+-set(JANSSON_INSTALL_LIB_DIR       lib CACHE PATH "Installation directory for libraries")
++set(JANSSON_INSTALL_LIB_DIR       ${CMAKE_INSTALL_LIBDIR} CACHE PATH "Installation directory for libraries")
+ set(JANSSON_INSTALL_BIN_DIR       bin CACHE PATH "Installation directory for executables")
+ set(JANSSON_INSTALL_INCLUDE_DIR   include CACHE PATH "Installation directory for header files")
+ 
+ if(WIN32 AND NOT CYGWIN)
+   set(DEF_INSTALL_CMAKE_DIR cmake)
+ else()
+-  set(DEF_INSTALL_CMAKE_DIR lib/cmake/jansson)
++  set(DEF_INSTALL_CMAKE_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/jansson)
+ endif()
+ 
+ set(JANSSON_INSTALL_CMAKE_DIR ${DEF_INSTALL_CMAKE_DIR} CACHE PATH "Installation directory for CMake files")
+@@ -633,8 +633,8 @@ option(JANSSON_INSTALL "Generate installation target" ON)
+ if (JANSSON_INSTALL)
+   install(TARGETS jansson
+           EXPORT janssonTargets
+-          LIBRARY DESTINATION "lib"
+-          ARCHIVE DESTINATION "lib"
++          LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++          ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
+           RUNTIME DESTINATION "bin"
+           INCLUDES DESTINATION "include")
+ 
+@@ -644,7 +644,7 @@ if (JANSSON_INSTALL)
+   # Install the pkg-config.
+   install(FILES
+           ${CMAKE_CURRENT_BINARY_DIR}/jansson.pc
+-          DESTINATION lib/pkgconfig)
++          DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ 
+   # Install the configs.
+   install(FILES
diff --git a/meta-oe/recipes-extended/jansson/jansson_2.14.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
index 94bb99ab71a9..68e24c890726 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.14.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
@@ -4,7 +4,9 @@ BUGTRACKER = "https://github.com/akheron/jansson/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
 
-SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2"
+SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2 \
+           file://0001-Honour-multilib-paths.patch \
+           "
 SRC_URI[sha256sum] = "fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9"
 
 UPSTREAM_CHECK_URI = "https://github.com/akheron/${BPN}/releases"
-- 
2.35.1


