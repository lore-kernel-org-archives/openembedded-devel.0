Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E68AC54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 12:37:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.43217.1710938220920464294
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Mar 2024 05:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O7fae3r9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3809f77ee0=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42K6xgeP012216
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 12:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=HQKMK
	tSK04G2BDxY2vJeHk3qkp6rgFNPjHWQAK+FyQA=; b=O7fae3r9TJRG0XlVIEPBq
	H2ej+RE4v7e83iAcE1vEJhB20erzOHUCjAGb43W0ULhK8N3dzcMVbieVGpxpAbxI
	pH6QTSiniVN73XRTdDhBYa9p8Pgf6mHt4o5v0tKupa7Q59q9eoeYlaJujkaY2s/F
	BYnBpFA4iiyELa/KsSo8FXCCD5lhR5FHvlL8JGwrDAbBVLZ1ieuio9haaS9+gdwt
	4Uxmfkbic2s0wdBo9bnA7GmS0Wyglgyh/+CWoIT47JMrr6CFdp0tPaBC/76pvDdb
	iQMjqjwxipt64yUYKes76Q7+lrmrfdeKU7LLxrDEVxys8WAAB6kaDOE2RNy3rujg
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ww0mxkyh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 12:37:00 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 20 Mar 2024 05:36:57 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] unixodbc: Fix CVE-2024-1013
Date: Wed, 20 Mar 2024 12:35:50 +0000
Message-ID: <20240320123550.3378250-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: ho76-hFswqj22Ljgvbofk_l7Vco21Srt
X-Proofpoint-GUID: ho76-hFswqj22Ljgvbofk_l7Vco21Srt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_08,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Mar 2024 12:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109488

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
 .../unixodbc/unixodbc_2.3.9.bb                |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch

diff --git a/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch b/meta-oe/recipes-support/unixodbc/files/CVE-2024-1013.patch
new file mode 100644
index 000000000..7d37ad604
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
+index 63ac91f..2216ecd 100755
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
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
index c194739cb..283546cf0 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.9.bb
@@ -10,6 +10,7 @@ DEPENDS = "libtool readline"
 
 SRC_URI = "http://ftp.unixodbc.org/unixODBC-${PV}.tar.gz \
            file://do-not-use-libltdl-source-directory.patch \
+           file://CVE-2024-1013.patch \
 "
 SRC_URI[sha256sum] = "52833eac3d681c8b0c9a5a65f2ebd745b3a964f208fc748f977e44015a31b207"
 
-- 
2.40.0


