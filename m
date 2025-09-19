Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F1ACAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 11:05:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13455.1758279915221029465
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 04:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NyaPabk9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1357520fdd=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58J5070C1093104
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 11:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=6n9s6QDrVH3+j3QsnnR0
	obKBChyxTJsRSLi6swBy//g=; b=NyaPabk9OBC5pY8H1BYFvDy0Qh9avz31vAR+
	7/Cba3kfG92Izdxr6KScEdtmPdsncsH8UCbcEVCc9sxU4xfrUfvOfsKmTRI2wEnY
	Ca0TPugyaVMWXF0VGIaevIqnDEL3xrzKBUbo2nsukwzUzuXJ4WiNiF364oi8RcuM
	vOR41arDDHEr2DwvnZ3vW+XexhGScFPrTvVlz1EqO4M/QrvLZeJY14EIhrXK0yrT
	4fne6/NgKSzT0b/T2VsXzRCeFipQ0qFJNjOyJBWjJ2Pl2TwD3is0NbCVXMu8xBzD
	CW6q62QdUspiW23JLz7ihysEwIDDN1iPexXu9QyGvehRqWvYnA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vmrge6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 11:05:14 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 19 Sep 2025 04:05:12 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 19 Sep 2025 04:05:11 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-webserver][scarthgap][PATCH 1/1] apache2: upgrade 2.4.64 - 2.4.65
Date: Fri, 19 Sep 2025 16:34:55 +0530
Message-ID: <20250919110455.2668572-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=ZP7XmW7b c=1 sm=1 tr=0 ts=68cd38ea cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=HXCqcy9q75gA:10 a=yJojWOMRYYMA:10 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8
 a=gYbeoWoqnpLa2EFPWsIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDEwMiBTYWx0ZWRfXxsed5GDLEM4c
 fCxpXLzms8p7cmjPguZSMGOQIQM5KNmVnQkRZXO43KgsQCbrRjSgCfrkkmiGMQAaALhgzQ4n5GN
 VQ7stHAZdSSKEgYg4YSzRxqNbN8X+RIIiA7Vp68EC3TEM8H8Nb9/lGu5fCFKIZFN9d/++VjebmY
 zVEMjWR0R+Bso1DRiV3AV3nP/qxfCrcBkRLDDoDtrJhY0M6rCCfGFdtRKLlfI7XvoDxahP7vAJG
 GpX0s/DcA1LZoKA7PjEtxBQQB9jxen8tNdC7z85ySGHtmNazW8GVgZ6TfWJ9b6cy+r5MxAkoS4+
 V85Gy9ldaUR5IaVzcZEc5mNkPoWLvfKfjjHmyzezDY3+026oJWvM1SHkZ9SlLo=
X-Proofpoint-GUID: UEipz32PwjaOEXroIDp4hjBKZsbCmZqw
X-Proofpoint-ORIG-GUID: UEipz32PwjaOEXroIDp4hjBKZsbCmZqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1011 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 11:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119592

From: Archana Polampalli <archana.polampalli@windriver.com>

fixes CVE-2025-54090

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.65

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.64.bb => apache2_2.4.65.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index f587935b8f..34526fc78e 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29"
+SRC_URI[sha256sum] = "58b8be97d9940ec17f7656c0c6b9f41b618aac468b894b534148e3296c53b8b3"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.40.0


