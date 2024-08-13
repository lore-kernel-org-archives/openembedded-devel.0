Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F42FC52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 07:29:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.66876.1723534131081897891
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 00:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=895553af70=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D59Tpv016322
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 07:28:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40wy652pu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 07:28:50 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 00:28:47 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][kirkstone][PATCH 1/1] cjson: fix CVE-2024-31755
Date: Tue, 13 Aug 2024 07:28:27 +0000
Message-ID: <20240813072827.1916570-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: TAJervzpzzvicKNsMH3JOtzUXT7EU8AC
X-Proofpoint-GUID: TAJervzpzzvicKNsMH3JOtzUXT7EU8AC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=935 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408130052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 07:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111787

From: Divya Chellam <divya.chellam@windriver.com>

cJSON v1.7.17 was discovered to contain a segmentation violation,
which can trigger through the second parameter of function
cJSON_SetValuestring at cJSON.c.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-31755

Upstream-patch:
https://github.com/DaveGamble/cJSON/commit/7e4d5dabe7a9b754c601f214e65b544e67ba9f59

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../cjson/cjson/CVE-2024-31755.patch          | 33 +++++++++++++++++++
 .../recipes-devtools/cjson/cjson_1.7.17.bb    |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2024-31755.patch

diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2024-31755.patch b/meta-oe/recipes-devtools/cjson/cjson/CVE-2024-31755.patch
new file mode 100644
index 000000000..41d852021
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2024-31755.patch
@@ -0,0 +1,33 @@
+From 7e4d5dabe7a9b754c601f214e65b544e67ba9f59 Mon Sep 17 00:00:00 2001
+From: Up-wind <lj.upwind@gmail.com>
+Date: Mon, 25 Mar 2024 20:07:11 +0800
+Subject: [PATCH] Add NULL check to cJSON_SetValuestring() If the valuestring
+ passed to cJSON_SetValuestring is NULL, a null pointer dereference will
+ happen.
+
+This commit adds the NULL check of valuestring before it is dereferenced.
+
+CVE: CVE-2024-31755
+
+Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/7e4d5dabe7a9b754c601f214e65b544e67ba9f59]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ cJSON.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cJSON.c b/cJSON.c
+index 4e4979e..8903e4c 100644
+--- a/cJSON.c
++++ b/cJSON.c
+@@ -406,7 +406,7 @@ CJSON_PUBLIC(char*) cJSON_SetValuestring(cJSON *object, const char *valuestring)
+         return NULL;
+     }
+     /* return NULL if the object is corrupted */
+-    if (object->valuestring == NULL)
++    if (object->valuestring == NULL || valuestring == NULL)
+     {
+         return NULL;
+     }
+--
+2.40.0
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
index c9c38a9fe..3c67a89cd 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.17.bb
@@ -5,7 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
-SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
+	   file://CVE-2024-31755.patch \
+	  "
 SRCREV = "87d8f0961a01bf09bef98ff89bae9fdec42181ee"
 
 S = "${WORKDIR}/git"
-- 
2.40.0


