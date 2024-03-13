Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399E5C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:07:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10620.1710313636399375964
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nOapdNKb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=380231fee7=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D6gkME003532
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 00:07:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=hHPHZ
	F5DQyyDIrq2OaVib9rIhDOZd5U7+e+Njja7ZUQ=; b=nOapdNKblphR40+ssVHaW
	l/7J9srCQAvlz8sluwFK4iocwvr9qqwIaBLRHOgl24dGUFnHCPH5YHcPpHQcq/ta
	h2RCEmswrO+RKKaC8BcECcUSTV7s/yV1hdXrH7jpiDiBlLBg45T8Pcym8Li0PaRk
	9qH8CcorstJmCTxVj6mWdngo4UWzVN5NOLNfOcCYzGuboDSs6ny6aaFSIhCdEUDI
	9d7ahWO3YNd9iNKc1omNQ0yyI52MGIjvAzuDGpl0gMvY6V9fzgR10w+zepaPzWW3
	P7STKzMm2+CPbLO2O5l/y5umryxiDZTiOn9tFfiaA9JXiqQkkEu53wLK2FaDHwuq
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrr5mba3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 00:07:15 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Mar 2024 00:07:13 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] postgresql: Upgrade to 14.11
Date: Wed, 13 Mar 2024 07:06:44 +0000
Message-ID: <20240313070644.1835709-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: gjJ7FKlE6YHQqBFUxWkBSxpItRxgRmZE
X-Proofpoint-GUID: gjJ7FKlE6YHQqBFUxWkBSxpItRxgRmZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_06,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 07:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109290

From: Soumya Sambu <soumya.sambu@windriver.com>

Addresses CVEs and other bug fixes. Remove patches that are fixed
in this release. Release notes are available at:

https://www.postgresql.org/docs/release/14.10/
https://www.postgresql.org/docs/release/14.11/

0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for new version.

