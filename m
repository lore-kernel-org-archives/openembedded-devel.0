Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE110C07E97
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 07:19:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26281.1701242332075474259
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 23:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pY8+7mUT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=069737c2c0=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AT6SRSA001420
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:18:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Nw8o+
	lFYkKrQY4KqlKDBB4FbnRxhv+SmwjzUO4pLSa4=; b=pY8+7mUT1x5yxqkiI+6/W
	1POFtjsqkJbYu9pmjRhQLxUgncRsN/T/qfIT5yZxAWzJcOp9//Or8CEyVD6h2bxm
	ph2Yc6KrjrJyIjWKxeuEX3VUJpmFOyrNTGdrbLpZFR37IIVQHTL6RJHhOde4UhPE
	iO2yMQ0x589doJBGR2ANd9zgQ2yUKsvkFzYRg9YiLGqBxCrnpgR3DH2DlQ8HzYKs
	OivTRUsUDLgZWXiGXFCVW5AVdar1l3jYYJUjI9UbF847carQaKJPog4Ynden5kTk
	1hNvVKJYAaPBr4AomIdIK4lqu+EOwam+1+Sh23CgI0CNo32wxwS1dmTAiSU/neAe
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3unve1r5ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 23:18:51 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Nov 2023 23:18:56 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [OE][meta-oe][kirkstone][PATCH 1/1] postgresql: fix CVE-2023-5868 CVE-2023-5869 CVE-2023-5870
Date: Wed, 29 Nov 2023 07:18:31 +0000
Message-ID: <20231129071831.2933829-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: osAyQ8vWfBGXNDUMbyGDuWzDLjQ7IJwV
X-Proofpoint-ORIG-GUID: osAyQ8vWfBGXNDUMbyGDuWzDLjQ7IJwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311290052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Nov 2023 07:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107132

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2023-5868:
postgresql: Compute aggregate argument types correctly in
transformAggregateCall()

CVE-2023-5869:
postgresql: Detect integer overflow while computing new
array dimensions

CVE-2023-5870:
postgresql: Ban role pg_signal_backend from more superuser
backend types.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-5868
https://nvd.nist.gov/vuln/detail/CVE-2023-5869
https://nvd.nist.gov/vuln/detail/CVE-2023-5870

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../postgresql/files/CVE-2023-5868.patch      | 125 ++++++++
 .../postgresql/files/CVE-2023-5869.patch      | 294 ++++++++++++++++++
 .../postgresql/files/CVE-2023-5870.patch      | 108 +++++++
 .../recipes-dbs/postgresql/postgresql_14.9.bb |   3 +
 4 files changed, 530 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
