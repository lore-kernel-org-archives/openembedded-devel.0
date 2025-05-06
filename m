Return-Path: <quic_ptak@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8B2C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 07:04:03 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.70443.1746515031903172707
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 00:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=VPlNjJA7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: ptak@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTaGj007918
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 May 2025 07:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ZiLoHu0dgsKNpnbxdzzl2hIr8F2uonohA5Y
	KltV48zQ=; b=VPlNjJA7t5fWKEAf//u84OZX3IZy5p79kyJBtbJbx64Hkct4elD
	R3m/7J1qOpXGlSOlZvLn24n+txlO56cf6LJJSqznAP1YQ3jo1+jR39ERmKmkCTW1
	+XSm2vL5L9q8e+KSCv2345few58V42G5VRT0ZojttBO1m9OZn/IGHbrQ6opCG0Y1
	YMJRaVXNw2QdNXq4c/4BIps9ykwA6q7Qt7Ng2+GH+TTSg1Ur8RGbvbfgvfD4GmWN
	WTwRG+LnSUnDBVGHfV73Q8FFiMfIlwq0RVZqYFIg4iAPKX45B9s7n9rsL5x2X0CF
	x7Vqn94aMqZPIuJz7RhAEM/XIkM4FrwETEQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9ep6rx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 07:03:50 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54673l8H000730
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 May 2025 07:03:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7kukg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 07:03:47 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54673lJe000724
	for <openembedded-devel@lists.openembedded.org>; Tue, 6 May 2025 07:03:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ptak-hyd.qualcomm.com [10.213.96.58])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 54673lhd000723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 07:03:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2387883)
	id 7318611A4; Tue,  6 May 2025 12:33:46 +0530 (+0530)
From: Pulkit Singh Tak <quic_ptak@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: quic_ptak@quicinc.com, quic_sssanjee@quicinc.com,
        quic_vkaruchu@quicinc.com
Subject: [meta-oe][PATCH V2] opencv: Added fix for Cluster Euclidean and Box Filter
Date: Tue,  6 May 2025 12:33:41 +0530
Message-Id: <20250506070341.161200-1-quic_ptak@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=6819b456 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=COk6AnOGAAAA:8 a=LxRQ0vB3orv3utY-us0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sGDqGR3Auk0fFPb6UmZ2LY53OwtXDt_L
X-Proofpoint-GUID: sGDqGR3Auk0fFPb6UmZ2LY53OwtXDt_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA2NiBTYWx0ZWRfX5qa/Nxio5Iju
 Kmd88R4G6XoQZ9LrpEnocoEAJFAyU+EB/+pkLSeDLsGp8WQT69NmCsBXC+9Yyjlas2fflUTfhNB
 E+mR/QL23+N7fBz3M6Pwjb8S+LKXMYozL5p7VwH32jsuQt251e1qpORzP37ptEtmuDUP9uHXKnv
 har+s0E4uDphUmz7NZWE/XQGVwho2BUWAP2U5bnH7Mk5wEpQD3ZdJt8qa3yJqQJUmuaMxovAnLR
 3ulCqF/lyMpx1VIY2Zs0NNq8P1rDBuu5akD2Fh8wSVb19iKor0BsKnUuceJXKFEQ/19AT73nvov
 DZsjEhaqIgLp/ahXPN8OKDIYX2Bn8YhQZCfh1kYO83fHS3S37aTnaUK0RNs15bKfy581OTVzkgX
 Kps3Kx8r5hC+09gtezx2NVK60RTsu6pIYYvkadDL/XaTz9LeCMeNqshkEs4DngRrESXMlR3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 07:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117340

