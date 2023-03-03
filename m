Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CA6C678D4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 10:54:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20350.1677840892267938854
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Mar 2023 02:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2426ea97ab=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3239E692023029
	for <openembedded-devel@lists.openembedded.org>; Fri, 3 Mar 2023 10:54:51 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybnwpvhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 10:54:51 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Fri, 3 Mar 2023 02:54:49 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Fri, 3 Mar 2023 02:54:49 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] php: Upgrade to 8.1.16
Date: Fri, 3 Mar 2023 18:54:48 +0800
Message-ID: <20230303105448.2452690-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 43SwMV-W52aW9fQ-EaAKGs4Q8k4Drw_L
X-Proofpoint-GUID: 43SwMV-W52aW9fQ-EaAKGs4Q8k4Drw_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_01,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=992 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 10:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101346

From: Mingli Yu <mingli.yu@windriver.com>

Upgrade php to 8.1.16 [1].

[1] https://www.php.net/ChangeLog-8.php#8.1.16

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.12.bb => php_8.1.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.12.bb => php_8.1.16.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.12.bb b/meta-oe/recipes-devtools/php/php_8.1.16.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.12.bb
rename to meta-oe/recipes-devtools/php/php_8.1.16.bb
index 794330dcb..db8a65544 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.12.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.16.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "f87d73e917facf78de7bcde53fc2faa4d4dbe0487a9406e1ab68c8ae8f33eb03"
+SRC_URI[sha256sum] = "cd9f0ea14d82d9455587a49a0b6c802a7b8d8ff79703f9f48b17db010fb633ce"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


