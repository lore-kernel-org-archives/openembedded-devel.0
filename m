Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC54C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 18:10:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.4386.1704737427143870314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 10:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cqcdbavq;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e461c1f44so14042055e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 10:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704737425; x=1705342225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y41QRry6ck4AApe0zBWMY2PZEjmZ0UzJ2ovtYg7oToY=;
        b=cqcdbavqbwBroUNl1z9oCD+7MrJ5ATdSUINHWWNCDBgECT+b5fOs3qIfOF5EMPVqCM
         DGQXs+P3Iv4aaIAYg+7uu7RM0bp+umXPPhxEZ2KXWgifKmJn7HPFVdW5TecYIrpoMn8z
         uBuewFXcJz4ntIP5T66Efe/M8Mll/ftF6DHcbyI1XRo+p6vEnCAVw/eg8jxYTqSmVkad
         j95RoQ391UrMvWpUHJr/hFja+xs29bp+11YyZqM4uVYrlBMGR65kYxfjWzmQkAYS6NxD
         wpdENay5U1n3MvATLCARxiQ8vFmfoea0QlIsDbcpj87L/hOyffg4dzBywa20M3EHCn0d
         E+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704737425; x=1705342225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y41QRry6ck4AApe0zBWMY2PZEjmZ0UzJ2ovtYg7oToY=;
        b=HODF0iuNWbCxKUJf+c42YjBLRgsd7020Y3+WvaQn5458ytfBY1D/F+tRcWSy9+sjDh
         YQjQKmcJpF89sMkxHTHYFsGOk+zVN3NOWInQ4RPyJyU2qzxNUflICeb3osgIyPGvPh6w
         0XT0NcvQnBkljbTky/HBV1GWwXA7h3Cn8B59rVVnXDXB9SJ3FcKl55NDVC/OKY6RnS5F
         mw3CtOoS1TZJXLPYrPfUBxJjTm5Y41lUVWsGeJG8A3232KdC3CfWlQepBKJto8MUIuWK
         Z9RCGjq+RMtFbXXQnKpZb6Rg23haojG+6Dtd7u1LrWf/CwSIc4wviEnJnnzNXNk+obyu
         WVxw==
X-Gm-Message-State: AOJu0YwjRRRig9TcDbSevCP0FkB3bW10g6mBwNcQiI7MWQjvVkxx49Yx
	cUMDygbbfsmUVn2ulkbzOUDrhbh20XBuLA==
X-Google-Smtp-Source: AGHT+IHfTxSOyaOHrQlFwkWn9vuW2RtHS4f5Y8wYFlwafad1EB46Jo5DiArUnamS1kAeg08OxXeDJg==
X-Received: by 2002:a05:600c:4f91:b0:40d:39cb:6af6 with SMTP id n17-20020a05600c4f9100b0040d39cb6af6mr2244560wmq.28.1704737424679;
        Mon, 08 Jan 2024 10:10:24 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.25])
        by smtp.gmail.com with ESMTPSA id c15-20020a5d4ccf000000b00336765e9babsm255920wrt.83.2024.01.08.10.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 10:10:24 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv3] wavpack: upgrade 5.1.0 -> 5.6.0
Date: Mon,  8 Jan 2024 21:10:14 +0300
Message-Id: <20240108181014.321844-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 18:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108170

* Added patches to fix -> unversioned.so was causing incorrect packaging and errors.

* Added openssl as a depends because trying to link with native libcrypto in some builds -> lib32-wavpack/5.6.0/recipe-sysroot-native/usr/lib/libcrypto.so: file not recognized: file format not recognized

* License-Update: Copyright year changes

Changelog:

* added: AIFF file import/export support
* added: WATCOM compiler and OS/2 support
* added: cmake support for mingw, builds Cooledit + Winamp plugins
* added: --force-even-byte-depth option for rounding up bit depths
* fixed: detect and report PCM files having non-zero padding bits
* fixed: possible crash when displaying long channel assignments
* fixed: big-endian-sourced "raw" files gave big-endian "wav"s
* fixed: numerous minor issues
* fixed: CVE-2021-44269 (encoding crafted DSD file triggers OOB read crash)
* fixed: very long filenames cause stack-overflow crash in all CLI programs
* fixed: the length stored in WAV headers not always corrected when using -i
* fixed: attempting to encode raw DSD audio from stdin sometimes causes crash
* fixed: DSD to PCM decimation: small clicks between tracks and tiny DC offset
* fixed: length update in library-generated WAV headers on big-endian machines
* fixed: sanitize custom extensions read from WavPack files to be alphanumeric
* added: accepting brace-delimited options in the wavpack executable filename
* added: "--drop" option to Windows executables for multi-file "drag-and-drop"
* added" "--raw-pcm" option to wvunpack executable (does DSD --> 24-bit PCM)
* added: "--no-overwrite" option to wavpack executable (to resume sessions)
* improved: build system clean-up including switch to non-recursive "make"
* fixed: potential security issue CVE-2020-35738
* fixed: disable A32 asm code when building for Apple silicon
* fixed: issues with Adobe-style floating-point WAV files
* added: -vv option to wvunpack to quickly verify using just
     block checksums (ideal for detecting corrupted files)
* added: --normalize-floats option to wvunpack for correctly
     exporting un-normalized floating-point files
* updated: Visual Studio 2019 for Windows builds
* dropped: WinXP support in official binaries
* fixed: OSS-Fuzz issues 19925, 19928, 20060, 20448
      (no CVEs or vulnerabilities)
* fixed: trailing garbage characters on imported ID3v2 TXXX tags
* fixed: various minor undefined behavior and memory access issues
* fixed: sanitize tag extraction names for length and path inclusion
* improved: reformat wvunpack "help" and split into long + short versions
* added: regression testing to Travis CI for OSS-Fuzz crashers
* fixed: potential security issues including the following CVEs:
     CVE-2018-19840 CVE-2018-19841 CVE-2018-10536
     CVE-2018-10537 CVE-2018-10538 CVE-2018-10539
     CVE-2018-10540 CVE-2018-7254  CVE-2018-7253
     CVE-2018-6767
* added: support for CMake, Travis CI, and Google's OSS-fuzz
* fixed: use correction file for encode verify (pipe input, Windows)
* fixed: correct WAV header with actual length (pipe input, -i option)
* fixed: thumb interworking and not needing v6 architecture (ARM asm)
* added: handle more ID3v2.3 tag items and from all file types
* fixed: coredump on Sparc64 (changed MD5 implementation)
* fixed: handle invalid ID3v2.3 tags from sacd-ripper
* fixed: several corner-case memory leaks

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...act-libtool-and-convert-to-soversion.patch | 35 +++++++++++++++++++
 .../files/set-soversion-and-version.patch     | 26 ++++++++++++++
 .../wavpack/wavpack_5.1.0.bb                  |  9 -----
 .../wavpack/wavpack_5.6.0.bb                  | 18 ++++++++++
 4 files changed, 79 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/wavpack/files/extract-libtool-and-convert-to-soversion.patch
 create mode 100644 meta-oe/recipes-multimedia/wavpack/files/set-soversion-and-version.patch
 delete mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
 create mode 100644 meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb

