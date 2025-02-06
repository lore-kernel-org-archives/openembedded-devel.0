Return-Path: <quic_ptak@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6C2C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:19:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.47488.1738862387217221636
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 09:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=B56H86GA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: ptak@qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516A3hpJ017781
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Feb 2025 17:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FXFnta8tQNqBdAJk7L8u/M6k6cA1bavdz3a
	WtZuKBAk=; b=B56H86GA/A/KZBlS7+EbwINSumGuMQVFIS5ycutg1Slz2dpWBnO
	x1aQbr6c1PsH6bCFcVN7gZf20Y9gwf3YwOpR9e9B/KDUyl7Gb04jvIxLWTSTGYcl
	bdVR986UAag43cdkVWO8QPmi7dXXLrtVaFdN5T1FXugbW+jvC0E8pugS7T+j07UK
	QOJL2VhbtH4C81I9+hjbCi21TMTL85Dy4rcC9gPbMVzibA7V4zROq+J3vAQVDq/b
	zpaduAqS9ObULd9TZ5+4jUd16w/Lv/Zx+52TdqeiZ8Eij0BnuW15ePTiPNM7TZKO
	DORoJ39yEv98uip3PnGX7TY/ccZAXndZPQw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mu0ds374-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 17:19:46 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 516HJhnE004319
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Feb 2025 17:19:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44hcpmfmyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 17:19:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 516HJhn1004314
	for <openembedded-devel@lists.openembedded.org>; Thu, 6 Feb 2025 17:19:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ptak-hyd.qualcomm.com [10.213.96.58])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 516HJhcO004312
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 17:19:43 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2387883)
	id 706FE5C8; Thu,  6 Feb 2025 22:49:42 +0530 (+0530)
From: Pulkit Singh Tak <quic_ptak@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: quic_ptak@quicinc.com, quic_sssanjee@quicinc.com,
        quic_vkaruchu@quicinc.com
Subject: [meta-oe][PATCH V2] opencv: upgrade 4.10.0 -> 4.11.0
Date: Thu,  6 Feb 2025 22:49:33 +0530
Message-Id: <20250206171933.1319042-1-quic_ptak@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GRwT-IGjbi80MoEmL2v_h5STtmXnQ0I1
X-Proofpoint-ORIG-GUID: GRwT-IGjbi80MoEmL2v_h5STtmXnQ0I1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_05,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=912 phishscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060139
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 17:19:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115291

Disable FASTCV HAL implementation
Fastcv based Opencv HAL/Extensions are not supported on all platforms.
By default Upstream OpenCV expects it to be disabled.

Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
---
 .../opencv/{opencv_4.10.0.bb => opencv_4.11.0.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv_4.10.0.bb => opencv_4.11.0.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.10.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 5e54ab636f..6967f520e4 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "a7d942b681c5edd0cc27407d8e4d3dbf36c7a40e"
-SRCREV_contrib = "1aab1f34815a58a5a63aee6d510fe234129754a2"
+SRCREV_opencv = "31b0eeea0b44b370fd0712312df4214d4ae1b158"
+SRCREV_contrib = "0e5254ebf54d2aed6e7eaf6660bf3b797cf50a02"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
@@ -120,6 +120,7 @@ PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON,-DBUILD_TESTS=OFF,,"
 PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON,-DWITH_FASTCV=OFF,,"
 
 inherit pkgconfig cmake setuptools3-base python3native
 
-- 
2.34.1


