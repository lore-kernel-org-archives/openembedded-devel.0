Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8106.1795739773840382471
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SivF6NUs;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso50973115ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739773; x=1796344573; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=469mCXa2VLDD5QGN26217gHSFfy4msXTFuXHYRFWxXc=;
        b=SivF6NUsumQ6QPisTS4bfjlYH0oG+r6Fdm0p5Gj2VM/YcVj2VirkUdt7pbMiC4UuLD
         oFPGFyHkpGwb6o0Awi0eYTYQ4EjVmizW4U3Qr+xF0UF29HLpcuowEas193rUP1X5XfQU
         vAx8dgi+N8KZ+FRg/qfQVTLPtZPoFUQBHGZ9RjaZeyWoNoZvHQ9GIJ3YPbaxF1psQFNA
         GhS0MYaVbCnd5LDljDxfBeJCblEcAfGgvs65ib7FzR2FU8GIRLwwXWjGz1i1hEMJOjNm
         C5pZaTedrzugZBnfcHCVUUIptSnwftKQ2M5ozDkAV2mFgQ42J9pPH6d6JBoiu3egi/S9
         up9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739773; x=1796344573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=469mCXa2VLDD5QGN26217gHSFfy4msXTFuXHYRFWxXc=;
        b=UkbWA8zUjoLSt6C1eFxE7Vdgvbmv2/CW4xEBgyCbSOat5lJaOqgpWwd8vOCfNQuGs0
         AhsPIe0SD3PxQw2IVCwotm+QTKu18XTxhxoZIis5cv+TcHBZLBfHocrwL4t/Jtkco5SJ
         vjKyyjCQc+VSDBojIZ6qwmF0HGrHuCapNw0w7GTWvMlZ45LJ9uHgw3+pBjWPyj4ji/FH
         ept1VZ/qjxX1Rmq5jcwTWeXx/VJnEBzXbsZcZynJc+mGkCmU1JvAJxR6ED6HA/2crnrg
         PfQj8dFgBOiZxTG6AlcXWrbhUHkU5KGSTbFRk3ifvRNGhMEv41el9wXtYksvKHq/18VZ
         k4cw==
X-Gm-Message-State: APuU4Z9exoi02PFlySbMDBUGA10yTMpbgsC7BkzxCKLb2c3kdAMvN5OT
	9MmIYzzbUMCAffVG9UoxDNblf5rY6OwkDQ+uH2SW56CgHcEpzym3/zA9GQXXbE32
X-Gm-Gg: AZFdTZcWTHbct7GdDeh/zzifkbzGBEAYulsH9ZlgTPMynY7F/vMYQrLxN1nlA0bHe1/
	Tyqz+3eGGga2NMV3lMyIPxwCKQQsXby0uR+Oe2N/5x9YwAMccQfcnBy3RayQId07WEcc8dTL5wx
	NmmqHLrGlzDDPVupE46l1Fne6WPILdWQYcgtHW0nku7PEb8o5rLLMAhzWtJiTCZqTLUzGjvH9we
	n72FvfaUdYjv0ng4TMHfAEGpsCHc01ac3Lz50wyMRtvHRlAF4ReUGywDbiSZ9IZnkwcPg8R8MVa
	yT9WGmbj97/IAh2EtsGH3zlgvxiedAO6KWeJ87qZyaDzioCLAZTkV2ipKZ99SKYRQTNl2xYzBcw
	QP5JTNucOrTK1nN7askkkJB1/UFX3+EZdLDJxl1uZPR7VBcusGez38zB2+6LgaCpditzCtixDcS
	Db6GNshtnVbyKXZu3ISuzIkuPmCnuQLokNtHDb7yCcyTekOC88lOU18gZyCV90Fd81VexvqKEvE
	Aq988ClGl9RLuKrYGE5sujHx2baqUKnVr9OhdprGWmSGQsbWwxl7+7Nx0naLKnA65L1LsCBzlZf
	zFOLZATKgINq/4yu/9NXduTRW0mVfB7Z4tyxT8hzSXyL+wNuZi6XDRpEbV56iVMNC3Fo+jK4Nh5
	hwNK1QVajvk5q5nwaAZLz2H+33p7msGlSzUiXAxnNAq/+atbC4mbHNHTSiYU5tNEHU5myBUyPH7
	bXG1pO/W8ZvODG/32eJp931PnHui5qUdwQ7e/J/L//a4EK0rgF2Ip9t4MN2uUmGCMa3cLrQVII4
	wpzvTQganQzqrB/quVXaiCiP4Xq8sNJ4MP1jRjVa5mwfa/btKnWiZXZHLaw7eHcNxWOHT9mM1D0
	S856
