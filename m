Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id CCDE9763F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 23:46:24 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id 96so221929lfs.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uf94aPb32EOsvaVjxIWODt8gJY8AtZ0fsDpBVB7E0sQ=;
	b=io2E5ybLpR3BvIHujqLFDzKiPzvS3/B1TZz46oxVyVhdstVNfa3vxPEsp5afSVWC+m
	zsqVBJn4R8MqKCruoI+/1jufje1T2zLNdZ0PazIr8MDWHtihmwbhbZcwNel8D98KNDQC
	Gw0D9gpkj7360fWHHbbMeaMdZsg1bRlqotS1yRmr9mGbxDGQGKrFZCpAEjm/69K8sS6W
	pM0vu5iQznCI+xTc4tskMPrDiCh2oWkhz+BvC0dPijdkiE+W9oKtuuBkG2AG+8LEhCe2
	hd7PFcionJ+6A6hamIKHuUqYm9cQ7ibwKx4UI4VmReEdaiFInk1POTdmNKDwEgj2Zt83
	fyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uf94aPb32EOsvaVjxIWODt8gJY8AtZ0fsDpBVB7E0sQ=;
	b=ODgcE3jXYIhzDlLYKo8rgDh/gSv2PFS1+IhtWw6P3KMBTUqk/gtAkfjwjPmjPQMZPQ
	/ZG7fPcTpsLQutq48byL0ihiEqrLrNHK/X/E61tR9e8n7LJHf84FPK7Zi0NhhPXLywpm
	LieLq9bz2XJtMtNIefFicRpjthhvqpuTL2hvaR2OAMTf/FG2UgFPJsiho96qjgSAhZAF
	8i9erUjnN38waaMB5yOsN/VZ84gPbutHtNEPcihpxmtfhrK7EegYs+7m1eqefDiAyf+S
	0/RqJegJpWu4bDGfMIUyHAvDSyDBWk+nsBuYXLfNI3KEhLwgx3JuvLmRL1DPG0AOvOaL
	lZpA==
X-Gm-Message-State: AKaTC02wiiZR8Egq6HvhUwSr4HA+auRu1KPCMeFhJWyfP9URUfSBQaCq8kvi2o8DJV/miw==
X-Received: by 10.25.72.74 with SMTP id v71mr34388981lfa.130.1481672785824;
	Tue, 13 Dec 2016 15:46:25 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z26sm10269595lja.49.2016.12.13.15.46.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 15:46:25 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com, raj.khem@gmail.com
Date: Wed, 14 Dec 2016 00:46:15 +0100
Message-Id: <20161213234618.31312-5-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v2 5/8] opencv: Add support for python3
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
X-List-Received-Date: Tue, 13 Dec 2016 23:46:25 -0000

New PACKAGECONFIG options: python2 and python3. Python3 selectec by
default, because it is almost 2017 ;).

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 5cce2c9eaa16..674604018098 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp protobuf protobuf-native"
+DEPENDS = "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp protobuf protobuf-native"
 
 SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
 SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
@@ -33,8 +33,7 @@ do_unpack_extra() {
 }
 addtask unpack_extra after do_unpack before do_patch
 
-EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
-    -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
+EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DWITH_1394=OFF \
     -DCMAKE_SKIP_RPATH=ON \
     -DOPENCV_ICV_PACKAGE_DOWNLOADED=${IPP_MD5} \
@@ -47,7 +46,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
 "
 EXTRA_OECMAKE_append_x86 = " -DX86=ON"
 
-PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb  gphoto2 \
+PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb  gphoto2 \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
     ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
 
@@ -65,15 +64,20 @@ PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
 PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
 PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${ORACLE_JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${ORACLE_JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
+PACKAGECONFIG[python2] = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python-numpy,"
+PACKAGECONFIG[python3] = "-DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include,,python3-numpy,"
 PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
 PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
 
-inherit distutils-base pkgconfig cmake
+inherit pkgconfig cmake
+
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'distutils3-base', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'distutils-base', '', d)}
 
 export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON="${STAGING_BINDIR_NATIVE}/python"
+export PYTHON="${STAGING_BINDIR_NATIVE}/${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3', 'python', d)}"
 export ORACLE_JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
 export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/lib/jvm/openjdk-8-native"
 export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
@@ -82,7 +86,9 @@ TARGET_CC_ARCH += "-I${S}/include "
 
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'oracle-java', '${PN}-java-dbg ${PN}-java', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'java', '${PN}-java-dbg ${PN}-java', '', d)} \
-    ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
+    ${@bb.utils.contains('PACKAGECONFIG', 'python2', 'python-${PN}', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-${PN}', '', d)} \
+    ${PN}-samples-dbg ${PN}-samples ${PN}-apps"
 
 python populate_packages_prepend () {
     cv_libdir = d.expand('${libdir}')
@@ -134,6 +140,10 @@ SUMMARY_python-opencv = "Python bindings to opencv"
 FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-opencv = "python-core python-numpy"
 
+SUMMARY_python3-opencv = "Python bindings to opencv"
+FILES_python3-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python3-opencv = "python3-core python3-numpy"
+
 do_install_append() {
     cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
     sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
-- 
2.10.2


