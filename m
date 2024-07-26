Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8076C3DA7F
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:04:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.59899.1721995486180143361
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=793772edd4=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QAh1Rl016493
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 12:04:45 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40kcfe1jw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 12:04:45 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 05:04:42 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] python3-sqlparse: Fix CVE-2024-4340
Date: Fri, 26 Jul 2024 12:04:24 +0000
Message-ID: <20240726120424.1936108-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 48cAtSHs1z8rS5f4c3esdCc_uQr6sFrJ
X-Proofpoint-ORIG-GUID: 48cAtSHs1z8rS5f4c3esdCc_uQr6sFrJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxlogscore=888 spamscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2407260081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jul 2024 12:04:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111441

From: Soumya Sambu <soumya.sambu@windriver.com>

Passing a heavily nested list to sqlparse.parse() leads to a Denial
of Service due to RecursionError.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-4340

Upstream-patch:
https://github.com/andialbrecht/sqlparse/commit/b4a39d9850969b4e1d6940d32094ee0b42a2cf03

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-sqlparse/CVE-2024-4340.patch      | 48 +++++++++++++++++++
 .../python/python3-sqlparse_0.4.4.bb          |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch
new file mode 100644
index 000000000..670904071
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch
@@ -0,0 +1,48 @@
+From b4a39d9850969b4e1d6940d32094ee0b42a2cf03 Mon Sep 17 00:00:00 2001
+From: Andi Albrecht <albrecht.andi@gmail.com>
+Date: Sat, 13 Apr 2024 13:59:00 +0200
+Subject: [PATCH] Raise SQLParseError instead of RecursionError.
+
+CVE: CVE-2024-4340
+
+Upstream-Status: Backport [https://github.com/andialbrecht/sqlparse/commit/b4a39d9850969b4e1d6940d32094ee0b42a2cf03]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ sqlparse/sql.py | 14 +++++++++-----
+ 1 file changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/sqlparse/sql.py b/sqlparse/sql.py
+index 1ccfbdb..2090621 100644
+--- a/sqlparse/sql.py
++++ b/sqlparse/sql.py
+@@ -10,6 +10,7 @@
+ import re
+
+ from sqlparse import tokens as T
++from sqlparse.exceptions import SQLParseError
+ from sqlparse.utils import imt, remove_quotes
+
+
+@@ -209,11 +210,14 @@ class TokenList(Token):
+
+         This method is recursively called for all child tokens.
+         """
+-        for token in self.tokens:
+-            if token.is_group:
+-                yield from token.flatten()
+-            else:
+-                yield token
++        try:
++            for token in self.tokens:
++                if token.is_group:
++                    yield from token.flatten()
++                else:
++                    yield token
++        except RecursionError as err:
++            raise SQLParseError('Maximum recursion depth exceeded') from err
+
+     def get_sublists(self):
+         for token in self.tokens:
+--
+2.25.1
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
index c04971ee8..fa633026c 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
@@ -5,6 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
 SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
+            file://CVE-2024-4340.patch \
             file://run-ptest \
 	    "
 
-- 
2.25.1


