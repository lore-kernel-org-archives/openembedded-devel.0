Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8337F7317E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 10:32:29 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id bc4so232385163lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5yrcnUBJLlEfpEqr5CXq0M4uW7oG4zDtiPvjShMIcSI=;
	b=ZTaWEqL3Vy9od3nwLeO77M/OtWFScENqG2zlTxRv9fFFADoivvhjWwZ5kr11J34pyV
	XkS+Uw487sailbtwUXW1Q3dFoWYP7ZQSQYNBXdtW3kuSh7euPHKtXvu5cVUObxdal7oS
	SUapj0LuaYCBUanCzh1xoz/RbmU3xYXRhRNsASwou1iuBYGfizgMvaZ8iPcov3OFfjKG
	RznssiF1mL5AkOBksECQQnsKJrbFaGeshClPHPyY33bDoHQV//+CcCars+w3S7mPKy1I
	ak52ucOsui0CVanMwBX+0dBYmi373hYscDkmknAGytuNnQccmY/SM4LxnQOysqGzuSjM
	zbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5yrcnUBJLlEfpEqr5CXq0M4uW7oG4zDtiPvjShMIcSI=;
	b=eXnOR/sGnasJUDQoDpo2XwysqLFElIrto4YzVna7Dx7wPT5P2tnH3vPSLzk31DYZ4g
	clelJjJHYdetYEG4rQ/XABsKnPNZ/FPeJfIgjlvxrTTIJNbj3Tw48OFc5lKtw11jFrYi
	VrLbcb3L8z3om6Y0cot21G3LZilPouHRmNL8dpwf3zXjSXGXQTLNMvhcQqCLDn/s4XCF
	XuWifjF1y3cty+BwX/5tcWPvLtleX4idF+tmryxnPabCJBHBtkBvwA8fT0H3hGtAGqyF
	u1MI45TJuoI5hdqNOl1LkqMtuS6w94bVYLSG2gYq/KVJd06A36ZGeSpGe245T50duu3g
	u84w==
X-Gm-Message-State: AD7BkJITn63rJg78OmN4EhRaN8n+QGJcf3L2PmpEvY9RqnJ6cG1PBnoMfb4Q12XMzoOgaA==
X-Received: by 10.112.146.35 with SMTP id sz3mr7590965lbb.10.1457951549392;
	Mon, 14 Mar 2016 03:32:29 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	h134sm3561944lfh.3.2016.03.14.03.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Mar 2016 03:32:28 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2016 11:32:23 +0100
Message-Id: <1457951544-23279-3-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457951544-23279-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1457951544-23279-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 3/4] opencv: Update to version 3.1
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
X-List-Received-Date: Mon, 14 Mar 2016 10:32:32 -0000

