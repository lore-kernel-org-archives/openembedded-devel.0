Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8220CC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 04:31:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17739.1719376268521129137
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 21:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=690732675f=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q2l8Wd019692
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 21:31:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fu90c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 21:31:08 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 21:31:05 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] php: Upgrade to 8.1.29
Date: Wed, 26 Jun 2024 04:30:43 +0000
Message-ID: <20240626043043.520977-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: ZgRR8URI5ai-uFV9G7lhLvGcheLCfqZN
X-Proofpoint-ORIG-GUID: ZgRR8URI5ai-uFV9G7lhLvGcheLCfqZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=986 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406260033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 04:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111081

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2024-5458, CVE-2024-2408 and other bugs

Changelog:
https://www.php.net/ChangeLog-8.php#8.1.29

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.28.bb => php_8.1.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.28.bb => php_8.1.29.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.28.bb b/meta-oe/recipes-devtools/php/php_8.1.29.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.28.bb
rename to meta-oe/recipes-devtools/php/php_8.1.29.bb
index e7eb75c1a..7a11de7ef 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.28.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.29.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "8be450096e0153c47d75384e7dd595cc897f1d53ce0060708ce9589bcc3141ee"
+SRC_URI[sha256sum] = "87a60313263f2f533f180e719272ca5e47cd9884d4ec3c93720198eaffae0827"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.40.0


