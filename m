Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 526E4EB64DC
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 03:11:51 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.124.1687749104168732277
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 20:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=JRu3ROhL;
 spf=pass (domain: mvista.com, ip: 209.85.167.54, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4f86bc35f13so3547083e87.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 20:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1687749102; x=1690341102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KKVUGFdPIMSoMjUhPPmom3hHAfd0A0YDiXwdSWaEwFE=;
        b=JRu3ROhLVITOMTKmrLbYEUzgl6+otyE90LwOw2KPWLTB4GDdGbiYUBKZZdTP4Ke5JW
         HGdVywB3aVjjgBwJ4t+QA9aX4U0oSc5zFf8Ypmv2AbfNhq5JfQFTQio43GA5ylHiyn5r
         1zKkdhDq9Y4acpoj28+j6eSQrOj2dfd7cxXJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687749102; x=1690341102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KKVUGFdPIMSoMjUhPPmom3hHAfd0A0YDiXwdSWaEwFE=;
        b=EyFA4altc8lmCHuWljwNU7QSMRIL2Xk+8yIW7geZpJSNCzDnxD13hIW0pu9srtfRmK
         zyVETcu3KOPqEUcqv8eLyAafxy3EmaOIHXf45/i4128eOhz1vGb1gBB53OfcaFPY1uk5
         MUpqMYlPlppotDfxibP6ClIwYGX9ttSim4j9p/G2bbFMETR+N79kocFfwa/ZE+fo2Zd+
         31UReXbVnE9qOFh0iWRCkYag3LwnPnU2ScNiLvP1kErtxQNqO9sl/OKpQLB1ex9rEAuo
         wh7qjVTgC1yeg7XQEmkXx+AsIxHFpD66Y4sh59eoAWSK9bH+eejQz9MtVRDE1ukR1jid
         QwPQ==
X-Gm-Message-State: AC+VfDxEHAL6m1sbaXhDmSEOKFyNqL/BuZjDJHwCfJngeO+jv+nV+WYr
	6FtSWDxgUQ1hfmzG+CewKdPHH5mdJ1zBlZRHzZUAeQ==
X-Google-Smtp-Source: ACHHUZ5WliwcnZsYXVGyUpgl6OkI/3EyKMptf6bUtCveK6uIbUl/47ycRGQqxKWAaxKEn4JCBHw2NcFhwD2GhFFNurM=
X-Received: by 2002:a19:5f44:0:b0:4f6:2317:f387 with SMTP id
 a4-20020a195f44000000b004f62317f387mr13793128lfj.35.1687749101854; Sun, 25
 Jun 2023 20:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230623144532.500239-1-vkumbhar@mvista.com> <b76b5de3-5906-9c70-23a5-f6de971c8a96@gmail.com>
In-Reply-To: <b76b5de3-5906-9c70-23a5-f6de971c8a96@gmail.com>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Mon, 26 Jun 2023 08:41:29 +0530
Message-ID: <CAPun1rEYhRPn7M0F9kBMZZURWkOj7Os-myw3Y4r5LW5Lr-wMtg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH v2] postgresql: fix CVE-2023-2454
 & CVE-2023-2455
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000afb58205feffb58b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jun 2023 03:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103570

--000000000000afb58205feffb58b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, from now on I shall take care of it.

Kind regards,
Vivek

On Fri, Jun 23, 2023 at 8:29=E2=80=AFPM akuster808 <akuster808@gmail.com> w=
rote:

> Hello Vivek
>
> On 6/23/23 10:45 AM, vkumbhar wrote:
> > fixed Below security CVE:
> > 1)CVE-2023-2454 postgresql: schema_element defeats protective
> search_path changes.
> > 2)CVE-2023-2455 postgresql: row security policies disregard user ID
> changes after inlining.
>
> For future reference:  Since the subject line includes the version tag,
> it would be helpful to include a note in the comments regarding what was
> changed.
>
> - armin
> >
> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >   .../postgresql/files/CVE-2023-2454.patch      | 235 +++++++++++++++++=
+
> >   .../postgresql/files/CVE-2023-2455.patch      | 118 +++++++++
> >   .../recipes-dbs/postgresql/postgresql_14.5.bb |   2 +
> >   3 files changed, 355 insertions(+)
> >   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
> >   create mode 100644
> meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
> >
> > diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
> b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
> > new file mode 100644
> > index 0000000000..a2f6927e30
> > --- /dev/null
> > +++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch
> > @@ -0,0 +1,235 @@
> > +From 23cb8eaeb97df350273cb8902e55842a955339c8 Mon Sep 17 00:00:00 2001
> > +From: Noah Misch <noah@leadboat.com>
> > +Date: Mon, 8 May 2023 06:14:07 -0700
> > +Subject: [PATCH] Replace last PushOverrideSearchPath() call with
> > + set_config_option().
> > +
> > +The two methods don't cooperate, so set_config_option("search_path",
> > +...) has been ineffective under non-empty overrideStack.  This defect
> > +enabled an attacker having database-level CREATE privilege to execute
> > +arbitrary code as the bootstrap superuser.  While that particular atta=
ck
> > +requires v13+ for the trusted extension attribute, other attacks are
> > +feasible in all supported versions.
> > +
> > +Standardize on the combination of NewGUCNestLevel() and
> > +set_config_option("search_path", ...).  It is newer than
> > +PushOverrideSearchPath(), more-prevalent, and has no known
> > +disadvantages.  The "override" mechanism remains for now, for
> > +compatibility with out-of-tree code.  Users should update such code,
> > +which likely suffers from the same sort of vulnerability closed here.
> > +Back-patch to v11 (all supported versions).
> > +
> > +Alexander Lakhin.  Reported by Alexander Lakhin.
> > +
> > +Security: CVE-2023-2454
> > +
> > +Upstream-Status: Backport [
> https://git.postgresql.org/gitweb/?p=3Dpostgresql.git;a=3Dcommitdiff;h=3D=
23cb8eaeb97df350273cb8902e55842a955339c8
> ]
> > +CVE: CVE-2023-2454
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + src/backend/catalog/namespace.c         |  4 +++
> > + src/backend/commands/schemacmds.c       | 37 ++++++++++++++------
> > + src/test/regress/expected/namespace.out | 45 ++++++++++++++++++++++++=
+
> > + src/test/regress/sql/namespace.sql      | 24 +++++++++++++
> > + 4 files changed, 100 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/src/backend/catalog/namespace.c
> b/src/backend/catalog/namespace.c
> > +index 81b6472..0175a91 100644
> > +--- a/src/backend/catalog/namespace.c
> > ++++ b/src/backend/catalog/namespace.c
> > +@@ -3518,6 +3518,10 @@
> OverrideSearchPathMatchesCurrent(OverrideSearchPath *path)
> > + /*
> > +  * PushOverrideSearchPath - temporarily override the search path
> > +  *
> > ++ * Do not use this function; almost any usage introduces a security
> > ++ * vulnerability.  It exists for the benefit of legacy code running i=
n
> > ++ * non-security-sensitive environments.
> > ++ *
> > +  * We allow nested overrides, hence the push/pop terminology.  The GU=
C
> > +  * search_path variable is ignored while an override is active.
> > +  *
> > +diff --git a/src/backend/commands/schemacmds.c
> b/src/backend/commands/schemacmds.c
> > +index 66306d1..ecd0cbb 100644
> > +--- a/src/backend/commands/schemacmds.c
> > ++++ b/src/backend/commands/schemacmds.c
> > +@@ -29,6 +29,7 @@
> > + #include "commands/schemacmds.h"
> > + #include "miscadmin.h"
> > + #include "parser/parse_utilcmd.h"
> > ++#include "parser/scansup.h"
> > + #include "tcop/utility.h"
> > + #include "utils/acl.h"
> > + #include "utils/builtins.h"
> > +@@ -52,14 +53,16 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const
> char *queryString,
> > + {
> > +     const char *schemaName =3D stmt->schemaname;
> > +     Oid                     namespaceId;
> > +-    OverrideSearchPath *overridePath;
> > +     List       *parsetree_list;
> > +     ListCell   *parsetree_item;
> > +     Oid                     owner_uid;
> > +     Oid                     saved_uid;
> > +     int                     save_sec_context;
> > ++    int                     save_nestlevel;
> > ++    char       *nsp =3D namespace_search_path;
> > +     AclResult       aclresult;
> > +     ObjectAddress address;
> > ++    StringInfoData pathbuf;
> > +
> > +     GetUserIdAndSecContext(&saved_uid, &save_sec_context);
> > +
> > +@@ -152,14 +155,26 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, cons=
t
> char *queryString,
> > +     CommandCounterIncrement();
> > +
> > +     /*
> > +-     * Temporarily make the new namespace be the front of the search
> path, as
> > +-     * well as the default creation target namespace.  This will be
> undone at
> > +-     * the end of this routine, or upon error.
> > ++     * Prepend the new schema to the current search path.
> > ++     *
> > ++     * We use the equivalent of a function SET option to allow the
> setting to
> > ++     * persist for exactly the duration of the schema creation.  guc.=
c
> also
> > ++     * takes care of undoing the setting on error.
> > +      */
> > +-    overridePath =3D GetOverrideSearchPath(CurrentMemoryContext);
> > +-    overridePath->schemas =3D lcons_oid(namespaceId,
> overridePath->schemas);
> > +-    /* XXX should we clear overridePath->useTemp? */
> > +-    PushOverrideSearchPath(overridePath);
> > ++    save_nestlevel =3D NewGUCNestLevel();
> > ++
> > ++    initStringInfo(&pathbuf);
> > ++    appendStringInfoString(&pathbuf, quote_identifier(schemaName));
> > ++
> > ++    while (scanner_isspace(*nsp))
> > ++            nsp++;
> > ++
> > ++    if (*nsp !=3D '\0')
> > ++            appendStringInfo(&pathbuf, ", %s", nsp);
> > ++
> > ++    (void) set_config_option("search_path", pathbuf.data,
> > ++                                                     PGC_USERSET,
> PGC_S_SESSION,
> > ++                                                     GUC_ACTION_SAVE,
> true, 0, false);
> > +
> > +     /*
> > +      * Report the new schema to possibly interested event triggers.
> Note we
> > +@@ -213,8 +228,10 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const
> char *queryString,
> > +             CommandCounterIncrement();
> > +     }
> > +
> > +-    /* Reset search path to normal state */
> > +-    PopOverrideSearchPath();
> > ++    /*
> > ++     * Restore the GUC variable search_path we set above.
> > ++     */
> > ++    AtEOXact_GUC(true, save_nestlevel);
> > +
> > +     /* Reset current user and security context */
> > +     SetUserIdAndSecContext(saved_uid, save_sec_context);
> > +diff --git a/src/test/regress/expected/namespace.out
> b/src/test/regress/expected/namespace.out
> > +index 2564d1b..a62fd8d 100644
> > +--- a/src/test/regress/expected/namespace.out
> > ++++ b/src/test/regress/expected/namespace.out
> > +@@ -1,6 +1,14 @@
> > + --
> > + -- Regression tests for schemas (namespaces)
> > + --
> > ++-- set the whitespace-only search_path to test that the
> > ++-- GUC list syntax is preserved during a schema creation
> > ++SELECT pg_catalog.set_config('search_path', ' ', false);
> > ++ set_config
> > ++------------
> > ++
> > ++(1 row)
> > ++
> > + CREATE SCHEMA test_ns_schema_1
> > +        CREATE UNIQUE INDEX abc_a_idx ON abc (a)
> > +        CREATE VIEW abc_view AS
> > +@@ -9,6 +17,43 @@ CREATE SCHEMA test_ns_schema_1
> > +               a serial,
> > +               b int UNIQUE
> > +        );
> > ++-- verify that the correct search_path restored on abort
> > ++SET search_path to public;
> > ++BEGIN;
> > ++SET search_path to public, test_ns_schema_1;
> > ++CREATE SCHEMA test_ns_schema_2
> > ++       CREATE VIEW abc_view AS SELECT c FROM abc;
> > ++ERROR:  column "c" does not exist
> > ++LINE 2:        CREATE VIEW abc_view AS SELECT c FROM abc;
> > ++                                              ^
> > ++COMMIT;
> > ++SHOW search_path;
> > ++ search_path
> > ++-------------
> > ++ public
> > ++(1 row)
> > ++
> > ++-- verify that the correct search_path preserved
> > ++-- after creating the schema and on commit
> > ++BEGIN;
> > ++SET search_path to public, test_ns_schema_1;
> > ++CREATE SCHEMA test_ns_schema_2
> > ++       CREATE VIEW abc_view AS SELECT a FROM abc;
> > ++SHOW search_path;
> > ++       search_path
> > ++--------------------------
> > ++ public, test_ns_schema_1
> > ++(1 row)
> > ++
> > ++COMMIT;
> > ++SHOW search_path;
> > ++       search_path
> > ++--------------------------
> > ++ public, test_ns_schema_1
> > ++(1 row)
> > ++
> > ++DROP SCHEMA test_ns_schema_2 CASCADE;
> > ++NOTICE:  drop cascades to view test_ns_schema_2.abc_view
> > + -- verify that the objects were created
> > + SELECT COUNT(*) FROM pg_class WHERE relnamespace =3D
> > +     (SELECT oid FROM pg_namespace WHERE nspname =3D 'test_ns_schema_1=
');
> > +diff --git a/src/test/regress/sql/namespace.sql
> b/src/test/regress/sql/namespace.sql
> > +index 6b12c96..3474f5e 100644
> > +--- a/src/test/regress/sql/namespace.sql
> > ++++ b/src/test/regress/sql/namespace.sql
> > +@@ -2,6 +2,10 @@
> > + -- Regression tests for schemas (namespaces)
> > + --
> > +
> > ++-- set the whitespace-only search_path to test that the
> > ++-- GUC list syntax is preserved during a schema creation
> > ++SELECT pg_catalog.set_config('search_path', ' ', false);
> > ++
> > + CREATE SCHEMA test_ns_schema_1
> > +        CREATE UNIQUE INDEX abc_a_idx ON abc (a)
> > +
> > +@@ -13,6 +17,26 @@ CREATE SCHEMA test_ns_schema_1
> > +               b int UNIQUE
> > +        );
> > +
> > ++-- verify that the correct search_path restored on abort
> > ++SET search_path to public;
> > ++BEGIN;
> > ++SET search_path to public, test_ns_schema_1;
> > ++CREATE SCHEMA test_ns_schema_2
> > ++       CREATE VIEW abc_view AS SELECT c FROM abc;
> > ++COMMIT;
> > ++SHOW search_path;
> > ++
> > ++-- verify that the correct search_path preserved
> > ++-- after creating the schema and on commit
> > ++BEGIN;
> > ++SET search_path to public, test_ns_schema_1;
> > ++CREATE SCHEMA test_ns_schema_2
> > ++       CREATE VIEW abc_view AS SELECT a FROM abc;
> > ++SHOW search_path;
> > ++COMMIT;
> > ++SHOW search_path;
> > ++DROP SCHEMA test_ns_schema_2 CASCADE;
> > ++
> > + -- verify that the objects were created
> > + SELECT COUNT(*) FROM pg_class WHERE relnamespace =3D
> > +     (SELECT oid FROM pg_namespace WHERE nspname =3D 'test_ns_schema_1=
');
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
> b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
> > new file mode 100644
> > index 0000000000..a94c65cc0c
> > --- /dev/null
> > +++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch
> > @@ -0,0 +1,118 @@
> > +From 473626cf00babd829eb15c36b51dfb358d32bc95 Mon Sep 17 00:00:00 2001
> > +From: Tom Lane <tgl@sss.pgh.pa.us>
> > +Date: Mon, 8 May 2023 10:12:45 -0400
> > +Subject: [PATCH] Handle RLS dependencies in inlined set-returning
> functions
> > + properly.
> > +
> > +If an SRF in the FROM clause references a table having row-level
> > +security policies, and we inline that SRF into the calling query,
> > +we neglected to mark the plan as potentially dependent on which
> > +role is executing it.  This could lead to later executions in the
> > +same session returning or hiding rows that should have been hidden
> > +or returned instead.
> > +
> > +Our thanks to Wolfgang Walther for reporting this problem.
> > +
> > +Stephen Frost and Tom Lane
> > +
> > +Security: CVE-2023-2455
> > +
> > +Upstream-Status: Backport [
> https://git.postgresql.org/gitweb/?p=3Dpostgresql.git;a=3Dcommitdiff;h=3D=
473626cf00babd829eb15c36b51dfb358d32bc95
> ]
> > +CVE: CVE-2023-2455
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +---
> > + src/backend/optimizer/util/clauses.c      |  7 ++++++
> > + src/test/regress/expected/rowsecurity.out | 27 ++++++++++++++++++++++=
+
> > + src/test/regress/sql/rowsecurity.sql      | 20 +++++++++++++++++
> > + 3 files changed, 54 insertions(+)
> > +
> > +diff --git a/src/backend/optimizer/util/clauses.c
> b/src/backend/optimizer/util/clauses.c
> > +index 9d7aa8b..da50bef 100644
> > +--- a/src/backend/optimizer/util/clauses.c
> > ++++ b/src/backend/optimizer/util/clauses.c
> > +@@ -5095,6 +5095,13 @@ inline_set_returning_function(PlannerInfo *root=
,
> RangeTblEntry *rte)
> > +      */
> > +     record_plan_function_dependency(root, func_oid);
> > +
> > ++    /*
> > ++     * We must also notice if the inserted query adds a dependency on
> the
> > ++     * calling role due to RLS quals.
> > ++     */
> > ++    if (querytree->hasRowSecurity)
> > ++            root->glob->dependsOnRole =3D true;
> > ++
> > +     return querytree;
> > +
> > +     /* Here if func is not inlinable: release temp memory and return
> NULL */
> > +diff --git a/src/test/regress/expected/rowsecurity.out
> b/src/test/regress/expected/rowsecurity.out
> > +index 89397e4..379f988 100644
> > +--- a/src/test/regress/expected/rowsecurity.out
> > ++++ b/src/test/regress/expected/rowsecurity.out
> > +@@ -3982,6 +3982,33 @@ SELECT * FROM rls_tbl;
> > +
> > + DROP TABLE rls_tbl;
> > + RESET SESSION AUTHORIZATION;
> > ++-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency
> > ++create table rls_t (c text);
> > ++insert into rls_t values ('invisible to bob');
> > ++alter table rls_t enable row level security;
> > ++grant select on rls_t to regress_rls_alice, regress_rls_bob;
> > ++create policy p1 on rls_t for select to regress_rls_alice using (true=
);
> > ++create policy p2 on rls_t for select to regress_rls_bob using (false)=
;
> > ++create function rls_f () returns setof rls_t
> > ++  stable language sql
> > ++  as $$ select * from rls_t $$;
> > ++prepare q as select current_user, * from rls_f();
> > ++set role regress_rls_alice;
> > ++execute q;
> > ++   current_user    |        c
> > ++-------------------+------------------
> > ++ regress_rls_alice | invisible to bob
> > ++(1 row)
> > ++
> > ++set role regress_rls_bob;
> > ++execute q;
> > ++ current_user | c
> > ++--------------+---
> > ++(0 rows)
> > ++
> > ++RESET ROLE;
> > ++DROP FUNCTION rls_f();
> > ++DROP TABLE rls_t;
> > + --
> > + -- Clean up objects
> > + --
> > +diff --git a/src/test/regress/sql/rowsecurity.sql
> b/src/test/regress/sql/rowsecurity.sql
> > +index 44deb42..3015d89 100644
> > +--- a/src/test/regress/sql/rowsecurity.sql
> > ++++ b/src/test/regress/sql/rowsecurity.sql
> > +@@ -1839,6 +1839,26 @@ SELECT * FROM rls_tbl;
> > + DROP TABLE rls_tbl;
> > + RESET SESSION AUTHORIZATION;
> > +
> > ++-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency
> > ++create table rls_t (c text);
> > ++insert into rls_t values ('invisible to bob');
> > ++alter table rls_t enable row level security;
> > ++grant select on rls_t to regress_rls_alice, regress_rls_bob;
> > ++create policy p1 on rls_t for select to regress_rls_alice using (true=
);
> > ++create policy p2 on rls_t for select to regress_rls_bob using (false)=
;
> > ++create function rls_f () returns setof rls_t
> > ++  stable language sql
> > ++  as $$ select * from rls_t $$;
> > ++prepare q as select current_user, * from rls_f();
> > ++set role regress_rls_alice;
> > ++execute q;
> > ++set role regress_rls_bob;
> > ++execute q;
> > ++
> > ++RESET ROLE;
> > ++DROP FUNCTION rls_f();
> > ++DROP TABLE rls_t;
> > ++
> > + --
> > + -- Clean up objects
> > + --
> > +--
> > +2.25.1
> > +
> > diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
> b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
> > index fbc08d64f3..315f6db565 100644
> > --- a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
> > +++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
> > @@ -11,6 +11,8 @@ SRC_URI +=3D "\
> >      file://0001-config_info.c-not-expose-build-info.patch \
> >
> file://0001-Properly-NULL-terminate-GSS-receive-buffer-on-error-.patch \
> >      file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
> > +   file://CVE-2023-2454.patch \
> > +   file://CVE-2023-2455.patch \
> >   "
> >
> >   SRC_URI[sha256sum] =3D
> "d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#103552):
> https://lists.openembedded.org/g/openembedded-devel/message/103552
> > Mute This Topic: https://lists.openembedded.org/mt/99719763/3616698
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> akuster808@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000afb58205feffb58b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, from now on I shall take care of it.<br></div><d=
iv><br></div><div>Kind regards,</div><div>Vivek</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 23, 2023=
 at 8:29=E2=80=AFPM akuster808 &lt;<a href=3D"mailto:akuster808@gmail.com">=
akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hello Vivek<br>
<br>
On 6/23/23 10:45 AM, vkumbhar wrote:<br>
&gt; fixed Below security CVE:<br>
&gt; 1)CVE-2023-2454 postgresql: schema_element defeats protective search_p=
ath changes.<br>
&gt; 2)CVE-2023-2455 postgresql: row security policies disregard user ID ch=
anges after inlining.<br>
<br>
For future reference:=C2=A0 Since the subject line includes the version tag=
, <br>
it would be helpful to include a note in the comments regarding what was <b=
r>
changed.<br>
<br>
- armin<br>
&gt;<br>
&gt; Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.com=
" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../postgresql/files/CVE-2023-2454.patch=C2=A0 =C2=A0 =C2=
=A0 | 235 ++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0.../postgresql/files/CVE-2023-2455.patch=C2=A0 =C2=A0 =C2=
=A0 | 118 +++++++++<br>
&gt;=C2=A0 =C2=A0.../recipes-dbs/postgresql/<a href=3D"http://postgresql_14=
.5.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_14.5.bb</a> |=C2=A0 =
=C2=A02 +<br>
&gt;=C2=A0 =C2=A03 files changed, 355 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-dbs/postgresql/files/CV=
E-2023-2454.patch<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-oe/recipes-dbs/postgresql/files/CV=
E-2023-2455.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch =
b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a2f6927e30<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2454.patch<br>
&gt; @@ -0,0 +1,235 @@<br>
&gt; +From 23cb8eaeb97df350273cb8902e55842a955339c8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Noah Misch &lt;<a href=3D"mailto:noah@leadboat.com" target=3D"_=
blank">noah@leadboat.com</a>&gt;<br>
&gt; +Date: Mon, 8 May 2023 06:14:07 -0700<br>
&gt; +Subject: [PATCH] Replace last PushOverrideSearchPath() call with<br>
&gt; + set_config_option().<br>
&gt; +<br>
&gt; +The two methods don&#39;t cooperate, so set_config_option(&quot;searc=
h_path&quot;,<br>
&gt; +...) has been ineffective under non-empty overrideStack.=C2=A0 This d=
efect<br>
&gt; +enabled an attacker having database-level CREATE privilege to execute=
<br>
&gt; +arbitrary code as the bootstrap superuser.=C2=A0 While that particula=
r attack<br>
&gt; +requires v13+ for the trusted extension attribute, other attacks are<=
br>
&gt; +feasible in all supported versions.<br>
&gt; +<br>
&gt; +Standardize on the combination of NewGUCNestLevel() and<br>
&gt; +set_config_option(&quot;search_path&quot;, ...).=C2=A0 It is newer th=
an<br>
&gt; +PushOverrideSearchPath(), more-prevalent, and has no known<br>
&gt; +disadvantages.=C2=A0 The &quot;override&quot; mechanism remains for n=
ow, for<br>
&gt; +compatibility with out-of-tree code.=C2=A0 Users should update such c=
ode,<br>
&gt; +which likely suffers from the same sort of vulnerability closed here.=
<br>
&gt; +Back-patch to v11 (all supported versions).<br>
&gt; +<br>
&gt; +Alexander Lakhin.=C2=A0 Reported by Alexander Lakhin.<br>
&gt; +<br>
&gt; +Security: CVE-2023-2454<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://git.postgresql.org/gitw=
eb/?p=3Dpostgresql.git;a=3Dcommitdiff;h=3D23cb8eaeb97df350273cb8902e55842a9=
55339c8" rel=3D"noreferrer" target=3D"_blank">https://git.postgresql.org/gi=
tweb/?p=3Dpostgresql.git;a=3Dcommitdiff;h=3D23cb8eaeb97df350273cb8902e55842=
a955339c8</a>]<br>
&gt; +CVE: CVE-2023-2454<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/backend/catalog/namespace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 4 +++<br>
&gt; + src/backend/commands/schemacmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 37 +++=
+++++++++++------<br>
&gt; + src/test/regress/expected/namespace.out | 45 +++++++++++++++++++++++=
++<br>
&gt; + src/test/regress/sql/namespace.sql=C2=A0 =C2=A0 =C2=A0 | 24 ++++++++=
+++++<br>
&gt; + 4 files changed, 100 insertions(+), 10 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/backend/catalog/namespace.c b/src/backend/catalog/na=
mespace.c<br>
&gt; +index 81b6472..0175a91 100644<br>
&gt; +--- a/src/backend/catalog/namespace.c<br>
&gt; ++++ b/src/backend/catalog/namespace.c<br>
&gt; +@@ -3518,6 +3518,10 @@ OverrideSearchPathMatchesCurrent(OverrideSearc=
hPath *path)<br>
&gt; + /*<br>
&gt; +=C2=A0 * PushOverrideSearchPath - temporarily override the search pat=
h<br>
&gt; +=C2=A0 *<br>
&gt; ++ * Do not use this function; almost any usage introduces a security<=
br>
&gt; ++ * vulnerability.=C2=A0 It exists for the benefit of legacy code run=
ning in<br>
&gt; ++ * non-security-sensitive environments.<br>
&gt; ++ *<br>
&gt; +=C2=A0 * We allow nested overrides, hence the push/pop terminology.=
=C2=A0 The GUC<br>
&gt; +=C2=A0 * search_path variable is ignored while an override is active.=
<br>
&gt; +=C2=A0 *<br>
&gt; +diff --git a/src/backend/commands/schemacmds.c b/src/backend/commands=
/schemacmds.c<br>
&gt; +index 66306d1..ecd0cbb 100644<br>
&gt; +--- a/src/backend/commands/schemacmds.c<br>
&gt; ++++ b/src/backend/commands/schemacmds.c<br>
&gt; +@@ -29,6 +29,7 @@<br>
&gt; + #include &quot;commands/schemacmds.h&quot;<br>
&gt; + #include &quot;miscadmin.h&quot;<br>
&gt; + #include &quot;parser/parse_utilcmd.h&quot;<br>
&gt; ++#include &quot;parser/scansup.h&quot;<br>
&gt; + #include &quot;tcop/utility.h&quot;<br>
&gt; + #include &quot;utils/acl.h&quot;<br>
&gt; + #include &quot;utils/builtins.h&quot;<br>
&gt; +@@ -52,14 +53,16 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const=
 char *queryString,<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *schemaName =3D stmt-&gt;schemaname;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0Oid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0namespaceId;<br>
&gt; +-=C2=A0 =C2=A0 OverrideSearchPath *overridePath;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0List=C2=A0 =C2=A0 =C2=A0 =C2=A0*parsetree_list;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0ListCell=C2=A0 =C2=A0*parsetree_item;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Oid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0owner_uid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Oid=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0saved_uid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0save_sec_context;<br>
&gt; ++=C2=A0 =C2=A0 int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0save_nestlevel;<br>
&gt; ++=C2=A0 =C2=A0 char=C2=A0 =C2=A0 =C2=A0 =C2=A0*nsp =3D namespace_sear=
ch_path;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0AclResult=C2=A0 =C2=A0 =C2=A0 =C2=A0aclresult;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0ObjectAddress address;<br>
&gt; ++=C2=A0 =C2=A0 StringInfoData pathbuf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GetUserIdAndSecContext(&amp;saved_uid, &amp;save_=
sec_context);<br>
&gt; +<br>
&gt; +@@ -152,14 +155,26 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, con=
st char *queryString,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0CommandCounterIncrement();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* Temporarily make the new namespace be the fron=
t of the search path, as<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* well as the default creation target namespace.=
=C2=A0 This will be undone at<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0* the end of this routine, or upon error.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* Prepend the new schema to the current search p=
ath.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* We use the equivalent of a function SET option=
 to allow the setting to<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* persist for exactly the duration of the schema=
 creation.=C2=A0 guc.c also<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* takes care of undoing the setting on error.<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +-=C2=A0 =C2=A0 overridePath =3D GetOverrideSearchPath(CurrentMemoryCo=
ntext);<br>
&gt; +-=C2=A0 =C2=A0 overridePath-&gt;schemas =3D lcons_oid(namespaceId, ov=
erridePath-&gt;schemas);<br>
&gt; +-=C2=A0 =C2=A0 /* XXX should we clear overridePath-&gt;useTemp? */<br=
>
&gt; +-=C2=A0 =C2=A0 PushOverrideSearchPath(overridePath);<br>
&gt; ++=C2=A0 =C2=A0 save_nestlevel =3D NewGUCNestLevel();<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 initStringInfo(&amp;pathbuf);<br>
&gt; ++=C2=A0 =C2=A0 appendStringInfoString(&amp;pathbuf, quote_identifier(=
schemaName));<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 while (scanner_isspace(*nsp))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nsp++;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 if (*nsp !=3D &#39;\0&#39;)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 appendStringInfo(&amp;path=
buf, &quot;, %s&quot;, nsp);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 (void) set_config_option(&quot;search_path&quot;, path=
buf.data,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PGC_USERSET, PGC_S_SESSION,=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GUC_ACTION_SAVE, true, 0, f=
alse);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Report the new schema to possibly interested e=
vent triggers.=C2=A0 Note we<br>
&gt; +@@ -213,8 +228,10 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, cons=
t char *queryString,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CommandCounterIncreme=
nt();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 /* Reset search path to normal state */<br>
&gt; +-=C2=A0 =C2=A0 PopOverrideSearchPath();<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* Restore the GUC variable search_path we set ab=
ove.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 AtEOXact_GUC(true, save_nestlevel);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Reset current user and security context */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0SetUserIdAndSecContext(saved_uid, save_sec_contex=
t);<br>
&gt; +diff --git a/src/test/regress/expected/namespace.out b/src/test/regre=
ss/expected/namespace.out<br>
&gt; +index 2564d1b..a62fd8d 100644<br>
&gt; +--- a/src/test/regress/expected/namespace.out<br>
&gt; ++++ b/src/test/regress/expected/namespace.out<br>
&gt; +@@ -1,6 +1,14 @@<br>
&gt; + --<br>
&gt; + -- Regression tests for schemas (namespaces)<br>
&gt; + --<br>
&gt; ++-- set the whitespace-only search_path to test that the<br>
&gt; ++-- GUC list syntax is preserved during a schema creation<br>
&gt; ++SELECT pg_catalog.set_config(&#39;search_path&#39;, &#39; &#39;, fal=
se);<br>
&gt; ++ set_config<br>
&gt; ++------------<br>
&gt; ++<br>
&gt; ++(1 row)<br>
&gt; ++<br>
&gt; + CREATE SCHEMA test_ns_schema_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CREATE UNIQUE INDEX abc_a_idx ON abc (a)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CREATE VIEW abc_view AS<br>
&gt; +@@ -9,6 +17,43 @@ CREATE SCHEMA test_ns_schema_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a serial,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b int UNIQUE<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt; ++-- verify that the correct search_path restored on abort<br>
&gt; ++SET search_path to public;<br>
&gt; ++BEGIN;<br>
&gt; ++SET search_path to public, test_ns_schema_1;<br>
&gt; ++CREATE SCHEMA test_ns_schema_2<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0CREATE VIEW abc_view AS SELECT c FROM abc=
;<br>
&gt; ++ERROR:=C2=A0 column &quot;c&quot; does not exist<br>
&gt; ++LINE 2:=C2=A0 =C2=A0 =C2=A0 =C2=A0 CREATE VIEW abc_view AS SELECT c =
FROM abc;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ^<br>
&gt; ++COMMIT;<br>
&gt; ++SHOW search_path;<br>
&gt; ++ search_path<br>
&gt; ++-------------<br>
&gt; ++ public<br>
&gt; ++(1 row)<br>
&gt; ++<br>
&gt; ++-- verify that the correct search_path preserved<br>
&gt; ++-- after creating the schema and on commit<br>
&gt; ++BEGIN;<br>
&gt; ++SET search_path to public, test_ns_schema_1;<br>
&gt; ++CREATE SCHEMA test_ns_schema_2<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0CREATE VIEW abc_view AS SELECT a FROM abc=
;<br>
&gt; ++SHOW search_path;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0search_path<br>
&gt; ++--------------------------<br>
&gt; ++ public, test_ns_schema_1<br>
&gt; ++(1 row)<br>
&gt; ++<br>
&gt; ++COMMIT;<br>
&gt; ++SHOW search_path;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0search_path<br>
&gt; ++--------------------------<br>
&gt; ++ public, test_ns_schema_1<br>
&gt; ++(1 row)<br>
&gt; ++<br>
&gt; ++DROP SCHEMA test_ns_schema_2 CASCADE;<br>
&gt; ++NOTICE:=C2=A0 drop cascades to view test_ns_schema_2.abc_view<br>
&gt; + -- verify that the objects were created<br>
&gt; + SELECT COUNT(*) FROM pg_class WHERE relnamespace =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(SELECT oid FROM pg_namespace WHERE nspname =3D &=
#39;test_ns_schema_1&#39;);<br>
&gt; +diff --git a/src/test/regress/sql/namespace.sql b/src/test/regress/sq=
l/namespace.sql<br>
&gt; +index 6b12c96..3474f5e 100644<br>
&gt; +--- a/src/test/regress/sql/namespace.sql<br>
&gt; ++++ b/src/test/regress/sql/namespace.sql<br>
&gt; +@@ -2,6 +2,10 @@<br>
&gt; + -- Regression tests for schemas (namespaces)<br>
&gt; + --<br>
&gt; +<br>
&gt; ++-- set the whitespace-only search_path to test that the<br>
&gt; ++-- GUC list syntax is preserved during a schema creation<br>
&gt; ++SELECT pg_catalog.set_config(&#39;search_path&#39;, &#39; &#39;, fal=
se);<br>
&gt; ++<br>
&gt; + CREATE SCHEMA test_ns_schema_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CREATE UNIQUE INDEX abc_a_idx ON abc (a)<=
br>
&gt; +<br>
&gt; +@@ -13,6 +17,26 @@ CREATE SCHEMA test_ns_schema_1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0b int UNIQUE<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt; +<br>
&gt; ++-- verify that the correct search_path restored on abort<br>
&gt; ++SET search_path to public;<br>
&gt; ++BEGIN;<br>
&gt; ++SET search_path to public, test_ns_schema_1;<br>
&gt; ++CREATE SCHEMA test_ns_schema_2<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0CREATE VIEW abc_view AS SELECT c FROM abc=
;<br>
&gt; ++COMMIT;<br>
&gt; ++SHOW search_path;<br>
&gt; ++<br>
&gt; ++-- verify that the correct search_path preserved<br>
&gt; ++-- after creating the schema and on commit<br>
&gt; ++BEGIN;<br>
&gt; ++SET search_path to public, test_ns_schema_1;<br>
&gt; ++CREATE SCHEMA test_ns_schema_2<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0CREATE VIEW abc_view AS SELECT a FROM abc=
;<br>
&gt; ++SHOW search_path;<br>
&gt; ++COMMIT;<br>
&gt; ++SHOW search_path;<br>
&gt; ++DROP SCHEMA test_ns_schema_2 CASCADE;<br>
&gt; ++<br>
&gt; + -- verify that the objects were created<br>
&gt; + SELECT COUNT(*) FROM pg_class WHERE relnamespace =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(SELECT oid FROM pg_namespace WHERE nspname =3D &=
#39;test_ns_schema_1&#39;);<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch =
b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a94c65cc0c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2023-2455.patch<br>
&gt; @@ -0,0 +1,118 @@<br>
&gt; +From 473626cf00babd829eb15c36b51dfb358d32bc95 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Tom Lane &lt;<a href=3D"mailto:tgl@sss.pgh.pa.us" target=3D"_bl=
ank">tgl@sss.pgh.pa.us</a>&gt;<br>
&gt; +Date: Mon, 8 May 2023 10:12:45 -0400<br>
&gt; +Subject: [PATCH] Handle RLS dependencies in inlined set-returning fun=
ctions<br>
&gt; + properly.<br>
&gt; +<br>
&gt; +If an SRF in the FROM clause references a table having row-level<br>
&gt; +security policies, and we inline that SRF into the calling query,<br>
&gt; +we neglected to mark the plan as potentially dependent on which<br>
&gt; +role is executing it.=C2=A0 This could lead to later executions in th=
e<br>
&gt; +same session returning or hiding rows that should have been hidden<br=
>
&gt; +or returned instead.<br>
&gt; +<br>
&gt; +Our thanks to Wolfgang Walther for reporting this problem.<br>
&gt; +<br>
&gt; +Stephen Frost and Tom Lane<br>
&gt; +<br>
&gt; +Security: CVE-2023-2455<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://git.postgresql.org/gitw=
eb/?p=3Dpostgresql.git;a=3Dcommitdiff;h=3D473626cf00babd829eb15c36b51dfb358=
d32bc95" rel=3D"noreferrer" target=3D"_blank">https://git.postgresql.org/gi=
tweb/?p=3Dpostgresql.git;a=3Dcommitdiff;h=3D473626cf00babd829eb15c36b51dfb3=
58d32bc95</a>]<br>
&gt; +CVE: CVE-2023-2455<br>
&gt; +Signed-off-by: Vivek Kumbhar &lt;<a href=3D"mailto:vkumbhar@mvista.co=
m" target=3D"_blank">vkumbhar@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/backend/optimizer/util/clauses.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +=
+++++<br>
&gt; + src/test/regress/expected/rowsecurity.out | 27 +++++++++++++++++++++=
++<br>
&gt; + src/test/regress/sql/rowsecurity.sql=C2=A0 =C2=A0 =C2=A0 | 20 ++++++=
+++++++++++<br>
&gt; + 3 files changed, 54 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/src/backend/optimizer/util/clauses.c b/src/backend/optim=
izer/util/clauses.c<br>
&gt; +index 9d7aa8b..da50bef 100644<br>
&gt; +--- a/src/backend/optimizer/util/clauses.c<br>
&gt; ++++ b/src/backend/optimizer/util/clauses.c<br>
&gt; +@@ -5095,6 +5095,13 @@ inline_set_returning_function(PlannerInfo *roo=
t, RangeTblEntry *rte)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0record_plan_function_dependency(root, func_oid);<=
br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 /*<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* We must also notice if the inserted query adds=
 a dependency on the<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0* calling role due to RLS quals.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; ++=C2=A0 =C2=A0 if (querytree-&gt;hasRowSecurity)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 root-&gt;glob-&gt;dependsO=
nRole =3D true;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return querytree;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Here if func is not inlinable: release temp me=
mory and return NULL */<br>
&gt; +diff --git a/src/test/regress/expected/rowsecurity.out b/src/test/reg=
ress/expected/rowsecurity.out<br>
&gt; +index 89397e4..379f988 100644<br>
&gt; +--- a/src/test/regress/expected/rowsecurity.out<br>
&gt; ++++ b/src/test/regress/expected/rowsecurity.out<br>
&gt; +@@ -3982,6 +3982,33 @@ SELECT * FROM rls_tbl;<br>
&gt; +<br>
&gt; + DROP TABLE rls_tbl;<br>
&gt; + RESET SESSION AUTHORIZATION;<br>
&gt; ++-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency<br=
>
&gt; ++create table rls_t (c text);<br>
&gt; ++insert into rls_t values (&#39;invisible to bob&#39;);<br>
&gt; ++alter table rls_t enable row level security;<br>
&gt; ++grant select on rls_t to regress_rls_alice, regress_rls_bob;<br>
&gt; ++create policy p1 on rls_t for select to regress_rls_alice using (tru=
e);<br>
&gt; ++create policy p2 on rls_t for select to regress_rls_bob using (false=
);<br>
&gt; ++create function rls_f () returns setof rls_t<br>
&gt; ++=C2=A0 stable language sql<br>
&gt; ++=C2=A0 as $$ select * from rls_t $$;<br>
&gt; ++prepare q as select current_user, * from rls_f();<br>
&gt; ++set role regress_rls_alice;<br>
&gt; ++execute q;<br>
&gt; ++=C2=A0 =C2=A0current_user=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
c<br>
&gt; ++-------------------+------------------<br>
&gt; ++ regress_rls_alice | invisible to bob<br>
&gt; ++(1 row)<br>
&gt; ++<br>
&gt; ++set role regress_rls_bob;<br>
&gt; ++execute q;<br>
&gt; ++ current_user | c<br>
&gt; ++--------------+---<br>
&gt; ++(0 rows)<br>
&gt; ++<br>
&gt; ++RESET ROLE;<br>
&gt; ++DROP FUNCTION rls_f();<br>
&gt; ++DROP TABLE rls_t;<br>
&gt; + --<br>
&gt; + -- Clean up objects<br>
&gt; + --<br>
&gt; +diff --git a/src/test/regress/sql/rowsecurity.sql b/src/test/regress/=
sql/rowsecurity.sql<br>
&gt; +index 44deb42..3015d89 100644<br>
&gt; +--- a/src/test/regress/sql/rowsecurity.sql<br>
&gt; ++++ b/src/test/regress/sql/rowsecurity.sql<br>
&gt; +@@ -1839,6 +1839,26 @@ SELECT * FROM rls_tbl;<br>
&gt; + DROP TABLE rls_tbl;<br>
&gt; + RESET SESSION AUTHORIZATION;<br>
&gt; +<br>
&gt; ++-- CVE-2023-2455: inlining an SRF may introduce an RLS dependency<br=
>
&gt; ++create table rls_t (c text);<br>
&gt; ++insert into rls_t values (&#39;invisible to bob&#39;);<br>
&gt; ++alter table rls_t enable row level security;<br>
&gt; ++grant select on rls_t to regress_rls_alice, regress_rls_bob;<br>
&gt; ++create policy p1 on rls_t for select to regress_rls_alice using (tru=
e);<br>
&gt; ++create policy p2 on rls_t for select to regress_rls_bob using (false=
);<br>
&gt; ++create function rls_f () returns setof rls_t<br>
&gt; ++=C2=A0 stable language sql<br>
&gt; ++=C2=A0 as $$ select * from rls_t $$;<br>
&gt; ++prepare q as select current_user, * from rls_f();<br>
&gt; ++set role regress_rls_alice;<br>
&gt; ++execute q;<br>
&gt; ++set role regress_rls_bob;<br>
&gt; ++execute q;<br>
&gt; ++<br>
&gt; ++RESET ROLE;<br>
&gt; ++DROP FUNCTION rls_f();<br>
&gt; ++DROP TABLE rls_t;<br>
&gt; ++<br>
&gt; + --<br>
&gt; + -- Clean up objects<br>
&gt; + --<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-dbs/postgresql/<a href=3D"http://postgres=
ql_14.5.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_14.5.bb</a> b/m=
eta-oe/recipes-dbs/postgresql/<a href=3D"http://postgresql_14.5.bb" rel=3D"=
noreferrer" target=3D"_blank">postgresql_14.5.bb</a><br>
&gt; index fbc08d64f3..315f6db565 100644<br>
&gt; --- a/meta-oe/recipes-dbs/postgresql/<a href=3D"http://postgresql_14.5=
.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_14.5.bb</a><br>
&gt; +++ b/meta-oe/recipes-dbs/postgresql/<a href=3D"http://postgresql_14.5=
.bb" rel=3D"noreferrer" target=3D"_blank">postgresql_14.5.bb</a><br>
&gt; @@ -11,6 +11,8 @@ SRC_URI +=3D &quot;\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-config_info.c-not-expose-build-info.pa=
tch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-Properly-NULL-terminate-GSS-receive-bu=
ffer-on-error-.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 file://0001-postgresql-fix-ptest-failure-of-sysvie=
ws.patch \<br>
&gt; +=C2=A0 =C2=A0file://CVE-2023-2454.patch \<br>
&gt; +=C2=A0 =C2=A0file://CVE-2023-2455.patch \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0SRC_URI[sha256sum] =3D &quot;d4f72cb5fb857c9a9f75ec8cf091a=
1771272802f2178f0b2e65b7b6ff64f4a30&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#103552): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/103552" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/103552</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99719763=
/3616698" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/99719763/3616698</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:akuster808@gmail.co=
m" target=3D"_blank">akuster808@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000afb58205feffb58b--

