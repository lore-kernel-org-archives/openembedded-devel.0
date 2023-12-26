Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4040EC46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 06:33:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.75880.1703572377753991739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 22:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ul5pYGXH;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d5b159350so831135e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Dec 2023 22:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703572376; x=1704177176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGhcrbvn7Bmj5ioxFNFgcy7anSHlwrn2PIZfzF8hYTE=;
        b=Ul5pYGXHt8wIm5UrYPTzwnNn+0cFf4IdatALoNj94iVRH0ge8cZWfLpciMYkuIhQaI
         IFo00zbZIXz5fePPKuEmBp0PdvrbPjULI97E0Wh7hlrO2liLA67Inr0bLXS4skJ4pwy0
         1qBUWdKj0Vp9nuGSV6V/FOk6aLmN/PmJoMpNThohNujWbDmLoU7zcy9bReR/kqyYnr9c
         OTwRsE4eVVq0blCEW0rKNLhSBeifI+B9n/7DSi25LCXr7u4Ebcso4ZG6LFIE6jkABat+
         RCPhX2/C1Y2d2EzW8cQDMhI/JghNs6efdHeHRVUe1Hp5/SP5S0zyenq+mDumsw7BzU+D
         tHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703572376; x=1704177176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGhcrbvn7Bmj5ioxFNFgcy7anSHlwrn2PIZfzF8hYTE=;
        b=HBk3ZDXo+S3gKO5VVCaKecp4Td2xcJp8GT1TqZHFHQhJyImmYWPREnqjz1NasVWxI7
         gJ9k4/malL0NZQtpJlicfzAHlOaWXPZBYYuONL7LHJ3mt6mBX4FP6Yh9n6g4L5h/fU6X
         NNSO+O6XFda+3q75fGBt7wrvEHzLDRcKv2l5hcYvqUIva2HCnvFYLJNYeyZGr4/xB130
         g2WE6ET+QUJTYKtgl+P3saHte9+dyQQq2vBVRZYgCJKuEcqHXS+TqFBtWCDZZJUtnSRm
         eucOWGOHuikHau1ZAoxo2FaIWihJs6U1CtnN2RWfeMneKLO+7WrL1mXs6eL7e3RLFMV8
         OHFA==
X-Gm-Message-State: AOJu0YzWvd9XItdKRuFNRFbOXYtb8FcLtGF3+cDSmy+aBrDsYzw/XqwD
	W0ovoeyQpBUoYT+kv5DJmkVdasDIjkw=
X-Google-Smtp-Source: AGHT+IGrylUVhfshEaq/WeG8oPceSJMgwqnkY2xG22DXhGtwr/7KW2W9zmN30bvy4yPvhdCKswz9mA==
X-Received: by 2002:a05:600c:705:b0:40d:47b5:8e3 with SMTP id i5-20020a05600c070500b0040d47b508e3mr3238302wmn.31.1703572375352;
        Mon, 25 Dec 2023 22:32:55 -0800 (PST)
Received: from localhost.localdomain ([176.88.106.122])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600c314500b0040b2a52ecaasm27315831wmo.2.2023.12.25.22.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 22:32:54 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] libharu: upgrade 2.3.0 -> 2.4.4
Date: Tue, 26 Dec 2023 09:32:50 +0300
Message-Id: <20231226063250.35258-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 06:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107784

* Dropped patches because fixed in the new version.

Changelog:

* Add copy hpdf_namedict.h at install
* Added page boundary support.
* fixed glyph index to be 16 bit unsigned instead of signed
* Bug fixes
* Shared library has an SOVERSION now
* Fixed HPDF_FToA for small values
* Add static hpdf_version.h header
* hpdf_version.h included again
* File attachment issue resolved
* Renamed *_LIBZ defines to _*ZLIB, enables compression of PDF files again.
* Reinstated hpdf_version.h
* Fixed library name
* Set correct version number
* Add support for free-form triangle shading objects.
* Fix config constant to match use in hpdf_mmgr.c
* Improve small number writing in HPDF_FToA.
* Fix missing /CapHeight key in font definition
* Change HPDF_Page_CreateXObjectFromImage zoom parameter type to HPDF
* Fix another case of png files with background mask save uncompressed
* Avoid issue with libtiff duplicate symbols
* Reajust bit_depth of png image after striping depth from 16 to 8.
* Fixed typo in Japanese font name: Mincyo -> Mincho
* Fix various typos
* hpdf.h: add missing HPDF_Boolean typedef
* Moved to a CMake only build environment.
* Fix bad unicode in comment
* Fix various typos

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...ib-into-var-libdir-rather-than-hardc.patch | 30 -----------
 .../libharu/libharu-RELEASE_2_3_0_cmake.patch | 52 -------------------
 .../recipes-support/libharu/libharu_2.3.0.bb  | 24 ---------
 .../recipes-support/libharu/libharu_2.4.4.bb  | 16 ++++++
 4 files changed, 16 insertions(+), 106 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libharu/libharu/0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch
 delete mode 100644 meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
 delete mode 100644 meta-oe/recipes-support/libharu/libharu_2.3.0.bb
 create mode 100644 meta-oe/recipes-support/libharu/libharu_2.4.4.bb

