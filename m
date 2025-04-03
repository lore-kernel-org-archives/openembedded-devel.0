Return-Path: <quic_ptak@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0135C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 11:27:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.11055.1743679616215978073
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Apr 2025 04:26:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=dsz7b06d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: ptak@qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5339sLHB000988
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Apr 2025 11:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8uFzAl5LEeZ7r2aUE0jU84XsmOOZcI8S72d
	lWiUl2Sg=; b=dsz7b06ddiN6KHzropozQIBD5Mo5IQC7JSo/C9Wc1Rulvy+Ng6G
	AUm8tzSPhcIeQ4hjq5SZ2uD919SWSJEP9qOFLZdBZ9X3/f0WlIFOOpfnrDYr/FkD
	+nQ/APcbuK4Pa5I2CoD3N8WFTUEZwrrc/fbjjtl2FrjiWk6/QCy0KnG0B6vpUZq4
	VYWCSQUYhP/ewTN3PmtPOTbYjoHuiXC/QI16pgwprp6ZAm9eKCEniR8eyaDVnbJd
	rsbMrlQS9cZlf8dCshR1RTht2LxUIJWU/5aUxxJFlMdwLNGZiJ6bd+4WZHA5PKXk
	IJaA5c24qW3U9lTbCp7Hw3wtxxZXpeUyuow==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45s36a3fqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 11:26:55 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 533BQpgr027696
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Apr 2025 11:26:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45p9xm3dc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 11:26:51 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 533BQpbj027691
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Apr 2025 11:26:51 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ptak-hyd.qualcomm.com [10.213.96.58])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 533BQp6e027689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 11:26:51 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2387883)
	id DFAA2BCD; Thu,  3 Apr 2025 16:56:50 +0530 (+0530)
From: Pulkit Singh Tak <quic_ptak@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: quic_sssanjee@quicinc.com, quic_ptak@quicinc.com,
        quic_vkaruchu@quicinc.com
Subject: [meta-oe][PATCH V3] opencv: Adding FastCV-HAL enablement option as packageconfig
Date: Thu,  3 Apr 2025 16:55:52 +0530
Message-Id: <20250403112551.3639152-1-quic_ptak@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=W6M4VQWk c=1 sm=1 tr=0 ts=67ee707f cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=t8zLzUgvAAAA:20 a=COk6AnOGAAAA:8 a=o35ajisbUdZA1cK_IaQA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: HCJ4k7Nf0HMILGNL2AcEstI4Mnxhn0Pi
X-Proofpoint-GUID: HCJ4k7Nf0HMILGNL2AcEstI4Mnxhn0Pi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_04,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504030045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Apr 2025 11:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116540

Migration to Fastcv static lib for Fastcv Extns and
adding fastcv enablement option as packageconfig.

Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
---
 ...o-static-instance-of-FastCV-on-Linux.patch | 87 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.11.0.bb   |  8 +-
 2 files changed, 93 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch
