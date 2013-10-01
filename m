Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id EF2856CC4D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 07:44:22 +0000 (UTC)
Received: from AFplatform.bmw-carit.intra (afplatform.bmw-carit.intra
	[192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 6BA034002C;
	Tue,  1 Oct 2013 08:40:26 +0200 (CEST)
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Oct 2013 09:44:14 +0200
Message-Id: <1380613454-3799-3-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1380613454-3799-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1380613454-3799-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Subject: [meta-oe][PATCHv2 3/3] opencv: adding PACKAGECONFIG for eigen gtk jpeg libav png tiff v4l
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Oct 2013 07:44:23 -0000

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
---
 meta-oe/recipes-support/opencv/opencv_2.4.3.bb |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
index 21a4f06..a0adc32 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a
 
 ARM_INSTRUCTION_SET = "arm"
 
-DEPENDS = "python-numpy v4l-utils libav gtk+ libtool swig swig-native python jpeg bzip2 zlib libpng tiff glib-2.0 libeigen"
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz2 \
            file://opencv-fix-pkgconfig-generation.patch \
@@ -26,14 +26,20 @@ OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
 
 EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
                  -DBUILD_PYTHON_SUPPORT=ON \
-                 -DWITH_FFMPEG=ON \
                  -DWITH_GSTREAMER=OFF \
-                 -DWITH_V4L=ON \
-                 -DWITH_GTK=ON \
                  -DCMAKE_SKIP_RPATH=ON \
                  ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
 "
 
+PACKAGECONFIG ??= "eigen gtk jpeg libav png tiff v4l"
+PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
+PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
+PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
+PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
+PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
+PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+
 inherit distutils-base pkgconfig cmake
 
 export BUILD_SYS
-- 
1.7.10.4


