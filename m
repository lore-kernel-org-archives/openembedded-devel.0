Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F1DEB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 10:49:26 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.9979.1687862961143979691
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 03:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=IxdsAFHd;
 spf=pass (domain: mvista.com, ip: 209.85.167.170, mailfrom: vkumbhar@mvista.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3a1ba074dadso2313879b6e.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 03:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687862960; x=1690454960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfTJvUJHFCRb4jGgHuGKjCmdCqYXXoeJwCGL4FzLxoM=;
        b=IxdsAFHdm5Y63MrBtEog/qcd1egok4LX8ailB5zGxcttVWvVJa56U4MHpxEdnTyQAN
         3ZDkKZd8lWhpSiaglCvcZ2eFF8kSzbedCTeLwUIBfCf+yjKBIAausa+y7j9KM0s/wQw2
         a86y6f2Pdm2XdBUXNP1YMdewD5WT0ksbAnR18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687862960; x=1690454960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZfTJvUJHFCRb4jGgHuGKjCmdCqYXXoeJwCGL4FzLxoM=;
        b=W/13+0fa6oLZ8MGcHYZdaDcan2J/LC0TGnYaxkP0u3GUw0BgzOC9eLGZr/wDcYiJCb
         NwMxX6G5uRyEv7FR4oQ+qPqK2L30niA5B5F66BJtKXKPu58uCRtcrWfnXgC/GPeONcYT
         Ru/CI+0uihskK1VLVyCZ16W6Kc030hs5kOuq+CKAo/bH33s6PACIaiMbiAbSHU3h16j4
         7SR5OLObZHMQ0yBU52QIDXVR58eWtKwm0ZpDa9WYAlMGt0njxMDE2cnrG8TS+ZLQMfgb
         SsssxKhtk0AdaME2AKyMA1bEDlxBBT6k9RUI7mQ/lYiTHHHi5bVQbqVTTTZQT0OaM8RF
         Ub9A==
X-Gm-Message-State: AC+VfDz1YB3b5Wd8pbcs9BcEUGQv1koFHwk3cPzObILh1I8u/1qgRJzY
	/r1xcpUBdef8hcbubLzLoMPRYnXOLQrwg/KgvUs=
X-Google-Smtp-Source: ACHHUZ5zlflJAi7ZQS1jWsFYnyXXJB7/JrxRYaUA2yQyLKyO+kyZf507Uioqi2yH8YllCgWNkLGDNg==
X-Received: by 2002:a05:6808:16aa:b0:3a0:50c0:4a5d with SMTP id bb42-20020a05680816aa00b003a050c04a5dmr15988849oib.56.1687862959702;
        Tue, 27 Jun 2023 03:49:19 -0700 (PDT)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.73.110.75])
        by smtp.googlemail.com with ESMTPSA id p16-20020a17090adf9000b0025bf330903esm1196711pjv.1.2023.06.27.03.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 03:49:19 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [meta-oe][dunfell][PATCH] postgresql: fix CVE-2023-2454 & CVE-2023-2455
Date: Tue, 27 Jun 2023 16:18:58 +0530
Message-Id: <20230627104858.1027992-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 10:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103616

fixed Below security CVE:
1)CVE-2023-2454 postgresql: schema_element defeats protective search_path changes.
2)CVE-2023-2455 postgresql: row security policies disregard user ID changes after inlining.

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../postgresql/files/CVE-2023-2454.patch      | 235 ++++++++++++++++++
 .../postgresql/files/CVE-2023-2455.patch      | 118 +++++++++
 .../recipes-dbs/postgresql/postgresql_12.9.bb |   2 +
 3 files changed, 355 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
