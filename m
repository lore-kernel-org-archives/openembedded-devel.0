Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BA0C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 12:55:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7739.1744203349722457017
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 05:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61945d04ab=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5395jiw2011335
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Apr 2025 05:55:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m50w6-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 05:55:49 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 9 Apr 2025 05:55:47 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 9 Apr 2025 05:55:46 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] php: Upgrade 8.2.26 -> 8.2.28
Date: Wed, 9 Apr 2025 12:55:42 +0000
Message-ID: <20250409125542.1446704-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 3Do5v7fyRCNFQOioA4PIcxAtMn8BK6K1
X-Proofpoint-ORIG-GUID: 3Do5v7fyRCNFQOioA4PIcxAtMn8BK6K1
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f66e55 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=67BIL_jfAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=vs2GookMAJkUiJWBTIcA:9 a=zWsmoVtUA9YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090077
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 12:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116740

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for - CVE-2025-1219, CVE-2025-1736, CVE-2025-1861,
CVE-2025-1734 and CVE-2025-1217

Changelog:
https://www.php.net/ChangeLog-8.php#8.2.28

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.26.bb => php_8.2.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.26.bb => php_8.2.28.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.26.bb b/meta-oe/recipes-devtools/php/php_8.2.28.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.26.bb
rename to meta-oe/recipes-devtools/php/php_8.2.28.bb
index 10ef2c36e7..1d5162fa6e 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.26.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.28.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
+SRC_URI[sha256sum] = "2919cc1b92190a58dc17904b92e626600b96ce49a4c72e77513786a4406acce5"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.40.0


