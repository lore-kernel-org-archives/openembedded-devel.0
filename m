Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6CA75F18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2015 17:45:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6EHjArl016757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jul 2015 10:45:10 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Tue, 14 Jul 2015 10:45:09 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Jul 2015 10:45:09 -0700
Message-ID: <1436895909-6182-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/1] postgresql: advance from 9.4.2 to 9.4.4
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
X-List-Received-Date: Tue, 14 Jul 2015 17:45:12 -0000
Content-Type: text/plain

Consolidate patches in one directory and remove two unused
patches.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../postgresql/files/no-ecpg-test.patch            |   12 --------
 .../not-check-libperl.patch                        |    0
 .../remove.autoconf.version.check.patch            |    0
 .../postgresql-9.4.2/ecpg-parallel-make-fix.patch  |   31 --------------------
 .../{postgresql_9.4.2.bb => postgresql_9.4.4.bb}   |    5 ++--
 5 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/recipes-support/postgresql/files/no-ecpg-test.patch
 rename meta-oe/recipes-support/postgresql/{postgresql-9.4.2 => files}/not-check-libperl.patch (100%)
 rename meta-oe/recipes-support/postgresql/{postgresql-9.4.2 => files}/remove.autoconf.version.check.patch (100%)
 delete mode 100644 meta-oe/recipes-support/postgresql/postgresql-9.4.2/ecpg-parallel-make-fix.patch
 rename meta-oe/recipes-support/postgresql/{postgresql_9.4.2.bb => postgresql_9.4.4.bb} (61%)

diff --git a/meta-oe/recipes-support/postgresql/files/no-ecpg-test.patch b/meta-oe/recipes-support/postgresql/files/no-ecpg-test.patch
deleted file mode 100644
index c0f28f4..0000000
--- a/meta-oe/recipes-support/postgresql/files/no-ecpg-test.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff --git a/src/interfaces/ecpg/Makefile b/src/interfaces/ecpg/Makefile
-index dcd578f..1428423 100644
---- a/src/interfaces/ecpg/Makefile
-+++ b/src/interfaces/ecpg/Makefile
-@@ -8,7 +8,6 @@ all install installdirs uninstall dep depend distprep:
- 	$(MAKE) -C ecpglib $@
- 	$(MAKE) -C compatlib $@
- 	$(MAKE) -C preproc $@
--	$(MAKE) -C test $@
- 
- clean distclean maintainer-clean:
- 	-$(MAKE) -C include $@
diff --git a/meta-oe/recipes-support/postgresql/postgresql-9.4.2/not-check-libperl.patch b/meta-oe/recipes-support/postgresql/files/not-check-libperl.patch
similarity index 100%
rename from meta-oe/recipes-support/postgresql/postgresql-9.4.2/not-check-libperl.patch
rename to meta-oe/recipes-support/postgresql/files/not-check-libperl.patch
diff --git a/meta-oe/recipes-support/postgresql/postgresql-9.4.2/remove.autoconf.version.check.patch b/meta-oe/recipes-support/postgresql/files/remove.autoconf.version.check.patch
similarity index 100%
rename from meta-oe/recipes-support/postgresql/postgresql-9.4.2/remove.autoconf.version.check.patch
rename to meta-oe/recipes-support/postgresql/files/remove.autoconf.version.check.patch
diff --git a/meta-oe/recipes-support/postgresql/postgresql-9.4.2/ecpg-parallel-make-fix.patch b/meta-oe/recipes-support/postgresql/postgresql-9.4.2/ecpg-parallel-make-fix.patch
deleted file mode 100644
index 63615cd..0000000
--- a/meta-oe/recipes-support/postgresql/postgresql-9.4.2/ecpg-parallel-make-fix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-status: backport
-
-From 602070f9cce790debd8d1469254e7726ab499ae7 Mon Sep 17 00:00:00 2001
-From: Peter Eisentraut <peter_e@gmx.net>
-Date: Fri, 29 Mar 2013 21:39:55 -0400
-Subject: [PATCH] ecpg: Parallel make fix
-
-In some parallel make situations, the install-headers target could be
-called before the installation directories are created by installdirs,
-causing the installation to fail.  Fix that by making install-headers
-depend on installdirs.
----
- src/interfaces/ecpg/include/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/interfaces/ecpg/include/Makefile b/src/interfaces/ecpg/include/Makefile
-index eab833b..e92e56f 100644
---- a/src/interfaces/ecpg/include/Makefile
-+++ b/src/interfaces/ecpg/include/Makefile
-@@ -18,7 +18,7 @@ ecpg_headers = ecpgerrno.h ecpglib.h ecpgtype.h sqlca.h sql3types.h ecpg_informi
- 	sqlda.h sqlda-compat.h sqlda-native.h
- informix_headers = datetime.h decimal.h sqltypes.h
- 
--install-headers: $(ecpg_headers) $(informix_headers)
-+install-headers: $(ecpg_headers) $(informix_headers) installdirs
- 	$(INSTALL_DATA) $(addprefix $(srcdir)/,$(ecpg_headers)) '$(DESTDIR)$(includedir)/'
- 	$(INSTALL_DATA) $(addprefix $(srcdir)/,$(informix_headers)) '$(DESTDIR)$(informix_esql_dir)/'
- 	$(INSTALL_DATA) $(ecpg_config_h) '$(DESTDIR)$(includedir)'
--- 
-1.8.3.4
-
diff --git a/meta-oe/recipes-support/postgresql/postgresql_9.4.2.bb b/meta-oe/recipes-support/postgresql/postgresql_9.4.4.bb
similarity index 61%
rename from meta-oe/recipes-support/postgresql/postgresql_9.4.2.bb
rename to meta-oe/recipes-support/postgresql/postgresql_9.4.4.bb
index 1dee162..266206b 100644
--- a/meta-oe/recipes-support/postgresql/postgresql_9.4.2.bb
+++ b/meta-oe/recipes-support/postgresql/postgresql_9.4.4.bb
@@ -9,5 +9,6 @@ SRC_URI += "\
     file://not-check-libperl.patch \
 "
 
-SRC_URI[md5sum] = "b6369156607a4fd88f21af6fec0f30b9"
-SRC_URI[sha256sum] = "81fda191c165ba1d25d75cd0166ece5abdcb4a7f5eca01b349371e279ebb4d11"
+SRC_URI[md5sum] = "1fe952c44ed26d7e6a335cf991a9c1c6"
+SRC_URI[sha256sum] = "538ed99688d6fdbec6fd166d1779cf4588bf2f16c52304e5ef29f904c43b0013"
+
-- 
1.7.9.5