new file mode 100644
index 0000000000..eb0aff80d7
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
@@ -0,0 +1,235 @@
+From 23cb8eaeb97df350273cb8902e55842a955339c8 Mon Sep 17 00:00:00 2001
+From: Noah Misch <noah@leadboat.com>
+Date: Mon, 8 May 2023 06:14:07 -0700
+Subject: [PATCH] Replace last PushOverrideSearchPath() call with
+ set_config_option().
+
+The two methods don't cooperate, so set_config_option("search_path",
+...) has been ineffective under non-empty overrideStack.  This defect
+enabled an attacker having database-level CREATE privilege to execute
+arbitrary code as the bootstrap superuser.  While that particular attack
+requires v13+ for the trusted extension attribute, other attacks are
+feasible in all supported versions.
+
+Standardize on the combination of NewGUCNestLevel() and
+set_config_option("search_path", ...).  It is newer than
+PushOverrideSearchPath(), more-prevalent, and has no known
+disadvantages.  The "override" mechanism remains for now, for
+compatibility with out-of-tree code.  Users should update such code,
+which likely suffers from the same sort of vulnerability closed here.
+Back-patch to v11 (all supported versions).
+
+Alexander Lakhin.  Reported by Alexander Lakhin.
+
+Security: CVE-2023-2454
+
+Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=23cb8eaeb97df350273cb8902e55842a955339c8]
+CVE: CVE-2023-2454
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/backend/catalog/namespace.c         |  4 +++
+ src/backend/commands/schemacmds.c       | 37 ++++++++++++++------
+ src/test/regress/expected/namespace.out | 45 +++++++++++++++++++++++++
+ src/test/regress/sql/namespace.sql      | 24 +++++++++++++
+ 4 files changed, 100 insertions(+), 10 deletions(-)
+
+diff --git a/src/backend/catalog/namespace.c b/src/backend/catalog/namespace.c
+index 48a7058..74a0536 100644
+--- a/src/backend/catalog/namespace.c
++++ b/src/backend/catalog/namespace.c
+@@ -3456,6 +3456,10 @@ OverrideSearchPathMatchesCurrent(OverrideSearchPath *path)
+ /*
+  * PushOverrideSearchPath - temporarily override the search path
+  *
++ * Do not use this function; almost any usage introduces a security
++ * vulnerability.  It exists for the benefit of legacy code running in
++ * non-security-sensitive environments.
++ *
+  * We allow nested overrides, hence the push/pop terminology.  The GUC
+  * search_path variable is ignored while an override is active.
+  *
+diff --git a/src/backend/commands/schemacmds.c b/src/backend/commands/schemacmds.c
+index 6bc4edc..27b1241 100644
+--- a/src/backend/commands/schemacmds.c
++++ b/src/backend/commands/schemacmds.c
+@@ -29,6 +29,7 @@
+ #include "commands/schemacmds.h"
+ #include "miscadmin.h"
+ #include "parser/parse_utilcmd.h"
++#include "parser/scansup.h"
+ #include "tcop/utility.h"
+ #include "utils/acl.h"
+ #include "utils/builtins.h"
+@@ -53,14 +54,16 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const char *queryString,
+ {
+ 	const char *schemaName = stmt->schemaname;
+ 	Oid			namespaceId;
+-	OverrideSearchPath *overridePath;
+ 	List	   *parsetree_list;
+ 	ListCell   *parsetree_item;
+ 	Oid			owner_uid;
+ 	Oid			saved_uid;
+ 	int			save_sec_context;
++	int			save_nestlevel;
++	char	   *nsp = namespace_search_path;
+ 	AclResult	aclresult;
+ 	ObjectAddress address;
++	StringInfoData pathbuf;
+ 
+ 	GetUserIdAndSecContext(&saved_uid, &save_sec_context);
+ 
+@@ -153,14 +156,26 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const char *queryString,
+ 	CommandCounterIncrement();
+ 
+ 	/*
+-	 * Temporarily make the new namespace be the front of the search path, as
+-	 * well as the default creation target namespace.  This will be undone at
+-	 * the end of this routine, or upon error.
++	 * Prepend the new schema to the current search path.
++	 *
++	 * We use the equivalent of a function SET option to allow the setting to
++	 * persist for exactly the duration of the schema creation.  guc.c also
++	 * takes care of undoing the setting on error.
+ 	 */
+-	overridePath = GetOverrideSearchPath(CurrentMemoryContext);
+-	overridePath->schemas = lcons_oid(namespaceId, overridePath->schemas);
+-	/* XXX should we clear overridePath->useTemp? */
+-	PushOverrideSearchPath(overridePath);
++	save_nestlevel = NewGUCNestLevel();
++
++	initStringInfo(&pathbuf);
++	appendStringInfoString(&pathbuf, quote_identifier(schemaName));
++
++	while (scanner_isspace(*nsp))
++		nsp++;
++
++	if (*nsp != '\0')
++		appendStringInfo(&pathbuf, ", %s", nsp);
++
++	(void) set_config_option("search_path", pathbuf.data,
++							 PGC_USERSET, PGC_S_SESSION,
++							 GUC_ACTION_SAVE, true, 0, false);
+ 
+ 	/*
+ 	 * Report the new schema to possibly interested event triggers.  Note we
+@@ -213,8 +228,10 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const char *queryString,
+ 		CommandCounterIncrement();
+ 	}
+ 
+-	/* Reset search path to normal state */
+-	PopOverrideSearchPath();
++	/*
++	 * Restore the GUC variable search_path we set above.
++	 */
++	AtEOXact_GUC(true, save_nestlevel);
+ 
+ 	/* Reset current user and security context */
+ 	SetUserIdAndSecContext(saved_uid, save_sec_context);
+diff --git a/src/test/regress/expected/namespace.out b/src/test/regress/expected/namespace.out
+index 2564d1b..a62fd8d 100644
+--- a/src/test/regress/expected/namespace.out
++++ b/src/test/regress/expected/namespace.out
+@@ -1,6 +1,14 @@
+ --
+ -- Regression tests for schemas (namespaces)
+ --
++-- set the whitespace-only search_path to test that the
++-- GUC list syntax is preserved during a schema creation
++SELECT pg_catalog.set_config('search_path', ' ', false);
++ set_config 
++------------
++  
++(1 row)
++
+ CREATE SCHEMA test_ns_schema_1
+        CREATE UNIQUE INDEX abc_a_idx ON abc (a)
+        CREATE VIEW abc_view AS
+@@ -9,6 +17,43 @@ CREATE SCHEMA test_ns_schema_1
+               a serial,
+               b int UNIQUE
+        );
++-- verify that the correct search_path restored on abort
++SET search_path to public;
++BEGIN;
++SET search_path to public, test_ns_schema_1;
++CREATE SCHEMA test_ns_schema_2
++       CREATE VIEW abc_view AS SELECT c FROM abc;
++ERROR:  column "c" does not exist
++LINE 2:        CREATE VIEW abc_view AS SELECT c FROM abc;
++                                              ^
++COMMIT;
++SHOW search_path;
++ search_path 
++-------------
++ public
++(1 row)
++
++-- verify that the correct search_path preserved
++-- after creating the schema and on commit
++BEGIN;
++SET search_path to public, test_ns_schema_1;
++CREATE SCHEMA test_ns_schema_2
++       CREATE VIEW abc_view AS SELECT a FROM abc;
++SHOW search_path;
++       search_path        
++--------------------------
++ public, test_ns_schema_1
++(1 row)
++
++COMMIT;
++SHOW search_path;
++       search_path        
++--------------------------
++ public, test_ns_schema_1
++(1 row)
++
++DROP SCHEMA test_ns_schema_2 CASCADE;
++NOTICE:  drop cascades to view test_ns_schema_2.abc_view
+ -- verify that the objects were created
+ SELECT COUNT(*) FROM pg_class WHERE relnamespace =
+     (SELECT oid FROM pg_namespace WHERE nspname = 'test_ns_schema_1');
+diff --git a/src/test/regress/sql/namespace.sql b/src/test/regress/sql/namespace.sql
+index 6b12c96..3474f5e 100644
+--- a/src/test/regress/sql/namespace.sql
++++ b/src/test/regress/sql/namespace.sql
+@@ -2,6 +2,10 @@
+ -- Regression tests for schemas (namespaces)
+ --
+ 
++-- set the whitespace-only search_path to test that the
++-- GUC list syntax is preserved during a schema creation
++SELECT pg_catalog.set_config('search_path', ' ', false);
++
+ CREATE SCHEMA test_ns_schema_1
+        CREATE UNIQUE INDEX abc_a_idx ON abc (a)
+ 
+@@ -13,6 +17,26 @@ CREATE SCHEMA test_ns_schema_1
+               b int UNIQUE
+        );
+ 
++-- verify that the correct search_path restored on abort
++SET search_path to public;
++BEGIN;
++SET search_path to public, test_ns_schema_1;
++CREATE SCHEMA test_ns_schema_2
++       CREATE VIEW abc_view AS SELECT c FROM abc;
++COMMIT;
++SHOW search_path;
++
++-- verify that the correct search_path preserved
++-- after creating the schema and on commit
++BEGIN;
++SET search_path to public, test_ns_schema_1;
++CREATE SCHEMA test_ns_schema_2
++       CREATE VIEW abc_view AS SELECT a FROM abc;
++SHOW search_path;
++COMMIT;
++SHOW search_path;
++DROP SCHEMA test_ns_schema_2 CASCADE;
++
+ -- verify that the objects were created
+ SELECT COUNT(*) FROM pg_class WHERE relnamespace =
+     (SELECT oid FROM pg_namespace WHERE nspname = 'test_ns_schema_1');
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
new file mode 100644
index 0000000000..b0bf2dbf29
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
@@ -0,0 +1,118 @@
+From 473626cf00babd829eb15c36b51dfb358d32bc95 Mon Sep 17 00:00:00 2001
+From: Tom Lane <tgl@sss.pgh.pa.us>
+Date: Mon, 8 May 2023 10:12:45 -0400
+Subject: [PATCH] Handle RLS dependencies in inlined set-returning functions
+ properly.
+
+If an SRF in the FROM clause references a table having row-level
+security policies, and we inline that SRF into the calling query,
+we neglected to mark the plan as potentially dependent on which
+role is executing it.  This could lead to later executions in the
+same session returning or hiding rows that should have been hidden
+or returned instead.
+
+Our thanks to Wolfgang Walther for reporting this problem.
+
+Stephen Frost and Tom Lane
+
+Security: CVE-2023-2455
+
+Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=473626cf00babd829eb15c36b51dfb358d32bc95]
+CVE: CVE-2023-2455
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/backend/optimizer/util/clauses.c      |  7 ++++++
+ src/test/regress/expected/rowsecurity.out | 27 +++++++++++++++++++++++
+ src/test/regress/sql/rowsecurity.sql      | 20 +++++++++++++++++
+ 3 files changed, 54 insertions(+)
+
+diff --git a/src/backend/optimizer/util/clauses.c b/src/backend/optimizer/util/clauses.c
+index 946e232..b8e469f 100644
+--- a/src/backend/optimizer/util/clauses.c
++++ b/src/backend/optimizer/util/clauses.c
+@@ -5142,6 +5142,13 @@ inline_set_returning_function(PlannerInfo *root, RangeTblEntry *rte)
+ 	 */
+ 	record_plan_function_dependency(root, func_oid);
+ 
++	/*
++	 * We must also notice if the inserted query adds a dependency on the
++	 * calling role due to RLS quals.
++	 */
++	if (querytree->hasRowSecurity)
++		root->glob->dependsOnRole = true;
++
+ 	return querytree;
+ 
+ 	/* Here if func is not inlinable: release temp memory and return NULL */
+diff --git a/src/test/regress/expected/rowsecurity.out b/src/test/regress/expected/rowsecurity.out
+index 5116e23..26eecd0 100644
+--- a/src/test/regress/expected/rowsecurity.out
++++ b/src/test/regress/expected/rowsecurity.out
+@@ -4001,6 +4001,33 @@ SELECT * FROM rls_tbl;
+ 
+ DROP TABLE rls_tbl;
+ RESET SESSION AUTHORIZATION;
++-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency
++create table rls_t (c text);
++insert into rls_t values ('invisible to bob');
++alter table rls_t enable row level security;
++grant select on rls_t to regress_rls_alice, regress_rls_bob;
++create policy p1 on rls_t for select to regress_rls_alice using (true);
++create policy p2 on rls_t for select to regress_rls_bob using (false);
++create function rls_f () returns setof rls_t
++  stable language sql
++  as $$ select * from rls_t $$;
++prepare q as select current_user, * from rls_f();
++set role regress_rls_alice;
++execute q;
++   current_user    |        c         
++-------------------+------------------
++ regress_rls_alice | invisible to bob
++(1 row)
++
++set role regress_rls_bob;
++execute q;
++ current_user | c 
++--------------+---
++(0 rows)
++
++RESET ROLE;
++DROP FUNCTION rls_f();
++DROP TABLE rls_t;
+ --
+ -- Clean up objects
+ --
+diff --git a/src/test/regress/sql/rowsecurity.sql b/src/test/regress/sql/rowsecurity.sql
+index 178eeb0..83d99e3 100644
+--- a/src/test/regress/sql/rowsecurity.sql
++++ b/src/test/regress/sql/rowsecurity.sql
+@@ -1839,6 +1839,26 @@ SELECT * FROM rls_tbl;
+ DROP TABLE rls_tbl;
+ RESET SESSION AUTHORIZATION;
+ 
++-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency
++create table rls_t (c text);
++insert into rls_t values ('invisible to bob');
++alter table rls_t enable row level security;
++grant select on rls_t to regress_rls_alice, regress_rls_bob;
++create policy p1 on rls_t for select to regress_rls_alice using (true);
++create policy p2 on rls_t for select to regress_rls_bob using (false);
++create function rls_f () returns setof rls_t
++  stable language sql
++  as $$ select * from rls_t $$;
++prepare q as select current_user, * from rls_f();
++set role regress_rls_alice;
++execute q;
++set role regress_rls_bob;
++execute q;
++
++RESET ROLE;
++DROP FUNCTION rls_f();
++DROP TABLE rls_t;
++
+ --
+ -- Clean up objects
+ --
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
index 808c5d6e77..a32701cd83 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.9.bb
@@ -10,6 +10,8 @@ SRC_URI += "\
    file://CVE-2022-1552.patch \
    file://CVE-2022-2625.patch \
    file://CVE-2022-41862.patch \
+   file://CVE-2023-2454.patch \
+   file://CVE-2023-2455.patch \
 "
 
 SRC_URI[sha256sum] = "89fda2de33ed04a98548e43f3ee5f15b882be17505d631fe0dd1a540a2b56dce"
-- 
2.25.1


