Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F193EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:59:47 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.716.1687532380458602267
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VwZsI9M2;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-57015b368c3so6197707b3.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 07:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687532379; x=1690124379;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vi9pJDDIUccArWJGzAWsWXz/l30qhr3f6NZQzxb6sAs=;
        b=VwZsI9M2Z79wjazjZIMtvdQV2JedaM8K8tuQEH7mKbBqZqbjCNaj+PRdwhR9nSJZtn
         bL/ueu2fgmylEvGKdJfZWlp68yMszB1mN0h7fpbBZuX0UhjVxHUt0xUtElSs4Dx9i6ek
         xHXJiE2Ai7exGZaics68f6WMiaO1ZM6Foz7zkrums1jeAHG7WrC1WOfbwCyzKWurip4x
         rdCimTPDSksC+oHYqmONOLp87CNMe0jusotPRpVRa+p/wFa9W9t3eQ3l9Vk6lNCMhf4q
         rOn0HaLtRaSuIiT7U6iwgKiOd2S+8BdfzbJ/Jl7k8L0IhRS0cWX6ozO0Qe0TmnFazoXL
         WqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532379; x=1690124379;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi9pJDDIUccArWJGzAWsWXz/l30qhr3f6NZQzxb6sAs=;
        b=Q5qJ/7wxVSDx7XOhCf0nZAxca/vssJ3jHykQ8eSmAmkM/rNgmuYgaJ6lOqOPKfOJdT
         BtckNzeyUxIF4W/nW0CwmpZhdn/DwDnMt2iaEz/CUqUWsoSN586Oj1WXzz6PTj2Chigb
         vjpYjHz7CQp1qyWvwJFFQHJx2EZFhEDyHt+3+g6ItHTuH0Fyq29CkN2aLLsRiJ2YYF1E
         hl+jFxNAB7SAAr9HJAxMO0TzDIBd5Unvmhj5DQalUSVEPGFmZbdH79SrmT/Qyhas3WBl
         4PG/JBB8SWtlolmQ2a0j+Sz5Wf7y7qlLkUbl1M4R06Ols6kN92wDKoMCkdiGwJzb7E7p
         N14A==
X-Gm-Message-State: AC+VfDwzxHnmyxuQjmWidixCOFRQzE4KhYNatRqukXvnt2PVnT4RrKJP
	1LsYMdJSWaoGqwo7TknSUmtPFmehIEE=
X-Google-Smtp-Source: ACHHUZ7dxhEcuNZUr9f6j276k7txxNADBleAh+KgsCekTrGzwUWtCv+TphCH3S85vkzop++ujZ5i8g==
X-Received: by 2002:a81:7584:0:b0:56d:6c9:d82d with SMTP id q126-20020a817584000000b0056d06c9d82dmr19557922ywc.21.1687532379389;
        Fri, 23 Jun 2023 07:59:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:bd53:b41c:e916:19c8? ([2600:1700:9190:ba10:bd53:b41c:e916:19c8])
        by smtp.gmail.com with ESMTPSA id p2-20020a815b02000000b00573898fb12bsm2179922ywb.82.2023.06.23.07.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 07:59:39 -0700 (PDT)
Message-ID: <b76b5de3-5906-9c70-23a5-f6de971c8a96@gmail.com>
Date: Fri, 23 Jun 2023 10:59:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-oe][kirkstone][PATCH v2] postgresql: fix CVE-2023-2454
 & CVE-2023-2455
Content-Language: en-US
To: vkumbhar <vkumbhar@mvista.com>, openembedded-devel@lists.openembedded.org
References: <20230623144532.500239-1-vkumbhar@mvista.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230623144532.500239-1-vkumbhar@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 14:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103553

Hello Vivek

On 6/23/23 10:45 AM, vkumbhar wrote:
> fixed Below security CVE:
> 1)CVE-2023-2454 postgresql: schema_element defeats protective search_path changes.
> 2)CVE-2023-2455 postgresql: row security policies disregard user ID changes after inlining.

For future reference:  Since the subject line includes the version tag, 
it would be helpful to include a note in the comments regarding what was 
changed.

