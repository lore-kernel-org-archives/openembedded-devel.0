Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88193C46CD4
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 08:23:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.76810.1703578997773537907
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Dec 2023 00:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R/N7x1Ay;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=07249f857e=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BQ8B4rO004307
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 00:23:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ucg4w
	gkzj8PycPphPCW6xgsj816GFsLQAcx+wjVXk8Q=; b=R/N7x1AyBRCJd9ty1VSQ7
	f+njXKW6V20xbPE8RuLnQUqJgT/6BH0Ht6APBHMM7OmNBZy0AHKXDXjIJVMEh0cK
	BDgAKHLTBY2PpwAkwUMHvYAqz0MzpTbLS3A7xhDuFq1clmn+lztZ7g4E+ogFppD7
	YPjaFB6H7Voc38dzsDlXAWAV+02rVwFwYOzw9sUp7AL5mRui6GBaL5KmBzVLq17e
	K4Rn4l8jWEtFDOZC3Y/u4XTnBDV1OTQdTfYkp6efFL8Ry7woDGS6XBCGV6o/ORkJ
	++SMTiIr4ChAFju66oGEIAsqHxZt2mUuZ3ounC77ev8N1QIpVBwEcAI6j6Ji1oZd
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3v5yxm1v8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 00:23:17 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 26 Dec 2023 00:23:19 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] cjson: upgrade 1.7.15 -> 1.7.17
Date: Tue, 26 Dec 2023 08:23:03 +0000
Message-ID: <20231226082303.919189-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: eHpjjPK5sMDgkdjMxKDozVblpTYmtTeY
X-Proofpoint-ORIG-GUID: eHpjjPK5sMDgkdjMxKDozVblpTYmtTeY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=909
 priorityscore=1501 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312260061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 08:23:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107804

From: Archana Polampalli <archana.polampalli@windriver.com>

The following CVEs are addressed in this release.
CVE-2023-50471
CVE-2023-50472

https://github.com/DaveGamble/cJSON/releases/tag/v1.7.17

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../recipes-devtools/cjson/{cjson_1.7.15.bb => cjson_1.7.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cjson/{cjson_1.7.15.bb => cjson_1.7.17.bb} (91%)

diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
similarity index 91%
rename from meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
rename to meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
index 200f75166..c9c38a9fe 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.15.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https"
-SRCREV = "d348621ca93571343a56862df7de4ff3bc9b5667"
+SRCREV = "87d8f0961a01bf09bef98ff89bae9fdec42181ee"
 
 S = "${WORKDIR}/git"
 
-- 
2.40.0


