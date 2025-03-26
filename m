Return-Path: <quic_ptak@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29A0C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 09:20:47 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.18016.1742980845519097208
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 02:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=hv4Dt1OS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: ptak@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q7360x026021
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 09:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Kn4E7dALx1LSidzYIM4WGOK4YCYOHNY2vOH
	kZxMULGE=; b=hv4Dt1OSpmYUkgCnVndxCoqXYejal5XL8JvvA6+0ImpbaTE+fsS
	ZoxLjx1RGGX48FpbielpliVhHTVC2TF13fmnrW7dfeGhW/Y4hLfqGUzD2s8Xl6NZ
	/GPtSaFoKn7sZE7SAiLMEVGVATYjobk/VUwAgi/OuLlqxvK+BEOHjSODGP8hs2kI
	ZplB6Im+eRgUEa61qproHabcvtvyr+tz29pNnwE6aWXfcJzghu1OOtaYtgRxfdA3
	jHX1P68t9TbFAaALfUF21SGZPlDNupjAsZKNWKMIQpKrhASL3qKutt/jyK4KcRMd
	ncbQYsmZurfpVB5Ys5d/52k//49fmSnr6iA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xdsww1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 09:20:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q9KftY013895
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 09:20:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45kk0gjt27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 09:20:41 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52Q9KeI0013890
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 09:20:40 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ptak-hyd.qualcomm.com [10.213.96.58])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52Q9KeHf013889
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 09:20:40 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2387883)
	id 07C8CB93; Wed, 26 Mar 2025 14:50:40 +0530 (+0530)
From: Pulkit Singh Tak <quic_ptak@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: quic_sssanjee@quicinc.com, quic_ptak@quicinc.com,
        quic_vkaruchu@quicinc.com
Subject: [meta-oe][PATCH V2] OpenCV: Adding FastCV-HAL enablement option as packageconfig
Date: Wed, 26 Mar 2025 14:49:29 +0530
Message-Id: <20250326091928.1846561-1-quic_ptak@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7Lxl8XyRfTIsOTsTM921vi-zDH_e_Il4
X-Proofpoint-GUID: 7Lxl8XyRfTIsOTsTM921vi-zDH_e_Il4
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e3c6ec cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t8zLzUgvAAAA:20 a=COk6AnOGAAAA:8 a=yT2DQZ9hev52F85wY-AA:9 a=RVmHIydaz68A:10
 a=TjNXssC_j7lpFel5tvFf:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_02,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 09:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116291