The first major update in 3.0 release series

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 133 ---------------------------
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 133 +++++++++++++++++++++++++++
 2 files changed, 133 insertions(+), 133 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv_3.0.bb
 create mode 100644 meta-oe/recipes-support/opencv/opencv_3.1.bb

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
deleted file mode 100644
index 1a34efa7f01f..000000000000
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ /dev/null
@@ -1,133 +0,0 @@
-SUMMARY = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.org/"
-SECTION = "libs"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
-
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-
-DEFAULT_PREFERENCE = "-1"
-
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
-
-SRCREV_opencv = "424c2bddb39dae97dc4639a24eaa0e0c8fbb8e69"
-SRCREV_contrib = "844c30e8b2f2f4b34b96a169fafe9beea3c45e87"
-SRCREV_FORMAT = "opencv"
-SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
-	   git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
-
-PV = "3.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
-		 -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
-                 -DWITH_1394=OFF \
-                 -DCMAKE_SKIP_RPATH=ON \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
-"
-
-PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
-                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-		   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
-
-PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
-PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
-PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
-PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
-PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
-PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
-PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
-PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
-PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
-PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
-PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
-PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-
-inherit distutils-base pkgconfig cmake
-
-export BUILD_SYS
-export HOST_SYS
-export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON="${STAGING_BINDIR_NATIVE}/python"
-export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
-export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
-
-TARGET_CC_ARCH += "-I${S}/include "
-
-PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
-
-python populate_packages_prepend () {
-    cv_libdir = d.expand('${libdir}')
-    cv_libdir_dbg = d.expand('${libdir}/.debug')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
-    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
-
-    pn = d.getVar('PN', 1)
-    metapkg =  pn + '-dev'
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    blacklist = [ metapkg ]
-    metapkg_rdepends = [ ]
-    packages = d.getVar('PACKAGES', 1).split()
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
-            metapkg_rdepends.append(pkg)
-    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
-
-    metapkg =  pn
-    blacklist = [ metapkg ]
-    metapkg_rdepends = [ ]
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
-            metapkg_rdepends.append(pkg)
-    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
-
-}
-
-PACKAGES_DYNAMIC += "^libopencv-.*"
-
-FILES_${PN} = ""
-FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-dbg += "${libdir}/.debug"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
-FILES_${PN}-doc = "${datadir}/OpenCV/doc"
-FILES_${PN}-java = "${datadir}/OpenCV/java"
-FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
-FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
-FILES_${PN}-samples-dbg = "${datadir}/OpenCV/samples/bin/.debug"
-
-INSANE_SKIP_${PN}-apps = "staticdev"
-INSANE_SKIP_${PN}-java = "libdir"
-INSANE_SKIP_${PN}-java-dbg = "libdir"
-
-ALLOW_EMPTY_${PN} = "1"
-
-SUMMARY_python-opencv = "Python bindings to opencv"
-FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-opencv = "python-core python-numpy"
-
-do_install_append() {
-    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
-
-    # Move Python files into correct library folder (for multilib build)
-    if [ "$libdir" != "/usr/lib" ]; then
-        mv ${D}/usr/lib/* ${D}/${libdir}/
-        rm -rf ${D}/usr/lib
-    fi
-
-    install -d ${D}${datadir}/OpenCV/samples/bin/
-    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
-}
\ No newline at end of file
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
new file mode 100644
index 000000000000..9fd3b12e3631
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -0,0 +1,133 @@
+SUMMARY = "Opencv : The Open Computer Vision Library"
+HOMEPAGE = "http://opencv.org/"
+SECTION = "libs"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
+
+ARM_INSTRUCTION_SET_armv4 = "arm"
+ARM_INSTRUCTION_SET_armv5 = "arm"
+
+DEFAULT_PREFERENCE = "-1"
+
+DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
+
+SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
+SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
+SRCREV_FORMAT = "opencv"
+SRC_URI = "git://github.com/Itseez/opencv.git;name=opencv \
+	   git://github.com/Itseez/opencv_contrib.git;destsuffix=contrib;name=contrib"
+
+PV = "3.1+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
+		 -DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
+                 -DWITH_1394=OFF \
+                 -DCMAKE_SKIP_RPATH=ON \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
+                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
+                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
+"
+
+PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
+                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
+		   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
+
+PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
+PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
+PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
+PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
+PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+3,"
+PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
+PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
+PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
+PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-headers,"
+PACKAGECONFIG[oracle-java] = "-DJAVA_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_INCLUDE_PATH2=${JAVA_HOME}/include/linux -DJAVA_AWT_INCLUDE_PATH=${JAVA_HOME}/include -DJAVA_AWT_LIBRARY=${JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=${JAVA_HOME}/lib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,"
+PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
+PACKAGECONFIG[samples] = "-DBUILD_EXAMPLES=ON -DINSTALL_PYTHON_EXAMPLES=ON,-DBUILD_EXAMPLES=OFF,,"
+PACKAGECONFIG[tbb] = "-DWITH_TBB=ON,-DWITH_TBB=OFF,tbb,"
+PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
+PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+
+inherit distutils-base pkgconfig cmake
+
+export BUILD_SYS
+export HOST_SYS
+export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
+export PYTHON="${STAGING_BINDIR_NATIVE}/python"
+export JAVA_HOME="${STAGING_DIR_NATIVE}/usr/bin/java"
+export ANT_DIR="${STAGING_DIR_NATIVE}/usr/share/ant/"
+
+TARGET_CC_ARCH += "-I${S}/include "
+
+PACKAGES += "${PN}-java-dbg ${PN}-java ${PN}-samples-dbg ${PN}-samples ${PN}-apps python-opencv"
+
+python populate_packages_prepend () {
+    cv_libdir = d.expand('${libdir}')
+    cv_libdir_dbg = d.expand('${libdir}/.debug')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
+    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
+
+    pn = d.getVar('PN', 1)
+    metapkg =  pn + '-dev'
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    blacklist = [ metapkg ]
+    metapkg_rdepends = [ ]
+    packages = d.getVar('PACKAGES', 1).split()
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
+            metapkg_rdepends.append(pkg)
+    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
+
+    metapkg =  pn
+    blacklist = [ metapkg ]
+    metapkg_rdepends = [ ]
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
+            metapkg_rdepends.append(pkg)
+    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+
+}
+
+PACKAGES_DYNAMIC += "^libopencv-.*"
+
+FILES_${PN} = ""
+FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
+FILES_${PN}-dbg += "${libdir}/.debug"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
+FILES_${PN}-doc = "${datadir}/OpenCV/doc"
+FILES_${PN}-java = "${datadir}/OpenCV/java"
+FILES_${PN}-java-dbg = "${datadir}/OpenCV/java/.debug/"
+FILES_${PN}-samples = "${datadir}/OpenCV/samples/"
+FILES_${PN}-samples-dbg = "${datadir}/OpenCV/samples/bin/.debug"
+
+INSANE_SKIP_${PN}-apps = "staticdev"
+INSANE_SKIP_${PN}-java = "libdir"
+INSANE_SKIP_${PN}-java-dbg = "libdir"
+
+ALLOW_EMPTY_${PN} = "1"
+
+SUMMARY_python-opencv = "Python bindings to opencv"
+FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python-opencv = "python-core python-numpy"
+
+do_install_append() {
+    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
+    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
+
+    # Move Python files into correct library folder (for multilib build)
+    if [ "$libdir" != "/usr/lib" ]; then
+        mv ${D}/usr/lib/* ${D}/${libdir}/
+        rm -rf ${D}/usr/lib
+    fi
+
+    install -d ${D}${datadir}/OpenCV/samples/bin/
+    cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
+}
\ No newline at end of file
-- 
2.7.0