diff --git a/meta-oe/recipes-multimedia/wavpack/files/extract-libtool-and-convert-to-soversion.patch b/meta-oe/recipes-multimedia/wavpack/files/extract-libtool-and-convert-to-soversion.patch
new file mode 100644
index 000000000..11e45938d
--- /dev/null
+++ b/meta-oe/recipes-multimedia/wavpack/files/extract-libtool-and-convert-to-soversion.patch
@@ -0,0 +1,35 @@
+From 25e12cf5918884f232cebc34c92bd548fe40c2b3 Mon Sep 17 00:00:00 2001
+From: Anonymous Maarten <anonymous.maarten@gmail.com>
+Date: Fri, 9 Dec 2022 19:13:09 +0100
+Subject: [PATCH] cmake: extract libtool from configure.ac and convert to
+ SOVERSION
+
+Upstream-Status: Backport [https://github.com/dbry/WavPack/commit/25e12cf5918884f232cebc34c92bd548fe40c2b3]
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index adc73b09..7ae5043f 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -2,6 +2,18 @@ cmake_minimum_required(VERSION 3.2)
+ 
+ project(WavPack VERSION 5.6.0)
+ 
++file(READ "${CMAKE_CURRENT_SOURCE_DIR}/configure.ac" CONFIGURE_AC)
++string(REGEX MATCH "LT_CURRENT=([0-9]+)" LT_CURRENT "${CONFIGURE_AC}")
++set(LT_CURRENT "${CMAKE_MATCH_1}")
++string(REGEX MATCH "LT_REVISION=([0-9]+)" LT_REVISION "${CONFIGURE_AC}")
++set(LT_REVISION "${CMAKE_MATCH_1}")
++string(REGEX MATCH "LT_AGE=([0-9]+)" LT_AGE "${CONFIGURE_AC}")
++set(LT_AGE "${CMAKE_MATCH_1}")
++
++math(EXPR SOVERSION_MAJOR "${LT_CURRENT}-${LT_AGE}")
++math(EXPR SOVERSION_MINOR "${LT_AGE}")
++math(EXPR SOVERSION_MICRO "${LT_REVISION}")
++
+ # Languages
+ 
+ include(CheckLanguage)
diff --git a/meta-oe/recipes-multimedia/wavpack/files/set-soversion-and-version.patch b/meta-oe/recipes-multimedia/wavpack/files/set-soversion-and-version.patch
new file mode 100644
index 000000000..faddb7b75
--- /dev/null
+++ b/meta-oe/recipes-multimedia/wavpack/files/set-soversion-and-version.patch
@@ -0,0 +1,26 @@
+From 7c1dd729302b7f77f65884df4e79301df1490423 Mon Sep 17 00:00:00 2001
+From: Anonymous Maarten <anonymous.maarten@gmail.com>
+Date: Fri, 9 Dec 2022 19:23:51 +0100
+Subject: [PATCH] cmake: set SOVERSION and VERSION property of wavpack
+
+This is used to version .so libraries on Linux
+
+Upstream-Status: Backport [https://github.com/dbry/WavPack/commit/7c1dd729302b7f77f65884df4e79301df1490423]
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 7ae5043f..285b295b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -361,6 +361,8 @@ if(BUILD_SHARED_LIBS)
+         target_link_directories(wavpack PRIVATE "-Wl,-exported_symbols_list,${CMAKE_CURRENT_BINARY_DIR}/libwavpack.sym")
+     endif()
+   else()
++    set_target_properties(wavpack PROPERTIES SOVERSION "${SOVERSION_MAJOR}")
++    set_target_properties(wavpack PROPERTIES VERSION "${SOVERSION_MAJOR}.${SOVERSION_MINOR}.${SOVERSION_MICRO}")
+     set(CONFTTEST_CONTENTS "VERS_1 {\n    global: sym;\n};\n\nVERS_2 {\n    global: sym;\n} VERS_1;\n")
+     file(WRITE ${PROJECT_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/conftest.map "${CONFTTEST_CONTENTS}")
+     check_c_linker_flag("-Wl,--version-script=${PROJECT_BINARY_DIR}/${CMAKE_FILES_DIRECTORY}/conftest.map" COMPILER_SUPPORTS_SYMBOL_MAPS)
diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
deleted file mode 100644
index 909612393..000000000
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.1.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "WavPack is a completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode."
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://license.txt;md5=8c1a910e5c2a8b30ec8ffb2ffa63d9b2"
-
-SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https"
-SRCREV = "9ccc3fe4a37d069137ceabe513a4dd9b0a09c1c2"
-S = "${WORKDIR}/git"
-
-inherit autotools lib_package
diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
new file mode 100644
index 000000000..6773c1d97
--- /dev/null
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.6.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "WavPack is a completely open audio compression format providing lossless, high-quality lossy, and a unique hybrid compression mode."
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://license.txt;md5=bb5d037e3ad41a3c84c9f2d8bb65a7b4"
+
+DEPENDS = "openssl"
+
+SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https \
+	    file://set-soversion-and-version.patch \
+	    file://extract-libtool-and-convert-to-soversion.patch \
+	   "
+
+SRCREV = "e03e8e29dc618e08e7baba9636e57ba1254874ce"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE += "-DWAVPACK_INSTALL_DOCS=OFF -DBUILD_SHARED_LIBS=ON"
-- 
2.25.1


