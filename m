Return-Path: <quic_ptak@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62424C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 07:54:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.45945.1739174049931709536
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Feb 2025 23:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=IxRWJNg6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: ptak@qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 519HuxTe024634
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 07:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hjJiLdj0DDhicOoKod+1El0qLSfehOBRV00
	8/BD+vms=; b=IxRWJNg6sNXNzZAvxshlQqLzUOEU2HvTDNQ/otdxyuR6LcDdA8A
	cCpfMV13cr9YQdWhRxNHzK6K2kb9IamqeBuNJ7y4HXWx5Z5/xH1VDnxQ7gcQadRT
	dt04THAzYQW4Q0XvopDHdi2maLiLeQLrDiRu+4eTLKppXNifz+VKxFCA+3oGxItc
	YU+rI4vlNPpUyEEKp9x0jgNl9/CJFvtO4+OIscZIkuzl1odixjCeh2gSYH6UBqTJ
	jnvB/G/8Wb8PVtiKM8CKjg7+iIETA2AGNDiV55cnIsp5GljtcvYFo9tYpJsKsOT+
	ycujgwgjNcxX/rlne4OsdLb+gxy10xf8yLw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0e1kg5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 07:54:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51A7s4W9030402
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 07:54:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bkn2cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 07:54:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51A7s43j030397
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 07:54:04 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ptak-hyd.qualcomm.com [10.213.96.58])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 51A7s4lx030394
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 07:54:04 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2387883)
	id CBC525C8; Mon, 10 Feb 2025 13:24:03 +0530 (+0530)
From: Pulkit Singh Tak <quic_ptak@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: quic_sssanjee@quicinc.com, quic_vkaruchu@quicinc.com,
        quic_ptak@quicinc.com
Subject: [meta-oe][PATCH] Disable FASTCV HAL implementation
Date: Mon, 10 Feb 2025 13:23:52 +0530
Message-Id: <20250210075352.3942800-1-quic_ptak@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hWPpfTM-7wRMWY5K3IvtfGIHFPFr6y4f
X-Proofpoint-GUID: hWPpfTM-7wRMWY5K3IvtfGIHFPFr6y4f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=860 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 07:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115327

Adding FastCV in packageconfig option
Fastcv based Opencv HAL/Extensions are not supported on all platforms.
By default Upstream OpenCV expects it to be disabled.

Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
---
 meta-oe/recipes-support/opencv/opencv_4.11.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 07b3a9d9e6..97dccfe2fb 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
@@ -70,7 +70,6 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     -DENABLE_PRECOMPILED_HEADERS=OFF \
     -DCMAKE_SKIP_RPATH=ON \
     -DWITH_IPP=OFF \
-    -DWITH_FASTCV=OFF \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     -DOPENCV_ALLOW_DOWNLOADS=OFF \
@@ -121,6 +120,8 @@ PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON,-DBUILD_TESTS=OFF,,"
 PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
+#Fastcv based Opencv HAL/Extensions are not supported on all platforms, hence disabling it by default
+PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON,-DWITH_FASTCV=OFF,,"
 
 inherit pkgconfig cmake setuptools3-base python3native
 
-- 
2.34.1