- armin
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>   .../postgresql/files/CVE-2023-2454.patch      | 235 ++++++++++++++++++
>   .../postgresql/files/CVE-2023-2455.patch      | 118 +++++++++
>   .../recipes-dbs/postgresql/postgresql_14.5.bb |   2 +
>   3 files changed, 355 insertions(+)
>   create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
>   create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
>
> diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
> new file mode 100644
> index 0000000000..a2f6927e30
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
> @@ -0,0 +1,235 @@
> +From 23cb8eaeb97df350273cb8902e55842a955339c8 Mon Sep 17 00:00:00 2001
> +From: Noah Misch <noah@leadboat.com>
> +Date: Mon, 8 May 2023 06:14:07 -0700
> +Subject: [PATCH] Replace last PushOverrideSearchPath() call with
> + set_config_option().
> +
> +The two methods don't cooperate, so set_config_option("search_path",
> +...) has been ineffective under non-empty overrideStack.  This defect
> +enabled an attacker having database-level CREATE privilege to execute
> +arbitrary code as the bootstrap superuser.  While that particular attack
> +requires v13+ for the trusted extension attribute, other attacks are
> +feasible in all supported versions.
> +
> +Standardize on the combination of NewGUCNestLevel() and
> +set_config_option("search_path", ...).  It is newer than
> +PushOverrideSearchPath(), more-prevalent, and has no known
> +disadvantages.  The "override" mechanism remains for now, for
> +compatibility with out-of-tree code.  Users should update such code,
> +which likely suffers from the same sort of vulnerability closed here.
> +Back-patch to v11 (all supported versions).
> +
> +Alexander Lakhin.  Reported by Alexander Lakhin.
> +
> +Security: CVE-2023-2454
> +
> +Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=23cb8eaeb97df350273cb8902e55842a955339c8]
> +CVE: CVE-2023-2454
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + src/backend/catalog/namespace.c         |  4 +++
> + src/backend/commands/schemacmds.c       | 37 ++++++++++++++------
> + src/test/regress/expected/namespace.out | 45 +++++++++++++++++++++++++
> + src/test/regress/sql/namespace.sql      | 24 +++++++++++++
> + 4 files changed, 100 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/backend/catalog/namespace.c b/src/backend/catalog/namespace.c
> +index 81b6472..0175a91 100644
> +--- a/src/backend/catalog/namespace.c
> ++++ b/src/backend/catalog/namespace.c
> +@@ -3518,6 +3518,10 @@ OverrideSearchPathMatchesCurrent(OverrideSearchPath *path)
> + /*
> +  * PushOverrideSearchPath - temporarily override the search path
> +  *
> ++ * Do not use this function; almost any usage introduces a security
> ++ * vulnerability.  It exists for the benefit of legacy code running in
> ++ * non-security-sensitive environments.
> ++ *
> +  * We allow nested overrides, hence the push/pop terminology.  The GUC
> +  * search_path variable is ignored while an override is active.
> +  *
> +diff --git a/src/backend/commands/schemacmds.c b/src/backend/commands/schemacmds.c
> +index 66306d1..ecd0cbb 100644
> +--- a/src/backend/commands/schemacmds.c
> ++++ b/src/backend/commands/schemacmds.c
> +@@ -29,6 +29,7 @@
> + #include "commands/schemacmds.h"
> + #include "miscadmin.h"
> + #include "parser/parse_utilcmd.h"
> ++#include "parser/scansup.h"
> + #include "tcop/utility.h"
> + #include "utils/acl.h"
> + #include "utils/builtins.h"
> +@@ -52,14 +53,16 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const char *queryString,
> + {
> + 	const char *schemaName = stmt->schemaname;
> + 	Oid			namespaceId;
> +-	OverrideSearchPath *overridePath;
> + 	List	   *parsetree_list;
> + 	ListCell   *parsetree_item;
> + 	Oid			owner_uid;
> + 	Oid			saved_uid;
> + 	int			save_sec_context;
> ++	int			save_nestlevel;
> ++	char	   *nsp = namespace_search_path;
> + 	AclResult	aclresult;
> + 	ObjectAddress address;
> ++	StringInfoData pathbuf;
> +
> + 	GetUserIdAndSecContext(&saved_uid, &save_sec_context);
> +
> +@@ -152,14 +155,26 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const char *queryString,
> + 	CommandCounterIncrement();
> +
> + 	/*
> +-	 * Temporarily make the new namespace be the front of the search path, as
> +-	 * well as the default creation target namespace.  This will be undone at
> +-	 * the end of this routine, or upon error.
> ++	 * Prepend the new schema to the current search path.
> ++	 *
> ++	 * We use the equivalent of a function SET option to allow the setting to
> ++	 * persist for exactly the duration of the schema creation.  guc.c also
> ++	 * takes care of undoing the setting on error.
> + 	 */
> +-	overridePath = GetOverrideSearchPath(CurrentMemoryContext);
> +-	overridePath->schemas = lcons_oid(namespaceId, overridePath->schemas);
> +-	/* XXX should we clear overridePath->useTemp? */
> +-	PushOverrideSearchPath(overridePath);
> ++	save_nestlevel = NewGUCNestLevel();
> ++
> ++	initStringInfo(&pathbuf);
> ++	appendStringInfoString(&pathbuf, quote_identifier(schemaName));
> ++
> ++	while (scanner_isspace(*nsp))
> ++		nsp++;
> ++
> ++	if (*nsp != '\0')
> ++		appendStringInfo(&pathbuf, ", %s", nsp);
> ++
> ++	(void) set_config_option("search_path", pathbuf.data,
> ++							 PGC_USERSET, PGC_S_SESSION,
> ++							 GUC_ACTION_SAVE, true, 0, false);
> +
> + 	/*
> + 	 * Report the new schema to possibly interested event triggers.  Note we
> +@@ -213,8 +228,10 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const char *queryString,
> + 		CommandCounterIncrement();
> + 	}
> +
> +-	/* Reset search path to normal state */
> +-	PopOverrideSearchPath();
> ++	/*
> ++	 * Restore the GUC variable search_path we set above.
> ++	 */
> ++	AtEOXact_GUC(true, save_nestlevel);
> +
> + 	/* Reset current user and security context */
> + 	SetUserIdAndSecContext(saved_uid, save_sec_context);
> +diff --git a/src/test/regress/expected/namespace.out b/src/test/regress/expected/namespace.out
> +index 2564d1b..a62fd8d 100644
> +--- a/src/test/regress/expected/namespace.out
> ++++ b/src/test/regress/expected/namespace.out
> +@@ -1,6 +1,14 @@
> + --
> + -- Regression tests for schemas (namespaces)
> + --
> ++-- set the whitespace-only search_path to test that the
> ++-- GUC list syntax is preserved during a schema creation
> ++SELECT pg_catalog.set_config('search_path', ' ', false);
> ++ set_config
> ++------------
> ++
> ++(1 row)
> ++
> + CREATE SCHEMA test_ns_schema_1
> +        CREATE UNIQUE INDEX abc_a_idx ON abc (a)
> +        CREATE VIEW abc_view AS
> +@@ -9,6 +17,43 @@ CREATE SCHEMA test_ns_schema_1
> +               a serial,
> +               b int UNIQUE
> +        );
> ++-- verify that the correct search_path restored on abort
> ++SET search_path to public;
> ++BEGIN;
> ++SET search_path to public, test_ns_schema_1;
> ++CREATE SCHEMA test_ns_schema_2
> ++       CREATE VIEW abc_view AS SELECT c FROM abc;
> ++ERROR:  column "c" does not exist
> ++LINE 2:        CREATE VIEW abc_view AS SELECT c FROM abc;
> ++                                              ^
> ++COMMIT;
> ++SHOW search_path;
> ++ search_path
> ++-------------
> ++ public
> ++(1 row)
> ++
> ++-- verify that the correct search_path preserved
> ++-- after creating the schema and on commit
> ++BEGIN;
> ++SET search_path to public, test_ns_schema_1;
> ++CREATE SCHEMA test_ns_schema_2
> ++       CREATE VIEW abc_view AS SELECT a FROM abc;
> ++SHOW search_path;
> ++       search_path
> ++--------------------------
> ++ public, test_ns_schema_1
> ++(1 row)
> ++
> ++COMMIT;
> ++SHOW search_path;
> ++       search_path
> ++--------------------------
> ++ public, test_ns_schema_1
> ++(1 row)
> ++
> ++DROP SCHEMA test_ns_schema_2 CASCADE;
> ++NOTICE:  drop cascades to view test_ns_schema_2.abc_view
> + -- verify that the objects were created
> + SELECT COUNT(*) FROM pg_class WHERE relnamespace =
> +     (SELECT oid FROM pg_namespace WHERE nspname = 'test_ns_schema_1');
> +diff --git a/src/test/regress/sql/namespace.sql b/src/test/regress/sql/namespace.sql
> +index 6b12c96..3474f5e 100644
> +--- a/src/test/regress/sql/namespace.sql
> ++++ b/src/test/regress/sql/namespace.sql
> +@@ -2,6 +2,10 @@
> + -- Regression tests for schemas (namespaces)
> + --
> +
> ++-- set the whitespace-only search_path to test that the
> ++-- GUC list syntax is preserved during a schema creation
> ++SELECT pg_catalog.set_config('search_path', ' ', false);
> ++
> + CREATE SCHEMA test_ns_schema_1
> +        CREATE UNIQUE INDEX abc_a_idx ON abc (a)
> +
> +@@ -13,6 +17,26 @@ CREATE SCHEMA test_ns_schema_1
> +               b int UNIQUE
> +        );
> +
> ++-- verify that the correct search_path restored on abort
> ++SET search_path to public;
> ++BEGIN;
> ++SET search_path to public, test_ns_schema_1;
> ++CREATE SCHEMA test_ns_schema_2
> ++       CREATE VIEW abc_view AS SELECT c FROM abc;
> ++COMMIT;
> ++SHOW search_path;
> ++
> ++-- verify that the correct search_path preserved
> ++-- after creating the schema and on commit
> ++BEGIN;
> ++SET search_path to public, test_ns_schema_1;
> ++CREATE SCHEMA test_ns_schema_2
> ++       CREATE VIEW abc_view AS SELECT a FROM abc;
> ++SHOW search_path;
> ++COMMIT;
> ++SHOW search_path;
> ++DROP SCHEMA test_ns_schema_2 CASCADE;
> ++
> + -- verify that the objects were created
> + SELECT COUNT(*) FROM pg_class WHERE relnamespace =
> +     (SELECT oid FROM pg_namespace WHERE nspname = 'test_ns_schema_1');
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
> new file mode 100644
> index 0000000000..a94c65cc0c
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
> @@ -0,0 +1,118 @@
> +From 473626cf00babd829eb15c36b51dfb358d32bc95 Mon Sep 17 00:00:00 2001
> +From: Tom Lane <tgl@sss.pgh.pa.us>
> +Date: Mon, 8 May 2023 10:12:45 -0400
> +Subject: [PATCH] Handle RLS dependencies in inlined set-returning functions
> + properly.
> +
> +If an SRF in the FROM clause references a table having row-level
> +security policies, and we inline that SRF into the calling query,
> +we neglected to mark the plan as potentially dependent on which
> +role is executing it.  This could lead to later executions in the
> +same session returning or hiding rows that should have been hidden
> +or returned instead.
> +
> +Our thanks to Wolfgang Walther for reporting this problem.
> +
> +Stephen Frost and Tom Lane
> +
> +Security: CVE-2023-2455
> +
> +Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=473626cf00babd829eb15c36b51dfb358d32bc95]
> +CVE: CVE-2023-2455
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +---
> + src/backend/optimizer/util/clauses.c      |  7 ++++++
> + src/test/regress/expected/rowsecurity.out | 27 +++++++++++++++++++++++
> + src/test/regress/sql/rowsecurity.sql      | 20 +++++++++++++++++
> + 3 files changed, 54 insertions(+)
> +
> +diff --git a/src/backend/optimizer/util/clauses.c b/src/backend/optimizer/util/clauses.c
> +index 9d7aa8b..da50bef 100644
> +--- a/src/backend/optimizer/util/clauses.c
> ++++ b/src/backend/optimizer/util/clauses.c
> +@@ -5095,6 +5095,13 @@ inline_set_returning_function(PlannerInfo *root, RangeTblEntry *rte)
> + 	 */
> + 	record_plan_function_dependency(root, func_oid);
> +
> ++	/*
> ++	 * We must also notice if the inserted query adds a dependency on the
> ++	 * calling role due to RLS quals.
> ++	 */
> ++	if (querytree->hasRowSecurity)
> ++		root->glob->dependsOnRole = true;
> ++
> + 	return querytree;
> +
> + 	/* Here if func is not inlinable: release temp memory and return NULL */
> +diff --git a/src/test/regress/expected/rowsecurity.out b/src/test/regress/expected/rowsecurity.out
> +index 89397e4..379f988 100644
> +--- a/src/test/regress/expected/rowsecurity.out
> ++++ b/src/test/regress/expected/rowsecurity.out
> +@@ -3982,6 +3982,33 @@ SELECT * FROM rls_tbl;
> +
> + DROP TABLE rls_tbl;
> + RESET SESSION AUTHORIZATION;
> ++-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency
> ++create table rls_t (c text);
> ++insert into rls_t values ('invisible to bob');
> ++alter table rls_t enable row level security;
> ++grant select on rls_t to regress_rls_alice, regress_rls_bob;
> ++create policy p1 on rls_t for select to regress_rls_alice using (true);
> ++create policy p2 on rls_t for select to regress_rls_bob using (false);
> ++create function rls_f () returns setof rls_t
> ++  stable language sql
> ++  as $$ select * from rls_t $$;
> ++prepare q as select current_user, * from rls_f();
> ++set role regress_rls_alice;
> ++execute q;
> ++   current_user    |        c
> ++-------------------+------------------
> ++ regress_rls_alice | invisible to bob
> ++(1 row)
> ++
> ++set role regress_rls_bob;
> ++execute q;
> ++ current_user | c
> ++--------------+---
> ++(0 rows)
> ++
> ++RESET ROLE;
> ++DROP FUNCTION rls_f();
> ++DROP TABLE rls_t;
> + --
> + -- Clean up objects
> + --
> +diff --git a/src/test/regress/sql/rowsecurity.sql b/src/test/regress/sql/rowsecurity.sql
> +index 44deb42..3015d89 100644
> +--- a/src/test/regress/sql/rowsecurity.sql
> ++++ b/src/test/regress/sql/rowsecurity.sql
> +@@ -1839,6 +1839,26 @@ SELECT * FROM rls_tbl;
> + DROP TABLE rls_tbl;
> + RESET SESSION AUTHORIZATION;
> +
> ++-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency
> ++create table rls_t (c text);
> ++insert into rls_t values ('invisible to bob');
> ++alter table rls_t enable row level security;
> ++grant select on rls_t to regress_rls_alice, regress_rls_bob;
> ++create policy p1 on rls_t for select to regress_rls_alice using (true);
> ++create policy p2 on rls_t for select to regress_rls_bob using (false);
> ++create function rls_f () returns setof rls_t
> ++  stable language sql
> ++  as $$ select * from rls_t $$;
> ++prepare q as select current_user, * from rls_f();
> ++set role regress_rls_alice;
> ++execute q;
> ++set role regress_rls_bob;
> ++execute q;
> ++
> ++RESET ROLE;
> ++DROP FUNCTION rls_f();
> ++DROP TABLE rls_t;
> ++
> + --
> + -- Clean up objects
> + --
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
> index fbc08d64f3..315f6db565 100644
> --- a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
> +++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
> @@ -11,6 +11,8 @@ SRC_URI += "\
>      file://0001-config_info.c-not-expose-build-info.patch \
>      file://0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch \
>      file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
> +   file://CVE-2023-2454.patch \
> +   file://CVE-2023-2455.patch \
>   "
>   
>   SRC_URI[sha256sum] = "d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103552): https://lists.openembedded.org/g/openembedded-devel/message/103552
> Mute This Topic: https://lists.openembedded.org/mt/99719763/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


