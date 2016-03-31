Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 101FF6018C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 14:11:35 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id k79so60533712lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 07:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eraqn7LFPozM3Og/a4OQef9TIyn4yPPmum2aH+bx6aE=;
	b=x+ff0Qw+2xJ+Wx3YHh6OkF/aMT0awMs2ZJcxwo8UGEY6SmusIrSYUB4lvhRgkRxZRb
	AvQuEBasPOpdEstt+qmsm1582PaCsGhVDV4sVahcMHEgsc4g3w1XrHiIDY7KMH8kPlEM
	CNh8dZEY0ooOY5PPuEEzsQ7vrzGUnDcf1ngYt9y1onZFlMFVpALXqloptqDVPcwVrmuC
	dpafnSu9c9pcd4epLQ0t8TLQyNAzF5m/ADN3yTdOEW+ywRIxz4FHKqUHNnGasWqeZp10
	wRG7wqt9Wf7JsDygzPMUm5UyvT1IYnLZK4gGTw8cDS5yCqoywvQeHBU71xSK7x8rcl6L
	L4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eraqn7LFPozM3Og/a4OQef9TIyn4yPPmum2aH+bx6aE=;
	b=lQwHYQIivNr0R830nJDqF1c9JI4mZjtoUopC3UaQSKDY+Y/os/yCgIYwD5Zl1hkrLw
	fTOwG9o7LxFdu4g10xmsT+RIrEIRpXkLsgu9+ZobwIBCFqUhQFXhK9gaPlEbB94p1oTZ
	nI4TKHk/5OvnPjk3+EgcZtDKb03H2BCchjrzMc/i5XrE+9dWxtwRmAIVeDhqAOI3AT5J
	X0aZE7lRMrsjs83PxWlg/k5QO7SiSG5YlCvErs83jOdwTmJspfcTzpyigbWAScd7vlUI
	CIRksPY4Zo/8DA1SeZE6TsPHeNHNNWJv+DBVfFT/viF5/pdJWa2+WqGEbRD0e5De7PbM
	XVmw==
X-Gm-Message-State: AD7BkJKhsb4YhZpK9GUjfTwcF4lnG8LTXpXqyrotHA6qStZqlkVfaowT7xwtZ1SkbGZrug==
X-Received: by 10.25.145.149 with SMTP id t143mr6642311lfd.37.1459433495326;
	Thu, 31 Mar 2016 07:11:35 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	rg10sm1293415lbc.21.2016.03.31.07.11.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 07:11:33 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 16:11:31 +0200
Message-Id: <1459433492-9346-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [meta-oe][PATCH v6 5/7] opencv: Use pre-downloaded ipp
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
X-List-Received-Date: Thu, 31 Mar 2016 14:11:37 -0000

We should not rely on cmake downloading ipp at configure time.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch | 28 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.1.bb       | 12 ++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
new file mode 100644
index 000000000000..d568018b8d91
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
@@ -0,0 +1,28 @@
+From 049f931207631aa54af55a2917318d032b2ef3fa Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Thu, 31 Mar 2016 00:20:15 +0200
+Subject: [PATCH] 3rdparty/ippicv: Use pre-downloaded ipp
+
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+---
+ 3rdparty/ippicv/downloader.cmake | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/3rdparty/ippicv/downloader.cmake b/3rdparty/ippicv/downloader.cmake
+index a6016dbe10bc..af4062c8e95e 100644
+--- a/3rdparty/ippicv/downloader.cmake
++++ b/3rdparty/ippicv/downloader.cmake
+@@ -31,8 +31,10 @@ function(_icv_downloader)
+     return() # Not supported
+   endif()
+ 
++  if(NOT DEFINED OPENCV_ICV_PATH)
+   set(OPENCV_ICV_UNPACK_PATH "${CMAKE_CURRENT_LIST_DIR}/unpack")
+   set(OPENCV_ICV_PATH "${OPENCV_ICV_UNPACK_PATH}${OPENCV_ICV_PACKAGE_SUBDIR}")
++  endif()
+ 
+   if(DEFINED OPENCV_ICV_PACKAGE_DOWNLOADED
+        AND OPENCV_ICV_PACKAGE_DOWNLOADED STREQUAL OPENCV_ICV_PACKAGE_HASH
+-- 
+2.8.0.rc3
+
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index de6d8d9fe345..63955a862d4a 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -14,19 +14,31 @@ DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libw
 
 SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
+SRCREV_party3 = "81a676001ca8075ada498583e4166079e5744668"
+IPP_MD5 = "808b791a6eac9ed78d32a7666804320e"
+
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
             git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib \
+            git://github.com/Itseez/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=party3;name=party3 \
+            file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
             file://fixpkgconfig.patch"
 
 PV = "3.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
+do_unpack_extra() {
+    tar xzf ${WORKDIR}/party3/ippicv/ippicv_linux_20151201.tgz -C ${WORKDIR}
+}
+addtask unpack_extra after do_unpack before do_patch
+
 EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
 		 -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
                  -DWITH_1394=OFF \
                  -DCMAKE_SKIP_RPATH=ON \
+                 -DOPENCV_ICV_PACKAGE_DOWNLOADED=${IPP_MD5} \
+                 -DOPENCV_ICV_PATH=${WORKDIR}/ippicv_lnx \
                  ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
                  ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
                  ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-- 
2.8.0.rc3


