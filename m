Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8BDC0218A
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 04:32:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.30354.1737347561879600420
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jan 2025 20:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31151fa721=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K4F45T001422
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 04:32:41 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4483981dmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 04:32:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 19 Jan 2025 20:32:39 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 19 Jan 2025 20:32:38 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-python][kirkstone][PATCH 1/1] python3-sqlparse: Fix CVE-2024-4340
Date: Mon, 20 Jan 2025 04:32:33 +0000
Message-ID: <20250120043233.3974122-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XcpzzJ55 c=1 sm=1 tr=0 ts=678dd1e8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=wjU5IotzqukA:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=5c460eNsrIzF76wKKIQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zHee9WuFhXGzxobCr7Vens0QbwRjBZ9K
X-Proofpoint-ORIG-GUID: zHee9WuFhXGzxobCr7Vens0QbwRjBZ9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=958 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501200034
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 04:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114959

From: Soumya Sambu <soumya.sambu@windriver.com>

Passing a heavily nested list to sqlparse.parse() leads to a Denial
of Service due to RecursionError.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-4340

Upstream-patch:
https://github.com/andialbrecht/sqlparse/commit/b4a39d9850969b4e1d6940d32094ee0b42a2cf03

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../python3-sqlparse/CVE-2024-4340.patch      | 48 +++++++++++++++++++
 .../python/python3-sqlparse_0.4.2.bb          |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2024-4340.patch
new file mode 100644
index 0000000000..8d45a27dd9
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
+index 6a32c26..ffffc77 100644
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
+2.40.0
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
index b5cc41e730..80f37b1368 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
             file://run-ptest \
             file://CVE-2023-30608.patch \
+            file://CVE-2024-4340.patch \
 	    "
 
 SRC_URI[sha256sum] = "0c00730c74263a94e5a9919ade150dfc3b19c574389985446148402998287dae"
-- 
2.40.0


