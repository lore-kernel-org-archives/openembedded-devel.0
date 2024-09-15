Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7FAC3ABA8
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 19:49:04 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.121741.1726429741689220627
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 12:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ac78GL+Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ddccc408e1so2323937b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726429741; x=1727034541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dDw0bAoCZu51ngiChlRQ3WePrFIqJFi/g8UuYEozPXk=;
        b=Ac78GL+Q1eCxMohN+BqDVu6fePEegD1aWe3Rn34JVwQvHeP7ROFrJog106i4dTK60z
         f/42mHFjGJgvSVho8rRKbzWW+yW3l1bDKyA4bBMzpZvUQEMRaCt3vx0YKbDBGfpXmFI6
         t80fLwkr3sATY9koM4RC3Rhm7r9eifQeHProL0YiEKwO3p/nChlaPGXe9/GSIGL1P8PU
         aHVGcgYku207YzDJB2m/RaAt+kXsJoNQTSn0LgvJvifrpHIQRMg95aey/mJrfAYvxSOp
         7Bbqlbfk2F86MvRJSFy5sU6+FneTfP4rltaYfpC5tT1AKLDYp4q6bD7vot20C5nZkEm1
         0VJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726429741; x=1727034541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDw0bAoCZu51ngiChlRQ3WePrFIqJFi/g8UuYEozPXk=;
        b=A9dAHEUoQ5X7+YL9AO7OpcpfVz13pqCQWY5I5RPdqILZDBSfPTpsQiAYmxyLR6JPdF
         wUMLRHuZb86FzSDXMtJikhzgs8ec1rmkz+0Wus7gxq5KPIBnxxprQyrNjC5FNaLlxbVH
         TmGHuUQSxJ4dm/fUkHIc5W22swxlCdyCHWtoL324T2e8GQAjFsXWPZQwLHkkluqlEb7e
         FbvnC9aVQADenAmDkgvWnWxAGoTs/d++yn9zYaOhawUNOTOmnG3eGldjeT/xWSqXk8dk
         NHQwsP1GvSSKoUFFx27lMHwXcIVE5WMmBqGJP4yoGlQ5Q8CdLhw3olCGR3hXKxnP0/Ok
         ujJA==
X-Gm-Message-State: AOJu0Yx2xcbLejCzV4oj8fZmQhBBDmQCOR/1KXWe4n4w14qfb2QoVOqD
	83d3RsILlkEmqttWzP1qQfd7QBYp0FDiyw1oXDlRpbdPDHNY/ZYZmgPE0Q==
X-Google-Smtp-Source: AGHT+IGS8rXd+BY+6gLEMp/JF12JY+qbh3Bi97QTf7t9/lORhQoltXGLtketTGztknF8C9eok2JCkQ==
X-Received: by 2002:a05:690c:5c15:b0:6db:d02f:fcb9 with SMTP id 00721157ae682-6dbd02ffdd7mr54469347b3.41.1726429740344;
        Sun, 15 Sep 2024 12:49:00 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000:971b:923e:7e7f:305e])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e28412sm6142817b3.62.2024.09.15.12.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 12:49:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][v2][PATCH] postgresql: upgrade 16.3 -> 16.4
Date: Sun, 15 Sep 2024 15:48:59 -0400
Message-ID: <20240915194859.198400-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 19:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112315

From: Wang Mingyu <wangmy@fujitsu.com>

