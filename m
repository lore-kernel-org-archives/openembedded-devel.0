Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9073C83F09
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 06:46:41 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.2347.1752129991819464971
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 23:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QYQVQwxe;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-32f1763673cso7496241fa.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 23:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752129989; x=1752734789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6vfZtXi1wEzGhVhjc3UqC7C0gVI5VGC04PK0VCWwl0=;
        b=QYQVQwxe4X3vh39wIUvxthEF5dqdBZzeT6XCSyqe4ycW0VNTdetMdioERBYVJ83fxs
         sxST1WJp5i116VC+geUgfvqt3nnWrR3BzsRxhg6EWJk1IZGweB3U2dXtROso+Y8vRKdz
         MZqlebx8pptHkgDpmOYH1jxokjL8edALE2LT7Ce+Ud9/OnX8zKIgZ2m87lriWXhY7kFg
         CgEIGP0vW6J6XeClEI+UGeGVt6DoZLVxCt3T8j2nLDo7sZ3D5QkxUl0J/uEghuvGZdMW
         eGZjaj1sArRwpzaXR8kx3s18B4GFywilfrbi5W0XgE9Yb4kcSce9igB6SP+p6kfE7tQU
         /6fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752129989; x=1752734789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6vfZtXi1wEzGhVhjc3UqC7C0gVI5VGC04PK0VCWwl0=;
        b=mqB2dXEbF8h7nfmfCmHd5rbSfyPUXRCHd8QANkYpuUqLjrJtLijdJVDKsC2FtFs0VT
         gCV8QcGdVod+TrxWbP6Id9Ug+PtbST8O8M9+F75hJCNQCrFGLCXks6Yn/jW+YZn3H2QQ
         /Ll03TqHbbtPLoPxPcyTtsynj2yYMlKE7BUeQUQjqoP6/b4VFSv4X2ju+uAgUefuahbF
         ceQPhGFxenKkjlqXTs+TED4SMuA/kDw8ffNhw49x61C6RvrrDHBZ6IPkst5aEJZdNJ2B
         eKn5OLOArSSFlch+mPBuj3DtT4sfndbgVUAJgt83FEj21j9fgxwyBrG5t9wTjFZENulB
         Qv1w==
X-Gm-Message-State: AOJu0Yw3n8p265iUOSCd5chFMJG332+f12eXMWDUbIC8JfxoMjCReUKs
	qfGEbzfaKLJPi0HmGatxspSmcL6wSsEuWTDydjIv05ryk1jOSHgD/fndEXEQ3Q==
X-Gm-Gg: ASbGncs2BtchX/ORylDMRNZTVFSV+ddjeJ05r8aej1Lq6trxbuezSooWu3imBGYttNu
	bneUI0P8+6fN7tVjkW7+bhEd2R3BunjQEQkhAzLUHLfz4D3dZhCHprYjsU2W+UFCefvUtaC1Sh7
	7kKJDonH799r4lZimRB9kbdOrT11qGmkmGP+rrf9nXFYEnxM1h7dQXfz3trE5oMPPF53KiCIpgk
	uzyvsjmXRUVaApQqwwARPlNYi19J2x9fG3Vcyl6NGh57D9vDU+xTMbeXVebXPPxs0oJjy148o2/
	RfbC045Lbmka9/8Sal1EdF+91U4t3NTDBPnRyffVWPdsXpyESais/AxyQpTy1VJiJUm/iO72cZ9
	SMAcxOsMtFU09DQ==
X-Google-Smtp-Source: AGHT+IH00r7rcRCOtg0TQLHvvQmU4HoRCHXkyQ5b8eR9qXXLV8I6hY2jO+aZarl57uLzE3nfaXvWBw==
X-Received: by 2002:a05:651c:1102:b0:32a:de39:eb4c with SMTP id 38308e7fff4ca-32fad34cee3mr3520161fa.18.1752129989276;
        Wed, 09 Jul 2025 23:46:29 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa294bf63sm1708261fa.47.2025.07.09.23.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 23:46:28 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] konkretcmpi: Remove ancient/unmaintained recipe
Date: Thu, 10 Jul 2025 09:46:24 +0300
Message-ID: <20250710064624.13924-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 06:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118396