Adding patches to support fastcv static lib compilation.
Removal of cluster ecludian tests support.
These are temporary patches to be removed in next release.

Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
---
 ...ng-fastcv-static-lib-for-compilation.patch |  96 +++++
 ...oved-cluster-euclidean-in-fastcv-ext.patch | 371 ++++++++++++++++++
 .../recipes-support/opencv/opencv_4.11.0.bb   |  15 +-
 3 files changed, 479 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-static-lib-for-compilation.patch
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-euclidean-in-fastcv-ext.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-static-lib-for-compilation.patch b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-static-lib-for-compilation.patch
new file mode 100644
index 0000000000..f822e5066b
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-static-lib-for-compilation.patch
@@ -0,0 +1,96 @@
+From 0141830e67ac7c60c474ab3c1e7d3e30c27c7943 Mon Sep 17 00:00:00 2001
+From: Pulkit Singh Tak <quic_ptak@quicinc.com>
+Date: Mon, 10 Feb 2025 15:10:26 +0530
+Subject: [PATCH] FROMLIST: Using fastcv static lib for compilation
+
+Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
+Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/26917]
+---
+ 3rdparty/fastcv/fastcv.cmake   |  9 +++++----
+ cmake/OpenCVFindLibsPerf.cmake | 23 ++++++++++++++++-------
+ 2 files changed, 21 insertions(+), 11 deletions(-)
+
+diff --git a/3rdparty/fastcv/fastcv.cmake b/3rdparty/fastcv/fastcv.cmake
+index b8172705ca..12c6616a16 100644
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
+@@ -40,4 +41,4 @@ function(download_fastcv root_dir)
+     message(WARNING "FastCV: package download failed!")
+   endif()
+ 
+-endfunction()
++endfunction()
+\ No newline at end of file
+diff --git a/cmake/OpenCVFindLibsPerf.cmake b/cmake/OpenCVFindLibsPerf.cmake
+index c2380e6ce5..a31842dfbb 100644
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
+-endif(WITH_FASTCV)
++endif(WITH_FASTCV)
+\ No newline at end of file
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-euclidean-in-fastcv-ext.patch b/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-euclidean-in-fastcv-ext.patch
new file mode 100644
index 0000000000..cb454ccf14
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-euclidean-in-fastcv-ext.patch
@@ -0,0 +1,371 @@
+From d7db8fb8d715a86d0939797bc08073895c475989 Mon Sep 17 00:00:00 2001
+From: Pulkit Singh Tak <quic_ptak@quicinc.com>
+Date: Thu, 13 Feb 2025 17:55:08 +0530
+Subject: [PATCH] PENDING: Removed cluster euclidean in fastcv ext
+
+Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
+Upstream-Status: Pending
+---
+ modules/fastcv/include/opencv2/fastcv.hpp     |   1 -
+ .../fastcv/include/opencv2/fastcv/cluster.hpp |  43 ------
+ .../fastcv/perf/perf_cluster_euclidean.cpp    |  79 -----------
+ modules/fastcv/src/cluster_euclidean.cpp      |  66 ----------
+ .../fastcv/test/test_cluster_euclidean.cpp    | 124 ------------------
+ 5 files changed, 313 deletions(-)
+ delete mode 100644 modules/fastcv/include/opencv2/fastcv/cluster.hpp
+ delete mode 100644 modules/fastcv/perf/perf_cluster_euclidean.cpp
+ delete mode 100644 modules/fastcv/src/cluster_euclidean.cpp
+ delete mode 100644 modules/fastcv/test/test_cluster_euclidean.cpp
+
+diff --git a/modules/fastcv/include/opencv2/fastcv.hpp b/modules/fastcv/include/opencv2/fastcv.hpp
+index af188dfc..c5deb5e0 100644
+--- a/modules/fastcv/include/opencv2/fastcv.hpp
++++ b/modules/fastcv/include/opencv2/fastcv.hpp
+@@ -11,7 +11,6 @@
+ #include "opencv2/fastcv/arithm.hpp"
+ #include "opencv2/fastcv/bilateralFilter.hpp"
+ #include "opencv2/fastcv/blur.hpp"
+-#include "opencv2/fastcv/cluster.hpp"
+ #include "opencv2/fastcv/draw.hpp"
+ #include "opencv2/fastcv/edges.hpp"
+ #include "opencv2/fastcv/fast10.hpp"
+diff --git a/modules/fastcv/include/opencv2/fastcv/cluster.hpp b/modules/fastcv/include/opencv2/fastcv/cluster.hpp
+deleted file mode 100644
+index 46ac7ad1..00000000
+--- a/modules/fastcv/include/opencv2/fastcv/cluster.hpp
++++ /dev/null
+@@ -1,43 +0,0 @@
+-/*
+- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+- * SPDX-License-Identifier: Apache-2.0
+-*/
+-
+-#ifndef OPENCV_FASTCV_CLUSTER_HPP
+-#define OPENCV_FASTCV_CLUSTER_HPP
+-
+-#include <opencv2/core.hpp>
+-
+-namespace cv {
+-namespace fastcv {
+-
+-//! @addtogroup fastcv
+-//! @{
+-
+-/**
+- * @brief Clusterizes N input points in D-dimensional space into K clusters
+- *        Accepts 8-bit unsigned integer points
+- *        Provides faster execution time than cv::kmeans on Qualcomm's processors
+- * @param points            Points array of type 8u, each row represets a point.
+- *                          Size is N rows by D columns, can be non-continuous.
+- * @param clusterCenters    Initial cluster centers array of type 32f, each row represents a center.
+- *                          Size is K rows by D columns, can be non-continuous.
+- * @param newClusterCenters Resulting cluster centers array of type 32f, each row represents found center.
+- *                          Size is set to be K rows by D columns.
+- * @param clusterSizes      Resulting cluster member counts array of type uint32, size is set to be 1 row by K columns.
+- * @param clusterBindings   Resulting points indices array of type uint32, each index tells to which cluster the corresponding point belongs to.
+- *                          Size is set to be 1 row by numPointsUsed columns.
+- * @param clusterSumDists   Resulting distance sums array of type 32f, each number is a sum of distances between each cluster center to its belonging points.
+- *                          Size is set to be 1 row by K columns
+- * @param numPointsUsed     Number of points to clusterize starting from 0 to numPointsUsed-1 inclusively. Sets to N if negative.
+- */
+-CV_EXPORTS_W void clusterEuclidean(InputArray points, InputArray clusterCenters, OutputArray newClusterCenters,
+-                                   OutputArray clusterSizes, OutputArray clusterBindings, OutputArray clusterSumDists,
+-                                   int numPointsUsed = -1);
+-
+-//! @}
+-
+-} // fastcv::
+-} // cv::
+-
+-#endif // OPENCV_FASTCV_CLUSTER_HPP
+diff --git a/modules/fastcv/perf/perf_cluster_euclidean.cpp b/modules/fastcv/perf/perf_cluster_euclidean.cpp
+deleted file mode 100644
+index 20bc31a7..00000000
+--- a/modules/fastcv/perf/perf_cluster_euclidean.cpp
++++ /dev/null
+@@ -1,79 +0,0 @@
+-/*
+- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+- * SPDX-License-Identifier: Apache-2.0
+-*/
+-
+-#include "perf_precomp.hpp"
+-
+-namespace opencv_test {
+-
+-typedef std::tuple<int /* nPts */, int /*nDims*/, int /*nClusters*/> ClusterEuclideanPerfParams;
+-typedef perf::TestBaseWithParam<ClusterEuclideanPerfParams> ClusterEuclideanPerfTest;
+-
+-PERF_TEST_P(ClusterEuclideanPerfTest, run,
+-            ::testing::Combine(::testing::Values(100, 1000, 10000), // nPts
+-                               ::testing::Values(2, 10, 32),        // nDims
+-                               ::testing::Values(5, 10, 16))        // nClusters
+-           )
+-{
+-    auto p = GetParam();
+-    int nPts      = std::get<0>(p);
+-    int nDims     = std::get<1>(p);
+-    int nClusters = std::get<2>(p);
+-
+-    Mat points(nPts, nDims, CV_8U);
+-    Mat clusterCenters(nClusters, nDims, CV_32F);
+-
+-    Mat trueMeans(nClusters, nDims, CV_32F);
+-    Mat stddevs(nClusters, nDims, CV_32F);
+-    std::vector<int> trueClusterSizes(nClusters, 0);
+-    std::vector<int> trueClusterBindings(nPts, 0);
+-    std::vector<float> trueSumDists(nClusters, 0);
+-
+-    cv::RNG& rng = cv::theRNG();
+-    for (int i = 0; i < nClusters; i++)
+-    {
+-        Mat mean(1, nDims, CV_64F), stdev(1, nDims, CV_64F);
+-        rng.fill(mean,  cv::RNG::UNIFORM, 0, 256);
+-        rng.fill(stdev, cv::RNG::UNIFORM, 5.f, 16);
+-        int lo =    i    * nPts / nClusters;
+-        int hi = (i + 1) * nPts / nClusters;
+-
+-        for (int d = 0; d < nDims; d++)
+-        {
+-            rng.fill(points.col(d).rowRange(lo, hi), cv::RNG::NORMAL,
+-                     mean.at<double>(d), stdev.at<double>(d));
+-        }
+-
+-        float sd = 0;
+-        for (int j = lo; j < hi; j++)
+-        {
+-            Mat pts64f;
+-            points.row(j).convertTo(pts64f, CV_64F);
+-            sd += cv::norm(mean, pts64f, NORM_L2);
+-            trueClusterBindings.at(j) = i;
+-            trueClusterSizes.at(i)++;
+-        }
+-        trueSumDists.at(i) = sd;
+-
+-        // let's shift initial cluster center a bit
+-        Mat(mean + stdev * 0.5).copyTo(clusterCenters.row(i));
+-
+-        mean.copyTo(trueMeans.row(i));
+-        stdev.copyTo(stddevs.row(i));
+-    }
+-
+-    while(next())
+-    {
+-        Mat newClusterCenters;
+-        std::vector<int> clusterSizes, clusterBindings;
+-        std::vector<float> clusterSumDists;
+-        startTimer();
+-        cv::fastcv::clusterEuclidean(points, clusterCenters, newClusterCenters, clusterSizes, clusterBindings, clusterSumDists);
+-        stopTimer();
+-    }
+-
+-    SANITY_CHECK_NOTHING();
+-}
+-
+-} // namespace
+diff --git a/modules/fastcv/src/cluster_euclidean.cpp b/modules/fastcv/src/cluster_euclidean.cpp
+deleted file mode 100644
+index a50b027c..00000000
+--- a/modules/fastcv/src/cluster_euclidean.cpp
++++ /dev/null
+@@ -1,66 +0,0 @@
+-/*
+- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+- * SPDX-License-Identifier: Apache-2.0
+-*/
+-
+-#include "precomp.hpp"
+-
+-namespace cv {
+-namespace fastcv {
+-
+-void clusterEuclidean(InputArray _points, InputArray _clusterCenters, OutputArray _newClusterCenters,
+-                      OutputArray _clusterSizes, OutputArray _clusterBindings, OutputArray _clusterSumDists,
+-                      int numPointsUsed)
+-{
+-    INITIALIZATION_CHECK;
+-
+-    CV_Assert(!_points.empty() && _points.type() == CV_8UC1);
+-    int nPts      = _points.rows();
+-    int nDims     = _points.cols();
+-    int ptsStride = _points.step();
+-
+-    CV_Assert(!_clusterCenters.empty() && _clusterCenters.depth() == CV_32F);
+-    int nClusters           = _clusterCenters.rows();
+-    int clusterCenterStride = _clusterCenters.step();
+-
+-    CV_Assert(_clusterCenters.cols() == nDims);
+-
+-    CV_Assert(numPointsUsed <= nPts);
+-    if (numPointsUsed < 0)
+-    {
+-        numPointsUsed = nPts;
+-    }
+-
+-    _newClusterCenters.create(nClusters, nDims, CV_32FC1);
+-    _clusterSizes.create(1, nClusters, CV_32SC1);
+-    _clusterBindings.create(1, numPointsUsed, CV_32SC1);
+-    _clusterSumDists.create(1, nClusters, CV_32FC1);
+-
+-    Mat points            = _points.getMat();
+-    Mat clusterCenters    = _clusterCenters.getMat();
+-    Mat newClusterCenters = _newClusterCenters.getMat();
+-    Mat clusterSizes      = _clusterSizes.getMat();
+-    Mat clusterBindings   = _clusterBindings.getMat();
+-    Mat clusterSumDists   = _clusterSumDists.getMat();
+-
+-    int result = fcvClusterEuclideanu8(points.data,
+-                                       nPts,
+-                                       nDims,
+-                                       ptsStride,
+-                                       numPointsUsed,
+-                                       nClusters,
+-                                       (float32_t*)clusterCenters.data,
+-                                       clusterCenterStride,
+-                                       (float32_t*)newClusterCenters.data,
+-                                       (uint32_t*)clusterSizes.data,
+-                                       (uint32_t*)clusterBindings.data,
+-                                       (float32_t*)clusterSumDists.data);
+-
+-    if (result)
+-    {
+-        CV_Error(cv::Error::StsInternal, cv::format("Failed to clusterize, error code: %d", result));
+-    }
+-}
+-
+-} // fastcv::
+-} // cv::
+diff --git a/modules/fastcv/test/test_cluster_euclidean.cpp b/modules/fastcv/test/test_cluster_euclidean.cpp
+deleted file mode 100644
+index c108f754..00000000
+--- a/modules/fastcv/test/test_cluster_euclidean.cpp
++++ /dev/null
+@@ -1,124 +0,0 @@
+-/*
+- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+- * SPDX-License-Identifier: Apache-2.0
+-*/
+-
+-#include "test_precomp.hpp"
+-
+-namespace opencv_test { namespace {
+-
+-// nPts, nDims, nClusters
+-typedef std::tuple<int, int, int> ClusterEuclideanTestParams;
+-class ClusterEuclideanTest : public ::testing::TestWithParam<ClusterEuclideanTestParams> {};
+-
+-TEST_P(ClusterEuclideanTest, accuracy)
+-{
+-    auto p = GetParam();
+-    int nPts      = std::get<0>(p);
+-    int nDims     = std::get<1>(p);
+-    int nClusters = std::get<2>(p);
+-
+-    Mat points(nPts, nDims, CV_8U);
+-    Mat clusterCenters(nClusters, nDims, CV_32F);
+-
+-    Mat trueMeans(nClusters, nDims, CV_32F);
+-    Mat stddevs(nClusters, nDims, CV_32F);
+-    std::vector<int> trueClusterSizes(nClusters, 0);
+-    std::vector<int> trueClusterBindings(nPts, 0);
+-    std::vector<float> trueSumDists(nClusters, 0);
+-
+-    cv::RNG& rng = cv::theRNG();
+-    for (int i = 0; i < nClusters; i++)
+-    {
+-        Mat mean(1, nDims, CV_64F), stdev(1, nDims, CV_64F);
+-        rng.fill(mean,  cv::RNG::UNIFORM, 0, 256);
+-        rng.fill(stdev, cv::RNG::UNIFORM, 5.f, 16);
+-        int lo =    i    * nPts / nClusters;
+-        int hi = (i + 1) * nPts / nClusters;
+-
+-        for (int d = 0; d < nDims; d++)
+-        {
+-            rng.fill(points.col(d).rowRange(lo, hi), cv::RNG::NORMAL,
+-                     mean.at<double>(d), stdev.at<double>(d));
+-        }
+-
+-        float sd = 0;
+-        for (int j = lo; j < hi; j++)
+-        {
+-            Mat pts64f;
+-            points.row(j).convertTo(pts64f, CV_64F);
+-            sd += cv::norm(mean, pts64f, NORM_L2);
+-            trueClusterBindings.at(j) = i;
+-            trueClusterSizes.at(i)++;
+-        }
+-        trueSumDists.at(i) = sd;
+-
+-        // let's shift initial cluster center a bit
+-        Mat(mean + stdev * 0.5).copyTo(clusterCenters.row(i));
+-
+-        mean.copyTo(trueMeans.row(i));
+-        stdev.copyTo(stddevs.row(i));
+-    }
+-
+-    Mat newClusterCenters;
+-    std::vector<int> clusterSizes, clusterBindings;
+-    std::vector<float> clusterSumDists;
+-    cv::fastcv::clusterEuclidean(points, clusterCenters, newClusterCenters, clusterSizes, clusterBindings, clusterSumDists);
+-
+-    if (cvtest::debugLevel > 0 && nDims == 2)
+-    {
+-        Mat draw(256, 256, CV_8UC3, Scalar(0));
+-        for (int i = 0; i < nPts; i++)
+-        {
+-            int x = std::rint(points.at<uchar>(i, 0));
+-            int y = std::rint(points.at<uchar>(i, 1));
+-            draw.at<Vec3b>(y, x) = Vec3b::all(128);
+-        }
+-        for (int i = 0; i < nClusters; i++)
+-        {
+-            float cx = trueMeans.at<double>(i, 0);
+-            float cy = trueMeans.at<double>(i, 1);
+-            draw.at<Vec3b>(cy, cx) = Vec3b(0, 255, 0);
+-
+-            float sx = stddevs.at<double>(i, 0);
+-            float sy = stddevs.at<double>(i, 1);
+-            cv::ellipse(draw, Point(cx, cy), Size(sx, sy), 0, 0, 360, Scalar(255, 0, 0));
+-
+-            float ox = clusterCenters.at<float>(i, 0);
+-            float oy = clusterCenters.at<float>(i, 1);
+-            draw.at<Vec3b>(oy, ox) = Vec3b(0, 0, 255);
+-
+-            float nx = newClusterCenters.at<float>(i, 0);
+-            float ny = newClusterCenters.at<float>(i, 1);
+-            draw.at<Vec3b>(ny, nx) = Vec3b(255, 255, 0);
+-        }
+-        cv::imwrite(cv::format("draw_%d_%d_%d.png", nPts, nDims, nClusters), draw);
+-    }
+-
+-    {
+-        std::vector<double> diffs;
+-        for (int i = 0; i < nClusters; i++)
+-        {
+-            double cs = std::abs((trueClusterSizes[i] - clusterSizes[i]) / double(trueClusterSizes[i]));
+-            diffs.push_back(cs);
+-        }
+-        double normL2  = cv::norm(diffs, NORM_L2) / nClusters;
+-
+-        EXPECT_LT(normL2, 0.392);
+-    }
+-
+-    {
+-        Mat bindings8u, trueBindings8u;
+-        Mat(clusterBindings).convertTo(bindings8u, CV_8U);
+-        Mat(trueClusterBindings).convertTo(trueBindings8u, CV_8U);
+-        double normH = cv::norm(bindings8u, trueBindings8u, NORM_HAMMING) / nPts;
+-        EXPECT_LT(normH, 0.658);
+-    }
+-}
+-
+-INSTANTIATE_TEST_CASE_P(FastCV_Extension, ClusterEuclideanTest,
+-                        ::testing::Combine(::testing::Values(100, 1000, 10000), // nPts
+-                                           ::testing::Values(2, 10, 32),        // nDims
+-                                           ::testing::Values(5, 10, 16)));      // nClusters
+-
+-}} // namespaces opencv_test, ::
+\ No newline at end of file
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 1613b6a3ed..0587599253 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -16,27 +16,35 @@ SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
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
            file://download.patch \
            file://0001-Make-ts-module-external.patch \
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
-           file://0001-core-fixed-VSX-intrinsics-implementation.patch \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
 S = "${WORKDIR}/git"
 