0003-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 16.4
drop: CVE-2024-7348.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4d253bca26c5e6f9d79e19ab1b62fa34b5c05429)
[Drop CVE patch now included in update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>

---
[V2]
Missed dropping CVE patch
---
 ...c-bypass-autoconf-2.69-version-check.patch |   6 +-
 .../postgresql/files/CVE-2024-7348.patch      | 583 ------------------
 ...{postgresql_16.3.bb => postgresql_16.4.bb} |   3 +-
 3 files changed, 4 insertions(+), 588 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2024-7348.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.3.bb => postgresql_16.4.bb} (82%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 9df4d073ff..342aeba85e 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 401ce30..27f382d 100644
+index 65715a4..4ad6340 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.3], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -28,5 +28,5 @@ index 401ce30..27f382d 100644
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2024-7348.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2024-7348.patch
deleted file mode 100644
index 10c2fa3efe..0000000000
--- a/meta-oe/recipes-dbs/postgresql/files/CVE-2024-7348.patch
+++ /dev/null
@@ -1,583 +0,0 @@
-From 6aba85a4b0a0e60126cc7c598b3e010e272516ec Mon Sep 17 00:00:00 2001
-From: Masahiko Sawada <msawada@postgresql.org>
-Date: Mon, 5 Aug 2024 06:05:28 -0700
-Subject: [PATCH] Restrict accesses to non-system views and foreign tables
- during pg_dump.
-
-When pg_dump retrieves the list of database objects and performs the
-data dump, there was possibility that objects are replaced with others
-of the same name, such as views, and access them. This vulnerability
-could result in code execution with superuser privileges during the
-pg_dump process.
-
-This issue can arise when dumping data of sequences, foreign
-tables (only 13 or later), or tables registered with a WHERE clause in
-the extension configuration table.
-
-To address this, pg_dump now utilizes the newly introduced
-restrict_nonsystem_relation_kind GUC parameter to restrict the
-accesses to non-system views and foreign tables during the dump
-process. This new GUC parameter is added to back branches too, but
-these changes do not require cluster recreation.
-
-Back-patch to all supported branches.
-
-Reviewed-by: Noah Misch
-Security: CVE-2024-7348
-Backpatch-through: 12
-
-Upstream-Status: Backport from [https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=79c7a7e29695a32fef2e65682be224b8d61ec972]
-CVE: CVE-2024-7348
-Signed-off-by: Ashish Sharma <asharma@mvista.com>
-
- .../postgres_fdw/expected/postgres_fdw.out    | 11 ++++
- contrib/postgres_fdw/sql/postgres_fdw.sql     |  8 +++
- doc/src/sgml/config.sgml                      | 17 +++++
- doc/src/sgml/ref/pg_dump.sgml                 |  8 +++
- src/backend/foreign/foreign.c                 | 10 +++
- src/backend/optimizer/plan/createplan.c       | 13 ++++
- src/backend/optimizer/util/plancat.c          | 12 ++++
- src/backend/rewrite/rewriteHandler.c          | 17 +++++
- src/backend/tcop/postgres.c                   | 64 +++++++++++++++++++
- src/backend/utils/misc/guc_tables.c           | 12 ++++
- src/bin/pg_dump/pg_dump.c                     | 47 ++++++++++++++
- src/include/tcop/tcopprot.h                   |  6 ++
- src/include/utils/guc_hooks.h                 |  3 +
- src/test/regress/expected/create_view.out     | 19 +++++-
- src/test/regress/sql/create_view.sql          |  9 +++
- 15 files changed, 255 insertions(+), 1 deletion(-)
-
-diff --git a/contrib/postgres_fdw/expected/postgres_fdw.out b/contrib/postgres_fdw/expected/postgres_fdw.out
-index a6fd3f6ff0..9b7a7eed05 100644
---- a/contrib/postgres_fdw/expected/postgres_fdw.out
-+++ b/contrib/postgres_fdw/expected/postgres_fdw.out
-@@ -637,6 +637,17 @@ EXPLAIN (VERBOSE, COSTS OFF) SELECT * FROM ft_empty ORDER BY c1;
-    Remote SQL: SELECT c1, c2 FROM public.loct_empty ORDER BY c1 ASC NULLS LAST
- (3 rows)
- 
-+-- test restriction on non-system foreign tables.
-+SET restrict_nonsystem_relation_kind TO 'foreign-table';
-+SELECT * from ft1 where c1 < 1; -- ERROR
-+ERROR:  access to non-system foreign table is restricted
-+INSERT INTO ft1 (c1) VALUES (1); -- ERROR
-+ERROR:  access to non-system foreign table is restricted
-+DELETE FROM ft1 WHERE c1 = 1; -- ERROR
-+ERROR:  access to non-system foreign table is restricted
-+TRUNCATE ft1; -- ERROR
-+ERROR:  access to non-system foreign table is restricted
-+RESET restrict_nonsystem_relation_kind;
- -- ===================================================================
- -- WHERE with remotely-executable conditions
- -- ===================================================================
-diff --git a/contrib/postgres_fdw/sql/postgres_fdw.sql b/contrib/postgres_fdw/sql/postgres_fdw.sql
-index 1c1dedd991..80cc3f9d8e 100644
---- a/contrib/postgres_fdw/sql/postgres_fdw.sql
-+++ b/contrib/postgres_fdw/sql/postgres_fdw.sql
-@@ -327,6 +327,14 @@ DELETE FROM loct_empty;
- ANALYZE ft_empty;
- EXPLAIN (VERBOSE, COSTS OFF) SELECT * FROM ft_empty ORDER BY c1;
- 
-+-- test restriction on non-system foreign tables.
-+SET restrict_nonsystem_relation_kind TO 'foreign-table';
-+SELECT * from ft1 where c1 < 1; -- ERROR
-+INSERT INTO ft1 (c1) VALUES (1); -- ERROR
-+DELETE FROM ft1 WHERE c1 = 1; -- ERROR
-+TRUNCATE ft1; -- ERROR
-+RESET restrict_nonsystem_relation_kind;
-+
- -- ===================================================================
- -- WHERE with remotely-executable conditions
- -- ===================================================================
-diff --git a/doc/src/sgml/config.sgml b/doc/src/sgml/config.sgml
-index e8c5d2a3b7..69c4bc614f 100644
---- a/doc/src/sgml/config.sgml
-+++ b/doc/src/sgml/config.sgml
-@@ -9564,6 +9564,23 @@ SET XML OPTION { DOCUMENT | CONTENT };
-       </listitem>
-      </varlistentry>
- 
-+     <varlistentry id="guc-restrict-nonsystem-relation-kind" xreflabel="restrict_nonsystem_relation_kind">
-+      <term><varname>restrict_nonsystem_relation_kind</varname> (<type>string</type>)
-+      <indexterm>
-+       <primary><varname>restrict_nonsystem_relation_kind</varname></primary>
-+       <secondary>configuration parameter</secondary>
-+     </indexterm>
-+     </term>
-+     <listitem>
-+      <para>
-+       This variable specifies relation kind to which access is restricted.
-+       It contains a comma-separated list of relation kind.  Currently, the
-+       supported relation kinds are <literal>view</literal> and
-+       <literal>foreign-table</literal>.
-+      </para>
-+     </listitem>
-+     </varlistentry>
-+
-      </variablelist>
-     </sect2>
-      <sect2 id="runtime-config-client-format">
-diff --git a/doc/src/sgml/ref/pg_dump.sgml b/doc/src/sgml/ref/pg_dump.sgml
-index 7ff5d04c73..b879c30c18 100644
---- a/doc/src/sgml/ref/pg_dump.sgml
-+++ b/doc/src/sgml/ref/pg_dump.sgml
-@@ -868,6 +868,14 @@ PostgreSQL documentation
-         The only exception is that an empty pattern is disallowed.
-        </para>
- 
-+       <note>
-+        <para>
-+         Using wildcards in <option>--include-foreign-data</option> may result
-+         in access to unexpected foreign servers. Also, to use this option securely,
-+         make sure that the named server must have a trusted owner.
-+        </para>
-+       </note>
-+
-        <note>
-         <para>
-          When <option>--include-foreign-data</option> is specified,
-diff --git a/src/backend/foreign/foreign.c b/src/backend/foreign/foreign.c
-index ca3ad55b62..7335838af3 100644
---- a/src/backend/foreign/foreign.c
-+++ b/src/backend/foreign/foreign.c
-@@ -23,6 +23,7 @@
- #include "funcapi.h"
- #include "lib/stringinfo.h"
- #include "miscadmin.h"
-+#include "tcop/tcopprot.h"
- #include "utils/builtins.h"
- #include "utils/memutils.h"
- #include "utils/rel.h"
-@@ -323,6 +324,15 @@ GetFdwRoutine(Oid fdwhandler)
- 	Datum		datum;
- 	FdwRoutine *routine;
- 
-+	/* Check if the access to foreign tables is restricted */
-+	if (unlikely((restrict_nonsystem_relation_kind & RESTRICT_RELKIND_FOREIGN_TABLE) != 0))
-+	{
-+		/* there must not be built-in FDW handler  */
-+		ereport(ERROR,
-+				(errcode(ERRCODE_OBJECT_NOT_IN_PREREQUISITE_STATE),
-+				 errmsg("access to non-system foreign table is restricted")));
-+	}
-+
- 	datum = OidFunctionCall0(fdwhandler);
- 	routine = (FdwRoutine *) DatumGetPointer(datum);
- 
-diff --git a/src/backend/optimizer/plan/createplan.c b/src/backend/optimizer/plan/createplan.c
-index 4bb38160b3..974c50b29f 100644
---- a/src/backend/optimizer/plan/createplan.c
-+++ b/src/backend/optimizer/plan/createplan.c
-@@ -40,6 +40,7 @@
- #include "parser/parse_clause.h"
- #include "parser/parsetree.h"
- #include "partitioning/partprune.h"
-+#include "tcop/tcopprot.h"
- #include "utils/lsyscache.h"
- 
- 
-@@ -7090,7 +7091,19 @@ make_modifytable(PlannerInfo *root, Plan *subplan,
- 
- 			if (rte->rtekind == RTE_RELATION &&
- 				rte->relkind == RELKIND_FOREIGN_TABLE)
-+			{
-+				/* Check if the access to foreign tables is restricted */
-+				if (unlikely((restrict_nonsystem_relation_kind & RESTRICT_RELKIND_FOREIGN_TABLE) != 0))
-+				{
-+					/* there must not be built-in foreign tables */
-+					Assert(rte->relid >= FirstNormalObjectId);
-+					ereport(ERROR,
-+							(errcode(ERRCODE_OBJECT_NOT_IN_PREREQUISITE_STATE),
-+							 errmsg("access to non-system foreign table is restricted")));
-+				}
-+
- 				fdwroutine = GetFdwRoutineByRelId(rte->relid);
-+			}
- 			else
- 				fdwroutine = NULL;
- 		}
-diff --git a/src/backend/optimizer/util/plancat.c b/src/backend/optimizer/util/plancat.c
-index 07c4ba384a..1a3045479f 100644
---- a/src/backend/optimizer/util/plancat.c
-+++ b/src/backend/optimizer/util/plancat.c
-@@ -47,6 +47,7 @@
- #include "rewrite/rewriteManip.h"
- #include "statistics/statistics.h"
- #include "storage/bufmgr.h"
-+#include "tcop/tcopprot.h"
- #include "utils/builtins.h"
- #include "utils/lsyscache.h"
- #include "utils/partcache.h"
-@@ -500,6 +501,17 @@ get_relation_info(PlannerInfo *root, Oid relationObjectId, bool inhparent,
- 	/* Grab foreign-table info using the relcache, while we have it */
- 	if (relation->rd_rel->relkind == RELKIND_FOREIGN_TABLE)
- 	{
-+		/* Check if the access to foreign tables is restricted */
-+		if (unlikely((restrict_nonsystem_relation_kind & RESTRICT_RELKIND_FOREIGN_TABLE) != 0))
-+		{
-+			/* there must not be built-in foreign tables */
-+			Assert(RelationGetRelid(relation) >= FirstNormalObjectId);
-+
-+			ereport(ERROR,
-+					(errcode(ERRCODE_OBJECT_NOT_IN_PREREQUISITE_STATE),
-+					 errmsg("access to non-system foreign table is restricted")));
-+		}
-+
- 		rel->serverid = GetForeignServerIdByRelId(RelationGetRelid(relation));
- 		rel->fdwroutine = GetFdwRoutineForRelation(relation, true);
- 	}
-diff --git a/src/backend/rewrite/rewriteHandler.c b/src/backend/rewrite/rewriteHandler.c
-index 6cef936f82..9cd96fd17e 100644
---- a/src/backend/rewrite/rewriteHandler.c
-+++ b/src/backend/rewrite/rewriteHandler.c
-@@ -41,6 +41,7 @@
- #include "rewrite/rewriteManip.h"
- #include "rewrite/rewriteSearchCycle.h"
- #include "rewrite/rowsecurity.h"
-+#include "tcop/tcopprot.h"
- #include "utils/builtins.h"
- #include "utils/lsyscache.h"
- #include "utils/rel.h"
-@@ -1740,6 +1741,14 @@ ApplyRetrieveRule(Query *parsetree,
- 	if (rule->qual != NULL)
- 		elog(ERROR, "cannot handle qualified ON SELECT rule");
- 
-+	/* Check if the expansion of non-system views are restricted */
-+	if (unlikely((restrict_nonsystem_relation_kind & RESTRICT_RELKIND_VIEW) != 0 &&
-+				 RelationGetRelid(relation) >= FirstNormalObjectId))
-+		ereport(ERROR,
-+				(errcode(ERRCODE_OBJECT_NOT_IN_PREREQUISITE_STATE),
-+				 errmsg("access to non-system view \"%s\" is restricted",
-+						RelationGetRelationName(relation))));
-+
- 	if (rt_index == parsetree->resultRelation)
- 	{
- 		/*
-@@ -3104,6 +3113,14 @@
- 		}
- 	}
- 
-+	/* Check if the expansion of non-system views are restricted */
-+	if (unlikely((restrict_nonsystem_relation_kind & RESTRICT_RELKIND_VIEW) != 0 &&
-+				 RelationGetRelid(view) >= FirstNormalObjectId))
-+		ereport(ERROR,
-+				(errcode(ERRCODE_OBJECT_NOT_IN_PREREQUISITE_STATE),
-+				 errmsg("access to non-system view \"%s\" is restricted",
-+						RelationGetRelationName(view))));
-+	
- 	/*
- 	 * For INSERT/UPDATE the modified columns must all be updatable. Note that
- 	 * we get the modified columns from the query's targetlist, not from the
-diff --git a/src/backend/tcop/postgres.c b/src/backend/tcop/postgres.c
-index 36cc99ec9c..e7d486ca2f 100644
---- a/src/backend/tcop/postgres.c
-+++ b/src/backend/tcop/postgres.c
-@@ -77,6 +77,7 @@
- #include "utils/snapmgr.h"
- #include "utils/timeout.h"
- #include "utils/timestamp.h"
-+#include "utils/varlena.h"
- 
- /* ----------------
-  *		global variables
-@@ -101,6 +102,9 @@ int			PostAuthDelay = 0;
- /* Time between checks that the client is still connected. */
- int			client_connection_check_interval = 0;
- 
-+/* flags for non-system relation kinds to restrict use */
-+int			restrict_nonsystem_relation_kind;
-+
- /* ----------------
-  *		private typedefs etc
-  * ----------------
-@@ -3628,6 +3632,66 @@ check_log_stats(bool *newval, void **extra, GucSource source)
- 	return true;
- }
- 
-+/*
-+ * GUC check_hook for restrict_nonsystem_relation_kind
-+ */
-+bool
-+check_restrict_nonsystem_relation_kind(char **newval, void **extra, GucSource source)
-+{
-+	char	   *rawstring;
-+	List	   *elemlist;
-+	ListCell   *l;
-+	int			flags = 0;
-+
-+	/* Need a modifiable copy of string */
-+	rawstring = pstrdup(*newval);
-+
-+	if (!SplitIdentifierString(rawstring, ',', &elemlist))
-+	{
-+		/* syntax error in list */
-+		GUC_check_errdetail("List syntax is invalid.");
-+		pfree(rawstring);
-+		list_free(elemlist);
-+		return false;
-+	}
-+
-+	foreach(l, elemlist)
-+	{
-+		char	   *tok = (char *) lfirst(l);
-+
-+		if (pg_strcasecmp(tok, "view") == 0)
-+			flags |= RESTRICT_RELKIND_VIEW;
-+		else if (pg_strcasecmp(tok, "foreign-table") == 0)
-+			flags |= RESTRICT_RELKIND_FOREIGN_TABLE;
-+		else
-+		{
-+			GUC_check_errdetail("Unrecognized key word: \"%s\".", tok);
-+			pfree(rawstring);
-+			list_free(elemlist);
-+			return false;
-+		}
-+	}
-+
-+	pfree(rawstring);
-+	list_free(elemlist);
-+
-+	/* Save the flags in *extra, for use by the assign function */
-+	*extra = guc_malloc(ERROR, sizeof(int));
-+	*((int *) *extra) = flags;
-+
-+	return true;
-+}
-+
-+/*
-+ * GUC assign_hook for restrict_nonsystem_relation_kind
-+ */
-+void
-+assign_restrict_nonsystem_relation_kind(const char *newval, void *extra)
-+{
-+	int		   *flags = (int *) extra;
-+
-+	restrict_nonsystem_relation_kind = *flags;
-+}
- 
- /*
-  * set_debug_options --- apply "-d N" command line option
-diff --git a/src/backend/utils/misc/guc_tables.c b/src/backend/utils/misc/guc_tables.c
-index b078b934a7..a515ecde97 100644
---- a/src/backend/utils/misc/guc_tables.c
-+++ b/src/backend/utils/misc/guc_tables.c
-@@ -564,6 +564,7 @@ static char *server_encoding_string;
- static char *server_version_string;
- static int	server_version_num;
- static char *debug_io_direct_string;
-+static char *restrict_nonsystem_relation_kind_string;
- 
- #ifdef HAVE_SYSLOG
- #define	DEFAULT_SYSLOG_FACILITY LOG_LOCAL0
-@@ -4549,6 +4550,17 @@ struct config_string ConfigureNamesString[] =
- 		check_debug_io_direct, assign_debug_io_direct, NULL
- 	},
- 
-+	{
-+		{"restrict_nonsystem_relation_kind", PGC_USERSET, CLIENT_CONN_STATEMENT,
-+			gettext_noop("Sets relation kinds of non-system relation to restrict use"),
-+			NULL,
-+			GUC_LIST_INPUT | GUC_NOT_IN_SAMPLE
-+		},
-+		&restrict_nonsystem_relation_kind_string,
-+		"",
-+		check_restrict_nonsystem_relation_kind, assign_restrict_nonsystem_relation_kind, NULL
-+	},
-+
- 	/* End-of-list marker */
- 	{
- 		{NULL, 0, 0, NULL, NULL}, NULL, NULL, NULL, NULL, NULL
-diff --git a/src/bin/pg_dump/pg_dump.c b/src/bin/pg_dump/pg_dump.c
-index 300fe071fc..1694ff55f8 100644
---- a/src/bin/pg_dump/pg_dump.c
-+++ b/src/bin/pg_dump/pg_dump.c
-@@ -324,6 +324,7 @@ static bool nonemptyReloptions(const char *reloptions);
- static void appendReloptionsArrayAH(PQExpBuffer buffer, const char *reloptions,
- 									const char *prefix, Archive *fout);
- static char *get_synchronized_snapshot(Archive *fout);
-+static void set_restrict_relation_kind(Archive *AH, const char *value);
- static void setupDumpWorker(Archive *AH);
- static TableInfo *getRootTableInfo(const TableInfo *tbinfo);
- static bool forcePartitionRootLoad(const TableInfo *tbinfo);
-@@ -1252,6 +1253,13 @@ setup_connection(Archive *AH, const char *dumpencoding,
- 			ExecuteSqlStatement(AH, "SET row_security = off");
- 	}
- 
-+	/*
-+	 * For security reasons, we restrict the expansion of non-system views and
-+	 * access to foreign tables during the pg_dump process. This restriction
-+	 * is adjusted when dumping foreign table data.
-+	 */
-+	set_restrict_relation_kind(AH, "view, foreign-table");
-+
- 	/*
- 	 * Initialize prepared-query state to "nothing prepared".  We do this here
- 	 * so that a parallel dump worker will have its own state.
-@@ -2114,6 +2122,10 @@ dumpTableData_copy(Archive *fout, const void *dcontext)
- 	 */
- 	if (tdinfo->filtercond || tbinfo->relkind == RELKIND_FOREIGN_TABLE)
- 	{
-+		/* Temporary allows to access to foreign tables to dump data */
-+		if (tbinfo->relkind == RELKIND_FOREIGN_TABLE)
-+			set_restrict_relation_kind(fout, "view");
-+
- 		appendPQExpBufferStr(q, "COPY (SELECT ");
- 		/* klugery to get rid of parens in column list */
- 		if (strlen(column_list) > 2)
-@@ -2225,6 +2237,11 @@ dumpTableData_copy(Archive *fout, const void *dcontext)
- 					   classname);
- 
- 	destroyPQExpBuffer(q);
-+
-+	/* Revert back the setting */
-+	if (tbinfo->relkind == RELKIND_FOREIGN_TABLE)
-+		set_restrict_relation_kind(fout, "view, foreign-table");
-+
- 	return 1;
- }
- 
-@@ -2251,6 +2268,10 @@ dumpTableData_insert(Archive *fout, const void *dcontext)
- 	int			rows_per_statement = dopt->dump_inserts;
- 	int			rows_this_statement = 0;
- 
-+	/* Temporary allows to access to foreign tables to dump data */
-+	if (tbinfo->relkind == RELKIND_FOREIGN_TABLE)
-+		set_restrict_relation_kind(fout, "view");
-+
- 	/*
- 	 * If we're going to emit INSERTs with column names, the most efficient
- 	 * way to deal with generated columns is to exclude them entirely.  For
-@@ -2490,6 +2511,10 @@ dumpTableData_insert(Archive *fout, const void *dcontext)
- 		destroyPQExpBuffer(insertStmt);
- 	free(attgenerated);
- 
-+	/* Revert back the setting */
-+	if (tbinfo->relkind == RELKIND_FOREIGN_TABLE)
-+		set_restrict_relation_kind(fout, "view, foreign-table");
-+
- 	return 1;
- }
- 
-@@ -4590,6 +4615,28 @@ is_superuser(Archive *fout)
- 	return false;
- }
- 
-+/*
-+ * Set the given value to restrict_nonsystem_relation_kind value. Since
-+ * restrict_nonsystem_relation_kind is introduced in minor version releases,
-+ * the setting query is effective only where available.
-+ */
-+static void
-+set_restrict_relation_kind(Archive *AH, const char *value)
-+{
-+	PQExpBuffer query = createPQExpBuffer();
-+	PGresult   *res;
-+
-+	appendPQExpBuffer(query,
-+					  "SELECT set_config(name, '%s', false) "
-+					  "FROM pg_settings "
-+					  "WHERE name = 'restrict_nonsystem_relation_kind'",
-+					  value);
-+	res = ExecuteSqlQuery(AH, query->data, PGRES_TUPLES_OK);
-+
-+	PQclear(res);
-+	destroyPQExpBuffer(query);
-+}
-+
- /*
-  * getSubscriptions
-  *	  get information about subscriptions
-diff --git a/src/include/tcop/tcopprot.h b/src/include/tcop/tcopprot.h
-index abd7b4fff3..e529e9f06c 100644
---- a/src/include/tcop/tcopprot.h
-+++ b/src/include/tcop/tcopprot.h
-@@ -43,6 +43,12 @@ typedef enum
- 
- extern PGDLLIMPORT int log_statement;
- 
-+/* Flags for restrict_nonsystem_relation_kind value */
-+#define RESTRICT_RELKIND_VIEW			0x01
-+#define RESTRICT_RELKIND_FOREIGN_TABLE	0x02
-+
-+extern PGDLLIMPORT int restrict_nonsystem_relation_kind;
-+
- extern List *pg_parse_query(const char *query_string);
- extern List *pg_rewrite_query(Query *query);
- extern List *pg_analyze_and_rewrite_fixedparams(RawStmt *parsetree,
-diff --git a/src/include/utils/guc_hooks.h b/src/include/utils/guc_hooks.h
-index 952293a1c3..0ea33fede9 100644
---- a/src/include/utils/guc_hooks.h
-+++ b/src/include/utils/guc_hooks.h
-@@ -118,6 +118,9 @@ extern void assign_recovery_target_xid(const char *newval, void *extra);
- extern bool check_role(char **newval, void **extra, GucSource source);
- extern void assign_role(const char *newval, void *extra);
- extern const char *show_role(void);
-+extern bool check_restrict_nonsystem_relation_kind(char **newval, void **extra,
-+												   GucSource source);
-+extern void assign_restrict_nonsystem_relation_kind(const char *newval, void *extra);
- extern bool check_search_path(char **newval, void **extra, GucSource source);
- extern void assign_search_path(const char *newval, void *extra);
- extern bool check_session_authorization(char **newval, void **extra, GucSource source);
-diff --git a/src/test/regress/expected/create_view.out b/src/test/regress/expected/create_view.out
-index 61825ef7d4..f3f8c7b5a2 100644
---- a/src/test/regress/expected/create_view.out
-+++ b/src/test/regress/expected/create_view.out
-@@ -2202,6 +2202,21 @@ select pg_get_viewdef('tt26v', true);
-     FROM ( VALUES (1,2,3)) v(x, y, z);
- (1 row)
- 
-+-- test restriction on non-system view expansion.
-+create table tt27v_tbl (a int);
-+create view tt27v as select a from tt27v_tbl;
-+set restrict_nonsystem_relation_kind to 'view';
-+select a from tt27v where a > 0; -- Error
-+ERROR:  access to non-system view "tt27v" is restricted
-+insert into tt27v values (1); -- Error
-+ERROR:  access to non-system view "tt27v" is restricted
-+select viewname from pg_views where viewname = 'tt27v'; -- Ok to access a system view.
-+ viewname 
-+----------
-+ tt27v
-+(1 row)
-+
-+reset restrict_nonsystem_relation_kind;
- -- clean up all the random objects we made above
- DROP SCHEMA temp_view_test CASCADE;
- NOTICE:  drop cascades to 27 other objects
-@@ -2233,7 +2248,7 @@ drop cascades to view aliased_view_2
- drop cascades to view aliased_view_3
- drop cascades to view aliased_view_4
- DROP SCHEMA testviewschm2 CASCADE;
--NOTICE:  drop cascades to 77 other objects
-+NOTICE:  drop cascades to 79 other objects
- DETAIL:  drop cascades to table t1
- drop cascades to view temporal1
- drop cascades to view temporal2
-@@ -2311,3 +2326,5 @@ drop cascades to view tt23v
- drop cascades to view tt24v
- drop cascades to view tt25v
- drop cascades to view tt26v
-+drop cascades to table tt27v_tbl
-+drop cascades to view tt27v
-diff --git a/src/test/regress/sql/create_view.sql b/src/test/regress/sql/create_view.sql
-index 8838a40f7a..3a78be1b0c 100644
---- a/src/test/regress/sql/create_view.sql
-+++ b/src/test/regress/sql/create_view.sql
-@@ -813,6 +813,15 @@ select x + y + z as c1,
- from (values(1,2,3)) v(x,y,z);
- select pg_get_viewdef('tt26v', true);
- 
-+-- test restriction on non-system view expansion.
-+create table tt27v_tbl (a int);
-+create view tt27v as select a from tt27v_tbl;
-+set restrict_nonsystem_relation_kind to 'view';
-+select a from tt27v where a > 0; -- Error
-+insert into tt27v values (1); -- Error
-+select viewname from pg_views where viewname = 'tt27v'; -- Ok to access a system view.
-+reset restrict_nonsystem_relation_kind;
-+
- -- clean up all the random objects we made above
- DROP SCHEMA temp_view_test CASCADE;
- DROP SCHEMA testviewschm2 CASCADE;
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
similarity index 82%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
index 31f427503b..1a47369e4d 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.3.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.4.bb
@@ -9,9 +9,8 @@ SRC_URI += "\
    file://0003-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://0004-config_info.c-not-expose-build-info.patch \
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
-   file://CVE-2024-7348.patch \
 "
 
-SRC_URI[sha256sum] = "331963d5d3dc4caf4216a049fa40b66d6bcb8c730615859411b9518764e60585"
+SRC_URI[sha256sum] = "971766d645aa73e93b9ef4e3be44201b4f45b5477095b049125403f9f3386d6f"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.43.0


