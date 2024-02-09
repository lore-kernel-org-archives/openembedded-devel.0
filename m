Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98C0C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 10:12:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8449.1707473563788374975
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 02:12:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=oX6gfuGJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=27698d62ee=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4196m2vQ021986
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Feb 2024 02:12:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=wMgD5tb2TMcdGYzSUm
	WWPo0JRl3FloaKCpiSYByXluE=; b=oX6gfuGJ33qPlVy0DCyRbiQbihZfcNbohL
	FdG3GSSuHeopDw6WeEUIQsAK32EiEXiGK+sdhWZFYfgjbW+g3NjsiCO8JkqaSXJ1
	1PQBVOxAexJr1aAf1fRebQ//UXOJMF44GSXWdEd123+l9IUnRaYHqD7SPsV1JsZ/
	x7QMAhwtJmtH2x6ATv/z0Rrl7ow19tlU1L9thwK3r5HSySpwicqo0eBmUFyAX/H0
	nBN5spaoyyLDQwGgJb1RZB8lHaInt0ty2JGjsDexQ9GQDum69zRnKlpzpSPrV9CW
	gEvciUVkw4Gc68tALDDU3l2l2+70p3IazB4bmnxzOpnp7UpwTVcA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1nvm5s37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 02:12:43 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 02:12:41 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] mariadb: fix CVE-2023-22084
Date: Fri, 9 Feb 2024 10:12:22 +0000
Message-ID: <20240209101222.2324952-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: i9vf_lor2xh4QZV9OV8EsIPi_WI3zrkU
X-Proofpoint-ORIG-GUID: i9vf_lor2xh4QZV9OV8EsIPi_WI3zrkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-09_08,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402090073
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4196m2vQ021986
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 10:12:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108681

From: Yogita Urade <yogita.urade@windriver.com>

Vulnerability in the MySQL Server product of Oracle MySQL
(component: InnoDB). Supported versions that are affected
are 5.7.43 and prior, 8.0.34 and prior and 8.1.0. Easily
exploitable vulnerability allows high privileged attacker
with network access via multiple protocols to compromise
MySQL Server. Successful attacks of this vulnerability can
result in unauthorized ability to cause a hang or frequently
repeatable crash (complete DOS) of MySQL Server. CVSS 3.1
Base Score 4.9 (Availability impacts).
CVSS Vector: (CVSS:3.1/AV:N/AC:L/PR:H/UI:N/S:U/C:N/I:N/A:H).

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-22084
https://security-tracker.debian.org/tracker/CVE-2023-22084

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  1 +
 .../mysql/mariadb/CVE-2023-22084.patch        | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-22084.patc=
h

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index a84f8d134f..7c4b0a467f 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -22,6 +22,7 @@ SRC_URI =3D "https://archive.mariadb.org/${BP}/source/$=
{BP}.tar.gz \
            file://cross-compiling.patch \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.pat=
ch \
            file://0001-MDEV-29644-a-potential-bug-of-null-pointer-derefe=
