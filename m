Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id DF91872228
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:31 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fb1so9907640pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fw1fNeWCffsud8lv21GUpA2MlyVp63qhri8R7PcLVT0=;
	b=AqxgiaKQp5fn26YIMTxy9xHEDL5/yn/xkVgUJF/0y3aQIOM4IrTMom9U4VmnkWfZso
	oFzgccSHhTkvFcl6RKBOeP8s1zqYlukMLKRo0bD0WDqp7D1OM7QtLBCPSzkZGKMBOTUQ
	YtSh91p7JHaO+6NGxH0PGQxGHuEPXnILxtkLfI7X5ODsE3+iZsNV63Gror+NFZ/G6qok
	znWWcVqSuCmZCtmFTCXHhceG0eHKQIsEKLEVoss8PtZdnWqHmLWHTPwnrZClqGpPvGuj
	P0jIwRl34rY4S41GURRcARu3Uix2Rorwc7IFcNLR6nb6g27YSXlGz1q5O4KGeg/QZjRV
	A+Rw==
X-Received: by 10.70.42.98 with SMTP id n2mr95259866pdl.139.1417395872092;
	Sun, 30 Nov 2014 17:04:32 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:07 -0800
Message-Id: <44c9bc740e80b1fe94b24fa3ac7dccf345047537.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
Cc: otavio@ossystems.com.br
Subject: [PATCH 05/15] postgresql: add fix for CVE-2014-0061 Security Advisory
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Dec 2014 01:04:32 -0000

From: Kang Kai <kai.kang@windriver.com>

The validator functions for the procedural languages (PLs) in PostgreSQL
before 8.4.20, 9.0.x before 9.0.16, 9.1.x before 9.1.12, 9.2.x before
9.2.7, and 9.3.x before 9.3.3 allow remote authenticated users to gain
privileges via a function that is (1) defined in another language or (2)
not allowed to be directly called by the user due to permissions.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-0061

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...vilege-escalation-in-explicit-calls-to-PL.patch | 267 +++++++++++++++++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  |   1 +
 2 files changed, 268 insertions(+)
 create mode 100644 meta-oe/recipes-support/postgresql/files/0004-Prevent-privilege-escalation-in-explicit-calls-to-PL.patch

