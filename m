Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id BCCA36193E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2020 01:27:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2020 17:27:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,505,1574150400"; d="scan'208";a="228257716"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 01 Mar 2020 17:27:46 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Mar 2020 09:27:35 +0800
Message-Id: <1583112455-26910-5-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583112455-26910-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1583112455-26910-1-git-send-email-ee.peng.yeoh@intel.com>
Cc: Ross Burton <ross.burton@intel.com>, Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Subject: [zeus][PATCH 5/5] opencv: abort configure if we need to download
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
X-List-Received-Date: Mon, 02 Mar 2020 01:27:46 -0000

From: Ross Burton <ross.burton@intel.com>

OpenCV's habit of downloading files during do_configure is bad form
(as it becomes impossible to do offline builds), so add an option to
error out if a download would be needed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 .../recipes-support/opencv/opencv/download.patch   | 32 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb     |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/download.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/download.patch b/meta-oe/recipes-support/opencv/opencv/download.patch
new file mode 100644
index 0000000..fa8db88
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/download.patch
@@ -0,0 +1,32 @@
+This CMake module will download files during do_configure.  This is bad as it
+means we can't do offline builds.
+
+Add an option to disallow downloads by emitting a fatal error.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/cmake/OpenCVDownload.cmake b/cmake/OpenCVDownload.cmake
+index cdc47ad2cb..74573f45a2 100644
+--- a/cmake/OpenCVDownload.cmake
++++ b/cmake/OpenCVDownload.cmake
+@@ -14,6 +14,7 @@
+ #    RELATIVE_URL - if set, then URL is treated as a base, and FILENAME will be appended to it
+ #  Note: uses OPENCV_DOWNLOAD_PATH folder as cache, default is <opencv>/.cache
+ 
++set(OPENCV_ALLOW_DOWNLOADS ON CACHE BOOL "Allow downloads")
+ set(HELP_OPENCV_DOWNLOAD_PATH "Cache directory for downloaded files")
+ if(DEFINED ENV{OPENCV_DOWNLOAD_PATH})
+   set(OPENCV_DOWNLOAD_PATH "$ENV{OPENCV_DOWNLOAD_PATH}" CACHE PATH "${HELP_OPENCV_DOWNLOAD_PATH}")
+@@ -153,6 +154,11 @@ function(ocv_download)
+ 
+   # Download
+   if(NOT EXISTS "${CACHE_CANDIDATE}")
++    if(NOT OPENCV_ALLOW_DOWNLOADS)
++      message(FATAL_ERROR "Not going to download ${DL_FILENAME}")
++      return()
++    endif()
++
+     ocv_download_log("#cmake_download \"${CACHE_CANDIDATE}\" \"${DL_URL}\"")
+     file(DOWNLOAD "${DL_URL}" "${CACHE_CANDIDATE}"
+          INACTIVITY_TIMEOUT 60
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index 03e4f58..f679ccb 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -48,6 +48,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
+           file://download.patch \
            "
 PV = "4.1.0"
 
@@ -87,6 +88,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DIPPROOT=${WORKDIR}/ippicv_lnx \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
+    -DOPENCV_ALLOW_DOWNLOADS=OFF \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
     ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-- 
2.7.4


