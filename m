Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B295CC3DA7F
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:05:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.59906.1721995522346801276
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=793772edd4=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46Q9MBNu000408
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 12:05:21 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kcfe1jx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 12:05:21 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 05:05:18 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][master][scarthgap][PATCH 1/1] python3-werkzeug: upgrade 3.0.1 -> 3.0.3
Date: Fri, 26 Jul 2024 12:05:00 +0000
Message-ID: <20240726120500.1938701-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: UjIz6pXjuCgMXz9aUZmuyCvFpEu_XTaZ
X-Proofpoint-ORIG-GUID: UjIz6pXjuCgMXz9aUZmuyCvFpEu_XTaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2407260081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 12:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111442

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2024-34069

The license didn't change but the file was renamed.

Changelog:
==========
https://github.com/pallets/werkzeug/blob/3.0.3/CHANGES.rst
https://github.com/pallets/werkzeug/blob/3.0.2/CHANGES.rst

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../{python3-werkzeug_3.0.1.bb => python3-werkzeug_3.0.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.1.bb => python3-werkzeug_3.0.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb
index f8d2769b4..e79343034 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb
@@ -8,9 +8,9 @@ cookie handling, file uploads, a powerful URL routing system and a bunch \
 of community contributed addon modules."
 HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "507e811ecea72b18a404947aded4b3390e1db8f826b494d76550ef45bb3b1dcc"
+SRC_URI[sha256sum] = "097e5bfda9f0aba8da6b8545146def481d06aa7d3266e7448e2cccf67dd8bd18"
 
 inherit pypi python_flit_core
 
-- 
2.25.1


