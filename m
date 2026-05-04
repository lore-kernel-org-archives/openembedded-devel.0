Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A583CD3427
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 22:54:53 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27512.1777935288986743760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2026 15:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Nl72F/9N;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso878425b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 15:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777935288; x=1778540088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E+0MK1TD8LHF29R/J38mIFeUjCIqs/VJGJSF3NIKwpY=;
        b=Nl72F/9NSNYqgT07P2OkRiDINF1baUz06gJEo6FPL6aqa+bqDCgsm4438t2fYF81/G
         o+Ikw4VY5QBg7XiJ9LnXjETttLUUHNBlvr1oaj+qzsuCbyXYifVVkNbjQpYJasqrrzu6
         ySzWhtDZ2xlL8sReZgGiBqd1cl6xQZDZgcorMhgQ6Eqb6m5NuNkjbwbWjWQhHOE1xHT8
         kHqKd+rx5++vZ0sBOgC2HqRb3iSGxdOcN5ALN+FfWZ3VD5AzBF70kyjj2wZhhvBVGa/1
         SFCCaUe+e3W2vpFrK53SLw1BUtQjoMZFvu0GmYOeCCiEy9dUjbcOolRf/fIiTQeDGkMs
         7uJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777935288; x=1778540088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+0MK1TD8LHF29R/J38mIFeUjCIqs/VJGJSF3NIKwpY=;
        b=qnfFbXvGPeyZf96hhThjUC9z/mX1FT2K/z7lVixW2g7EW2aEyw3JIXxHOxrO2Gi+f0
         EvZatDRg2YvYV+lW2po0hIzZU98TouoRm3vMUV+EjJqS2ifYQnRL132YiHRJSMUsnzNi
         7+iRknhlGVEaHfNsrVd2c+zB0D610MdP8t99HqONlCAtst0VrITQYmjwJYFpVca8sy+d
         kDfkginhoroje8uRJIpUr1SJkulxY+oUgMz+rVVgdA3+lFOCXsCEodm30+ZnTjh/Ouvu
         zRL/Iq+pV03Yvvf4sA/qDIEHASssrmN4pf40YJtBTliVIDFyJ6XqHWJf13o+qXwkREvz
         FW/Q==
X-Gm-Message-State: AOJu0Yxs3l41jFCq+AZ3UmjGWc79aO3mj/gbuulaoYNAAG9AUOZ8rLl5
	6wac6YyCYr9vAWMi0XDAmJxklmuHjgtmRAdB7mAhKd63Y5A2NMwS9bjCJqPvXQ==
X-Gm-Gg: AeBDiesA1khugXpjX4jSk3+F0YsB7hc9Eamvni8FGhh3brZZVt27f30pzwb9d+9syoj
	rdsm1U2hJ3IPt99qi9svn+sy+4NdngXw/PUzhz17qmP/PvFR6agBuHB5jHl4NHd0KSFATdBeI69
	Vh+XbzjZUUMKRkLpzBhv93rr6l2ZUe/RvokLntARNfI+j88iVRAfpGAa9wg0ZWiEX6i/5gZt5Vi
	lyW4LPXN/skrnblcerwysjBPtVGFHFmjXjczRF94tgtpTmm8yAo9BzrYuptFl6wnVY1s4ULryV1
	aORBdow97Fslmg2qhgrg8oFR6i7ZjFaUPo2mo40VfmwB2qK4KC7tI4eMcX8gP3T3xp018ZgsMzC
	Lnefj9IxJ3W6ep/iB3N6FZvL5so0X3XKUTpdCIZzOweSxsyNDzdlUYWJHB2oiG3nJklaAuF5duh
	IwzLBC4A3WYOsJVXJRySZdXLirxXcGGyuyH2juGDwVOc+483s6uUCoiYWIsg==
X-Received: by 2002:a05:6a00:300f:b0:82f:51e8:b38e with SMTP id d2e1a72fcca58-838fe484162mr1021779b3a.24.1777935288099;
        Mon, 04 May 2026 15:54:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839460a00f7sm165259b3a.32.2026.05.04.15.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:54:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/2] thrift: upgrade 0.22.0 -> 0.23.0
Date: Tue,  5 May 2026 10:54:29 +1200
Message-ID: <20260504225430.1302619-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 22:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126778

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: add attribution section for the third-party public-domain code[1]

Dropped patch which is now merged in the upstream version.

Changelog:
https://thrift.apache.org/changelog