X-Received: by 2002:a17:902:c942:b0:2ed:4d3:6ac5 with SMTP id d9443c01a7336-2f03efa0da3mr171833455ad.4.1795739773173;
        Thu, 26 Nov 2026 16:36:13 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0fe9e36f9sm10410875ad.55.2026.11.26.16.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:36:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 08/39] cjson: Install CMake package files with relative paths
Date: Thu, 26 Nov 2026 16:35:12 -0800
Message-ID: <20261127003543.2167775-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
References: <20261127003543.2167775-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133178
Content-Type: text/plain; charset="utf-8"

cJSON installs with CMAKE_INSTALL_FULL_* destinations, so the exported
cjson targets record absolute /usr/lib and /usr/include paths instead of
paths relative to _IMPORT_PREFIX. A consumer using
find_package(cJSON CONFIG) against the sysroot, as mosquitto 2.1.4 does,
then looks on the build host and fails:

  The imported target "cjson-static" references the file
     "/usr/lib/libcjson.a"
  but this file does not exist.

Add a patch that installs to relative destinations and derives
CJSON_INCLUDE_DIRS from the config file's location.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ake-Install-to-relative-destinations.patch | 122 ++++++++++++++++++
 .../recipes-devtools/cjson/cjson_1.7.19.bb    |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/0001-CMake-Install-to-relative-destinations.patch

