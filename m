Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.2547.1590867132391383020
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 12:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T2s0y63+;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id f5so7449948wmh.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 May 2020 12:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xQ2VkLsAmvuf6p33WCLN5HzKPi76uYJsy9QuMpesZ8=;
        b=T2s0y63+AYjtf5oYbDs8nEuIL5vs+bi2eSpKWpezU/1Y9FySwabUgqdvSJVefP+R3h
         XqtlZIs+vgEDB4O4nufYMne2FY+9JVl4Llo5A7MHgubo5YYg7KjpuQX480Yoy0u0iALJ
         chGzj2bM9iOTevdMnityOTTAFyTGEBYKa8jAgF6lyQTI5Z+bInYSvaJ0/Wb9Gfa8eWYk
         CREEJKPtZV/U2KF9vWA43Ad3YGX/oYKntnzLuwxxXyF8M48ygXG/WW6ODsc62V6qHY2R
         +W0MFnpHDYMmgew3P8sqxa/ompcKYwGlfN/+SvpgWwpqh1VH0ipR1AuLbuv/NK4hlUOs
         zIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7xQ2VkLsAmvuf6p33WCLN5HzKPi76uYJsy9QuMpesZ8=;
        b=U5xYGNll8OTbvkacpucKAN6aIRlhv4n2Gdt5dF1OE9dJaI0vT0N/u5GyYs4uXgVEw5
         FeepwlbNAm3LGyKLpCclL/BwIzk3z5OCGkx5aq0X6jfBsCD65YEbcj2RQv8RO/NzxtK9
         KZ5ZRhDjTt/dIKHBpOc8VMc4RvERPI0Ju1F6bYKZI751r8qWa/fcvm/MKIlJwuqnEAyt
         Hx3f+2YIizTbzkp2O5WHmY7r6vTgiNKumSZi1HCPifyCowzfPsu7jexNqDjxCVNEt/fk
         rNWbt0YmIMlR1XDb18jeXLL5TK2CZcQrcmk6FHLTPBX5E1nI8nYVp8naoK6FIty1slLJ
         aKKQ==
X-Gm-Message-State: AOAM531q8+u3MAZhI/9/VYKbXfaKtd8Nt+FNNE792F83ut9O/6HSCu7/
	boMrwH0GSY16kTE+LsQt8sbxYaUS1yg=
X-Google-Smtp-Source: ABdhPJzEXJatxgw7ZRS2KQy/xb8cShYy2iNaN3RkJevxwv2II3eTWFdKX7PDP3yWw6BNZBkMLz5fhw==
X-Received: by 2002:a1c:1d49:: with SMTP id d70mr14401104wmd.49.1590867130510;
        Sat, 30 May 2020 12:32:10 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f0efa15b564ce5cfb271ba2.dip0.t-ipconnect.de. [2003:f0:7f0e:fa15:b564:ce5c:fb27:1ba2])
        by smtp.gmail.com with ESMTPSA id 128sm4784404wme.39.2020.05.30.12.32.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 12:32:09 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fluidsynth: upgrade 2.1.2 -> 2.1.3
Date: Sat, 30 May 2020 21:31:55 +0200
Message-Id: <20200530193155.11385-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

* fix a cross-compilation failure from Win32 to WinARM (#630)
* fix issues while fluid_player is seeking (#634, #646)
* fix a NULL pointer dereference if synth.dynamic-sample-loading is enabled (#635)
* fix a NULL pointer dereference in delete_rvoice_mixer_threads() (#640)
* fix a NULL pointer dereference in the soundfont loader (#647, thanks to @jjceresa)
* fix dsound driver playing garbage when terminating fluidsynth (#642, thanks to @jjceresa)
* avoid memory leaks when using libinstpatch (#643)

[1] https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.3

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../fluidsynth/fluidsynth.inc                 |  4 +--
 ...tables-helper-we-have-to-use-native-.patch | 32 +++++++++++++------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index 73858b020..fcc9df8c3 100644
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
index 44612275c..cc73bdb1d 100644
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
2.21.1

