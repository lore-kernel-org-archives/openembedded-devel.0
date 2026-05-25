Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB1ECD5BC0
	for <webhook@archiver.kernel.org>; Mon, 25 May 2026 07:49:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11331.1779694865595626504
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 May 2026 00:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PhJLYlYv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9605107f15=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6SVSR1821915
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 07:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=FpRuisJbE/FTkMCpz6qZ
	/qnNxVpXabiVM3twZfS6kuo=; b=PhJLYlYvAe+rS5Uiz4cVeLQqjFT5aQzySWv6
	/clBAixf37h2EXyvcW/YUZaFs02lfetwyN2mbwu5wjFJXqqlYVTCZgnEx3ZbMD/Y
	udRk3MQckeg4IhqO5ySIm1ZuX4fAGmX9XMpTu9CLkzWaTJBozQb0lRQ/M5Osd/sq
	xOsalaM6D/srsEcAKQpqy3otrh9uNH124+Me2MlzM4D5ebcLIqju9QY9O958xjvf
	B4RB3gjq7JpDkiK9da7TzN0b9EMIPORWx/0wg4+gsjYbwjGyCcm4urRkgJviwU5+
	hPl4Q7L5LN+5IkUcuSMdZ89n+5rdSNUzODhwQ58M0zngB5b9yA==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb1f02gr7-11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 07:41:04 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 25 May 2026 00:41:03 -0700
Received: from pek-lpgtest26.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 25 May 2026 00:41:03 -0700
From: Shilong.Jiao@eng.windriver.com
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] lcms: add to ptest-packagelists-meta-oe
Date: Mon, 25 May 2026 15:41:02 +0800
Message-ID: <20260525074102.1938729-1-Shilong.Jiao@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: mSRQnu_lH-6TucTFm5Uu91-ur-ahf7SX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA3NiBTYWx0ZWRfX5WXsoOBU+e/x
 iKRz5f7GZorLRY1ZTOqBKJD7Bjd3G5pfvZlA3UsX+h6rYEV59/I/GNsavrzUNZe40zskeVAl7dr
 i9+IPihqGZ/GMAqXVpKnFJ+z0C/XSIs4kF9TgsD3YzsPR5bZVTpI2futfnoDcvO/Y93QDhcBK9H
 716w9zd7Z5Dyil+RmTXgDh1u++obwHE2EjnxX7dzv6BG66b9Chkp4iz9FTTLue0PaJph/+MSi7X
 dIU+K0JjgADNLHnz7Ju122ENkJkaHRIcJQvkK+0MnuZJqPFrErpCCy7bxCZ6TWleonquP5qrWoL
 ep+Chjim5tzqe3NB9YBS92m7glcH+cmLyWyWtLD+/pc3ZF/QYaol6e/zF5dbkhtyk+CWS1zV8o4
 LaHOvSuMtU/jUwbHZUPT3zHDwhXvraPxl3zOKgwyKAHA5dT+b5nJSc9srBuHrhieURaI6wqouQi
 PrpVPyZ7EYQeTKHSG4Q==
X-Proofpoint-GUID: mSRQnu_lH-6TucTFm5Uu91-ur-ahf7SX
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a13fd10 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=4WY5CYYNWET6DPtsIBMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250076
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 May 2026 07:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127198

From: Shilong Jiao <Shilong.Jiao@windriver.com>

Add lcms to PTESTS_FAST_META_OE list to enable it in ptest images.

This is a follow-up to the lcms ptest support patch.

Signed-off-by: Shilong Jiao <Shilong.Jiao@windriver.com>
---
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index a9cbaf6982..8432ebfbf2 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -26,6 +26,7 @@ PTESTS_FAST_META_OE = "\
     imagemagick \
     jemalloc \
     jq \
+    lcms \
     leveldb \
     libcereal \
     libdbi-perl \
-- 
2.34.1


