Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 1DBBD60ADF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 01:49:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,565,1574092800"; d="scan'208";a="86504520"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Mar 2020 09:49:28 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id C3C6C50A9983
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 09:39:24 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Wed, 18 Mar 2020 09:49:27 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Wed, 18 Mar 2020 09:49:37 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Mar 2020 00:19:49 -0700
Message-ID: <1584515992-22564-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1584515992-22564-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: C3C6C50A9983.A3387
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe] [PATCH] flatbuffers: upgrade 1.11.0 -> 1.12.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Mar 2020 01:49:28 -0000
Content-Type: text/plain

0001-Add-detection-of-strtoull_l-function.patch
removed since it is included in 1.12.0

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...Add-detection-of-strtoull_l-function.patch | 38 -------------------
 ...uffers_1.11.0.bb => flatbuffers_1.12.0.bb} |  8 ++--
 2 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
 rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_1.11.0.bb => flatbuffers_1.12.0.bb} (72%)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch b/meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
deleted file mode 100644
index f3e82101b..000000000
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers/0001-Add-detection-of-strtoull_l-function.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From bff7ffbc5130cd46caf33b76b4bb0593fcd15066 Mon Sep 17 00:00:00 2001
-From: Vladimir Glavnyy <31897320+vglavnyy@users.noreply.github.com>
-Date: Fri, 10 May 2019 00:15:29 +0700
-Subject: [PATCH] Add detection of strtoull_l function (#5333) (#5337)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/google/flatbuffers/commit/bff7ffbc5130cd46caf33b76b4bb0593fcd15066]
----
- CMakeLists.txt | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 0640c37b5..30be238fe 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -42,12 +42,18 @@ if(DEFINED FLATBUFFERS_MAX_PARSING_DEPTH)
-   message(STATUS "FLATBUFFERS_MAX_PARSING_DEPTH: ${FLATBUFFERS_MAX_PARSING_DEPTH}")
- endif()
- 
--# Auto-detect locale-narrow 'strtod_l' function.
-+# Auto-detect locale-narrow 'strtod_l' and  'strtoull_l' functions.
- if(NOT DEFINED FLATBUFFERS_LOCALE_INDEPENDENT)
-+  set(FLATBUFFERS_LOCALE_INDEPENDENT 0)
-   if(MSVC)
--    check_cxx_symbol_exists(_strtof_l stdlib.h FLATBUFFERS_LOCALE_INDEPENDENT)
-+    check_cxx_symbol_exists(_strtof_l stdlib.h FLATBUFFERS_HAS_STRTOF_L)
-+    check_cxx_symbol_exists(_strtoui64_l stdlib.h FLATBUFFERS_HAS_STRTOULL_L)
-   else()
--    check_cxx_symbol_exists(strtof_l stdlib.h FLATBUFFERS_LOCALE_INDEPENDENT)
-+    check_cxx_symbol_exists(strtof_l stdlib.h FLATBUFFERS_HAS_STRTOF_L)
-+    check_cxx_symbol_exists(strtoull_l stdlib.h FLATBUFFERS_HAS_STRTOULL_L)
-+  endif()
-+  if(FLATBUFFERS_HAS_STRTOF_L AND FLATBUFFERS_HAS_STRTOULL_L)
-+    set(FLATBUFFERS_LOCALE_INDEPENDENT 1)
-   endif()
- endif()
- add_definitions(-DFLATBUFFERS_LOCALE_INDEPENDENT=$<BOOL:${FLATBUFFERS_LOCALE_INDEPENDENT}>)
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
similarity index 72%
rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
index 529441de1..c31cef63c 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
@@ -8,13 +8,11 @@ PACKAGE_BEFORE_PN = "${PN}-compiler"
 RDEPENDS_${PN}-compiler = "${PN}"
 RDEPENDS_${PN}-dev += "${PN}-compiler"
 
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "9e7e8cbe9f675123dd41b7c62868acad39188cae"
+SRCREV = "6df40a2471737b27271bdd9b900ab5f3aec746c7"
 
-SRC_URI = "git://github.com/google/flatbuffers.git \
-           file://0001-Add-detection-of-strtoull_l-function.patch \
-          "
+SRC_URI = "git://github.com/google/flatbuffers.git"
 
 # Make sure C++11 is used, required for example for GCC 4.9
 CXXFLAGS += "-std=c++11 -fPIC"
-- 
2.17.1




