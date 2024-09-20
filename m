Return-Path: <quic_ptak@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B810CF58C6
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 04:00:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.10335.1726804853299271936
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Sep 2024 21:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=gpiTM0B9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: ptak@qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JJ3v0S011589
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 04:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ThXzMHFD7ZlWEESXMIFv5AQDSSpNelbweCk
	5PuMZ4ms=; b=gpiTM0B9rhgxvNooehGU2JCoSLnh3im2lIe37MFA0bL1SzLUNwQ
	BYIu5/hSHIuhkj4m6JYNxADVXvTTtl5CSCuQpyOZ1veTfjULqveVo+MRVH/ST1w3
	KiS+FJI+xmKXLkUW6eBuywXMfXFbKYuB9kAW6RGa6wUhy0oLQyLU3TzUMZpj0QFg
	kT6nHaURaYlc3CBtNAZHEYuNYfMGRtoqyttdLvbkOeV7lmQCKXS0fnVW/CbxuiJy
	pRcJHCDyu/WGJ4lcdXCSEHY39gQzyokdX2X50CrJglfIIo291q9T4tz4G2nJyh7j
	WH2JJEDw0DLkm9WLP4a10oQe7/b8yvAG09g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gd7h11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 04:00:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48K3xsSm014154
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 04:00:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41n3jmptt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 04:00:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48K40lMv015205
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 04:00:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ptak-hyd.qualcomm.com [10.213.96.58])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48K40lbb015204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 04:00:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2387883)
	id BC57058A; Fri, 20 Sep 2024 09:30:46 +0530 (+0530)
From: ptak <quic_ptak@quicinc.com>
To: openembedded-devel@lists.openembedded.org
Cc: quic_sssanjee@quicinc.com, quic_vkaruchu@quicinc.com,
        ptak <quic_ptak@quicinc.com>
Subject: [meta-oe][PATCH] opencv: upgrade 4.9.0 -> 4.10.0
Date: Fri, 20 Sep 2024 09:30:41 +0530
Message-Id: <20240920040041.1153435-1-quic_ptak@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rr4KYEkN5FG3Y-HFlXQcWr4rJEMTuM0e
X-Proofpoint-GUID: rr4KYEkN5FG3Y-HFlXQcWr4rJEMTuM0e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=784 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409200026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 04:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112391

---
 .../opencv/{opencv_4.9.0.bb => opencv_4.10.0.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opencv/{opencv_4.9.0.bb => opencv_4.10.0.bb} (98%)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
similarity index 98%
rename from meta-oe/recipes-support/opencv/opencv_4.9.0.bb
rename to meta-oe/recipes-support/opencv/opencv_4.10.0.bb
index 1a873ddef..07bdb37b7 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.9.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.10.0.bb
@@ -10,8 +10,8 @@ ARM_INSTRUCTION_SET:armv5 = "arm"
 
 DEPENDS = "libtool swig-native bzip2 zlib glib-2.0 libwebp"
 
-SRCREV_opencv = "dad8af6b17f8e60d7b95a1203a1b4d22f56574cf"
-SRCREV_contrib = "c7602a8f74205e44389bd6a4e8d727d32e7e27b4"
+SRCREV_opencv = "a7d942b681c5edd0cc27407d8e4d3dbf36c7a40e"
+SRCREV_contrib = "1aab1f34815a58a5a63aee6d510fe234129754a2"
 SRCREV_boostdesc = "34e4206aef44d50e6bbcd0ab06354b52e7466d26"
 SRCREV_vgg = "fccf7cd6a4b12079f73bbfb21745f9babcd4eb1d"
 SRCREV_face = "8afa57abc8229d611c4937165d20e2a2d9fc5a12"
-- 
2.34.1