License-Update: Copyright year updated

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...c-bypass-autoconf-2.69-version-check.patch |   6 +-
 .../postgresql/files/CVE-2023-5868.patch      | 125 --------
 .../postgresql/files/CVE-2023-5869.patch      | 294 ------------------
 .../postgresql/files/CVE-2023-5870.patch      | 108 -------
 ...postgresql_14.9.bb => postgresql_14.11.bb} |   7 +-
 5 files changed, 5 insertions(+), 535 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.9.bb => postgresql_14.11.bb} (61%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 8ffefbe34..807eac219 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 2d3ac7b2eab1bba53c1729e8edb9f8a86700b60f Mon Sep 17 00:00:00 2001
+From c48f2f132744a0b4a2473ec178d63c1d4d1a4a86 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -14,12 +14,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d0f0b14..54a539e 100644
+index e59dc99..41b4732 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.9], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [14.11], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
deleted file mode 100644
index 50953f49b..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From 3b0776fde56763c549df35ce9750f3399bc710b2 Mon Sep 17 00:00:00 2001
-From: Tom Lane <tgl@sss.pgh.pa.us>
-Date: Tue, 21 Nov 2023 11:37:27 +0000
-Subject: [PATCH] Compute aggregate argument types correctly in
-
- transformAggregateCall().
-
-transformAggregateCall() captures the datatypes of the aggregate's
-arguments immediately to construct the Aggref.aggargtypes list.
-This seems reasonable because the arguments have already been
-transformed --- but there is an edge case where they haven't been.
-Specifically, if we have an unknown-type literal in an ANY argument
-position, nothing will have been done with it earlier.  But if we
-also have DISTINCT, then addTargetToGroupList() converts the literal
-to "text" type, resulting in the aggargtypes list not matching the
-actual runtime type of the argument.  The end result is that the
-aggregate tries to interpret a "text" value as being of type
-"unknown", that is a zero-terminated C string.  If the text value
-contains no zero bytes, this could result in disclosure of server
-memory following the text literal value.
-
-To fix, move the collection of the aggargtypes list to the end
-of transformAggregateCall(), after DISTINCT has been handled.
-This requires slightly more code, but not a great deal.
-
-Our thanks to Jingzhou Fu for reporting this problem.
-
-Security: CVE-2023-5868
-
-CVE: CVE-2023-5868
-Upstream-Status: Backport [https://github.com/postgres/postgres/commit/3b0776fde56763c549df35ce9750f3399bc710b2]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
-
----
- src/backend/parser/parse_agg.c      | 35 +++++++++++++++++++----------
- src/test/regress/expected/jsonb.out |  7 ++++++
- src/test/regress/sql/jsonb.sql      |  3 +++
- 3 files changed, 33 insertions(+), 12 deletions(-)
-
-diff --git a/src/backend/parser/parse_agg.c b/src/backend/parser/parse_agg.c
-index 828cd99..90cf150 100644
---- a/src/backend/parser/parse_agg.c
-+++ b/src/backend/parser/parse_agg.c
-@@ -110,18 +110,6 @@ transformAggregateCall(ParseState *pstate, Aggref *agg,
- 	int			save_next_resno;
- 	ListCell   *lc;
- 
--	/*
--	 * Before separating the args into direct and aggregated args, make a list
--	 * of their data type OIDs for use later.
--	 */
--	foreach(lc, args)
--	{
--		Expr	   *arg = (Expr *) lfirst(lc);
--
--		argtypes = lappend_oid(argtypes, exprType((Node *) arg));
--	}
--	agg->aggargtypes = argtypes;
--
- 	if (AGGKIND_IS_ORDERED_SET(agg->aggkind))
- 	{
- 		/*
-@@ -233,6 +221,29 @@ transformAggregateCall(ParseState *pstate, Aggref *agg,
- 	agg->aggorder = torder;
- 	agg->aggdistinct = tdistinct;
- 
-+	/*
-+	 * Now build the aggargtypes list with the type OIDs of the direct and
-+	 * aggregated args, ignoring any resjunk entries that might have been
-+	 * added by ORDER BY/DISTINCT processing.  We can't do this earlier
-+	 * because said processing can modify some args' data types, in particular
-+	 * by resolving previously-unresolved "unknown" literals.
-+	 */
-+	foreach(lc, agg->aggdirectargs)
-+	{
-+		Expr	   *arg = (Expr *) lfirst(lc);
-+
-+		argtypes = lappend_oid(argtypes, exprType((Node *) arg));
-+	}
-+	foreach(lc, tlist)
-+	{
-+		TargetEntry *tle = (TargetEntry *) lfirst(lc);
-+
-+		if (tle->resjunk)
-+			continue;			/* ignore junk */
-+		argtypes = lappend_oid(argtypes, exprType((Node *) tle->expr));
-+	}
-+	agg->aggargtypes = argtypes;
-+
- 	check_agglevels_and_constraints(pstate, (Node *) agg);
- }
- 
-diff --git a/src/test/regress/expected/jsonb.out b/src/test/regress/expected/jsonb.out
-index bec355d..eb7f410 100644
---- a/src/test/regress/expected/jsonb.out
-+++ b/src/test/regress/expected/jsonb.out
-@@ -1558,6 +1558,13 @@ SELECT jsonb_object_agg(name, type) FROM foo;
- INSERT INTO foo VALUES (999999, NULL, 'bar');
- SELECT jsonb_object_agg(name, type) FROM foo;
- ERROR:  field name must not be null
-+-- edge case for parser
-+SELECT jsonb_object_agg(DISTINCT 'a', 'abc');
-+ jsonb_object_agg
-+------------------
-+ {"a": "abc"}
-+(1 row)
-+
- -- jsonb_object
- -- empty object, one dimension
- SELECT jsonb_object('{}');
-diff --git a/src/test/regress/sql/jsonb.sql b/src/test/regress/sql/jsonb.sql
-index f8d5960..040e1ba 100644
---- a/src/test/regress/sql/jsonb.sql
-+++ b/src/test/regress/sql/jsonb.sql
-@@ -397,6 +397,9 @@ SELECT jsonb_object_agg(name, type) FROM foo;
- INSERT INTO foo VALUES (999999, NULL, 'bar');
- SELECT jsonb_object_agg(name, type) FROM foo;
- 
-+-- edge case for parser
-+SELECT jsonb_object_agg(DISTINCT 'a', 'abc');
-+
- -- jsonb_object
- 
- -- empty object, one dimension
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
deleted file mode 100644
index cef2ab225..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
+++ /dev/null
@@ -1,294 +0,0 @@
-From 18b585155a891784ca8985f595ebc0dde94e0d43 Mon Sep 17 00:00:00 2001
-From: Tom Lane <tgl@sss.pgh.pa.us>
-Date: Tue, 21 Nov 2023 11:43:00 +0000
-Subject: [PATCH] Detect integer overflow while computing new array dimensions.
-
-array_set_element() and related functions allow an array to be
-enlarged by assigning to subscripts outside the current array bounds.
-While these places were careful to check that the new bounds are
-allowable, they neglected to consider the risk of integer overflow
-in computing the new bounds.  In edge cases, we could compute new
-bounds that are invalid but get past the subsequent checks,
-allowing bad things to happen.  Memory stomps that are potentially
-exploitable for arbitrary code execution are possible, and so is
-disclosure of server memory.
-
-To fix, perform the hazardous computations using overflow-detecting
-arithmetic routines, which fortunately exist in all still-supported
-branches.
-
-The test cases added for this generate (after patching) errors that
-mention the value of MaxArraySize, which is platform-dependent.
-Rather than introduce multiple expected-files, use psql's VERBOSITY
-parameter to suppress the printing of the message text.  v11 psql
-lacks that parameter, so omit the tests in that branch.
-
-Our thanks to Pedro Gallegos for reporting this problem.
-
-Security: CVE-2023-5869
-
-CVE: CVE-2023-5869
-Upstream-Status: Backport [https://github.com/postgres/postgres/commit/18b585155a891784ca8985f595ebc0dde94e0d43]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
-
----
- src/backend/utils/adt/arrayfuncs.c   | 85 ++++++++++++++++++++++------
- src/backend/utils/adt/arrayutils.c   |  6 --
- src/include/utils/array.h            |  7 +++
- src/test/regress/expected/arrays.out | 17 ++++++
- src/test/regress/sql/arrays.sql      | 19 +++++++
- 5 files changed, 110 insertions(+), 24 deletions(-)
-
-diff --git a/src/backend/utils/adt/arrayfuncs.c b/src/backend/utils/adt/arrayfuncs.c
-index 949737d..0071f7d 100644
---- a/src/backend/utils/adt/arrayfuncs.c
-+++ b/src/backend/utils/adt/arrayfuncs.c
-@@ -19,6 +19,7 @@
- 
- #include "access/htup_details.h"
- #include "catalog/pg_type.h"
-+#include "common/int.h"
- #include "funcapi.h"
- #include "libpq/pqformat.h"
- #include "nodes/nodeFuncs.h"
-@@ -2334,22 +2335,38 @@ array_set_element(Datum arraydatum,
- 	addedbefore = addedafter = 0;
- 
- 	/*
--	 * Check subscripts
-+	 * Check subscripts.  We assume the existing subscripts passed
-+	 * ArrayCheckBounds, so that dim[i] + lb[i] can be computed without
-+	 * overflow.  But we must beware of other overflows in our calculations of
-+	 * new dim[] values.
- 	 */
- 	if (ndim == 1)
- 	{
- 		if (indx[0] < lb[0])
- 		{
--			addedbefore = lb[0] - indx[0];
--			dim[0] += addedbefore;
-+			/* addedbefore = lb[0] - indx[0]; */
-+			/* dim[0] += addedbefore; */
-+			if (pg_sub_s32_overflow(lb[0], indx[0], &addedbefore) ||
-+				pg_add_s32_overflow(dim[0], addedbefore, &dim[0]))
-+				ereport(ERROR,
-+						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
-+						 errmsg("array size exceeds the maximum allowed (%d)",
-+								(int) MaxArraySize)));
- 			lb[0] = indx[0];
- 			if (addedbefore > 1)
- 				newhasnulls = true; /* will insert nulls */
- 		}
- 		if (indx[0] >= (dim[0] + lb[0]))
- 		{
--			addedafter = indx[0] - (dim[0] + lb[0]) + 1;
--			dim[0] += addedafter;
-+			/* addedafter = indx[0] - (dim[0] + lb[0]) + 1; */
-+			/* dim[0] += addedafter; */
-+			if (pg_sub_s32_overflow(indx[0], dim[0] + lb[0], &addedafter) ||
-+				pg_add_s32_overflow(addedafter, 1, &addedafter) ||
-+				pg_add_s32_overflow(dim[0], addedafter, &dim[0]))
-+				ereport(ERROR,
-+						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
-+						 errmsg("array size exceeds the maximum allowed (%d)",
-+								(int) MaxArraySize)));
- 			if (addedafter > 1)
- 				newhasnulls = true; /* will insert nulls */
- 		}
-@@ -2595,14 +2612,23 @@ array_set_element_expanded(Datum arraydatum,
- 	addedbefore = addedafter = 0;
- 
- 	/*
--	 * Check subscripts (this logic matches original array_set_element)
-+	 * Check subscripts (this logic must match array_set_element).  We assume
-+	 * the existing subscripts passed ArrayCheckBounds, so that dim[i] + lb[i]
-+	 * can be computed without overflow.  But we must beware of other
-+	 * overflows in our calculations of new dim[] values.
- 	 */
- 	if (ndim == 1)
- 	{
- 		if (indx[0] < lb[0])
- 		{
--			addedbefore = lb[0] - indx[0];
--			dim[0] += addedbefore;
-+			/* addedbefore = lb[0] - indx[0]; */
-+			/* dim[0] += addedbefore; */
-+			if (pg_sub_s32_overflow(lb[0], indx[0], &addedbefore) ||
-+				pg_add_s32_overflow(dim[0], addedbefore, &dim[0]))
-+				ereport(ERROR,
-+						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
-+						 errmsg("array size exceeds the maximum allowed (%d)",
-+								(int) MaxArraySize)));
- 			lb[0] = indx[0];
- 			dimschanged = true;
- 			if (addedbefore > 1)
-@@ -2610,8 +2636,15 @@ array_set_element_expanded(Datum arraydatum,
- 		}
- 		if (indx[0] >= (dim[0] + lb[0]))
- 		{
--			addedafter = indx[0] - (dim[0] + lb[0]) + 1;
--			dim[0] += addedafter;
-+			/* addedafter = indx[0] - (dim[0] + lb[0]) + 1; */
-+			/* dim[0] += addedafter; */
-+			if (pg_sub_s32_overflow(indx[0], dim[0] + lb[0], &addedafter) ||
-+				pg_add_s32_overflow(addedafter, 1, &addedafter) ||
-+				pg_add_s32_overflow(dim[0], addedafter, &dim[0]))
-+				ereport(ERROR,
-+						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
-+						 errmsg("array size exceeds the maximum allowed (%d)",
-+								(int) MaxArraySize)));
- 			dimschanged = true;
- 			if (addedafter > 1)
- 				newhasnulls = true; /* will insert nulls */
-@@ -2894,7 +2927,10 @@ array_set_slice(Datum arraydatum,
- 	addedbefore = addedafter = 0;
- 
- 	/*
--	 * Check subscripts
-+	 * Check subscripts.  We assume the existing subscripts passed
-+	 * ArrayCheckBounds, so that dim[i] + lb[i] can be computed without
-+	 * overflow.  But we must beware of other overflows in our calculations of
-+	 * new dim[] values.
- 	 */
- 	if (ndim == 1)
- 	{
-@@ -2909,18 +2945,31 @@ array_set_slice(Datum arraydatum,
- 					 errmsg("upper bound cannot be less than lower bound")));
- 		if (lowerIndx[0] < lb[0])
- 		{
--			if (upperIndx[0] < lb[0] - 1)
--				newhasnulls = true; /* will insert nulls */
--			addedbefore = lb[0] - lowerIndx[0];
--			dim[0] += addedbefore;
-+			/* addedbefore = lb[0] - lowerIndx[0]; */
-+			/* dim[0] += addedbefore; */
-+			if (pg_sub_s32_overflow(lb[0], lowerIndx[0], &addedbefore) ||
-+				pg_add_s32_overflow(dim[0], addedbefore, &dim[0]))
-+				ereport(ERROR,
-+						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
-+						 errmsg("array size exceeds the maximum allowed (%d)",
-+								(int) MaxArraySize)));
- 			lb[0] = lowerIndx[0];
-+			if (addedbefore > 1)
-+				newhasnulls = true; /* will insert nulls */
- 		}
- 		if (upperIndx[0] >= (dim[0] + lb[0]))
- 		{
--			if (lowerIndx[0] > (dim[0] + lb[0]))
-+			/* addedafter = upperIndx[0] - (dim[0] + lb[0]) + 1; */
-+			/* dim[0] += addedafter; */
-+			if (pg_sub_s32_overflow(upperIndx[0], dim[0] + lb[0], &addedafter) ||
-+				pg_add_s32_overflow(addedafter, 1, &addedafter) ||
-+				pg_add_s32_overflow(dim[0], addedafter, &dim[0]))
-+				ereport(ERROR,
-+						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
-+						 errmsg("array size exceeds the maximum allowed (%d)",
-+								(int) MaxArraySize)));
-+			if (addedafter > 1)
- 				newhasnulls = true; /* will insert nulls */
--			addedafter = upperIndx[0] - (dim[0] + lb[0]) + 1;
--			dim[0] += addedafter;
- 		}
- 	}
- 	else
-diff --git a/src/backend/utils/adt/arrayutils.c b/src/backend/utils/adt/arrayutils.c
-index 6988edd..fdaf712 100644
---- a/src/backend/utils/adt/arrayutils.c
-+++ b/src/backend/utils/adt/arrayutils.c
-@@ -64,10 +64,6 @@ ArrayGetOffset0(int n, const int *tup, const int *scale)
-  * This must do overflow checking, since it is used to validate that a user
-  * dimensionality request doesn't overflow what we can handle.
-  *
-- * We limit array sizes to at most about a quarter billion elements,
-- * so that it's not necessary to check for overflow in quite so many
-- * places --- for instance when palloc'ing Datum arrays.
-- *
-  * The multiplication overflow check only works on machines that have int64
-  * arithmetic, but that is nearly all platforms these days, and doing check
-  * divides for those that don't seems way too expensive.
-@@ -78,8 +74,6 @@ ArrayGetNItems(int ndim, const int *dims)
- 	int32		ret;
- 	int			i;
- 
--#define MaxArraySize ((Size) (MaxAllocSize / sizeof(Datum)))
--
- 	if (ndim <= 0)
- 		return 0;
- 	ret = 1;
-diff --git a/src/include/utils/array.h b/src/include/utils/array.h
-index 4ae6c3b..0d6db51 100644
---- a/src/include/utils/array.h
-+++ b/src/include/utils/array.h
-@@ -74,6 +74,13 @@ struct ExprContext;
-  */
- #define MAXDIM 6
- 
-+/*
-+ * Maximum number of elements in an array.  We limit this to at most about a
-+ * quarter billion elements, so that it's not necessary to check for overflow
-+ * in quite so many places --- for instance when palloc'ing Datum arrays.
-+ */
-+#define MaxArraySize ((Size) (MaxAllocSize / sizeof(Datum)))
-+
- /*
-  * Arrays are varlena objects, so must meet the varlena convention that
-  * the first int32 of the object contains the total object size in bytes.
-diff --git a/src/test/regress/expected/arrays.out b/src/test/regress/expected/arrays.out
-index 4923cf3..7f9b693 100644
---- a/src/test/regress/expected/arrays.out
-+++ b/src/test/regress/expected/arrays.out
-@@ -1380,6 +1380,23 @@ insert into arr_pk_tbl(pk, f1[1:2]) values (1, '{6,7,8}') on conflict (pk)
- -- then you didn't get an indexscan plan, and something is busted.
- reset enable_seqscan;
- reset enable_bitmapscan;
-+-- test subscript overflow detection
-+-- The normal error message includes a platform-dependent limit,
-+-- so suppress it to avoid needing multiple expected-files.
-+\set VERBOSITY sqlstate
-+insert into arr_pk_tbl values(10, '[-2147483648:-2147483647]={1,2}');
-+update arr_pk_tbl set f1[2147483647] = 42 where pk = 10;
-+ERROR:  54000
-+update arr_pk_tbl set f1[2147483646:2147483647] = array[4,2] where pk = 10;
-+ERROR:  54000
-+-- also exercise the expanded-array case
-+do $$ declare a int[];
-+begin
-+  a := '[-2147483648:-2147483647]={1,2}'::int[];
-+  a[2147483647] := 42;
-+end $$;
-+ERROR:  54000
-+\set VERBOSITY default
- -- test [not] (like|ilike) (any|all) (...)
- select 'foo' like any (array['%a', '%o']); -- t
-  ?column? 
-diff --git a/src/test/regress/sql/arrays.sql b/src/test/regress/sql/arrays.sql
-index 5eedc4c..3ad8bdf 100644
---- a/src/test/regress/sql/arrays.sql
-+++ b/src/test/regress/sql/arrays.sql
-@@ -415,6 +415,25 @@ insert into arr_pk_tbl(pk, f1[1:2]) values (1, '{6,7,8}') on conflict (pk)
- reset enable_seqscan;
- reset enable_bitmapscan;
- 
-+-- test subscript overflow detection
-+
-+-- The normal error message includes a platform-dependent limit,
-+-- so suppress it to avoid needing multiple expected-files.
-+\set VERBOSITY sqlstate
-+
-+insert into arr_pk_tbl values(10, '[-2147483648:-2147483647]={1,2}');
-+update arr_pk_tbl set f1[2147483647] = 42 where pk = 10;
-+update arr_pk_tbl set f1[2147483646:2147483647] = array[4,2] where pk = 10;
-+
-+-- also exercise the expanded-array case
-+do $$ declare a int[];
-+begin
-+  a := '[-2147483648:-2147483647]={1,2}'::int[];
-+  a[2147483647] := 42;
-+end $$;
-+
-+\set VERBOSITY default
-+
- -- test [not] (like|ilike) (any|all) (...)
- select 'foo' like any (array['%a', '%o']); -- t
- select 'foo' like any (array['%a', '%b']); -- f
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch
deleted file mode 100644
index b1a16e466..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From  3a9b18b3095366cd0c4305441d426d04572d88c1 Mon Sep 17 00:00:00 2001
-From: Noah Misch <noah@leadboat.com>
-Date: Tue, 21 Nov 2023 11:49:50 +0000
-Subject: [PATCH] Ban role pg_signal_backend from more superuser backend types.
-
-Documentation says it cannot signal "a backend owned by a superuser".
-On the contrary, it could signal background workers, including the
-logical replication launcher.  It could signal autovacuum workers and
-the autovacuum launcher.  Block all that.  Signaling autovacuum workers
-and those two launchers doesn't stall progress beyond what one could
-achieve other ways.  If a cluster uses a non-core extension with a
-background worker that does not auto-restart, this could create a denial
-of service with respect to that background worker.  A background worker
-with bugs in its code for responding to terminations or cancellations
-could experience those bugs at a time the pg_signal_backend member
-chooses.  Back-patch to v11 (all supported versions).
-
-Reviewed by Jelte Fennema-Nio.  Reported by Hemanth Sandrana and
-Mahendrakar Srinivasarao.
-
-Security: CVE-2023-5870
-
-CVE: CVE-2023-5870
-Upstream-Status: Backport [https://github.com/postgres/postgres/commit/3a9b18b3095366cd0c4305441d426d04572d88c1]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
-
----
- src/backend/storage/ipc/signalfuncs.c    |  9 +++++++--
- src/test/regress/expected/privileges.out | 18 ++++++++++++++++++
- src/test/regress/sql/privileges.sql      | 15 +++++++++++++++
- 3 files changed, 40 insertions(+), 2 deletions(-)
-
-diff --git a/src/backend/storage/ipc/signalfuncs.c b/src/backend/storage/ipc/signalfuncs.c
-index de69d60..b6ff412 100644
---- a/src/backend/storage/ipc/signalfuncs.c
-+++ b/src/backend/storage/ipc/signalfuncs.c
-@@ -69,8 +69,13 @@ pg_signal_backend(int pid, int sig)
- 		return SIGNAL_BACKEND_ERROR;
- 	}
- 
--	/* Only allow superusers to signal superuser-owned backends. */
--	if (superuser_arg(proc->roleId) && !superuser())
-+	/*
-+	 * Only allow superusers to signal superuser-owned backends.  Any process
-+	 * not advertising a role might have the importance of a superuser-owned
-+	 * backend, so treat it that way.
-+	 */
-+	if ((!OidIsValid(proc->roleId) || superuser_arg(proc->roleId)) &&
-+		!superuser())
- 		return SIGNAL_BACKEND_NOSUPERUSER;
- 
- 	/* Users can signal backends they have role membership in. */
-diff --git a/src/test/regress/expected/privileges.out b/src/test/regress/expected/privileges.out
-index b3c3b25..90e70f9 100644
---- a/src/test/regress/expected/privileges.out
-+++ b/src/test/regress/expected/privileges.out
-@@ -1846,6 +1846,24 @@ SELECT * FROM pg_largeobject LIMIT 0;
- SET SESSION AUTHORIZATION regress_priv_user1;
- SELECT * FROM pg_largeobject LIMIT 0;			-- to be denied
- ERROR:  permission denied for table pg_largeobject
-+-- pg_signal_backend can't signal superusers
-+RESET SESSION AUTHORIZATION;
-+BEGIN;
-+CREATE OR REPLACE FUNCTION terminate_nothrow(pid int) RETURNS bool
-+	LANGUAGE plpgsql SECURITY DEFINER SET client_min_messages = error AS $$
-+BEGIN
-+	RETURN pg_terminate_backend($1);
-+EXCEPTION WHEN OTHERS THEN
-+	RETURN false;
-+END$$;
-+ALTER FUNCTION terminate_nothrow OWNER TO pg_signal_backend;
-+SELECT backend_type FROM pg_stat_activity
-+WHERE CASE WHEN COALESCE(usesysid, 10) = 10 THEN terminate_nothrow(pid) END;
-+ backend_type
-+--------------
-+(0 rows)
-+
-+ROLLBACK;
- -- test pg_database_owner
- RESET SESSION AUTHORIZATION;
- GRANT pg_database_owner TO regress_priv_user1;
-diff --git a/src/test/regress/sql/privileges.sql b/src/test/regress/sql/privileges.sql
-index af05f95..f96143e 100644
---- a/src/test/regress/sql/privileges.sql
-+++ b/src/test/regress/sql/privileges.sql
-@@ -1133,6 +1133,21 @@ SELECT * FROM pg_largeobject LIMIT 0;
- SET SESSION AUTHORIZATION regress_priv_user1;
- SELECT * FROM pg_largeobject LIMIT 0;			-- to be denied
- 
-+-- pg_signal_backend can't signal superusers
-+RESET SESSION AUTHORIZATION;
-+BEGIN;
-+CREATE OR REPLACE FUNCTION terminate_nothrow(pid int) RETURNS bool
-+	LANGUAGE plpgsql SECURITY DEFINER SET client_min_messages = error AS $$
-+BEGIN
-+	RETURN pg_terminate_backend($1);
-+EXCEPTION WHEN OTHERS THEN
-+	RETURN false;
-+END$$;
-+ALTER FUNCTION terminate_nothrow OWNER TO pg_signal_backend;
-+SELECT backend_type FROM pg_stat_activity
-+WHERE CASE WHEN COALESCE(usesysid, 10) = 10 THEN terminate_nothrow(pid) END;
-+ROLLBACK;
-+
- -- test pg_database_owner
- RESET SESSION AUTHORIZATION;
- GRANT pg_database_owner TO regress_priv_user1;
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.11.bb
similarity index 61%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.11.bb
index a879de20c..8a8c3b9f1 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.11.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c31f662bb2bfb3b4187fe9a53e0ffe7c"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=89afbb2d7716371015101c2b2cb4297a"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -9,12 +9,9 @@ SRC_URI += "\
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://0001-config_info.c-not-expose-build-info.patch \
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
-   file://CVE-2023-5868.patch \
-   file://CVE-2023-5869.patch \
-   file://CVE-2023-5870.patch \
 "
 
-SRC_URI[sha256sum] = "b1fe3ba9b1a7f3a9637dd1656dfdad2889016073fd4d35f13b50143cbbb6a8ef"
+SRC_URI[sha256sum] = "a670bd7dce22dcad4297b261136b3b1d4a09a6f541719562aa14ca63bf2968a8"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.40.0


