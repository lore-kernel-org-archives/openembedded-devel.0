Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E4EC3600B
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 14:37:32 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.41026.1742827046972844008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Mar 2025 07:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nATioLgz;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3feb3f54339so3271988b6e.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742827046; x=1743431846; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3g/OfBIHUwoWqnIjvUMTCF6DOVLfgz34+Lkn3LnZjI=;
        b=nATioLgzOsUlpPSENv66hKDjkNtYX9TN5vnjLj2djMl6Z5eR0S92cS+TFsJKmFred1
         WfuqveNiiIJzRcBLMhldbaaso0PyRsUO62Oc28D03IbYjQzjgdUP4EwQV+QCFgKjoE/r
         PrZcTrmZZE+ypOlStTS3V1FTY62sDiQnvFqCl38OTS8k9hL8MmU5gUNclV71cZTiVsqm
         yEi8J3hyas4S+f/hhZbgr7DkAoEWlhgFLFQQeToh/EYEbQH3tFSqzJpMe4nUMFAvv3wd
         zrXV9uOfXWtRUKA2AdQKYQLzyfe1f9uLezQ1XcEWo0AqJMkuF27jZ85j6Krkcio/gOLQ
         2rZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742827046; x=1743431846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3g/OfBIHUwoWqnIjvUMTCF6DOVLfgz34+Lkn3LnZjI=;
        b=VpFJxXp5nQAm3zfT6EYcep/js9BUc1x6BklzKrYKiiOdfqY0ENtlWgFZ8KhxSpXtoW
         QqzSatnw8EDf/kJGFQYlLgxmgB8Y/d2w+n5uMxtkg8jEgabGIBsnqjeN36teMdq8AzP+
         /Y4OgJXlcvSv7txMRaJFMVoVd9b5rE/v2WSn78bD7buchPNbTzqM3iMJ4+38aHP5R603
         n4t0R/BWDUpp9Thi5HDFYcwfZThUc3StyGLzPMvoKDrESjcgYK+nD2h64rfD6s2sBFBb
         77xv7KHZXG0pCG8A4zghIRET4JTrI5AmovRvnD0Z7fDJRI/z4b9G6Ss/X12L9RPune+B
         oilg==
X-Gm-Message-State: AOJu0Yz4RrS/W2udKYr5Cw4VV2oXetwqorK1t/QUz3K0Oemq+IS5FpWJ
	RxuD8DWU795ZD7ETOUonM4i1dtyv4G0AS8h7DRdRn82wkNne8TXCK0gvU6Bts1oxsb1wMoZNHm2
	lVNDmbsijbhqeVxqPXPdwH34qhBZAR9gF
X-Gm-Gg: ASbGncuMGuXX0FN+CLFh8byB0xBbUVLgmt36c4aeI6cgSLKm8XBFRET9FCahs73kKEm
	XkLb2SYcOeYcNSvB7iv8nFSTka73BHpTMBBMEomMnPI0RY5IeTCs43b+YTmVNHzUU7Be56Y4UlF
	aCLNs0QyNYB+r1S8DfKyZLgOm6
X-Google-Smtp-Source: AGHT+IFllJgw0uCQ72VyclNzkJ8N1jXTwJPaeGrZE9Xcqn54SNlRlo+cvJL+oH4tZGtgaGmxXvhWURjbGC2CkTWVEb0=
X-Received: by 2002:a05:6808:7003:b0:3f7:d16c:e283 with SMTP id
 5614622812f47-3febf72361bmr9144818b6e.11.1742827045816; Mon, 24 Mar 2025
 07:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250324075502.1255967-1-quic_ptak@quicinc.com>
In-Reply-To: <20250324075502.1255967-1-quic_ptak@quicinc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 07:36:59 -0700
X-Gm-Features: AQ5f1Jr48A66IuFwuMv08-kXvNSyy8rJZglSo3y-FidYFFSh5-hYd2OuRfQ6SzY
Message-ID: <CAMKF1sppogc2vAt26kSCQCVMbxfHyiLXA+OqW6m4BQXxx82cVA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] Adding FastCV-HAL enablement option as packageconfig
To: quic_ptak@quicinc.com
Cc: openembedded-devel@lists.openembedded.org, quic_sssanjee@quicinc.com, 
	quic_vkaruchu@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Mar 2025 14:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116209

On Mon, Mar 24, 2025 at 12:55=E2=80=AFAM Pulkit Singh Tak (Temp) (QUIC) via
lists.openembedded.org <quic_ptak=3Dquicinc.com@lists.openembedded.org>
wrote:
>
> Adding patches to support fastcv static lib compilation
> and removal of cluster ecludian tests support
> These are temporary patches to be removeed in next release.

