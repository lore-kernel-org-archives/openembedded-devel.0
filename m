Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188EFC32771
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 01:35:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2478.1663810514839729529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Sep 2022 18:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eq83lzKJ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6264493283=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28M1BA09008008
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=RDjvwPaN8fr420bHN6KpSDB8194gO470wohvf7IwXgY=;
 b=eq83lzKJ3Z1BAoWKuvVEsnaDdOC2eEL50eIqnbKeCaO7ziPxUfYk5xo5k0iScPmqWCAb
 gka9wib9FvCujewcZIP8ZH6JX7lfFuX2IQFnX/DbgjZsT8Hu/T3iB4Y3QTEYhWvx9ubL
 zKRdjU6L9OwAFBbuf6UYkRemvR91POcz/CXTvWfk998FTudaKlab312vyw7Ri/aMqBoy
 rExY9rzMR1jqaaDYbAMBTdSLAtsZwg7u8Rzmm1ay4lh8uyj/blT4m8dcdGJvoAAZeZF1
 9YeorYPsvCZ5Zez6kBSKkl8/zLHFqQelxx1+T285Zc1wwCpfnpSs/iJ1jzL3LvNgWWYG lg==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn3f1c2nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 01:35:13 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 21 Sep 2022 18:35:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 21 Sep 2022 18:35:11 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 21 Sep 2022 18:35:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][PATCH] postgresql: fix CVE-2022-2625
Date: Thu, 22 Sep 2022 09:35:10 +0800
Message-ID: <20220922013510.3176274-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nOLZzHsRnkW_EkS3wduU5XaAqLRHSnkM
X-Proofpoint-GUID: nOLZzHsRnkW_EkS3wduU5XaAqLRHSnkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_13,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 01:35:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98917

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../postgresql/files/CVE-2022-2625-01.patch   | 935 ++++++++++++++++++
 .../postgresql/files/CVE-2022-2625-02.patch   |  38 +
 .../recipes-dbs/postgresql/postgresql_14.4.bb |   2 +
 3 files changed, 975 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625-01.patch
 create mode 100644 meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625-02.patch

diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625-01.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625-01.patch
new file mode 100644
index 0000000000..e8f2ffbc86
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625-01.patch
@@ -0,0 +1,935 @@
+From 2d3f438af1b7895d6a15a8238e2d7542229031d3 Mon Sep 17 00:00:00 2001
+From: Tom Lane <tgl@sss.pgh.pa.us>
+Date: Mon, 8 Aug 2022 11:12:31 -0400
+Subject: [PATCH 1/2] In extensions, don't replace objects not belonging to the
+ extension.
+
+Previously, if an extension script did CREATE OR REPLACE and there was
+an existing object not belonging to the extension, it would overwrite
+the object and adopt it into the extension.  This is problematic, first
+because the overwrite is probably unintentional, and second because we
+didn't change the object's ownership.  Thus a hostile user could create
+an object in advance of an expected CREATE EXTENSION command, and would
+then have ownership rights on an extension object, which could be
+modified for trojan-horse-type attacks.
+
+Hence, forbid CREATE OR REPLACE of an existing object unless it already
+belongs to the extension.  (Note that we've always forbidden replacing
+an object that belongs to some other extension; only the behavior for
+previously-free-standing objects changes here.)
+
+For the same reason, also fail CREATE IF NOT EXISTS when there is
+an existing object that doesn't belong to the extension.
+
+Our thanks to Sven Klemm for reporting this problem.
+
+Security: CVE-2022-2625
+
+CVE: CVE-2022-2625
+Upstream-Status: Backport [https://github.com/postgres/postgres/commit/b9b21acc766db54d8c337d508d0fe2f5bf2daab0]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ doc/src/sgml/extend.sgml                      |  11 --
+ src/backend/catalog/pg_collation.c            |  49 ++++--
+ src/backend/catalog/pg_depend.c               |  77 +++++++--
+ src/backend/catalog/pg_operator.c             |   2 +-
+ src/backend/catalog/pg_type.c                 |   7 +-
+ src/backend/commands/createas.c               |  16 +-
+ src/backend/commands/foreigncmds.c            |  19 ++-
+ src/backend/commands/schemacmds.c             |  25 ++-
+ src/backend/commands/sequence.c               |   8 +
+ src/backend/commands/statscmds.c              |   4 +
+ src/backend/commands/view.c                   |  16 +-
+ src/backend/parser/parse_utilcmd.c            |  10 ++
+ src/include/catalog/dependency.h              |   2 +
+ src/test/modules/test_extensions/Makefile     |   5 +-
+ .../expected/test_extensions.out              | 153 ++++++++++++++++++
+ .../test_extensions/sql/test_extensions.sql   | 110 +++++++++++++
+ .../test_ext_cine--1.0--1.1.sql               |  26 +++
+ .../test_extensions/test_ext_cine--1.0.sql    |  25 +++
+ .../test_extensions/test_ext_cine.control     |   3 +
+ .../test_extensions/test_ext_cor--1.0.sql     |  20 +++
+ .../test_extensions/test_ext_cor.control      |   3 +
+ 21 files changed, 539 insertions(+), 52 deletions(-)
+ create mode 100644 src/test/modules/test_extensions/test_ext_cine--1.0--1.1.sql
+ create mode 100644 src/test/modules/test_extensions/test_ext_cine--1.0.sql
+ create mode 100644 src/test/modules/test_extensions/test_ext_cine.control
+ create mode 100644 src/test/modules/test_extensions/test_ext_cor--1.0.sql
+ create mode 100644 src/test/modules/test_extensions/test_ext_cor.control
+
+diff --git a/doc/src/sgml/extend.sgml b/doc/src/sgml/extend.sgml
+index e928894..bb0b267 100644
+--- a/doc/src/sgml/extend.sgml
++++ b/doc/src/sgml/extend.sgml
+@@ -1319,17 +1319,6 @@ SELECT * FROM pg_extension_update_paths('<replaceable>extension_name</replaceabl
+       trusted if it depends on another one, unless that other one is always
+       installed in <literal>pg_catalog</literal>.
+      </para>
+-
+-     <para>
+-      Do <emphasis>not</emphasis> use <command>CREATE OR REPLACE
+-      FUNCTION</command>, except in an update script that must change the
+-      definition of a function that is known to be an extension member
+-      already.  (Likewise for other <literal>OR REPLACE</literal> options.)
+-      Using <literal>OR REPLACE</literal> unnecessarily not only has a risk
+-      of accidentally overwriting someone else's function, but it creates a
+-      security hazard since the overwritten function would still be owned by
+-      its original owner, who could modify it.
+-     </para>
+     </sect3>
+    </sect2>
+ 
+diff --git a/src/backend/catalog/pg_collation.c b/src/backend/catalog/pg_collation.c
+index 19068b6..b1137ca 100644
+--- a/src/backend/catalog/pg_collation.c
++++ b/src/backend/catalog/pg_collation.c
+@@ -78,15 +78,25 @@ CollationCreate(const char *collname, Oid collnamespace,
+ 	 * friendlier error message.  The unique index provides a backstop against
+ 	 * race conditions.
+ 	 */
+-	if (SearchSysCacheExists3(COLLNAMEENCNSP,
+-							  PointerGetDatum(collname),
+-							  Int32GetDatum(collencoding),
+-							  ObjectIdGetDatum(collnamespace)))
++	oid = GetSysCacheOid3(COLLNAMEENCNSP,
++						  Anum_pg_collation_oid,
++						  PointerGetDatum(collname),
++						  Int32GetDatum(collencoding),
++						  ObjectIdGetDatum(collnamespace));
++	if (OidIsValid(oid))
+ 	{
+ 		if (quiet)
+ 			return InvalidOid;
+ 		else if (if_not_exists)
+ 		{
++			/*
++			 * If we are in an extension script, insist that the pre-existing
++			 * object be a member of the extension, to avoid security risks.
++			 */
++			ObjectAddressSet(myself, CollationRelationId, oid);
++			checkMembershipInCurrentExtension(&myself);
++
++			/* OK to skip */
+ 			ereport(NOTICE,
+ 					(errcode(ERRCODE_DUPLICATE_OBJECT),
+ 					 collencoding == -1
+@@ -116,16 +126,19 @@ CollationCreate(const char *collname, Oid collnamespace,
+ 	 * so we take a ShareRowExclusiveLock earlier, to protect against
+ 	 * concurrent changes fooling this check.
+ 	 */
+-	if ((collencoding == -1 &&
+-		 SearchSysCacheExists3(COLLNAMEENCNSP,
+-							   PointerGetDatum(collname),
+-							   Int32GetDatum(GetDatabaseEncoding()),
+-							   ObjectIdGetDatum(collnamespace))) ||
+-		(collencoding != -1 &&
+-		 SearchSysCacheExists3(COLLNAMEENCNSP,
+-							   PointerGetDatum(collname),
+-							   Int32GetDatum(-1),
+-							   ObjectIdGetDatum(collnamespace))))
++	if (collencoding == -1)
++		oid = GetSysCacheOid3(COLLNAMEENCNSP,
++							  Anum_pg_collation_oid,
++							  PointerGetDatum(collname),
++							  Int32GetDatum(GetDatabaseEncoding()),
++							  ObjectIdGetDatum(collnamespace));
++	else
++		oid = GetSysCacheOid3(COLLNAMEENCNSP,
++							  Anum_pg_collation_oid,
++							  PointerGetDatum(collname),
++							  Int32GetDatum(-1),
++							  ObjectIdGetDatum(collnamespace));
++	if (OidIsValid(oid))
+ 	{
+ 		if (quiet)
+ 		{
+@@ -134,6 +147,14 @@ CollationCreate(const char *collname, Oid collnamespace,
+ 		}
+ 		else if (if_not_exists)
+ 		{
++			/*
++			 * If we are in an extension script, insist that the pre-existing
++			 * object be a member of the extension, to avoid security risks.
++			 */
++			ObjectAddressSet(myself, CollationRelationId, oid);
++			checkMembershipInCurrentExtension(&myself);
++
++			/* OK to skip */
+ 			table_close(rel, NoLock);
+ 			ereport(NOTICE,
+ 					(errcode(ERRCODE_DUPLICATE_OBJECT),
+diff --git a/src/backend/catalog/pg_depend.c b/src/backend/catalog/pg_depend.c
+index ae16d2f..07791b4 100644
+--- a/src/backend/catalog/pg_depend.c
++++ b/src/backend/catalog/pg_depend.c
+@@ -166,22 +166,23 @@ recordMultipleDependencies(const ObjectAddress *depender,
+ 
+ /*
+  * If we are executing a CREATE EXTENSION operation, mark the given object
+- * as being a member of the extension.  Otherwise, do nothing.
++ * as being a member of the extension, or check that it already is one.
++ * Otherwise, do nothing.
+  *
+  * This must be called during creation of any user-definable object type
+  * that could be a member of an extension.
+  *
+- * If isReplace is true, the object already existed (or might have already
+- * existed), so we must check for a pre-existing extension membership entry.
+- * Passing false is a guarantee that the object is newly created, and so
+- * could not already be a member of any extension.
++ * isReplace must be true if the object already existed, and false if it is
++ * newly created.  In the former case we insist that it already be a member
++ * of the current extension.  In the latter case we can skip checking whether
++ * it is already a member of any extension.
+  *
+  * Note: isReplace = true is typically used when updating an object in
+- * CREATE OR REPLACE and similar commands.  The net effect is that if an
+- * extension script uses such a command on a pre-existing free-standing
+- * object, the object will be absorbed into the extension.  If the object
+- * is already a member of some other extension, the command will fail.
+- * This behavior is desirable for cases such as replacing a shell type.
++ * CREATE OR REPLACE and similar commands.  We used to allow the target
++ * object to not already be an extension member, instead silently absorbing
++ * it into the current extension.  However, this was both error-prone
++ * (extensions might accidentally overwrite free-standing objects) and
++ * a security hazard (since the object would retain its previous ownership).
+  */
+ void
+ recordDependencyOnCurrentExtension(const ObjectAddress *object,
+@@ -199,6 +200,12 @@ recordDependencyOnCurrentExtension(const ObjectAddress *object,
+ 		{
+ 			Oid			oldext;
+ 
++			/*
++			 * Side note: these catalog lookups are safe only because the
++			 * object is a pre-existing one.  In the not-isReplace case, the
++			 * caller has most likely not yet done a CommandCounterIncrement
++			 * that would make the new object visible.
++			 */
+ 			oldext = getExtensionOfObject(object->classId, object->objectId);
+ 			if (OidIsValid(oldext))
+ 			{
+@@ -212,6 +219,13 @@ recordDependencyOnCurrentExtension(const ObjectAddress *object,
+ 								getObjectDescription(object, false),
+ 								get_extension_name(oldext))));
+ 			}
++			/* It's a free-standing object, so reject */
++			ereport(ERROR,
++					(errcode(ERRCODE_OBJECT_NOT_IN_PREREQUISITE_STATE),
++					 errmsg("%s is not a member of extension \"%s\"",
++							getObjectDescription(object, false),
++							get_extension_name(CurrentExtensionObject)),
++					 errdetail("An extension is not allowed to replace an object that it does not own.")));
+ 		}
+ 
+ 		/* OK, record it as a member of CurrentExtensionObject */
+@@ -223,6 +237,49 @@ recordDependencyOnCurrentExtension(const ObjectAddress *object,
+ 	}
+ }
+ 
++/*
++ * If we are executing a CREATE EXTENSION operation, check that the given
++ * object is a member of the extension, and throw an error if it isn't.
++ * Otherwise, do nothing.
++ *
++ * This must be called whenever a CREATE IF NOT EXISTS operation (for an
++ * object type that can be an extension member) has found that an object of
++ * the desired name already exists.  It is insecure for an extension to use
++ * IF NOT EXISTS except when the conflicting object is already an extension
++ * member; otherwise a hostile user could substitute an object with arbitrary
++ * properties.
++ */
++void
++checkMembershipInCurrentExtension(const ObjectAddress *object)
++{
++	/*
++	 * This is actually the same condition tested in
++	 * recordDependencyOnCurrentExtension; but we want to issue a
++	 * differently-worded error, and anyway it would be pretty confusing to
++	 * call recordDependencyOnCurrentExtension in these circumstances.
++	 */
++
++	/* Only whole objects can be extension members */
++	Assert(object->objectSubId == 0);
++
++	if (creating_extension)
++	{
++		Oid			oldext;
++
++		oldext = getExtensionOfObject(object->classId, object->objectId);
++		/* If already a member of this extension, OK */
++		if (oldext == CurrentExtensionObject)
++			return;
++		/* Else complain */
++		ereport(ERROR,
++				(errcode(ERRCODE_OBJECT_NOT_IN_PREREQUISITE_STATE),
++				 errmsg("%s is not a member of extension \"%s\"",
++						getObjectDescription(object, false),
++						get_extension_name(CurrentExtensionObject)),
++				 errdetail("An extension may only use CREATE ... IF NOT EXISTS to skip object creation if the conflicting object is one that it already owns.")));
++	}
++}
++
+ /*
+  * deleteDependencyRecordsFor -- delete all records with given depender
+  * classId/objectId.  Returns the number of records deleted.
+diff --git a/src/backend/catalog/pg_operator.c b/src/backend/catalog/pg_operator.c
+index 4c5a56c..5ec3221 100644
+--- a/src/backend/catalog/pg_operator.c
++++ b/src/backend/catalog/pg_operator.c
+@@ -864,7 +864,7 @@ makeOperatorDependencies(HeapTuple tuple,
+ 
+ 	/* Dependency on extension */
+ 	if (makeExtensionDep)
+-		recordDependencyOnCurrentExtension(&myself, true);
++		recordDependencyOnCurrentExtension(&myself, isUpdate);
+ 
+ 	return myself;
+ }
+diff --git a/src/backend/catalog/pg_type.c b/src/backend/catalog/pg_type.c
+index cdce22f..b37a8f0 100644
+--- a/src/backend/catalog/pg_type.c
++++ b/src/backend/catalog/pg_type.c
+@@ -548,8 +548,11 @@ TypeCreate(Oid newTypeOid,
+  * rebuild should be true if this is a pre-existing type.  We will remove
+  * existing dependencies and rebuild them from scratch.  This is needed for
+  * ALTER TYPE, and also when replacing a shell type.  We don't remove any
+- * existing extension dependency, though (hence, if makeExtensionDep is also
+- * true and the type belongs to some other extension, an error will occur).
++ * existing extension dependency, though; hence, if makeExtensionDep is also
++ * true and we're in an extension script, an error will occur unless the
++ * type already belongs to the current extension.  That's the behavior we
++ * want when replacing a shell type, which is the only case where both flags
++ * are true.
+  */
+ void
+ GenerateTypeDependencies(HeapTuple typeTuple,
+diff --git a/src/backend/commands/createas.c b/src/backend/commands/createas.c
+index 0982851..addf478 100644
+--- a/src/backend/commands/createas.c
++++ b/src/backend/commands/createas.c
+@@ -393,11 +393,14 @@ bool
+ CreateTableAsRelExists(CreateTableAsStmt *ctas)
+ {
+ 	Oid			nspid;
++	Oid			oldrelid;
++	ObjectAddress address;
+ 	IntoClause *into = ctas->into;
+ 
+ 	nspid = RangeVarGetCreationNamespace(into->rel);
+ 
+-	if (get_relname_relid(into->rel->relname, nspid))
++	oldrelid = get_relname_relid(into->rel->relname, nspid);
++	if (OidIsValid(oldrelid))
+ 	{
+ 		if (!ctas->if_not_exists)
+ 			ereport(ERROR,
+@@ -405,7 +408,16 @@ CreateTableAsRelExists(CreateTableAsStmt *ctas)
+ 					 errmsg("relation \"%s\" already exists",
+ 							into->rel->relname)));
+ 
+-		/* The relation exists and IF NOT EXISTS has been specified */
++		/*
++		 * The relation exists and IF NOT EXISTS has been specified.
++		 *
++		 * If we are in an extension script, insist that the pre-existing
++		 * object be a member of the extension, to avoid security risks.
++		 */
++		ObjectAddressSet(address, RelationRelationId, oldrelid);
++		checkMembershipInCurrentExtension(&address);
++
++		/* OK to skip */
+ 		ereport(NOTICE,
+ 				(errcode(ERRCODE_DUPLICATE_TABLE),
+ 				 errmsg("relation \"%s\" already exists, skipping",
+diff --git a/src/backend/commands/foreigncmds.c b/src/backend/commands/foreigncmds.c
+index bc36311..901b8bc 100644
+--- a/src/backend/commands/foreigncmds.c
++++ b/src/backend/commands/foreigncmds.c
+@@ -859,13 +859,22 @@ CreateForeignServer(CreateForeignServerStmt *stmt)
+ 	ownerId = GetUserId();
+ 
+ 	/*
+-	 * Check that there is no other foreign server by this name. Do nothing if
+-	 * IF NOT EXISTS was enforced.
++	 * Check that there is no other foreign server by this name.  If there is
++	 * one, do nothing if IF NOT EXISTS was specified.
+ 	 */
+-	if (GetForeignServerByName(stmt->servername, true) != NULL)
++	srvId = get_foreign_server_oid(stmt->servername, true);
++	if (OidIsValid(srvId))
+ 	{
+ 		if (stmt->if_not_exists)
+ 		{
++			/*
++			 * If we are in an extension script, insist that the pre-existing
++			 * object be a member of the extension, to avoid security risks.
++			 */
++			ObjectAddressSet(myself, ForeignServerRelationId, srvId);
++			checkMembershipInCurrentExtension(&myself);
++
++			/* OK to skip */
+ 			ereport(NOTICE,
+ 					(errcode(ERRCODE_DUPLICATE_OBJECT),
+ 					 errmsg("server \"%s\" already exists, skipping",
+@@ -1130,6 +1139,10 @@ CreateUserMapping(CreateUserMappingStmt *stmt)
+ 	{
+ 		if (stmt->if_not_exists)
+ 		{
++			/*
++			 * Since user mappings aren't members of extensions (see comments
++			 * below), no need for checkMembershipInCurrentExtension here.
++			 */
+ 			ereport(NOTICE,
+ 					(errcode(ERRCODE_DUPLICATE_OBJECT),
+ 					 errmsg("user mapping for \"%s\" already exists for server \"%s\", skipping",
+diff --git a/src/backend/commands/schemacmds.c b/src/backend/commands/schemacmds.c
+index 6c6ab9e..66306d1 100644
+--- a/src/backend/commands/schemacmds.c
++++ b/src/backend/commands/schemacmds.c
+@@ -112,14 +112,25 @@ CreateSchemaCommand(CreateSchemaStmt *stmt, const char *queryString,
+ 	 * the permissions checks, but since CREATE TABLE IF NOT EXISTS makes its
+ 	 * creation-permission check first, we do likewise.
+ 	 */
+-	if (stmt->if_not_exists &&
+-		SearchSysCacheExists1(NAMESPACENAME, PointerGetDatum(schemaName)))
++	if (stmt->if_not_exists)
+ 	{
+-		ereport(NOTICE,
+-				(errcode(ERRCODE_DUPLICATE_SCHEMA),
+-				 errmsg("schema \"%s\" already exists, skipping",
+-						schemaName)));
+-		return InvalidOid;
++		namespaceId = get_namespace_oid(schemaName, true);
++		if (OidIsValid(namespaceId))
++		{
++			/*
++			 * If we are in an extension script, insist that the pre-existing
++			 * object be a member of the extension, to avoid security risks.
++			 */
++			ObjectAddressSet(address, NamespaceRelationId, namespaceId);
++			checkMembershipInCurrentExtension(&address);
++
++			/* OK to skip */
++			ereport(NOTICE,
++					(errcode(ERRCODE_DUPLICATE_SCHEMA),
++					 errmsg("schema \"%s\" already exists, skipping",
++							schemaName)));
++			return InvalidOid;
++		}
+ 	}
+ 
+ 	/*
+diff --git a/src/backend/commands/sequence.c b/src/backend/commands/sequence.c
+index 0415df9..9864998 100644
+--- a/src/backend/commands/sequence.c
++++ b/src/backend/commands/sequence.c
+@@ -149,6 +149,14 @@ DefineSequence(ParseState *pstate, CreateSeqStmt *seq)
+ 		RangeVarGetAndCheckCreationNamespace(seq->sequence, NoLock, &seqoid);
+ 		if (OidIsValid(seqoid))
+ 		{
++			/*
++			 * If we are in an extension script, insist that the pre-existing
++			 * object be a member of the extension, to avoid security risks.
++			 */
++			ObjectAddressSet(address, RelationRelationId, seqoid);
++			checkMembershipInCurrentExtension(&address);
++
++			/* OK to skip */
+ 			ereport(NOTICE,
+ 					(errcode(ERRCODE_DUPLICATE_TABLE),
+ 					 errmsg("relation \"%s\" already exists, skipping",
+diff --git a/src/backend/commands/statscmds.c b/src/backend/commands/statscmds.c
+index 59e531b..6d8f482 100644
+--- a/src/backend/commands/statscmds.c
++++ b/src/backend/commands/statscmds.c
+@@ -184,6 +184,10 @@ CreateStatistics(CreateStatsStmt *stmt)
+ 	{
+ 		if (stmt->if_not_exists)
+ 		{
++			/*
++			 * Since stats objects aren't members of extensions (see comments
++			 * below), no need for checkMembershipInCurrentExtension here.
++			 */
+ 			ereport(NOTICE,
+ 					(errcode(ERRCODE_DUPLICATE_OBJECT),
+ 					 errmsg("statistics object \"%s\" already exists, skipping",
+diff --git a/src/backend/commands/view.c b/src/backend/commands/view.c
+index 4df05a0..f24464d 100644
+--- a/src/backend/commands/view.c
++++ b/src/backend/commands/view.c
+@@ -190,7 +190,7 @@ DefineVirtualRelation(RangeVar *relation, List *tlist, bool replace,
+ 		CommandCounterIncrement();
+ 
+ 		/*
+-		 * Finally update the view options.
++		 * Update the view's options.
+ 		 *
+ 		 * The new options list replaces the existing options list, even if
+ 		 * it's empty.
+@@ -203,8 +203,22 @@ DefineVirtualRelation(RangeVar *relation, List *tlist, bool replace,
+ 		/* EventTriggerAlterTableStart called by ProcessUtilitySlow */
+ 		AlterTableInternal(viewOid, atcmds, true);
+ 
++		/*
++		 * There is very little to do here to update the view's dependencies.
++		 * Most view-level dependency relationships, such as those on the
++		 * owner, schema, and associated composite type, aren't changing.
++		 * Because we don't allow changing type or collation of an existing
++		 * view column, those dependencies of the existing columns don't
++		 * change either, while the AT_AddColumnToView machinery took care of
++		 * adding such dependencies for new view columns.  The dependencies of
++		 * the view's query could have changed arbitrarily, but that was dealt
++		 * with inside StoreViewQuery.  What remains is only to check that
++		 * view replacement is allowed when we're creating an extension.
++		 */
+ 		ObjectAddressSet(address, RelationRelationId, viewOid);
+ 
++		recordDependencyOnCurrentExtension(&address, true);
++
+ 		/*
+ 		 * Seems okay, so return the OID of the pre-existing view.
+ 		 */
+diff --git a/src/backend/parser/parse_utilcmd.c b/src/backend/parser/parse_utilcmd.c
+index 05e4fa8..ecd5871 100644
+--- a/src/backend/parser/parse_utilcmd.c
++++ b/src/backend/parser/parse_utilcmd.c
+@@ -196,6 +196,16 @@ transformCreateStmt(CreateStmt *stmt, const char *queryString)
+ 	 */
+ 	if (stmt->if_not_exists && OidIsValid(existing_relid))
+ 	{
++		/*
++		 * If we are in an extension script, insist that the pre-existing
++		 * object be a member of the extension, to avoid security risks.
++		 */
++		ObjectAddress address;
++
++		ObjectAddressSet(address, RelationRelationId, existing_relid);
++		checkMembershipInCurrentExtension(&address);
++
++		/* OK to skip */
+ 		ereport(NOTICE,
+ 				(errcode(ERRCODE_DUPLICATE_TABLE),
+ 				 errmsg("relation \"%s\" already exists, skipping",
+diff --git a/src/include/catalog/dependency.h b/src/include/catalog/dependency.h
+index fd44081..242026b 100644
+--- a/src/include/catalog/dependency.h
++++ b/src/include/catalog/dependency.h
+@@ -201,6 +201,8 @@ extern void recordMultipleDependencies(const ObjectAddress *depender,
+ extern void recordDependencyOnCurrentExtension(const ObjectAddress *object,
+ 											   bool isReplace);
+ 
++extern void checkMembershipInCurrentExtension(const ObjectAddress *object);
++
+ extern long deleteDependencyRecordsFor(Oid classId, Oid objectId,
+ 									   bool skipExtensionDeps);
+ 
+diff --git a/src/test/modules/test_extensions/Makefile b/src/test/modules/test_extensions/Makefile
+index 77ee4d5..452cae3 100644
+--- a/src/test/modules/test_extensions/Makefile
++++ b/src/test/modules/test_extensions/Makefile
+@@ -4,11 +4,14 @@ MODULE = test_extensions
+ PGFILEDESC = "test_extensions - regression testing for EXTENSION support"
+ 
+ EXTENSION = test_ext1 test_ext2 test_ext3 test_ext4 test_ext5 test_ext6 \
+-            test_ext7 test_ext8 test_ext_cyclic1 test_ext_cyclic2 \
++            test_ext7 test_ext8 test_ext_cine test_ext_cor \
++            test_ext_cyclic1 test_ext_cyclic2 \
+             test_ext_evttrig
+ DATA = test_ext1--1.0.sql test_ext2--1.0.sql test_ext3--1.0.sql \
+        test_ext4--1.0.sql test_ext5--1.0.sql test_ext6--1.0.sql \
+        test_ext7--1.0.sql test_ext7--1.0--2.0.sql test_ext8--1.0.sql \
++       test_ext_cine--1.0.sql test_ext_cine--1.0--1.1.sql \
++       test_ext_cor--1.0.sql \
+        test_ext_cyclic1--1.0.sql test_ext_cyclic2--1.0.sql \
+        test_ext_evttrig--1.0.sql test_ext_evttrig--1.0--2.0.sql
+ 
+diff --git a/src/test/modules/test_extensions/expected/test_extensions.out b/src/test/modules/test_extensions/expected/test_extensions.out
+index 30ae621..821fed3 100644
+--- a/src/test/modules/test_extensions/expected/test_extensions.out
++++ b/src/test/modules/test_extensions/expected/test_extensions.out
+@@ -159,3 +159,156 @@ RESET client_min_messages;
+ CREATE EXTENSION test_ext_evttrig;
+ ALTER EXTENSION test_ext_evttrig UPDATE TO '2.0';
+ DROP EXTENSION test_ext_evttrig;
++-- It's generally bad style to use CREATE OR REPLACE unnecessarily.
++-- Test what happens if an extension does it anyway.
++-- Replacing a shell type or operator is sort of like CREATE OR REPLACE;
++-- check that too.
++CREATE FUNCTION ext_cor_func() RETURNS text
++  AS $$ SELECT 'ext_cor_func: original'::text $$ LANGUAGE sql;
++CREATE EXTENSION test_ext_cor;  -- fail
++ERROR:  function ext_cor_func() is not a member of extension "test_ext_cor"
++DETAIL:  An extension is not allowed to replace an object that it does not own.
++SELECT ext_cor_func();
++      ext_cor_func      
++------------------------
++ ext_cor_func: original
++(1 row)
++
++DROP FUNCTION ext_cor_func();
++CREATE VIEW ext_cor_view AS
++  SELECT 'ext_cor_view: original'::text AS col;
++CREATE EXTENSION test_ext_cor;  -- fail
++ERROR:  view ext_cor_view is not a member of extension "test_ext_cor"
++DETAIL:  An extension is not allowed to replace an object that it does not own.
++SELECT ext_cor_func();
++ERROR:  function ext_cor_func() does not exist
++LINE 1: SELECT ext_cor_func();
++               ^
++HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
++SELECT * FROM ext_cor_view;
++          col           
++------------------------
++ ext_cor_view: original
++(1 row)
++
++DROP VIEW ext_cor_view;
++CREATE TYPE test_ext_type;
++CREATE EXTENSION test_ext_cor;  -- fail
++ERROR:  type test_ext_type is not a member of extension "test_ext_cor"
++DETAIL:  An extension is not allowed to replace an object that it does not own.
++DROP TYPE test_ext_type;
++-- this makes a shell "point <<@@ polygon" operator too
++CREATE OPERATOR @@>> ( PROCEDURE = poly_contain_pt,
++  LEFTARG = polygon, RIGHTARG = point,
++  COMMUTATOR = <<@@ );
++CREATE EXTENSION test_ext_cor;  -- fail
++ERROR:  operator <<@@(point,polygon) is not a member of extension "test_ext_cor"
++DETAIL:  An extension is not allowed to replace an object that it does not own.
++DROP OPERATOR <<@@ (point, polygon);
++CREATE EXTENSION test_ext_cor;  -- now it should work
++SELECT ext_cor_func();
++         ext_cor_func         
++------------------------------
++ ext_cor_func: from extension
++(1 row)
++
++SELECT * FROM ext_cor_view;
++             col              
++------------------------------
++ ext_cor_view: from extension
++(1 row)
++
++SELECT 'x'::test_ext_type;
++ test_ext_type 
++---------------
++ x
++(1 row)
++
++SELECT point(0,0) <<@@ polygon(circle(point(0,0),1));
++ ?column? 
++----------
++ t
++(1 row)
++
++\dx+ test_ext_cor
++Objects in extension "test_ext_cor"
++      Object description      
++------------------------------
++ function ext_cor_func()
++ operator <<@@(point,polygon)
++ type test_ext_type
++ view ext_cor_view
++(4 rows)
++
++--
++-- CREATE IF NOT EXISTS is an entirely unsound thing for an extension
++-- to be doing, but let's at least plug the major security hole in it.
++--
++CREATE COLLATION ext_cine_coll
++  ( LC_COLLATE = "C", LC_CTYPE = "C" );
++CREATE EXTENSION test_ext_cine;  -- fail
++ERROR:  collation ext_cine_coll is not a member of extension "test_ext_cine"
++DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip object creation if the conflicting object is one that it already owns.
++DROP COLLATION ext_cine_coll;
++CREATE MATERIALIZED VIEW ext_cine_mv AS SELECT 11 AS f1;
++CREATE EXTENSION test_ext_cine;  -- fail
++ERROR:  materialized view ext_cine_mv is not a member of extension "test_ext_cine"
++DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip object creation if the conflicting object is one that it already owns.
++DROP MATERIALIZED VIEW ext_cine_mv;
++CREATE FOREIGN DATA WRAPPER dummy;
++CREATE SERVER ext_cine_srv FOREIGN DATA WRAPPER dummy;
++CREATE EXTENSION test_ext_cine;  -- fail
++ERROR:  server ext_cine_srv is not a member of extension "test_ext_cine"
++DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip object creation if the conflicting object is one that it already owns.
++DROP SERVER ext_cine_srv;
++CREATE SCHEMA ext_cine_schema;
++CREATE EXTENSION test_ext_cine;  -- fail
++ERROR:  schema ext_cine_schema is not a member of extension "test_ext_cine"
++DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip object creation if the conflicting object is one that it already owns.
++DROP SCHEMA ext_cine_schema;
++CREATE SEQUENCE ext_cine_seq;
++CREATE EXTENSION test_ext_cine;  -- fail
++ERROR:  sequence ext_cine_seq is not a member of extension "test_ext_cine"
++DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip object creation if the conflicting object is one that it already owns.
++DROP SEQUENCE ext_cine_seq;
++CREATE TABLE ext_cine_tab1 (x int);
++CREATE EXTENSION test_ext_cine;  -- fail
++ERROR:  table ext_cine_tab1 is not a member of extension "test_ext_cine"
++DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip object creation if the conflicting object is one that it already owns.
++DROP TABLE ext_cine_tab1;
++CREATE TABLE ext_cine_tab2 AS SELECT 42 AS y;
++CREATE EXTENSION test_ext_cine;  -- fail
++ERROR:  table ext_cine_tab2 is not a member of extension "test_ext_cine"
++DETAIL:  An extension may only use CREATE ... IF NOT EXISTS to skip object creation if the conflicting object is one that it already owns.
++DROP TABLE ext_cine_tab2;
++CREATE EXTENSION test_ext_cine;
++\dx+ test_ext_cine
++Objects in extension "test_ext_cine"
++        Object description         
++-----------------------------------
++ collation ext_cine_coll
++ foreign-data wrapper ext_cine_fdw
++ materialized view ext_cine_mv
++ schema ext_cine_schema
++ sequence ext_cine_seq
++ server ext_cine_srv
++ table ext_cine_tab1
++ table ext_cine_tab2
++(8 rows)
++
++ALTER EXTENSION test_ext_cine UPDATE TO '1.1';
++\dx+ test_ext_cine
++Objects in extension "test_ext_cine"
++        Object description         
++-----------------------------------
++ collation ext_cine_coll
++ foreign-data wrapper ext_cine_fdw
++ materialized view ext_cine_mv
++ schema ext_cine_schema
++ sequence ext_cine_seq
++ server ext_cine_srv
++ table ext_cine_tab1
++ table ext_cine_tab2
++ table ext_cine_tab3
++(9 rows)
++
+diff --git a/src/test/modules/test_extensions/sql/test_extensions.sql b/src/test/modules/test_extensions/sql/test_extensions.sql
+index c16fd36..41b6cdd 100644
+--- a/src/test/modules/test_extensions/sql/test_extensions.sql
++++ b/src/test/modules/test_extensions/sql/test_extensions.sql
+@@ -99,3 +99,113 @@ RESET client_min_messages;
+ CREATE EXTENSION test_ext_evttrig;
+ ALTER EXTENSION test_ext_evttrig UPDATE TO '2.0';
+ DROP EXTENSION test_ext_evttrig;
++
++-- It's generally bad style to use CREATE OR REPLACE unnecessarily.
++-- Test what happens if an extension does it anyway.
++-- Replacing a shell type or operator is sort of like CREATE OR REPLACE;
++-- check that too.
++
++CREATE FUNCTION ext_cor_func() RETURNS text
++  AS $$ SELECT 'ext_cor_func: original'::text $$ LANGUAGE sql;
++
++CREATE EXTENSION test_ext_cor;  -- fail
++
++SELECT ext_cor_func();
++
++DROP FUNCTION ext_cor_func();
++
++CREATE VIEW ext_cor_view AS
++  SELECT 'ext_cor_view: original'::text AS col;
++
++CREATE EXTENSION test_ext_cor;  -- fail
++
++SELECT ext_cor_func();
++
++SELECT * FROM ext_cor_view;
++
++DROP VIEW ext_cor_view;
++
++CREATE TYPE test_ext_type;
++
++CREATE EXTENSION test_ext_cor;  -- fail
++
++DROP TYPE test_ext_type;
++
++-- this makes a shell "point <<@@ polygon" operator too
++CREATE OPERATOR @@>> ( PROCEDURE = poly_contain_pt,
++  LEFTARG = polygon, RIGHTARG = point,
++  COMMUTATOR = <<@@ );
++
++CREATE EXTENSION test_ext_cor;  -- fail
++
++DROP OPERATOR <<@@ (point, polygon);
++
++CREATE EXTENSION test_ext_cor;  -- now it should work
++
++SELECT ext_cor_func();
++
++SELECT * FROM ext_cor_view;
++
++SELECT 'x'::test_ext_type;
++
++SELECT point(0,0) <<@@ polygon(circle(point(0,0),1));
++
++\dx+ test_ext_cor
++
++--
++-- CREATE IF NOT EXISTS is an entirely unsound thing for an extension
++-- to be doing, but let's at least plug the major security hole in it.
++--
++
++CREATE COLLATION ext_cine_coll
++  ( LC_COLLATE = "C", LC_CTYPE = "C" );
++
++CREATE EXTENSION test_ext_cine;  -- fail
++
++DROP COLLATION ext_cine_coll;
++
++CREATE MATERIALIZED VIEW ext_cine_mv AS SELECT 11 AS f1;
++
++CREATE EXTENSION test_ext_cine;  -- fail
++
++DROP MATERIALIZED VIEW ext_cine_mv;
++
++CREATE FOREIGN DATA WRAPPER dummy;
++
++CREATE SERVER ext_cine_srv FOREIGN DATA WRAPPER dummy;
++
++CREATE EXTENSION test_ext_cine;  -- fail
++
++DROP SERVER ext_cine_srv;
++
++CREATE SCHEMA ext_cine_schema;
++
++CREATE EXTENSION test_ext_cine;  -- fail
++
++DROP SCHEMA ext_cine_schema;
++
++CREATE SEQUENCE ext_cine_seq;
++
++CREATE EXTENSION test_ext_cine;  -- fail
++
++DROP SEQUENCE ext_cine_seq;
++
++CREATE TABLE ext_cine_tab1 (x int);
++
++CREATE EXTENSION test_ext_cine;  -- fail
++
++DROP TABLE ext_cine_tab1;
++
++CREATE TABLE ext_cine_tab2 AS SELECT 42 AS y;
++
++CREATE EXTENSION test_ext_cine;  -- fail
++
++DROP TABLE ext_cine_tab2;
++
++CREATE EXTENSION test_ext_cine;
++
++\dx+ test_ext_cine
++
++ALTER EXTENSION test_ext_cine UPDATE TO '1.1';
++
++\dx+ test_ext_cine
+diff --git a/src/test/modules/test_extensions/test_ext_cine--1.0--1.1.sql b/src/test/modules/test_extensions/test_ext_cine--1.0--1.1.sql
+new file mode 100644
+index 0000000..6dadfd2
+--- /dev/null
++++ b/src/test/modules/test_extensions/test_ext_cine--1.0--1.1.sql
+@@ -0,0 +1,26 @@
++/* src/test/modules/test_extensions/test_ext_cine--1.0--1.1.sql */
++-- complain if script is sourced in psql, rather than via ALTER EXTENSION
++\echo Use "ALTER EXTENSION test_ext_cine UPDATE TO '1.1'" to load this file. \quit
++
++--
++-- These are the same commands as in the 1.0 script; we expect them
++-- to do nothing.
++--
++
++CREATE COLLATION IF NOT EXISTS ext_cine_coll
++  ( LC_COLLATE = "POSIX", LC_CTYPE = "POSIX" );
++
++CREATE MATERIALIZED VIEW IF NOT EXISTS ext_cine_mv AS SELECT 42 AS f1;
++
++CREATE SERVER IF NOT EXISTS ext_cine_srv FOREIGN DATA WRAPPER ext_cine_fdw;
++
++CREATE SCHEMA IF NOT EXISTS ext_cine_schema;
++
++CREATE SEQUENCE IF NOT EXISTS ext_cine_seq;
++
++CREATE TABLE IF NOT EXISTS ext_cine_tab1 (x int);
++
++CREATE TABLE IF NOT EXISTS ext_cine_tab2 AS SELECT 42 AS y;
++
++-- just to verify the script ran
++CREATE TABLE ext_cine_tab3 (z int);
+diff --git a/src/test/modules/test_extensions/test_ext_cine--1.0.sql b/src/test/modules/test_extensions/test_ext_cine--1.0.sql
+new file mode 100644
+index 0000000..01408ff
+--- /dev/null
++++ b/src/test/modules/test_extensions/test_ext_cine--1.0.sql
+@@ -0,0 +1,25 @@
++/* src/test/modules/test_extensions/test_ext_cine--1.0.sql */
++-- complain if script is sourced in psql, rather than via CREATE EXTENSION
++\echo Use "CREATE EXTENSION test_ext_cine" to load this file. \quit
++
++--
++-- CREATE IF NOT EXISTS is an entirely unsound thing for an extension
++-- to be doing, but let's at least plug the major security hole in it.
++--
++
++CREATE COLLATION IF NOT EXISTS ext_cine_coll
++  ( LC_COLLATE = "POSIX", LC_CTYPE = "POSIX" );
++
++CREATE MATERIALIZED VIEW IF NOT EXISTS ext_cine_mv AS SELECT 42 AS f1;
++
++CREATE FOREIGN DATA WRAPPER ext_cine_fdw;
++
++CREATE SERVER IF NOT EXISTS ext_cine_srv FOREIGN DATA WRAPPER ext_cine_fdw;
++
++CREATE SCHEMA IF NOT EXISTS ext_cine_schema;
++
++CREATE SEQUENCE IF NOT EXISTS ext_cine_seq;
++
++CREATE TABLE IF NOT EXISTS ext_cine_tab1 (x int);
++
++CREATE TABLE IF NOT EXISTS ext_cine_tab2 AS SELECT 42 AS y;
+diff --git a/src/test/modules/test_extensions/test_ext_cine.control b/src/test/modules/test_extensions/test_ext_cine.control
+new file mode 100644
+index 0000000..ced713b
+--- /dev/null
++++ b/src/test/modules/test_extensions/test_ext_cine.control
+@@ -0,0 +1,3 @@
++comment = 'Test extension using CREATE IF NOT EXISTS'
++default_version = '1.0'
++relocatable = true
+diff --git a/src/test/modules/test_extensions/test_ext_cor--1.0.sql b/src/test/modules/test_extensions/test_ext_cor--1.0.sql
+new file mode 100644
+index 0000000..2e8d89c
+--- /dev/null
++++ b/src/test/modules/test_extensions/test_ext_cor--1.0.sql
+@@ -0,0 +1,20 @@
++/* src/test/modules/test_extensions/test_ext_cor--1.0.sql */
++-- complain if script is sourced in psql, rather than via CREATE EXTENSION
++\echo Use "CREATE EXTENSION test_ext_cor" to load this file. \quit
++
++-- It's generally bad style to use CREATE OR REPLACE unnecessarily.
++-- Test what happens if an extension does it anyway.
++
++CREATE OR REPLACE FUNCTION ext_cor_func() RETURNS text
++  AS $$ SELECT 'ext_cor_func: from extension'::text $$ LANGUAGE sql;
++
++CREATE OR REPLACE VIEW ext_cor_view AS
++  SELECT 'ext_cor_view: from extension'::text AS col;
++
++-- These are for testing replacement of a shell type/operator, which works
++-- enough like an implicit OR REPLACE to be important to check.
++
++CREATE TYPE test_ext_type AS ENUM('x', 'y');
++
++CREATE OPERATOR <<@@ ( PROCEDURE = pt_contained_poly,
++  LEFTARG = point, RIGHTARG = polygon );
+diff --git a/src/test/modules/test_extensions/test_ext_cor.control b/src/test/modules/test_extensions/test_ext_cor.control
+new file mode 100644
+index 0000000..0e972e5
+--- /dev/null
++++ b/src/test/modules/test_extensions/test_ext_cor.control
+@@ -0,0 +1,3 @@
++comment = 'Test extension using CREATE OR REPLACE'
++default_version = '1.0'
++relocatable = true
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625-02.patch b/meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625-02.patch
new file mode 100644
index 0000000000..8a3310e78f
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/files/CVE-2022-2625-02.patch
@@ -0,0 +1,38 @@
+From c0d5d52a780fb575d8f93d0b1a8ef8cb43851a84 Mon Sep 17 00:00:00 2001
+From: Tom Lane <tgl@sss.pgh.pa.us>
+Date: Mon, 8 Aug 2022 12:16:01 -0400
+Subject: [PATCH] Stabilize output of new regression test.
+
+Per buildfarm, the output order of \dx+ isn't consistent across
+locales.  Apply NO_LOCALE to force C locale.  There might be a
+more localized way, but I'm not seeing it offhand, and anyway
+there is nothing in this test module that particularly cares
+about locales.
+
+Security: CVE-2022-2625
+
+CVE: CVE-2022-2625
+Upstream-Status: Backport [https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=22b205cbbd978e69f08bd2b980adae29a6ca1979]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ src/test/modules/test_extensions/Makefile | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/test/modules/test_extensions/Makefile b/src/test/modules/test_extensions/Makefile
+index 452cae3b2e..c3139ab0fc 100644
+--- a/src/test/modules/test_extensions/Makefile
++++ b/src/test/modules/test_extensions/Makefile
+@@ -17,6 +17,9 @@ DATA = test_ext1--1.0.sql test_ext2--1.0.sql test_ext3--1.0.sql \
+ 
+ REGRESS = test_extensions test_extdepend
+ 
++# force C locale for output stability
++NO_LOCALE = 1
++
+ ifdef USE_PGXS
+ PG_CONFIG = pg_config
+ PGXS := $(shell $(PG_CONFIG) --pgxs)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
index 1daab22f92..bf0e7c2f32 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_14.4.bb
@@ -9,6 +9,8 @@ SRC_URI += "\
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
    file://remove_duplicate.patch \
    file://0001-config_info.c-not-expose-build-info.patch \
+   file://CVE-2022-2625-01.patch \
+   file://CVE-2022-2625-02.patch \
 "
 
 SRC_URI[sha256sum] = "c23b6237c5231c791511bdc79098617d6852e9e3bdf360efd8b5d15a1a3d8f6a"
-- 
2.25.1