diff --git a/meta-oe/recipes-support/libharu/libharu/0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch b/meta-oe/recipes-support/libharu/libharu/0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch
deleted file mode 100644
index 0947de196..000000000
--- a/meta-oe/recipes-support/libharu/libharu/0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9341ac4f6ae38efe95dfd188105a9ea30941ccf6 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Wed, 18 Nov 2020 23:09:51 +0900
-Subject: [PATCH] Install static lib into var-libdir rather than hardcod lib.
-
-Lei Maohui <leimaohui@cn.fujitsu.com>
-
-Upstream-Status: Pending
----
- src/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index 249916c..fb06ea3 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -75,8 +75,8 @@ if(LIBHPDF_STATIC)
-   target_link_libraries(${LIBHPDF_NAME_STATIC} ${ADDITIONAL_LIBRARIES})
-   install(
-     TARGETS ${LIBHPDF_NAME_STATIC}
--    ARCHIVE DESTINATION lib
--    LIBRARY DESTINATION lib
-+    ARCHIVE DESTINATION ${LIB_INSTALL_DIR}
-+    LIBRARY DESTINATION ${LIB_INSTALL_DIR}
-     RUNTIME DESTINATION bin
-   )
-   if(WIN32 AND NOT CYGWIN)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch b/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
deleted file mode 100644
index 05f78ed73..000000000
--- a/meta-oe/recipes-support/libharu/libharu/libharu-RELEASE_2_3_0_cmake.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Backport from Fedora Project.
-https://src.fedoraproject.org/rpms/libharu
-
-Fix the install destination of some files.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
-
-diff -urp libharu-RELEASE_2_3_0/CMakeLists.txt libharu-RELEASE_2_3_0_cmake/CMakeLists.txt
---- libharu-RELEASE_2_3_0/CMakeLists.txt	2013-10-30 20:11:59.000000000 +0700
-+++ libharu-RELEASE_2_3_0_cmake/CMakeLists.txt	2017-06-01 15:56:06.533552795 +0700
-@@ -25,7 +25,7 @@ endif(MSVC)
- 
- # information about libharu
- set(LIBHPDF_MAJOR 2)
--set(LIBHPDF_MINOR 2)
-+set(LIBHPDF_MINOR 3)
- set(LIBHPDF_PATCH 0)
- set(LIBHPDF_VERSION ${LIBHPDF_MAJOR}.${LIBHPDF_MINOR}.${LIBHPDF_PATCH})
- set(LIBHPDF_DESCRIPTION "libHaru is a free, cross platform, open source library for generating PDF files.")
-@@ -210,9 +210,9 @@ set(
- install(FILES ${haru_HDRS} DESTINATION include)
- 
- # install various files
--install(FILES README CHANGES INSTALL DESTINATION .)
-+install(FILES README CHANGES INSTALL DESTINATION ${SHARE_INSTALL_PREFIX}/libharu)
- if(NOT DEVPAK)
--  install(DIRECTORY if DESTINATION .)
-+  install(DIRECTORY if DESTINATION ${SHARE_INSTALL_PREFIX}/libharu)
- endif(NOT DEVPAK)
- if(DEVPAK)
-   install(FILES ${CMAKE_BINARY_DIR}/libharu.DevPackage DESTINATION .)
-diff -urp libharu-RELEASE_2_3_0/src/CMakeLists.txt libharu-RELEASE_2_3_0_cmake/src/CMakeLists.txt
---- libharu-RELEASE_2_3_0/src/CMakeLists.txt	2013-10-30 20:11:59.000000000 +0700
-+++ libharu-RELEASE_2_3_0_cmake/src/CMakeLists.txt	2017-06-01 16:08:45.425105746 +0700
-@@ -90,11 +90,13 @@ if(LIBHPDF_SHARED)
-   target_link_libraries(${LIBHPDF_NAME} ${ADDITIONAL_LIBRARIES})
-   if(WIN32 AND NOT CYGWIN)
-   	set_target_properties(${LIBHPDF_NAME} PROPERTIES DEFINE_SYMBOL HPDF_DLL_MAKE)
-+  else(WIN32 AND NOT CYGWIN)
-+  	set_target_properties(${LIBHPDF_NAME} PROPERTIES SOVERSION ${LIBHPDF_VERSION})
-   endif(WIN32 AND NOT CYGWIN)
-   install(
-     TARGETS ${LIBHPDF_NAME}
--    ARCHIVE DESTINATION lib
--    LIBRARY DESTINATION lib
-+    ARCHIVE DESTINATION ${LIB_INSTALL_DIR}
-+    LIBRARY DESTINATION ${LIB_INSTALL_DIR}
-     RUNTIME DESTINATION bin
-   )
- endif(LIBHPDF_SHARED)
diff --git a/meta-oe/recipes-support/libharu/libharu_2.3.0.bb b/meta-oe/recipes-support/libharu/libharu_2.3.0.bb
deleted file mode 100644
index 7477c5f03..000000000
--- a/meta-oe/recipes-support/libharu/libharu_2.3.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "free PDF library"
-HOMEPAGE = "http://libharu.org"
-DESCRIPTION = "libHaru is a library for generating PDF files. \
-               It is free, open source, written in ANSI C and cross platform. "
-
-LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://README;md5=3ee6bc1f64d9cc7907f44840c8e50cb1"
-
-SRC_URI = "git://github.com/libharu/libharu.git;branch=2_3;protocol=https \
-           file://libharu-RELEASE_2_3_0_cmake.patch \
-           file://0001-Install-static-lib-into-var-libdir-rather-than-hardc.patch \
-	   "
-
-SRCREV = "4ae1d5f4c84459f130bf1b1ef4c5c330af8eca5d"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-DEPENDS += "libpng zlib"
-
-do_install:append() {
-     mkdir -p ${D}/${datadir}/libharu
-     mv ${D}/libharu ${D}/${datadir}
-}
diff --git a/meta-oe/recipes-support/libharu/libharu_2.4.4.bb b/meta-oe/recipes-support/libharu/libharu_2.4.4.bb
new file mode 100644
index 000000000..02dc499e0
--- /dev/null
+++ b/meta-oe/recipes-support/libharu/libharu_2.4.4.bb
@@ -0,0 +1,16 @@
+SUMMARY = "free PDF library"
+HOMEPAGE = "http://libharu.org"
+DESCRIPTION = "libHaru is a library for generating PDF files. \
+               It is free, open source, written in ANSI C and cross platform. "
+
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=924546dab2bef90e370d7c0c090ddcf0"
+
+DEPENDS += "libpng zlib"
+
+SRC_URI = "git://github.com/libharu/libharu.git;branch=master;protocol=https"
+SRCREV = "0c598becaadaef8e3d12b883f9fc2864a118c12d"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
-- 
2.25.1


