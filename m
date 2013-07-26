Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B11786041D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2013 14:57:26 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2013 07:57:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,752,1367996400"; d="scan'208";a="337368926"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2013 07:57:22 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jul 2013 17:57:26 +0300
Message-Id: <1374850646-17577-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] postgresql: upgrade to 9.2.4
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
X-List-Received-Date: Fri, 26 Jul 2013 14:57:26 -0000

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../remove.autoconf.version.check.patch            |   12 ++++++------
 meta-oe/recipes-support/postgresql/postgresql.inc  |    4 ++--
 .../{postgresql_8.4.7.bb => postgresql_9.2.4.bb}   |    6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/postgresql/{postgresql-8.4.7 => postgresql-9.2.4}/remove.autoconf.version.check.patch (56%)
 rename meta-oe/recipes-support/postgresql/{postgresql_8.4.7.bb => postgresql_9.2.4.bb} (32%)

diff --git a/meta-oe/recipes-support/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch b/meta-oe/recipes-support/postgresql/postgresql-9.2.4/remove.autoconf.version.check.patch
similarity index 56%
rename from meta-oe/recipes-support/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch
rename to meta-oe/recipes-support/postgresql/postgresql-9.2.4/remove.autoconf.version.check.patch
index 514a9aa..022aa3d 100644
--- a/meta-oe/recipes-support/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch
+++ b/meta-oe/recipes-support/postgresql/postgresql-9.2.4/remove.autoconf.version.check.patch
@@ -1,15 +1,15 @@
-Index: postgresql-8.4.7/configure.in
+Index: postgresql-9.2.4/configure.in
 ===================================================================
---- postgresql-8.4.7.orig/configure.in
-+++ postgresql-8.4.7/configure.in
+--- postgresql-9.2.4.orig/configure.in
++++ postgresql-9.2.4/configure.in
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
  
- AC_INIT([PostgreSQL], [8.4.7], [pgsql-bugs@postgresql.org])
+ AC_INIT([PostgreSQL], [9.2.4], [pgsql-bugs@postgresql.org])
  
--m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.61], [], [m4_fatal([Autoconf version 2.61 is required.
+-m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.63], [], [m4_fatal([Autoconf version 2.63 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
 -recommended.  You can remove the check from 'configure.in' but it is then
 -your responsibility whether the result works or not.])])
- AC_COPYRIGHT([Copyright (c) 1996-2009, PostgreSQL Global Development Group])
+ AC_COPYRIGHT([Copyright (c) 1996-2012, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 4fda67b..5f2088e 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -2,13 +2,13 @@ DESCRIPTION = "PostgreSQL is a powerful, open source relational database system.
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
 DEPENDS = "zlib readline tzcode-native"
-INC_PR = "r8"
+INC_PR = "r0"
 
 ARM_INSTRUCTION_SET = "arm"
 
 #WARNING: this recipe assumes you have the timezone compiler present in /usr/sbin/zic
 
-SRC_URI = "ftp://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
+SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
 
 LEAD_SONAME = "libpq.so"
 
diff --git a/meta-oe/recipes-support/postgresql/postgresql_8.4.7.bb b/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
similarity index 32%
rename from meta-oe/recipes-support/postgresql/postgresql_8.4.7.bb
rename to meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
index 63f324c..59665da 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_8.4.7.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.2.4.bb
@@ -1,10 +1,10 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=29b81b066680be9ffd98cb9d2afb9de6"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=ab55a5887d3f8ba77d0fd7db787e4bab"
 
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://remove.autoconf.version.check.patch"
 
-SRC_URI[md5sum] = "689397187bb1dfe9b5cbde99538311c3"
-SRC_URI[sha256sum] = "08032849da121e67e318f7ff4e68d3ac88f29050e242641f717c4270839b597b"
+SRC_URI[md5sum] = "6ee5bb53b97da7c6ad9cb0825d3300dd"
+SRC_URI[sha256sum] = "d97dd918a88a4449225998f46aafa85216a3f89163a3411830d6890507ffae93"
-- 
1.7.9.5


