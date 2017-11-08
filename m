Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDCE7843E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Nov 2017 12:10:34 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id l23so2849893lfk.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Nov 2017 04:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8smETad9RLlVTuxgN9p+FOtBNzyTNqJ18JDjGMqX9W4=;
	b=Us+P9MDF73zwoNuZZge2IMW8Xlqd9HybRXiUxHbzeardXKp3Wjy2tqfYUXhsgiLU8L
	VtOXTOSdY88d7TpreYr9kDvLeHzkuZyu8YWqDzPuQeh41dBt7KpK8IHwgsh4xYmwkXbf
	0M9L0s8oENRVr9HLvrRhx93mcRSUgslIUpaCS5I/LoaWoQAFE27WSWuuSywQ88/z+3p+
	nZmB1Dg6b/CN/60WjlBN8yfGkqrAtCDrGPJA4FhyTGGqaPwJk6gGFtgHX2iYEqLQHeby
	qQhMlFFb8XVlhYIC30SN5nz92eT5+3Qn3UdkuUs4qbyZPhS+EqrogkXW5P7vwBT4wTrE
	8w9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8smETad9RLlVTuxgN9p+FOtBNzyTNqJ18JDjGMqX9W4=;
	b=Ol+WhcECw7OEddFtrdEZBnW5uxiJvDTPsUyL8nYOJZ6clmpX+XZO138G5FUSUpz0oh
	Dwz2xYjDJj1kQtHD/y9JU27mZIHc52UjEW9SaNPoX4f1UsDPO4qv+I532tvpfVQTLlkB
	qWOF8ep6Jooq/wp5it3OkGRuZ+FTfuvh2ihiOGW0xWWW+Yn6QM59fulF6vAHua4rE7bR
	rEucl6GeJ1OyTTsCFHfHUSVHGkiWK5XgJIPG8DrkSYgyFT9/1qcmqM9y5jz4s03t+Hxo
	pAYQDtLGN7JzBFx+9cM0gXEM2TU0O9JPjL/TCI1b3TzlE2L6/dwFd/pi0X1wxfr8d3+1
	qqJQ==
X-Gm-Message-State: AJaThX6Rj7hRR9UrJVHZzO64KISpjWLpwYCJ4ZhfDPTg097DXOgS3usz
	Ebu4XxfW5EOSiX9j7T8/OBHyi8xJ
X-Google-Smtp-Source: AGs4zMZttL7WMM+5qZfZOiq0SsF0tBl487DRQTiYHT6MAo6gtWEGB4W8qzaOLdQPwFcxIkIdpBLCrw==
X-Received: by 10.25.83.140 with SMTP id h12mr115149lfl.129.1510143035326;
	Wed, 08 Nov 2017 04:10:35 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id x18sm744216lja.55.2017.11.08.04.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 04:10:33 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Nov 2017 13:10:26 +0100
Message-Id: <20171108121027.27572-3-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171108121027.27572-1-ricardo.ribalda@gmail.com>
References: <20171108121027.27572-1-ricardo.ribalda@gmail.com>
Subject: [PATCH 3/4] opencv: Download tinydnn manually
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
X-List-Received-Date: Wed, 08 Nov 2017 12:10:34 -0000

OpenCV was downloading tinydnn during configuration via a script. This
patch downloads and unpacks tinydnn manually.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../recipes-support/opencv/opencv/tinydnn.patch    | 34 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.3.bb       |  6 ++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/tinydnn.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/tinydnn.patch b/meta-oe/recipes-support/opencv/opencv/tinydnn.patch
new file mode 100644
index 000000000000..c433fc312d2e
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/tinydnn.patch
@@ -0,0 +1,34 @@
+Upstream-status: Inappropriate [OE specific]
+
+Signed-off-by: Ricardo Ribalda <ricardo.ribalda@gmail.com>
+diff --git a/modules/dnn_modern/CMakeLists.txt b/modules/dnn_modern/CMakeLists.txt
+index 79b64b12160b..ba06a0a163e4 100644
+--- a/modules/dnn_modern/CMakeLists.txt
++++ b/modules/dnn_modern/CMakeLists.txt
+@@ -15,24 +15,8 @@ list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
+ # MODULE REQUIREMENTS
+ # ----------------------------------------------------------------------------
+ 
+-set(TINY_DNN_CPP_PATH "${OpenCV_BINARY_DIR}/3rdparty/tinydnn")
+-set(TINY_DNN_CPP_ROOT "${TINY_DNN_CPP_PATH}/tiny-dnn-1.0.0a3")
+-ocv_download(FILENAME "v1.0.0a3.tar.gz"
+-               HASH "adb1c512e09ca2c7a6faef36f9c53e59"
+-               URL
+-                 "${OPENCV_TINY_DNN_URL}"
+-                 "$ENV{OPENCV_TINY_DNN_URL}"
+-                 "https://github.com/tiny-dnn/tiny-dnn/archive/"
+-               DESTINATION_DIR "${TINY_DNN_CPP_PATH}"
+-               STATUS TINY_DNN_DOWNLOAD_SUCCESS
+-               ID "tiny-dnn"
+-               UNPACK RELATIVE_URL)
+-
+-if(NOT TINY_DNN_DOWNLOAD_SUCCESS)
+-  message(STATUS "Failed to download tiny-dnn sources")
+-endif()
+-
+-find_package(TinyDNN QUIET)
++set(TINYDNN_INCLUDE_DIRS "${OpenCV_SOURCE_DIR}/3rdparty/tinydnn/tiny-dnn-1.0.0a3")
++set(TinyDNN_FOUND TRUE)
+ 
+ include(CheckCXXCompilerFlag)
+ CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index 1c398aacc110..8f0aa7f5499c 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -15,6 +15,8 @@ SRCREV_contrib = "2a9d1b22ed76eb22fad1a5edf6faf4d05f207b13"
 SRCREV_ipp = "a62e20676a60ee0ad6581e217fe7e4bada3b95db"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
+SRC_URI[tinydnn.md5sum] = "adb1c512e09ca2c7a6faef36f9c53e59"
+SRC_URI[tinydnn.sha256sum] = "e2c61ce8c5debaa644121179e9dbdcf83f497f39de853f8dd5175846505aa18b"
 
 def ipp_filename(d):
     import re
@@ -41,9 +43,11 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20170418;destsuffix=ipp;name=ipp \
     git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=boostdesc;name=boostdesc \
     git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
+    https://github.com/tiny-dnn/tiny-dnn/archive/v1.0.0a3.tar.gz;destsuffix=git/3rdparty/tinydnn/tiny-dnn-1.0.0a3;name=tinydnn;unpack=false \
     file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
     file://fixpkgconfig.patch \
     file://uselocalxfeatures.patch;patchdir=../contrib/ \
+    file://tinydnn.patch;patchdir=../contrib/ \
     file://0002-Make-opencv-ts-create-share-library-intead-of-static.patch \
     file://0003-To-fix-errors-as-following.patch \
     file://0001-build-workaround-GCC-7.1.1-compilation-issue-with-sa.patch \
@@ -60,6 +64,8 @@ PV = "3.3+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 do_unpack_extra() {
+    mkdir -p ${S}/3rdparty/tinydnn/
+    tar xzf ${WORKDIR}/v1.0.0a3.tar.gz -C ${S}/3rdparty/tinydnn/
     tar xzf ${WORKDIR}/ipp/ippicv/${IPP_FILENAME} -C ${WORKDIR}
     cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
     cp ${WORKDIR}/boostdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
-- 
2.14.2


