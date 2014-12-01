Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id AA3B172274
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:29 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id y10so9803646pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=k2pY8VE05jx4HOvdPgWd8iiSEpRKtBeKgeijkme9JHI=;
	b=hOVWUfYdoIpA7vcP753O/PUNKhtk+9TjA0JkJO5mdXRfLs/FOtByCV00hMFamnmvGX
	Ts7a56ZrDaYKYanTbkivGxT28SK5V1ttcrNkRi+eZalglEwx2EBxLu9/zruVSec/J9TM
	gl2nZxCkEqL8yRjMNFM61ecgi37PP5RyMVc/qfCm7hVxnr+xd8wN5E8xEtWk3EO+d1dX
	aXQMieaRZSBFV+05sihpKMQnfQ/s7Akq6ell15ugxQ+mvDLBMJisUWm4Kqf8AXWgHegg
	HgxI/xFqrQz9uCpMHuz1IxkZCShQifa8gdlvyD8oP/zsOZZV3NTKdzezAD0F9lvGp+cK
	hvEw==
X-Received: by 10.68.57.199 with SMTP id k7mr94322815pbq.25.1417395869966;
	Sun, 30 Nov 2014 17:04:29 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:28 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:06 -0800
Message-Id: <28abb5e3620c719f4befc445487920d1a5e98ad2.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
Cc: otavio@ossystems.com.br
Subject: [PATCH 04/15] postgresql: add fix for CVE-2014-0060 Security Advisory
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
X-List-Received-Date: Mon, 01 Dec 2014 01:04:30 -0000

From: Kang Kai <kai.kang@windriver.com>

PostgreSQL before 8.4.20, 9.0.x before 9.0.16, 9.1.x before 9.1.12,
9.2.x before 9.2.7, and 9.3.x before 9.3.3 does not properly enforce the
ADMIN OPTION restriction, which allows remote authenticated members of a
role to add or remove arbitrary users to that role by calling the SET
ROLE command before the associated GRANT command.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-0060

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


