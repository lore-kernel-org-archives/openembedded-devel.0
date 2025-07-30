Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E0CC87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 12:31:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34172.1753878697472151877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 05:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0306a9768e=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56UCTEuM3309407;
	Wed, 30 Jul 2025 05:31:36 -0700
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 487ken8030-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Jul 2025 05:31:36 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 30 Jul 2025 05:31:34 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 30 Jul 2025 05:31:32 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Jason Schonberg <schonm@gmail.com>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe][meta-oe][walnascar[PATCH 3/4] php: upgrade 8.4.8 -> 8.4.10
Date: Wed, 30 Jul 2025 18:01:10 +0530
Message-ID: <20250730123111.3858530-3-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250730123111.3858530-1-praveen.kumar@windriver.com>
References: <20250730123111.3858530-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=d7f1yQjE c=1 sm=1 tr=0 ts=688a10a8 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Wb1JkmetP80A:10 a=67BIL_jfAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=vs2GookMAJkUiJWBTIcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -b1SKt8evYfsiYmlcWhDhqqaKcaZHfw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA4OSBTYWx0ZWRfX6PFT3HMk0ykc
 Jt0uF2GyPE4ro3DOBspwGTbUIW+6GYq1O7JxmUC1CNekBFs4Ew7pMK0AslZSDdRCzfq4J8XlxPr
 3gcNd2wm98Vj4JkzAT8c8Aea/Nok9L0/XcjmMdMXUj6wUw9fbXbQBxJNplDCO8J55snsRxINoOK
 tKfnGKLZPVqLNs7iIqZvUTYVmz2qBJ7hMW5ILSMzSHDldQgFNkvfpqiyzHXbuPud/2mgMO3y2xS
 atmSBvIpz0lamqcFexJI4nMFToLNAO6ED/8xfbkrzPp3deuSy9C6eF2htm9dMsXEKSSuK0oFXTc
 MGgOvGXlrECb5M5X2CtOXRdoJ/DNrj8/THaFDKuLXIexjaYUzPLv77jcMR3xp8MhalYAjQI1XU1
 g4XEz3Za
X-Proofpoint-ORIG-GUID: -b1SKt8evYfsiYmlcWhDhqqaKcaZHfw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507300089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 12:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118796

From: Jason Schonberg <schonm@gmail.com>

This is a security update.

There are fixes for memory leaks, segfaults and CVEs.

CVE-2025-1735
CVE-2025-1220
CVE-2025-6491

Changelog: https://www.php.net/ChangeLog-8.php#8.4.10

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.8.bb => php_8.4.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.8.bb => php_8.4.10.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.8.bb b/meta-oe/recipes-devtools/php/php_8.4.10.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.8.bb
rename to meta-oe/recipes-devtools/php/php_8.4.10.bb
index 8c2139fd42..8d7a214d35 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.8.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.10.bb
@@ -29,7 +29,7 @@ SRC_URI:append:class-target = " \
 
 S = "${WORKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "36569c64dd1499e570c436603b641eee7cde4af576af786597d0ee711b3a3a8a"
+SRC_URI[sha256sum] = "8815d10659cde5f03be4d169205d62b7b29ed0edc7cdd84b6384cda0310c3108"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.40.0