diff --git a/meta-oe/recipes-support/postgresql/files/0004-Prevent-privilege-escalation-in-explicit-calls-to-PL.patch b/meta-oe/recipes-support/postgresql/files/0004-Prevent-privilege-escalation-in-explicit-calls-to-PL.patch
new file mode 100644
index 0000000..cc2183a
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/0004-Prevent-privilege-escalation-in-explicit-calls-to-PL.patch
@@ -0,0 +1,267 @@
+From 1d701d28a796ea2d1a4d2be9e9ee06209eaea040 Mon Sep 17 00:00:00 2001
+From: Noah Misch <noah@leadboat.com>
+Date: Mon, 17 Feb 2014 09:33:31 -0500
+Subject: [PATCH] Prevent privilege escalation in explicit calls to PL
+ validators.
+
+commit 1d701d28a796ea2d1a4d2be9e9ee06209eaea040 REL9_2_STABLE
+
+The primary role of PL validators is to be called implicitly during
+CREATE FUNCTION, but they are also normal functions that a user can call
+explicitly.  Add a permissions check to each validator to ensure that a
+user cannot use explicit validator calls to achieve things he could not
+otherwise achieve.  Back-patch to 8.4 (all supported versions).
+Non-core procedural language extensions ought to make the same two-line
+change to their own validators.
+
+Andres Freund, reviewed by Tom Lane and Noah Misch.
+
+Security: CVE-2014-0061
+
+Upstream-Status: Backport
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ doc/src/sgml/plhandler.sgml         |    5 ++-
+ src/backend/catalog/pg_proc.c       |    9 ++++
+ src/backend/commands/functioncmds.c |    1 -
+ src/backend/utils/fmgr/fmgr.c       |   84 +++++++++++++++++++++++++++++++++++
+ src/include/fmgr.h                  |    1 +
+ src/pl/plperl/plperl.c              |    4 ++
+ src/pl/plpgsql/src/pl_handler.c     |    3 +
+ src/pl/plpython/plpy_main.c         |    4 ++
+ 8 files changed, 109 insertions(+), 2 deletions(-)
+
+diff --git a/doc/src/sgml/plhandler.sgml b/doc/src/sgml/plhandler.sgml
+index 024ef9d..aa4bba3 100644
+--- a/doc/src/sgml/plhandler.sgml
++++ b/doc/src/sgml/plhandler.sgml
+@@ -178,7 +178,10 @@ CREATE LANGUAGE plsample
+     or updated a function written in the procedural language.
+     The passed-in OID is the OID of the function's <classname>pg_proc</>
+     row.  The validator must fetch this row in the usual way, and do
+-    whatever checking is appropriate.  Typical checks include verifying
++    whatever checking is appropriate.
++    First, call <function>CheckFunctionValidatorAccess()</> to diagnose
++    explicit calls to the validator that the user could not achieve through
++    <command>CREATE FUNCTION</>.  Typical checks then include verifying
+     that the function's argument and result types are supported by the
+     language, and that the function's body is syntactically correct
+     in the language.  If the validator finds the function to be okay,
+diff --git a/src/backend/catalog/pg_proc.c b/src/backend/catalog/pg_proc.c
+index 3812408..3124868 100644
+--- a/src/backend/catalog/pg_proc.c
++++ b/src/backend/catalog/pg_proc.c
+@@ -718,6 +718,9 @@ fmgr_internal_validator(PG_FUNCTION_ARGS)
+ 	Datum		tmp;
+ 	char	   *prosrc;
+ 
++	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
++		PG_RETURN_VOID();
++
+ 	/*
+ 	 * We do not honor check_function_bodies since it's unlikely the function
+ 	 * name will be found later if it isn't there now.
+@@ -763,6 +766,9 @@ fmgr_c_validator(PG_FUNCTION_ARGS)
+ 	char	   *prosrc;
+ 	char	   *probin;
+ 
++	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
++		PG_RETURN_VOID();
++
+ 	/*
+ 	 * It'd be most consistent to skip the check if !check_function_bodies,
+ 	 * but the purpose of that switch is to be helpful for pg_dump loading,
+@@ -814,6 +820,9 @@ fmgr_sql_validator(PG_FUNCTION_ARGS)
+ 	bool		haspolyarg;
+ 	int			i;
+ 
++	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
++		PG_RETURN_VOID();
++
+ 	tuple = SearchSysCache1(PROCOID, ObjectIdGetDatum(funcoid));
+ 	if (!HeapTupleIsValid(tuple))
+ 		elog(ERROR, "cache lookup failed for function %u", funcoid);
+diff --git a/src/backend/commands/functioncmds.c b/src/backend/commands/functioncmds.c
+index 9ba6dd8..ea74b5e 100644
+--- a/src/backend/commands/functioncmds.c
++++ b/src/backend/commands/functioncmds.c
+@@ -997,7 +997,6 @@ CreateFunction(CreateFunctionStmt *stmt, const char *queryString)
+ 					prorows);
+ }
+ 
+-
+ /*
+  * Guts of function deletion.
+  *
+diff --git a/src/backend/utils/fmgr/fmgr.c b/src/backend/utils/fmgr/fmgr.c
+index 2ec63fa..8d6f183 100644
+--- a/src/backend/utils/fmgr/fmgr.c
++++ b/src/backend/utils/fmgr/fmgr.c
+@@ -24,6 +24,7 @@
+ #include "miscadmin.h"
+ #include "nodes/nodeFuncs.h"
+ #include "pgstat.h"
++#include "utils/acl.h"
+ #include "utils/builtins.h"
+ #include "utils/fmgrtab.h"
+ #include "utils/guc.h"
+@@ -2445,3 +2446,86 @@ get_call_expr_arg_stable(Node *expr, int argnum)
+ 
+ 	return false;
+ }
++
++/*-------------------------------------------------------------------------
++ *		Support routines for procedural language implementations
++ *-------------------------------------------------------------------------
++ */
++
++/*
++ * Verify that a validator is actually associated with the language of a
++ * particular function and that the user has access to both the language and
++ * the function.  All validators should call this before doing anything
++ * substantial.  Doing so ensures a user cannot achieve anything with explicit
++ * calls to validators that he could not achieve with CREATE FUNCTION or by
++ * simply calling an existing function.
++ *
++ * When this function returns false, callers should skip all validation work
++ * and call PG_RETURN_VOID().  This never happens at present; it is reserved
++ * for future expansion.
++ *
++ * In particular, checking that the validator corresponds to the function's
++ * language allows untrusted language validators to assume they process only
++ * superuser-chosen source code.  (Untrusted language call handlers, by
++ * definition, do assume that.)  A user lacking the USAGE language privilege
++ * would be unable to reach the validator through CREATE FUNCTION, so we check
++ * that to block explicit calls as well.  Checking the EXECUTE privilege on
++ * the function is often superfluous, because most users can clone the
++ * function to get an executable copy.  It is meaningful against users with no
++ * database TEMP right and no permanent schema CREATE right, thereby unable to
++ * create any function.  Also, if the function tracks persistent state by
++ * function OID or name, validating the original function might permit more
++ * mischief than creating and validating a clone thereof.
++ */
++bool
++CheckFunctionValidatorAccess(Oid validatorOid, Oid functionOid)
++{
++	HeapTuple	procTup;
++	HeapTuple	langTup;
++	Form_pg_proc procStruct;
++	Form_pg_language langStruct;
++	AclResult	aclresult;
++
++	/* Get the function's pg_proc entry */
++	procTup = SearchSysCache1(PROCOID, ObjectIdGetDatum(functionOid));
++	if (!HeapTupleIsValid(procTup))
++		elog(ERROR, "cache lookup failed for function %u", functionOid);
++	procStruct = (Form_pg_proc) GETSTRUCT(procTup);
++
++	/*
++	 * Fetch pg_language entry to know if this is the correct validation
++	 * function for that pg_proc entry.
++	 */
++	langTup = SearchSysCache1(LANGOID, ObjectIdGetDatum(procStruct->prolang));
++	if (!HeapTupleIsValid(langTup))
++		elog(ERROR, "cache lookup failed for language %u", procStruct->prolang);
++	langStruct = (Form_pg_language) GETSTRUCT(langTup);
++
++	if (langStruct->lanvalidator != validatorOid)
++		ereport(ERROR,
++				(errcode(ERRCODE_INSUFFICIENT_PRIVILEGE),
++				 errmsg("language validation function %u called for language %u instead of %u",
++						validatorOid, procStruct->prolang,
++						langStruct->lanvalidator)));
++
++	/* first validate that we have permissions to use the language */
++	aclresult = pg_language_aclcheck(procStruct->prolang, GetUserId(),
++									 ACL_USAGE);
++	if (aclresult != ACLCHECK_OK)
++		aclcheck_error(aclresult, ACL_KIND_LANGUAGE,
++					   NameStr(langStruct->lanname));
++
++	/*
++	 * Check whether we are allowed to execute the function itself. If we can
++	 * execute it, there should be no possible side-effect of
++	 * compiling/validation that execution can't have.
++	 */
++	aclresult = pg_proc_aclcheck(functionOid, GetUserId(), ACL_EXECUTE);
++	if (aclresult != ACLCHECK_OK)
++		aclcheck_error(aclresult, ACL_KIND_PROC, NameStr(procStruct->proname));
++
++	ReleaseSysCache(procTup);
++	ReleaseSysCache(langTup);
++
++	return true;
++}
+diff --git a/src/include/fmgr.h b/src/include/fmgr.h
+index 0a25776..f944cc6 100644
+--- a/src/include/fmgr.h
++++ b/src/include/fmgr.h
+@@ -624,6 +624,7 @@ extern Oid	get_fn_expr_argtype(FmgrInfo *flinfo, int argnum);
+ extern Oid	get_call_expr_argtype(fmNodePtr expr, int argnum);
+ extern bool get_fn_expr_arg_stable(FmgrInfo *flinfo, int argnum);
+ extern bool get_call_expr_arg_stable(fmNodePtr expr, int argnum);
++extern bool CheckFunctionValidatorAccess(Oid validatorOid, Oid functionOid);
+ 
+ /*
+  * Routines in dfmgr.c
+diff --git a/src/pl/plperl/plperl.c b/src/pl/plperl/plperl.c
+index 7c2aee9..49d50c4 100644
+--- a/src/pl/plperl/plperl.c
++++ b/src/pl/plperl/plperl.c
+@@ -1847,6 +1847,9 @@ plperl_validator(PG_FUNCTION_ARGS)
+ 	bool		istrigger = false;
+ 	int			i;
+ 
++	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
++		PG_RETURN_VOID();
++
+ 	/* Get the new function's pg_proc entry */
+ 	tuple = SearchSysCache1(PROCOID, ObjectIdGetDatum(funcoid));
+ 	if (!HeapTupleIsValid(tuple))
+@@ -1926,6 +1929,7 @@ PG_FUNCTION_INFO_V1(plperlu_validator);
+ Datum
+ plperlu_validator(PG_FUNCTION_ARGS)
+ {
++	/* call plperl validator with our fcinfo so it gets our oid */
+ 	return plperl_validator(fcinfo);
+ }
+ 
+diff --git a/src/pl/plpgsql/src/pl_handler.c b/src/pl/plpgsql/src/pl_handler.c
+index 022ec3f..00b1a6f 100644
+--- a/src/pl/plpgsql/src/pl_handler.c
++++ b/src/pl/plpgsql/src/pl_handler.c
+@@ -227,6 +227,9 @@ plpgsql_validator(PG_FUNCTION_ARGS)
+ 	bool		istrigger = false;
+ 	int			i;
+ 
++	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
++		PG_RETURN_VOID();
++
+ 	/* Get the new function's pg_proc entry */
+ 	tuple = SearchSysCache1(PROCOID, ObjectIdGetDatum(funcoid));
+ 	if (!HeapTupleIsValid(tuple))
+diff --git a/src/pl/plpython/plpy_main.c b/src/pl/plpython/plpy_main.c
+index c4de762..3847847 100644
+--- a/src/pl/plpython/plpy_main.c
++++ b/src/pl/plpython/plpy_main.c
+@@ -159,6 +159,9 @@ plpython_validator(PG_FUNCTION_ARGS)
+ 	Form_pg_proc procStruct;
+ 	bool		is_trigger;
+ 
++	if (!CheckFunctionValidatorAccess(fcinfo->flinfo->fn_oid, funcoid))
++		PG_RETURN_VOID();
++
+ 	if (!check_function_bodies)
+ 	{
+ 		PG_RETURN_VOID();
+@@ -184,6 +187,7 @@ plpython_validator(PG_FUNCTION_ARGS)
+ Datum
+ plpython2_validator(PG_FUNCTION_ARGS)
+ {
++	/* call plpython validator with our fcinfo so it gets our oid */
+ 	return plpython_validator(fcinfo);
+ }
+ #endif   /* PY_MAJOR_VERSION < 3 */
+-- 
+1.7.5.4
+
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index d6a4cd7..e2e5947 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -33,6 +33,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
            file://0001-Use-pkg-config-for-libxml2-detection.patch \
            file://0002-Predict-integer-overflow-to-avoid-buffer-overruns.patch \
            file://0003-Shore-up-ADMIN-OPTION-restrictions.patch \
+           file://0004-Prevent-privilege-escalation-in-explicit-calls-to-PL.patch \
           "
 
 LEAD_SONAME = "libpq.so"
-- 
1.9.1


