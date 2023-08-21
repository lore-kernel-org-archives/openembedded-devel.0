Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585A9EE49A4
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 01:18:52 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.1609.1692580729722969077
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Aug 2023 18:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup 20230812-3u04._domainkey.redrectangle.org on 127.0.0.1:53: no such host" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=YTR6URN4;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id BE2B7959;
	Mon, 21 Aug 2023 03:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692580726;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=91218; bh=+cvY8KRvtDdw6WM3MNwjBJm4TIgn5Lmm2MrZ6ruWTdU=;
	b=YTR6URN4LSgnh7084zxCg6MHwOqtSEm/f2JXhjGkqq19UZPrEQlNoC01ppXw3hwm
	bY+3TxXgN+SHf4UXgxVl6on/ecJfXy7ZqRIyTYE+3xMDchlQ+0jmKGG9581EJisPJrr
	AH1svVgUoBEay5E6qVyalKqQiGu700R8wojZ38vc0BWAj+fZ120yKHVLiA1JT3V5mML
	VQ499bLVyUkwgx/laWYPNikPaYNAwWQaqI27U8OY1ZrrTrNPvYm9d9a7EB0t7Zzvaxv
	KPdGMzb4s98e9po8K4Wjb2IMayzT5VwZ5KZCPiFDaIt7Xb8S9wBM3so8gcV9JudoocJ
	W3eoupgoiA==
Received: by smtp.mailfence.com with ESMTPSA ; Mon, 21 Aug 2023 03:18:36 +0200 (CEST)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][dunfell][PATCH] postgresql: Update to 12.16
Date: Sun, 20 Aug 2023 18:18:30 -0700
Message-ID: <20230821011830.3553476-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 01:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104502

This is a minor release to address CVEs and other bug fixes without new
features. Remove patches that are fixed in this release. Release notes ar=
e
available at:

https://www.postgresql.org/docs/release/12.10/
https://www.postgresql.org/docs/release/12.11/
https://www.postgresql.org/docs/release/12.12/
https://www.postgresql.org/docs/release/12.13/
https://www.postgresql.org/docs/release/12.14/
https://www.postgresql.org/docs/release/12.15/
https://www.postgresql.org/docs/release/12.16/

License-Update: Copyright year updated

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../postgresql/files/CVE-2022-1552.patch      | 947 ------------------
 .../postgresql/files/CVE-2022-2625.patch      | 904 -----------------
 .../postgresql/files/CVE-2022-41862.patch     |  48 -
 .../postgresql/files/CVE-2023-2454.patch      | 235 -----
 .../postgresql/files/CVE-2023-2455.patch      | 118 ---
 .../postgresql/files/remove_duplicate.patch   |  38 -
 .../postgresql/postgresql_12.16.bb            |  11 +
 .../recipes-dbs/postgresql/postgresql_12.9.bb |  17 -
 8 files changed, 11 insertions(+), 2307 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.pa=
tch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.pa=
tch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.p=
atch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.pa=
tch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.pa=
tch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/remove_duplicate=
.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb
 delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb

diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch b/m=
eta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch
deleted file mode 100644
index 6f0d5ac06..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2022-1552.patch
+++ /dev/null
@@ -1,947 +0,0 @@
-From 31eefa1efc8eecb6ab91c8835d2952d44a3b1ae1 Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Thu, 22 Sep 2022 11:20:41 +0530
-Subject: [PATCH] CVE-2022-1552
-
-Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=3Dpostgr=
esql.git;a=3Dcommit;h=3Dab49ce7c3414ac19e4afb386d7843ce2d2fb8bda && https=
://git.postgresql.org/gitweb/?p=3Dpostgresql.git;a=3Dcommit;h=3D677a49478=
9062ca88e0142a17bedd5415f6ab0aa]
-
-CVE: CVE-2022-1552
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- contrib/amcheck/expected/check_btree.out | 23 ++++++
- contrib/amcheck/sql/check_btree.sql      | 21 +++++
- contrib/amcheck/verify_nbtree.c          | 27 +++++++
- src/backend/access/brin/brin.c           | 29 ++++++-
- src/backend/catalog/index.c              | 65 ++++++++++++----
- src/backend/commands/cluster.c           | 37 ++++++---
- src/backend/commands/indexcmds.c         | 98 ++++++++++++++++++++----
- src/backend/commands/matview.c           | 30 +++-----
- src/backend/utils/init/miscinit.c        | 24 +++---
- src/test/regress/expected/privileges.out | 71 +++++++++++++++++
- src/test/regress/sql/privileges.sql      | 64 ++++++++++++++++
- 11 files changed, 422 insertions(+), 67 deletions(-)
-
-diff --git a/contrib/amcheck/expected/check_btree.out b/contrib/amcheck/=
expected/check_btree.out
-index 59a805d..0fd6ea0 100644
---- a/contrib/amcheck/expected/check_btree.out
-+++ b/contrib/amcheck/expected/check_btree.out
-@@ -168,11 +168,34 @@ SELECT bt_index_check('toasty', true);
- =20
- (1 row)
-=20
-+--
-+-- Check that index expressions and predicates are run as the table's o=
wner
-+--
-+TRUNCATE bttest_a;
-+INSERT INTO bttest_a SELECT * FROM generate_series(1, 1000);
-+ALTER TABLE bttest_a OWNER TO regress_bttest_role;
-+-- A dummy index function checking current_user
-+CREATE FUNCTION ifun(int8) RETURNS int8 AS $$
-+BEGIN
-+	ASSERT current_user =3D 'regress_bttest_role',
-+		format('ifun(%s) called by %s', $1, current_user);
-+	RETURN $1;
-+END;
-+$$ LANGUAGE plpgsql IMMUTABLE;
-+CREATE INDEX bttest_a_expr_idx ON bttest_a ((ifun(id) + ifun(0)))
-+	WHERE ifun(id + 10) > ifun(10);
-+SELECT bt_index_check('bttest_a_expr_idx', true);
-+ bt_index_check=20
-+----------------
-+=20
-+(1 row)
-+
- -- cleanup
- DROP TABLE bttest_a;
- DROP TABLE bttest_b;
- DROP TABLE bttest_multi;
- DROP TABLE delete_test_table;
- DROP TABLE toast_bug;
-+DROP FUNCTION ifun(int8);
- DROP OWNED BY regress_bttest_role; -- permissions
- DROP ROLE regress_bttest_role;
-diff --git a/contrib/amcheck/sql/check_btree.sql b/contrib/amcheck/sql/c=
heck_btree.sql
-index 99acbc8..3248187 100644
---- a/contrib/amcheck/sql/check_btree.sql
-+++ b/contrib/amcheck/sql/check_btree.sql
-@@ -110,11 +110,32 @@ INSERT INTO toast_bug SELECT repeat('a', 2200);
- -- Should not get false positive report of corruption:
- SELECT bt_index_check('toasty', true);
-=20
-+--
-+-- Check that index expressions and predicates are run as the table's o=
wner
-+--
-+TRUNCATE bttest_a;
-+INSERT INTO bttest_a SELECT * FROM generate_series(1, 1000);
-+ALTER TABLE bttest_a OWNER TO regress_bttest_role;
-+-- A dummy index function checking current_user
-+CREATE FUNCTION ifun(int8) RETURNS int8 AS $$
-+BEGIN
-+	ASSERT current_user =3D 'regress_bttest_role',
-+		format('ifun(%s) called by %s', $1, current_user);
-+	RETURN $1;
-+END;
-+$$ LANGUAGE plpgsql IMMUTABLE;
-+
-+CREATE INDEX bttest_a_expr_idx ON bttest_a ((ifun(id) + ifun(0)))
-+	WHERE ifun(id + 10) > ifun(10);
-+
-+SELECT bt_index_check('bttest_a_expr_idx', true);
-+
- -- cleanup
- DROP TABLE bttest_a;
- DROP TABLE bttest_b;
- DROP TABLE bttest_multi;
- DROP TABLE delete_test_table;
- DROP TABLE toast_bug;
-+DROP FUNCTION ifun(int8);
- DROP OWNED BY regress_bttest_role; -- permissions
- DROP ROLE regress_bttest_role;
-diff --git a/contrib/amcheck/verify_nbtree.c b/contrib/amcheck/verify_nb=
tree.c
-index 700a02f..cb6475d 100644
---- a/contrib/amcheck/verify_nbtree.c
-+++ b/contrib/amcheck/verify_nbtree.c
-@@ -228,6 +228,9 @@ bt_index_check_internal(Oid indrelid, bool parentche=
ck, bool heapallindexed,
- 	Relation	indrel;
- 	Relation	heaprel;
- 	LOCKMODE	lockmode;
-+	Oid			save_userid;
-+	int			save_sec_context;
-+	int			save_nestlevel;
-=20
- 	if (parentcheck)
- 		lockmode =3D ShareLock;
-@@ -244,9 +247,27 @@ bt_index_check_internal(Oid indrelid, bool parentch=
eck, bool heapallindexed,
- 	 */
- 	heapid =3D IndexGetRelation(indrelid, true);
- 	if (OidIsValid(heapid))
-+	{
- 		heaprel =3D table_open(heapid, lockmode);
-+
-+		/*
-+		 * Switch to the table owner's userid, so that any index functions ar=
e
-+		 * run as that user.  Also lock down security-restricted operations
-+		 * and arrange to make GUC variable changes local to this command.
-+		 */
-+		GetUserIdAndSecContext(&save_userid, &save_sec_context);
-+		SetUserIdAndSecContext(heaprel->rd_rel->relowner,
-+							   save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+		save_nestlevel =3D NewGUCNestLevel();
-+	}
- 	else
-+	{
- 		heaprel =3D NULL;
-+		/* for "gcc -Og" https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D78394=
 */
-+		save_userid =3D InvalidOid;
-+		save_sec_context =3D -1;
-+		save_nestlevel =3D -1;
-+	}
-=20
- 	/*
- 	 * Open the target index relations separately (like relation_openrv(),=
 but
-@@ -293,6 +314,12 @@ bt_index_check_internal(Oid indrelid, bool parentch=
eck, bool heapallindexed,
- 							 heapallindexed, rootdescend);
- 	}
-=20
-+	/* Roll back any GUC changes executed by index functions */
-+	AtEOXact_GUC(false, save_nestlevel);
-+
-+	/* Restore userid and security context */
-+	SetUserIdAndSecContext(save_userid, save_sec_context);
-+
- 	/*
- 	 * Release locks early. That's ok here because nothing in the called
- 	 * routines will trigger shared cache invalidations to be sent, so we =
can
-diff --git a/src/backend/access/brin/brin.c b/src/backend/access/brin/br=
in.c
-index c7b403b..781cac2 100644
---- a/src/backend/access/brin/brin.c
-+++ b/src/backend/access/brin/brin.c
-@@ -873,6 +873,9 @@ brin_summarize_range(PG_FUNCTION_ARGS)
- 	Oid			heapoid;
- 	Relation	indexRel;
- 	Relation	heapRel;
-+	Oid			save_userid;
-+	int			save_sec_context;
-+	int			save_nestlevel;
- 	double		numSummarized =3D 0;
-=20
- 	if (RecoveryInProgress())
-@@ -899,7 +902,22 @@ brin_summarize_range(PG_FUNCTION_ARGS)
- 	 */
- 	heapoid =3D IndexGetRelation(indexoid, true);
- 	if (OidIsValid(heapoid))
-+	{
- 		heapRel =3D table_open(heapoid, ShareUpdateExclusiveLock);
-+
-+		/*
-+		 * Autovacuum calls us.  For its benefit, switch to the table owner's
-+		 * userid, so that any index functions are run as that user.  Also
-+		 * lock down security-restricted operations and arrange to make GUC
-+		 * variable changes local to this command.  This is harmless, albeit
-+		 * unnecessary, when called from SQL, because we fail shortly if the
-+		 * user does not own the index.
-+		 */
-+		GetUserIdAndSecContext(&save_userid, &save_sec_context);
-+		SetUserIdAndSecContext(heapRel->rd_rel->relowner,
-+							   save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+		save_nestlevel =3D NewGUCNestLevel();
-+	}
- 	else
- 		heapRel =3D NULL;
-=20
-@@ -914,7 +932,7 @@ brin_summarize_range(PG_FUNCTION_ARGS)
- 						RelationGetRelationName(indexRel))));
-=20
- 	/* User must own the index (comparable to privileges needed for VACUUM=
) */
--	if (!pg_class_ownercheck(indexoid, GetUserId()))
-+	if (heapRel !=3D NULL && !pg_class_ownercheck(indexoid, save_userid))
- 		aclcheck_error(ACLCHECK_NOT_OWNER, OBJECT_INDEX,
- 					   RelationGetRelationName(indexRel));
-=20
-@@ -932,6 +950,12 @@ brin_summarize_range(PG_FUNCTION_ARGS)
- 	/* OK, do it */
- 	brinsummarize(indexRel, heapRel, heapBlk, true, &numSummarized, NULL);
-=20
-+	/* Roll back any GUC changes executed by index functions */
-+	AtEOXact_GUC(false, save_nestlevel);
-+
-+	/* Restore userid and security context */
-+	SetUserIdAndSecContext(save_userid, save_sec_context);
-+
- 	relation_close(indexRel, ShareUpdateExclusiveLock);
- 	relation_close(heapRel, ShareUpdateExclusiveLock);
-=20
-@@ -973,6 +997,9 @@ brin_desummarize_range(PG_FUNCTION_ARGS)
- 	 * passed indexoid isn't an index then IndexGetRelation() will fail.
- 	 * Rather than emitting a not-very-helpful error message, postpone
- 	 * complaining, expecting that the is-it-an-index test below will fail=
.
-+	 *
-+	 * Unlike brin_summarize_range(), autovacuum never calls this.  Hence,=
 we
-+	 * don't switch userid.
- 	 */
- 	heapoid =3D IndexGetRelation(indexoid, true);
- 	if (OidIsValid(heapoid))
-diff --git a/src/backend/catalog/index.c b/src/backend/catalog/index.c
-index 3ece136..0333bfd 100644
---- a/src/backend/catalog/index.c
-+++ b/src/backend/catalog/index.c
-@@ -1400,6 +1400,9 @@ index_concurrently_build(Oid heapRelationId,
- 						 Oid indexRelationId)
- {
- 	Relation	heapRel;
-+	Oid			save_userid;
-+	int			save_sec_context;
-+	int			save_nestlevel;
- 	Relation	indexRelation;
- 	IndexInfo  *indexInfo;
-=20
-@@ -1409,7 +1412,16 @@ index_concurrently_build(Oid heapRelationId,
- 	/* Open and lock the parent heap relation */
- 	heapRel =3D table_open(heapRelationId, ShareUpdateExclusiveLock);
-=20
--	/* And the target index relation */
-+	/*
-+	 * Switch to the table owner's userid, so that any index functions are=
 run
-+	 * as that user.  Also lock down security-restricted operations and
-+	 * arrange to make GUC variable changes local to this command.
-+	 */
-+	GetUserIdAndSecContext(&save_userid, &save_sec_context);
-+	SetUserIdAndSecContext(heapRel->rd_rel->relowner,
-+						   save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+	save_nestlevel =3D NewGUCNestLevel();
-+
- 	indexRelation =3D index_open(indexRelationId, RowExclusiveLock);
-=20
- 	/*
-@@ -1425,6 +1437,12 @@ index_concurrently_build(Oid heapRelationId,
- 	/* Now build the index */
- 	index_build(heapRel, indexRelation, indexInfo, false, true);
-=20
-+	/* Roll back any GUC changes executed by index functions */
-+	AtEOXact_GUC(false, save_nestlevel);
-+
-+	/* Restore userid and security context */
-+	SetUserIdAndSecContext(save_userid, save_sec_context);
-+
- 	/* Close both the relations, but keep the locks */
- 	table_close(heapRel, NoLock);
- 	index_close(indexRelation, NoLock);
-@@ -3271,7 +3289,17 @@ validate_index(Oid heapId, Oid indexId, Snapshot =
snapshot)
-=20
- 	/* Open and lock the parent heap relation */
- 	heapRelation =3D table_open(heapId, ShareUpdateExclusiveLock);
--	/* And the target index relation */
-+
-+	/*
-+	 * Switch to the table owner's userid, so that any index functions are=
 run
-+	 * as that user.  Also lock down security-restricted operations and
-+	 * arrange to make GUC variable changes local to this command.
-+	 */
-+	GetUserIdAndSecContext(&save_userid, &save_sec_context);
-+	SetUserIdAndSecContext(heapRelation->rd_rel->relowner,
-+						   save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+	save_nestlevel =3D NewGUCNestLevel();
-+
- 	indexRelation =3D index_open(indexId, RowExclusiveLock);
-=20
- 	/*
-@@ -3284,16 +3312,6 @@ validate_index(Oid heapId, Oid indexId, Snapshot =
snapshot)
- 	/* mark build is concurrent just for consistency */
- 	indexInfo->ii_Concurrent =3D true;
-=20
--	/*
--	 * Switch to the table owner's userid, so that any index functions are=
 run
--	 * as that user.  Also lock down security-restricted operations and
--	 * arrange to make GUC variable changes local to this command.
--	 */
--	GetUserIdAndSecContext(&save_userid, &save_sec_context);
--	SetUserIdAndSecContext(heapRelation->rd_rel->relowner,
--						   save_sec_context | SECURITY_RESTRICTED_OPERATION);
--	save_nestlevel =3D NewGUCNestLevel();
--
- 	/*
- 	 * Scan the index and gather up all the TIDs into a tuplesort object.
- 	 */
-@@ -3497,6 +3515,9 @@ reindex_index(Oid indexId, bool skip_constraint_ch=
ecks, char persistence,
- 	Relation	iRel,
- 				heapRelation;
- 	Oid			heapId;
-+	Oid			save_userid;
-+	int			save_sec_context;
-+	int			save_nestlevel;
- 	IndexInfo  *indexInfo;
- 	volatile bool skipped_constraint =3D false;
- 	PGRUsage	ru0;
-@@ -3527,6 +3548,16 @@ reindex_index(Oid indexId, bool skip_constraint_c=
hecks, char persistence,
- 	 */
- 	iRel =3D index_open(indexId, AccessExclusiveLock);
-=20
-+	/*
-+	 * Switch to the table owner's userid, so that any index functions are=
 run
-+	 * as that user.  Also lock down security-restricted operations and
-+	 * arrange to make GUC variable changes local to this command.
-+	 */
-+	GetUserIdAndSecContext(&save_userid, &save_sec_context);
-+	SetUserIdAndSecContext(heapRelation->rd_rel->relowner,
-+						   save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+	save_nestlevel =3D NewGUCNestLevel();
-+
- 	if (progress)
- 		pgstat_progress_update_param(PROGRESS_CREATEIDX_ACCESS_METHOD_OID,
- 									 iRel->rd_rel->relam);
-@@ -3684,12 +3715,18 @@ reindex_index(Oid indexId, bool skip_constraint_=
checks, char persistence,
- 				 errdetail_internal("%s",
- 									pg_rusage_show(&ru0))));
-=20
--	if (progress)
--		pgstat_progress_end_command();
-+	/* Roll back any GUC changes executed by index functions */
-+	AtEOXact_GUC(false, save_nestlevel);
-+
-+	/* Restore userid and security context */
-+	SetUserIdAndSecContext(save_userid, save_sec_context);
-=20
- 	/* Close rels, but keep locks */
- 	index_close(iRel, NoLock);
- 	table_close(heapRelation, NoLock);
-+
-+	if (progress)
-+		pgstat_progress_end_command();
- }
-=20
- /*
-diff --git a/src/backend/commands/cluster.c b/src/backend/commands/clust=
er.c
-index bd6f408..74db03e 100644
---- a/src/backend/commands/cluster.c
-+++ b/src/backend/commands/cluster.c
-@@ -266,6 +266,9 @@ void
- cluster_rel(Oid tableOid, Oid indexOid, int options)
- {
- 	Relation	OldHeap;
-+	Oid         save_userid;
-+	int         save_sec_context;
-+	int         save_nestlevel;
- 	bool		verbose =3D ((options & CLUOPT_VERBOSE) !=3D 0);
- 	bool		recheck =3D ((options & CLUOPT_RECHECK) !=3D 0);
-=20
-@@ -295,6 +298,16 @@ cluster_rel(Oid tableOid, Oid indexOid, int options=
)
- 		return;
- 	}
-=20
-+	/*
-+	 * Switch to the table owner's userid, so that any index functions are=
 run
-+	 * as that user.  Also lock down security-restricted operations and
-+	 * arrange to make GUC variable changes local to this command.
-+	 */
-+	GetUserIdAndSecContext(&save_userid, &save_sec_context);
-+	SetUserIdAndSecContext(OldHeap->rd_rel->relowner,
-+						   save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+	save_nestlevel =3D NewGUCNestLevel();
-+
- 	/*
- 	 * Since we may open a new transaction for each relation, we have to c=
heck
- 	 * that the relation still is what we think it is.
-@@ -309,11 +322,10 @@ cluster_rel(Oid tableOid, Oid indexOid, int option=
s)
- 		Form_pg_index indexForm;
-=20
- 		/* Check that the user still owns the relation */
--		if (!pg_class_ownercheck(tableOid, GetUserId()))
-+		if (!pg_class_ownercheck(tableOid, save_userid))
- 		{
- 			relation_close(OldHeap, AccessExclusiveLock);
--			pgstat_progress_end_command();
--			return;
-+			goto out;
- 		}
-=20
- 		/*
-@@ -327,8 +339,7 @@ cluster_rel(Oid tableOid, Oid indexOid, int options)
- 		if (RELATION_IS_OTHER_TEMP(OldHeap))
- 		{
- 			relation_close(OldHeap, AccessExclusiveLock);
--			pgstat_progress_end_command();
--			return;
-+			goto out;
- 		}
-=20
- 		if (OidIsValid(indexOid))
-@@ -339,8 +350,7 @@ cluster_rel(Oid tableOid, Oid indexOid, int options)
- 			if (!SearchSysCacheExists1(RELOID, ObjectIdGetDatum(indexOid)))
- 			{
- 				relation_close(OldHeap, AccessExclusiveLock);
--				pgstat_progress_end_command();
--				return;
-+				goto out;
- 			}
-=20
- 			/*
-@@ -350,8 +360,7 @@ cluster_rel(Oid tableOid, Oid indexOid, int options)
- 			if (!HeapTupleIsValid(tuple))	/* probably can't happen */
- 			{
- 				relation_close(OldHeap, AccessExclusiveLock);
--				pgstat_progress_end_command();
--				return;
-+				goto out;
- 			}
- 			indexForm =3D (Form_pg_index) GETSTRUCT(tuple);
- 			if (!indexForm->indisclustered)
-@@ -413,8 +422,7 @@ cluster_rel(Oid tableOid, Oid indexOid, int options)
- 		!RelationIsPopulated(OldHeap))
- 	{
- 		relation_close(OldHeap, AccessExclusiveLock);
--		pgstat_progress_end_command();
--		return;
-+		goto out;
- 	}
-=20
- 	/*
-@@ -430,6 +438,13 @@ cluster_rel(Oid tableOid, Oid indexOid, int options=
)
-=20
- 	/* NB: rebuild_relation does table_close() on OldHeap */
-=20
-+out:
-+	/* Roll back any GUC changes executed by index functions */
-+	AtEOXact_GUC(false, save_nestlevel);
-+
-+	/* Restore userid and security context */
-+	SetUserIdAndSecContext(save_userid, save_sec_context);
-+
- 	pgstat_progress_end_command();
- }
-=20
-diff --git a/src/backend/commands/indexcmds.c b/src/backend/commands/ind=
excmds.c
-index be1cf8c..167b377 100644
---- a/src/backend/commands/indexcmds.c
-+++ b/src/backend/commands/indexcmds.c
-@@ -470,21 +470,22 @@ DefineIndex(Oid relationId,
- 	LOCKTAG		heaplocktag;
- 	LOCKMODE	lockmode;
- 	Snapshot	snapshot;
--	int			save_nestlevel =3D -1;
-+	Oid			root_save_userid;
-+	int			root_save_sec_context;
-+	int			root_save_nestlevel;
- 	int			i;
-=20
-+	root_save_nestlevel =3D NewGUCNestLevel();
-+
- 	/*
- 	 * Some callers need us to run with an empty default_tablespace; this =
is a
- 	 * necessary hack to be able to reproduce catalog state accurately whe=
n
- 	 * recreating indexes after table-rewriting ALTER TABLE.
- 	 */
- 	if (stmt->reset_default_tblspc)
--	{
--		save_nestlevel =3D NewGUCNestLevel();
- 		(void) set_config_option("default_tablespace", "",
- 								 PGC_USERSET, PGC_S_SESSION,
- 								 GUC_ACTION_SAVE, true, 0, false);
--	}
-=20
- 	/*
- 	 * Force non-concurrent build on temporary relations, even if CONCURRE=
NTLY
-@@ -563,6 +564,15 @@ DefineIndex(Oid relationId,
- 	lockmode =3D concurrent ? ShareUpdateExclusiveLock : ShareLock;
- 	rel =3D table_open(relationId, lockmode);
-=20
-+	/*
-+	 * Switch to the table owner's userid, so that any index functions are=
 run
-+	 * as that user.  Also lock down security-restricted operations.  We
-+	 * already arranged to make GUC variable changes local to this command=
.
-+	 */
-+	GetUserIdAndSecContext(&root_save_userid, &root_save_sec_context);
-+	SetUserIdAndSecContext(rel->rd_rel->relowner,
-+						   root_save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+
- 	namespaceId =3D RelationGetNamespace(rel);
-=20
- 	/* Ensure that it makes sense to index this kind of relation */
-@@ -648,7 +658,7 @@ DefineIndex(Oid relationId,
- 	{
- 		AclResult	aclresult;
-=20
--		aclresult =3D pg_namespace_aclcheck(namespaceId, GetUserId(),
-+		aclresult =3D pg_namespace_aclcheck(namespaceId, root_save_userid,
- 										  ACL_CREATE);
- 		if (aclresult !=3D ACLCHECK_OK)
- 			aclcheck_error(aclresult, OBJECT_SCHEMA,
-@@ -680,7 +690,7 @@ DefineIndex(Oid relationId,
- 	{
- 		AclResult	aclresult;
-=20
--		aclresult =3D pg_tablespace_aclcheck(tablespaceId, GetUserId(),
-+		aclresult =3D pg_tablespace_aclcheck(tablespaceId, root_save_userid,
- 										   ACL_CREATE);
- 		if (aclresult !=3D ACLCHECK_OK)
- 			aclcheck_error(aclresult, OBJECT_TABLESPACE,
-@@ -1066,15 +1076,17 @@ DefineIndex(Oid relationId,
-=20
- 	ObjectAddressSet(address, RelationRelationId, indexRelationId);
-=20
--	/*
--	 * Revert to original default_tablespace.  Must do this before any ret=
urn
--	 * from this function, but after index_create, so this is a good time.
--	 */
--	if (save_nestlevel >=3D 0)
--		AtEOXact_GUC(true, save_nestlevel);
--
- 	if (!OidIsValid(indexRelationId))
- 	{
-+		/*
-+		 * Roll back any GUC changes executed by index functions.  Also rever=
t
-+		 * to original default_tablespace if we changed it above.
-+		 */
-+		AtEOXact_GUC(false, root_save_nestlevel);
-+
-+		/* Restore userid and security context */
-+		SetUserIdAndSecContext(root_save_userid, root_save_sec_context);
-+
- 		table_close(rel, NoLock);
-=20
- 		/* If this is the top-level index, we're done */
-@@ -1084,6 +1096,17 @@ DefineIndex(Oid relationId,
- 		return address;
- 	}
-=20
-+	/*
-+	 * Roll back any GUC changes executed by index functions, and keep
-+	 * subsequent changes local to this command.  It's barely possible tha=
t
-+	 * some index function changed a behavior-affecting GUC, e.g. xmloptio=
n,
-+	 * that affects subsequent steps.  This improves bug-compatibility wit=
h
-+	 * older PostgreSQL versions.  They did the AtEOXact_GUC() here for th=
e
-+	 * purpose of clearing the above default_tablespace change.
-+	 */
-+	AtEOXact_GUC(false, root_save_nestlevel);
-+	root_save_nestlevel =3D NewGUCNestLevel();
-+
- 	/* Add any requested comment */
- 	if (stmt->idxcomment !=3D NULL)
- 		CreateComments(indexRelationId, RelationRelationId, 0,
-@@ -1130,6 +1153,9 @@ DefineIndex(Oid relationId,
- 			{
- 				Oid			childRelid =3D part_oids[i];
- 				Relation	childrel;
-+				Oid			child_save_userid;
-+				int			child_save_sec_context;
-+				int			child_save_nestlevel;
- 				List	   *childidxs;
- 				ListCell   *cell;
- 				AttrNumber *attmap;
-@@ -1138,6 +1164,12 @@ DefineIndex(Oid relationId,
-=20
- 				childrel =3D table_open(childRelid, lockmode);
-=20
-+				GetUserIdAndSecContext(&child_save_userid,
-+									   &child_save_sec_context);
-+				SetUserIdAndSecContext(childrel->rd_rel->relowner,
-+									   child_save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+				child_save_nestlevel =3D NewGUCNestLevel();
-+
- 				/*
- 				 * Don't try to create indexes on foreign tables, though. Skip
- 				 * those if a regular index, or fail if trying to create a
-@@ -1153,6 +1185,9 @@ DefineIndex(Oid relationId,
- 								 errdetail("Table \"%s\" contains partitions that are foreign t=
ables.",
- 										   RelationGetRelationName(rel))));
-=20
-+					AtEOXact_GUC(false, child_save_nestlevel);
-+					SetUserIdAndSecContext(child_save_userid,
-+										   child_save_sec_context);
- 					table_close(childrel, lockmode);
- 					continue;
- 				}
-@@ -1226,6 +1261,9 @@ DefineIndex(Oid relationId,
- 				}
-=20
- 				list_free(childidxs);
-+				AtEOXact_GUC(false, child_save_nestlevel);
-+				SetUserIdAndSecContext(child_save_userid,
-+									   child_save_sec_context);
- 				table_close(childrel, NoLock);
-=20
- 				/*
-@@ -1280,12 +1318,21 @@ DefineIndex(Oid relationId,
- 					if (found_whole_row)
- 						elog(ERROR, "cannot convert whole-row table reference");
-=20
-+					/*
-+					 * Recurse as the starting user ID.  Callee will use that
-+					 * for permission checks, then switch again.
-+					 */
-+					Assert(GetUserId() =3D=3D child_save_userid);
-+					SetUserIdAndSecContext(root_save_userid,
-+										   root_save_sec_context);
- 					DefineIndex(childRelid, childStmt,
- 								InvalidOid, /* no predefined OID */
- 								indexRelationId,	/* this is our child */
- 								createdConstraintId,
- 								is_alter_table, check_rights, check_not_in_use,
- 								skip_build, quiet);
-+					SetUserIdAndSecContext(child_save_userid,
-+										   child_save_sec_context);
- 				}
-=20
- 				pgstat_progress_update_param(PROGRESS_CREATEIDX_PARTITIONS_DONE,
-@@ -1322,12 +1369,17 @@ DefineIndex(Oid relationId,
- 		 * Indexes on partitioned tables are not themselves built, so we're
- 		 * done here.
- 		 */
-+		AtEOXact_GUC(false, root_save_nestlevel);
-+		SetUserIdAndSecContext(root_save_userid, root_save_sec_context);
- 		table_close(rel, NoLock);
- 		if (!OidIsValid(parentIndexId))
- 			pgstat_progress_end_command();
- 		return address;
- 	}
-=20
-+	AtEOXact_GUC(false, root_save_nestlevel);
-+	SetUserIdAndSecContext(root_save_userid, root_save_sec_context);
-+
- 	if (!concurrent)
- 	{
- 		/* Close the heap and we're done, in the non-concurrent case */
-@@ -3040,6 +3092,9 @@ ReindexRelationConcurrently(Oid relationOid, int o=
ptions)
- 		Oid			newIndexId;
- 		Relation	indexRel;
- 		Relation	heapRel;
-+		Oid			save_userid;
-+		int			save_sec_context;
-+		int			save_nestlevel;
- 		Relation	newIndexRel;
- 		LockRelId  *lockrelid;
-=20
-@@ -3047,6 +3102,16 @@ ReindexRelationConcurrently(Oid relationOid, int =
options)
- 		heapRel =3D table_open(indexRel->rd_index->indrelid,
- 							 ShareUpdateExclusiveLock);
-=20
-+		/*
-+		 * Switch to the table owner's userid, so that any index functions ar=
e
-+		 * run as that user.  Also lock down security-restricted operations
-+		 * and arrange to make GUC variable changes local to this command.
-+		 */
-+		GetUserIdAndSecContext(&save_userid, &save_sec_context);
-+		SetUserIdAndSecContext(heapRel->rd_rel->relowner,
-+					save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+		save_nestlevel =3D NewGUCNestLevel();
-+
- 		/* This function shouldn't be called for temporary relations. */
- 		if (indexRel->rd_rel->relpersistence =3D=3D RELPERSISTENCE_TEMP)
- 			elog(ERROR, "cannot reindex a temporary table concurrently");
-@@ -3101,6 +3166,13 @@ ReindexRelationConcurrently(Oid relationOid, int =
options)
-=20
- 		index_close(indexRel, NoLock);
- 		index_close(newIndexRel, NoLock);
-+
-+		/* Roll back any GUC changes executed by index functions */
-+		AtEOXact_GUC(false, save_nestlevel);
-+
-+		/* Restore userid and security context */
-+		SetUserIdAndSecContext(save_userid, save_sec_context);
-+
- 		table_close(heapRel, NoLock);
- 	}
-=20
-diff --git a/src/backend/commands/matview.c b/src/backend/commands/matvi=
ew.c
-index 80e9ec0..e485661 100644
---- a/src/backend/commands/matview.c
-+++ b/src/backend/commands/matview.c
-@@ -167,6 +167,17 @@ ExecRefreshMatView(RefreshMatViewStmt *stmt, const =
char *queryString,
- 										  lockmode, 0,
- 										  RangeVarCallbackOwnsTable, NULL);
- 	matviewRel =3D table_open(matviewOid, NoLock);
-+	relowner =3D matviewRel->rd_rel->relowner;
-+
-+	/*
-+	 * Switch to the owner's userid, so that any functions are run as that
-+	 * user.  Also lock down security-restricted operations and arrange to
-+	 * make GUC variable changes local to this command.
-+	 */
-+	GetUserIdAndSecContext(&save_userid, &save_sec_context);
-+	SetUserIdAndSecContext(relowner,
-+						   save_sec_context | SECURITY_RESTRICTED_OPERATION);
-+	save_nestlevel =3D NewGUCNestLevel();
-=20
- 	/* Make sure it is a materialized view. */
- 	if (matviewRel->rd_rel->relkind !=3D RELKIND_MATVIEW)
-@@ -268,19 +279,6 @@ ExecRefreshMatView(RefreshMatViewStmt *stmt, const =
char *queryString,
- 	 */
- 	SetMatViewPopulatedState(matviewRel, !stmt->skipData);
-=20
--	relowner =3D matviewRel->rd_rel->relowner;
--
--	/*
--	 * Switch to the owner's userid, so that any functions are run as that
--	 * user.  Also arrange to make GUC variable changes local to this comm=
and.
--	 * Don't lock it down too tight to create a temporary table just yet. =
 We
--	 * will switch modes when we are about to execute user code.
--	 */
--	GetUserIdAndSecContext(&save_userid, &save_sec_context);
--	SetUserIdAndSecContext(relowner,
--						   save_sec_context | SECURITY_LOCAL_USERID_CHANGE);
--	save_nestlevel =3D NewGUCNestLevel();
--
- 	/* Concurrent refresh builds new data in temp tablespace, and does dif=
f. */
- 	if (concurrent)
- 	{
-@@ -303,12 +301,6 @@ ExecRefreshMatView(RefreshMatViewStmt *stmt, const =
char *queryString,
- 	LockRelationOid(OIDNewHeap, AccessExclusiveLock);
- 	dest =3D CreateTransientRelDestReceiver(OIDNewHeap);
-=20
--	/*
--	 * Now lock down security-restricted operations.
--	 */
--	SetUserIdAndSecContext(relowner,
--						   save_sec_context | SECURITY_RESTRICTED_OPERATION);
--
- 	/* Generate the data, if wanted. */
- 	if (!stmt->skipData)
- 		processed =3D refresh_matview_datafill(dest, dataQuery, queryString);
-diff --git a/src/backend/utils/init/miscinit.c b/src/backend/utils/init/=
miscinit.c
-index de554e2..c9f858e 100644
---- a/src/backend/utils/init/miscinit.c
-+++ b/src/backend/utils/init/miscinit.c
-@@ -455,15 +455,21 @@ GetAuthenticatedUserId(void)
-  * with guc.c's internal state, so SET ROLE has to be disallowed.
-  *
-  * SECURITY_RESTRICTED_OPERATION indicates that we are inside an operat=
ion
-- * that does not wish to trust called user-defined functions at all.  T=
his
-- * bit prevents not only SET ROLE, but various other changes of session=
 state
-- * that normally is unprotected but might possibly be used to subvert t=
he
-- * calling session later.  An example is replacing an existing prepared
-- * statement with new code, which will then be executed with the outer
-- * session's permissions when the prepared statement is next used.  Sin=
ce
-- * these restrictions are fairly draconian, we apply them only in conte=
xts
-- * where the called functions are really supposed to be side-effect-fre=
e
-- * anyway, such as VACUUM/ANALYZE/REINDEX.
-+ * that does not wish to trust called user-defined functions at all.  T=
he
-+ * policy is to use this before operations, e.g. autovacuum and REINDEX=
, that
-+ * enumerate relations of a database or schema and run functions associ=
ated
-+ * with each found relation.  The relation owner is the new user ID.  S=
et this
-+ * as soon as possible after locking the relation.  Restore the old use=
r ID as
-+ * late as possible before closing the relation; restoring it shortly a=
fter
-+ * close is also tolerable.  If a command has both relation-enumerating=
 and
-+ * non-enumerating modes, e.g. ANALYZE, both modes set this bit.  This =
bit
-+ * prevents not only SET ROLE, but various other changes of session sta=
te that
-+ * normally is unprotected but might possibly be used to subvert the ca=
lling
-+ * session later.  An example is replacing an existing prepared stateme=
nt with
-+ * new code, which will then be executed with the outer session's permi=
ssions
-+ * when the prepared statement is next used.  These restrictions are fa=
irly
-+ * draconian, but the functions called in relation-enumerating operatio=
ns are
-+ * really supposed to be side-effect-free anyway.
-  *
-  * SECURITY_NOFORCE_RLS indicates that we are inside an operation which=
 should
-  * ignore the FORCE ROW LEVEL SECURITY per-table indication.  This is u=
sed to
-diff --git a/src/test/regress/expected/privileges.out b/src/test/regress=
/expected/privileges.out
-index 186d2fb..0f0c1b3 100644
---- a/src/test/regress/expected/privileges.out
-+++ b/src/test/regress/expected/privileges.out
-@@ -1336,6 +1336,61 @@ SELECT has_table_privilege('regress_priv_user1', =
'atest4', 'SELECT WITH GRANT OP
- -- security-restricted operations
- \c -
- CREATE ROLE regress_sro_user;
-+-- Check that index expressions and predicates are run as the table's o=
wner
-+-- A dummy index function checking current_user
-+CREATE FUNCTION sro_ifun(int) RETURNS int AS $$
-+BEGIN
-+	-- Below we set the table's owner to regress_sro_user
-+	ASSERT current_user =3D 'regress_sro_user',
-+		format('sro_ifun(%s) called by %s', $1, current_user);
-+	RETURN $1;
-+END;
-+$$ LANGUAGE plpgsql IMMUTABLE;
-+-- Create a table owned by regress_sro_user
-+CREATE TABLE sro_tab (a int);
-+ALTER TABLE sro_tab OWNER TO regress_sro_user;
-+INSERT INTO sro_tab VALUES (1), (2), (3);
-+-- Create an expression index with a predicate
-+CREATE INDEX sro_idx ON sro_tab ((sro_ifun(a) + sro_ifun(0)))
-+	WHERE sro_ifun(a + 10) > sro_ifun(10);
-+DROP INDEX sro_idx;
-+-- Do the same concurrently
-+CREATE INDEX CONCURRENTLY sro_idx ON sro_tab ((sro_ifun(a) + sro_ifun(0=
)))
-+	WHERE sro_ifun(a + 10) > sro_ifun(10);
-+-- REINDEX
-+REINDEX TABLE sro_tab;
-+REINDEX INDEX sro_idx;
-+REINDEX TABLE CONCURRENTLY sro_tab;
-+DROP INDEX sro_idx;
-+-- CLUSTER
-+CREATE INDEX sro_cluster_idx ON sro_tab ((sro_ifun(a) + sro_ifun(0)));
-+CLUSTER sro_tab USING sro_cluster_idx;
-+DROP INDEX sro_cluster_idx;
-+-- BRIN index
-+CREATE INDEX sro_brin ON sro_tab USING brin ((sro_ifun(a) + sro_ifun(0)=
));
-+SELECT brin_desummarize_range('sro_brin', 0);
-+ brin_desummarize_range=20
-+------------------------
-+=20
-+(1 row)
-+
-+SELECT brin_summarize_range('sro_brin', 0);
-+ brin_summarize_range=20
-+----------------------
-+                    1
-+(1 row)
-+
-+DROP TABLE sro_tab;
-+-- Check with a partitioned table
-+CREATE TABLE sro_ptab (a int) PARTITION BY RANGE (a);
-+ALTER TABLE sro_ptab OWNER TO regress_sro_user;
-+CREATE TABLE sro_part PARTITION OF sro_ptab FOR VALUES FROM (1) TO (10)=
;
-+ALTER TABLE sro_part OWNER TO regress_sro_user;
-+INSERT INTO sro_ptab VALUES (1), (2), (3);
-+CREATE INDEX sro_pidx ON sro_ptab ((sro_ifun(a) + sro_ifun(0)))
-+	WHERE sro_ifun(a + 10) > sro_ifun(10);
-+REINDEX TABLE sro_ptab;
-+REINDEX INDEX CONCURRENTLY sro_pidx;
- SET SESSION AUTHORIZATION regress_sro_user;
- CREATE FUNCTION unwanted_grant() RETURNS void LANGUAGE sql AS
- 	'GRANT regress_priv_group2 TO regress_sro_user';
-@@ -1373,6 +1428,22 @@ CONTEXT:  SQL function "unwanted_grant" statement=
 1
- SQL statement "SELECT unwanted_grant()"
- PL/pgSQL function sro_trojan() line 1 at PERFORM
- SQL function "mv_action" statement 1
-+-- REFRESH MATERIALIZED VIEW CONCURRENTLY use of eval_const_expressions=
()
-+SET SESSION AUTHORIZATION regress_sro_user;
-+CREATE FUNCTION unwanted_grant_nofail(int) RETURNS int
-+	IMMUTABLE LANGUAGE plpgsql AS $$
-+BEGIN
-+	PERFORM unwanted_grant();
-+	RAISE WARNING 'owned';
-+	RETURN 1;
-+EXCEPTION WHEN OTHERS THEN
-+	RETURN 2;
-+END$$;
-+CREATE MATERIALIZED VIEW sro_index_mv AS SELECT 1 AS c;
-+CREATE UNIQUE INDEX ON sro_index_mv (c) WHERE unwanted_grant_nofail(1) =
> 0;
-+\c -
-+REFRESH MATERIALIZED VIEW CONCURRENTLY sro_index_mv;
-+REFRESH MATERIALIZED VIEW sro_index_mv;
- DROP OWNED BY regress_sro_user;
- DROP ROLE regress_sro_user;
- -- Admin options
-diff --git a/src/test/regress/sql/privileges.sql b/src/test/regress/sql/=
privileges.sql
-index 34fbf0e..c0b88a6 100644
---- a/src/test/regress/sql/privileges.sql
-+++ b/src/test/regress/sql/privileges.sql
-@@ -826,6 +826,53 @@ SELECT has_table_privilege('regress_priv_user1', 'a=
test4', 'SELECT WITH GRANT OP
- \c -
- CREATE ROLE regress_sro_user;
-=20
-+-- Check that index expressions and predicates are run as the table's o=
wner
-+
-+-- A dummy index function checking current_user
-+CREATE FUNCTION sro_ifun(int) RETURNS int AS $$
-+BEGIN
-+	-- Below we set the table's owner to regress_sro_user
-+	ASSERT current_user =3D 'regress_sro_user',
-+		format('sro_ifun(%s) called by %s', $1, current_user);
-+	RETURN $1;
-+END;
-+$$ LANGUAGE plpgsql IMMUTABLE;
-+-- Create a table owned by regress_sro_user
-+CREATE TABLE sro_tab (a int);
-+ALTER TABLE sro_tab OWNER TO regress_sro_user;
-+INSERT INTO sro_tab VALUES (1), (2), (3);
-+-- Create an expression index with a predicate
-+CREATE INDEX sro_idx ON sro_tab ((sro_ifun(a) + sro_ifun(0)))
-+	WHERE sro_ifun(a + 10) > sro_ifun(10);
-+DROP INDEX sro_idx;
-+-- Do the same concurrently
-+CREATE INDEX CONCURRENTLY sro_idx ON sro_tab ((sro_ifun(a) + sro_ifun(0=
)))
-+	WHERE sro_ifun(a + 10) > sro_ifun(10);
-+-- REINDEX
-+REINDEX TABLE sro_tab;
-+REINDEX INDEX sro_idx;
-+REINDEX TABLE CONCURRENTLY sro_tab;
-+DROP INDEX sro_idx;
-+-- CLUSTER
-+CREATE INDEX sro_cluster_idx ON sro_tab ((sro_ifun(a) + sro_ifun(0)));
-+CLUSTER sro_tab USING sro_cluster_idx;
-+DROP INDEX sro_cluster_idx;
-+-- BRIN index
-+CREATE INDEX sro_brin ON sro_tab USING brin ((sro_ifun(a) + sro_ifun(0)=
));
-+SELECT brin_desummarize_range('sro_brin', 0);
-+SELECT brin_summarize_range('sro_brin', 0);
-+DROP TABLE sro_tab;
-+-- Check with a partitioned table
-+CREATE TABLE sro_ptab (a int) PARTITION BY RANGE (a);
-+ALTER TABLE sro_ptab OWNER TO regress_sro_user;
-+CREATE TABLE sro_part PARTITION OF sro_ptab FOR VALUES FROM (1) TO (10)=
;
-+ALTER TABLE sro_part OWNER TO regress_sro_user;
-+INSERT INTO sro_ptab VALUES (1), (2), (3);
-+CREATE INDEX sro_pidx ON sro_ptab ((sro_ifun(a) + sro_ifun(0)))
-+	WHERE sro_ifun(a + 10) > sro_ifun(10);
-+REINDEX TABLE sro_ptab;
-+REINDEX INDEX CONCURRENTLY sro_pidx;
-+
- SET SESSION AUTHORIZATION regress_sro_user;
- CREATE FUNCTION unwanted_grant() RETURNS void LANGUAGE sql AS
- 	'GRANT regress_priv_group2 TO regress_sro_user';
-@@ -852,6 +899,23 @@ REFRESH MATERIALIZED VIEW sro_mv;
- REFRESH MATERIALIZED VIEW sro_mv;
- BEGIN; SET CONSTRAINTS ALL IMMEDIATE; REFRESH MATERIALIZED VIEW sro_mv;=
 COMMIT;
-=20
-+-- REFRESH MATERIALIZED VIEW CONCURRENTLY use of eval_const_expressions=
()
-+SET SESSION AUTHORIZATION regress_sro_user;
-+CREATE FUNCTION unwanted_grant_nofail(int) RETURNS int
-+	IMMUTABLE LANGUAGE plpgsql AS $$
-+BEGIN
-+	PERFORM unwanted_grant();
-+	RAISE WARNING 'owned';
-+	RETURN 1;
-+EXCEPTION WHEN OTHERS THEN
-+	RETURN 2;
-+END$$;
-+CREATE MATERIALIZED VIEW sro_index_mv AS SELECT 1 AS c;
-+CREATE UNIQUE INDEX ON sro_index_mv (c) WHERE unwanted_grant_nofail(1) =
> 0;
-+\c -
-+REFRESH MATERIALIZED VIEW CONCURRENTLY sro_index_mv;
-+REFRESH MATERIALIZED VIEW sro_index_mv;
-+
- DROP OWNED BY regress_sro_user;
- DROP ROLE regress_sro_user;
-=20
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch b/m=
eta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch
deleted file mode 100644
index 6417d8a2b..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625.patch
+++ /dev/null
@@ -1,904 +0,0 @@
-From 84375c1db25ef650902cf80712495fc514b0ff63 Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Thu, 13 Oct 2022 10:35:32 +0530
-Subject: [PATCH] CVE-2022-2625
-
-Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=3Dpostgr=
esql.git;a=3Dcommit;h=3D5579726bd60a6e7afb04a3548bced348cd5ffd89]
-CVE: CVE-2022-2625
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- doc/src/sgml/extend.sgml                      |  11 --
- src/backend/catalog/pg_collation.c            |  49 ++++--
- src/backend/catalog/pg_depend.c               |  74 ++++++++-
- src/backend/catalog/pg_operator.c             |   2 +-
- src/backend/catalog/pg_type.c                 |   7 +-
- src/backend/commands/createas.c               |  18 ++-
- src/backend/commands/foreigncmds.c            |  19 ++-
- src/backend/commands/schemacmds.c             |  25 ++-
- src/backend/commands/sequence.c               |   8 +
- src/backend/commands/statscmds.c              |   4 +
- src/backend/commands/view.c                   |  16 +-
- src/backend/parser/parse_utilcmd.c            |  10 ++
- src/include/catalog/dependency.h              |   2 +
- src/test/modules/test_extensions/Makefile     |   5 +-
- .../expected/test_extensions.out              | 153 ++++++++++++++++++
- .../test_extensions/sql/test_extensions.sql   | 110 +++++++++++++
- .../test_ext_cine--1.0--1.1.sql               |  26 +++
- .../test_extensions/test_ext_cine--1.0.sql    |  25 +++
- .../test_extensions/test_ext_cine.control     |   3 +
- .../test_extensions/test_ext_cor--1.0.sql     |  20 +++
- .../test_extensions/test_ext_cor.control      |   3 +
- 21 files changed, 540 insertions(+), 50 deletions(-)
- create mode 100644 src/test/modules/test_extensions/test_ext_cine--1.0-=
-1.1.sql
- create mode 100644 src/test/modules/test_extensions/test_ext_cine--1.0.=
sql
- create mode 100644 src/test/modules/test_extensions/test_ext_cine.contr=
ol
- create mode 100644 src/test/modules/test_extensions/test_ext_cor--1.0.s=
ql
- create mode 100644 src/test/modules/test_extensions/test_ext_cor.contro=
l
-
-diff --git a/doc/src/sgml/extend.sgml b/doc/src/sgml/extend.sgml
-index 53f2638..bcc7a80 100644
---- a/doc/src/sgml/extend.sgml
-+++ b/doc/src/sgml/extend.sgml
-@@ -1109,17 +1109,6 @@ SELECT * FROM pg_extension_update_paths('<replace=
able>extension_name</replaceabl
-       <varname>search_path</varname>.  However, no mechanism currently =
exists
-       to require that.
-      </para>
--
--     <para>
--      Do <emphasis>not</emphasis> use <command>CREATE OR REPLACE
--      FUNCTION</command>, except in an update script that must change t=
he
--      definition of a function that is known to be an extension member
--      already.  (Likewise for other <literal>OR REPLACE</literal> optio=
ns.)
--      Using <literal>OR REPLACE</literal> unnecessarily not only has a =
risk
--      of accidentally overwriting someone else's function, but it creat=
es a
--      security hazard since the overwritten function would still be own=
ed by
--      its original owner, who could modify it.
--     </para>
-     </sect3>
-    </sect2>
-=20
-diff --git a/src/backend/catalog/pg_collation.c b/src/backend/catalog/pg=
_collation.c
-index dd99d53..ba4c3ef 100644
---- a/src/backend/catalog/pg_collation.c
-+++ b/src/backend/catalog/pg_collation.c
-@@ -78,15 +78,25 @@ CollationCreate(const char *collname, Oid collnamesp=
ace,
- 	 * friendlier error message.  The unique index provides a backstop aga=
inst
- 	 * race conditions.
- 	 */
--	if (SearchSysCacheExists3(COLLNAMEENCNSP,
--							  PointerGetDatum(collname),
--							  Int32GetDatum(collencoding),
--							  ObjectIdGetDatum(collnamespace)))
-+	oid =3D GetSysCacheOid3(COLLNAMEENCNSP,
-+						  Anum_pg_collation_oid,
-+						  PointerGetDatum(collname),
-+						  Int32GetDatum(collencoding),
-+						  ObjectIdGetDatum(collnamespace));
-+	if (OidIsValid(oid))
- 	{
- 		if (quiet)
- 			return InvalidOid;
- 		else if (if_not_exists)
- 		{
-+			/*
-+			 * If we are in an extension script, insist that the pre-existing
-+			 * object be a member of the extension, to avoid security risks.
-+			 */
-+			ObjectAddressSet(myself, CollationRelationId, oid);
-+			checkMembershipInCurrentExtension(&myself);
-+
-+			/* OK to skip */
- 			ereport(NOTICE,
- 					(errcode(ERRCODE_DUPLICATE_OBJECT),
- 					 collencoding =3D=3D -1
-@@ -116,16 +126,19 @@ CollationCreate(const char *collname, Oid collname=
space,
- 	 * so we take a ShareRowExclusiveLock earlier, to protect against
- 	 * concurrent changes fooling this check.
- 	 */
--	if ((collencoding =3D=3D -1 &&
--		 SearchSysCacheExists3(COLLNAMEENCNSP,
--							   PointerGetDatum(collname),
--							   Int32GetDatum(GetDatabaseEncoding()),
--							   ObjectIdGetDatum(collnamespace))) ||
--		(collencoding !=3D -1 &&
--		 SearchSysCacheExists3(COLLNAMEENCNSP,
--							   PointerGetDatum(collname),
--							   Int32GetDatum(-1),
--							   ObjectIdGetDatum(collnamespace))))
-+	if (collencoding =3D=3D -1)
-+		oid =3D GetSysCacheOid3(COLLNAMEENCNSP,
-+							  Anum_pg_collation_oid,
-+							  PointerGetDatum(collname),
-+							  Int32GetDatum(GetDatabaseEncoding()),
-+							  ObjectIdGetDatum(collnamespace));
-+	else
-+		oid =3D GetSysCacheOid3(COLLNAMEENCNSP,
-+							  Anum_pg_collation_oid,
-+							  PointerGetDatum(collname),
-+							  Int32GetDatum(-1),
-+							  ObjectIdGetDatum(collnamespace));
-+	if (OidIsValid(oid))
- 	{
- 		if (quiet)
- 		{
-@@ -134,6 +147,14 @@ CollationCreate(const char *collname, Oid collnames=
pace,
- 		}
- 		else if (if_not_exists)
- 		{
-+			/*
-+			 * If we are in an extension script, insist that the pre-existing
-+			 * object be a member of the extension, to avoid security risks.
-+			 */
-+			ObjectAddressSet(myself, CollationRelationId, oid);
-+			checkMembershipInCurrentExtension(&myself);
-+
-+			/* OK to skip */
- 			table_close(rel, NoLock);
- 			ereport(NOTICE,
- 					(errcode(ERRCODE_DUPLICATE_OBJECT),
-diff --git a/src/backend/catalog/pg_depend.c b/src/backend/catalog/pg_de=
pend.c
-index 9ffadbb..71c7cef 100644
---- a/src/backend/catalog/pg_depend.c
-+++ b/src/backend/catalog/pg_depend.c
-@@ -124,15 +124,23 @@ recordMultipleDependencies(const ObjectAddress *de=
pender,
-=20
- /*
-  * If we are executing a CREATE EXTENSION operation, mark the given obj=
ect
-- * as being a member of the extension.  Otherwise, do nothing.
-+ * as being a member of the extension, or check that it already is one.
-+ * Otherwise, do nothing.
-  *
-  * This must be called during creation of any user-definable object typ=
e
-  * that could be a member of an extension.
-  *
-- * If isReplace is true, the object already existed (or might have alre=
ady
-- * existed), so we must check for a pre-existing extension membership e=
ntry.
-- * Passing false is a guarantee that the object is newly created, and s=
o
-- * could not already be a member of any extension.
-+ * isReplace must be true if the object already existed, and false if i=
t is
-+ * newly created.  In the former case we insist that it already be a me=
mber
-+ * of the current extension.  In the latter case we can skip checking w=
hether
-+ * it is already a member of any extension.
-+ *
-+ * Note: isReplace =3D true is typically used when updating a object in
-+ * CREATE OR REPLACE and similar commands.  We used to allow the target
-+ * object to not already be an extension member, instead silently absor=
bing
-+ * it into the current extension.  However, this was both error-prone
-+ * (extensions might accidentally overwrite free-standing objects) and
-+ * a security hazard (since the object would retain its previous owners=
hip).
-  */
- void
- recordDependencyOnCurrentExtension(const ObjectAddress *object,
-@@ -150,6 +158,12 @@ recordDependencyOnCurrentExtension(const ObjectAddr=
ess *object,
- 		{
- 			Oid			oldext;
-=20
-+			/*
-+			 * Side note: these catalog lookups are safe only because the
-+			 * object is a pre-existing one.  In the not-isReplace case, the
-+			 * caller has most likely not yet done a CommandCounterIncrement
-+			 * that would make the new object visible.
-+			 */
- 			oldext =3D getExtensionOfObject(object->classId, object->objectId);
- 			if (OidIsValid(oldext))
- 			{
-@@ -163,6 +177,13 @@ recordDependencyOnCurrentExtension(const ObjectAddr=
ess *object,
- 								getObjectDescription(object),
- 								get_extension_name(oldext))));
- 			}
-+			/* It's a free-standing object, so reject */
-+			ereport(ERROR,
-+					(errcode(ERRCODE_OBJECT_NOT_IN_PREREQUISITE_STATE),
-+					 errmsg("%s is not a member of extension \"%s\"",
-+							getObjectDescription(object),
-+							get_extension_name(CurrentExtensionObject)),
-+					 errdetail("An extension is not allowed to replace an object that =
it does not own.")));
- 		}
-=20
- 		/* OK, record it as a member of CurrentExtensionObject */
-@@ -174,6 +195,49 @@ recordDependencyOnCurrentExtension(const ObjectAddr=
ess *object,
- 	}
- }
-=20
-+/*
-+ * If we are executing a CREATE EXTENSION operation, check that the giv=
en
-+ * object is a member of the extension, and throw an error if it isn't.
-+ * Otherwise, do nothing.
-+ *
-+ * This must be called whenever a CREATE IF NOT EXISTS operation (for a=
n
-+ * object type that can be an extension member) has found that an objec=
t of
-+ * the desired name already exists.  It is insecure for an extension to=
 use
-+ * IF NOT EXISTS except when the conflicting object is already an exten=
sion
-+ * member; otherwise a hostile user could substitute an object with arb=
itrary
-+ * properties.
-+ */
-+void
-+checkMembershipInCurrentExtension(const ObjectAddress *object)
-+{
-+	/*
-+	 * This is actually the same condition tested in
-+	 * recordDependencyOnCurrentExtension; but we want to issue a
-+	 * differently-worded error, and anyway it would be pretty confusing t=
o
-+	 * call recordDependencyOnCurrentExtension in these circumstances.
-+	 */
-+
-+	/* Only whole objects can be extension members */
-+	Assert(object->objectSubId =3D=3D 0);
-+
-+	if (creating_extension)
-+	{
-+		Oid			oldext;
-+
-+		oldext =3D getExtensionOfObject(object->classId, object->objectId);
-+		/* If already a member of this extension, OK */
-+		if (oldext =3D=3D CurrentExtensionObject)
-+			return;
-+		/* Else complain */
-+		ereport(ERROR,
-+				(errcode(ERRCODE_OBJECT_NOT_IN_PREREQUISITE_STATE),
-+				 errmsg("%s is not a member of extension \"%s\"",
-+						getObjectDescription(object),
-+						get_extension_name(CurrentExtensionObject)),
-+				 errdetail("An extension may only use CREATE ... IF NOT EXISTS to s=
kip object creation if the conflicting object is one that it already owns=
.")));
-+	}
-+}
-+
- /*
-  * deleteDependencyRecordsFor -- delete all records with given depender
-  * classId/objectId.  Returns the number of records deleted.
-diff --git a/src/backend/catalog/pg_operator.c b/src/backend/catalog/pg_=
operator.c
-index bcaa26c..84784e6 100644
---- a/src/backend/catalog/pg_operator.c
-+++ b/src/backend/catalog/pg_operator.c
-@@ -867,7 +867,7 @@ makeOperatorDependencies(HeapTuple tuple, bool isUpd=
ate)
- 							oper->oprowner);
-=20
- 	/* Dependency on extension */
--	recordDependencyOnCurrentExtension(&myself, true);
-+	recordDependencyOnCurrentExtension(&myself, isUpdate);
-=20
- 	return myself;
- }
-diff --git a/src/backend/catalog/pg_type.c b/src/backend/catalog/pg_type=
.c
-index 2a51501..3ff017f 100644
---- a/src/backend/catalog/pg_type.c
-+++ b/src/backend/catalog/pg_type.c
-@@ -528,10 +528,9 @@ TypeCreate(Oid newTypeOid,
-  * If rebuild is true, we remove existing dependencies and rebuild them
-  * from scratch.  This is needed for ALTER TYPE, and also when replacin=
g
-  * a shell type.  We don't remove an existing extension dependency, tho=
ugh.
-- * (That means an extension can't absorb a shell type created in anothe=
r
-- * extension, nor ALTER a type created by another extension.  Also, if =
it
-- * replaces a free-standing shell type or ALTERs a free-standing type,
-- * that type will become a member of the extension.)
-+ * That means an extension can't absorb a shell type that is free-stand=
ing
-+ * or belongs to another extension, nor ALTER a type that is free-stand=
ing or
-+ * belongs to another extension.
-  */
- void
- GenerateTypeDependencies(Oid typeObjectId,
-diff --git a/src/backend/commands/createas.c b/src/backend/commands/crea=
teas.c
-index 4c1d909..a68d945 100644
---- a/src/backend/commands/createas.c
-+++ b/src/backend/commands/createas.c
-@@ -243,15 +243,27 @@ ExecCreateTableAs(CreateTableAsStmt *stmt, const c=
har *queryString,
- 	if (stmt->if_not_exists)
- 	{
- 		Oid			nspid;
-+		Oid			oldrelid;
-=20
--		nspid =3D RangeVarGetCreationNamespace(stmt->into->rel);
-+		nspid =3D RangeVarGetCreationNamespace(into->rel);
-=20
--		if (get_relname_relid(stmt->into->rel->relname, nspid))
-+		oldrelid =3D get_relname_relid(into->rel->relname, nspid);
-+		if (OidIsValid(oldrelid))
- 		{
-+			/*
-+			 * The relation exists and IF NOT EXISTS has been specified.
-+			 *
-+			 * If we are in an extension script, insist that the pre-existing
-+			 * object be a member of the extension, to avoid security risks.
-+			 */
-+			ObjectAddressSet(address, RelationRelationId, oldrelid);
-+			checkMembershipInCurrentExtension(&address);
-+
-+			/* OK to skip */
- 			ereport(NOTICE,
- 					(errcode(ERRCODE_DUPLICATE_TABLE),
- 					 errmsg("relation \"%s\" already exists, skipping",
--							stmt->into->rel->relname)));
-+							into->rel->relname)));
- 			return InvalidObjectAddress;
- 		}
- 	}
-diff --git a/src/backend/commands/foreigncmds.c b/src/backend/commands/f=
oreigncmds.c
-index d7bc6e3..bc583c6 100644
---- a/src/backend/commands/foreigncmds.c
-+++ b/src/backend/commands/foreigncmds.c
-@@ -887,13 +887,22 @@ CreateForeignServer(CreateForeignServerStmt *stmt)
- 	ownerId =3D GetUserId();
-=20
- 	/*
--	 * Check that there is no other foreign server by this name. Do nothin=
g if
--	 * IF NOT EXISTS was enforced.
-+	 * Check that there is no other foreign server by this name.  If there=
 is
-+	 * one, do nothing if IF NOT EXISTS was specified.
- 	 */
--	if (GetForeignServerByName(stmt->servername, true) !=3D NULL)
-+	srvId =3D get_foreign_server_oid(stmt->servername, true);
-+	if (OidIsValid(srvId))
- 	{
- 		if (stmt->if_not_exists)
- 		{
-+			/*
-+			 * If we are in an extension script, insist that the pre-existing
-+			 * object be a member of the extension, to avoid security risks.
-+			 */
-+			ObjectAddressSet(myself, ForeignServerRelationId, srvId);
-+			checkMembershipInCurrentExtension(&myself);
-+
-+			/* OK to skip */
- 			ereport(NOTICE,
- 					(errcode(ERRCODE_DUPLICATE_OBJECT),
- 					 errmsg("server \"%s\" already exists, skipping",
-@@ -1182,6 +1191,10 @@ CreateUserMapping(CreateUserMappingStmt *stmt)
- 	{
- 		if (stmt->if_not_exists)
- 		{
-+			/*
-+			 * Since user mappings aren't members of extensions (see comments
-+			 * below), no need for checkMembershipInCurrentExtension here.
-+			 */
- 			ereport(NOTICE,
- 					(errcode(ERRCODE_DUPLICATE_OBJECT),
- 					 errmsg("user mapping for \"%s\" already exists for server \"%s\",=
 skipping",
-diff --git a/src/backend/commands/schemacmds.c b/src/backend/commands/sc=
hemacmds.c
-index 6cf94a3..6bc4edc 100644
---- a/src/backend/commands/schemacmds.c
-+++ b/src/backend/commands/schemacmds.c
-@@ -113,14 +113,25 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const =
char *queryString,
- 	 * the permissions checks, but since CREATE TABLE IF NOT EXISTS makes =
its
- 	 * creation-permission check first, we do likewise.
- 	 */
--	if (stmt->if_not_exists &&
--		SearchSysCacheExists1(NAMESPACENAME, PointerGetDatum(schemaName)))
-+	if (stmt->if_not_exists)
- 	{
--		ereport(NOTICE,
--				(errcode(ERRCODE_DUPLICATE_SCHEMA),
--				 errmsg("schema \"%s\" already exists, skipping",
--						schemaName)));
--		return InvalidOid;
-+		namespaceId =3D get_namespace_oid(schemaName, true);
-+		if (OidIsValid(namespaceId))
-+		{
-+			/*
-+			 * If we are in an extension script, insist that the pre-existing
-+			 * object be a member of the extension, to avoid security risks.
-+			 */
-+			ObjectAddressSet(address, NamespaceRelationId, namespaceId);
-+			checkMembershipInCurrentExtension(&address);
-+
-+			/* OK to skip */
-+			ereport(NOTICE,
-+					(errcode(ERRCODE_DUPLICATE_SCHEMA),
-+					 errmsg("schema \"%s\" already exists, skipping",
-+							schemaName)));
-+			return InvalidOid;
-+		}
- 	}
-=20
- 	/*
-diff --git a/src/backend/commands/sequence.c b/src/backend/commands/sequ=
ence.c
-index 0960b33..0577184 100644
---- a/src/backend/commands/sequence.c
-+++ b/src/backend/commands/sequence.c
-@@ -149,6 +149,14 @@ DefineSequence(ParseState *pstate, CreateSeqStmt *s=
eq)
- 		RangeVarGetAndCheckCreationNamespace(seq->sequence, NoLock, &seqoid);
- 		if (OidIsValid(seqoid))
- 		{
-+			/*
-+			 * If we are in an extension script, insist that the pre-existing
-+			 * object be a member of the extension, to avoid security risks.
-+			 */
-+			ObjectAddressSet(address, RelationRelationId, seqoid);
-+			checkMembershipInCurrentExtension(&address);
-+
-+			/* OK to skip */
- 			ereport(NOTICE,
- 					(errcode(ERRCODE_DUPLICATE_TABLE),
- 					 errmsg("relation \"%s\" already exists, skipping",
-diff --git a/src/backend/commands/statscmds.c b/src/backend/commands/sta=
tscmds.c
-index 5678d31..409cf28 100644
---- a/src/backend/commands/statscmds.c
-+++ b/src/backend/commands/statscmds.c
-@@ -173,6 +173,10 @@ CreateStatistics(CreateStatsStmt *stmt)
- 	{
- 		if (stmt->if_not_exists)
- 		{
-+			/*
-+			 * Since stats objects aren't members of extensions (see comments
-+			 * below), no need for checkMembershipInCurrentExtension here.
-+			 */
- 			ereport(NOTICE,
- 					(errcode(ERRCODE_DUPLICATE_OBJECT),
- 					 errmsg("statistics object \"%s\" already exists, skipping",
-diff --git a/src/backend/commands/view.c b/src/backend/commands/view.c
-index 87ed453..dd7cc97 100644
---- a/src/backend/commands/view.c
-+++ b/src/backend/commands/view.c
-@@ -205,7 +205,7 @@ DefineVirtualRelation(RangeVar *relation, List *tlis=
t, bool replace,
- 		CommandCounterIncrement();
-=20
- 		/*
--		 * Finally update the view options.
-+		 * Update the view's options.
- 		 *
- 		 * The new options list replaces the existing options list, even if
- 		 * it's empty.
-@@ -218,8 +218,22 @@ DefineVirtualRelation(RangeVar *relation, List *tli=
st, bool replace,
- 		/* EventTriggerAlterTableStart called by ProcessUtilitySlow */
- 		AlterTableInternal(viewOid, atcmds, true);
-=20
-+		/*
-+		 * There is very little to do here to update the view's dependencies.
-+		 * Most view-level dependency relationships, such as those on the
-+		 * owner, schema, and associated composite type, aren't changing.
-+		 * Because we don't allow changing type or collation of an existing
-+		 * view column, those dependencies of the existing columns don't
-+		 * change either, while the AT_AddColumnToView machinery took care of
-+		 * adding such dependencies for new view columns.  The dependencies o=
f
-+		 * the view's query could have changed arbitrarily, but that was deal=
t
-+		 * with inside StoreViewQuery.  What remains is only to check that
-+		 * view replacement is allowed when we're creating an extension.
-+		 */
- 		ObjectAddressSet(address, RelationRelationId, viewOid);
-=20
-+		recordDependencyOnCurrentExtension(&address, true);
-+
- 		/*
- 		 * Seems okay, so return the OID of the pre-existing view.
- 		 */
-diff --git a/src/backend/parser/parse_utilcmd.c b/src/backend/parser/par=
se_utilcmd.c
-index 44aa38a..8f4d940 100644
---- a/src/backend/parser/parse_utilcmd.c
-+++ b/src/backend/parser/parse_utilcmd.c
-@@ -206,6 +206,16 @@ transformCreateStmt(CreateStmt *stmt, const char *q=
ueryString)
- 	 */
- 	if (stmt->if_not_exists && OidIsValid(existing_relid))
- 	{
-+		/*
-+		 * If we are in an extension script, insist that the pre-existing
-+		 * object be a member of the extension, to avoid security risks.
-+		 */
-+		ObjectAddress address;
-+
-+		ObjectAddressSet(address, RelationRelationId, existing_relid);
-+		checkMembershipInCurrentExtension(&address);
-+
-+		/* OK to skip */
- 		ereport(NOTICE,
- 				(errcode(ERRCODE_DUPLICATE_TABLE),
- 				 errmsg("relation \"%s\" already exists, skipping",
-diff --git a/src/include/catalog/dependency.h b/src/include/catalog/depe=
ndency.h
-index 8b1e3aa..27c7509 100644
---- a/src/include/catalog/dependency.h
-+++ b/src/include/catalog/dependency.h
-@@ -201,6 +201,8 @@ extern void recordMultipleDependencies(const ObjectA=
ddress *depender,
- extern void recordDependencyOnCurrentExtension(const ObjectAddress *obj=
ect,
- 											   bool isReplace);
-=20
-+extern void checkMembershipInCurrentExtension(const ObjectAddress *obje=
ct);
-+
- extern long deleteDependencyRecordsFor(Oid classId, Oid objectId,
- 									   bool skipExtensionDeps);
-=20
-diff --git a/src/test/modules/test_extensions/Makefile b/src/test/module=
s/test_extensions/Makefile
-index d18108e..7428f15 100644
---- a/src/test/modules/test_extensions/Makefile
-+++ b/src/test/modules/test_extensions/Makefile
-@@ -4,10 +4,13 @@ MODULE =3D test_extensions
- PGFILEDESC =3D "test_extensions - regression testing for EXTENSION supp=
ort"
-=20
- EXTENSION =3D test_ext1 test_ext2 test_ext3 test_ext4 test_ext5 test_ex=
t6 \
--            test_ext7 test_ext8 test_ext_cyclic1 test_ext_cyclic2
-+            test_ext7 test_ext8 test_ext_cine test_ext_cor \
-+            test_ext_cyclic1 test_ext_cyclic2
- DATA =3D test_ext1--1.0.sql test_ext2--1.0.sql test_ext3--1.0.sql \
-        test_ext4--1.0.sql test_ext5--1.0.sql test_ext6--1.0.sql \
-        test_ext7--1.0.sql test_ext7--1.0--2.0.sql test_ext8--1.0.sql \
-+       test_ext_cine--1.0.sql test_ext_cine--1.0--1.1.sql \
-+       test_ext_cor--1.0.sql \
-        test_ext_cyclic1--1.0.sql test_ext_cyclic2--1.0.sql
-=20
- REGRESS =3D test_extensions test_extdepend
-diff --git a/src/test/modules/test_extensions/expected/test_extensions.o=
ut b/src/test/modules/test_extensions/expected/test_extensions.out
-index b5cbdfc..1e91640 100644
---- a/src/test/modules/test_extensions/expected/test_extensions.out
-+++ b/src/test/modules/test_extensions/expected/test_extensions.out
-@@ -154,3 +154,156 @@ DROP TABLE test_ext4_tab;
- DROP FUNCTION create_extension_with_temp_schema();
- RESET client_min_messages;
- \unset SHOW_CONTEXT
-+-- It's generally bad style to use CREATE OR REPLACE unnecessarily.
-+-- Test what happens if an extension does it anyway.
-+-- Replacing a shell type or operator is sort of like CREATE OR REPLACE=
;
-+-- check that too.
-+CREATE FUNCTION ext_cor_func() RETURNS text
-+  AS $$ SELECT 'ext_cor_func: original'::text $$ LANGUAGE sql;
-+CREATE EXTENSION test_ext_cor;  -- fail
-+ERROR:  function ext_cor_func() is not a member of extension "test_ext_=
cor"
-+DETAIL:  An extension is not allowed to replace an object that it does =
not own.
-+SELECT ext_cor_func();
-+      ext_cor_func     =20
-+------------------------
-+ ext_cor_func: original
-+(1 row)
-+
-+DROP FUNCTION ext_cor_func();
-+CREATE VIEW ext_cor_view AS
-+  SELECT 'ext_cor_view: original'::text AS col;
-+CREATE EXTENSION test_ext_cor;  -- fail
-+ERROR:  view ext_cor_view is not a member of extension "test_ext_cor"
-+DETAIL:  An extension is not allowed to replace an object that it does =
not own.
-+SELECT ext_cor_func();
-+ERROR:  function ext_cor_func() does not exist
-+LINE 1: SELECT ext_cor_func();
-+               ^
-+HINT:  No function matches the given name and argument types. You might=
 need to add explicit type casts.
-+SELECT * FROM ext_cor_view;
-+          col          =20
-+------------------------
-+ ext_cor_view: original
-+(1 row)
-+
-+DROP VIEW ext_cor_view;
-+CREATE TYPE test_ext_type;
-+CREATE EXTENSION test_ext_cor;  -- fail
-+ERROR:  type test_ext_type is not a member of extension "test_ext_cor"
-+DETAIL:  An extension is not allowed to replace an object that it does =
not own.
-+DROP TYPE test_ext_type;
-+-- this makes a shell "point <<@@ polygon" operator too
-+CREATE OPERATOR @@>> ( PROCEDURE =3D poly_contain_pt,
-+  LEFTARG =3D polygon, RIGHTARG =3D point,
-+  COMMUTATOR =3D <<@@ );
-+CREATE EXTENSION test_ext_cor;  -- fail
-+ERROR:  operator <<@@(point,polygon) is not a member of extension "test=
_ext_cor"
-+DETAIL:  An extension is not allowed to replace an object that it does =
not own.
-+DROP OPERATOR <<@@ (point, polygon);
-+CREATE EXTENSION test_ext_cor;  -- now it should work
-+SELECT ext_cor_func();
-+         ext_cor_func        =20
-+------------------------------
-+ ext_cor_func: from extension
-+(1 row)
-+
-+SELECT * FROM ext_cor_view;
-+             col             =20
-+------------------------------
-+ ext_cor_view: from extension
-+(1 row)
-+
-+SELECT 'x'::test_ext_type;
-+ test_ext_type=20
-+---------------
-+ x
-+(1 row)
-+
-+SELECT point(0,0) <<@@ polygon(circle(point(0,0),1));
-+ ?column?=20
-+----------
-+ t
-+(1 row)
-+
-+\dx+ test_ext_cor
-+Objects in extension "test_ext_cor"
-+      Object description     =20
-+------------------------------
-+ function ext_cor_func()
-+ operator <<@@(point,polygon)
-+ type test_ext_type
-+ view ext_cor_view
-+(4 rows)
-+
-+--
-+-- CREATE IF NOT EXISTS is an entirely unsound thing for an extension
-+-- to be doing, but let's at least plug the major security hole in it.
-+--
-+CREATE COLLATION ext_cine_coll
-+  ( LC_COLLATE =3D "C", LC_CTYPE =3D "C" );
-+CREATE EXTENSION test_ext_cine;  -- fail
-+ERROR:  collation ext_cine_coll is not a member of extension "test_ext_=
cine"
-+DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip obj=
ect creation if the conflicting object is one that it already owns.
-+DROP COLLATION ext_cine_coll;
-+CREATE MATERIALIZED VIEW ext_cine_mv AS SELECT 11 AS f1;
-+CREATE EXTENSION test_ext_cine;  -- fail
-+ERROR:  materialized view ext_cine_mv is not a member of extension "tes=
t_ext_cine"
-+DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip obj=
ect creation if the conflicting object is one that it already owns.
-+DROP MATERIALIZED VIEW ext_cine_mv;
-+CREATE FOREIGN DATA WRAPPER dummy;
-+CREATE SERVER ext_cine_srv FOREIGN DATA WRAPPER dummy;
-+CREATE EXTENSION test_ext_cine;  -- fail
-+ERROR:  server ext_cine_srv is not a member of extension "test_ext_cine=
"
-+DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip obj=
ect creation if the conflicting object is one that it already owns.
-+DROP SERVER ext_cine_srv;
-+CREATE SCHEMA ext_cine_schema;
-+CREATE EXTENSION test_ext_cine;  -- fail
-+ERROR:  schema ext_cine_schema is not a member of extension "test_ext_c=
ine"
-+DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip obj=
ect creation if the conflicting object is one that it already owns.
-+DROP SCHEMA ext_cine_schema;
-+CREATE SEQUENCE ext_cine_seq;
-+CREATE EXTENSION test_ext_cine;  -- fail
-+ERROR:  sequence ext_cine_seq is not a member of extension "test_ext_ci=
ne"
-+DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip obj=
ect creation if the conflicting object is one that it already owns.
-+DROP SEQUENCE ext_cine_seq;
-+CREATE TABLE ext_cine_tab1 (x int);
-+CREATE EXTENSION test_ext_cine;  -- fail
-+ERROR:  table ext_cine_tab1 is not a member of extension "test_ext_cine=
"
-+DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip obj=
ect creation if the conflicting object is one that it already owns.
-+DROP TABLE ext_cine_tab1;
-+CREATE TABLE ext_cine_tab2 AS SELECT 42 AS y;
-+CREATE EXTENSION test_ext_cine;  -- fail
-+ERROR:  table ext_cine_tab2 is not a member of extension "test_ext_cine=
"
-+DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip obj=
ect creation if the conflicting object is one that it already owns.
-+DROP TABLE ext_cine_tab2;
-+CREATE EXTENSION test_ext_cine;
-+\dx+ test_ext_cine
-+Objects in extension "test_ext_cine"
-+        Object description        =20
-+-----------------------------------
-+ collation ext_cine_coll
-+ foreign-data wrapper ext_cine_fdw
-+ materialized view ext_cine_mv
-+ schema ext_cine_schema
-+ sequence ext_cine_seq
-+ server ext_cine_srv
-+ table ext_cine_tab1
-+ table ext_cine_tab2
-+(8 rows)
-+
-+ALTER EXTENSION test_ext_cine UPDATE TO '1.1';
-+\dx+ test_ext_cine
-+Objects in extension "test_ext_cine"
-+        Object description        =20
-+-----------------------------------
-+ collation ext_cine_coll
-+ foreign-data wrapper ext_cine_fdw
-+ materialized view ext_cine_mv
-+ schema ext_cine_schema
-+ sequence ext_cine_seq
-+ server ext_cine_srv
-+ table ext_cine_tab1
-+ table ext_cine_tab2
-+ table ext_cine_tab3
-+(9 rows)
-+
-diff --git a/src/test/modules/test_extensions/sql/test_extensions.sql b/=
src/test/modules/test_extensions/sql/test_extensions.sql
-index f505466..b3d4579 100644
---- a/src/test/modules/test_extensions/sql/test_extensions.sql
-+++ b/src/test/modules/test_extensions/sql/test_extensions.sql
-@@ -93,3 +93,113 @@ DROP TABLE test_ext4_tab;
- DROP FUNCTION create_extension_with_temp_schema();
- RESET client_min_messages;
- \unset SHOW_CONTEXT
-+
-+-- It's generally bad style to use CREATE OR REPLACE unnecessarily.
-+-- Test what happens if an extension does it anyway.
-+-- Replacing a shell type or operator is sort of like CREATE OR REPLACE=
;
-+-- check that too.
-+
-+CREATE FUNCTION ext_cor_func() RETURNS text
-+  AS $$ SELECT 'ext_cor_func: original'::text $$ LANGUAGE sql;
-+
-+CREATE EXTENSION test_ext_cor;  -- fail
-+
-+SELECT ext_cor_func();
-+
-+DROP FUNCTION ext_cor_func();
-+
-+CREATE VIEW ext_cor_view AS
-+  SELECT 'ext_cor_view: original'::text AS col;
-+
-+CREATE EXTENSION test_ext_cor;  -- fail
-+
-+SELECT ext_cor_func();
-+
-+SELECT * FROM ext_cor_view;
-+
-+DROP VIEW ext_cor_view;
-+
-+CREATE TYPE test_ext_type;
-+
-+CREATE EXTENSION test_ext_cor;  -- fail
-+
-+DROP TYPE test_ext_type;
-+
-+-- this makes a shell "point <<@@ polygon" operator too
-+CREATE OPERATOR @@>> ( PROCEDURE =3D poly_contain_pt,
-+  LEFTARG =3D polygon, RIGHTARG =3D point,
-+  COMMUTATOR =3D <<@@ );
-+
-+CREATE EXTENSION test_ext_cor;  -- fail
-+
-+DROP OPERATOR <<@@ (point, polygon);
-+
-+CREATE EXTENSION test_ext_cor;  -- now it should work
-+
-+SELECT ext_cor_func();
-+
-+SELECT * FROM ext_cor_view;
-+
-+SELECT 'x'::test_ext_type;
-+
-+SELECT point(0,0) <<@@ polygon(circle(point(0,0),1));
-+
-+\dx+ test_ext_cor
-+
-+--
-+-- CREATE IF NOT EXISTS is an entirely unsound thing for an extension
-+-- to be doing, but let's at least plug the major security hole in it.
-+--
-+
-+CREATE COLLATION ext_cine_coll
-+  ( LC_COLLATE =3D "C", LC_CTYPE =3D "C" );
-+
-+CREATE EXTENSION test_ext_cine;  -- fail
-+
-+DROP COLLATION ext_cine_coll;
-+
-+CREATE MATERIALIZED VIEW ext_cine_mv AS SELECT 11 AS f1;
-+
-+CREATE EXTENSION test_ext_cine;  -- fail
-+
-+DROP MATERIALIZED VIEW ext_cine_mv;
-+
-+CREATE FOREIGN DATA WRAPPER dummy;
-+
-+CREATE SERVER ext_cine_srv FOREIGN DATA WRAPPER dummy;
-+
-+CREATE EXTENSION test_ext_cine;  -- fail
-+
-+DROP SERVER ext_cine_srv;
-+
-+CREATE SCHEMA ext_cine_schema;
-+
-+CREATE EXTENSION test_ext_cine;  -- fail
-+
-+DROP SCHEMA ext_cine_schema;
-+
-+CREATE SEQUENCE ext_cine_seq;
-+
-+CREATE EXTENSION test_ext_cine;  -- fail
-+
-+DROP SEQUENCE ext_cine_seq;
-+
-+CREATE TABLE ext_cine_tab1 (x int);
-+
-+CREATE EXTENSION test_ext_cine;  -- fail
-+
-+DROP TABLE ext_cine_tab1;
-+
-+CREATE TABLE ext_cine_tab2 AS SELECT 42 AS y;
-+
-+CREATE EXTENSION test_ext_cine;  -- fail
-+
-+DROP TABLE ext_cine_tab2;
-+
-+CREATE EXTENSION test_ext_cine;
-+
-+\dx+ test_ext_cine
-+
-+ALTER EXTENSION test_ext_cine UPDATE TO '1.1';
-+
-+\dx+ test_ext_cine
-diff --git a/src/test/modules/test_extensions/test_ext_cine--1.0--1.1.sq=
l b/src/test/modules/test_extensions/test_ext_cine--1.0--1.1.sql
-new file mode 100644
-index 0000000..6dadfd2
---- /dev/null
-+++ b/src/test/modules/test_extensions/test_ext_cine--1.0--1.1.sql
-@@ -0,0 +1,26 @@
-+/* src/test/modules/test_extensions/test_ext_cine--1.0--1.1.sql */
-+-- complain if script is sourced in psql, rather than via ALTER EXTENSI=
ON
-+\echo Use "ALTER EXTENSION test_ext_cine UPDATE TO '1.1'" to load this =
file. \quit
-+
-+--
-+-- These are the same commands as in the 1.0 script; we expect them
-+-- to do nothing.
-+--
-+
-+CREATE COLLATION IF NOT EXISTS ext_cine_coll
-+  ( LC_COLLATE =3D "POSIX", LC_CTYPE =3D "POSIX" );
-+
-+CREATE MATERIALIZED VIEW IF NOT EXISTS ext_cine_mv AS SELECT 42 AS f1;
-+
-+CREATE SERVER IF NOT EXISTS ext_cine_srv FOREIGN DATA WRAPPER ext_cine_=
fdw;
-+
-+CREATE SCHEMA IF NOT EXISTS ext_cine_schema;
-+
-+CREATE SEQUENCE IF NOT EXISTS ext_cine_seq;
-+
-+CREATE TABLE IF NOT EXISTS ext_cine_tab1 (x int);
-+
-+CREATE TABLE IF NOT EXISTS ext_cine_tab2 AS SELECT 42 AS y;
-+
-+-- just to verify the script ran
-+CREATE TABLE ext_cine_tab3 (z int);
-diff --git a/src/test/modules/test_extensions/test_ext_cine--1.0.sql b/s=
rc/test/modules/test_extensions/test_ext_cine--1.0.sql
-new file mode 100644
-index 0000000..01408ff
---- /dev/null
-+++ b/src/test/modules/test_extensions/test_ext_cine--1.0.sql
-@@ -0,0 +1,25 @@
-+/* src/test/modules/test_extensions/test_ext_cine--1.0.sql */
-+-- complain if script is sourced in psql, rather than via CREATE EXTENS=
ION
-+\echo Use "CREATE EXTENSION test_ext_cine" to load this file. \quit
-+
-+--
-+-- CREATE IF NOT EXISTS is an entirely unsound thing for an extension
-+-- to be doing, but let's at least plug the major security hole in it.
-+--
-+
-+CREATE COLLATION IF NOT EXISTS ext_cine_coll
-+  ( LC_COLLATE =3D "POSIX", LC_CTYPE =3D "POSIX" );
-+
-+CREATE MATERIALIZED VIEW IF NOT EXISTS ext_cine_mv AS SELECT 42 AS f1;
-+
-+CREATE FOREIGN DATA WRAPPER ext_cine_fdw;
-+
-+CREATE SERVER IF NOT EXISTS ext_cine_srv FOREIGN DATA WRAPPER ext_cine_=
fdw;
-+
-+CREATE SCHEMA IF NOT EXISTS ext_cine_schema;
-+
-+CREATE SEQUENCE IF NOT EXISTS ext_cine_seq;
-+
-+CREATE TABLE IF NOT EXISTS ext_cine_tab1 (x int);
-+
-+CREATE TABLE IF NOT EXISTS ext_cine_tab2 AS SELECT 42 AS y;
-diff --git a/src/test/modules/test_extensions/test_ext_cine.control b/sr=
c/test/modules/test_extensions/test_ext_cine.control
-new file mode 100644
-index 0000000..ced713b
---- /dev/null
-+++ b/src/test/modules/test_extensions/test_ext_cine.control
-@@ -0,0 +1,3 @@
-+comment =3D 'Test extension using CREATE IF NOT EXISTS'
-+default_version =3D '1.0'
-+relocatable =3D true
-diff --git a/src/test/modules/test_extensions/test_ext_cor--1.0.sql b/sr=
c/test/modules/test_extensions/test_ext_cor--1.0.sql
-new file mode 100644
-index 0000000..2e8d89c
---- /dev/null
-+++ b/src/test/modules/test_extensions/test_ext_cor--1.0.sql
-@@ -0,0 +1,20 @@
-+/* src/test/modules/test_extensions/test_ext_cor--1.0.sql */
-+-- complain if script is sourced in psql, rather than via CREATE EXTENS=
ION
-+\echo Use "CREATE EXTENSION test_ext_cor" to load this file. \quit
-+
-+-- It's generally bad style to use CREATE OR REPLACE unnecessarily.
-+-- Test what happens if an extension does it anyway.
-+
-+CREATE OR REPLACE FUNCTION ext_cor_func() RETURNS text
-+  AS $$ SELECT 'ext_cor_func: from extension'::text $$ LANGUAGE sql;
-+
-+CREATE OR REPLACE VIEW ext_cor_view AS
-+  SELECT 'ext_cor_view: from extension'::text AS col;
-+
-+-- These are for testing replacement of a shell type/operator, which wo=
rks
-+-- enough like an implicit OR REPLACE to be important to check.
-+
-+CREATE TYPE test_ext_type AS ENUM('x', 'y');
-+
-+CREATE OPERATOR <<@@ ( PROCEDURE =3D pt_contained_poly,
-+  LEFTARG =3D point, RIGHTARG =3D polygon );
-diff --git a/src/test/modules/test_extensions/test_ext_cor.control b/src=
/test/modules/test_extensions/test_ext_cor.control
-new file mode 100644
-index 0000000..0e972e5
---- /dev/null
-+++ b/src/test/modules/test_extensions/test_ext_cor.control
-@@ -0,0 +1,3 @@
-+comment =3D 'Test extension using CREATE OR REPLACE'
-+default_version =3D '1.0'
-+relocatable =3D true
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch b/=
meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch
deleted file mode 100644
index f4093f4ba..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2022-41862.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 3f7342671341a7a137f2d8b06ab3461cdb0e1d88 Mon Sep 17 00:00:00 2001
-From: Michael Paquier <michael@paquier.xyz>
-Date: Mon, 6 Feb 2023 11:20:31 +0900
-Subject: [PATCH] Properly NULL-terminate GSS receive buffer on error pac=
ket
- reception
-
-pqsecure_open_gss() includes a code path handling error messages with
-v2-style protocol messages coming from the server.  The client-side
-buffer holding the error message does not force a NULL-termination, with
-the data of the server getting copied to the errorMessage of the
-connection.  Hence, it would be possible for a server to send an
-unterminated string and copy arbitrary bytes in the buffer receiving the
-error message in the client, opening the door to a crash or even data
-exposure.
-
-As at this stage of the authentication process the exchange has not been
-completed yet, this could be abused by an attacker without Kerberos
-credentials.  Clients that have a valid kerberos cache are vulnerable as
-libpq opportunistically requests for it except if gssencmode is
-disabled.
-
-Author: Jacob Champion
-Backpatch-through: 12
-Security: CVE-2022-41862
-
-CVE: CVE-2022-41862
-Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=3Dpostgr=
esql.git;a=3Dcommit;h=3D3f7342671341a7a137f2d8b06ab3461cdb0e1d88]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/interfaces/libpq/fe-secure-gssapi.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/interfaces/libpq/fe-secure-gssapi.c b/src/interfaces/li=
bpq/fe-secure-gssapi.c
-index 7b5e383..aef201b 100644
---- a/src/interfaces/libpq/fe-secure-gssapi.c
-+++ b/src/interfaces/libpq/fe-secure-gssapi.c
-@@ -578,6 +578,8 @@ pqsecure_open_gss(PGconn *conn)
-=20
- 			PqGSSRecvLength +=3D ret;
-=20
-+			Assert(PqGSSRecvLength < PQ_GSS_RECV_BUFFER_SIZE);
-+			PqGSSRecvBuffer[PqGSSRecvLength] =3D '\0';
- 			printfPQExpBuffer(&conn->errorMessage, "%s\n", PqGSSRecvBuffer + 1);
-=20
- 			return PGRES_POLLING_FAILED;
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch b/m=
eta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
deleted file mode 100644
index eb0aff80d..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
+++ /dev/null
@@ -1,235 +0,0 @@
-From 23cb8eaeb97df350273cb8902e55842a955339c8 Mon Sep 17 00:00:00 2001
-From: Noah Misch <noah@leadboat.com>
-Date: Mon, 8 May 2023 06:14:07 -0700
-Subject: [PATCH] Replace last PushOverrideSearchPath() call with
- set_config_option().
-
-The two methods don't cooperate, so set_config_option("search_path",
-...) has been ineffective under non-empty overrideStack.  This defect
-enabled an attacker having database-level CREATE privilege to execute
-arbitrary code as the bootstrap superuser.  While that particular attack
-requires v13+ for the trusted extension attribute, other attacks are
-feasible in all supported versions.
-
-Standardize on the combination of NewGUCNestLevel() and
-set_config_option("search_path", ...).  It is newer than
-PushOverrideSearchPath(), more-prevalent, and has no known
-disadvantages.  The "override" mechanism remains for now, for
-compatibility with out-of-tree code.  Users should update such code,
-which likely suffers from the same sort of vulnerability closed here.
-Back-patch to v11 (all supported versions).
-
-Alexander Lakhin.  Reported by Alexander Lakhin.
-
-Security: CVE-2023-2454
-
-Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=3Dpostgr=
esql.git;a=3Dcommitdiff;h=3D23cb8eaeb97df350273cb8902e55842a955339c8]
-CVE: CVE-2023-2454
-Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
----
- src/backend/catalog/namespace.c         |  4 +++
- src/backend/commands/schemacmds.c       | 37 ++++++++++++++------
- src/test/regress/expected/namespace.out | 45 +++++++++++++++++++++++++
- src/test/regress/sql/namespace.sql      | 24 +++++++++++++
- 4 files changed, 100 insertions(+), 10 deletions(-)
-
-diff --git a/src/backend/catalog/namespace.c b/src/backend/catalog/names=
pace.c
-index 48a7058..74a0536 100644
---- a/src/backend/catalog/namespace.c
-+++ b/src/backend/catalog/namespace.c
-@@ -3456,6 +3456,10 @@ OverrideSearchPathMatchesCurrent(OverrideSearchPa=
th *path)
- /*
-  * PushOverrideSearchPath - temporarily override the search path
-  *
-+ * Do not use this function; almost any usage introduces a security
-+ * vulnerability.  It exists for the benefit of legacy code running in
-+ * non-security-sensitive environments.
-+ *
-  * We allow nested overrides, hence the push/pop terminology.  The GUC
-  * search_path variable is ignored while an override is active.
-  *
-diff --git a/src/backend/commands/schemacmds.c b/src/backend/commands/sc=
hemacmds.c
-index 6bc4edc..27b1241 100644
---- a/src/backend/commands/schemacmds.c
-+++ b/src/backend/commands/schemacmds.c
-@@ -29,6 +29,7 @@
- #include "commands/schemacmds.h"
- #include "miscadmin.h"
- #include "parser/parse_utilcmd.h"
-+#include "parser/scansup.h"
- #include "tcop/utility.h"
- #include "utils/acl.h"
- #include "utils/builtins.h"
-@@ -53,14 +54,16 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const ch=
ar *queryString,
- {
- 	const char *schemaName =3D stmt->schemaname;
- 	Oid			namespaceId;
--	OverrideSearchPath *overridePath;
- 	List	   *parsetree_list;
- 	ListCell   *parsetree_item;
- 	Oid			owner_uid;
- 	Oid			saved_uid;
- 	int			save_sec_context;
-+	int			save_nestlevel;
-+	char	   *nsp =3D namespace_search_path;
- 	AclResult	aclresult;
- 	ObjectAddress address;
-+	StringInfoData pathbuf;
-=20
- 	GetUserIdAndSecContext(&saved_uid, &save_sec_context);
-=20
-@@ -153,14 +156,26 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const =
char *queryString,
- 	CommandCounterIncrement();
-=20
- 	/*
--	 * Temporarily make the new namespace be the front of the search path,=
 as
--	 * well as the default creation target namespace.  This will be undone=
 at
--	 * the end of this routine, or upon error.
-+	 * Prepend the new schema to the current search path.
-+	 *
-+	 * We use the equivalent of a function SET option to allow the setting=
 to
-+	 * persist for exactly the duration of the schema creation.  guc.c als=
o
-+	 * takes care of undoing the setting on error.
- 	 */
--	overridePath =3D GetOverrideSearchPath(CurrentMemoryContext);
--	overridePath->schemas =3D lcons_oid(namespaceId, overridePath->schemas=
);
--	/* XXX should we clear overridePath->useTemp? */
--	PushOverrideSearchPath(overridePath);
-+	save_nestlevel =3D NewGUCNestLevel();
-+
-+	initStringInfo(&pathbuf);
-+	appendStringInfoString(&pathbuf, quote_identifier(schemaName));
-+
-+	while (scanner_isspace(*nsp))
-+		nsp++;
-+
-+	if (*nsp !=3D '\0')
-+		appendStringInfo(&pathbuf, ", %s", nsp);
-+
-+	(void) set_config_option("search_path", pathbuf.data,
-+							 PGC_USERSET, PGC_S_SESSION,
-+							 GUC_ACTION_SAVE, true, 0, false);
-=20
- 	/*
- 	 * Report the new schema to possibly interested event triggers.  Note =
we
-@@ -213,8 +228,10 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const c=
har *queryString,
- 		CommandCounterIncrement();
- 	}
-=20
--	/* Reset search path to normal state */
--	PopOverrideSearchPath();
-+	/*
-+	 * Restore the GUC variable search_path we set above.
-+	 */
-+	AtEOXact_GUC(true, save_nestlevel);
-=20
- 	/* Reset current user and security context */
- 	SetUserIdAndSecContext(saved_uid, save_sec_context);
-diff --git a/src/test/regress/expected/namespace.out b/src/test/regress/=
expected/namespace.out
-index 2564d1b..a62fd8d 100644
---- a/src/test/regress/expected/namespace.out
-+++ b/src/test/regress/expected/namespace.out
-@@ -1,6 +1,14 @@
- --
- -- Regression tests for schemas (namespaces)
- --
-+-- set the whitespace-only search_path to test that the
-+-- GUC list syntax is preserved during a schema creation
-+SELECT pg_catalog.set_config('search_path', ' ', false);
-+ set_config=20
-+------------
-+ =20
-+(1 row)
-+
- CREATE SCHEMA test_ns_schema_1
-        CREATE UNIQUE INDEX abc_a_idx ON abc (a)
-        CREATE VIEW abc_view AS
-@@ -9,6 +17,43 @@ CREATE SCHEMA test_ns_schema_1
-               a serial,
-               b int UNIQUE
-        );
-+-- verify that the correct search_path restored on abort
-+SET search_path to public;
-+BEGIN;
-+SET search_path to public, test_ns_schema_1;
-+CREATE SCHEMA test_ns_schema_2
-+       CREATE VIEW abc_view AS SELECT c FROM abc;
-+ERROR:  column "c" does not exist
-+LINE 2:        CREATE VIEW abc_view AS SELECT c FROM abc;
-+                                              ^
-+COMMIT;
-+SHOW search_path;
-+ search_path=20
-+-------------
-+ public
-+(1 row)
-+
-+-- verify that the correct search_path preserved
-+-- after creating the schema and on commit
-+BEGIN;
-+SET search_path to public, test_ns_schema_1;
-+CREATE SCHEMA test_ns_schema_2
-+       CREATE VIEW abc_view AS SELECT a FROM abc;
-+SHOW search_path;
-+       search_path       =20
-+--------------------------
-+ public, test_ns_schema_1
-+(1 row)
-+
-+COMMIT;
-+SHOW search_path;
-+       search_path       =20
-+--------------------------
-+ public, test_ns_schema_1
-+(1 row)
-+
-+DROP SCHEMA test_ns_schema_2 CASCADE;
-+NOTICE:  drop cascades to view test_ns_schema_2.abc_view
- -- verify that the objects were created
- SELECT COUNT(*) FROM pg_class WHERE relnamespace =3D
-     (SELECT oid FROM pg_namespace WHERE nspname =3D 'test_ns_schema_1')=
;
-diff --git a/src/test/regress/sql/namespace.sql b/src/test/regress/sql/n=
amespace.sql
-index 6b12c96..3474f5e 100644
---- a/src/test/regress/sql/namespace.sql
-+++ b/src/test/regress/sql/namespace.sql
-@@ -2,6 +2,10 @@
- -- Regression tests for schemas (namespaces)
- --
-=20
-+-- set the whitespace-only search_path to test that the
-+-- GUC list syntax is preserved during a schema creation
-+SELECT pg_catalog.set_config('search_path', ' ', false);
-+
- CREATE SCHEMA test_ns_schema_1
-        CREATE UNIQUE INDEX abc_a_idx ON abc (a)
-=20
-@@ -13,6 +17,26 @@ CREATE SCHEMA test_ns_schema_1
-               b int UNIQUE
-        );
-=20
-+-- verify that the correct search_path restored on abort
-+SET search_path to public;
-+BEGIN;
-+SET search_path to public, test_ns_schema_1;
-+CREATE SCHEMA test_ns_schema_2
-+       CREATE VIEW abc_view AS SELECT c FROM abc;
-+COMMIT;
-+SHOW search_path;
-+
-+-- verify that the correct search_path preserved
-+-- after creating the schema and on commit
-+BEGIN;
-+SET search_path to public, test_ns_schema_1;
-+CREATE SCHEMA test_ns_schema_2
-+       CREATE VIEW abc_view AS SELECT a FROM abc;
-+SHOW search_path;
-+COMMIT;
-+SHOW search_path;
-+DROP SCHEMA test_ns_schema_2 CASCADE;
-+
- -- verify that the objects were created
- SELECT COUNT(*) FROM pg_class WHERE relnamespace =3D
-     (SELECT oid FROM pg_namespace WHERE nspname =3D 'test_ns_schema_1')=
;
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch b/m=
eta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
deleted file mode 100644
index b0bf2dbf2..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 473626cf00babd829eb15c36b51dfb358d32bc95 Mon Sep 17 00:00:00 2001
-From: Tom Lane <tgl@sss.pgh.pa.us>
-Date: Mon, 8 May 2023 10:12:45 -0400
-Subject: [PATCH] Handle RLS dependencies in inlined set-returning functi=
ons
- properly.
-
-If an SRF in the FROM clause references a table having row-level
-security policies, and we inline that SRF into the calling query,
-we neglected to mark the plan as potentially dependent on which
-role is executing it.  This could lead to later executions in the
-same session returning or hiding rows that should have been hidden
-or returned instead.
-
-Our thanks to Wolfgang Walther for reporting this problem.
-
-Stephen Frost and Tom Lane
-
-Security: CVE-2023-2455
-
-Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=3Dpostgr=
esql.git;a=3Dcommitdiff;h=3D473626cf00babd829eb15c36b51dfb358d32bc95]
-CVE: CVE-2023-2455
-Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
----
- src/backend/optimizer/util/clauses.c      |  7 ++++++
- src/test/regress/expected/rowsecurity.out | 27 +++++++++++++++++++++++
- src/test/regress/sql/rowsecurity.sql      | 20 +++++++++++++++++
- 3 files changed, 54 insertions(+)
-
-diff --git a/src/backend/optimizer/util/clauses.c b/src/backend/optimize=
r/util/clauses.c
-index 946e232..b8e469f 100644
---- a/src/backend/optimizer/util/clauses.c
-+++ b/src/backend/optimizer/util/clauses.c
-@@ -5142,6 +5142,13 @@ inline_set_returning_function(PlannerInfo *root, =
RangeTblEntry *rte)
- 	 */
- 	record_plan_function_dependency(root, func_oid);
-=20
-+	/*
-+	 * We must also notice if the inserted query adds a dependency on the
-+	 * calling role due to RLS quals.
-+	 */
-+	if (querytree->hasRowSecurity)
-+		root->glob->dependsOnRole =3D true;
-+
- 	return querytree;
-=20
- 	/* Here if func is not inlinable: release temp memory and return NULL =
*/
-diff --git a/src/test/regress/expected/rowsecurity.out b/src/test/regres=
s/expected/rowsecurity.out
-index 5116e23..26eecd0 100644
---- a/src/test/regress/expected/rowsecurity.out
-+++ b/src/test/regress/expected/rowsecurity.out
-@@ -4001,6 +4001,33 @@ SELECT * FROM rls_tbl;
-=20
- DROP TABLE rls_tbl;
- RESET SESSION AUTHORIZATION;
-+-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency
-+create table rls_t (c text);
-+insert into rls_t values ('invisible to bob');
-+alter table rls_t enable row level security;
-+grant select on rls_t to regress_rls_alice, regress_rls_bob;
-+create policy p1 on rls_t for select to regress_rls_alice using (true);
-+create policy p2 on rls_t for select to regress_rls_bob using (false);
-+create function rls_f () returns setof rls_t
-+  stable language sql
-+  as $$ select * from rls_t $$;
-+prepare q as select current_user, * from rls_f();
-+set role regress_rls_alice;
-+execute q;
-+   current_user    |        c        =20
-+-------------------+------------------
-+ regress_rls_alice | invisible to bob
-+(1 row)
-+
-+set role regress_rls_bob;
-+execute q;
-+ current_user | c=20
-+--------------+---
-+(0 rows)
-+
-+RESET ROLE;
-+DROP FUNCTION rls_f();
-+DROP TABLE rls_t;
- --
- -- Clean up objects
- --
-diff --git a/src/test/regress/sql/rowsecurity.sql b/src/test/regress/sql=
/rowsecurity.sql
-index 178eeb0..83d99e3 100644
---- a/src/test/regress/sql/rowsecurity.sql
-+++ b/src/test/regress/sql/rowsecurity.sql
-@@ -1839,6 +1839,26 @@ SELECT * FROM rls_tbl;
- DROP TABLE rls_tbl;
- RESET SESSION AUTHORIZATION;
-=20
-+-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency
-+create table rls_t (c text);
-+insert into rls_t values ('invisible to bob');
-+alter table rls_t enable row level security;
-+grant select on rls_t to regress_rls_alice, regress_rls_bob;
-+create policy p1 on rls_t for select to regress_rls_alice using (true);
-+create policy p2 on rls_t for select to regress_rls_bob using (false);
-+create function rls_f () returns setof rls_t
-+  stable language sql
-+  as $$ select * from rls_t $$;
-+prepare q as select current_user, * from rls_f();
-+set role regress_rls_alice;
-+execute q;
-+set role regress_rls_bob;
-+execute q;
-+
-+RESET ROLE;
-+DROP FUNCTION rls_f();
-+DROP TABLE rls_t;
-+
- --
- -- Clean up objects
- --
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch =
b/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
deleted file mode 100644
index 92a3dcc71..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Remove duplicate code for riscv
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/src/include/storage/s_lock.h
-+++ b/src/include/storage/s_lock.h
-@@ -341,30 +341,6 @@ tas(volatile slock_t *lock)
- #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
- #endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
-=20
--
--/*
-- * RISC-V likewise uses __sync_lock_test_and_set(int *, int) if availab=
le.
-- */
--#if defined(__riscv)
--#ifdef HAVE_GCC__SYNC_INT32_TAS
--#define HAS_TEST_AND_SET
--
--#define TAS(lock) tas(lock)
--
--typedef int slock_t;
--
--static __inline__ int
--tas(volatile slock_t *lock)
--{
--	return __sync_lock_test_and_set(lock, 1);
--}
--
--#define S_UNLOCK(lock) __sync_lock_release(lock)
--
--#endif	 /* HAVE_GCC__SYNC_INT32_TAS */
--#endif	 /* __riscv */
--
--
- /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
- #if defined(__s390__) || defined(__s390x__)
- #define HAS_TEST_AND_SET
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb b/meta-oe=
/recipes-dbs/postgresql/postgresql_12.16.bb
new file mode 100644
index 000000000..134826220
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.16.bb
@@ -0,0 +1,11 @@
+require postgresql.inc
+
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dc31f662bb2bfb3b4187fe9a53e0=
ffe7c"
+
+SRC_URI +=3D "\
+   file://not-check-libperl.patch \
+   file://0001-Add-support-for-RISC-V.patch \
+   file://0001-Improve-reproducibility.patch \
+"
+
+SRC_URI[sha256sum] =3D "c5f1fff7a0f93e1ec3746417b0594290ece617b4995ed95b=
8d527af0ba0e38f3"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb b/meta-oe/=
recipes-dbs/postgresql/postgresql_12.9.bb
deleted file mode 100644
index a32701cd8..000000000
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require postgresql.inc
-
-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D255f15687738db8068fbe9b938c=
90217"
-
-SRC_URI +=3D "\
-   file://not-check-libperl.patch \
-   file://0001-Add-support-for-RISC-V.patch \
-   file://0001-Improve-reproducibility.patch \
-   file://remove_duplicate.patch \
-   file://CVE-2022-1552.patch \
-   file://CVE-2022-2625.patch \
-   file://CVE-2022-41862.patch \
-   file://CVE-2023-2454.patch \
-   file://CVE-2023-2455.patch \
-"
-
-SRC_URI[sha256sum] =3D "89fda2de33ed04a98548e43f3ee5f15b882be17505d631fe=
0dd1a540a2b56dce"
--=20
2.41.0


