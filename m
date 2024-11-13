Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA3FD41C19
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 08:37:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7279.1731487034418398627
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 00:37:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1047d8a9e1=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD5pSs6003032
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 08:37:13 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwv49rn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 08:37:13 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 13 Nov 2024 00:37:12 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 13 Nov 2024 00:37:10 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][PATCH 1/1] python3-werkzeug: upgrade 3.0.3 -> 3.0.6
Date: Wed, 13 Nov 2024 08:37:07 +0000
Message-ID: <20241113083707.932229-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PPI8-utCiB8zaoOry2Z19NBfvCSK2a55
X-Authority-Analysis: v=2.4 cv=Ke6AshYD c=1 sm=1 tr=0 ts=67346539 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=YPyeh4z1AAAA:8 a=1LiM2mn5wCEHQ-l7AnwA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=w8JrRwqxyiy52LetAMdd:22
X-Proofpoint-ORIG-GUID: PPI8-utCiB8zaoOry2Z19NBfvCSK2a55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-12_09,2024-11-12_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411130075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 08:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113803

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2024-49767

Changelog:
==========
https://github.com/pallets/werkzeug/blob/3.0.6/CHANGES.rst

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-werkzeug_3.0.3.bb => python3-werkzeug_3.0.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.3.bb => python3-werkzeug_3.0.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
index a5e343bf2..5758830cb 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "097e5bfda9f0aba8da6b8545146def481d06aa7d3266e7448e2cccf67dd8bd18"
+SRC_URI[sha256sum] = "a8dd59d4de28ca70471a34cba79bed5f7ef2e036a76b3ab0835474246eb41f8d"
 
 inherit pypi python_flit_core
 
-- 
2.40.0


