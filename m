Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B4BC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 10:59:48 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web11.19392.1742986781899178377
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Mar 2025 03:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PAB6Dy6u;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-86d75f4e9a1so2900804241.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742986781; x=1743591581; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VSIOPF0qFag2UD5RrgNgnJFcdP/uDAwyLzKQLcw9JHY=;
        b=PAB6Dy6uNfCF7HL80GI1X0x6z3fRNh8VNZm/PSB01bqj7QGiowpX7NrJlVWJDvficK
         hhFoPnXln2+vXaHh2G2fS3fk8/qnEllP132DvtDqYrpnJrsZ2/NDh0WJ624U4rrwln5s
         wYa9eltf2ZS1ho7Y2kyEwc60yasU4xpIzmyjYHuZAcy6af9v9AdHUIbJ7dXFimH55+Zu
         4i7msp94Kfl9CtlEaExI6sIQa3CWSIFjpPsXGRwTshLHKcfIYxKQzSz3lz1apySnt0Cn
         Zua/ELT5sNjId/CnvcIpl4Cz65jdFLpkvFdHJQSvZE1/wAcprem9CDcbTW+HH3JpSYHe
         fQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742986781; x=1743591581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSIOPF0qFag2UD5RrgNgnJFcdP/uDAwyLzKQLcw9JHY=;
        b=Vz3VN8huIjl7Nngc9MiRAoUp3VKZbERD5/kGsRLR+/okp947vNREcSPnD0v5I94B0i
         DlhDZg3tRgVy0rRex4tMMAxqw6UDVqN+RmLsHFNdQdXKn+h98UevZX6JWTQwYKz7m/1m
         F4PNyTMBAwo0v0j3mVZ7uq/gwWgbeZtnCbzSDYQsk3T1VQbrRIK2N1ke49DPzhDzM8u3
         pymmQkvquSk8JZNgdiK4Y4awwwsTpJrU91Kg1dynqr4p5QkXrxCwIOx+8EGtHEM35mpc
         vHq0fNDBXnpxMyb9mZAs2ZDOzX0TW9UMp0iraYg89y2vCizWFtxTx3MxrJJIB9xY8VNF
         x0OA==
X-Gm-Message-State: AOJu0YxkwVicuGzhI3izgMssiDscILvpaE5v78kkgCBmDtOXYADl/CJa
	FO26IYpSvptMyoU0Ba8czDQTiSYkRgpAS6kQuNe3M3FgSXbpcMzuHGXEkDLCs4ak3PPHJlZOW+N
	FsG6S5ZVrpE5l9pf50g2gBkqdwQoX9YRU
X-Gm-Gg: ASbGnctUT9OncxdYNqwxao1xm8N0ztc/+WxcC4gh2BCcBC6vVvt4MBXJ3bWnOGFL/cs
	W8o/Bf1XSyPM5mxT7615pFoDvPj65sEs609eI6u/Uqh/0xAkadpVUUAbIKWpTPeH+7mFfIKGxv8
	GUzS7KJNWGbMMe1KA8TIibOagk7geszTF8Th33yg==
X-Google-Smtp-Source: AGHT+IFCuN4RRfu2qprbYmYr6N7X4hlFPTBA3mf+RWi9fiunMxPomD4/OzKRde5KlSQzrjmC2pl3t1nHq/cQHzqytaQ=
X-Received: by 2002:a05:6102:945:b0:4c4:e0cc:fb39 with SMTP id
 ada2fe7eead31-4c50d4fd939mr16586382137.12.1742986780220; Wed, 26 Mar 2025
 03:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250326091928.1846561-1-quic_ptak@quicinc.com>
In-Reply-To: <20250326091928.1846561-1-quic_ptak@quicinc.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 26 Mar 2025 10:59:28 +0000
X-Gm-Features: AQ5f1Jrm-6pxZpowmOg7qGuIBLXOTfqj8KUzhLUCdwhC4QxPn92FTNozUq29EXg
Message-ID: <CANPvuRnHLuPf73XuU-X4pmTF=jC9gvXEeCM+0BY+VLmvwUxxDg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V2] OpenCV: Adding FastCV-HAL enablement
 option as packageconfig
To: quic_ptak@quicinc.com
Cc: openembedded-devel@lists.openembedded.org, quic_sssanjee@quicinc.com, 
	quic_vkaruchu@quicinc.com
Content-Type: multipart/alternative; boundary="000000000000e225a606313cbb93"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Mar 2025 10:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116292

--000000000000e225a606313cbb93
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pulkit,

Thanks for your patch.

For the title please use the component in lowercase, you can examples with:
git log --oneline meta-oe/recipes-support/opencv
opencv: Adding FastCV-HAL enablement option as packageconfig

I have some comments inline.

Pulkit Singh Tak (Temp) (QUIC) via lists.openembedded.org <quic_ptak=3D
quicinc.com@lists.openembedded.org> escreveu (quarta, 26/03/2025 =C3=A0(s)
09:20):

> Adding patches to support fastcv static lib compilation.
> Removal of cluster ecludian tests support.
> These are temporary patches to be removed in next release.
>
> Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
> ---
>  ...ng-fastcv-static-lib-for-compilation.patch |  96 +++++
>  ...oved-cluster-euclidean-in-fastcv-ext.patch | 371 ++++++++++++++++++
>  .../recipes-support/opencv/opencv_4.11.0.bb   |  15 +-
>  3 files changed, 479 insertions(+), 3 deletions(-)
>  create mode 100644
> meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-static-l=
ib-for-compilation.patch
>  create mode 100644
> meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-euclid=
ean-in-fastcv-ext.patch
>
> diff --git
> a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-static=
-lib-for-compilation.patch
> b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-static=
-lib-for-compilation.patch
> new file mode 100644
> index 0000000000..f822e5066b
> --- /dev/null
> +++
> b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-static=
-lib-for-compilation.patch
> @@ -0,0 +1,96 @@
> +From 0141830e67ac7c60c474ab3c1e7d3e30c27c7943 Mon Sep 17 00:00:00 2001
> +From: Pulkit Singh Tak <quic_ptak@quicinc.com>
> +Date: Mon, 10 Feb 2025 15:10:26 +0530
> +Subject: [PATCH] FROMLIST: Using fastcv static lib for compilation
> +
> +Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
> +Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/26917]
>

Please use the patch as is and only add the Upstream-Status and
Signed-off-by

