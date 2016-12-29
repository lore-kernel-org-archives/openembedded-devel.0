Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 296906069D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 13:35:12 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id x140so18010849lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 05:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uMPuZwCmZrMAq1lVCVawqgwIgPzkkXboZ1kFSz65j+E=;
	b=iEJpHpnNRcPHVzM7x5zautF4lWt1Ngth4hsJ0c7YQjWGsYIyLDrY2WstiLCbX9G+6s
	pzLoMO4bFtXeI1ed8U+Tv5lfuYAn4WNUA+pbUNIbQlWu1EMfEfnSqtjkOL7BWOsjWYOU
	vxBnU4i+2zSi+4fu07u+U8ve7YHWBrlhOTaEbFDI7x6ZGRqYQS4gTej9QT2GMYGBvm4v
	jvnY7MvhCnf9o2PXbsSh9xG7kp3qgtiQSaDvHqmbX0l0AejbqMbc66xZLbrVTMLM/rek
	mkVVP2i/UW4RraigxWhWHVNpudJ98jRiXgqkeaWUN2iwzp9JTCshi9NG3+VZh0y4mo1B
	9R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uMPuZwCmZrMAq1lVCVawqgwIgPzkkXboZ1kFSz65j+E=;
	b=CmZLgTdSuHChYOCe9rRH+qMAOzgct6PSCW5bfNFKbMcat7Omckn3vM9kpLRFKoADU/
	k1miADR+0xWc4dyp/4gcRdotrPoto2bztBdwcf4Lc6s6tsqAGEvfCVvm1gYOWOK0e9RP
	fjcjjbebTYLL++tEMNnmz/CxDlV9AjqvXbuJoH9jCaebPQTrtv3QQd0too2NUw12PVqb
	isuwv9k3QH0iPoWRhL/NlM9WEQAvhA8pEKQAUyJ27j08iFlTDhzKE56eE5347PmD/46X
	YUyLmeLTIumnbbEcz/kv+jKgH8W5mLytzCGDXM+3voJsxojxGGfQF1hFQSj0XWrWLM5E
	CX7Q==
X-Gm-Message-State: AIkVDXJZNVvRD/nTty4n2dgA0XTSfmPtD548N+RmVmOjJuEhr7vuX53obpUvOA1es3NAQw==
X-Received: by 10.46.0.228 with SMTP id e97mr10315534lji.64.1483018513159;
	Thu, 29 Dec 2016 05:35:13 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	x10sm12988446lja.15.2016.12.29.05.35.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Dec 2016 05:35:11 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, martin.jansa@gmail.com,
	raj.khem@gmail.com
Date: Thu, 29 Dec 2016 14:35:08 +0100
Message-Id: <20161229133508.5584-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161229133508.5584-1-ricardo.ribalda@gmail.com>
References: <20161229133508.5584-1-ricardo.ribalda@gmail.com>
Subject: [PATCH 2/2] opencv: Update to version 3.2
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
X-List-Received-Date: Thu, 29 Dec 2016 13:35:14 -0000

-Only enable protobuf as dependency if dnn module is enabled
-Download manually xfeatures from 3rd party repo
-Remove uneeded fixgcc60patch

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 ...01-3rdparty-ippicv-Use-pre-downloaded-ipp.patch |  2 +-
 .../recipes-support/opencv/opencv/fixgcc60.patch   | 30 ----------------------
 .../opencv/opencv/uselocalxfeatures.patch          | 12 +++++++++
 .../opencv/opencv/useoeprotobuf.patch              | 13 ++++++++++
 .../opencv/{opencv_3.1.bb => opencv_3.2.bb}        | 27 +++++++++++--------
 5 files changed, 43 insertions(+), 41 deletions(-)
 delete mode 100644 meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch
 rename meta-oe/recipes-support/opencv/{opencv_3.1.bb => opencv_3.2.bb} (87%)

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
index d568018b8d91..1077d05be5c6 100644
--- a/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
+++ b/meta-oe/recipes-support/opencv/opencv/0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch
@@ -17,7 +17,7 @@ index a6016dbe10bc..af4062c8e95e 100644
    endif()
  
 +  if(NOT DEFINED OPENCV_ICV_PATH)
