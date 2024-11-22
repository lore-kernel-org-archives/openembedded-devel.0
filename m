Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516B1E65D3F
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 10:19:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.21320.1732270761000088932
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 02:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10568bfe45=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM6gm7m002369
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 02:19:20 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7xpbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 02:19:20 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 22 Nov 2024 02:19:19 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 22 Nov 2024 02:19:18 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][scarthgap][PATCH 1/1] python3-werkzeug: upgrade 3.0.3 -> 3.0.6
Date: Fri, 22 Nov 2024 10:19:14 +0000
Message-ID: <20241122101914.3252545-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -tLB1KuarB9-RpdjwWuYknpcs54G5cDO
X-Proofpoint-GUID: -tLB1KuarB9-RpdjwWuYknpcs54G5cDO
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=67405aa8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=q7AoBUq9l0gA:10 a=VlfZXiiP6vEA:10 a=NEAV23lmAAAA:8 a=YPyeh4z1AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=1LiM2mn5wCEHQ-l7AnwA:9 a=w8JrRwqxyiy52LetAMdd:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-22_04,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411220087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 10:19:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113996

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2024-49767

Changelog:
==========
https://github.com/pallets/werkzeug/blob/3.0.6/CHANGES.rst

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-werkzeug_3.0.3.bb => python3-werkzeug_3.0.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.3.bb => python3-werkzeug_3.0.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
index e79343034..7a56350ee 100644
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


