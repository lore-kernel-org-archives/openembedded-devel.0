Return-Path: <quic_ptak@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9375C0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 07:07:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.14124.1738307229021388482
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jan 2025 23:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=cMH6mYmS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: ptak@qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1cpA011684
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 07:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6tgCUfUiqxiGlhE0x/nqlT3cgpY8FrhvvCw
	7v6xakek=; b=cMH6mYmSq/xt3G1UMLByt5QK0BtkXKN/wyiavN0U4AyQxsVcrjY
	ZCwXNl8pFjfme82YsUrka4zoDmcz/ILFsVIqvqqQpv1gk5BPni6VBW4hBPp4XUSK
	45TXbGtD1M0sV0uAQAX1MOpnf39iVRNXG+jM0FKweoIyE2pD+BF0ei5VnC+kx7s2
	rhtwJj5yW+HNeLvGQ8vWmnBy693GwXFUCAksGxtkXlGZq1yycEWgEzxKIl4aBDqd
	1DHio7Z314V+l1g1Ch30XYRahtAGw42JC6kEQIENwWzri73vovyTVq6zRaL8SePh
	WmxrBFMYT2yOYgDR15jLMDtdWQGtqJpbVSA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7k14uk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 07:07:08 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50V775NA009147
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 07:07:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44d9ffgcf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 07:07:05 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50V774hK009141
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 07:07:04 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ptak-hyd.qualcomm.com [10.213.96.58])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 50V774WT009140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 07:07:04 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2387883)
	id F0C3C5C7; Fri, 31 Jan 2025 12:37:03 +0530 (+0530)
From: Pulkit Singh Tak <quic_ptak@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: quic_sssanjee@quicinc.com, quic_ptak@quicinc.com,
        quic_vkaruchu@quicinc.com
Subject: [meta-oe][PATCH] opencv: upgrade 4.10.0 -> 4.11.0
Date: Fri, 31 Jan 2025 12:36:56 +0530
Message-Id: <20250131070656.1000591-1-quic_ptak@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ausNOxtV6wisCiu8ISg6lM-7medza-B2
X-Proofpoint-GUID: ausNOxtV6wisCiu8ISg6lM-7medza-B2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_02,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=731 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jan 2025 07:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115189

Disable FASTCV HAL implementation

Signed-off-by: Pulkit Singh Tak <quic_ptak@quicinc.com>
---
 .../opencv/{opencv_4.10.0.bb => opencv_4.11.0.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv_4.10.0.bb => opencv_4.11.0.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.10.0.bb b/meta-oe/recipes-support/opencv/opencv_4.11.0.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.10.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.11.0.bb
index 5e54ab636f..90f5faf28a 100644
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
@@ -70,6 +70,7 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${S}/contrib/modules \
     -DENABLE_PRECOMPILED_HEADERS=OFF \
     -DCMAKE_SKIP_RPATH=ON \
     -DWITH_IPP=OFF \
+    -DWITH_FASTCV=OFF \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
     -DOPENCV_DOWNLOAD_PATH=${OPENCV_DLDIR} \
     -DOPENCV_ALLOW_DOWNLOADS=OFF \
-- 
2.34.1