typo here 'removed'

>
> Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
> ---
>  ...ng-fastcv-static-lib-for-compilation.patch |  96 +++++
>  ...oved-cluster-euclidean-in-fastcv-ext.patch | 371 ++++++++++++++++++
>  .../recipes-support/opencv/opencv_4.11.0.bb   |  14 +-
>  3 files changed, 479 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-U=
sing-fastcv-static-lib-for-compilation.patch
>  create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-PENDING-Re=
moved-cluster-euclidean-in-fastcv-ext.patch
>
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fa=
stcv-static-lib-for-compilation.patch b/meta-oe/recipes-support/opencv/open=
cv/0001-FROMLIST-Using-fastcv-static-lib-for-compilation.patch
> new file mode 100644
> index 0000000000..5fce32f4b8
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-st=
atic-lib-for-compilation.patch
> @@ -0,0 +1,96 @@
> +From 0141830e67ac7c60c474ab3c1e7d3e30c27c7943 Mon Sep 17 00:00:00 2001
> +From: Pulkit Singh Tak <quic_ptak@quicinc.com>
> +Date: Mon, 10 Feb 2025 15:10:26 +0530
> +Subject: [PATCH] FROMLIST: Using fastcv static lib for compilation
> +
> +Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
> +Upstream-Status: SUBMITTED [https://github.com/opencv/opencv/pull/26917]

status should be 'Submitted'

> +---
> + 3rdparty/fastcv/fastcv.cmake   |  9 +++++----
> + cmake/OpenCVFindLibsPerf.cmake | 23 ++++++++++++++++-------
> + 2 files changed, 21 insertions(+), 11 deletions(-)
> +
> +diff --git a/3rdparty/fastcv/fastcv.cmake b/3rdparty/fastcv/fastcv.cmake
> +index b8172705ca..12c6616a16 100644
> +--- a/3rdparty/fastcv/fastcv.cmake
> ++++ b/3rdparty/fastcv/fastcv.cmake
> +@@ -1,7 +1,7 @@
> + function(download_fastcv root_dir)
> +
> +   # Commit SHA in the opencv_3rdparty repo
> +-  set(FASTCV_COMMIT "dc5d58018f3af915a8d209386d2c58c0501c0f2c")
> ++  set(FASTCV_COMMIT "f4413cc2ab7233fdfc383a4cded402c072677fb0")
> +
> +   # Define actual FastCV versions
> +   if(ANDROID)
> +@@ -16,14 +16,15 @@ function(download_fastcv root_dir)
> +     endif()
> +   elseif(UNIX AND NOT APPLE AND NOT IOS AND NOT XROS)
> +     if(AARCH64)
> +-      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2024_12_11.tgz")
> +-      set(FCV_PACKAGE_HASH  "7b33ad833e6f15ab6d4ec64fa3c17acd")
> ++      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2025_02_12.tgz")
> ++      set(FCV_PACKAGE_HASH  "33ac2a59cf3e7d6402eee2e010de1202")
> +     else()
> +       message("FastCV: fastcv lib for 32-bit Linux is not supported for=
 now!")
> +     endif()
> +   endif(ANDROID)
> +
> +   # Download Package
> ++
> +   set(OPENCV_FASTCV_URL "https://raw.githubusercontent.com/opencv/openc=
v_3rdparty/${FASTCV_COMMIT}/fastcv/")
> +
> +   ocv_download( FILENAME        ${FCV_PACKAGE_NAME}
> +@@ -40,4 +41,4 @@ function(download_fastcv root_dir)
> +     message(WARNING "FastCV: package download failed!")
> +   endif()
> +
> +-endfunction()
> ++endfunction()
> +\ No newline at end of file
> +diff --git a/cmake/OpenCVFindLibsPerf.cmake b/cmake/OpenCVFindLibsPerf.c=
make
> +index c2380e6ce5..a31842dfbb 100644
> +--- a/cmake/OpenCVFindLibsPerf.cmake
> ++++ b/cmake/OpenCVFindLibsPerf.cmake
> +@@ -181,7 +181,14 @@ endif(WITH_KLEIDICV)
> + if(WITH_FASTCV)
> +   if((EXISTS ${FastCV_INCLUDE_PATH}) AND (EXISTS ${FastCV_LIB_PATH}))
> +     message(STATUS "Use external FastCV ${FastCV_INCLUDE_PATH}, ${FastC=
V_LIB_PATH}")
> +-    set(HAVE_FASTCV TRUE CACHE BOOL "FastCV status")
> ++    find_library(FASTCV_LIBRARY NAMES "fastcv"
> ++                 PATHS "${FastCV_LIB_PATH}" NO_DEFAULT_PATH NO_CMAKE_FI=
ND_ROOT_PATH)
> ++    mark_as_advanced(FASTCV_LIBRARY)
> ++    if (FASTCV_LIBRARY)
> ++      set(HAVE_FASTCV TRUE CACHE BOOL "FastCV status")
> ++    else()
> ++      set(HAVE_FASTCV FALSE CACHE BOOL "FastCV status")
> ++    endif()
> +   else()
> +     include("${OpenCV_SOURCE_DIR}/3rdparty/fastcv/fastcv.cmake")
> +     set(FCV_ROOT_DIR "${OpenCV_BINARY_DIR}/3rdparty/fastcv")
> +@@ -190,13 +197,15 @@ if(WITH_FASTCV)
> +       set(FastCV_INCLUDE_PATH "${FCV_ROOT_DIR}/inc" CACHE PATH "FastCV =
includes directory")
> +       set(FastCV_LIB_PATH "${FCV_ROOT_DIR}/libs" CACHE PATH "FastCV lib=
rary directory")
> +       ocv_install_3rdparty_licenses(FastCV "${OpenCV_BINARY_DIR}/3rdpar=
ty/fastcv/LICENSE")
> +-      install(FILES "${FastCV_LIB_PATH}/libfastcvopt.so"
> +-              DESTINATION "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "bin")
> ++      if(ANDROID)
> ++        set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcvopt.so" CACHE P=
ATH "FastCV library")
> ++        install(FILES "${FASTCV_LIBRARY}" DESTINATION "${OPENCV_LIB_INS=
TALL_PATH}" COMPONENT "bin")
> ++      else()
> ++        set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcv.a" CACHE PATH =
"FastCV library")
> ++        install(FILES "${FASTCV_LIBRARY}" DESTINATION "${OPENCV_LIB_INS=
TALL_PATH}" COMPONENT "dev")
> ++      endif()
> +     else()
> +       set(HAVE_FASTCV FALSE CACHE BOOL "FastCV status")
> +     endif()
> +   endif()
> +-  if(HAVE_FASTCV)
> +-    set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcvopt.so" CACHE PATH =
"FastCV library")
> +-  endif()
> +-endif(WITH_FASTCV)
> ++endif(WITH_FASTCV)
> +\ No newline at end of file
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-c=
luster-euclidean-in-fastcv-ext.patch b/meta-oe/recipes-support/opencv/openc=
v/0001-PENDING-Removed-cluster-euclidean-in-fastcv-ext.patch
> new file mode 100644
> index 0000000000..cb570c55e4
> --- /dev/null
> +++ b/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-=
euclidean-in-fastcv-ext.patch
> @@ -0,0 +1,371 @@
> +From d7db8fb8d715a86d0939797bc08073895c475989 Mon Sep 17 00:00:00 2001
> +From: Pulkit Singh Tak <quic_ptak@quicinc.com>
> +Date: Thu, 13 Feb 2025 17:55:08 +0530
> +Subject: [PATCH] PENDING: Removed cluster euclidean in fastcv ext
> +
> +Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
> +Upstream-Status: PENDING

Status should be Pending
aside from this, why is it not submitted yet ? it would be good to
document that. Unsubmitted patches carry maintenance cost

> +---
> + modules/fastcv/include/opencv2/fastcv.hpp     |   1 -
> + .../fastcv/include/opencv2/fastcv/cluster.hpp |  43 ------
> + .../fastcv/perf/perf_cluster_euclidean.cpp    |  79 -----------
> + modules/fastcv/src/cluster_euclidean.cpp      |  66 ----------
> + .../fastcv/test/test_cluster_euclidean.cpp    | 124 ------------------
> + 5 files changed, 313 deletions(-)
> + delete mode 100644 modules/fastcv/include/opencv2/fastcv/cluster.hpp
> + delete mode 100644 modules/fastcv/perf/perf_cluster_euclidean.cpp
> + delete mode 100644 modules/fastcv/src/cluster_euclidean.cpp
> + delete mode 100644 modules/fastcv/test/test_cluster_euclidean.cpp
> +
> +diff --git a/modules/fastcv/include/opencv2/fastcv.hpp b/modules/fastcv/=
include/opencv2/fastcv.hpp
> +index af188dfc..c5deb5e0 100644
> +--- a/modules/fastcv/include/opencv2/fastcv.hpp
> ++++ b/modules/fastcv/include/opencv2/fastcv.hpp
> +@@ -11,7 +11,6 @@
> + #include "opencv2/fastcv/arithm.hpp"
> + #include "opencv2/fastcv/bilateralFilter.hpp"
> + #include "opencv2/fastcv/blur.hpp"
> +-#include "opencv2/fastcv/cluster.hpp"
> + #include "opencv2/fastcv/draw.hpp"
> + #include "opencv2/fastcv/edges.hpp"
> + #include "opencv2/fastcv/fast10.hpp"
> +diff --git a/modules/fastcv/include/opencv2/fastcv/cluster.hpp b/modules=
/fastcv/include/opencv2/fastcv/cluster.hpp
> +deleted file mode 100644
> +index 46ac7ad1..00000000
> +--- a/modules/fastcv/include/opencv2/fastcv/cluster.hpp
> ++++ /dev/null
> +@@ -1,43 +0,0 @@
> +-/*
> +- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reser=
ved.
> +- * SPDX-License-Identifier: Apache-2.0
> +-*/
> +-
> +-#ifndef OPENCV_FASTCV_CLUSTER_HPP
> +-#define OPENCV_FASTCV_CLUSTER_HPP
> +-
> +-#include <opencv2/core.hpp>
> +-
> +-namespace cv {
> +-namespace fastcv {
> +-
> +-//! @addtogroup fastcv
> +-//! @{
> +-
> +-/**
> +- * @brief Clusterizes N input points in D-dimensional space into K clus=
ters
> +- *        Accepts 8-bit unsigned integer points
> +- *        Provides faster execution time than cv::kmeans on Qualcomm's =
processors
> +- * @param points            Points array of type 8u, each row represets=
 a point.
> +- *                          Size is N rows by D columns, can be non-con=
tinuous.
> +- * @param clusterCenters    Initial cluster centers array of type 32f, =
each row represents a center.
> +- *                          Size is K rows by D columns, can be non-con=
tinuous.
> +- * @param newClusterCenters Resulting cluster centers array of type 32f=
, each row represents found center.
> +- *                          Size is set to be K rows by D columns.
> +- * @param clusterSizes      Resulting cluster member counts array of ty=
pe uint32, size is set to be 1 row by K columns.
> +- * @param clusterBindings   Resulting points indices array of type uint=
32, each index tells to which cluster the corresponding point belongs to.
> +- *                          Size is set to be 1 row by numPointsUsed co=
lumns.
> +- * @param clusterSumDists   Resulting distance sums array of type 32f, =
each number is a sum of distances between each cluster center to its belong=
ing points.
> +- *                          Size is set to be 1 row by K columns
> +- * @param numPointsUsed     Number of points to clusterize starting fro=
m 0 to numPointsUsed-1 inclusively. Sets to N if negative.
> +- */
> +-CV_EXPORTS_W void clusterEuclidean(InputArray points, InputArray cluste=
rCenters, OutputArray newClusterCenters,
> +-                                   OutputArray clusterSizes, OutputArra=
y clusterBindings, OutputArray clusterSumDists,
> +-                                   int numPointsUsed =3D -1);
> +-
> +-//! @}
> +-
> +-} // fastcv::
> +-} // cv::
> +-
> +-#endif // OPENCV_FASTCV_CLUSTER_HPP
> +diff --git a/modules/fastcv/perf/perf_cluster_euclidean.cpp b/modules/fa=
stcv/perf/perf_cluster_euclidean.cpp
> +deleted file mode 100644
> +index 20bc31a7..00000000
> +--- a/modules/fastcv/perf/perf_cluster_euclidean.cpp
> ++++ /dev/null
> +@@ -1,79 +0,0 @@
> +-/*
> +- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reser=
ved.
> +- * SPDX-License-Identifier: Apache-2.0
> +-*/
> +-
> +-#include "perf_precomp.hpp"
> +-
> +-namespace opencv_test {
> +-
> +-typedef std::tuple<int /* nPts */, int /*nDims*/, int /*nClusters*/> Cl=
usterEuclideanPerfParams;
> +-typedef perf::TestBaseWithParam<ClusterEuclideanPerfParams> ClusterEucl=
ideanPerfTest;
> +-
> +-PERF_TEST_P(ClusterEuclideanPerfTest, run,
> +-            ::testing::Combine(::testing::Values(100, 1000, 10000), // =
nPts
> +-                               ::testing::Values(2, 10, 32),        // =
nDims
> +-                               ::testing::Values(5, 10, 16))        // =
nClusters
> +-           )
> +-{
> +-    auto p =3D GetParam();
> +-    int nPts      =3D std::get<0>(p);
> +-    int nDims     =3D std::get<1>(p);
> +-    int nClusters =3D std::get<2>(p);
> +-
> +-    Mat points(nPts, nDims, CV_8U);
> +-    Mat clusterCenters(nClusters, nDims, CV_32F);
> +-
> +-    Mat trueMeans(nClusters, nDims, CV_32F);
> +-    Mat stddevs(nClusters, nDims, CV_32F);
> +-    std::vector<int> trueClusterSizes(nClusters, 0);
> +-    std::vector<int> trueClusterBindings(nPts, 0);
> +-    std::vector<float> trueSumDists(nClusters, 0);
> +-
> +-    cv::RNG& rng =3D cv::theRNG();
> +-    for (int i =3D 0; i < nClusters; i++)
> +-    {
> +-        Mat mean(1, nDims, CV_64F), stdev(1, nDims, CV_64F);
> +-        rng.fill(mean,  cv::RNG::UNIFORM, 0, 256);
> +-        rng.fill(stdev, cv::RNG::UNIFORM, 5.f, 16);
> +-        int lo =3D    i    * nPts / nClusters;
> +-        int hi =3D (i + 1) * nPts / nClusters;
> +-
> +-        for (int d =3D 0; d < nDims; d++)
> +-        {
> +-            rng.fill(points.col(d).rowRange(lo, hi), cv::RNG::NORMAL,
> +-                     mean.at<double>(d), stdev.at<double>(d));
> +-        }
> +-
> +-        float sd =3D 0;
> +-        for (int j =3D lo; j < hi; j++)
> +-        {
> +-            Mat pts64f;
> +-            points.row(j).convertTo(pts64f, CV_64F);
> +-            sd +=3D cv::norm(mean, pts64f, NORM_L2);
> +-            trueClusterBindings.at(j) =3D i;
> +-            trueClusterSizes.at(i)++;
> +-        }
> +-        trueSumDists.at(i) =3D sd;
> +-
> +-        // let's shift initial cluster center a bit
> +-        Mat(mean + stdev * 0.5).copyTo(clusterCenters.row(i));
> +-
> +-        mean.copyTo(trueMeans.row(i));
> +-        stdev.copyTo(stddevs.row(i));
> +-    }
> +-
> +-    while(next())
> +-    {
> +-        Mat newClusterCenters;
> +-        std::vector<int> clusterSizes, clusterBindings;
> +-        std::vector<float> clusterSumDists;
> +-        startTimer();
> +-        cv::fastcv::clusterEuclidean(points, clusterCenters, newCluster=
Centers, clusterSizes, clusterBindings, clusterSumDists);
> +-        stopTimer();
> +-    }
> +-
> +-    SANITY_CHECK_NOTHING();
> +-}
> +-
> +-} // namespace
> +diff --git a/modules/fastcv/src/cluster_euclidean.cpp b/modules/fastcv/s=
rc/cluster_euclidean.cpp
> +deleted file mode 100644
> +index a50b027c..00000000
> +--- a/modules/fastcv/src/cluster_euclidean.cpp
> ++++ /dev/null
> +@@ -1,66 +0,0 @@
> +-/*
> +- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reser=
ved.
> +- * SPDX-License-Identifier: Apache-2.0
> +-*/
> +-
> +-#include "precomp.hpp"
> +-
> +-namespace cv {
> +-namespace fastcv {
> +-
> +-void clusterEuclidean(InputArray _points, InputArray _clusterCenters, O=
utputArray _newClusterCenters,
> +-                      OutputArray _clusterSizes, OutputArray _clusterBi=
ndings, OutputArray _clusterSumDists,
> +-                      int numPointsUsed)
> +-{
> +-    INITIALIZATION_CHECK;
> +-
> +-    CV_Assert(!_points.empty() && _points.type() =3D=3D CV_8UC1);
> +-    int nPts      =3D _points.rows();
> +-    int nDims     =3D _points.cols();
> +-    int ptsStride =3D _points.step();
> +-
> +-    CV_Assert(!_clusterCenters.empty() && _clusterCenters.depth() =3D=
=3D CV_32F);
> +-    int nClusters           =3D _clusterCenters.rows();
> +-    int clusterCenterStride =3D _clusterCenters.step();
> +-
> +-    CV_Assert(_clusterCenters.cols() =3D=3D nDims);
> +-
> +-    CV_Assert(numPointsUsed <=3D nPts);
> +-    if (numPointsUsed < 0)
> +-    {
> +-        numPointsUsed =3D nPts;
> +-    }
> +-
> +-    _newClusterCenters.create(nClusters, nDims, CV_32FC1);
> +-    _clusterSizes.create(1, nClusters, CV_32SC1);
> +-    _clusterBindings.create(1, numPointsUsed, CV_32SC1);
> +-    _clusterSumDists.create(1, nClusters, CV_32FC1);
> +-
> +-    Mat points            =3D _points.getMat();
> +-    Mat clusterCenters    =3D _clusterCenters.getMat();
> +-    Mat newClusterCenters =3D _newClusterCenters.getMat();
> +-    Mat clusterSizes      =3D _clusterSizes.getMat();
> +-    Mat clusterBindings   =3D _clusterBindings.getMat();
> +-    Mat clusterSumDists   =3D _clusterSumDists.getMat();
> +-
> +-    int result =3D fcvClusterEuclideanu8(points.data,
> +-                                       nPts,
> +-                                       nDims,
> +-                                       ptsStride,
> +-                                       numPointsUsed,
> +-                                       nClusters,
> +-                                       (float32_t*)clusterCenters.data,
> +-                                       clusterCenterStride,
> +-                                       (float32_t*)newClusterCenters.da=
ta,
> +-                                       (uint32_t*)clusterSizes.data,
> +-                                       (uint32_t*)clusterBindings.data,
> +-                                       (float32_t*)clusterSumDists.data=
);
> +-
> +-    if (result)
> +-    {
> +-        CV_Error(cv::Error::StsInternal, cv::format("Failed to clusteri=
ze, error code: %d", result));
> +-    }
> +-}
> +-
> +-} // fastcv::
> +-} // cv::
> +diff --git a/modules/fastcv/test/test_cluster_euclidean.cpp b/modules/fa=
stcv/test/test_cluster_euclidean.cpp
> +deleted file mode 100644
> +index c108f754..00000000
> +--- a/modules/fastcv/test/test_cluster_euclidean.cpp
> ++++ /dev/null
> +@@ -1,124 +0,0 @@
> +-/*
> +- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reser=
ved.
> +- * SPDX-License-Identifier: Apache-2.0
> +-*/
> +-
> +-#include "test_precomp.hpp"
> +-
> +-namespace opencv_test { namespace {
> +-
> +-// nPts, nDims, nClusters
> +-typedef std::tuple<int, int, int> ClusterEuclideanTestParams;
> +-class ClusterEuclideanTest : public ::testing::TestWithParam<ClusterEuc=
lideanTestParams> {};
> +-
> +-TEST_P(ClusterEuclideanTest, accuracy)
> +-{
> +-    auto p =3D GetParam();
> +-    int nPts      =3D std::get<0>(p);
> +-    int nDims     =3D std::get<1>(p);
> +-    int nClusters =3D std::get<2>(p);
> +-
> +-    Mat points(nPts, nDims, CV_8U);
> +-    Mat clusterCenters(nClusters, nDims, CV_32F);
> +-
> +-    Mat trueMeans(nClusters, nDims, CV_32F);
> +-    Mat stddevs(nClusters, nDims, CV_32F);
> +-    std::vector<int> trueClusterSizes(nClusters, 0);
> +-    std::vector<int> trueClusterBindings(nPts, 0);
> +-    std::vector<float> trueSumDists(nClusters, 0);
> +-
> +-    cv::RNG& rng =3D cv::theRNG();
> +-    for (int i =3D 0; i < nClusters; i++)
> +-    {
> +-        Mat mean(1, nDims, CV_64F), stdev(1, nDims, CV_64F);
> +-        rng.fill(mean,  cv::RNG::UNIFORM, 0, 256);
> +-        rng.fill(stdev, cv::RNG::UNIFORM, 5.f, 16);
> +-        int lo =3D    i    * nPts / nClusters;
> +-        int hi =3D (i + 1) * nPts / nClusters;
> +-
> +-        for (int d =3D 0; d < nDims; d++)
> +-        {
> +-            rng.fill(points.col(d).rowRange(lo, hi), cv::RNG::NORMAL,
> +-                     mean.at<double>(d), stdev.at<double>(d));
> +-        }
> +-
> +-        float sd =3D 0;
> +-        for (int j =3D lo; j < hi; j++)
> +-        {
> +-            Mat pts64f;
> +-            points.row(j).convertTo(pts64f, CV_64F);
> +-            sd +=3D cv::norm(mean, pts64f, NORM_L2);
> +-            trueClusterBindings.at(j) =3D i;
> +-            trueClusterSizes.at(i)++;
> +-        }
> +-        trueSumDists.at(i) =3D sd;
> +-
> +-        // let's shift initial cluster center a bit
> +-        Mat(mean + stdev * 0.5).copyTo(clusterCenters.row(i));
> +-
> +-        mean.copyTo(trueMeans.row(i));
> +-        stdev.copyTo(stddevs.row(i));
> +-    }
> +-
> +-    Mat newClusterCenters;
> +-    std::vector<int> clusterSizes, clusterBindings;
> +-    std::vector<float> clusterSumDists;
> +-    cv::fastcv::clusterEuclidean(points, clusterCenters, newClusterCent=
ers, clusterSizes, clusterBindings, clusterSumDists);
> +-
> +-    if (cvtest::debugLevel > 0 && nDims =3D=3D 2)
> +-    {
> +-        Mat draw(256, 256, CV_8UC3, Scalar(0));
> +-        for (int i =3D 0; i < nPts; i++)
> +-        {
> +-            int x =3D std::rint(points.at<uchar>(i, 0));
> +-            int y =3D std::rint(points.at<uchar>(i, 1));
> +-            draw.at<Vec3b>(y, x) =3D Vec3b::all(128);
> +-        }
> +-        for (int i =3D 0; i < nClusters; i++)
> +-        {
> +-            float cx =3D trueMeans.at<double>(i, 0);
> +-            float cy =3D trueMeans.at<double>(i, 1);
> +-            draw.at<Vec3b>(cy, cx) =3D Vec3b(0, 255, 0);
> +-
> +-            float sx =3D stddevs.at<double>(i, 0);
> +-            float sy =3D stddevs.at<double>(i, 1);
> +-            cv::ellipse(draw, Point(cx, cy), Size(sx, sy), 0, 0, 360, S=
calar(255, 0, 0));
> +-
> +-            float ox =3D clusterCenters.at<float>(i, 0);
> +-            float oy =3D clusterCenters.at<float>(i, 1);
> +-            draw.at<Vec3b>(oy, ox) =3D Vec3b(0, 0, 255);
> +-
> +-            float nx =3D newClusterCenters.at<float>(i, 0);
> +-            float ny =3D newClusterCenters.at<float>(i, 1);
> +-            draw.at<Vec3b>(ny, nx) =3D Vec3b(255, 255, 0);
> +-        }
> +-        cv::imwrite(cv::format("draw_%d_%d_%d.png", nPts, nDims, nClust=
ers), draw);
> +-    }
> +-
> +-    {
> +-        std::vector<double> diffs;
> +-        for (int i =3D 0; i < nClusters; i++)
> +-        {
> +-            double cs =3D std::abs((trueClusterSizes[i] - clusterSizes[=
i]) / double(trueClusterSizes[i]));
> +-            diffs.push_back(cs);
> +-        }
> +-        double normL2  =3D cv::norm(diffs, NORM_L2) / nClusters;
> +-
> +-        EXPECT_LT(normL2, 0.392);
> +-    }
> +-
> +-    {
> +-        Mat bindings8u, trueBindings8u;
> +-        Mat(clusterBindings).convertTo(bindings8u, CV_8U);
> +-        Mat(trueClusterBindings).convertTo(trueBindings8u, CV_8U);
> +-        double normH =3D cv::norm(bindings8u, trueBindings8u, NORM_HAMM=
ING) / nPts;
> +-        EXPECT_LT(normH, 0.658);
> +-    }
> +-}
> +-
> +-INSTANTIATE_TEST_CASE_P(FastCV_Extension, ClusterEuclideanTest,
> +-                        ::testing::Combine(::testing::Values(100, 1000,=
 10000), // nPts
> +-                                           ::testing::Values(2, 10, 32)=
,        // nDims
> +-                                           ::testing::Values(5, 10, 16)=
));      // nClusters
> +-
> +-}} // namespaces opencv_test, ::
> +\ No newline at end of file
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.11.0.bb
> index 1613b6a3ed..1b0285e05b 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> @@ -16,15 +16,17 @@ SRCREV_boostdesc =3D "34e4206aef44d50e6bbcd0ab06354b5=
2e7466d26"
>  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>  SRCREV_face =3D "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
>  SRCREV_wechat-qrcode =3D "a8b69ccc738421293254aec5ddb38bd523503252"
> +SRCREV_fastcv =3D "f4413cc2ab7233fdfc383a4cded402c072677fb0"
>
>
> -SRCREV_FORMAT =3D "opencv_contrib_ipp_boostdesc_vgg"
> +SRCREV_FORMAT =3D "opencv_contrib_ipp_boostdesc_vgg_fastcv"
>  SRC_URI =3D "git://github.com/opencv/opencv.git;name=3Dopencv;branch=3D4=
.x;protocol=3Dhttps \
>             git://github.com/opencv/opencv_contrib.git;destsuffix=3Dgit/c=
ontrib;name=3Dcontrib;branch=3D4.x;protocol=3Dhttps \
>             git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_=
xfeatures2d_boostdesc_20161012;destsuffix=3Dgit/boostdesc;name=3Dboostdesc;=
protocol=3Dhttps \
>             git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_=
xfeatures2d_vgg_20160317;destsuffix=3Dgit/vgg;name=3Dvgg;protocol=3Dhttps \
>             git://github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_=
face_alignment_20170818;destsuffix=3Dgit/face;name=3Dface;protocol=3Dhttps =
\
>             git://github.com/WeChatCV/opencv_3rdparty.git;branch=3Dwechat=
_qrcode;destsuffix=3Dgit/wechat_qrcode;name=3Dwechat-qrcode;protocol=3Dhttp=
s \
> +           git://github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4=
.x_20250212;destsuffix=3Dgit/fastcv;name=3Dfastcv;protocol=3Dhttps \
>             file://0003-To-fix-errors-as-following.patch \
>             file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-fun=
cti.patch \
>             file://0001-Dont-use-isystem.patch \
> @@ -37,6 +39,13 @@ SRC_URI:append:riscv64 =3D " file://0001-Use-Os-to-com=
pile-tinyxml2.cpp.patch;patc
>
>  S =3D "${WORKDIR}/git"
>
> +# Disabling cluster ecludian tests in fastcv EXTN as it causes fastcv EX=
TN tests to be crashed.
> +# Adding support for fastcv static lib as per Upstream OpenCV.
> +# These are temporary patches, will be removed in next release.
> +
> +SRC_URI +=3D "file://0001-PENDING-Removed-cluster-euclidean-in-fastcv-ex=
t.patch;patchdir=3D${S}/contrib/ \
> +            file://0001-FROMLIST-Using-fastcv-static-lib-for-compilation=
.patch"
> +
>  # OpenCV wants to download more files during configure.  We download the=
se in
>  # do_fetch and construct a source cache in the format it expects
>  OPENCV_DLDIR =3D "${WORKDIR}/downloads"
> @@ -61,6 +70,7 @@ do_unpack_extra() {
>      cache data ${S}/face/*.dat
>      cache wechat_qrcode ${S}/wechat_qrcode/*.caffemodel
>      cache wechat_qrcode ${S}/wechat_qrcode/*.prototxt
> +    cache fastcv ${S}/fastcv/fastcv/*.tgz
>  }
>  addtask unpack_extra after do_unpack before do_patch
>
> @@ -71,7 +81,6 @@ EXTRA_OECMAKE =3D "-DOPENCV_EXTRA_MODULES_PATH=3D${S}/c=
ontrib/modules \
>      -DENABLE_PRECOMPILED_HEADERS=3DOFF \
>      -DCMAKE_SKIP_RPATH=3DON \
>      -DWITH_IPP=3DOFF \
> -    -DWITH_FASTCV=3DOFF \
>      -DOPENCV_GENERATE_PKGCONFIG=3DON \
>      -DOPENCV_DOWNLOAD_PATH=3D${OPENCV_DLDIR} \
>      -DOPENCV_ALLOW_DOWNLOADS=3DOFF \
> @@ -122,6 +131,7 @@ PACKAGECONFIG[tests] =3D "-DBUILD_TESTS=3DON,-DBUILD_=
TESTS=3DOFF,,"
>  PACKAGECONFIG[text] =3D "-DBUILD_opencv_text=3DON,-DBUILD_opencv_text=3D=
OFF,tesseract,"
>  PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
>  PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> +PACKAGECONFIG[fastcv] =3D "-DWITH_FASTCV=3DON ,-DWITH_FASTCV=3DOFF,,"
>
>  inherit pkgconfig cmake setuptools3-base python3native
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116206): https://lists.openembedded.org/g/openembedde=
d-devel/message/116206
> Mute This Topic: https://lists.openembedded.org/mt/111872956/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

