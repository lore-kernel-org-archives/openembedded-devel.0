Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E091A750A0
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 08:26:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w388QJG7000496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Apr 2018 01:26:19 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 8 Apr 2018 01:26:06 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 8 Apr 2018 16:22:53 +0800
Message-ID: <20180408082253.12826-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] postgresql: update to 9.4.17
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Apr 2018 08:26:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Release notes:
  https://www.postgresql.org/docs/9.4/static/release-9-4-17.html

* Drop the patch emove.autoconf.version.check.patch since the
  required autoconf version is used in oe-core.

* LICENSE checksum updated since the copyright year is changed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../postgresql/files/remove.autoconf.version.check.patch | 16 ----------------
 .../{postgresql_9.4.15.bb => postgresql_9.4.17.bb}       |  7 +++----
 2 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_9.4.15.bb => postgresql_9.4.17.bb} (38%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch b/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
deleted file mode 100644
index be23fd419..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/remove.autoconf.version.check.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Index: postgresql-9.2.4/configure.in
-===================================================================
---- postgresql-9.2.4.orig/configure.in
-+++ postgresql-9.2.4/configure.in
-@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
- 
- AC_INIT([PostgreSQL], [9.4.2], [pgsql-bugs@postgresql.org])
- 
--m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
--Untested combinations of 'autoconf' and PostgreSQL versions are not
--recommended.  You can remove the check from 'configure.in' but it is then
--your responsibility whether the result works or not.])])
- AC_COPYRIGHT([Copyright (c) 1996-2014, PostgreSQL Global Development Group])
- AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
- AC_CONFIG_AUX_DIR(config)
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.15.bb b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
similarity index 38%
rename from meta-oe/recipes-dbs/postgresql/postgresql_9.4.15.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
index eec099a12..061184a6f 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.15.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
@@ -1,9 +1,8 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=81b69ddb31a8be66baafd14a90146ee2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=6dc95e63aa4d72502ff8193dfe2ddd38"
 
 SRC_URI += "\
-    file://remove.autoconf.version.check.patch \
     file://not-check-libperl.patch \
 "
 
@@ -11,5 +10,5 @@ do_compile_prepend_libc-musl() {
     sed -i -e 's/\-lnsl//g' ${B}/src/Makefile.global
 }
 
-SRC_URI[md5sum] = "0aada0833a9208ae5fab966c73c39379"
-SRC_URI[sha256sum] = "12bfb3c7e8e45515ef921ad365e122682a5c4935dcc0032644433af2de31acc4"
+SRC_URI[md5sum] = "0a08f4078f5e4a54e764f63ad38a6de3"
+SRC_URI[sha256sum] = "7a320cd335052b840d209dc9688f09965763351c590e3cc7bf577591179fd7c6"
-- 
2.11.0


