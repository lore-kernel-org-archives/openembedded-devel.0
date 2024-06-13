Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07841C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 06:57:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2319.1718261839245149635
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jun 2024 23:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68949a4709=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45D60kf8024742
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 23:57:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymjk2cqx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 23:57:18 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 23:57:16 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] unixodbc: Fix CVE-2024-1013
Date: Thu, 13 Jun 2024 06:56:56 +0000
Message-ID: <20240613065656.3893469-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: _NH83821r_BzpOMAG-4eqDbuOdtqItDT
X-Proofpoint-GUID: _NH83821r_BzpOMAG-4eqDbuOdtqItDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_12,2024-06-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406130047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jun 2024 06:57:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110888

From: Soumya Sambu <soumya.sambu@windriver.com>

An out-of-bounds stack write flaw was found in unixODBC on 64-bit
architectures where the caller has 4 bytes and callee writes 8 bytes.
This issue may go unnoticed on little-endian architectures, while
big-endian architectures can be broken.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-1013

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../unixodbc/files/CVE-2024-1013.patch        | 53 +++++++++++++++++++
 .../unixodbc/unixodbc_2.3.12.bb               |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch

diff --git a/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch b/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
new file mode 100644
index 000000000..b9ad0b4a1
--- /dev/null
+++ b/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
@@ -0,0 +1,53 @@
+From 45f501e1be2db6b017cc242c79bfb9de32b332a1 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Mon, 29 Jan 2024 08:27:29 +0100
+Subject: [PATCH] PostgreSQL driver: Fix incompatible pointer-to-integer types
+
+These result in out-of-bounds stack writes on 64-bit architectures
+(caller has 4 bytes, callee writes 8 bytes), and seem to have gone
+unnoticed on little-endian architectures (although big-endian
+architectures must be broken).
+
+This change is required to avoid a build failure with GCC 14.
+
+CVE: CVE-2024-1013
+
+Upstream-Status: Backport [https://github.com/lurcher/unixODBC/commit/45f501e1be2db6b017cc242c79bfb9de32b332a1]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ Drivers/Postgre7.1/info.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Drivers/Postgre7.1/info.c b/Drivers/Postgre7.1/info.c
+index 63ac91f..2216ecd 100644
+--- a/Drivers/Postgre7.1/info.c
++++ b/Drivers/Postgre7.1/info.c
+@@ -1779,14 +1779,14 @@ char *table_name;
+ char index_name[MAX_INFO_STRING];
+ short fields_vector[8];
+ char isunique[10], isclustered[10];
+-SDWORD index_name_len, fields_vector_len;
++SQLLEN index_name_len, fields_vector_len;
+ TupleNode *row;
+ int i;
+ HSTMT hcol_stmt;
+ StatementClass *col_stmt, *indx_stmt;
+ char column_name[MAX_INFO_STRING], relhasrules[MAX_INFO_STRING];
+ char **column_names = 0;
+-Int4 column_name_len;
++SQLLEN column_name_len;
+ int total_columns = 0;
+ char error = TRUE;
+ ConnInfo *ci;
+@@ -2136,7 +2136,7 @@ HSTMT htbl_stmt;
+ StatementClass *tbl_stmt;
+ char tables_query[STD_STATEMENT_LEN];
+ char attname[MAX_INFO_STRING];
+-SDWORD attname_len;
++SQLLEN attname_len;
+ char pktab[MAX_TABLE_LEN + 1];
+ Int2 result_cols;
+
+--
+2.40.0
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
index 7819387c3..dfad833e0 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
@@ -11,6 +11,7 @@ DEPENDS = "libtool readline"
 SRC_URI = "https://www.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
            file://0001-exe-Makefile.am-add-CROSS_LAUNCHER-to-run-odbc_confi.patch \
+           file://CVE-2024-1013.patch \
 "
 SRC_URI[sha256sum] = "f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f01915ec"
 
-- 
2.40.0


