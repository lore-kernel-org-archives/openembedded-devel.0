Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1F7EE49A4
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 02:13:26 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com [212.3.242.68])
 by mx.groups.io with SMTP id smtpd.web11.2474.1692583998275982297
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Aug 2023 19:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup 20230812-3u04._domainkey.redrectangle.org on 127.0.0.1:53: no such host" header.i=robert.joslyn@redrectangle.org header.s=20230812-3u04 header.b=tSzgp7UD;
 spf=pass (domain: redrectangle.org, ip: 212.3.242.68, mailfrom: robert.joslyn@redrectangle.org)
Received: from smtpauth1.co-bxl (smtpauth1.co-bxl [10.2.0.15])
	by wilbur.contactoffice.com (Postfix) with ESMTP id AF461A89;
	Mon, 21 Aug 2023 04:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692583996;
	s=20230812-3u04; d=redrectangle.org;
	i=robert.joslyn@redrectangle.org;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Transfer-Encoding;
	l=19441; bh=z6Vy0vcFXZkliW7b5PMZ5YMqtb94qrIan38uMJNmUKE=;
	b=tSzgp7UD7t4cE4HRFp7Mm26l4NDjEOkFdkA9B+yCx7qNbjpy/MufgQAwPcuXNY1Y
	BjnamsuFpgHaJRYRXCLFQk7nD+DIuWEqGrGMmIstR2iO1glDIRI2/lRCXukTy22YFB9
	4Wx8hYS6C5TTaBGbRLS1qsJuaG8f3PIOHi86B8kC5q39JXhNeqQ8vTjuyUNHitNSrjB
	rUvKvhdc0xW/1c6MxTB5sSVLbbVZAIdwkXxI1BgpUyhFOLOBlA7AsHaLNBBy6Hbb8h2
	XiKTWQTxSA2z1tSd3uN0z0Ej3qBiixuqf10KsLM+wTXgKKDis/Hv84TjejaWMq36h1j
	dVK3imhXgw==
Received: by smtp.mailfence.com with ESMTPSA ; Mon, 21 Aug 2023 04:13:09 +0200 (CEST)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-devel@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [meta-oe][kirkstone][PATCH] postgresql: Update to 14.9
Date: Sun, 20 Aug 2023 19:12:57 -0700
Message-ID: <20230821021257.796451-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-ContactOffice-Account: com:454140407
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Aug 2023 02:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104503

This is a minor release to address CVEs and other bug fixes without new
features. Remove patches that are fixed in this release. Release notes
are available at:

https://www.postgresql.org/docs/release/14.6/
https://www.postgresql.org/docs/release/14.7/
https://www.postgresql.org/docs/release/14.8/
https://www.postgresql.org/docs/release/14.9/

License-Update: Copyright year updated

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 ...rminate-GSS-receive-buffer-on-error-.patch |  50 ----
 .../postgresql/files/CVE-2023-2454.patch      | 235 ------------------
 .../postgresql/files/CVE-2023-2455.patch      | 118 ---------
 .../postgresql/files/remove_duplicate.patch   |  38 ---
 ...{postgresql_14.5.bb =3D> postgresql_14.9.bb} |   8 +-
 5 files changed, 2 insertions(+), 447 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Properly-NU=
LL-terminate-GSS-receive-buffer-on-error-.patch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.pa=
tch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.pa=
tch
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/remove_duplicate=
.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.5.bb =3D> postgresq=
l_14.9.bb} (54%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Properly-NULL-term=
inate-GSS-receive-buffer-on-error-.patch b/meta-oe/recipes-dbs/postgresql=
/files/0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch
deleted file mode 100644
index 2d11b1888..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Properly-NULL-terminate-G=
SS-receive-buffer-on-error-.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 586b074026d703c29057b04b1318e984701fe195 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 2 Mar 2023 19:10:47 +0800
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
-Upstream-Status: Backport [https://github.com/postgres/postgres/commit/7=
1c37797d7bd78266146a5829ab62b3687c47295]
-CVE: CVE-2022-41862
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/interfaces/libpq/fe-secure-gssapi.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/interfaces/libpq/fe-secure-gssapi.c b/src/interfaces/li=
bpq/fe-secure-gssapi.c
-index c783a53..a42ebc0 100644
---- a/src/interfaces/libpq/fe-secure-gssapi.c
-+++ b/src/interfaces/libpq/fe-secure-gssapi.c
-@@ -577,7 +577,8 @@ pqsecure_open_gss(PGconn *conn)
- 				return result;
-=20
- 			PqGSSRecvLength +=3D ret;
--
-+			Assert(PqGSSRecvLength < PQ_GSS_RECV_BUFFER_SIZE);
-+			PqGSSRecvBuffer[PqGSSRecvLength] =3D '\0';
- 			appendPQExpBuffer(&conn->errorMessage, "%s\n", PqGSSRecvBuffer + 1);
-=20
- 			return PGRES_POLLING_FAILED;
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch b/m=
eta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
deleted file mode 100644
index a2f6927e3..000000000
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
-index 81b6472..0175a91 100644
---- a/src/backend/catalog/namespace.c
-+++ b/src/backend/catalog/namespace.c
-@@ -3518,6 +3518,10 @@ OverrideSearchPathMatchesCurrent(OverrideSearchPa=
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
-index 66306d1..ecd0cbb 100644
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
-@@ -52,14 +53,16 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const ch=
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
-@@ -152,14 +155,26 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const =
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
index a94c65cc0..000000000
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
-index 9d7aa8b..da50bef 100644
---- a/src/backend/optimizer/util/clauses.c
-+++ b/src/backend/optimizer/util/clauses.c
-@@ -5095,6 +5095,13 @@ inline_set_returning_function(PlannerInfo *root, =
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
-index 89397e4..379f988 100644
---- a/src/test/regress/expected/rowsecurity.out
-+++ b/src/test/regress/expected/rowsecurity.out
-@@ -3982,6 +3982,33 @@ SELECT * FROM rls_tbl;
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
-index 44deb42..3015d89 100644
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
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb b/meta-oe/=
recipes-dbs/postgresql/postgresql_14.9.bb
similarity index 54%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
index 315f6db56..f779ea7ab 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.9.bb
@@ -1,21 +1,17 @@
 require postgresql.inc
=20
-LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D75af6e3eeec4a06cdd2e5786732=
36fc3"
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dc31f662bb2bfb3b4187fe9a53e0=
ffe7c"
=20
 SRC_URI +=3D "\
    file://not-check-libperl.patch \
    file://0001-Add-support-for-RISC-V.patch \
    file://0001-Improve-reproducibility.patch \
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
-   file://remove_duplicate.patch \
    file://0001-config_info.c-not-expose-build-info.patch \
-   file://0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patc=
h \
    file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
-   file://CVE-2023-2454.patch \
-   file://CVE-2023-2455.patch \
 "
=20
-SRC_URI[sha256sum] =3D "d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2=
e65b7b6ff64f4a30"
+SRC_URI[sha256sum] =3D "b1fe3ba9b1a7f3a9637dd1656dfdad2889016073fd4d35f1=
3b50143cbbb6a8ef"
=20
 CVE_CHECK_IGNORE +=3D "\
    CVE-2017-8806 \
--=20
2.41.0


