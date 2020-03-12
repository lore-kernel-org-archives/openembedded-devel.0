Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE9461C24
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Mar 2020 02:57:48 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id 2so2463907pfg.12
	for <openembedded-devel@openembedded.org>;
	Wed, 11 Mar 2020 19:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=y0wz/i0nBj+W+pjEAvhvpMhqGLSVcZuu5vuKlj1zoEI=;
	b=MDFg7nYNi9fG7X/g9MQ9SI2eTKQhyR4tx+QqHirbPvfVSv7ugG4vk6rEw4DbijROhO
	J44g9sklKasHBLlOG3q/vDl7Aj8J8xJG9iwPumekvzBk1BnHdjGbzgcpS4HH6g66kmnX
	/vlG2eJ423Z5xuFg55puB0OS59O07JTumryjOOCDES3O1eGN4Av9haujOvPaUSggr+wh
	y5pdVpGdsdU8XcfV6UvT0A3lxu8TG2AldQbo9in5FfDKIPeGSGlMRBSuwasbPugHhVXl
	jPe0z8nFD7DxPXNCwbcyoKnxixOMhVob1tKMAqsxetBkdxeM8bhZzW8qUUbg3VsAQQDU
	JAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=y0wz/i0nBj+W+pjEAvhvpMhqGLSVcZuu5vuKlj1zoEI=;
	b=aVuoxslWj4pqhbxcI3pv/uYicGuTi5w7nZbqdV0PoQFBOWOjsVosVfVaKDIlDKg4+/
	Gn8m3tYeEuCxHI6gJxpe30vdJgrTudkJAM3gcmXseq0qT1DZjvphYOYoOmtc/IWrUnS7
	qUVcD5Hzs6AOmDudwW3u6Jx/QgqO/mevd3YaYjUadNrzjfSWiYdKGjk217HZWwfj5B6j
	gthy/LhJFONhZ0UbgoTtR94OSaFKVF6i5t65OuLDrXh+o4I6Xoj93F3c9e+EnzVKE8uY
	9kJmqeYHj9OmdWFWau0VhwELPYJhynaGlUNXgm+W5QyxnT1boVm5l1Fo3sw/EhdbENnF
	RTTQ==
X-Gm-Message-State: ANhLgQ02CBORLrU/bmiTnFP/FZSSu9az6IFj4s2+Fnc81idX8aYja6Ks
	pmH5rJ5SZ0O4CO47Paq1ZhvVfLZB
X-Google-Smtp-Source: ADFU+vvI2XxflR0wDiie/ucaxTi/YtE+g50xq5Fx1gz+woaBfUHOsJtOlit8WN8FCHOTPMDFQ7r5Gw==
X-Received: by 2002:a62:3808:: with SMTP id f8mr4353865pfa.38.1583981869811;
	Wed, 11 Mar 2020 19:57:49 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:60a5:8a88:a7f9:d809])
	by smtp.gmail.com with ESMTPSA id
	e2sm18328236pgv.81.2020.03.11.19.57.49
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 19:57:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Wed, 11 Mar 2020 19:57:30 -0700
Message-Id: <a07c8387291c2c2650dc17ef7f56f8fef8b50057.1583981708.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583981708.git.akuster808@gmail.com>
References: <cover.1583981708.git.akuster808@gmail.com>
Subject: [zeus 11/13] opencv: abort configure if we need to download
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
X-List-Received-Date: Thu, 12 Mar 2020 02:57:49 -0000

From: Ross Burton <ross.burton@intel.com>

OpenCV's habit of downloading files during do_configure is bad form
(as it becomes impossible to do offline builds), so add an option to
error out if a download would be needed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1


