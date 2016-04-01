Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id B80EC77059
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:36:40 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id k79so90176695lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eraqn7LFPozM3Og/a4OQef9TIyn4yPPmum2aH+bx6aE=;
	b=S4tSC/RxYVEqSPGsO3gZv8rkcdl3R72VP2vAo3CejOrVOtimXa7JTUFt1G3xVKfPSN
	i5mfcm5m33XkuR+Zs3SUyFolh/UQxhf0AgEorrOGxQgl9Nc0zGLDveruKymYm/nQ7svE
	zLdbDR11Ahx3Qr83C6F/faF5y0JPwXIrXvGAXhRnUnMNmQOkGoSiP/lAZCO/ufk1hDV9
	eaBN29W7hbOhDbgql6lP3AZNwfFRC24m56NzyxgGshvjV/dRoC9HIiqNOmRI9oro6Gy/
	1Cca5p01wr3KImZPV7Bon2chcveQoYIkCwIP5sH++Uf8Q2qmeP3oKbRAneEEv5urT41m
	LYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eraqn7LFPozM3Og/a4OQef9TIyn4yPPmum2aH+bx6aE=;
	b=diKlDAW7GPDChrqAYYlCncpkr2aJ479yA7FZ0xAHyXVirP3HMKKEaMrbV7zUzkk6N5
	/yb10b62C+BTVEhSlTAp1RqzAAr5vtjrI2PQCXO34XUmt05mWLbwmbyKX3itH1XjrKXI
	NUzQyUBITvtAlowqf7plVCmnJWnRe2Zy0rLHvctDZpkTP4WbmD51vndlpYxkZiXFcQ44
	l1PqFJGAVEMktZ0Mgy6ha2qhCVMkksXQfbW8lKqMx95FiRoPEOGtoocIe8LiA1QAtr+8
	0e1wc32iH7O4de7ni8H7XcZrYIE77n4ZxwlAD4D3J6s00tTTXoNsEhxIqByaecviC74n
	3VfA==
X-Gm-Message-State: AD7BkJK8M5xWvYU3dwf0vYYrlIEZhmszpTbbxrskUm9rXHdv7LjIuP5AYouCahcRIl2JqQ==
X-Received: by 10.25.136.139 with SMTP id k133mr2735171lfd.157.1459546601195; 
	Fri, 01 Apr 2016 14:36:41 -0700 (PDT)
Received: from localhost.localdomain (x1-6-74-44-01-e3-62-1a.cpe.webspeed.dk.
	[80.167.115.215])
	by smtp.gmail.com with ESMTPSA id i8sm2445759lbj.30.2016.04.01.14.36.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Apr 2016 14:36:40 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 23:36:28 +0200
Message-Id: <1459546590-9513-6-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v7 5/7] opencv: Use pre-downloaded ipp
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
X-List-Received-Date: Fri, 01 Apr 2016 21:36:41 -0000

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