Remove the konkretcmpi recipe, as the upstream has been inactive for over 8 years.
No new releases, bug fixes or security updates.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 ...ix-lib64-can-not-be-shiped-in-64bit-.patch | 33 ---------------
 ...01-drop-including-rpath-cmake-module.patch | 40 -------------------
 .../konkretcmpi/konkretcmpi_0.9.2.bb          | 36 -----------------
 4 files changed, 110 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch
 delete mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch
 delete mode 100644 meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 54171a7b15..2df3292a85 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -346,7 +346,6 @@ RDEPENDS:packagegroup-meta-oe-extended = "\
     isomd5sum \
     jansson \
     jpnevulator \
-    konkretcmpi \
     libblockdev \
     libcec \
     libconfig \
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch
deleted file mode 100644
index 2671111b79..0000000000
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From d97ac2bf2ed9c84ffd65ff10989068b202e09fdf Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Mon, 3 Aug 2015 00:29:54 +0900
-Subject: [PATCH] CMakeLists.txt: fix lib64 can not be shiped in 64bit target
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
----
-Upstream-Status: Pending
-
- CMakeLists.txt | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index be544d1..14696e4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -11,13 +11,6 @@ set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules ${CMAKE_MODULE_P
- 
- find_package(CMPI)
- 
--# Set LIB_SUFFIX to 64 on 64bit architectures
--if(CMAKE_SIZEOF_VOID_P EQUAL 4)
--    set(LIB_SUFFIX "")
--else(CMAKE_SIZEOF_VOID_P EQUAL 4)
--    set(LIB_SUFFIX 64)
--endif(CMAKE_SIZEOF_VOID_P EQUAL 4)
--
- option(WITH_PYTHON "Build experimental Python bindings" OFF)
- 
- add_subdirectory(cmake)
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch
deleted file mode 100644
index 293706d889..0000000000
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi/0001-drop-including-rpath-cmake-module.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 45e1c4c04a126d2386446775f99084bd603016af Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 1 Jun 2017 23:10:59 -0700
-Subject: [PATCH] drop including rpath cmake module
-
-Fixes cross compilation QA errors e.g.
-/usr/lib/libkonkret.so.0.0.1 contains probably-redundant RPATH /usr/lib [useless-rpaths]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/konkret/CMakeLists.txt | 1 -
- src/program/CMakeLists.txt | 1 -
- 2 files changed, 2 deletions(-)
-
-diff --git a/src/konkret/CMakeLists.txt b/src/konkret/CMakeLists.txt
-index c2faa40..df49e11 100644
---- a/src/konkret/CMakeLists.txt
-+++ b/src/konkret/CMakeLists.txt
-@@ -8,7 +8,6 @@ set(konkret_SRCS
-     kstr.c
-     print.c
- )
--include(rpath)
- include_directories(${CMPI_INCLUDE_DIR})
- 
- add_library(libkonkret SHARED ${konkret_SRCS})
-diff --git a/src/program/CMakeLists.txt b/src/program/CMakeLists.txt
-index afcefe5..8a4646c 100644
---- a/src/program/CMakeLists.txt
-+++ b/src/program/CMakeLists.txt
-@@ -1,4 +1,3 @@
--include (rpath)
- include_directories(${CMPI_INCLUDE_DIR} ${CMAKE_SOURCE_DIR}/src)
- 
- add_executable(konkret main.cpp)
--- 
-2.13.0
-
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
deleted file mode 100644
index f3f70b8da3..0000000000
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Tool for rapid CMPI providers development"
-DESCRIPTION = "\
-KonkretCMPI makes CMPI provider development easier by generating type-safe \
-concrete CIM interfaces from MOF definitions and by providing default \
-implementations for many of the provider operations."
-HOMEPAGE = "https://github.com/rnovacek/konkretcmpi"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f673270bfc350d9ce1efc8724c6c1873"
-DEPENDS:append:class-target = " swig-native sblim-cmpi-devel python3"
-DEPENDS:append:class-native = " cmpi-bindings-native"
-
-SRC_URI = "git://github.com/rnovacek/konkretcmpi.git;branch=master;protocol=https \
-           file://0001-CMakeLists.txt-fix-lib64-can-not-be-shiped-in-64bit-.patch \
-           file://0001-drop-including-rpath-cmake-module.patch \
-           "
-
-SRCREV = "ad28225e6eceff88417a60c1ba8896c8e40f21a7"
-
-inherit cmake python3-dir
-
-EXTRA_OECMAKE = "-DWITH_PYTHON=ON \
-                 ${@oe.utils.conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
-                "
-
-do_install:append() {
-    rm -rf ${D}${datadir}
-}
-
-PACKAGES =+ "${PN}-python"
-
-RPROVIDES:${PN}-dbg += "${PN}-python-dbg"
-
-FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/konkretmof.py* ${PYTHON_SITEPACKAGES_DIR}/_konkretmof.so"
-
-BBCLASSEXTEND = "native"
-- 
2.43.0