Updated FastCV libs hash to include fix for Cluster Euclidean and Box Filter
and support for FastCV SVD API

Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
---
 ...MLIST-FastCV-latest-libs-hash-update.patch | 50 +++++++++++++++++++
 .../recipes-support/opencv/opencv_4.11.0.bb   |  5 +-
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-latest-libs-hash-update.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-latest-libs-hash-update.patch b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-latest-libs-hash-update.patch
new file mode 100644
index 0000000000..b35335c35e
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/0001-FROMLIST-FastCV-latest-libs-hash-update.patch
@@ -0,0 +1,50 @@
+From ba6eb8d95292f4631a3b8de09bfaa59e43c17226 Mon Sep 17 00:00:00 2001
+From: adsha-quic <quic_adsha@quicinc.com>
+Date: Wed, 16 Apr 2025 18:54:40 +0530
+Subject: [PATCH] FROMLIST: Merge pull request #27214 from CodeLinaro:fastcv_lib_hash_update
+
+Signed-off-by: Alexander Smorkalov <alexander.smorkalov@opencv.ai>
+Upstream-Status: Submitted [https://github.com/opencv/opencv/pull/27214]
+
+---
+ 3rdparty/fastcv/fastcv.cmake | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/3rdparty/fastcv/fastcv.cmake b/3rdparty/fastcv/fastcv.cmake
+index 5c81c11300..6fee4ce4ce 100644
+--- a/3rdparty/fastcv/fastcv.cmake
++++ b/3rdparty/fastcv/fastcv.cmake
+@@ -1,23 +1,23 @@
+ function(download_fastcv root_dir)
+ 
+   # Commit SHA in the opencv_3rdparty repo
+-  set(FASTCV_COMMIT "f4413cc2ab7233fdfc383a4cded402c072677fb0")
++  set(FASTCV_COMMIT "8d86e68dad8b80b8575a8d3cf401d3ee96c24148")
+ 
+   # Define actual FastCV versions
+   if(ANDROID)
+     if(AARCH64)
+       message(STATUS "Download FastCV for Android aarch64")
+-      set(FCV_PACKAGE_NAME  "fastcv_android_aarch64_2024_12_11.tgz")
+-      set(FCV_PACKAGE_HASH  "9dac41e86597305f846212dae31a4a88")
++      set(FCV_PACKAGE_NAME  "fastcv_android_aarch64_2025_04_08.tgz")
++      set(FCV_PACKAGE_HASH  "e028966a1d1b2f3f0bc5967d316e8b64")
+     else()
+       message(STATUS "Download FastCV for Android armv7")
+-      set(FCV_PACKAGE_NAME  "fastcv_android_arm32_2024_12_11.tgz")
+-      set(FCV_PACKAGE_HASH  "fe2d30334180b17e3031eee92aac43b6")
++      set(FCV_PACKAGE_NAME  "fastcv_android_arm32_2025_04_08.tgz")
++      set(FCV_PACKAGE_HASH  "6fc1e812a4b3ef392469d2283e037ffe")
+     endif()
+   elseif(UNIX AND NOT APPLE AND NOT IOS AND NOT XROS)
+     if(AARCH64)
+-      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2025_02_12.tgz")
+-      set(FCV_PACKAGE_HASH  "33ac2a59cf3e7d6402eee2e010de1202")
++      set(FCV_PACKAGE_NAME  "fastcv_linux_aarch64_2025_04_08.tgz")
++      set(FCV_PACKAGE_HASH  "062a26639cd2788beee2e0dd8743d680")
+     else()
+       message("FastCV: fastcv lib for 32-bit Linux is not supported for now!")
+     endif()
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 61dc681a39..8a5821e2f1 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -16,7 +16,7 @@ SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
 SRCREV_wechat-qrcode = "a8b69ccc738421293254aec5ddb38bd523503252"
-SRCREV_fastcv = "f4413cc2ab7233fdfc383a4cded402c072677fb0"
+SRCREV_fastcv = "8d86e68dad8b80b8575a8d3cf401d3ee96c24148"
 
 
 SRCREV_FORMAT = "opencv_contrib_ipp_boostdesc_vgg_fastcv"
@@ -26,7 +26,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_xfeatures2d_vgg_20160317;destsuffix=git/vgg;name=vgg;protocol=https \
            git://github.com/opencv/opencv_3rdparty.git;branch=contrib_face_alignment_20170818;destsuffix=git/face;name=face;protocol=https \
            git://github.com/WeChatCV/opencv_3rdparty.git;branch=wechat_qrcode;destsuffix=git/wechat_qrcode;name=wechat-qrcode;protocol=https \
-           git://github.com/opencv/opencv_3rdparty.git;branch=fastcv/4.x_20250212;destsuffix=git/fastcv;name=fastcv;protocol=https \
+           git://github.com/opencv/opencv_3rdparty.git;branch=fastcv/4.x_20250410;destsuffix=git/fastcv;name=fastcv;protocol=https  \
            file://0003-To-fix-errors-as-following.patch \
            file://0001-Temporarliy-work-around-deprecated-ffmpeg-RAW-functi.patch \
            file://0001-Dont-use-isystem.patch \
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv;branch=4.x;protocol=ht
            file://0008-Do-not-embed-build-directory-in-binaries.patch \
            file://0001-core-fixed-VSX-intrinsics-implementation.patch \
            file://0001-FROMLIST-Switch-to-static-instance-of-FastCV-on-Linux.patch \
+           file://0001-FROMLIST-FastCV-latest-libs-hash-update.patch \ \
            "
 SRC_URI:append:riscv64 = " file://0001-Use-Os-to-compile-tinyxml2.cpp.patch;patchdir=contrib"
 
-- 
2.34.1


