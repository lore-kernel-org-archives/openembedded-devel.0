Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EDBC4332F
	for <webhook@archiver.kernel.org>; Thu, 22 Dec 2022 10:10:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.42392.1671703828615892515
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Dec 2022 02:10:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9355a807c6=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BM9fJqn024962
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 10:10:27 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r9bvk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 10:10:27 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 22 Dec 2022 02:10:26 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 22 Dec 2022 02:10:25 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] php: Upgrade to 8.1.12
Date: Thu, 22 Dec 2022 18:10:25 +0800
Message-ID: <20221222101025.1214071-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ho82f6Zv_0dhIufdkNOuTjzWBgts9-tZ
X-Proofpoint-ORIG-GUID: ho82f6Zv_0dhIufdkNOuTjzWBgts9-tZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_05,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=964 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212220089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Dec 2022 10:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100192

From: Mingli Yu <mingli.yu@windriver.com>

This is a security release[1].

[1] https://www.php.net/ChangeLog-8.php#8.1.12

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.10.bb => php_8.1.12.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.10.bb b/meta-oe/recipes-devtools/php/php_8.1.12.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.10.bb
rename to meta-oe/recipes-devtools/php/php_8.1.12.bb
index 624ab2621..794330dcb 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.12.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "2de8e0402285f7c56887defe651922308aded58ba60befcf3b77720209e31f10"
+SRC_URI[sha256sum] = "f87d73e917facf78de7bcde53fc2faa4d4dbe0487a9406e1ab68c8ae8f33eb03"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


