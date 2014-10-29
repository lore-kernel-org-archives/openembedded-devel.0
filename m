Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7C9601A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 00:34:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9T0YKgb017297
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Oct 2014 17:34:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Tue, 28 Oct 2014 17:34:19 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <otavio@ossystems.com.br>
Date: Wed, 29 Oct 2014 08:30:53 +0800
Message-ID: <1414542659-15721-3-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414542659-15721-1-git-send-email-kai.kang@windriver.com>
References: <1414542659-15721-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: Yue.Tao@windriver.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/8] postgresql: add fix for CVE-2014-0060 Security Advisory
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
X-List-Received-Date: Wed, 29 Oct 2014 00:34:22 -0000
Content-Type: text/plain

PostgreSQL before 8.4.20, 9.0.x before 9.0.16, 9.1.x before 9.1.12,
9.2.x before 9.2.7, and 9.3.x before 9.3.3 does not properly enforce the
ADMIN OPTION restriction, which allows remote authenticated members of a
role to add or remove arbitrary users to that role by calling the SET
ROLE command before the associated GRANT command.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-0060

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0003-Shore-up-ADMIN-OPTION-restrictions.patch  | 273 +++++++++++++++++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  |   1 +
 2 files changed, 274 insertions(+)
 create mode 100644 meta-oe/recipes-support/postgresql/files/0003-Shore-up-ADMIN-OPTION-restrictions.patch

