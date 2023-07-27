Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7789EC00528
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 01:26:19 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.3453.1690421177397945853
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jul 2023 18:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=liCfLqNE;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b89cfb4571so3291005ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jul 2023 18:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690421176; x=1691025976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9A8iv7V4TRu7vI8w0tg2RES67wuHclPopdcYM5WfEok=;
        b=liCfLqNEVp68vq3H0Bf4E2YYkaHhtioWud37HTx7b26PMo2DfHvZVRVRMrKOWnVMZA
         IDrgruCvsZ3N3l7tTzrtqpDRf0YZELVMWHHgaAD+iPRVqZpDwxfwvsqoffiv9hoftnqs
         /ZTndskEw4KV8pbaWQ8yNX59kIFKl1DIJZid0SLH59ddR1K572CpaA6kAZ2oooqKY6qZ
         7G3jI2Haoru1drQpvpzNNo0Z1V8qWmHfJqjQwqVjY1J3ABrVC8stWEY4R3VEmuYSd0aa
         vFw8phj/gFyOi5Qja0xXHCg33s7ExMWN9Cg607tQcvw19ClFKBG5CJNWbLOjAE+B3y0o
         /dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690421176; x=1691025976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9A8iv7V4TRu7vI8w0tg2RES67wuHclPopdcYM5WfEok=;
        b=QOL4WU4E31226wiN75zfshu3R+b4QHR5cZB2lt0I0WcXLt2JhH3pbTZOwmGm1WOodU
         Y8RU4KH4QLhxy7Ns2FqljPIJs57615tSU1jfZTNTsYm0EUqfT8KBiCUlGW/zeUZGPMAi
         EmsXVLys545c8BHJ6bF3b5rHGO2AIaBqA6W8l75OhBSfTJxIRfUExYbKLUMktQkNqw7f
         yCHVT2XGkvAgs5LXCMMWdGcfrIQIqEGD1IAng/jLqpkOf2es0IT4zfTkcQZwJS6uVSTv
         nulAEmtcyzBjWzZ2wHbAa7+q+aPmfzlycwChRTubev5So41KnqNKWAvvwvYDmxJ4MHXg
         ro/g==
X-Gm-Message-State: ABy/qLYaMnbEH0pvbJOboKq5mbO1PDn7C5vpT40+PIX7LZ0+rxpMIiHB
	amGWjD3MdUjTZFb0TcbWNcULevGz2Dee0w==
X-Google-Smtp-Source: APBJJlHeu9UrB03d3u00Orbd0gt/YBnPM4HYo+AwEppx05lyI3EyGi+itXHG1YGuRq18lKQAUHAjbw==
X-Received: by 2002:a17:902:8485:b0:1bb:8c42:79ef with SMTP id c5-20020a170902848500b001bb8c4279efmr3385298plo.46.1690421176400;
        Wed, 26 Jul 2023 18:26:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:6180::41cf])
        by smtp.gmail.com with ESMTPSA id kx14-20020a170902f94e00b001ac40488620sm203742plb.92.2023.07.26.18.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 18:26:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] portaudio-v19: Update to latest tip of trunk
Date: Wed, 26 Jul 2023 18:26:09 -0700
Message-ID: <20230727012611.127297-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jul 2023 01:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104041

The patches are already upstreamed therefore deleted.
Additionally it fixes shared library versioning scheme which
in turn fixes build of dependent package python3-pyaudio failing with

QA Issue: /usr/lib/python3.11/site-packages/pyaudio/_portaudio.cpython-311-x86_64-linux-gnu.so contained in package python3-pyaudio requires libportaudio.so.2()(64bit), but no providers found in RDEPENDS:python3-pyaudio? [file-rdeps]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../portaudio-v19/0001-Find-jack.patch        | 32 ------------
 .../0001-cmake-Use-GNUInstallDirs.patch       | 49 -------------------
 .../portaudio/portaudio-v19_19.7.0.bb         | 16 +++---
 3 files changed, 6 insertions(+), 91 deletions(-)
 delete mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19/0001-Find-jack.patch
 delete mode 100644 meta-oe/recipes-support/portaudio/portaudio-v19/0001-cmake-Use-GNUInstallDirs.patch

diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19/0001-Find-jack.patch b/meta-oe/recipes-support/portaudio/portaudio-v19/0001-Find-jack.patch
deleted file mode 100644
index d6c6300ecd..0000000000
--- a/meta-oe/recipes-support/portaudio/portaudio-v19/0001-Find-jack.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8ec1b100afda5b3e31f9d44af04b04b16dfff2e4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Tue, 18 May 2021 00:15:46 +0200
-Subject: [PATCH] Find jack with pkgconfig
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 122fe93..ab7d7f5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -274,7 +274,8 @@ ELSE()
- 
-   ELSEIF(UNIX)
- 
--    FIND_PACKAGE(Jack)
-+    find_package(PkgConfig REQUIRED)
-+    pkg_check_modules (JACK jack)
-     IF(JACK_FOUND)
-       OPTION(PA_USE_JACK "Enable support for Jack" ON)
-     ELSE()
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19/0001-cmake-Use-GNUInstallDirs.patch b/meta-oe/recipes-support/portaudio/portaudio-v19/0001-cmake-Use-GNUInstallDirs.patch
deleted file mode 100644
index 892399de70..0000000000
--- a/meta-oe/recipes-support/portaudio/portaudio-v19/0001-cmake-Use-GNUInstallDirs.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From ced7af0420c1df0ac02f0c25e7c3534431ebd7fd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 4 Jul 2021 17:09:49 -0700
-Subject: [PATCH] cmake: Use GNUInstallDirs
-
-Helps install cmakefiles in right libdir
-
-Upstream-Status: Submitted [https://github.com/PortAudio/portaudio/pull/610]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -6,6 +6,8 @@
- 
- CMAKE_MINIMUM_REQUIRED(VERSION 2.8)
- 
-+include(GNUInstallDirs)
-+
- # Check if the user is building PortAudio stand-alone or as part of a larger
- # project. If this is part of a larger project (i.e. the CMakeLists.txt has
- # been imported by some other CMakeLists.txt), we don't want to trump over
-@@ -452,18 +454,18 @@ IF(NOT PA_OUTPUT_OSX_FRAMEWORK AND NOT P
-   CONFIGURE_FILE(cmake_support/portaudio-2.0.pc.in ${CMAKE_CURRENT_BINARY_DIR}/portaudio-2.0.pc @ONLY)
-   INSTALL(FILES README.md DESTINATION share/doc/portaudio)
-   INSTALL(FILES LICENSE.txt DESTINATION share/doc/portaudio)
--  INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/portaudio-2.0.pc DESTINATION lib/pkgconfig)
-+  INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/portaudio-2.0.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
-   INSTALL(FILES ${PA_PUBLIC_INCLUDES} DESTINATION include)
-   INSTALL(TARGETS ${PA_TARGETS}
-     EXPORT portaudio-targets
--    RUNTIME DESTINATION bin
--    LIBRARY DESTINATION lib
--    ARCHIVE DESTINATION lib)
--  INSTALL(EXPORT portaudio-targets FILE "portaudioTargets.cmake" DESTINATION "lib/cmake/portaudio")
-+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
-+  INSTALL(EXPORT portaudio-targets FILE "portaudioTargets.cmake" DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/portaudio")
-   EXPORT(TARGETS ${PA_TARGETS} FILE "${PROJECT_BINARY_DIR}/cmake/portaudio/portaudioTargets.cmake")
-   INSTALL(FILES "${CMAKE_BINARY_DIR}/cmake/portaudio/portaudioConfig.cmake"
-                 "${CMAKE_BINARY_DIR}/cmake/portaudio/portaudioConfigVersion.cmake"
--    DESTINATION "lib/cmake/portaudio")
-+    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/portaudio")
- 
-   IF (NOT TARGET uninstall)
-     CONFIGURE_FILE(
diff --git a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
index f34912ed28..c49a2599ac 100644
--- a/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
+++ b/meta-oe/recipes-support/portaudio/portaudio-v19_19.7.0.bb
@@ -3,18 +3,17 @@ SECTION = "libs/multimedia"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26107732c2ab637c5710446fcfaf02df"
 
-PV = "v190700"
+PV .= "+git${SRCPV}"
+
+SRC_URI = "git://github.com/PortAudio/portaudio.git;branch=master;protocol=https"
+SRCREV = "929e2e8f7af281c5eb4fa07758930d542ec43d97"
 
-SRC_URI = " \
-    git://github.com/PortAudio/portaudio.git;branch=master;protocol=https \
-    file://0001-Find-jack.patch \
-    file://0001-cmake-Use-GNUInstallDirs.patch \
-"
-SRCREV = "147dd722548358763a8b649b3e4b41dfffbcfbb6"
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
+EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+
 PACKAGECONFIG ??= "alsa jack"
 PACKAGECONFIG[alsa] = ",,alsa-lib"
 PACKAGECONFIG[jack] = ",,jack"
@@ -28,6 +27,3 @@ do_install:append() {
         done
     fi
 }
-
-FILES_SOLIBSDEV = ""
-FILES:${PN} += "${libdir}/libportaudio.so"
-- 
2.41.0