diff --git a/meta-oe/recipes-devtools/cjson/cjson/0001-CMake-Install-to-relative-destinations.patch b/meta-oe/recipes-devtools/cjson/cjson/0001-CMake-Install-to-relative-destinations.patch
new file mode 100644
index 0000000000..91f45de2d9
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/0001-CMake-Install-to-relative-destinations.patch
@@ -0,0 +1,122 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 25 Nov 2026 23:12:10 -0800
+Subject: [PATCH] CMake: Install to relative destinations
+
+Installing with CMAKE_INSTALL_FULL_* destinations makes the exported
+cjson/cjson_utils targets record absolute paths such as /usr/lib/libcjson.a
+and /usr/include instead of paths relative to _IMPORT_PREFIX. Consumers
+that cross-compile against a sysroot then look for the library on the
+build host, and find_package(cJSON CONFIG) fails with
+"The imported target "cjson-static" references the file /usr/lib/libcjson.a
+but this file does not exist".
+
+Use the relative CMAKE_INSTALL_* variables for the install destinations
+and derive CJSON_INCLUDE_DIRS in cJSONConfig.cmake from the location of
+the config file. The pkg-config files keep their absolute paths.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ CMakeLists.txt                      | 38 ++++++++++++++---------------
+ library_config/cJSONConfig.cmake.in |  5 ++--
+ 2 files changed, 22 insertions(+), 21 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c7ca27f..4c909c1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -142,25 +142,25 @@ endif()
+ configure_file("${CMAKE_CURRENT_SOURCE_DIR}/library_config/libcjson.pc.in"
+     "${CMAKE_CURRENT_BINARY_DIR}/libcjson.pc" @ONLY)
+ 
+-install(FILES cJSON.h DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}/cjson")
+-install (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcjson.pc" DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/pkgconfig")
++install(FILES cJSON.h DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/cjson")
++install (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcjson.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+ install(TARGETS "${CJSON_LIB}"
+     EXPORT "${CJSON_LIB}"
+-    ARCHIVE DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-    LIBRARY DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-    RUNTIME DESTINATION "${CMAKE_INSTALL_FULL_BINDIR}"
+-    INCLUDES DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}"
++    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++    RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
++    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+ )
+ if (BUILD_SHARED_AND_STATIC_LIBS)
+     install(TARGETS "${CJSON_LIB}-static"
+     EXPORT "${CJSON_LIB}" 
+-    ARCHIVE DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-    INCLUDES DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}"
++    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+ )
+ endif()
+ if(ENABLE_TARGET_EXPORT)
+     # export library information for CMake projects
+-    install(EXPORT "${CJSON_LIB}" DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/cmake/cJSON")
++    install(EXPORT "${CJSON_LIB}" DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cJSON")
+ endif()
+ 
+ if(ENABLE_CJSON_VERSION_SO)
+@@ -195,23 +195,23 @@ if(ENABLE_CJSON_UTILS)
+ 
+     install(TARGETS "${CJSON_UTILS_LIB}"
+         EXPORT "${CJSON_UTILS_LIB}"
+-        ARCHIVE DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-        LIBRARY DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-        RUNTIME DESTINATION "${CMAKE_INSTALL_FULL_BINDIR}"
+-        INCLUDES DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}"
++        ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++        LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
++        INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+     )
+     if (BUILD_SHARED_AND_STATIC_LIBS)
+         install(TARGETS "${CJSON_UTILS_LIB}-static" 
+         EXPORT "${CJSON_UTILS_LIB}" 
+-        ARCHIVE DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}"
+-        INCLUDES DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}"
++        ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
++        INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
+         )
+     endif()
+-    install(FILES cJSON_Utils.h DESTINATION "${CMAKE_INSTALL_FULL_INCLUDEDIR}/cjson")
+-    install (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcjson_utils.pc" DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/pkgconfig")
++    install(FILES cJSON_Utils.h DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/cjson")
++    install (FILES "${CMAKE_CURRENT_BINARY_DIR}/libcjson_utils.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
+     if(ENABLE_TARGET_EXPORT)
+       # export library information for CMake projects
+-      install(EXPORT "${CJSON_UTILS_LIB}" DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/cmake/cJSON")
++      install(EXPORT "${CJSON_UTILS_LIB}" DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cJSON")
+     endif()
+ 
+     if(ENABLE_CJSON_VERSION_SO)
+@@ -234,7 +234,7 @@ if(ENABLE_TARGET_EXPORT)
+     # Install package config files
+     install(FILES ${PROJECT_BINARY_DIR}/cJSONConfig.cmake
+         ${PROJECT_BINARY_DIR}/cJSONConfigVersion.cmake
+-        DESTINATION "${CMAKE_INSTALL_FULL_LIBDIR}/cmake/cJSON")
++        DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cJSON")
+ endif()
+ 
+ option(ENABLE_CJSON_TEST "Enable building cJSON test" ON)
+diff --git a/library_config/cJSONConfig.cmake.in b/library_config/cJSONConfig.cmake.in
+index 909f7a9..21a14f2 100644
+--- a/library_config/cJSONConfig.cmake.in
++++ b/library_config/cJSONConfig.cmake.in
+@@ -2,8 +2,9 @@
+ set(CJSON_UTILS_FOUND @ENABLE_CJSON_UTILS@)
+ 
+ # The include directories used by cJSON
+-set(CJSON_INCLUDE_DIRS "@CMAKE_INSTALL_FULL_INCLUDEDIR@")
+-set(CJSON_INCLUDE_DIR "@CMAKE_INSTALL_FULL_INCLUDEDIR@")
++get_filename_component(_cjson_prefix "${CMAKE_CURRENT_LIST_DIR}/../../.." ABSOLUTE)
++set(CJSON_INCLUDE_DIRS "${_cjson_prefix}/@CMAKE_INSTALL_INCLUDEDIR@")
++set(CJSON_INCLUDE_DIR "${_cjson_prefix}/@CMAKE_INSTALL_INCLUDEDIR@")
+ 
+ get_filename_component(_dir "${CMAKE_CURRENT_LIST_FILE}" PATH)
+ 
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
index b4e57d7297..6f169b1724 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.19.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
            file://0001-allow-build-with-cmake-4.patch \
            file://CVE-2026-87933.patch \
+           file://0001-CMake-Install-to-relative-destinations.patch \
          "
 SRCREV = "c859b25da02955fef659d658b8f324b5cde87be3"
 
