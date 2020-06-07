Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.1273.1591500300593441396
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ainvrit3;
 spf=pass (domain: gmail.com, ip: 209.85.214.195, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f195.google.com with SMTP id y18so5282782plr.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VEVeJGls0NTsBpf6KLF3LNvsKXskb4SmMCkDqjJgpE8=;
        b=Ainvrit34XiBTWF3hCl8QjKmBIYwQkEPuzFlCPWpU9DmQtGF+Je0tsVdi4gellLbfG
         NnO3m4HI1uSZElQeTxDl4b+NV8d2U+BUpqwerW2v03PWINPyQVR5XCh9FIAh7ZD6btzB
         hXOkG7lAgZEbkfRoh89fwHLNsNGmJyi5ZNdGaoYM/bLbDv8FPtaj6hoGVN2wvwO7vLMv
         DrdjNnZ1SAdjVrg1oCkq0dQIxaHqXeuRs1BzNGRC+zUTOgSLJ2bME17MLs2Nj20+2gTs
         KBQAN4Wn30X7TdE4CmRmAwcyKaYVn3GLphPdfMQ7m4wnsi6Ft8CdVfSjvoFbzPbV8wAk
         jN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VEVeJGls0NTsBpf6KLF3LNvsKXskb4SmMCkDqjJgpE8=;
        b=fkICNpzQbBbq3PedDQwEaBPjtw9eXolMGCAM9nsgas3W3EJeGOklV+Uc7zEuBY7NzS
         LxWpRjV0WGZ0ZUBeO1yOXAWEZOevk30b2hprg6G4dZX7K//hIe0DtbSEYKqqVpDf/rSb
         8baG6TGCnuQpTMm1VO4eHM12ij8bs49ALNfHj3UZVMn1HipclaWXU4ZRq4Ge2x+kNfw5
         x5NWQdfA9xjRVYoEJ3+5k7Bm2MWxBCMXMDzsMy9NjDKY7pZ8AbhR0CF7gv6z3TmVDFbP
         q9XL269/KiUz9bUnlAUfYUW1aYROTV5vFIlJW/nsimMDtNqEnSx4z3cCIo7T/g92reig
         0cpA==
X-Gm-Message-State: AOAM533eGY8glfm+bjkwzMyPktlNQcbqIp+hrOiUDssjWGv5Z/NHSMcc
	LWz6yrRWLJp5kuHdrFLOa7UWK5y1
X-Google-Smtp-Source: ABdhPJzTTmhJdz1XjFvL5bVgni/ALkeIk8ZJ2WBYDWUG/JOCCS7BRmlcmiquxT+TdTo9/uaufPNZUw==
X-Received: by 2002:a17:902:eb14:: with SMTP id l20mr16449450plb.189.1591500299864;
        Sat, 06 Jun 2020 20:24:59 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:59 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 17/26] fluidsynth: upgrade 2.1.2 -> 2.1.3
Date: Sat,  6 Jun 2020 20:24:27 -0700
Message-Id: <3fa69505793756a32f1dd473f42ead62ff02ecf8.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

>>From [1]:

* fix a cross-compilation failure from Win32 to WinARM (#630)
* fix issues while fluid_player is seeking (#634, #646)
* fix a NULL pointer dereference if synth.dynamic-sample-loading is enabled (#635)
* fix a NULL pointer dereference in delete_rvoice_mixer_threads() (#640)
* fix a NULL pointer dereference in the soundfont loader (#647, thanks to @jjceresa)
* fix dsound driver playing garbage when terminating fluidsynth (#642, thanks to @jjceresa)
* avoid memory leaks when using libinstpatch (#643)

[1] https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.3

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 074e115397aca40eaa3c531653a8db75578c718f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../fluidsynth/fluidsynth.inc                 |  4 +--
 ...tables-helper-we-have-to-use-native-.patch | 32 +++++++++++++------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 73858b0203..fcc9df8c30 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -5,8 +5,8 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
 SRC_URI = "git://github.com/FluidSynth/fluidsynth.git"
-SRCREV = "d9ad6a0725840388a48f45e38eda903a65ec1cf5"
+SRCREV = "19a20eb8526465fdf940b740b13462d71e190a1a"
 S = "${WORKDIR}/git"
-PV = "2.1.2"
+PV = "2.1.3"
 
 inherit cmake pkgconfig lib_package
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch
index 44612275c1..cc73bdb1d9 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0001-Do-not-build-gentables-helper-we-have-to-use-native-.patch
@@ -10,28 +10,40 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- src/CMakeLists.txt | 11 -----------
- 1 file changed, 11 deletions(-)
+ src/CMakeLists.txt | 23 +----------------------
+ 1 file changed, 1 insertion(+), 22 deletions(-)
 
 diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index a0ba53d1..1c626717 100644
+index 356bb734..58ff7635 100644
 --- a/src/CMakeLists.txt
 +++ b/src/CMakeLists.txt
-@@ -359,14 +359,3 @@ else ( MACOSX_FRAMEWORK )
- )
+@@ -399,25 +399,4 @@ else ( MACOSX_FRAMEWORK )
     install ( FILES ${public_main_HEADER} DESTINATION ${INCLUDE_INSTALL_DIR} )
  endif ( MACOSX_FRAMEWORK )
--
+ 
 -# ******* Auto Generated Lookup Tables ******
 -
 -include(ExternalProject)
+-
+-set (GENTAB_SDIR ${CMAKE_CURRENT_SOURCE_DIR}/gentables)
+-set (GENTAB_BDIR ${CMAKE_CURRENT_BINARY_DIR}/gentables)
+-
+-# Use external project to ensure that cmake uses the host compiler when building make_tables.exe
+-# To fix cross-compiling fluidsynth from Win32 to ARM (using vcpkg), we need to pass the current generator
+-# on to the external project, otherwise (for some unknown reason) the target compiler will be used rather
+-# than the host compiler.
 -ExternalProject_Add(gentables
 -    DOWNLOAD_COMMAND ""
--    SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/gentables
--    BINARY_DIR ${CMAKE_CURRENT_BINARY_DIR}/gentables
--    INSTALL_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/gentables/make_tables.exe "${CMAKE_BINARY_DIR}/"
+-    SOURCE_DIR ${GENTAB_SDIR}
+-    BINARY_DIR ${GENTAB_BDIR}
+-    CONFIGURE_COMMAND
+-        "${CMAKE_COMMAND}" -DCMAKE_VERBOSE_MAKEFILE=${CMAKE_VERBOSE_MAKEFILE} -G "${CMAKE_GENERATOR}" -B "${GENTAB_BDIR}" "${GENTAB_SDIR}"
+-    BUILD_COMMAND
+-        "${CMAKE_COMMAND}" --build "${GENTAB_BDIR}"
+-    INSTALL_COMMAND ${GENTAB_BDIR}/make_tables.exe "${CMAKE_BINARY_DIR}/"
 -)
 -add_dependencies(libfluidsynth-OBJ gentables)
++
 -- 
-2.14.5
+2.21.1
 
-- 
2.17.1

