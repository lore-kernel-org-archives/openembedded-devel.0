Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBE2C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 12:53:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.86811.1754052825418538391
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 05:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0308a0254b=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 571Bk5Gb3628092
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Aug 2025 12:53:44 GMT
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4888hts49n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 12:53:43 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 1 Aug 2025 05:53:42 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 1 Aug 2025 05:53:40 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe][meta-oe][scarthgap[PATCH 1/1] php: upgrade 8.2.28 -> 8.2.29
Date: Fri, 1 Aug 2025 18:23:29 +0530
Message-ID: <20250801125329.3932193-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0ChR6PYpt0ZUsrfkgwVt1coIXhLxnjh6
X-Proofpoint-ORIG-GUID: 0ChR6PYpt0ZUsrfkgwVt1coIXhLxnjh6
X-Authority-Analysis: v=2.4 cv=ZtntK87G c=1 sm=1 tr=0 ts=688cb8d7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=67BIL_jfAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=vs2GookMAJkUiJWBTIcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA5NiBTYWx0ZWRfX1F583ZrGtjhS
 1EyQHUbkDD0TiWnp4VmBnFSM1Gkl+KeB5EN2lAf95xNN5hiDHMi511YNgTFbdhOlhb7+eMPyu8d
 oIS8CyI698llUX6okM/FYAidQ+Q0maaZkxZLghQB4fTUHFEBWRKmluKdq6LqbQbiKgl0CE6nqJk
 ZvJymicmFSMIQYUu6OjnzRaFdP6pqkEKbOzgQ+kpuoL5j3fre19VxLE66XbgWKSQA6wCZUgioHs
 FcJNgDQZIEE/RV8AXmY87YFI6Cnk8zMyDnCek+tvhhFrUZHMC2nTORMVG7j8Pxdtu93fHMUqwyu
 jCD4xMUbtBnCjDghfaTceO8X9Zo0OTl3HuCjQK+w8foWBYbRuI3abjz1svLx2YnbOV3PsvQl/WS
 Zc05Kh7A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507310086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 12:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118821

This upgrade fixes below CVEs.
CVE-2025-1735
CVE-2025-6491
CVE-2025-1220

Changelog: https://www.php.net/ChangeLog-8.php#8.2.29

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.28.bb => php_8.2.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.28.bb => php_8.2.29.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.28.bb b/meta-oe/recipes-devtools/php/php_8.2.29.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.28.bb
rename to meta-oe/recipes-devtools/php/php_8.2.29.bb
index 1d5162fa6e..2fb6e5749c 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.28.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.29.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "2919cc1b92190a58dc17904b92e626600b96ce49a4c72e77513786a4406acce5"
+SRC_URI[sha256sum] = "51979e8d198cbade2aad4ffe9f53dd3f04f9602d3089e5979985e058ade4267c"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.40.0