-   set(OPENCV_ICV_UNPACK_PATH "${CMAKE_CURRENT_LIST_DIR}/unpack")
+   set(OPENCV_ICV_UNPACK_PATH "${CMAKE_BINARY_DIR}/3rdparty/ippicv")
    set(OPENCV_ICV_PATH "${OPENCV_ICV_UNPACK_PATH}${OPENCV_ICV_PACKAGE_SUBDIR}")
 +  endif()
  
diff --git a/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch b/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
deleted file mode 100644
index 5d0bf97cab63..000000000000
--- a/meta-oe/recipes-support/opencv/opencv/fixgcc60.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-diff --git a/cmake/OpenCVPCHSupport.cmake b/cmake/OpenCVPCHSupport.cmake
-index 28ccc1c6be4f..b0e1cbf77287 100644
---- a/cmake/OpenCVPCHSupport.cmake
-+++ b/cmake/OpenCVPCHSupport.cmake
-@@ -19,7 +19,7 @@ IF(CMAKE_COMPILER_IS_GNUCXX)
-         ARGS ${CMAKE_CXX_COMPILER_ARG1} -dumpversion
-         OUTPUT_VARIABLE gcc_compiler_version)
-     #MESSAGE("GCC Version: ${gcc_compiler_version}")
--    IF(gcc_compiler_version VERSION_GREATER "4.2.-1")
-+    IF(gcc_compiler_version VERSION_GREATER "4.2.-1" AND gcc_compiler_version VERSION_LESS "6.0.0")
-         SET(PCHSupport_FOUND TRUE)
-     ENDIF()
- 
-diff --git a/cmake/OpenCVUtils.cmake b/cmake/OpenCVUtils.cmake
-index 3a23cd73633d..1fea1578b1d9 100644
---- a/cmake/OpenCVUtils.cmake
-+++ b/cmake/OpenCVUtils.cmake
-@@ -76,7 +76,11 @@ function(ocv_include_directories)
-     if("${__abs_dir}" MATCHES "^${OpenCV_SOURCE_DIR}" OR "${__abs_dir}" MATCHES "^${OpenCV_BINARY_DIR}")
-       list(APPEND __add_before "${dir}")
-     else()
--      include_directories(AFTER SYSTEM "${dir}")
-+	    if (gcc_compiler_version VERSION_LESS "6.0.0")
-+		    include_directories(AFTER SYSTEM "${dir}")
-+	    else()
-+		    include_directories(AFTER "${dir}")
-+	    endif()
-     endif()
-   endforeach()
-   include_directories(BEFORE ${__add_before})
diff --git a/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch b/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
new file mode 100644
index 000000000000..a2db48d7c907
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/uselocalxfeatures.patch
@@ -0,0 +1,12 @@
+diff --git a/modules/xfeatures2d/CMakeLists.txt b/modules/xfeatures2d/CMakeLists.txt
+index f295bddaed66..6086e75ec37b 100644
+--- a/modules/xfeatures2d/CMakeLists.txt
++++ b/modules/xfeatures2d/CMakeLists.txt
+@@ -1,5 +1,5 @@
+ set(the_description "Contributed/Experimental Algorithms for Salient 2D Features Detection")
+ ocv_define_module(xfeatures2d opencv_core opencv_imgproc opencv_features2d opencv_calib3d opencv_shape opencv_highgui opencv_videoio opencv_ml
+                   OPTIONAL opencv_cudaarithm WRAP python java)
+-include(cmake/download_vgg.cmake)
+-include(cmake/download_boostdesc.cmake)
++#include(cmake/download_vgg.cmake)
++#include(cmake/download_boostdesc.cmake)
diff --git a/meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch b/meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch
new file mode 100644
index 000000000000..3068bd44d878
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/useoeprotobuf.patch
@@ -0,0 +1,13 @@
+diff --git a/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake b/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake
+index eb2a729cc2eb..8717736484de 100644
+--- a/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake
++++ b/modules/dnn/cmake/OpenCVFindLibProtobuf.cmake
+@@ -24,7 +24,7 @@ if(NOT BUILD_PROTOBUF AND NOT (DEFINED PROTOBUF_INCLUDE_DIR AND DEFINED PROTOBUF
+   find_package(Protobuf QUIET)
+ endif()
+ 
+-if(PROTOBUF_FOUND)
++if(PROTOBUF_FOUND OR (DEFINED PROTOBUF_INCLUDE_DIR AND DEFINED PROTOBUF_LIBRARIES))
+   # nothing
+ else()
+   include(${CMAKE_CURRENT_LIST_DIR}/download_protobuf.cmake)
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
similarity index 87%
rename from meta-oe/recipes-support/opencv/opencv_3.1.bb
rename to meta-oe/recipes-support/opencv/opencv_3.2.bb
index 17805f7a017a..f18aa796f9aa 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
@@ -3,33 +3,40 @@ HOMEPAGE = "http://opencv.org/"
 SECTION = "libs"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0ea90d28b4de883d7af5e6711f14f7bf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2b2f8752cc5edf504d283107d033f544"
 
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 
-DEPENDS = "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp protobuf protobuf-native"
+DEPENDS = "libtool swig swig-native python bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "92387b1ef8fad15196dd5f7fb4931444a68bc93a"
-SRCREV_contrib = "5409d5ad560523c85c6796cc5a009347072d883c"
-SRCREV_party3 = "81a676001ca8075ada498583e4166079e5744668"
+SRCREV_opencv = "70bbf17b133496bd7d54d034b0f94bd869e0e810"
+SRCREV_contrib = "86342522b0eb2b16fa851c020cc4e0fef4e010b7"
+SRCREV_ipp = "81a676001ca8075ada498583e4166079e5744668"
+SRCREV_bootdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
+SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 IPP_MD5 = "808b791a6eac9ed78d32a7666804320e"
 
 SRCREV_FORMAT = "opencv"
 SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
     git://github.com/opencv/opencv_contrib.git;destsuffix=contrib;name=contrib \
-    git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=party3;name=party3 \
+    git://github.com/opencv/opencv_3rdparty.git;branch=ippicv/master_20151201;destsuffix=ipp;name=ipp \
+    git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=bootdesc;name=bootdesc \
+    git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=vgg;name=vgg \
     file://0001-3rdparty-ippicv-Use-pre-downloaded-ipp.patch \
-    file://fixgcc60.patch \
     file://fixpkgconfig.patch \
+    file://uselocalxfeatures.patch;patchdir=../contrib/ \
+    file://useoeprotobuf.patch;patchdir=../contrib/ \
 "
 
-PV = "3.1+git${SRCPV}"
+PV = "3.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
 do_unpack_extra() {
-    tar xzf ${WORKDIR}/party3/ippicv/ippicv_linux_20151201.tgz -C ${WORKDIR}
+    tar xzf ${WORKDIR}/ipp/ippicv/ippicv_linux_20151201.tgz -C ${WORKDIR}
+    cp ${WORKDIR}/vgg/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
+    cp ${WORKDIR}/bootdesc/*.i ${WORKDIR}/contrib/modules/xfeatures2d/src
 }
 addtask unpack_extra after do_unpack before do_patch
 
@@ -52,7 +59,7 @@ PACKAGECONFIG ??= "python3 eigen jpeg png tiff v4l libv4l gstreamer samples tbb
 
 PACKAGECONFIG[amdblas] = "-DWITH_OPENCLAMDBLAS=ON,-DWITH_OPENCLAMDBLAS=OFF,libclamdblas,"
 PACKAGECONFIG[amdfft] = "-DWITH_OPENCLAMDFFT=ON,-DWITH_OPENCLAMDFFT=OFF,libclamdfft,"
-PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON,-DBUILD_opencv_dnn=OFF,lapack,"
+PACKAGECONFIG[dnn] = "-DBUILD_opencv_dnn=ON -DUPDATE_PROTO_FILES=ON -DBUILD_PROTOBUF=OFF,-DBUILD_opencv_dnn=OFF,lapack protobuf protobuf-native,"
 PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen gflags glog,"
 PACKAGECONFIG[gphoto2] = "-DWITH_GPHOTO2=ON,-DWITH_GPHOTO2=OFF,libgphoto2,"
 PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER=ON,-DWITH_GSTREAMER=OFF,gstreamer1.0 gstreamer1.0-plugins-base,"
-- 
2.11.0


