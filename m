Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D852E77188
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 03:21:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.122330.1734578487205721255
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Dec 2024 19:21:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20836d65da=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJ3EqAj006568
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Dec 2024 19:21:26 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h66853s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Dec 2024 19:21:26 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 18 Dec 2024 19:21:26 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 18 Dec 2024 19:21:25 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Changqing.Li@windriver.com>
Subject: [meta-oe][scarthgap][PATCH v2] xmlsec1: Switch SRC_URI to use github release
Date: Thu, 19 Dec 2024 11:21:23 +0800
Message-ID: <20241219032123.3576640-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yrvgD_VJ5zAMcjMtvs_4mirOebGkTYvx
X-Authority-Analysis: v=2.4 cv=K5XYHzWI c=1 sm=1 tr=0 ts=67639136 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=PjL9yVGjAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=A5q1kjMgKVMUW4fyQIcA:9 a=EO-MHUxLLT6bydkwyJ4X:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: yrvgD_VJ5zAMcjMtvs_4mirOebGkTYvx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_01,2024-12-18_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412190022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 03:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114377

From: Jiaying Song <jiaying.song.cn@windriver.com>

This ensures that we do not have to do the toggling from releases to old-release in LTS release branches

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
index 7639209e1..c65350672 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 
 SECTION = "libs"
 
-SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
+SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PV}/${BP}.tar.gz \
            file://fix-ltmain.sh.patch \
            file://change-finding-path-of-nss.patch \
            file://makefile-ptest.patch \
-- 
2.25.1