The commit title the author is different from the one your pinted
https://github.com/opencv/opencv/pull/26917/commits/5921aae2b38f97a377889cc=
73ed1d914021a1fc9



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
> +       message("FastCV: fastcv lib for 32-bit Linux is not supported for
> now!")
> +     endif()
> +   endif(ANDROID)
> +
> +   # Download Package
> ++
> +   set(OPENCV_FASTCV_URL "
> https://raw.githubusercontent.com/opencv/opencv_3rdparty/${FASTCV_COMMIT}=
/fastcv/
> ")
> +
> +   ocv_download( FILENAME        ${FCV_PACKAGE_NAME}
> +@@ -40,4 +41,4 @@ function(download_fastcv root_dir)
> +     message(WARNING "FastCV: package download failed!")
> +   endif()
> +
> +-endfunction()
> ++endfunction()
> +\ No newline at end of file
> +diff --git a/cmake/OpenCVFindLibsPerf.cmake
> b/cmake/OpenCVFindLibsPerf.cmake
> +index c2380e6ce5..a31842dfbb 100644
> +--- a/cmake/OpenCVFindLibsPerf.cmake
> ++++ b/cmake/OpenCVFindLibsPerf.cmake
> +@@ -181,7 +181,14 @@ endif(WITH_KLEIDICV)
> + if(WITH_FASTCV)
> +   if((EXISTS ${FastCV_INCLUDE_PATH}) AND (EXISTS ${FastCV_LIB_PATH}))
> +     message(STATUS "Use external FastCV ${FastCV_INCLUDE_PATH},
> ${FastCV_LIB_PATH}")
> +-    set(HAVE_FASTCV TRUE CACHE BOOL "FastCV status")
> ++    find_library(FASTCV_LIBRARY NAMES "fastcv"
> ++                 PATHS "${FastCV_LIB_PATH}" NO_DEFAULT_PATH
> NO_CMAKE_FIND_ROOT_PATH)
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
> +       set(FastCV_INCLUDE_PATH "${FCV_ROOT_DIR}/inc" CACHE PATH "FastCV
> includes directory")
> +       set(FastCV_LIB_PATH "${FCV_ROOT_DIR}/libs" CACHE PATH "FastCV
> library directory")
> +       ocv_install_3rdparty_licenses(FastCV
> "${OpenCV_BINARY_DIR}/3rdparty/fastcv/LICENSE")
> +-      install(FILES "${FastCV_LIB_PATH}/libfastcvopt.so"
> +-              DESTINATION "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "bin")
> ++      if(ANDROID)
> ++        set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcvopt.so" CACHE
> PATH "FastCV library")
> ++        install(FILES "${FASTCV_LIBRARY}" DESTINATION
> "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "bin")
> ++      else()
> ++        set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcv.a" CACHE PATH
> "FastCV library")
> ++        install(FILES "${FASTCV_LIBRARY}" DESTINATION
> "${OPENCV_LIB_INSTALL_PATH}" COMPONENT "dev")
> ++      endif()
> +     else()
> +       set(HAVE_FASTCV FALSE CACHE BOOL "FastCV status")
> +     endif()
> +   endif()
> +-  if(HAVE_FASTCV)
> +-    set(FASTCV_LIBRARY "${FastCV_LIB_PATH}/libfastcvopt.so" CACHE PATH
> "FastCV library")
> +-  endif()
> +-endif(WITH_FASTCV)
> ++endif(WITH_FASTCV)
> +\ No newline at end of file
> +--
> +2.34.1
> +
> diff --git
> a/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-eucl=
idean-in-fastcv-ext.patch
> b/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-eucl=
idean-in-fastcv-ext.patch
> new file mode 100644
> index 0000000000..cb454ccf14
> --- /dev/null
> +++
> b/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-eucl=
idean-in-fastcv-ext.patch
> @@ -0,0 +1,371 @@
> +From d7db8fb8d715a86d0939797bc08073895c475989 Mon Sep 17 00:00:00 2001
> +From: Pulkit Singh Tak <quic_ptak@quicinc.com>
> +Date: Thu, 13 Feb 2025 17:55:08 +0530
> +Subject: [PATCH] PENDING: Removed cluster euclidean in fastcv ext
> +
> +Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
> +Upstream-Status: Pending
>

This patch is quite big so please submit it upstream also and add a
reference for it.


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
> +diff --git a/modules/fastcv/include/opencv2/fastcv.hpp
> b/modules/fastcv/include/opencv2/fastcv.hpp
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
> +diff --git a/modules/fastcv/include/opencv2/fastcv/cluster.hpp
> b/modules/fastcv/include/opencv2/fastcv/cluster.hpp
> +deleted file mode 100644
> +index 46ac7ad1..00000000
> +--- a/modules/fastcv/include/opencv2/fastcv/cluster.hpp
> ++++ /dev/null
> +@@ -1,43 +0,0 @@
> +-/*
> +- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights
> reserved.
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
> +- * @brief Clusterizes N input points in D-dimensional space into K
> clusters
> +- *        Accepts 8-bit unsigned integer points
> +- *        Provides faster execution time than cv::kmeans on Qualcomm's
> processors
> +- * @param points            Points array of type 8u, each row represets
> a point.
> +- *                          Size is N rows by D columns, can be
> non-continuous.
> +- * @param clusterCenters    Initial cluster centers array of type 32f,
> each row represents a center.
> +- *                          Size is K rows by D columns, can be
> non-continuous.
> +- * @param newClusterCenters Resulting cluster centers array of type 32f=
,
> each row represents found center.
> +- *                          Size is set to be K rows by D columns.
> +- * @param clusterSizes      Resulting cluster member counts array of
> type uint32, size is set to be 1 row by K columns.
> +- * @param clusterBindings   Resulting points indices array of type
> uint32, each index tells to which cluster the corresponding point belongs
> to.
> +- *                          Size is set to be 1 row by numPointsUsed
> columns.
> +- * @param clusterSumDists   Resulting distance sums array of type 32f,
> each number is a sum of distances between each cluster center to its
> belonging points.
> +- *                          Size is set to be 1 row by K columns
> +- * @param numPointsUsed     Number of points to clusterize starting fro=
m
> 0 to numPointsUsed-1 inclusively. Sets to N if negative.
> +- */
> +-CV_EXPORTS_W void clusterEuclidean(InputArray points, InputArray
> clusterCenters, OutputArray newClusterCenters,
> +-                                   OutputArray clusterSizes, OutputArra=
y
> clusterBindings, OutputArray clusterSumDists,
> +-                                   int numPointsUsed =3D -1);
> +-
> +-//! @}
> +-
> +-} // fastcv::
> +-} // cv::
> +-
> +-#endif // OPENCV_FASTCV_CLUSTER_HPP
> +diff --git a/modules/fastcv/perf/perf_cluster_euclidean.cpp
> b/modules/fastcv/perf/perf_cluster_euclidean.cpp
> +deleted file mode 100644
> +index 20bc31a7..00000000
> +--- a/modules/fastcv/perf/perf_cluster_euclidean.cpp
> ++++ /dev/null
> +@@ -1,79 +0,0 @@
> +-/*
> +- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights
> reserved.
> +- * SPDX-License-Identifier: Apache-2.0
> +-*/
> +-
> +-#include "perf_precomp.hpp"
> +-
> +-namespace opencv_test {
> +-
> +-typedef std::tuple<int /* nPts */, int /*nDims*/, int /*nClusters*/>
> ClusterEuclideanPerfParams;
> +-typedef perf::TestBaseWithParam<ClusterEuclideanPerfParams>
> ClusterEuclideanPerfTest;
> +-
> +-PERF_TEST_P(ClusterEuclideanPerfTest, run,
> +-            ::testing::Combine(::testing::Values(100, 1000, 10000), //
> nPts
> +-                               ::testing::Values(2, 10, 32),        //
> nDims
> +-                               ::testing::Values(5, 10, 16))        //
> nClusters
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
> +-        cv::fastcv::clusterEuclidean(points, clusterCenters,
> newClusterCenters, clusterSizes, clusterBindings, clusterSumDists);
> +-        stopTimer();
> +-    }
> +-
> +-    SANITY_CHECK_NOTHING();
> +-}
> +-
> +-} // namespace
> +diff --git a/modules/fastcv/src/cluster_euclidean.cpp
> b/modules/fastcv/src/cluster_euclidean.cpp
> +deleted file mode 100644
> +index a50b027c..00000000
> +--- a/modules/fastcv/src/cluster_euclidean.cpp
> ++++ /dev/null
> +@@ -1,66 +0,0 @@
> +-/*
> +- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights
> reserved.
> +- * SPDX-License-Identifier: Apache-2.0
> +-*/
> +-
> +-#include "precomp.hpp"
> +-
> +-namespace cv {
> +-namespace fastcv {
> +-
> +-void clusterEuclidean(InputArray _points, InputArray _clusterCenters,
> OutputArray _newClusterCenters,
> +-                      OutputArray _clusterSizes, OutputArray
> _clusterBindings, OutputArray _clusterSumDists,
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
=3D
> CV_32F);
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
> +-
>  (float32_t*)newClusterCenters.data,
> +-                                       (uint32_t*)clusterSizes.data,
> +-                                       (uint32_t*)clusterBindings.data,
> +-                                       (float32_t*)clusterSumDists.data=
);
> +-
> +-    if (result)
> +-    {
> +-        CV_Error(cv::Error::StsInternal, cv::format("Failed to
> clusterize, error code: %d", result));
> +-    }
> +-}
> +-
> +-} // fastcv::
> +-} // cv::
> +diff --git a/modules/fastcv/test/test_cluster_euclidean.cpp
> b/modules/fastcv/test/test_cluster_euclidean.cpp
> +deleted file mode 100644
> +index c108f754..00000000
> +--- a/modules/fastcv/test/test_cluster_euclidean.cpp
> ++++ /dev/null
> +@@ -1,124 +0,0 @@
> +-/*
> +- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights
> reserved.
> +- * SPDX-License-Identifier: Apache-2.0
> +-*/
> +-
> +-#include "test_precomp.hpp"
> +-
> +-namespace opencv_test { namespace {
> +-
> +-// nPts, nDims, nClusters
> +-typedef std::tuple<int, int, int> ClusterEuclideanTestParams;
> +-class ClusterEuclideanTest : public
> ::testing::TestWithParam<ClusterEuclideanTestParams> {};
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
> +-    cv::fastcv::clusterEuclidean(points, clusterCenters,
> newClusterCenters, clusterSizes, clusterBindings, clusterSumDists);
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
> +-            cv::ellipse(draw, Point(cx, cy), Size(sx, sy), 0, 0, 360,
> Scalar(255, 0, 0));
> +-
> +-            float ox =3D clusterCenters.at<float>(i, 0);
> +-            float oy =3D clusterCenters.at<float>(i, 1);
> +-            draw.at<Vec3b>(oy, ox) =3D Vec3b(0, 0, 255);
> +-
> +-            float nx =3D newClusterCenters.at<float>(i, 0);
> +-            float ny =3D newClusterCenters.at<float>(i, 1);
> +-            draw.at<Vec3b>(ny, nx) =3D Vec3b(255, 255, 0);
> +-        }
> +-        cv::imwrite(cv::format("draw_%d_%d_%d.png", nPts, nDims,
> nClusters), draw);
> +-    }
> +-
> +-    {
> +-        std::vector<double> diffs;
> +-        for (int i =3D 0; i < nClusters; i++)
> +-        {
> +-            double cs =3D std::abs((trueClusterSizes[i] - clusterSizes[=
i])
> / double(trueClusterSizes[i]));
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
> +-        double normH =3D cv::norm(bindings8u, trueBindings8u,
> NORM_HAMMING) / nPts;
> +-        EXPECT_LT(normH, 0.658);
> +-    }
> +-}
> +-
> +-INSTANTIATE_TEST_CASE_P(FastCV_Extension, ClusterEuclideanTest,
> +-                        ::testing::Combine(::testing::Values(100, 1000,
> 10000), // nPts
> +-                                           ::testing::Values(2, 10,
> 32),        // nDims
> +-                                           ::testing::Values(5, 10,
> 16)));      // nClusters
> +-
> +-}} // namespaces opencv_test, ::
> +\ No newline at end of file
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> index 1613b6a3ed..0587599253 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
> @@ -16,27 +16,35 @@ SRCREV_boostdesc =3D
> "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
>  SRCREV_vgg =3D "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
>  SRCREV_face =3D "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
>  SRCREV_wechat-qrcode =3D "a8b69ccc738421293254aec5ddb38bd523503252"
> +SRCREV_fastcv =3D "f4413cc2ab7233fdfc383a4cded402c072677fb0"
>
>
> -SRCREV_FORMAT =3D "opencv_contrib_ipp_boostdesc_vgg"
> +SRCREV_FORMAT =3D "opencv_contrib_ipp_boostdesc_vgg_fastcv"
>  SRC_URI =3D "git://
> github.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x;protocol=3Dhttps =
\
>             git://
> github.com/opencv/opencv_contrib.git;destsuffix=3Dgit/contrib;name=3Dcont=
rib;branch=3D4.x;protocol=3Dhttps
> \
>             git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_boostd=
esc_20161012;destsuffix=3Dgit/boostdesc;name=3Dboostdesc;protocol=3Dhttps
> \
>             git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_vgg_20=
160317;destsuffix=3Dgit/vgg;name=3Dvgg;protocol=3Dhttps
> \
>             git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_face_alignment_201=
70818;destsuffix=3Dgit/face;name=3Dface;protocol=3Dhttps
> \
>             git://
> github.com/WeChatCV/opencv_3rdparty.git;branch=3Dwechat_qrcode;destsuffix=
=3Dgit/wechat_qrcode;name=3Dwechat-qrcode;protocol=3Dhttps
> \
> +           git://
> github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250212;destsu=
ffix=3Dgit/fastcv;name=3Dfastcv;protocol=3Dhttps
> \
>             file://0003-To-fix-errors-as-following.patch \
>
> file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
>             file://0001-Dont-use-isystem.patch \
>             file://download.patch \
>             file://0001-Make-ts-module-external.patch \
>             file://0008-Do-not-embed-build-directory-in-binaries.patch \
> -           file://0001-core-fixed-VSX-intrinsics-implementation.patch \
>             "
>  SRC_URI:append:riscv64 =3D "
> file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=3Dcontrib"
>
>  S =3D "${WORKDIR}/git"
>
> +# Disabling cluster ecludian tests in fastcv EXTN as it causes fastcv
> EXTN tests to be crashed.
> +# Adding support for fastcv static lib as per Upstream OpenCV.
> +# These are temporary patches, will be removed in next release.
> +
> +SRC_URI +=3D
> "file://0001-PENDING-Removed-cluster-euclidean-in-fastcv-ext.patch;patchd=
ir=3D${S}/contrib/
> \
> +
> file://0001-FROMLIST-Using-fastcv-static-lib-for-compilation.patch"
>

Please move all the patches to above general SRC_URI and add the
explanation to the main commit message
or the patch itself.

Jose

+
>  # OpenCV wants to download more files during configure.  We download
> these in
>  # do_fetch and construct a source cache in the format it expects
>  OPENCV_DLDIR =3D "${WORKDIR}/downloads"
> @@ -61,6 +69,7 @@ do_unpack_extra() {
>      cache data ${S}/face/*.dat
>      cache wechat_qrcode ${S}/wechat_qrcode/*.caffemodel
>      cache wechat_qrcode ${S}/wechat_qrcode/*.prototxt
> +    cache fastcv ${S}/fastcv/fastcv/*.tgz
>  }
>  addtask unpack_extra after do_unpack before do_patch
>
> @@ -71,7 +80,6 @@ EXTRA_OECMAKE =3D
> "-DOPENCV_EXTRA_MODULES_PATH=3D${S}/contrib/modules \
>      -DENABLE_PRECOMPILED_HEADERS=3DOFF \
>      -DCMAKE_SKIP_RPATH=3DON \
>      -DWITH_IPP=3DOFF \
> -    -DWITH_FASTCV=3DOFF \
>      -DOPENCV_GENERATE_PKGCONFIG=3DON \
>      -DOPENCV_DOWNLOAD_PATH=3D${OPENCV_DLDIR} \
>      -DOPENCV_ALLOW_DOWNLOADS=3DOFF \
> @@ -122,6 +130,7 @@ PACKAGECONFIG[tests] =3D
> "-DBUILD_TESTS=3DON,-DBUILD_TESTS=3DOFF,,"
>  PACKAGECONFIG[text] =3D
> "-DBUILD_opencv_text=3DON,-DBUILD_opencv_text=3DOFF,tesseract,"
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
> View/Reply Online (#116291):
> https://lists.openembedded.org/g/openembedded-devel/message/116291
> Mute This Topic: https://lists.openembedded.org/mt/111913662/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000e225a606313cbb93
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Pulkit,</div><br>Thanks=C2=A0for your patch.<br><b=
r>For the title please use the component in lowercase, you can examples wit=
h: git log --oneline meta-oe/recipes-support/opencv<br>opencv: Adding FastC=
V-HAL enablement option as packageconfig<div><br>I have some comments inlin=
e.<br><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">Pulkit Singh Tak (Temp) (QUIC) via <a href=3D"http://=
lists.openembedded.org">lists.openembedded.org</a> &lt;quic_ptak=3D<a href=
=3D"mailto:quicinc.com@lists.openembedded.org">quicinc.com@lists.openembedd=
ed.org</a>&gt; escreveu (quarta, 26/03/2025 =C3=A0(s) 09:20):<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">Adding patches to support fas=
tcv static lib compilation.<br>
Removal of cluster ecludian tests support.<br>
These are temporary patches to be removed in next release.<br>
<br>
Signed-off-by: Pulkit Singh Tak &lt;<a href=3D"mailto:quic_ptak@quicinc.com=
" target=3D"_blank">quic_ptak@quicinc.com</a>&gt;<br>
---<br>
=C2=A0...ng-fastcv-static-lib-for-compilation.patch |=C2=A0 96 +++++<br>
=C2=A0...oved-cluster-euclidean-in-fastcv-ext.patch | 371 +++++++++++++++++=
+<br>
=C2=A0.../recipes-support/opencv/<a href=3D"http://opencv_4.11.0.bb" rel=3D=
"noreferrer" target=3D"_blank">opencv_4.11.0.bb</a>=C2=A0 =C2=A0|=C2=A0 15 =
+-<br>
=C2=A03 files changed, 479 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-FROMLIS=
T-Using-fastcv-static-lib-for-compilation.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-PENDING=
-Removed-cluster-euclidean-in-fastcv-ext.patch<br>
<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fast=
cv-static-lib-for-compilation.patch b/meta-oe/recipes-support/opencv/opencv=
/0001-FROMLIST-Using-fastcv-static-lib-for-compilation.patch<br>
new file mode 100644<br>
index 0000000000..f822e5066b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-Using-fastcv-stat=
ic-lib-for-compilation.patch<br>
@@ -0,0 +1,96 @@<br>
+From 0141830e67ac7c60c474ab3c1e7d3e30c27c7943 Mon Sep 17 00:00:00 2001<br>
+From: Pulkit Singh Tak &lt;<a href=3D"mailto:quic_ptak@quicinc.com" target=
=3D"_blank">quic_ptak@quicinc.com</a>&gt;<br>
+Date: Mon, 10 Feb 2025 15:10:26 +0530<br>
+Subject: [PATCH] FROMLIST: Using fastcv static lib for compilation<br>
+<br>
+Signed-off-by: Pulkit Singh Tak &lt;<a href=3D"mailto:quic_ptak@quicinc.co=
m" target=3D"_blank">quic_ptak@quicinc.com</a>&gt;<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/opencv/opencv/pu=
ll/26917" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencv/op=
encv/pull/26917</a>]<br></blockquote><div><br>Please use the patch as is an=
d only add the Upstream-Status and Signed-off-by<br><br>The commit title th=
e author is different from the one your pinted<br><a href=3D"https://github=
.com/opencv/opencv/pull/26917/commits/5921aae2b38f97a377889cc73ed1d914021a1=
fc9">https://github.com/opencv/opencv/pull/26917/commits/5921aae2b38f97a377=
889cc73ed1d914021a1fc9</a>=C2=A0=C2=A0<br>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+---<br>
+ 3rdparty/fastcv/fastcv.cmake=C2=A0 =C2=A0|=C2=A0 9 +++++----<br>
+ cmake/OpenCVFindLibsPerf.cmake | 23 ++++++++++++++++-------<br>
+ 2 files changed, 21 insertions(+), 11 deletions(-)<br>
+<br>
+diff --git a/3rdparty/fastcv/fastcv.cmake b/3rdparty/fastcv/fastcv.cmake<b=
r>
+index b8172705ca..12c6616a16 100644<br>
+--- a/3rdparty/fastcv/fastcv.cmake<br>
++++ b/3rdparty/fastcv/fastcv.cmake<br>
+@@ -1,7 +1,7 @@<br>
+ function(download_fastcv root_dir)<br>
+ <br>
+=C2=A0 =C2=A0# Commit SHA in the opencv_3rdparty repo<br>
+-=C2=A0 set(FASTCV_COMMIT &quot;dc5d58018f3af915a8d209386d2c58c0501c0f2c&q=
uot;)<br>
++=C2=A0 set(FASTCV_COMMIT &quot;f4413cc2ab7233fdfc383a4cded402c072677fb0&q=
uot;)<br>
+ <br>
+=C2=A0 =C2=A0# Define actual FastCV versions<br>
+=C2=A0 =C2=A0if(ANDROID)<br>
+@@ -16,14 +16,15 @@ function(download_fastcv root_dir)<br>
+=C2=A0 =C2=A0 =C2=A0endif()<br>
+=C2=A0 =C2=A0elseif(UNIX AND NOT APPLE AND NOT IOS AND NOT XROS)<br>
+=C2=A0 =C2=A0 =C2=A0if(AARCH64)<br>
+-=C2=A0 =C2=A0 =C2=A0 set(FCV_PACKAGE_NAME=C2=A0 &quot;fastcv_linux_aarch6=
4_2024_12_11.tgz&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 set(FCV_PACKAGE_HASH=C2=A0 &quot;7b33ad833e6f15ab6d4=
ec64fa3c17acd&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 set(FCV_PACKAGE_NAME=C2=A0 &quot;fastcv_linux_aarch6=
4_2025_02_12.tgz&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 set(FCV_PACKAGE_HASH=C2=A0 &quot;33ac2a59cf3e7d6402e=
ee2e010de1202&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0else()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0message(&quot;FastCV: fastcv lib for 32-bit Lin=
ux is not supported for now!&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0endif()<br>
+=C2=A0 =C2=A0endif(ANDROID)<br>
+ <br>
+=C2=A0 =C2=A0# Download Package<br>
++<br>
+=C2=A0 =C2=A0set(OPENCV_FASTCV_URL &quot;<a href=3D"https://raw.githubuser=
content.com/opencv/opencv_3rdparty/$%7BFASTCV_COMMIT%7D/fastcv/" rel=3D"nor=
eferrer" target=3D"_blank">https://raw.githubusercontent.com/opencv/opencv_=
3rdparty/${FASTCV_COMMIT}/fastcv/</a>&quot;)<br>
+ <br>
+=C2=A0 =C2=A0ocv_download( FILENAME=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${FCV_PACKA=
GE_NAME}<br>
+@@ -40,4 +41,4 @@ function(download_fastcv root_dir)<br>
+=C2=A0 =C2=A0 =C2=A0message(WARNING &quot;FastCV: package download failed!=
&quot;)<br>
+=C2=A0 =C2=A0endif()<br>
+ <br>
+-endfunction()<br>
++endfunction()<br>
+\ No newline at end of file<br>
+diff --git a/cmake/OpenCVFindLibsPerf.cmake b/cmake/OpenCVFindLibsPerf.cma=
ke<br>
+index c2380e6ce5..a31842dfbb 100644<br>
+--- a/cmake/OpenCVFindLibsPerf.cmake<br>
++++ b/cmake/OpenCVFindLibsPerf.cmake<br>
+@@ -181,7 +181,14 @@ endif(WITH_KLEIDICV)<br>
+ if(WITH_FASTCV)<br>
+=C2=A0 =C2=A0if((EXISTS ${FastCV_INCLUDE_PATH}) AND (EXISTS ${FastCV_LIB_P=
ATH}))<br>
+=C2=A0 =C2=A0 =C2=A0message(STATUS &quot;Use external FastCV ${FastCV_INCL=
UDE_PATH}, ${FastCV_LIB_PATH}&quot;)<br>
+-=C2=A0 =C2=A0 set(HAVE_FASTCV TRUE CACHE BOOL &quot;FastCV status&quot;)<=
br>
++=C2=A0 =C2=A0 find_library(FASTCV_LIBRARY NAMES &quot;fastcv&quot;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PATHS &quot=
;${FastCV_LIB_PATH}&quot; NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)<br>
++=C2=A0 =C2=A0 mark_as_advanced(FASTCV_LIBRARY)<br>
++=C2=A0 =C2=A0 if (FASTCV_LIBRARY)<br>
++=C2=A0 =C2=A0 =C2=A0 set(HAVE_FASTCV TRUE CACHE BOOL &quot;FastCV status&=
quot;)<br>
++=C2=A0 =C2=A0 else()<br>
++=C2=A0 =C2=A0 =C2=A0 set(HAVE_FASTCV FALSE CACHE BOOL &quot;FastCV status=
&quot;)<br>
++=C2=A0 =C2=A0 endif()<br>
+=C2=A0 =C2=A0else()<br>
+=C2=A0 =C2=A0 =C2=A0include(&quot;${OpenCV_SOURCE_DIR}/3rdparty/fastcv/fas=
tcv.cmake&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0set(FCV_ROOT_DIR &quot;${OpenCV_BINARY_DIR}/3rdparty/f=
astcv&quot;)<br>
+@@ -190,13 +197,15 @@ if(WITH_FASTCV)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set(FastCV_INCLUDE_PATH &quot;${FCV_ROOT_DIR}/i=
nc&quot; CACHE PATH &quot;FastCV includes directory&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set(FastCV_LIB_PATH &quot;${FCV_ROOT_DIR}/libs&=
quot; CACHE PATH &quot;FastCV library directory&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ocv_install_3rdparty_licenses(FastCV &quot;${Op=
enCV_BINARY_DIR}/3rdparty/fastcv/LICENSE&quot;)<br>
+-=C2=A0 =C2=A0 =C2=A0 install(FILES &quot;${FastCV_LIB_PATH}/libfastcvopt.=
so&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DESTINATION &quot;${OPEN=
CV_LIB_INSTALL_PATH}&quot; COMPONENT &quot;bin&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 if(ANDROID)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(FASTCV_LIBRARY &quot;${FastCV_LIB_PATH}/l=
ibfastcvopt.so&quot; CACHE PATH &quot;FastCV library&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install(FILES &quot;${FASTCV_LIBRARY}&quot; D=
ESTINATION &quot;${OPENCV_LIB_INSTALL_PATH}&quot; COMPONENT &quot;bin&quot;=
)<br>
++=C2=A0 =C2=A0 =C2=A0 else()<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 set(FASTCV_LIBRARY &quot;${FastCV_LIB_PATH}/l=
ibfastcv.a&quot; CACHE PATH &quot;FastCV library&quot;)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 install(FILES &quot;${FASTCV_LIBRARY}&quot; D=
ESTINATION &quot;${OPENCV_LIB_INSTALL_PATH}&quot; COMPONENT &quot;dev&quot;=
)<br>
++=C2=A0 =C2=A0 =C2=A0 endif()<br>
+=C2=A0 =C2=A0 =C2=A0else()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0set(HAVE_FASTCV FALSE CACHE BOOL &quot;FastCV s=
tatus&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0endif()<br>
+=C2=A0 =C2=A0endif()<br>
+-=C2=A0 if(HAVE_FASTCV)<br>
+-=C2=A0 =C2=A0 set(FASTCV_LIBRARY &quot;${FastCV_LIB_PATH}/libfastcvopt.so=
&quot; CACHE PATH &quot;FastCV library&quot;)<br>
+-=C2=A0 endif()<br>
+-endif(WITH_FASTCV)<br>
++endif(WITH_FASTCV)<br>
+\ No newline at end of file<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-clu=
ster-euclidean-in-fastcv-ext.patch b/meta-oe/recipes-support/opencv/opencv/=
0001-PENDING-Removed-cluster-euclidean-in-fastcv-ext.patch<br>
new file mode 100644<br>
index 0000000000..cb454ccf14<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/opencv/opencv/0001-PENDING-Removed-cluster-eu=
clidean-in-fastcv-ext.patch<br>
@@ -0,0 +1,371 @@<br>
+From d7db8fb8d715a86d0939797bc08073895c475989 Mon Sep 17 00:00:00 2001<br>
+From: Pulkit Singh Tak &lt;<a href=3D"mailto:quic_ptak@quicinc.com" target=
=3D"_blank">quic_ptak@quicinc.com</a>&gt;<br>
+Date: Thu, 13 Feb 2025 17:55:08 +0530<br>
+Subject: [PATCH] PENDING: Removed cluster euclidean in fastcv ext<br>
+<br>
+Signed-off-by: Pulkit Singh Tak &lt;<a href=3D"mailto:quic_ptak@quicinc.co=
m" target=3D"_blank">quic_ptak@quicinc.com</a>&gt;<br>
+Upstream-Status: Pending<br></blockquote><div><br>This patch is quite big =
so please submit it upstream=C2=A0also and add a reference for it.<br>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+---<br>
+ modules/fastcv/include/opencv2/fastcv.hpp=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A01 -<br>
+ .../fastcv/include/opencv2/fastcv/cluster.hpp |=C2=A0 43 ------<br>
+ .../fastcv/perf/perf_cluster_euclidean.cpp=C2=A0 =C2=A0 |=C2=A0 79 ------=
-----<br>
+ modules/fastcv/src/cluster_euclidean.cpp=C2=A0 =C2=A0 =C2=A0 |=C2=A0 66 -=
---------<br>
+ .../fastcv/test/test_cluster_euclidean.cpp=C2=A0 =C2=A0 | 124 -----------=
-------<br>
+ 5 files changed, 313 deletions(-)<br>
+ delete mode 100644 modules/fastcv/include/opencv2/fastcv/cluster.hpp<br>
+ delete mode 100644 modules/fastcv/perf/perf_cluster_euclidean.cpp<br>
+ delete mode 100644 modules/fastcv/src/cluster_euclidean.cpp<br>
+ delete mode 100644 modules/fastcv/test/test_cluster_euclidean.cpp<br>
+<br>
+diff --git a/modules/fastcv/include/opencv2/fastcv.hpp b/modules/fastcv/in=
clude/opencv2/fastcv.hpp<br>
+index af188dfc..c5deb5e0 100644<br>
+--- a/modules/fastcv/include/opencv2/fastcv.hpp<br>
++++ b/modules/fastcv/include/opencv2/fastcv.hpp<br>
+@@ -11,7 +11,6 @@<br>
+ #include &quot;opencv2/fastcv/arithm.hpp&quot;<br>
+ #include &quot;opencv2/fastcv/bilateralFilter.hpp&quot;<br>
+ #include &quot;opencv2/fastcv/blur.hpp&quot;<br>
+-#include &quot;opencv2/fastcv/cluster.hpp&quot;<br>
+ #include &quot;opencv2/fastcv/draw.hpp&quot;<br>
+ #include &quot;opencv2/fastcv/edges.hpp&quot;<br>
+ #include &quot;opencv2/fastcv/fast10.hpp&quot;<br>
+diff --git a/modules/fastcv/include/opencv2/fastcv/cluster.hpp b/modules/f=
astcv/include/opencv2/fastcv/cluster.hpp<br>
+deleted file mode 100644<br>
+index 46ac7ad1..00000000<br>
+--- a/modules/fastcv/include/opencv2/fastcv/cluster.hpp<br>
++++ /dev/null<br>
+@@ -1,43 +0,0 @@<br>
+-/*<br>
+- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserve=
d.<br>
+- * SPDX-License-Identifier: Apache-2.0<br>
+-*/<br>
+-<br>
+-#ifndef OPENCV_FASTCV_CLUSTER_HPP<br>
+-#define OPENCV_FASTCV_CLUSTER_HPP<br>
+-<br>
+-#include &lt;opencv2/core.hpp&gt;<br>
+-<br>
+-namespace cv {<br>
+-namespace fastcv {<br>
+-<br>
+-//! @addtogroup fastcv<br>
+-//! @{<br>
+-<br>
+-/**<br>
+- * @brief Clusterizes N input points in D-dimensional space into K cluste=
rs<br>
+- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 Accepts 8-bit unsigned integer points<br>
+- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 Provides faster execution time than cv::kme=
ans on Qualcomm&#39;s processors<br>
+- * @param points=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Points array of=
 type 8u, each row represets a point.<br>
+- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Size is N rows by D columns, can be non-continuous.<br=
>
+- * @param clusterCenters=C2=A0 =C2=A0 Initial cluster centers array of ty=
pe 32f, each row represents a center.<br>
+- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Size is K rows by D columns, can be non-continuous.<br=
>
+- * @param newClusterCenters Resulting cluster centers array of type 32f, =
each row represents found center.<br>
+- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Size is set to be K rows by D columns.<br>
+- * @param clusterSizes=C2=A0 =C2=A0 =C2=A0 Resulting cluster member count=
s array of type uint32, size is set to be 1 row by K columns.<br>
+- * @param clusterBindings=C2=A0 =C2=A0Resulting points indices array of t=
ype uint32, each index tells to which cluster the corresponding point belon=
gs to.<br>
+- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Size is set to be 1 row by numPointsUsed columns.<br>
+- * @param clusterSumDists=C2=A0 =C2=A0Resulting distance sums array of ty=
pe 32f, each number is a sum of distances between each cluster center to it=
s belonging points.<br>
+- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Size is set to be 1 row by K columns<br>
+- * @param numPointsUsed=C2=A0 =C2=A0 =C2=A0Number of points to clusterize=
 starting from 0 to numPointsUsed-1 inclusively. Sets to N if negative.<br>
+- */<br>
+-CV_EXPORTS_W void clusterEuclidean(InputArray points, InputArray clusterC=
enters, OutputArray newClusterCenters,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OutputArray clusterSize=
s, OutputArray clusterBindings, OutputArray clusterSumDists,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int numPointsUsed =3D -=
1);<br>
+-<br>
+-//! @}<br>
+-<br>
+-} // fastcv::<br>
+-} // cv::<br>
+-<br>
+-#endif // OPENCV_FASTCV_CLUSTER_HPP<br>
+diff --git a/modules/fastcv/perf/perf_cluster_euclidean.cpp b/modules/fast=
cv/perf/perf_cluster_euclidean.cpp<br>
+deleted file mode 100644<br>
+index 20bc31a7..00000000<br>
+--- a/modules/fastcv/perf/perf_cluster_euclidean.cpp<br>
++++ /dev/null<br>
+@@ -1,79 +0,0 @@<br>
+-/*<br>
+- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserve=
d.<br>
+- * SPDX-License-Identifier: Apache-2.0<br>
+-*/<br>
+-<br>
+-#include &quot;perf_precomp.hpp&quot;<br>
+-<br>
+-namespace opencv_test {<br>
+-<br>
+-typedef std::tuple&lt;int /* nPts */, int /*nDims*/, int /*nClusters*/&gt=
; ClusterEuclideanPerfParams;<br>
+-typedef perf::TestBaseWithParam&lt;ClusterEuclideanPerfParams&gt; Cluster=
EuclideanPerfTest;<br>
+-<br>
+-PERF_TEST_P(ClusterEuclideanPerfTest, run,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ::testing::Combine(::testing::V=
alues(100, 1000, 10000), // nPts<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0::testing::Values(2, 10, 32),=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 // nDims<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0::testing::Values(5, 10, 16))=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 // nClusters<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
+-{<br>
+-=C2=A0 =C2=A0 auto p =3D GetParam();<br>
+-=C2=A0 =C2=A0 int nPts=C2=A0 =C2=A0 =C2=A0 =3D std::get&lt;0&gt;(p);<br>
+-=C2=A0 =C2=A0 int nDims=C2=A0 =C2=A0 =C2=A0=3D std::get&lt;1&gt;(p);<br>
+-=C2=A0 =C2=A0 int nClusters =3D std::get&lt;2&gt;(p);<br>
+-<br>
+-=C2=A0 =C2=A0 Mat points(nPts, nDims, CV_8U);<br>
+-=C2=A0 =C2=A0 Mat clusterCenters(nClusters, nDims, CV_32F);<br>
+-<br>
+-=C2=A0 =C2=A0 Mat trueMeans(nClusters, nDims, CV_32F);<br>
+-=C2=A0 =C2=A0 Mat stddevs(nClusters, nDims, CV_32F);<br>
+-=C2=A0 =C2=A0 std::vector&lt;int&gt; trueClusterSizes(nClusters, 0);<br>
+-=C2=A0 =C2=A0 std::vector&lt;int&gt; trueClusterBindings(nPts, 0);<br>
+-=C2=A0 =C2=A0 std::vector&lt;float&gt; trueSumDists(nClusters, 0);<br>
+-<br>
+-=C2=A0 =C2=A0 cv::RNG&amp; rng =3D cv::theRNG();<br>
+-=C2=A0 =C2=A0 for (int i =3D 0; i &lt; nClusters; i++)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat mean(1, nDims, CV_64F), stdev(1, nDims, C=
V_64F);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rng.fill(mean,=C2=A0 cv::RNG::UNIFORM, 0, 256=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rng.fill(stdev, cv::RNG::UNIFORM, 5.f, 16);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int lo =3D=C2=A0 =C2=A0 i=C2=A0 =C2=A0 * nPts=
 / nClusters;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int hi =3D (i + 1) * nPts / nClusters;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int d =3D 0; d &lt; nDims; d++)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rng.fill(points.col(d).rowRange=
(lo, hi), cv::RNG::NORMAL,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<a href=3D"http://mean.at" rel=3D"noreferrer" target=3D"_blank">mean.at<=
/a>&lt;double&gt;(d), <a href=3D"http://stdev.at" rel=3D"noreferrer" target=
=3D"_blank">stdev.at</a>&lt;double&gt;(d));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 float sd =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int j =3D lo; j &lt; hi; j++)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat pts64f;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 points.row(j).convertTo(pts64f,=
 CV_64F);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd +=3D cv::norm(mean, pts64f, =
NORM_L2);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trueClusterBindings.at(j) =3D i=
;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trueClusterSizes.at(i)++;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 trueSumDists.at(i) =3D sd;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 // let&#39;s shift initial cluster center a b=
it<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat(mean + stdev * 0.5).copyTo(clusterCenters=
.row(i));<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mean.copyTo(trueMeans.row(i));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdev.copyTo(stddevs.row(i));<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 while(next())<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat newClusterCenters;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::vector&lt;int&gt; clusterSizes, clusterB=
indings;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::vector&lt;float&gt; clusterSumDists;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 startTimer();<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cv::fastcv::clusterEuclidean(points, clusterC=
enters, newClusterCenters, clusterSizes, clusterBindings, clusterSumDists);=
<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stopTimer();<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 SANITY_CHECK_NOTHING();<br>
+-}<br>
+-<br>
+-} // namespace<br>
+diff --git a/modules/fastcv/src/cluster_euclidean.cpp b/modules/fastcv/src=
/cluster_euclidean.cpp<br>
+deleted file mode 100644<br>
+index a50b027c..00000000<br>
+--- a/modules/fastcv/src/cluster_euclidean.cpp<br>
++++ /dev/null<br>
+@@ -1,66 +0,0 @@<br>
+-/*<br>
+- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserve=
d.<br>
+- * SPDX-License-Identifier: Apache-2.0<br>
+-*/<br>
+-<br>
+-#include &quot;precomp.hpp&quot;<br>
+-<br>
+-namespace cv {<br>
+-namespace fastcv {<br>
+-<br>
+-void clusterEuclidean(InputArray _points, InputArray _clusterCenters, Out=
putArray _newClusterCenters,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 OutputArray _clusterSizes, OutputArray _clusterBindings, OutputArray _c=
lusterSumDists,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 int numPointsUsed)<br>
+-{<br>
+-=C2=A0 =C2=A0 INITIALIZATION_CHECK;<br>
+-<br>
+-=C2=A0 =C2=A0 CV_Assert(!_points.empty() &amp;&amp; _points.type() =3D=3D=
 CV_8UC1);<br>
+-=C2=A0 =C2=A0 int nPts=C2=A0 =C2=A0 =C2=A0 =3D _points.rows();<br>
+-=C2=A0 =C2=A0 int nDims=C2=A0 =C2=A0 =C2=A0=3D _points.cols();<br>
+-=C2=A0 =C2=A0 int ptsStride =3D _points.step();<br>
+-<br>
+-=C2=A0 =C2=A0 CV_Assert(!_clusterCenters.empty() &amp;&amp; _clusterCente=
rs.depth() =3D=3D CV_32F);<br>
+-=C2=A0 =C2=A0 int nClusters=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D _=
clusterCenters.rows();<br>
+-=C2=A0 =C2=A0 int clusterCenterStride =3D _clusterCenters.step();<br>
+-<br>
+-=C2=A0 =C2=A0 CV_Assert(_clusterCenters.cols() =3D=3D nDims);<br>
+-<br>
+-=C2=A0 =C2=A0 CV_Assert(numPointsUsed &lt;=3D nPts);<br>
+-=C2=A0 =C2=A0 if (numPointsUsed &lt; 0)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 numPointsUsed =3D nPts;<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 _newClusterCenters.create(nClusters, nDims, CV_32FC1);<br>
+-=C2=A0 =C2=A0 _clusterSizes.create(1, nClusters, CV_32SC1);<br>
+-=C2=A0 =C2=A0 _clusterBindings.create(1, numPointsUsed, CV_32SC1);<br>
+-=C2=A0 =C2=A0 _clusterSumDists.create(1, nClusters, CV_32FC1);<br>
+-<br>
+-=C2=A0 =C2=A0 Mat points=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D _po=
ints.getMat();<br>
+-=C2=A0 =C2=A0 Mat clusterCenters=C2=A0 =C2=A0 =3D _clusterCenters.getMat(=
);<br>
+-=C2=A0 =C2=A0 Mat newClusterCenters =3D _newClusterCenters.getMat();<br>
+-=C2=A0 =C2=A0 Mat clusterSizes=C2=A0 =C2=A0 =C2=A0 =3D _clusterSizes.getM=
at();<br>
+-=C2=A0 =C2=A0 Mat clusterBindings=C2=A0 =C2=A0=3D _clusterBindings.getMat=
();<br>
+-=C2=A0 =C2=A0 Mat clusterSumDists=C2=A0 =C2=A0=3D _clusterSumDists.getMat=
();<br>
+-<br>
+-=C2=A0 =C2=A0 int result =3D fcvClusterEuclideanu8(points.data,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nPts,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nDims,<br=
>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptsStride=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0numPoints=
Used,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nClusters=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(float32_=
t*)clusterCenters.data,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clusterCe=
nterStride,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(float32_=
t*)newClusterCenters.data,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint32_t=
*)clusterSizes.data,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(uint32_t=
*)clusterBindings.data,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(float32_=
t*)clusterSumDists.data);<br>
+-<br>
+-=C2=A0 =C2=A0 if (result)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 CV_Error(cv::Error::StsInternal, cv::format(&=
quot;Failed to clusterize, error code: %d&quot;, result));<br>
+-=C2=A0 =C2=A0 }<br>
+-}<br>
+-<br>
+-} // fastcv::<br>
+-} // cv::<br>
+diff --git a/modules/fastcv/test/test_cluster_euclidean.cpp b/modules/fast=
cv/test/test_cluster_euclidean.cpp<br>
+deleted file mode 100644<br>
+index c108f754..00000000<br>
+--- a/modules/fastcv/test/test_cluster_euclidean.cpp<br>
++++ /dev/null<br>
+@@ -1,124 +0,0 @@<br>
+-/*<br>
+- * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserve=
d.<br>
+- * SPDX-License-Identifier: Apache-2.0<br>
+-*/<br>
+-<br>
+-#include &quot;test_precomp.hpp&quot;<br>
+-<br>
+-namespace opencv_test { namespace {<br>
+-<br>
+-// nPts, nDims, nClusters<br>
+-typedef std::tuple&lt;int, int, int&gt; ClusterEuclideanTestParams;<br>
+-class ClusterEuclideanTest : public ::testing::TestWithParam&lt;ClusterEu=
clideanTestParams&gt; {};<br>
+-<br>
+-TEST_P(ClusterEuclideanTest, accuracy)<br>
+-{<br>
+-=C2=A0 =C2=A0 auto p =3D GetParam();<br>
+-=C2=A0 =C2=A0 int nPts=C2=A0 =C2=A0 =C2=A0 =3D std::get&lt;0&gt;(p);<br>
+-=C2=A0 =C2=A0 int nDims=C2=A0 =C2=A0 =C2=A0=3D std::get&lt;1&gt;(p);<br>
+-=C2=A0 =C2=A0 int nClusters =3D std::get&lt;2&gt;(p);<br>
+-<br>
+-=C2=A0 =C2=A0 Mat points(nPts, nDims, CV_8U);<br>
+-=C2=A0 =C2=A0 Mat clusterCenters(nClusters, nDims, CV_32F);<br>
+-<br>
+-=C2=A0 =C2=A0 Mat trueMeans(nClusters, nDims, CV_32F);<br>
+-=C2=A0 =C2=A0 Mat stddevs(nClusters, nDims, CV_32F);<br>
+-=C2=A0 =C2=A0 std::vector&lt;int&gt; trueClusterSizes(nClusters, 0);<br>
+-=C2=A0 =C2=A0 std::vector&lt;int&gt; trueClusterBindings(nPts, 0);<br>
+-=C2=A0 =C2=A0 std::vector&lt;float&gt; trueSumDists(nClusters, 0);<br>
+-<br>
+-=C2=A0 =C2=A0 cv::RNG&amp; rng =3D cv::theRNG();<br>
+-=C2=A0 =C2=A0 for (int i =3D 0; i &lt; nClusters; i++)<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat mean(1, nDims, CV_64F), stdev(1, nDims, C=
V_64F);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rng.fill(mean,=C2=A0 cv::RNG::UNIFORM, 0, 256=
);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 rng.fill(stdev, cv::RNG::UNIFORM, 5.f, 16);<b=
r>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int lo =3D=C2=A0 =C2=A0 i=C2=A0 =C2=A0 * nPts=
 / nClusters;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 int hi =3D (i + 1) * nPts / nClusters;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int d =3D 0; d &lt; nDims; d++)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rng.fill(points.col(d).rowRange=
(lo, hi), cv::RNG::NORMAL,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<a href=3D"http://mean.at" rel=3D"noreferrer" target=3D"_blank">mean.at<=
/a>&lt;double&gt;(d), <a href=3D"http://stdev.at" rel=3D"noreferrer" target=
=3D"_blank">stdev.at</a>&lt;double&gt;(d));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 float sd =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int j =3D lo; j &lt; hi; j++)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat pts64f;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 points.row(j).convertTo(pts64f,=
 CV_64F);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd +=3D cv::norm(mean, pts64f, =
NORM_L2);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trueClusterBindings.at(j) =3D i=
;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trueClusterSizes.at(i)++;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 trueSumDists.at(i) =3D sd;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 // let&#39;s shift initial cluster center a b=
it<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat(mean + stdev * 0.5).copyTo(clusterCenters=
.row(i));<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 mean.copyTo(trueMeans.row(i));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stdev.copyTo(stddevs.row(i));<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 Mat newClusterCenters;<br>
+-=C2=A0 =C2=A0 std::vector&lt;int&gt; clusterSizes, clusterBindings;<br>
+-=C2=A0 =C2=A0 std::vector&lt;float&gt; clusterSumDists;<br>
+-=C2=A0 =C2=A0 cv::fastcv::clusterEuclidean(points, clusterCenters, newClu=
sterCenters, clusterSizes, clusterBindings, clusterSumDists);<br>
+-<br>
+-=C2=A0 =C2=A0 if (cvtest::debugLevel &gt; 0 &amp;&amp; nDims =3D=3D 2)<br=
>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat draw(256, 256, CV_8UC3, Scalar(0));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; nPts; i++)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int x =3D std::rint(<a href=3D"=
http://points.at" rel=3D"noreferrer" target=3D"_blank">points.at</a>&lt;uch=
ar&gt;(i, 0));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int y =3D std::rint(<a href=3D"=
http://points.at" rel=3D"noreferrer" target=3D"_blank">points.at</a>&lt;uch=
ar&gt;(i, 1));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://draw.at" rel=
=3D"noreferrer" target=3D"_blank">draw.at</a>&lt;Vec3b&gt;(y, x) =3D Vec3b:=
:all(128);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; nClusters; i++)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float cx =3D trueMeans.at&lt;do=
uble&gt;(i, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float cy =3D trueMeans.at&lt;do=
uble&gt;(i, 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://draw.at" rel=
=3D"noreferrer" target=3D"_blank">draw.at</a>&lt;Vec3b&gt;(cy, cx) =3D Vec3=
b(0, 255, 0);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float sx =3D <a href=3D"http://=
stddevs.at" rel=3D"noreferrer" target=3D"_blank">stddevs.at</a>&lt;double&g=
t;(i, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float sy =3D <a href=3D"http://=
stddevs.at" rel=3D"noreferrer" target=3D"_blank">stddevs.at</a>&lt;double&g=
t;(i, 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cv::ellipse(draw, Point(cx, cy)=
, Size(sx, sy), 0, 0, 360, Scalar(255, 0, 0));<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float ox =3D clusterCenters.at&=
lt;float&gt;(i, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float oy =3D clusterCenters.at&=
lt;float&gt;(i, 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://draw.at" rel=
=3D"noreferrer" target=3D"_blank">draw.at</a>&lt;Vec3b&gt;(oy, ox) =3D Vec3=
b(0, 0, 255);<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float nx =3D newClusterCenters.=
at&lt;float&gt;(i, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 float ny =3D newClusterCenters.=
at&lt;float&gt;(i, 1);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://draw.at" rel=
=3D"noreferrer" target=3D"_blank">draw.at</a>&lt;Vec3b&gt;(ny, nx) =3D Vec3=
b(255, 255, 0);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cv::imwrite(cv::format(&quot;draw_%d_%d_%d.pn=
g&quot;, nPts, nDims, nClusters), draw);<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 std::vector&lt;double&gt; diffs;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; nClusters; i++)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 double cs =3D std::abs((trueClu=
sterSizes[i] - clusterSizes[i]) / double(trueClusterSizes[i]));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 diffs.push_back(cs);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 double normL2=C2=A0 =3D cv::norm(diffs, NORM_=
L2) / nClusters;<br>
+-<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_LT(normL2, 0.392);<br>
+-=C2=A0 =C2=A0 }<br>
+-<br>
+-=C2=A0 =C2=A0 {<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat bindings8u, trueBindings8u;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat(clusterBindings).convertTo(bindings8u, CV=
_8U);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 Mat(trueClusterBindings).convertTo(trueBindin=
gs8u, CV_8U);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 double normH =3D cv::norm(bindings8u, trueBin=
dings8u, NORM_HAMMING) / nPts;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 EXPECT_LT(normH, 0.658);<br>
+-=C2=A0 =C2=A0 }<br>
+-}<br>
+-<br>
+-INSTANTIATE_TEST_CASE_P(FastCV_Extension, ClusterEuclideanTest,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ::testing::Combine(::testing::Values(100, 1000, 10000), // nPts<=
br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0::testing::Values(2, 10, 32),=C2=A0 =C2=A0 =C2=A0 =C2=A0 // nDims<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0::testing::Values(5, 10, 16)));=C2=A0 =C2=A0 =C2=A0 // nClusters<br>
+-<br>
+-}} // namespaces opencv_test, ::<br>
+\ No newline at end of file<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.11.0=
.bb" rel=3D"noreferrer" target=3D"_blank">opencv_4.11.0.bb</a> b/meta-oe/re=
cipes-support/opencv/<a href=3D"http://opencv_4.11.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">opencv_4.11.0.bb</a><br>
index 1613b6a3ed..0587599253 100644<br>
--- a/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.11.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.11.0.bb</a><br>
+++ b/meta-oe/recipes-support/opencv/<a href=3D"http://opencv_4.11.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opencv_4.11.0.bb</a><br>
@@ -16,27 +16,35 @@ SRCREV_boostdesc =3D &quot;34e4206aef44d50e6bbcd0ab0635=
4b52e7466d26&quot;<br>
=C2=A0SRCREV_vgg =3D &quot;fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d&quot;<b=
r>
=C2=A0SRCREV_face =3D &quot;8afa57abc8229d611c4937165d20e2a2d9fc5a12&quot;<=
br>
=C2=A0SRCREV_wechat-qrcode =3D &quot;a8b69ccc738421293254aec5ddb38bd5235032=
52&quot;<br>
+SRCREV_fastcv =3D &quot;f4413cc2ab7233fdfc383a4cded402c072677fb0&quot;<br>
<br>
<br>
-SRCREV_FORMAT =3D &quot;opencv_contrib_ipp_boostdesc_vgg&quot;<br>
+SRCREV_FORMAT =3D &quot;opencv_contrib_ipp_boostdesc_vgg_fastcv&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencv/opencv.gi=
t;name=3Dopencv;branch=3D4.x;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/opencv/opencv.git;name=3Dopencv;branch=3D4.x;protocol=
=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/opencv/opencv_contrib.git;destsuffix=3Dgit/contrib;name=3Dcontrib;branch=
=3D4.x;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com/op=
encv/opencv_contrib.git;destsuffix=3Dgit/contrib;name=3Dcontrib;branch=3D4.=
x;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_boostdesc_2016101=
2;destsuffix=3Dgit/boostdesc;name=3Dboostdesc;protocol=3Dhttps" rel=3D"nore=
ferrer" target=3D"_blank">github.com/opencv/opencv_3rdparty.git;branch=3Dco=
ntrib_xfeatures2d_boostdesc_20161012;destsuffix=3Dgit/boostdesc;name=3Dboos=
tdesc;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_vgg_20160317;dest=
suffix=3Dgit/vgg;name=3Dvgg;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_xfeatures2d_=
vgg_20160317;destsuffix=3Dgit/vgg;name=3Dvgg;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/opencv/opencv_3rdparty.git;branch=3Dcontrib_face_alignment_20170818;dests=
uffix=3Dgit/face;name=3Dface;protocol=3Dhttps" rel=3D"noreferrer" target=3D=
"_blank">github.com/opencv/opencv_3rdparty.git;branch=3Dcontrib_face_alignm=
ent_20170818;destsuffix=3Dgit/face;name=3Dface;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://github.co=
m/WeChatCV/opencv_3rdparty.git;branch=3Dwechat_qrcode;destsuffix=3Dgit/wech=
at_qrcode;name=3Dwechat-qrcode;protocol=3Dhttps" rel=3D"noreferrer" target=
=3D"_blank">github.com/WeChatCV/opencv_3rdparty.git;branch=3Dwechat_qrcode;=
destsuffix=3Dgit/wechat_qrcode;name=3Dwechat-qrcode;protocol=3Dhttps</a> \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250212;destsuffix=3Dgit/=
fastcv;name=3Dfastcv;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank"=
>github.com/opencv/opencv_3rdparty.git;branch=3Dfastcv/4.x_20250212;destsuf=
fix=3Dgit/fastcv;name=3Dfastcv;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-To-fix-errors-as-foll=
owing.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Temporarliy-work-arou=
nd-deprecated-ffmpeg-RAW-functi.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Dont-use-isystem.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://download.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Make-ts-module-extern=
al.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-Do-not-embed-build-di=
rectory-in-binaries.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-core-fixed-VSX-intrin=
sics-implementation.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI:append:riscv64 =3D &quot; file://0001-Use-Os-to-compile-tinyx=
ml2.cpp.patch;patchdir=3Dcontrib&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
+# Disabling cluster ecludian tests in fastcv EXTN as it causes fastcv EXTN=
 tests to be crashed.<br>
+# Adding support for fastcv static lib as per Upstream OpenCV.<br>
+# These are temporary patches, will be removed in next release.<br>
+<br>
+SRC_URI +=3D &quot;file://0001-PENDING-Removed-cluster-euclidean-in-fastcv=
-ext.patch;patchdir=3D${S}/contrib/ \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-FROMLIST-Using-fastc=
v-static-lib-for-compilation.patch&quot;<br></blockquote><div><br>Please mo=
ve all the patches to above general SRC_URI and add the explanation=C2=A0to=
 the main commit message<br>or the patch itself.<br><br>Jose<br><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0# OpenCV wants to download more files during configure.=C2=A0 We down=
load these in<br>
=C2=A0# do_fetch and construct a source cache in the format it expects<br>
=C2=A0OPENCV_DLDIR =3D &quot;${WORKDIR}/downloads&quot;<br>
@@ -61,6 +69,7 @@ do_unpack_extra() {<br>
=C2=A0 =C2=A0 =C2=A0cache data ${S}/face/*.dat<br>
=C2=A0 =C2=A0 =C2=A0cache wechat_qrcode ${S}/wechat_qrcode/*.caffemodel<br>
=C2=A0 =C2=A0 =C2=A0cache wechat_qrcode ${S}/wechat_qrcode/*.prototxt<br>
+=C2=A0 =C2=A0 cache fastcv ${S}/fastcv/fastcv/*.tgz<br>
=C2=A0}<br>
=C2=A0addtask unpack_extra after do_unpack before do_patch<br>
<br>
@@ -71,7 +80,6 @@ EXTRA_OECMAKE =3D &quot;-DOPENCV_EXTRA_MODULES_PATH=3D${S=
}/contrib/modules \<br>
=C2=A0 =C2=A0 =C2=A0-DENABLE_PRECOMPILED_HEADERS=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DCMAKE_SKIP_RPATH=3DON \<br>
=C2=A0 =C2=A0 =C2=A0-DWITH_IPP=3DOFF \<br>
-=C2=A0 =C2=A0 -DWITH_FASTCV=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0-DOPENCV_GENERATE_PKGCONFIG=3DON \<br>
=C2=A0 =C2=A0 =C2=A0-DOPENCV_DOWNLOAD_PATH=3D${OPENCV_DLDIR} \<br>
=C2=A0 =C2=A0 =C2=A0-DOPENCV_ALLOW_DOWNLOADS=3DOFF \<br>
@@ -122,6 +130,7 @@ PACKAGECONFIG[tests] =3D &quot;-DBUILD_TESTS=3DON,-DBUI=
LD_TESTS=3DOFF,,&quot;<br>
=C2=A0PACKAGECONFIG[text] =3D &quot;-DBUILD_opencv_text=3DON,-DBUILD_opencv=
_text=3DOFF,tesseract,&quot;<br>
=C2=A0PACKAGECONFIG[tiff] =3D &quot;-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff=
,&quot;<br>
=C2=A0PACKAGECONFIG[v4l] =3D &quot;-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-uti=
ls,&quot;<br>
+PACKAGECONFIG[fastcv] =3D &quot;-DWITH_FASTCV=3DON ,-DWITH_FASTCV=3DOFF,,&=
quot;<br>
<br>
=C2=A0inherit pkgconfig cmake setuptools3-base python3native<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#116291): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/116291" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/116291</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111913662/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111913662/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div></div>

--000000000000e225a606313cbb93--

