Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 41D617FEF3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 16:24:29 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id c9so8029321wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 08:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CUMzc9PdnQnbwpEtrtJZoIcfUr6JKbEeHIP8pyGVG+c=;
	b=abDcJdu+WT+HX3Zag+e1McmtXWQ0//Zc37OOh3E9FGewCVS8jn97lJQK7ltoLfm/a8
	5bWDDoFeORQfx/KT15Cx/vVeT7X+HW6ayEhzczwpvYVOAciXix6eYHHV+2IdqrYfXdEb
	FYuvi9hln/ByVA2D99Fh+DF4w3gUR3/iyuCfRzvR6sIr9vhVBznm3eQEbSg5eDMYvxqI
	TwCBNm5yMX0d8h7wz02Wa9wOCrMUolAE/971+KJabdaNXKiQeI1Y/ZUQT/TO2lTiIzxP
	ydxfdLZoztkAaqJWTepayEON8WfkRRRhh2klIjnyOyd43ZecMzZqaIY+ZaRfdr8tAVi4
	JU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CUMzc9PdnQnbwpEtrtJZoIcfUr6JKbEeHIP8pyGVG+c=;
	b=cS63OHnGUZsB//sR4cqZdoCi7kzYBH5cW+SHmlpFSTzKb9N8XahSxU6NGHuHI1wtzT
	cPKIxLwtIsuqdZtdwIW+77KliXXl0KqqYOki8lCy1kdUV32WcF47K9DCLZ3LstGMOTMo
	tHrIcOhs/G9GmJvfxtUwF+fgm3Z9Wgi4V9b1aDCNz6tevgpT4lAjH2qWUYRveNYRFtVi
	UAf2vQn/zG72eATJb/sGjAXzCRUtEx47X1q7Ok6LRRq92oGR1ok+3UR3ewsP4AdIytME
	KEJr8B9+76vbzO8Zj9eQG4BRCLYrDBxyeEYFG6t9DCMc/Q0ZN/uZJe1m2ZETnaH6bmIM
	LOng==
X-Gm-Message-State: APjAAAV+83TrdnMoCIGwvuP7i77KdS3mEh/ZeT7TKf4x5WV+RJdu+zuP
	73bT8uVffimJMVlCBa7xvQRpM8MDcZM=
X-Google-Smtp-Source: APXvYqwhbLvANrvFA2sfpD8zMF4CUCG8KEH3F6K+3JiPdqAzvXI4NwMV6ctOL2Ov+TjE/kTJo1wRrA==
X-Received: by 2002:adf:f80b:: with SMTP id s11mr11191347wrp.12.1578587069633; 
	Thu, 09 Jan 2020 08:24:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	x14sm3329872wmj.42.2020.01.09.08.24.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 09 Jan 2020 08:24:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Jan 2020 16:24:24 +0000
Message-Id: <20200109162424.22107-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] opencv: abort configure if we need to download
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
X-List-Received-Date: Thu, 09 Jan 2020 16:24:30 -0000
Content-Transfer-Encoding: 8bit

OpenCV's habit of downloading files during do_configure is bad form
(as it becomes impossible to do offline builds), so add an option to
error out if a download would be needed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../opencv/opencv/download.patch              | 32 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.1.0.bb    |  2 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/download.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/download.patch b/meta-oe/recipes-support/opencv/opencv/download.patch
new file mode 100644
index 0000000000..fa8db88078
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
index 03e4f58dca..f679ccb05f 100644
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
2.20.1


