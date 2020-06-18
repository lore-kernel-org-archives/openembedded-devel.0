Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2802.1592467848598809227
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jun 2020 01:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05I8AlkI008852
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jun 2020 01:10:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 18 Jun 2020 01:10:46 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] opencv: make ts module external
Date: Thu, 18 Jun 2020 16:08:55 +0800
Message-ID: <20200618080855.4074582-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Remove the patch which used to create ts module as shared library
  as the logic is covered in the new added patch which makes ts module
  external
* Add a patch to make ts module external to fix the below broken link:
  # ls -l /usr/lib64/libopencv_ts.so
  lrwxrwxrwx 1 root root 19 Jun 14 19:13 /usr/lib64/libopencv_ts.so -> libopencv_ts.so.4.3
  # rpm -qf /usr/lib64/libopencv_ts.so
  libopencv-ts-dev-4.3.0-r0.corei7_64
  # readlink -e /usr/lib64/libopencv_ts.so
  # echo $?
  1

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../opencv/0001-Make-ts-module-external.patch | 42 +++++++++++++++++++
 ...reate-share-library-intead-of-static.patch | 24 -----------
 .../recipes-support/opencv/opencv_4.3.0.bb    |  2 +-
 3 files changed, 43 insertions(+), 25 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-Make-ts-module-external.patch
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-Make-ts-module-external.patch b/meta-oe/recipes-support/opencv/opencv/0001-Make-ts-module-external.patch
new file mode 100644
index 000000000..d56b8ae67
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-Make-ts-module-external.patch
@@ -0,0 +1,42 @@
+From 11bbf909e08594628bd757d989ae34cf1bfe200b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 18 Jun 2020 05:51:38 +0000
+Subject: [PATCH] Make ts module external
+
+Make ts module external
+
+Reference: https://github.com/qbonnard/opencv/commit/6b229c5834cb9a0930425e762a6c7b03244d7abb
+
+Upstream-Status: Submitted [https://github.com/opencv/opencv/issues/8408]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ modules/ts/CMakeLists.txt | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt
+index f95bed0793..66f315bcca 100644
+--- a/modules/ts/CMakeLists.txt
++++ b/modules/ts/CMakeLists.txt
+@@ -4,9 +4,6 @@ if(NOT BUILD_opencv_ts AND NOT BUILD_TESTS AND NOT BUILD_PERF_TESTS)
+   ocv_module_disable(ts)
+ endif()
+ 
+-set(OPENCV_MODULE_TYPE STATIC)
+-set(OPENCV_MODULE_IS_PART_OF_WORLD FALSE)
+-
+ if(WINRT)
+   # WINRT doesn't have access to environment variables
+   # so adding corresponding macros during CMake run
+@@ -16,7 +13,7 @@ endif()
+ 
+ ocv_warnings_disable(CMAKE_CXX_FLAGS -Wundef)
+ 
+-ocv_add_module(ts INTERNAL opencv_core opencv_imgproc opencv_imgcodecs opencv_videoio opencv_highgui)
++ocv_add_module(ts opencv_core opencv_imgproc opencv_imgcodecs opencv_videoio opencv_highgui)
+ 
+ ocv_glob_module_sources()
+ ocv_module_include_directories()
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch b/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
deleted file mode 100644
index 20d54d407..000000000
--- a/meta-oe/recipes-support/opencv/opencv/0002-Make-opencv-ts-create-share-library-intead-of-static.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 78e2fc167fd27ab17175dcfd6eccf6f74bd5e1c7 Mon Sep 17 00:00:00 2001
-From: Bian Naimeng <biannm@cn.fujitsu.com>
-Date: Wed, 19 Apr 2017 03:11:37 +0900
-Subject: [PATCH] Make opencv-ts create share library intead of static.
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
-
----
- modules/ts/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt
-index f95bed0793..ee67858df8 100644
---- a/modules/ts/CMakeLists.txt
-+++ b/modules/ts/CMakeLists.txt
-@@ -4,7 +4,7 @@ if(NOT BUILD_opencv_ts AND NOT BUILD_TESTS AND NOT BUILD_PERF_TESTS)
-   ocv_module_disable(ts)
- endif()
- 
--set(OPENCV_MODULE_TYPE STATIC)
-+#set(OPENCV_MODULE_TYPE STATIC)
- set(OPENCV_MODULE_IS_PART_OF_WORLD FALSE)
- 
- if(WINRT)
diff --git a/meta-oe/recipes-support/opencv/opencv_4.3.0.bb b/meta-oe/recipes-support/opencv/opencv_4.3.0.bb
index 2587b189c..7927ce25f 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.3.0.bb
@@ -44,11 +44,11 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=face;name=face \
            file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
-           file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
            file://download.patch \
+           file://0001-Make-ts-module-external.patch \
            "
 PV = "4.3.0"
 
-- 
2.24.1

