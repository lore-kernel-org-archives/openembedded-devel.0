Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DBB2C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 19:47:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53790.1670874450878385002
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Dec 2022 11:47:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=c6wxEmUV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9345bae85a=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BCEwcU1022270
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 11:47:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=AOEVya9wzuATMB5kMnyxtnQBkbuEn+RGY6MO5CZG7BU=;
 b=c6wxEmUV1b5+gqz/eAK74WT1MZRIInT6cddxScMzCx9LEOK5vAKWFb/A5jLJZvDkV/S3
 i0mB/nFvxPiGj+049YtINd+WH5hJ/JcWwLN7SduJ4ZIvH/EM6cP07QAz/COggQ0u7Yvb
 5zP5ujGEPVS88UJ6DDT3X4qRb7SNiOgjofrOk4cVtN/zo90Z2ej0UNei1Bl9ANbLaiZc
 Ciay5dOjx66gKMSlJFp1FGYd+210HDmnRArkYqdb2evVYve6urD2uH3DF1FXH9NSSXYU
 ihjmhU+cT2b5+UK0JSRUWCNEuJY3t1Bk9/yzx9VCpRJMCURKwOybqO97P8DodFdwkyJB OQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mcp95sp48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 11:47:30 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 12 Dec 2022 11:47:29 -0800
Received: from localhost.localdomain (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Mon, 12 Dec 2022 11:47:29 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] minio: fix license information
Date: Mon, 12 Dec 2022 14:47:28 -0500
Message-ID: <20221212194728.45878-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9X2ZkotQcEmqxO4iGHT4_5VxyOYWdmsT
X-Proofpoint-ORIG-GUID: 9X2ZkotQcEmqxO4iGHT4_5VxyOYWdmsT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=803 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212120177
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 19:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100065

minio carries AGPL license, not GPL.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta-oe/recipes-extended/minio/minio_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/minio/minio_git.bb b/meta-oe/recipes-extended/minio/minio_git.bb
index 63451e883..94986089c 100644
--- a/meta-oe/recipes-extended/minio/minio_git.bb
+++ b/meta-oe/recipes-extended/minio/minio_git.bb
@@ -16,7 +16,7 @@ SRCREV_mc = "01b87ecc02ffad47dfe13c2154ac31db3e3115df"
 
 GO_IMPORT = "import"
 
-LICENSE = "GPL-3.0-only"
+LICENSE = "AGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=eb1e647870add0502f8f010b19de32af"
 
 PV = "${SRCREV_mc}"
-- 
2.25.1