ren.patch \
+	   file://CVE-2023-22084.patch \
           "
 SRC_URI:append:libc-musl =3D " file://ppc-remove-glibc-dep.patch"
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-22084.patch b/met=
a-oe/recipes-dbs/mysql/mariadb/CVE-2023-22084.patch
new file mode 100644
index 0000000000..3053614854
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/CVE-2023-22084.patch
@@ -0,0 +1,91 @@
+From 15ae97b1c2c14f1263cdc853673c4129625323de Mon Sep 17 00:00:00 2001
+From: Marko M=C3=A4kel=C3=A4 <marko.makela@mariadb.com>
+Date: Thu, 8 Feb 2024 08:09:20 +0000
+Subject: [PATCH] MDEV-32578 row_merge_fts_doc_tokenize() handles parser =
plugin
+  inconsistently
+
+When mysql/mysql-server@0c954c2
+added a plugin interface for FULLTEXT INDEX tokenization to MySQL 5.7,
+fts_tokenize_ctx::processed_len got a second meaning, which is only
+partly implemented in row_merge_fts_doc_tokenize().
+
+This inconsistency could cause a crash when using FULLTEXT...WITH PARSER.
+A test case that would crash MySQL 8.0 when using an n-gram parser and
+single-character words would fail to crash in MySQL 5.7, because the
+buf_full condition in row_merge_fts_doc_tokenize() was not met.
+
+This change is inspired by
+mysql/mysql-server@38e9a07
+that appeared in MySQL 5.7.44.
+
+CVE: CVE-2023-22084
+Upstream-Status: Backport [https://github.com/MariaDB/server/commit/15ae=
97b1c2c1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ storage/innobase/include/row0ftsort.h |  6 +++++-
+ storage/innobase/row/row0ftsort.cc    | 11 ++++++++---
+ 2 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/storage/innobase/include/row0ftsort.h b/storage/innobase/in=
clude/row0ftsort.h
+index 65508caf..3ffa8243 100644
+--- a/storage/innobase/include/row0ftsort.h
++++ b/storage/innobase/include/row0ftsort.h
+@@ -104,7 +104,10 @@ typedef UT_LIST_BASE_NODE_T(row_fts_token_t)     ft=
s_token_list_t;
+
+ /** Structure stores information from string tokenization operation */
+ struct fts_tokenize_ctx {
+-	ulint			processed_len;  /*!< processed string length */
++	/** the processed string length in bytes
++	(when using the built-in tokenizer),
++	or the number of row_merge_fts_doc_tokenize_by_parser() calls */
++	ulint			processed_len;
+	ulint			init_pos;       /*!< doc start position */
+	ulint			buf_used;       /*!< the sort buffer (ID) when
+						tokenization stops, which
+@@ -115,6 +118,7 @@ struct fts_tokenize_ctx {
+	ib_rbt_t*		cached_stopword;/*!< in: stopword list */
+	dfield_t		sort_field[FTS_NUM_FIELDS_SORT];
+						/*!< in: sort field */
++	/** parsed tokens (when using an external parser) */
+	fts_token_list_t	fts_token_list;
+
+	fts_tokenize_ctx() :
+diff --git a/storage/innobase/row/row0ftsort.cc b/storage/innobase/row/r=
ow0ftsort.cc
+index 86e96624..406ff60f 100644
+--- a/storage/innobase/row/row0ftsort.cc
++++ b/storage/innobase/row/row0ftsort.cc
+@@ -491,7 +491,10 @@ row_merge_fts_doc_tokenize(
+
+	/* Tokenize the data and add each word string, its corresponding
+	doc id and position to sort buffer */
+-	while (t_ctx->processed_len < doc->text.f_len) {
++	while (parser
++               ? (!t_ctx->processed_len
++                  || UT_LIST_GET_LEN(t_ctx->fts_token_list))
++               : t_ctx->processed_len < doc->text.f_len) {
+		ulint		idx =3D 0;
+		ulint		cur_len;
+		doc_id_t	write_doc_id;
+@@ -831,7 +834,8 @@ void fts_parallel_tokenization(
+			/* Not yet finish processing the "doc" on hand,
+			continue processing it */
+			ut_ad(doc.text.f_str);
+-			ut_ad(t_ctx.processed_len < doc.text.f_len);
++			ut_ad(buf[0]->index->parser
++			      || t_ctx.processed_len < doc.text.f_len);
+		}
+
+		processed =3D row_merge_fts_doc_tokenize(
+@@ -841,7 +845,8 @@ void fts_parallel_tokenization(
+
+		/* Current sort buffer full, need to recycle */
+		if (!processed) {
+-			ut_ad(t_ctx.processed_len < doc.text.f_len);
++			ut_ad(buf[0]->index->parser
++			      || t_ctx.processed_len < doc.text.f_len);
+			ut_ad(t_ctx.rows_added[t_ctx.buf_used]);
+			break;
+		}
+--
+2.40.0
--=20
2.35.5