new file mode 100644
index 0000000000..50953f49b2
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5868.patch
@@ -0,0 +1,125 @@
+From 3b0776fde56763c549df35ce9750f3399bc710b2 Mon Sep 17 00:00:00 2001
+From: Tom Lane <tgl@sss.pgh.pa.us>
+Date: Tue, 21 Nov 2023 11:37:27 +0000
+Subject: [PATCH] Compute aggregate argument types correctly in
+
+ transformAggregateCall().
+
+transformAggregateCall() captures the datatypes of the aggregate's
+arguments immediately to construct the Aggref.aggargtypes list.
+This seems reasonable because the arguments have already been
+transformed --- but there is an edge case where they haven't been.
+Specifically, if we have an unknown-type literal in an ANY argument
+position, nothing will have been done with it earlier.  But if we
+also have DISTINCT, then addTargetToGroupList() converts the literal
+to "text" type, resulting in the aggargtypes list not matching the
+actual runtime type of the argument.  The end result is that the
+aggregate tries to interpret a "text" value as being of type
+"unknown", that is a zero-terminated C string.  If the text value
+contains no zero bytes, this could result in disclosure of server
+memory following the text literal value.
+
+To fix, move the collection of the aggargtypes list to the end
+of transformAggregateCall(), after DISTINCT has been handled.
+This requires slightly more code, but not a great deal.
+
+Our thanks to Jingzhou Fu for reporting this problem.
+
+Security: CVE-2023-5868
+
+CVE: CVE-2023-5868
+Upstream-Status: Backport [https://github.com/postgres/postgres/commit/3b0776fde56763c549df35ce9750f3399bc710b2]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+
+---
+ src/backend/parser/parse_agg.c      | 35 +++++++++++++++++++----------
+ src/test/regress/expected/jsonb.out |  7 ++++++
+ src/test/regress/sql/jsonb.sql      |  3 +++
+ 3 files changed, 33 insertions(+), 12 deletions(-)
+
+diff --git a/src/backend/parser/parse_agg.c b/src/backend/parser/parse_agg.c
+index 828cd99..90cf150 100644
+--- a/src/backend/parser/parse_agg.c
++++ b/src/backend/parser/parse_agg.c
+@@ -110,18 +110,6 @@ transformAggregateCall(ParseState *pstate, Aggref *agg,
+ 	int			save_next_resno;
+ 	ListCell   *lc;
+ 
+-	/*
+-	 * Before separating the args into direct and aggregated args, make a list
+-	 * of their data type OIDs for use later.
+-	 */
+-	foreach(lc, args)
+-	{
+-		Expr	   *arg = (Expr *) lfirst(lc);
+-
+-		argtypes = lappend_oid(argtypes, exprType((Node *) arg));
+-	}
+-	agg->aggargtypes = argtypes;
+-
+ 	if (AGGKIND_IS_ORDERED_SET(agg->aggkind))
+ 	{
+ 		/*
+@@ -233,6 +221,29 @@ transformAggregateCall(ParseState *pstate, Aggref *agg,
+ 	agg->aggorder = torder;
+ 	agg->aggdistinct = tdistinct;
+ 
++	/*
++	 * Now build the aggargtypes list with the type OIDs of the direct and
++	 * aggregated args, ignoring any resjunk entries that might have been
++	 * added by ORDER BY/DISTINCT processing.  We can't do this earlier
++	 * because said processing can modify some args' data types, in particular
++	 * by resolving previously-unresolved "unknown" literals.
++	 */
++	foreach(lc, agg->aggdirectargs)
++	{
++		Expr	   *arg = (Expr *) lfirst(lc);
++
++		argtypes = lappend_oid(argtypes, exprType((Node *) arg));
++	}
++	foreach(lc, tlist)
++	{
++		TargetEntry *tle = (TargetEntry *) lfirst(lc);
++
++		if (tle->resjunk)
++			continue;			/* ignore junk */
++		argtypes = lappend_oid(argtypes, exprType((Node *) tle->expr));
++	}
++	agg->aggargtypes = argtypes;
++
+ 	check_agglevels_and_constraints(pstate, (Node *) agg);
+ }
+ 
+diff --git a/src/test/regress/expected/jsonb.out b/src/test/regress/expected/jsonb.out
+index bec355d..eb7f410 100644
+--- a/src/test/regress/expected/jsonb.out
++++ b/src/test/regress/expected/jsonb.out
+@@ -1558,6 +1558,13 @@ SELECT jsonb_object_agg(name, type) FROM foo;
+ INSERT INTO foo VALUES (999999, NULL, 'bar');
+ SELECT jsonb_object_agg(name, type) FROM foo;
+ ERROR:  field name must not be null
++-- edge case for parser
++SELECT jsonb_object_agg(DISTINCT 'a', 'abc');
++ jsonb_object_agg
++------------------
++ {"a": "abc"}
++(1 row)
++
+ -- jsonb_object
+ -- empty object, one dimension
+ SELECT jsonb_object('{}');
+diff --git a/src/test/regress/sql/jsonb.sql b/src/test/regress/sql/jsonb.sql
+index f8d5960..040e1ba 100644
+--- a/src/test/regress/sql/jsonb.sql
++++ b/src/test/regress/sql/jsonb.sql
+@@ -397,6 +397,9 @@ SELECT jsonb_object_agg(name, type) FROM foo;
+ INSERT INTO foo VALUES (999999, NULL, 'bar');
+ SELECT jsonb_object_agg(name, type) FROM foo;
+ 
++-- edge case for parser
++SELECT jsonb_object_agg(DISTINCT 'a', 'abc');
++
+ -- jsonb_object
+ 
+ -- empty object, one dimension
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
new file mode 100644
index 0000000000..cef2ab2253
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5869.patch
@@ -0,0 +1,294 @@
+From 18b585155a891784ca8985f595ebc0dde94e0d43 Mon Sep 17 00:00:00 2001
+From: Tom Lane <tgl@sss.pgh.pa.us>
+Date: Tue, 21 Nov 2023 11:43:00 +0000
+Subject: [PATCH] Detect integer overflow while computing new array dimensions.
+
+array_set_element() and related functions allow an array to be
+enlarged by assigning to subscripts outside the current array bounds.
+While these places were careful to check that the new bounds are
+allowable, they neglected to consider the risk of integer overflow
+in computing the new bounds.  In edge cases, we could compute new
+bounds that are invalid but get past the subsequent checks,
+allowing bad things to happen.  Memory stomps that are potentially
+exploitable for arbitrary code execution are possible, and so is
+disclosure of server memory.
+
+To fix, perform the hazardous computations using overflow-detecting
+arithmetic routines, which fortunately exist in all still-supported
+branches.
+
+The test cases added for this generate (after patching) errors that
+mention the value of MaxArraySize, which is platform-dependent.
+Rather than introduce multiple expected-files, use psql's VERBOSITY
+parameter to suppress the printing of the message text.  v11 psql
+lacks that parameter, so omit the tests in that branch.
+
+Our thanks to Pedro Gallegos for reporting this problem.
+
+Security: CVE-2023-5869
+
+CVE: CVE-2023-5869
+Upstream-Status: Backport [https://github.com/postgres/postgres/commit/18b585155a891784ca8985f595ebc0dde94e0d43]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+
+---
+ src/backend/utils/adt/arrayfuncs.c   | 85 ++++++++++++++++++++++------
+ src/backend/utils/adt/arrayutils.c   |  6 --
+ src/include/utils/array.h            |  7 +++
+ src/test/regress/expected/arrays.out | 17 ++++++
+ src/test/regress/sql/arrays.sql      | 19 +++++++
+ 5 files changed, 110 insertions(+), 24 deletions(-)
+
+diff --git a/src/backend/utils/adt/arrayfuncs.c b/src/backend/utils/adt/arrayfuncs.c
+index 949737d..0071f7d 100644
+--- a/src/backend/utils/adt/arrayfuncs.c
++++ b/src/backend/utils/adt/arrayfuncs.c
+@@ -19,6 +19,7 @@
+ 
+ #include "access/htup_details.h"
+ #include "catalog/pg_type.h"
++#include "common/int.h"
+ #include "funcapi.h"
+ #include "libpq/pqformat.h"
+ #include "nodes/nodeFuncs.h"
+@@ -2334,22 +2335,38 @@ array_set_element(Datum arraydatum,
+ 	addedbefore = addedafter = 0;
+ 
+ 	/*
+-	 * Check subscripts
++	 * Check subscripts.  We assume the existing subscripts passed
++	 * ArrayCheckBounds, so that dim[i] + lb[i] can be computed without
++	 * overflow.  But we must beware of other overflows in our calculations of
++	 * new dim[] values.
+ 	 */
+ 	if (ndim == 1)
+ 	{
+ 		if (indx[0] < lb[0])
+ 		{
+-			addedbefore = lb[0] - indx[0];
+-			dim[0] += addedbefore;
++			/* addedbefore = lb[0] - indx[0]; */
++			/* dim[0] += addedbefore; */
++			if (pg_sub_s32_overflow(lb[0], indx[0], &addedbefore) ||
++				pg_add_s32_overflow(dim[0], addedbefore, &dim[0]))
++				ereport(ERROR,
++						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
++						 errmsg("array size exceeds the maximum allowed (%d)",
++								(int) MaxArraySize)));
+ 			lb[0] = indx[0];
+ 			if (addedbefore > 1)
+ 				newhasnulls = true; /* will insert nulls */
+ 		}
+ 		if (indx[0] >= (dim[0] + lb[0]))
+ 		{
+-			addedafter = indx[0] - (dim[0] + lb[0]) + 1;
+-			dim[0] += addedafter;
++			/* addedafter = indx[0] - (dim[0] + lb[0]) + 1; */
++			/* dim[0] += addedafter; */
++			if (pg_sub_s32_overflow(indx[0], dim[0] + lb[0], &addedafter) ||
++				pg_add_s32_overflow(addedafter, 1, &addedafter) ||
++				pg_add_s32_overflow(dim[0], addedafter, &dim[0]))
++				ereport(ERROR,
++						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
++						 errmsg("array size exceeds the maximum allowed (%d)",
++								(int) MaxArraySize)));
+ 			if (addedafter > 1)
+ 				newhasnulls = true; /* will insert nulls */
+ 		}
+@@ -2595,14 +2612,23 @@ array_set_element_expanded(Datum arraydatum,
+ 	addedbefore = addedafter = 0;
+ 
+ 	/*
+-	 * Check subscripts (this logic matches original array_set_element)
++	 * Check subscripts (this logic must match array_set_element).  We assume
++	 * the existing subscripts passed ArrayCheckBounds, so that dim[i] + lb[i]
++	 * can be computed without overflow.  But we must beware of other
++	 * overflows in our calculations of new dim[] values.
+ 	 */
+ 	if (ndim == 1)
+ 	{
+ 		if (indx[0] < lb[0])
+ 		{
+-			addedbefore = lb[0] - indx[0];
+-			dim[0] += addedbefore;
++			/* addedbefore = lb[0] - indx[0]; */
++			/* dim[0] += addedbefore; */
++			if (pg_sub_s32_overflow(lb[0], indx[0], &addedbefore) ||
++				pg_add_s32_overflow(dim[0], addedbefore, &dim[0]))
++				ereport(ERROR,
++						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
++						 errmsg("array size exceeds the maximum allowed (%d)",
++								(int) MaxArraySize)));
+ 			lb[0] = indx[0];
+ 			dimschanged = true;
+ 			if (addedbefore > 1)
+@@ -2610,8 +2636,15 @@ array_set_element_expanded(Datum arraydatum,
+ 		}
+ 		if (indx[0] >= (dim[0] + lb[0]))
+ 		{
+-			addedafter = indx[0] - (dim[0] + lb[0]) + 1;
+-			dim[0] += addedafter;
++			/* addedafter = indx[0] - (dim[0] + lb[0]) + 1; */
++			/* dim[0] += addedafter; */
++			if (pg_sub_s32_overflow(indx[0], dim[0] + lb[0], &addedafter) ||
++				pg_add_s32_overflow(addedafter, 1, &addedafter) ||
++				pg_add_s32_overflow(dim[0], addedafter, &dim[0]))
++				ereport(ERROR,
++						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
++						 errmsg("array size exceeds the maximum allowed (%d)",
++								(int) MaxArraySize)));
+ 			dimschanged = true;
+ 			if (addedafter > 1)
+ 				newhasnulls = true; /* will insert nulls */
+@@ -2894,7 +2927,10 @@ array_set_slice(Datum arraydatum,
+ 	addedbefore = addedafter = 0;
+ 
+ 	/*
+-	 * Check subscripts
++	 * Check subscripts.  We assume the existing subscripts passed
++	 * ArrayCheckBounds, so that dim[i] + lb[i] can be computed without
++	 * overflow.  But we must beware of other overflows in our calculations of
++	 * new dim[] values.
+ 	 */
+ 	if (ndim == 1)
+ 	{
+@@ -2909,18 +2945,31 @@ array_set_slice(Datum arraydatum,
+ 					 errmsg("upper bound cannot be less than lower bound")));
+ 		if (lowerIndx[0] < lb[0])
+ 		{
+-			if (upperIndx[0] < lb[0] - 1)
+-				newhasnulls = true; /* will insert nulls */
+-			addedbefore = lb[0] - lowerIndx[0];
+-			dim[0] += addedbefore;
++			/* addedbefore = lb[0] - lowerIndx[0]; */
++			/* dim[0] += addedbefore; */
++			if (pg_sub_s32_overflow(lb[0], lowerIndx[0], &addedbefore) ||
++				pg_add_s32_overflow(dim[0], addedbefore, &dim[0]))
++				ereport(ERROR,
++						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
++						 errmsg("array size exceeds the maximum allowed (%d)",
++								(int) MaxArraySize)));
+ 			lb[0] = lowerIndx[0];
++			if (addedbefore > 1)
++				newhasnulls = true; /* will insert nulls */
+ 		}
+ 		if (upperIndx[0] >= (dim[0] + lb[0]))
+ 		{
+-			if (lowerIndx[0] > (dim[0] + lb[0]))
++			/* addedafter = upperIndx[0] - (dim[0] + lb[0]) + 1; */
++			/* dim[0] += addedafter; */
++			if (pg_sub_s32_overflow(upperIndx[0], dim[0] + lb[0], &addedafter) ||
++				pg_add_s32_overflow(addedafter, 1, &addedafter) ||
++				pg_add_s32_overflow(dim[0], addedafter, &dim[0]))
++				ereport(ERROR,
++						(errcode(ERRCODE_PROGRAM_LIMIT_EXCEEDED),
++						 errmsg("array size exceeds the maximum allowed (%d)",
++								(int) MaxArraySize)));
++			if (addedafter > 1)
+ 				newhasnulls = true; /* will insert nulls */
+-			addedafter = upperIndx[0] - (dim[0] + lb[0]) + 1;
+-			dim[0] += addedafter;
+ 		}
+ 	}
+ 	else
+diff --git a/src/backend/utils/adt/arrayutils.c b/src/backend/utils/adt/arrayutils.c
+index 6988edd..fdaf712 100644
+--- a/src/backend/utils/adt/arrayutils.c
++++ b/src/backend/utils/adt/arrayutils.c
+@@ -64,10 +64,6 @@ ArrayGetOffset0(int n, const int *tup, const int *scale)
+  * This must do overflow checking, since it is used to validate that a user
+  * dimensionality request doesn't overflow what we can handle.
+  *
+- * We limit array sizes to at most about a quarter billion elements,
+- * so that it's not necessary to check for overflow in quite so many
+- * places --- for instance when palloc'ing Datum arrays.
+- *
+  * The multiplication overflow check only works on machines that have int64
+  * arithmetic, but that is nearly all platforms these days, and doing check
+  * divides for those that don't seems way too expensive.
+@@ -78,8 +74,6 @@ ArrayGetNItems(int ndim, const int *dims)
+ 	int32		ret;
+ 	int			i;
+ 
+-#define MaxArraySize ((Size) (MaxAllocSize / sizeof(Datum)))
+-
+ 	if (ndim <= 0)
+ 		return 0;
+ 	ret = 1;
+diff --git a/src/include/utils/array.h b/src/include/utils/array.h
+index 4ae6c3b..0d6db51 100644
+--- a/src/include/utils/array.h
++++ b/src/include/utils/array.h
+@@ -74,6 +74,13 @@ struct ExprContext;
+  */
+ #define MAXDIM 6
+ 
++/*
++ * Maximum number of elements in an array.  We limit this to at most about a
++ * quarter billion elements, so that it's not necessary to check for overflow
++ * in quite so many places --- for instance when palloc'ing Datum arrays.
++ */
++#define MaxArraySize ((Size) (MaxAllocSize / sizeof(Datum)))
++
+ /*
+  * Arrays are varlena objects, so must meet the varlena convention that
+  * the first int32 of the object contains the total object size in bytes.
+diff --git a/src/test/regress/expected/arrays.out b/src/test/regress/expected/arrays.out
+index 4923cf3..7f9b693 100644
+--- a/src/test/regress/expected/arrays.out
++++ b/src/test/regress/expected/arrays.out
+@@ -1380,6 +1380,23 @@ insert into arr_pk_tbl(pk, f1[1:2]) values (1, '{6,7,8}') on conflict (pk)
+ -- then you didn't get an indexscan plan, and something is busted.
+ reset enable_seqscan;
+ reset enable_bitmapscan;
++-- test subscript overflow detection
++-- The normal error message includes a platform-dependent limit,
++-- so suppress it to avoid needing multiple expected-files.
++\set VERBOSITY sqlstate
++insert into arr_pk_tbl values(10, '[-2147483648:-2147483647]={1,2}');
++update arr_pk_tbl set f1[2147483647] = 42 where pk = 10;
++ERROR:  54000
++update arr_pk_tbl set f1[2147483646:2147483647] = array[4,2] where pk = 10;
++ERROR:  54000
++-- also exercise the expanded-array case
++do $$ declare a int[];
++begin
++  a := '[-2147483648:-2147483647]={1,2}'::int[];
++  a[2147483647] := 42;
++end $$;
++ERROR:  54000
++\set VERBOSITY default
+ -- test [not] (like|ilike) (any|all) (...)
+ select 'foo' like any (array['%a', '%o']); -- t
+  ?column? 
+diff --git a/src/test/regress/sql/arrays.sql b/src/test/regress/sql/arrays.sql
+index 5eedc4c..3ad8bdf 100644
+--- a/src/test/regress/sql/arrays.sql
++++ b/src/test/regress/sql/arrays.sql
+@@ -415,6 +415,25 @@ insert into arr_pk_tbl(pk, f1[1:2]) values (1, '{6,7,8}') on conflict (pk)
+ reset enable_seqscan;
+ reset enable_bitmapscan;
+ 
++-- test subscript overflow detection
++
++-- The normal error message includes a platform-dependent limit,
++-- so suppress it to avoid needing multiple expected-files.
++\set VERBOSITY sqlstate
++
++insert into arr_pk_tbl values(10, '[-2147483648:-2147483647]={1,2}');
++update arr_pk_tbl set f1[2147483647] = 42 where pk = 10;
++update arr_pk_tbl set f1[2147483646:2147483647] = array[4,2] where pk = 10;
++
++-- also exercise the expanded-array case
++do $$ declare a int[];
++begin
++  a := '[-2147483648:-2147483647]={1,2}'::int[];
++  a[2147483647] := 42;
++end $$;
++
++\set VERBOSITY default
++
+ -- test [not] (like|ilike) (any|all) (...)
+ select 'foo' like any (array['%a', '%o']); -- t
+ select 'foo' like any (array['%a', '%b']); -- f
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch
new file mode 100644
index 0000000000..b1a16e4660
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-5870.patch
@@ -0,0 +1,108 @@
+From  3a9b18b3095366cd0c4305441d426d04572d88c1 Mon Sep 17 00:00:00 2001
+From: Noah Misch <noah@leadboat.com>
+Date: Tue, 21 Nov 2023 11:49:50 +0000
+Subject: [PATCH] Ban role pg_signal_backend from more superuser backend types.
+
+Documentation says it cannot signal "a backend owned by a superuser".
+On the contrary, it could signal background workers, including the
+logical replication launcher.  It could signal autovacuum workers and
+the autovacuum launcher.  Block all that.  Signaling autovacuum workers
+and those two launchers doesn't stall progress beyond what one could
+achieve other ways.  If a cluster uses a non-core extension with a
+background worker that does not auto-restart, this could create a denial
+of service with respect to that background worker.  A background worker
+with bugs in its code for responding to terminations or cancellations
+could experience those bugs at a time the pg_signal_backend member
+chooses.  Back-patch to v11 (all supported versions).
+
+Reviewed by Jelte Fennema-Nio.  Reported by Hemanth Sandrana and
+Mahendrakar Srinivasarao.
+
+Security: CVE-2023-5870
+
+CVE: CVE-2023-5870
+Upstream-Status: Backport [https://github.com/postgres/postgres/commit/3a9b18b3095366cd0c4305441d426d04572d88c1]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+
+---
+ src/backend/storage/ipc/signalfuncs.c    |  9 +++++++--
+ src/test/regress/expected/privileges.out | 18 ++++++++++++++++++
+ src/test/regress/sql/privileges.sql      | 15 +++++++++++++++
+ 3 files changed, 40 insertions(+), 2 deletions(-)
+
+diff --git a/src/backend/storage/ipc/signalfuncs.c b/src/backend/storage/ipc/signalfuncs.c
+index de69d60..b6ff412 100644
+--- a/src/backend/storage/ipc/signalfuncs.c
++++ b/src/backend/storage/ipc/signalfuncs.c
+@@ -69,8 +69,13 @@ pg_signal_backend(int pid, int sig)
+ 		return SIGNAL_BACKEND_ERROR;
+ 	}
+ 
+-	/* Only allow superusers to signal superuser-owned backends. */
+-	if (superuser_arg(proc->roleId) && !superuser())
++	/*
++	 * Only allow superusers to signal superuser-owned backends.  Any process
++	 * not advertising a role might have the importance of a superuser-owned
++	 * backend, so treat it that way.
++	 */
++	if ((!OidIsValid(proc->roleId) || superuser_arg(proc->roleId)) &&
++		!superuser())
+ 		return SIGNAL_BACKEND_NOSUPERUSER;
+ 
+ 	/* Users can signal backends they have role membership in. */
+diff --git a/src/test/regress/expected/privileges.out b/src/test/regress/expected/privileges.out
+index b3c3b25..90e70f9 100644
+--- a/src/test/regress/expected/privileges.out
++++ b/src/test/regress/expected/privileges.out
+@@ -1846,6 +1846,24 @@ SELECT * FROM pg_largeobject LIMIT 0;
+ SET SESSION AUTHORIZATION regress_priv_user1;
+ SELECT * FROM pg_largeobject LIMIT 0;			-- to be denied
+ ERROR:  permission denied for table pg_largeobject
++-- pg_signal_backend can't signal superusers
++RESET SESSION AUTHORIZATION;
++BEGIN;
++CREATE OR REPLACE FUNCTION terminate_nothrow(pid int) RETURNS bool
++	LANGUAGE plpgsql SECURITY DEFINER SET client_min_messages = error AS $$
++BEGIN
++	RETURN pg_terminate_backend($1);
++EXCEPTION WHEN OTHERS THEN
++	RETURN false;
++END$$;
++ALTER FUNCTION terminate_nothrow OWNER TO pg_signal_backend;
++SELECT backend_type FROM pg_stat_activity
++WHERE CASE WHEN COALESCE(usesysid, 10) = 10 THEN terminate_nothrow(pid) END;
++ backend_type
++--------------
++(0 rows)
++
++ROLLBACK;
+ -- test pg_database_owner
+ RESET SESSION AUTHORIZATION;
+ GRANT pg_database_owner TO regress_priv_user1;
+diff --git a/src/test/regress/sql/privileges.sql b/src/test/regress/sql/privileges.sql
+index af05f95..f96143e 100644
+--- a/src/test/regress/sql/privileges.sql
++++ b/src/test/regress/sql/privileges.sql
+@@ -1133,6 +1133,21 @@ SELECT * FROM pg_largeobject LIMIT 0;
+ SET SESSION AUTHORIZATION regress_priv_user1;
+ SELECT * FROM pg_largeobject LIMIT 0;			-- to be denied
+ 
++-- pg_signal_backend can't signal superusers
++RESET SESSION AUTHORIZATION;
++BEGIN;
++CREATE OR REPLACE FUNCTION terminate_nothrow(pid int) RETURNS bool
++	LANGUAGE plpgsql SECURITY DEFINER SET client_min_messages = error AS $$
++BEGIN
++	RETURN pg_terminate_backend($1);
++EXCEPTION WHEN OTHERS THEN
++	RETURN false;
++END$$;
++ALTER FUNCTION terminate_nothrow OWNER TO pg_signal_backend;
++SELECT backend_type FROM pg_stat_activity
++WHERE CASE WHEN COALESCE(usesysid, 10) = 10 THEN terminate_nothrow(pid) END;
++ROLLBACK;
++
+ -- test pg_database_owner
+ RESET SESSION AUTHORIZATION;
+ GRANT pg_database_owner TO regress_priv_user1;
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
index f779ea7abd..a879de20cc 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
@@ -9,6 +9,9 @@ SRC_URI += "\
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://0001-config_info.c-not-expose-build-info.patch \
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
+   file://CVE-2023-5868.patch \
+   file://CVE-2023-5869.patch \
+   file://CVE-2023-5870.patch \
 "
 
 SRC_URI[sha256sum] = "b1fe3ba9b1a7f3a9637dd1656dfdad2889016073fd4d35f13b50143cbbb6a8ef"
-- 
2.40.0


