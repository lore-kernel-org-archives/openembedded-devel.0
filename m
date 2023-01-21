Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECFDC54EB6
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.2123.1674324088066323550
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qnn4nKfX;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id u1-20020a17090a450100b0022936a63a21so11896070pjg.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kemONC4zWzB5LfUGGhzGgvYbITs7ImRyCupBEftI+ng=;
        b=qnn4nKfXHviM0IA6esOrBs3773ksoRPEb+MW2Z0raohI4I8mlJWp7wrsNJbVsCamk/
         VSl6HX0zRwH+ADvlDKHRGX1uE6vm51wbGPjh9QZq9WwrHjx66UL28ZckNMXArYglWZ3u
         zLV27LtSpRZhDeRA+nbuSv6azZcb86oOpm5FHwyLVND7BchiuOqh3Hj9p5ZmQMRyUX4h
         sRex2BBIlZKgW9UWFvzL8CuXuN/0sezeKtdaekIXw3tXDa8Z4jv0eF+enYMQ59MMEb6t
         kT1wleMiykL83VrYMShp9QnwW6eYnUpYy8zMjbxk4AxgmXjzA3b8d0qJXtBOMAmZ95+Q
         i+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kemONC4zWzB5LfUGGhzGgvYbITs7ImRyCupBEftI+ng=;
        b=jlB2DEOiOI4WsdCVG3Zx4gCawlOdJpO5UZmya0emv85syj3jwNSAKzH8jmc3AgMOY7
         4WS03TiF+eMnOYrQW5dCZMrh/1TCjm0f4raM/soj0WIXHsqfXSQyeuiDAiWbOQFkeu4w
         oWZJOAr9xyhJsx6dQRhZdTxZT8cRmh3tkMj3ZTYy36b3ssyyjDFs1aiXO5gghrea+sUt
         6mb8N7B2UklbhiAxYfoeihgixyqE2TmD0219437P0ABAmuSBhFug2JGsysVpqp9kb3Fr
         +4A5J1fv9z8q6dIoyORqGhsWGy8K1670nrFbYyKuik51hCNjmMRRiZGeUBv45H9/wWj6
         b3ow==
X-Gm-Message-State: AFqh2ko1mtZdhcUxOrDUirX21F+Ddug2l42mPmuig4wJyUh7gGEHQgCK
	By1CNMWiC/+xUjqwkvfkOptZBSMBmc5XJg==
X-Google-Smtp-Source: AMrXdXsuQsDY5FRTkOZtr6f2lDkkcLPcHuBD9j0sYpIp7x4sxCaRpXtLVPVWEyozUALCW/mhskU/7A==
X-Received: by 2002:a17:90a:9409:b0:229:1de8:3cfd with SMTP id r9-20020a17090a940900b002291de83cfdmr19595239pjo.29.1674324087187;
        Sat, 21 Jan 2023 10:01:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/30] p8platform: Fix build with c++17 clang
Date: Sat, 21 Jan 2023 10:00:55 -0800
Message-Id: <20230121180121.1229895-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100671

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-resulting-cmake-config-relocatable.patch | 64 -------------------
 .../p8platform/p8platform_git.bb              |  7 +-
 2 files changed, 3 insertions(+), 68 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/p8platform/files/0001-Make-resulting-cmake-config-relocatable.patch

