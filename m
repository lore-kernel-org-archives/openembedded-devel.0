Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id EE79070031
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:26:41 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id k79so57226285lfb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2016 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JdPKyQJEvYi6+90t9X8rmUEaBjv28gyDFb3MaM4MYYg=;
	b=aPCgrf0rEi0t+1MZSssuH+m8WKddZSdKXm7kbzDBvdoQt7crX4++u8X7dUI9oaC50o
	1VGgH8pGy2O/wlG9mQ7KNIpLH6Il3r0BWKtyBk3XMs4KmS3R7FitQtK6w8QKFlgzQK2r
	yd88HHb+E4Bl3QbJzqpxgFSYd35beLwfFKQKgWCBiqa+6bUa1hVpA/PHaEBJ4xzKr0Uo
	9Gg8Q8u2vpVWm5psRSMYv90HBAHNqEtH1bvsmnOZb+CrBljb12xH3Q14YoizaN+W1MGz
	W40fQGpmLZo4PvvDN65VxU7XozjngnlOFTEyJNllzmNyZxljUsLxOxTzD8Ol/qv/TW1V
	koXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JdPKyQJEvYi6+90t9X8rmUEaBjv28gyDFb3MaM4MYYg=;
	b=CeXvJpgL//em7R/3FLIGY9dAZSfd+KOA9JIWDOp3xVCHr4hv9QxJBiyyvca3PNm6aP
	v1bMgkf/y7rXrSEKTSTdCmGOs12RZqqrwvMCfNnfkZMRklFj+23tF46iTUN9nMbfj66z
	XBSVDYHAa18zdI/HJJwjKl/1BnpKtoPwJbkUxN3BD1bJiQGHxkmJQv89HLaXO49vKpN4
	9kHO8BKuQvTlT5vFFEPu++brcpjKDsMNAFZtfJ+P9suFtctSFGO4OPu2mj5V+EDaa92N
	ukBI9/znBpDgzawC+0YiZvG1RxQhWQIoSoAhjjH/X8GSSyA4i5BhfmLL00Zop3vrJAHp
	A1Vw==
X-Gm-Message-State: AD7BkJLvsFis507UqOtGOucQap5601SuIikwmhbbMsqreOMoknSIAOb68+yWyCkK4JG3Xw==
X-Received: by 10.25.37.136 with SMTP id l130mr6414431lfl.153.1459423601740;
	Thu, 31 Mar 2016 04:26:41 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t17sm1328655lfd.17.2016.03.31.04.26.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 04:26:40 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 31 Mar 2016 13:26:31 +0200
Message-Id: <1459423593-4123-6-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1459423593-4123-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v4 5/7] opencv: Use pre-downloaded ipp
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
X-List-Received-Date: Thu, 31 Mar 2016 11:26:42 -0000

We should not rely on cmake downloading ipp at configure time.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch | 28 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_3.1.bb       |  8 +++++++
 2 files changed, 36 insertions(+)
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
index de6d8d9fe345..84a592799c0a 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -14,9 +14,15 @@ DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libw
 
 SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
+IPP_MD5 = "808b791a6eac9ed78d32a7666804320e"
+SRC_URI[ipp.md5sum] = "${IPP_MD5}"
+SRC_URI[ipp.sha256sum] = "4333833e40afaa22c804169e44f9a63e357e21476b765a5683bcb3760107f0da"
+
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
             git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib \
+            https://raw.githubusercontent.com/Itseez/opencv_3rdparty/81a676001ca8075ada498583e4166079e5744668/ippicv/ippicv_linux_20151201.tgz;name=ipp \
+            file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
             file://fixpkgconfig.patch"
 
 PV = "3.1+git${SRCPV}"
@@ -27,6 +33,8 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
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