diff --git a/meta-oe/recipes-support/postgresql/files/0003-Shore-up-ADMIN-OPTION-restrictions.patch b/meta-oe/recipes-support/postgresql/files/0003-Shore-up-ADMIN-OPTION-restrictions.patch
new file mode 100644
index 0000000..abbe142
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/files/0003-Shore-up-ADMIN-OPTION-restrictions.patch
@@ -0,0 +1,273 @@
+From 15a8f97b9d16aaf659f58c981242b9da591cf24c Mon Sep 17 00:00:00 2001
+From: Noah Misch <noah@leadboat.com>
+Date: Mon, 17 Feb 2014 09:33:31 -0500
+Subject: [PATCH] Shore up ADMIN OPTION restrictions.
+
+commit 15a8f97b9d16aaf659f58c981242b9da591cf24c REL9_2_STABLE
+
+Granting a role without ADMIN OPTION is supposed to prevent the grantee
+from adding or removing members from the granted role.  Issuing SET ROLE
+before the GRANT bypassed that, because the role itself had an implicit
+right to add or remove members.  Plug that hole by recognizing that
+implicit right only when the session user matches the current role.
+Additionally, do not recognize it during a security-restricted operation
+or during execution of a SECURITY DEFINER function.  The restriction on
+SECURITY DEFINER is not security-critical.  However, it seems best for a
+user testing his own SECURITY DEFINER function to see the same behavior
+others will see.  Back-patch to 8.4 (all supported versions).
+
+The SQL standards do not conflate roles and users as PostgreSQL does;
+only SQL roles have members, and only SQL users initiate sessions.  An
+application using PostgreSQL users and roles as SQL users and roles will
+never attempt to grant membership in the role that is the session user,
+so the implicit right to add or remove members will never arise.
+
+The security impact was mostly that a role member could revoke access
+from others, contrary to the wishes of his own grantor.  Unapproved role
+member additions are less notable, because the member can still largely
+achieve that by creating a view or a SECURITY DEFINER function.
+
+Reviewed by Andres Freund and Tom Lane.  Reported, independently, by
+Jonas Sundman and Noah Misch.
+
+Security: CVE-2014-0060
+
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ doc/src/sgml/ref/grant.sgml              |   12 ++++---
+ src/backend/commands/user.c              |   11 ++++++-
+ src/backend/utils/adt/acl.c              |   50 ++++++++++++++++++++++++------
+ src/test/regress/expected/privileges.out |   36 +++++++++++++++++++++-
+ src/test/regress/sql/privileges.sql      |   29 ++++++++++++++++-
+ 5 files changed, 120 insertions(+), 18 deletions(-)
+
+diff --git a/doc/src/sgml/ref/grant.sgml b/doc/src/sgml/ref/grant.sgml
+index fb81af4..2b5a843 100644
+--- a/doc/src/sgml/ref/grant.sgml
++++ b/doc/src/sgml/ref/grant.sgml
+@@ -396,11 +396,13 @@ GRANT <replaceable class="PARAMETER">role_name</replaceable> [, ...] TO <replace
+   <para>
+    If <literal>WITH ADMIN OPTION</literal> is specified, the member can
+    in turn grant membership in the role to others, and revoke membership
+-   in the role as well.  Without the admin option, ordinary users cannot do
+-   that.  However,
+-   database superusers can grant or revoke membership in any role to anyone.
+-   Roles having <literal>CREATEROLE</> privilege can grant or revoke
+-   membership in any role that is not a superuser.
++   in the role as well.  Without the admin option, ordinary users cannot
++   do that.  A role is not considered to hold <literal>WITH ADMIN
++   OPTION</literal> on itself, but it may grant or revoke membership in
++   itself from a database session where the session user matches the
++   role.  Database superusers can grant or revoke membership in any role
++   to anyone.  Roles having <literal>CREATEROLE</> privilege can grant
++   or revoke membership in any role that is not a superuser.
+   </para>
+ 
+   <para>
+diff --git a/src/backend/commands/user.c b/src/backend/commands/user.c
+index a22092c..39bf172 100644
+--- a/src/backend/commands/user.c
++++ b/src/backend/commands/user.c
+@@ -1334,7 +1334,16 @@ AddRoleMems(const char *rolename, Oid roleid,
+ 							rolename)));
+ 	}
+ 
+-	/* XXX not sure about this check */
++	/*
++	 * The role membership grantor of record has little significance at
++	 * present.  Nonetheless, inasmuch as users might look to it for a crude
++	 * audit trail, let only superusers impute the grant to a third party.
++	 *
++	 * Before lifting this restriction, give the member == role case of
++	 * is_admin_of_role() a fresh look.  Ensure that the current role cannot
++	 * use an explicit grantor specification to take advantage of the session
++	 * user's self-admin right.
++	 */
+ 	if (grantorId != GetUserId() && !superuser())
+ 		ereport(ERROR,
+ 				(errcode(ERRCODE_INSUFFICIENT_PRIVILEGE),
+diff --git a/src/backend/utils/adt/acl.c b/src/backend/utils/adt/acl.c
+index 1d6ae8b..9a52edb 100644
+--- a/src/backend/utils/adt/acl.c
++++ b/src/backend/utils/adt/acl.c
+@@ -4580,6 +4580,11 @@ pg_role_aclcheck(Oid role_oid, Oid roleid, AclMode mode)
+ {
+ 	if (mode & ACL_GRANT_OPTION_FOR(ACL_CREATE))
+ 	{
++		/*
++		 * XXX For roleid == role_oid, is_admin_of_role() also examines the
++		 * session and call stack.  That suits two-argument pg_has_role(), but
++		 * it gives the three-argument version a lamentable whimsy.
++		 */
+ 		if (is_admin_of_role(roleid, role_oid))
+ 			return ACLCHECK_OK;
+ 	}
+@@ -4897,11 +4902,9 @@ is_member_of_role_nosuper(Oid member, Oid role)
+ 
+ 
+ /*
+- * Is member an admin of role (directly or indirectly)?  That is, is it
+- * a member WITH ADMIN OPTION?
+- *
+- * We could cache the result as for is_member_of_role, but currently this
+- * is not used in any performance-critical paths, so we don't.
++ * Is member an admin of role?  That is, is member the role itself (subject to
++ * restrictions below), a member (directly or indirectly) WITH ADMIN OPTION,
++ * or a superuser?
+  */
+ bool
+ is_admin_of_role(Oid member, Oid role)
+@@ -4910,14 +4913,41 @@ is_admin_of_role(Oid member, Oid role)
+ 	List	   *roles_list;
+ 	ListCell   *l;
+ 
+-	/* Fast path for simple case */
+-	if (member == role)
+-		return true;
+-
+-	/* Superusers have every privilege, so are part of every role */
+ 	if (superuser_arg(member))
+ 		return true;
+ 
++	if (member == role)
++		/*
++		 * A role can admin itself when it matches the session user and we're
++		 * outside any security-restricted operation, SECURITY DEFINER or
++		 * similar context.  SQL-standard roles cannot self-admin.  However,
++		 * SQL-standard users are distinct from roles, and they are not
++		 * grantable like roles: PostgreSQL's role-user duality extends the
++		 * standard.  Checking for a session user match has the effect of
++		 * letting a role self-admin only when it's conspicuously behaving
++		 * like a user.  Note that allowing self-admin under a mere SET ROLE
++		 * would make WITH ADMIN OPTION largely irrelevant; any member could
++		 * SET ROLE to issue the otherwise-forbidden command.
++		 *
++		 * Withholding self-admin in a security-restricted operation prevents
++		 * object owners from harnessing the session user identity during
++		 * administrative maintenance.  Suppose Alice owns a database, has
++		 * issued "GRANT alice TO bob", and runs a daily ANALYZE.  Bob creates
++		 * an alice-owned SECURITY DEFINER function that issues "REVOKE alice
++		 * FROM carol".  If he creates an expression index calling that
++		 * function, Alice will attempt the REVOKE during each ANALYZE.
++		 * Checking InSecurityRestrictedOperation() thwarts that attack.
++		 *
++		 * Withholding self-admin in SECURITY DEFINER functions makes their
++		 * behavior independent of the calling user.  There's no security or
++		 * SQL-standard-conformance need for that restriction, though.
++		 *
++		 * A role cannot have actual WITH ADMIN OPTION on itself, because that
++		 * would imply a membership loop.  Therefore, we're done either way.
++		 */
++		return member == GetSessionUserId() &&
++			!InLocalUserIdChange() && !InSecurityRestrictedOperation();
++
+ 	/*
+ 	 * Find all the roles that member is a member of, including multi-level
+ 	 * recursion.  We build a list in the same way that is_member_of_role does
+diff --git a/src/test/regress/expected/privileges.out b/src/test/regress/expected/privileges.out
+index e8930cb..bc6d731 100644
+--- a/src/test/regress/expected/privileges.out
++++ b/src/test/regress/expected/privileges.out
+@@ -32,7 +32,7 @@ ALTER GROUP regressgroup1 ADD USER regressuser4;
+ ALTER GROUP regressgroup2 ADD USER regressuser2;	-- duplicate
+ NOTICE:  role "regressuser2" is already a member of role "regressgroup2"
+ ALTER GROUP regressgroup2 DROP USER regressuser2;
+-ALTER GROUP regressgroup2 ADD USER regressuser4;
++GRANT regressgroup2 TO regressuser4 WITH ADMIN OPTION;
+ -- test owner privileges
+ SET SESSION AUTHORIZATION regressuser1;
+ SELECT session_user, current_user;
+@@ -929,6 +929,40 @@ SELECT has_table_privilege('regressuser1', 'atest4', 'SELECT WITH GRANT OPTION')
+  t
+ (1 row)
+ 
++-- Admin options
++SET SESSION AUTHORIZATION regressuser4;
++CREATE FUNCTION dogrant_ok() RETURNS void LANGUAGE sql SECURITY DEFINER AS
++	'GRANT regressgroup2 TO regressuser5';
++GRANT regressgroup2 TO regressuser5; -- ok: had ADMIN OPTION
++SET ROLE regressgroup2;
++GRANT regressgroup2 TO regressuser5; -- fails: SET ROLE suspended privilege
++ERROR:  must have admin option on role "regressgroup2"
++SET SESSION AUTHORIZATION regressuser1;
++GRANT regressgroup2 TO regressuser5; -- fails: no ADMIN OPTION
++ERROR:  must have admin option on role "regressgroup2"
++SELECT dogrant_ok();			-- ok: SECURITY DEFINER conveys ADMIN
++NOTICE:  role "regressuser5" is already a member of role "regressgroup2"
++CONTEXT:  SQL function "dogrant_ok" statement 1
++ dogrant_ok 
++------------
++ 
++(1 row)
++
++SET ROLE regressgroup2;
++GRANT regressgroup2 TO regressuser5; -- fails: SET ROLE did not help
++ERROR:  must have admin option on role "regressgroup2"
++SET SESSION AUTHORIZATION regressgroup2;
++GRANT regressgroup2 TO regressuser5; -- ok: a role can self-admin
++NOTICE:  role "regressuser5" is already a member of role "regressgroup2"
++CREATE FUNCTION dogrant_fails() RETURNS void LANGUAGE sql SECURITY DEFINER AS
++	'GRANT regressgroup2 TO regressuser5';
++SELECT dogrant_fails();			-- fails: no self-admin in SECURITY DEFINER
++ERROR:  must have admin option on role "regressgroup2"
++CONTEXT:  SQL function "dogrant_fails" statement 1
++DROP FUNCTION dogrant_fails();
++SET SESSION AUTHORIZATION regressuser4;
++DROP FUNCTION dogrant_ok();
++REVOKE regressgroup2 FROM regressuser5;
+ -- has_sequence_privilege tests
+ \c -
+ CREATE SEQUENCE x_seq;
+diff --git a/src/test/regress/sql/privileges.sql b/src/test/regress/sql/privileges.sql
+index d4d328e..5f1018a 100644
+--- a/src/test/regress/sql/privileges.sql
++++ b/src/test/regress/sql/privileges.sql
+@@ -37,7 +37,7 @@ ALTER GROUP regressgroup1 ADD USER regressuser4;
+ 
+ ALTER GROUP regressgroup2 ADD USER regressuser2;	-- duplicate
+ ALTER GROUP regressgroup2 DROP USER regressuser2;
+-ALTER GROUP regressgroup2 ADD USER regressuser4;
++GRANT regressgroup2 TO regressuser4 WITH ADMIN OPTION;
+ 
+ -- test owner privileges
+ 
+@@ -581,6 +581,33 @@ SELECT has_table_privilege('regressuser3', 'atest4', 'SELECT'); -- false
+ SELECT has_table_privilege('regressuser1', 'atest4', 'SELECT WITH GRANT OPTION'); -- true
+ 
+ 
++-- Admin options
++
++SET SESSION AUTHORIZATION regressuser4;
++CREATE FUNCTION dogrant_ok() RETURNS void LANGUAGE sql SECURITY DEFINER AS
++	'GRANT regressgroup2 TO regressuser5';
++GRANT regressgroup2 TO regressuser5; -- ok: had ADMIN OPTION
++SET ROLE regressgroup2;
++GRANT regressgroup2 TO regressuser5; -- fails: SET ROLE suspended privilege
++
++SET SESSION AUTHORIZATION regressuser1;
++GRANT regressgroup2 TO regressuser5; -- fails: no ADMIN OPTION
++SELECT dogrant_ok();			-- ok: SECURITY DEFINER conveys ADMIN
++SET ROLE regressgroup2;
++GRANT regressgroup2 TO regressuser5; -- fails: SET ROLE did not help
++
++SET SESSION AUTHORIZATION regressgroup2;
++GRANT regressgroup2 TO regressuser5; -- ok: a role can self-admin
++CREATE FUNCTION dogrant_fails() RETURNS void LANGUAGE sql SECURITY DEFINER AS
++	'GRANT regressgroup2 TO regressuser5';
++SELECT dogrant_fails();			-- fails: no self-admin in SECURITY DEFINER
++DROP FUNCTION dogrant_fails();
++
++SET SESSION AUTHORIZATION regressuser4;
++DROP FUNCTION dogrant_ok();
++REVOKE regressgroup2 FROM regressuser5;
++
++
+ -- has_sequence_privilege tests
+ \c -
+ 
+-- 
+1.7.5.4
+
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 9b242e0..d6a4cd7 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -32,6 +32,7 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
            file://postgresql.service \
            file://0001-Use-pkg-config-for-libxml2-detection.patch \
            file://0002-Predict-integer-overflow-to-avoid-buffer-overruns.patch \
+           file://0003-Shore-up-ADMIN-OPTION-restrictions.patch \
           "
 
 LEAD_SONAME = "libpq.so"
-- 
1.9.1


