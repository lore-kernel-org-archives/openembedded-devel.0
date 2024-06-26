Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33F4C30653
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 08:50:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21250.1719391857741228093
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 01:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=690732675f=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q5h6tO003929
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 01:50:57 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fuev9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 01:50:57 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 01:50:55 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] php: Upgrade to 8.2.20
Date: Wed, 26 Jun 2024 08:50:38 +0000
Message-ID: <20240626085038.2951548-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: rrXa3WXws35Kukj-ukpYMmU6wHYs1qTv
X-Proofpoint-ORIG-GUID: rrXa3WXws35Kukj-ukpYMmU6wHYs1qTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406260065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 08:50:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111086

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2024-5458, CVE-2024-2408 and other bugs

Changelog:
https://www.php.net/ChangeLog-8.php#PHP_8_2

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.18.bb => php_8.2.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.18.bb => php_8.2.20.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.18.bb b/meta-oe/recipes-devtools/php/php_8.2.20.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.18.bb
rename to meta-oe/recipes-devtools/php/php_8.2.20.bb
index e662f6806..c3c51cd93 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.18.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.20.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "ca0b07c254200320f518ac5b3df540a9cf14d866f3c93edc3013b52e06fac796"
+SRC_URI[sha256sum] = "5dec6fa61c7b9c47aa1d76666be651f2642ed2bcf6cd8638c57e3571ce2aac61"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.40.0


