Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.6846.1608278946141538288
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Dec 2020 00:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; 
   d="scan'208";a="102708799"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 18 Dec 2020 16:08:45 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2A07148990D2
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Dec 2020 16:08:40 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 18 Dec 2020 16:08:39 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 20.11.0 -> 20.12.1
Date: Fri, 18 Dec 2020 16:07:40 +0800
Message-ID: <1608278860-111600-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2A07148990D2.A819B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Refresh the following patch:
0001-Do-not-overwrite-all-our-build-flags.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...1-Do-not-overwrite-all-our-build-flags.patch | 17 ++++++++++-------
 .../{poppler_20.11.0.bb => poppler_20.12.1.bb}  |  2 +-
 2 files changed, 11 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_20.11.0.bb => poppler_20.12.1.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
index 05e0abede..afb0b5df0 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
@@ -15,12 +15,12 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 
 --- a/cmake/modules/PopplerMacros.cmake
 +++ b/cmake/modules/PopplerMacros.cmake
-@@ -123,14 +123,14 @@ if(CMAKE_COMPILER_IS_GNUCXX)
+@@ -104,14 +104,14 @@ if(CMAKE_COMPILER_IS_GNUCXX)
    set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
- 
+
    set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
--  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE")
-+  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
+-  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -fno-operator-names -D_DEFAULT_SOURCE")
++  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -fno-operator-names -D_DEFAULT_SOURCE ${_save_cxxflags}")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g ${_save_cxxflags}")
    set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG ${_save_cxxflags}")
    set(CMAKE_CXX_FLAGS_DEBUG          "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline ${_save_cxxflags}")
@@ -32,16 +32,16 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
    set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
    set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
    set(CMAKE_C_FLAGS_DEBUG            "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline ${_save_cflags}")
-@@ -167,7 +167,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL
+@@ -149,7 +149,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
- 
+
    set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
 -  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE")
 +  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g ${_save_cxxflags}")
    set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG ${_save_cxxflags}")
    # clang does not support -fno-reorder-blocks -fno-schedule-insns, so do not use -O2
-@@ -175,7 +175,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL
+@@ -157,7 +157,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
    set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline ${_save_cxxflags}")
    set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage -fprofile-arcs ${_save_cxxflags}")
    set(_save_cflags "${CMAKE_C_FLAGS}")
@@ -50,3 +50,6 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
    set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
    set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
    # clang does not support -fno-reorder-blocks -fno-schedule-insns, so do not use -O2
+--
+2.25.1
+
diff --git a/meta-oe/recipes-support/poppler/poppler_20.11.0.bb b/meta-oe/recipes-support/poppler/poppler_20.12.1.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_20.11.0.bb
rename to meta-oe/recipes-support/poppler/poppler_20.12.1.bb
index 729923d40..87a57523f 100644
--- a/meta-oe/recipes-support/poppler/poppler_20.11.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_20.12.1.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "021557074516492375c2bb4226a413aad431159e9177f9f14dff4159d2723b14"
+SRC_URI[sha256sum] = "d0aa2586c0a4296c775f0d2045f28bb95a694113fc995f95350faa12930f7b35"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1



