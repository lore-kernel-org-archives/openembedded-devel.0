Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 96D7379498
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2018 04:59:35 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 7-v6so397538pgf.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2018 21:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GORSd0PFV3NbEdTPK+y8DJm4OyMi9L3M7dR9LPSMpFM=;
	b=NWBhxXdT0KDvF+P4fOZE6xoE3ypco8n7phl6HwTNq7K1pbCyxudKHyT+oneajX9ovx
	XTecnJ8nHDfd3fbGkxeEXWeAl4ISEl/FBFRbCh1vXVulawV0RY1e/oZ+YuieZ+WcaIpw
	paMXdj3/MOE5EkUBMTIf+Xr5fGg7bL8I65c4aHbcwUJtwPaw5DZiQK9m0BxL3m0+83Vl
	GR4HqUu8Uit6OVDOCosjG68LUk4fc30oPqW/PHtAA6aqnptDAk/UobvUM/T7Wngc3FjK
	U0tdfCEphqtRUZtMbm1+yv0kAHoHySO2qiNCnb6Sf4+WNZw9UZgIa9e44MwgnENsrMIl
	yuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=GORSd0PFV3NbEdTPK+y8DJm4OyMi9L3M7dR9LPSMpFM=;
	b=XZuLj5Z6VEWZURPCcAUaq8/QleSq3b2txxL2XlRNifWQDqgqCVwPHc21fP87o3POju
	726KViVxdXkPEBs3hy4E0OT7A1nRYc0C6pgFAHc04PJBvV9whSHBo7ptcurDXfto807F
	0R4FotYhR1HPMpr52di499DXld78eLMOwyt2+rShblAqFfDfE6FHvgLHUH6+O/Fdg5oS
	e8ZSJMTF/56R297bJ7bc3nQCAdj21DNHpyYVf2cKBgb119K43rybuKbHYVYo3g0UK6wK
	vwaSopEyH0Cxy7f7UG8HSdWKrFmUt49vb2GTJFs8PYf4R1lxqKEHKyn6Y5smlvkgVtE9
	dv5A==
X-Gm-Message-State: APzg51BNLLrYRK+34iMTAQ3mQdD1Ql8LPSSNMSCWR5ZUJhd9QFZHHvvi
	Q8Zxeft1y8q28ulrHhGEAZsyVA3C
X-Google-Smtp-Source: ANB0VdYz6vOkPluNAWtOhNklxp41S/x6eQW96cVuR3Pio101/wSQEHsKHotHL2iQ1dCSUmn6zSNUBA==
X-Received: by 2002:a65:4289:: with SMTP id j9-v6mr105662pgp.284.1536728376080;
	Tue, 11 Sep 2018 21:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	d12-v6sm25927706pfn.118.2018.09.11.21.59.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Sep 2018 21:59:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2018 21:59:26 -0700
Message-Id: <20180912045927.23092-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] opencv: Fix build with clang
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
X-List-Received-Date: Wed, 12 Sep 2018 04:59:35 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Check-for-clang-before-using-isystem.patch | 32 +++++++++++++++++++
 .../opencv/opencv/0001-Dont-use-isystem.patch | 30 +++++++++++++++++
 .../recipes-support/opencv/opencv_3.4.3.bb    |  2 ++
 3 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Check-for-clang-before-using-isystem.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Check-for-clang-before-using-isystem.patch b/meta-oe/recipes-support/opencv/opencv/0001-Check-for-clang-before-using-isystem.patch
new file mode 100644
index 0000000000..319071a311
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Check-for-clang-before-using-isystem.patch
@@ -0,0 +1,32 @@
+From fa76d8646bb2b9b514728eeef41afed7c43a36f2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Sep 2018 18:18:33 -0700
+Subject: [PATCH] Check for clang before using -isystem
+
+When cross compiling with clang, the internal C++ headers are not found
+when adding sysroot to -isystem, that is redundant anyway because it
+will look for headers insider --sysroot path with same quality as it
+would do with -isystem otherwise
+
+Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/12504]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/OpenCVUtils.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
+index fae91c165f..60c20192dc 100644
+--- a/cmake/OpenCVUtils.cmake
++++ b/cmake/OpenCVUtils.cmake
+@@ -259,7 +259,7 @@ function(ocv_include_directories)
+     ocv_is_opencv_directory(__is_opencv_dir "${dir}")
+     if(__is_opencv_dir)
+       list(APPEND __add_before "${dir}")
+-    elseif(CV_GCC AND NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS "6.0" AND
++    elseif(((CV_GCC AND NOT CMAKE_CXX_COMPILER_VERSION VERSION_LESS "6.0") OR CV_CLANG) AND
+            dir MATCHES "/usr/include$")
+       # workaround for GCC 6.x bug
+     else()
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
new file mode 100644
index 0000000000..bf0b80a30b
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Dont-use-isystem.patch
@@ -0,0 +1,30 @@
+From 7144c44ec70dee73a628463b99ffeed74b1a8ef6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Sep 2018 00:21:18 -0700
+Subject: [PATCH] Dont use isystem
+
+clang really does not like it
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/OpenCVPCHSupport.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
+index f9b1b48b65..fe27a136f5 100644
+--- a/cmake/OpenCVPCHSupport.cmake
++++ b/cmake/OpenCVPCHSupport.cmake
+@@ -18,6 +18,8 @@ IF(CV_GCC)
+         SET(PCHSupport_FOUND TRUE)
+     ENDIF()
+ 
++    SET(CMAKE_INCLUDE_SYSTEM_FLAG_C "-I")
++    SET(CMAKE_INCLUDE_SYSTEM_FLAG_CXX "-I")
+     SET(_PCH_include_prefix "-I")
+     SET(_PCH_isystem_prefix "-isystem")
+     SET(_PCH_define_prefix "-D")
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-support/opencv/opencv_3.4.3.bb b/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
index 403146e7cd..0a99700b4a 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.4.3.bb
@@ -51,6 +51,8 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     file://0003-To-fix-errors-as-following.patch \
     file://fixpkgconfig.patch \
     file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
+    file://0001-Dont-use-isystem.patch \
+    file://0001-Check-for-clang-before-using-isystem.patch \
 "
 PV = "3.4.3+git${SRCPV}"
 
-- 
2.19.0