diff --git a/meta-oe/recipes-extended/p8platform/files/0001-Make-resulting-cmake-config-relocatable.patch b/meta-oe/recipes-extended/p8platform/files/0001-Make-resulting-cmake-config-relocatable.patch
deleted file mode 100644
index 9ff85b12a3..0000000000
--- a/meta-oe/recipes-extended/p8platform/files/0001-Make-resulting-cmake-config-relocatable.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 2650bb3bd3644784359be373252b0436873ca8cb Mon Sep 17 00:00:00 2001
-From: Pascal Bach <pascal.bach@siemens.com>
-Date: Fri, 28 Sep 2018 16:44:37 +0200
-Subject: [PATCH] Make resulting cmake config relocatable
-
-This change avoids hardcoded install prefix in the p8-platform-config.cmake.
-Especially important when doing cross compilation with Yocto for example.
-
-Upstream-Status: Submitted [https://github.com/Pulse-Eight/platform/pull/38]
-
----
- CMakeLists.txt              |  4 ----
- p8-platform-config.cmake.in | 13 +++++++++----
- 2 files changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 7144b0b..f2db66e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -22,10 +22,6 @@ if(WIN32)
-                    src/windows/os-threads.cpp)
- endif()
- 
--set(p8-platform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/p8-platform")
--IF(WIN32)
--  LIST(APPEND p8-platform_INCLUDE_DIRS "${CMAKE_INSTALL_PREFIX}/include/p8-platform/windows")
--ENDIF(WIN32)
- set(p8-platform_LIBRARIES ${CMAKE_THREAD_LIBS_INIT})
- 
- if(NOT ${CORE_SYSTEM_NAME} STREQUAL "")
-diff --git a/p8-platform-config.cmake.in b/p8-platform-config.cmake.in
-index 47f30f1..b08e96c 100644
---- a/p8-platform-config.cmake.in
-+++ b/p8-platform-config.cmake.in
-@@ -9,17 +9,22 @@
- #  p8-platform_LIBRARY_DIRS - directories in which the libraries are situated
- #
- # propagate these properties from one build system to the other
-+get_filename_component(_p8-platform_rootdir ${CMAKE_CURRENT_LIST_DIR}/../ ABSOLUTE)
-+
- set (p8-platform_VERSION "@p8-platform_VERSION_MAJOR@.@p8-platform_VERSION_MINOR@")
--set (p8-platform_INCLUDE_DIRS @p8-platform_INCLUDE_DIRS@ @CMAKE_INSTALL_PREFIX@/include)
--set (p8-platform_LIBRARY_DIRS "@CMAKE_LIBRARY_OUTPUT_DIRECTORY@")
-+set (p8-platform_INCLUDE_DIRS "${_p8-platform_rootdir}/include" "${_p8-platform_rootdir}/include/p8-platform")
-+if(WIN32)
-+  list(APPEND p8-platform_INCLUDE_DIRS "${_p8-platform_rootdir}/include/p8-platform/windows")
-+endif(WIN32)
-+set (p8-platform_LIBRARY_DIRS "${_p8-platform_rootdir}")
- set (p8-platform_LINKER_FLAGS "@p8-platform_LINKER_FLAGS@")
- set (p8-platform_CONFIG_VARS "@p8-platform_CONFIG_VARS@")
- 
- # libraries come from the build tree where this file was generated
- if(WIN32)
--  set (p8-platform_LIBRARY "@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@/p8-platform.lib")
-+  set (p8-platform_LIBRARY "${_p8-platform_rootdir}/p8-platform.lib")
- else(WIN32)
--  set (p8-platform_LIBRARY "-L@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_LIBDIR@ -lp8-platform")
-+  set (p8-platform_LIBRARY "-L${_p8-platform_rootdir} -lp8-platform")
- endif(WIN32)
- set (p8-platform_LIBRARIES ${p8-platform_LIBRARY} "@p8-platform_LIBRARIES@")
- mark_as_advanced (p8-platform_LIBRARY)
--- 
-2.11.0
-
diff --git a/meta-oe/recipes-extended/p8platform/p8platform_git.bb b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
index 1307f6dc4a..bb9574feb2 100644
--- a/meta-oe/recipes-extended/p8platform/p8platform_git.bb
+++ b/meta-oe/recipes-extended/p8platform/p8platform_git.bb
@@ -4,11 +4,10 @@ HOMEPAGE = "http://libcec.pulse-eight.com/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://src/os.h;md5=752555fa94e82005d45fd201fee5bd33"
 
-PV = "2.1.0.1"
+PV = "2.1.0.1+git${SRCPV}"
 
-SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https \
-           file://0001-Make-resulting-cmake-config-relocatable.patch"
-SRCREV = "2d90f98620e25f47702c9e848380c0d93f29462b"
+SRC_URI = "git://github.com/Pulse-Eight/platform.git;branch=master;protocol=https"
+SRCREV = "a7cd0d5780ed80a4e70480d1650749f29e8a1fb2"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.1