[1]https://github.com/apache/thrift/commit/1e5fa4b9b35ad6bfeb238d19897ace7826eda057

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-support-reproducible-builds.patch    | 49 -------------------
 .../{thrift_0.22.0.bb => thrift_0.23.0.bb}    |  5 +-
 2 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/thrift/thrift/0001-support-reproducible-builds.patch
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.22.0.bb => thrift_0.23.0.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/0001-support-reproducible-builds.patch b/meta-oe/recipes-connectivity/thrift/thrift/0001-support-reproducible-builds.patch
deleted file mode 100644
index 7fad4ddaa6..0000000000
--- a/meta-oe/recipes-connectivity/thrift/thrift/0001-support-reproducible-builds.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From d4c19c3c88200c49d48c9d47971977627f98f51b Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 20 Nov 2025 11:43:45 +0800
-Subject: [PATCH] support reproducible builds
-
-In order to support reproducible builds [1], while using bison to generate
-source code, add COMPILE_FLAGS --file-prefix-map [2] to remove build path
-prefix and source path prefix in the generated header file.
-
-[1] https://reproducible-builds.org/
-[2] https://cgit.git.savannah.gnu.org/cgit/bison.git/commit/?id=dd878d18519689c7bbcd72de4c9f9e53085a3cbf
-
-Upstream-Status: Submitted [https://github.com/apache/thrift/pull/3246]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- compiler/cpp/CMakeLists.txt       | 2 +-
- compiler/cpp/tests/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/compiler/cpp/CMakeLists.txt b/compiler/cpp/CMakeLists.txt
-index 4c1c2c5..a1a8fcb 100644
---- a/compiler/cpp/CMakeLists.txt
-+++ b/compiler/cpp/CMakeLists.txt
-@@ -30,7 +30,7 @@ find_package(BISON REQUIRED)
- file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/thrift/)
- 
- # Create flex and bison files and build the lib parse static library
--BISON_TARGET(thrifty ${CMAKE_CURRENT_SOURCE_DIR}/src/thrift/thrifty.yy ${CMAKE_CURRENT_BINARY_DIR}/thrift/thrifty.cc)
-+BISON_TARGET(thrifty ${CMAKE_CURRENT_SOURCE_DIR}/src/thrift/thrifty.yy ${CMAKE_CURRENT_BINARY_DIR}/thrift/thrifty.cc COMPILE_FLAGS "--file-prefix-map=${CMAKE_BINARY_DIR}='' --file-prefix-map=${CMAKE_SOURCE_DIR}=''")
- FLEX_TARGET(thriftl ${CMAKE_CURRENT_SOURCE_DIR}/src/thrift/thriftl.ll ${CMAKE_CURRENT_BINARY_DIR}/thrift/thriftl.cc)
- ADD_FLEX_BISON_DEPENDENCY(thriftl thrifty)
- 
-diff --git a/compiler/cpp/tests/CMakeLists.txt b/compiler/cpp/tests/CMakeLists.txt
-index 6a078ec..39f5bb2 100644
---- a/compiler/cpp/tests/CMakeLists.txt
-+++ b/compiler/cpp/tests/CMakeLists.txt
-@@ -45,7 +45,7 @@ find_package(BISON REQUIRED)
- file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/thrift/)
- 
- # Create flex and bison files and build the lib parse static library
--BISON_TARGET(thrifty ${THRIFT_COMPILER_SOURCE_DIR}/src/thrift/thrifty.yy ${CMAKE_CURRENT_BINARY_DIR}/thrift/thrifty.cc)
-+BISON_TARGET(thrifty ${THRIFT_COMPILER_SOURCE_DIR}/src/thrift/thrifty.yy ${CMAKE_CURRENT_BINARY_DIR}/thrift/thrifty.cc COMPILE_FLAGS "--file-prefix-map=${CMAKE_BINARY_DIR}='' --file-prefix-map=${CMAKE_SOURCE_DIR}=''")
- FLEX_TARGET(thriftl ${THRIFT_COMPILER_SOURCE_DIR}/src/thrift/thriftl.ll ${CMAKE_CURRENT_BINARY_DIR}/thrift/thriftl.cc)
- ADD_FLEX_BISON_DEPENDENCY(thriftl thrifty)
- 
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.23.0.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
rename to meta-oe/recipes-connectivity/thrift/thrift_0.23.0.bb
index 8ca1d0085e..4f90628b4a 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.23.0.bb
@@ -3,16 +3,15 @@ DESCRIPTION =  "A software framework, for scalable cross-language services devel
 HOMEPAGE = "https://thrift.apache.org/"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c40a383cb3f747e0c7abbf1482f194f0 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bdfca4cb0874071cc3e42d2ae3b05a77 \
                     file://NOTICE;md5=2659b43daca219f99a2f2626ea128f73"
 
 DEPENDS = "thrift-native boost flex-native bison-native openssl zlib"
 
 SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-DefineInstallationPaths.cmake-Define-libdir-in-terms.patch \
-           file://0001-support-reproducible-builds.patch \
            "
-SRC_URI[sha256sum] = "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5"
+SRC_URI[sha256sum] = "1859d932d2ae1f13d16c5a196931208c116310a5ff50f2bfd11d3db03be8f46f"
 
 BBCLASSEXTEND = "native nativesdk"
 