+# Disabling cluster ecludian tests in fastcv EXTN as it causes fastcv EXTN tests to be crashed.
+# Adding support for fastcv static lib as per Upstream OpenCV.
+# These are temporary patches, will be removed in next release.
+
+SRC_URI += "file://0001-PENDING-Removed-cluster-euclidean-in-fastcv-ext.patch;patchdir=${S}/contrib/ \
+            file://0001-FROMLIST-Using-fastcv-static-lib-for-compilation.patch"
+
 # OpenCV wants to download more files during configure.  We download these in
 # do_fetch and construct a source cache in the format it expects
 OPENCV_DLDIR = "${WORKDIR}/downloads"
@@ -61,6 +69,7 @@ do_unpack_extra() {
     cache data ${S}/face/*.dat
     cache wechat_qrcode ${S}/wechat_qrcode/*.caffemodel
     cache wechat_qrcode ${S}/wechat_qrcode/*.prototxt
+    cache fastcv ${S}/fastcv/fastcv/*.tgz
 }
 addtask unpack_extra after do_unpack before do_patch
 
@@ -71,7 +80,6 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     -DENABLE_PRECOMPILED_HEADERS=OFF \
     -DCMAKE_SKIP_RPATH=ON \
     -DWITH_IPP=OFF \
-    -DWITH_FASTCV=OFF \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     -DOPENCV_ALLOW_DOWNLOADS=OFF \
@@ -122,6 +130,7 @@ PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON,-DBUILD_TESTS=OFF,,"
 PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON ,-DWITH_FASTCV=OFF,,"
 
 inherit pkgconfig cmake setuptools3-base python3native
 
-- 
2.34.1