new file mode 100644
index 0000000000..dd3c9a7a82
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch
@@ -0,0 +1,87 @@
+From e517347450636012e5f7a65a504e4ac9e1224c50 Mon Sep 17 00:00:00 2001
+From: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
+Date: Thu, 13 Feb 2025 09:17:08 +0300
+Subject: [PATCH] FROMLIST: Switch to static instance of FastCV on Linux.
+
+Signed-off-by: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
+Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/26917]
+---
+ 3rdparty/fastcv/fastcv.cmake   |  7 ++++---
+ cmake/OpenCVFindLibsPerf.cmake | 21 +++++++++++++++------
+ 2 files changed, 19 insertions(+), 9 deletions(-)
+
+diff --git a/3rdparty/fastcv/fastcv.cmake b/3rdparty/fastcv/fastcv.cmake
+index b8172705ca..5c81c11300 100644
+--- a/3rdparty/fastcv/fastcv.cmake
++++ b/3rdparty/fastcv/fastcv.cmake
+@@ -1,7 +1,7 @@
+ function(download_fastcv root_dir)
+ 
+   # Commit SHA in the opencv_3rdparty repo
+-  set(FASTCV_COMMIT "dc5d58018f3af915a8d209386d2c58c0501c0f2c")
++  set(FASTCV_COMMIT "f4413cc2ab7233fdfc383a4cded402c072677fb0")
+ 
+   # Define actual FastCV versions
+   if(ANDROID)
+@@ -16,14 +16,15 @@ function(download_fastcv root_dir)
+     endif()
+   elseif(UNIX AND NOT APPLE AND NOT IOS AND NOT XROS)
+     if(AARCH64)
+-      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2024_12_11.tgz")
+-      set(FCV_PACKAGE_HASH  "7b33ad833e6f15ab6d4ec64fa3c17acd")
++      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2025_02_12.tgz")
++      set(FCV_PACKAGE_HASH  "33ac2a59cf3e7d6402eee2e010de1202")
+     else()
+       message("FastCV: fastcv lib for 32-bit Linux is not supported for now!")
+     endif()
+   endif(ANDROID)
+ 
+   # Download Package
++
+   set(OPENCV_FASTCV_URL "https://raw.githubusercontent.com/opencv/opencv_3rdparty/${FASTCV_COMMIT}/fastcv/")
+ 
+   ocv_download( FILENAME        ${FCV_PACKAGE_NAME}
+diff --git a/cmake/OpenCVFindLibsPerf.cmake b/cmake/OpenCVFindLibsPerf.cmake
+index c2380e6ce5..c5fb628c44 100644
+--- a/cmake/OpenCVFindLibsPerf.cmake
++++ b/cmake/OpenCVFindLibsPerf.cmake
+@@ -181,7 +181,14 @@ endif(WITH_KLEIDICV)
+ if(WITH_FASTCV)
+   if((EXISTS ${FastCV_INCLUDE_PATH}) AND (EXISTS ${FastCV_LIB_PATH}))
+     message(STATUS "Use external FastCV ${FastCV_INCLUDE_PATH}, ${FastCV_LIB_PATH}")
+-    set(HAVE_FASTCV TRUE CACHE BOOL "FastCV status")
++    find_library(FASTCV_LIBRARY NAMES "fastcv"
++                 PATHS "${FastCV_LIB_PATH}" NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
++    mark_as_advanced(FASTCV_LIBRARY)
++    if (FASTCV_LIBRARY)
++      set(HAVE_FASTCV TRUE CACHE BOOL "FastCV status")
++    else()
++      set(HAVE_FASTCV FALSE CACHE BOOL "FastCV status")
++    endif()
+   else()
+     include("${OpenCV_SOURCE_DIR}/3rdparty/fastcv/fastcv.cmake")
+     set(FCV_ROOT_DIR "${OpenCV_BINARY_DIR}/3rdparty/fastcv")
+@@ -190,13 +197,15 @@ if(WITH_FASTCV)
+       set(FastCV_INCLUDE_PATH "${FCV_ROOT_DIR}/inc" CACHE PATH "FastCV includes directory")
+       set(FastCV_LIB_PATH "${FCV_ROOT_DIR}/libs" CACHE PATH "FastCV library directory")
+       ocv_install_3rdparty_licenses(FastCV "${OpenCV_BINARY_DIR}/3rdparty/fastcv/LICENSE")
+-      install(FILES "${FastCV_LIB_PATH}/libfastcvopt.so"
+-              DESTINATION "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "bin")
++      if(ANDROID)
++        set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcvopt.so" CACHE PATH "FastCV library")
++        install(FILES "${FASTCV_LIBRARY}" DESTINATION "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "bin")
++      else()
++        set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcv.a" CACHE PATH "FastCV library")
++        install(FILES "${FASTCV_LIBRARY}" DESTINATION "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "dev")
++      endif()
+     else()
+       set(HAVE_FASTCV FALSE CACHE BOOL "FastCV status")
+     endif()
+   endif()
+-  if(HAVE_FASTCV)
+-    set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcvopt.so" CACHE PATH "FastCV library")
+-  endif()
+ endif(WITH_FASTCV)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 1613b6a3ed..61dc681a39 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -16,15 +16,17 @@ SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
+SRCREV_fastcv = "f4413cc2ab7233fdfc383a4cded402c072677fb0"
 
 
-SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg"
+SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg_fastcv"
 SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=https \
            git://github.com/opencv/opencv_contrib.git;destsuffix=git/contrib;name=contrib;branch=4.x;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_boostdesc_20161012;destsuffix=git/boostdesc;name=boostdesc;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=git/vgg;name=vgg;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=git/face;name=face;protocol=https \
            git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=git/wechat_qrcode;name=wechat-qrcode;protocol=https \
+           git://github.com/opencv/opencv_3rdparty.git;branch=fastcv/4.x_20250212;destsuffix=git/fastcv;name=fastcv;protocol=https \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
@@ -32,6 +34,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
            file://0001-core-fixed-VSX-intrinsics-implementation.patch \
+           file://0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
@@ -61,6 +64,7 @@ do_unpack_extra() {
     cache data ${S}/face/*.dat
     cache wechat_qrcode ${S}/wechat_qrcode/*.caffemodel
     cache wechat_qrcode ${S}/wechat_qrcode/*.prototxt
+    cache fastcv ${S}/fastcv/fastcv/*.tgz
 }
 addtask unpack_extra after do_unpack before do_patch
 
@@ -71,7 +75,6 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     -DENABLE_PRECOMPILED_HEADERS=OFF \
     -DCMAKE_SKIP_RPATH=ON \
     -DWITH_IPP=OFF \
-    -DWITH_FASTCV=OFF \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     -DOPENCV_ALLOW_DOWNLOADS=OFF \
@@ -122,6 +125,7 @@ PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON,-DBUILD_TESTS=OFF,,"
 PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON ,-DWITH_FASTCV=OFF,,"
 
 inherit pkgconfig cmake setuptools3-base python3native
 
-- 
2.34.1


