Received: from zk223.dresearch-fe.de ([217.92.177.116])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1TJOAt-00087h-BX
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 14:35:39 +0200
Received: from fsc-480-012-88.intern.dresearch.de
	(fsc-480-012-88.internal.dresearch-fe.de [172.29.23.5])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 0AA24E027E;
	Wed,  3 Oct 2012 12:22:40 +0000 (UTC)
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 1002)
	id EA2C072031; Wed,  3 Oct 2012 14:22:39 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Wed,  3 Oct 2012 14:22:38 +0200
Message-Id: <b2fa6d8d2452a312c3a9cec3ad122d1e3195e8bd.1349266768.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1349266768.git.sledz@dresearch-fe.de>
References: <cover.1349266768.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 1/1] subversion-1.6.5: fix QA issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 12:35:39 -0000

This patch fixes the QA issue

 ERROR: This autoconf log indicates errors, it looked at host includes.

by backporting some build related patches and recipe modifications
from oe-core.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/subversion/files/fix-install-depends.patch |   45 ++++++++++++++++++++
 recipes/subversion/files/libtool2.patch            |   17 ++++++++
 recipes/subversion/subversion_1.6.5.bb             |   21 ++++++---
 3 files changed, 76 insertions(+), 7 deletions(-)
 create mode 100644 recipes/subversion/files/fix-install-depends.patch
 create mode 100644 recipes/subversion/files/libtool2.patch

diff --git a/recipes/subversion/files/fix-install-depends.patch b/recipes/subversion/files/fix-install-depends.patch
new file mode 100644
index 0000000..6f49ed4
--- /dev/null
+++ b/recipes/subversion/files/fix-install-depends.patch
@@ -0,0 +1,45 @@
+install-neon-lib should depend on libsvn_delta's installation
+
+install-neon-lib needs libsvn_delta-1.la which will be regenerated
+during libsvn_delta-1.la's installation, if libsvn_delta-1.la is
+in regenerating and at the same time install-neon-lib links it, the
+error willl happen.
+
+Let install-neon-lib run after libsvn_delta-1.la is installed will fix
+the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ build-outputs.mk |    2 +-
+ build.conf       |    2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/build-outputs.mk b/build-outputs.mk
+--- a/build-outputs.mk
++++ b/build-outputs.mk
+@@ -979,7 +979,7 @@ install-locale: subversion/po/de.mo subversion/po/es.mo subversion/po/fr.mo subv
+ 	$(MKDIR) $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES
+ 	cd subversion/po ; $(INSTALL_LOCALE) zh_TW.mo $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES/$(PACKAGE_NAME).mo
+ 
+-install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la
++install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la $(SVN_FS_LIB_INSTALL_DEPS)
+ 	$(MKDIR) $(DESTDIR)$(neon_libdir)
+ 	cd subversion/libsvn_ra_neon ; $(INSTALL_NEON_LIB) libsvn_ra_neon-1.la $(DESTDIR)$(neon_libdir)/libsvn_ra_neon-1.la
+ 
+diff --git a/build.conf b/build.conf
+--- a/build.conf
++++ b/build.conf
+@@ -272,6 +272,8 @@ type = ra-module
+ path = subversion/libsvn_ra_neon
+ install = neon-lib
+ libs = libsvn_delta libsvn_subr aprutil apriconv apr neon
++# conditionally add more dependencies
++add-install-deps = $(SVN_FS_LIB_INSTALL_DEPS)
+ msvc-static = yes
+ 
+ # Accessing repositories via DAV through serf
+-- 
+1.7.10.4
+
diff --git a/recipes/subversion/files/libtool2.patch b/recipes/subversion/files/libtool2.patch
new file mode 100644
index 0000000..32f88b7
--- /dev/null
+++ b/recipes/subversion/files/libtool2.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Index: subversion-1.5.5/configure.ac
+===================================================================
+--- subversion-1.5.5.orig/configure.ac	2008-08-26 18:27:56.000000000 +0100
++++ subversion-1.5.5/configure.ac	2009-01-07 18:00:47.000000000 +0000
+@@ -153,8 +153,8 @@
+   LIBTOOL="$sh_libtool"
+   SVN_LIBTOOL="$sh_libtool"
+ else
+-  sh_libtool="$abs_builddir/libtool"
+-  SVN_LIBTOOL="\$(SHELL) $sh_libtool"
++  sh_libtool="$abs_builddir/$host_alias-libtool"
++  SVN_LIBTOOL="\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
+   dnl libtoolize requires that the following line not be indented
+ ifdef([LT_INIT], [LT_INIT], [AC_PROG_LIBTOOL])
+ fi
diff --git a/recipes/subversion/subversion_1.6.5.bb b/recipes/subversion/subversion_1.6.5.bb
index 51ec724..2a563ca 100644
--- a/recipes/subversion/subversion_1.6.5.bb
+++ b/recipes/subversion/subversion_1.6.5.bb
@@ -5,23 +5,30 @@ RDEPENDS_${PN} = "neon"
 LICENSE = "Apache BSD"
 HOMEPAGE = "http://subversion.tigris.org/"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://subversion.tigris.org/downloads/${P}.tar.bz2 \
-	   file://disable-revision-install.patch"
+	   file://disable-revision-install.patch \
+	   file://libtool2.patch \
+	   file://fix-install-depends.patch \
+	   "
 
 EXTRA_OECONF = "--without-berkeley-db --without-apxs --without-apache \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
-                --with-apr-util=${STAGING_BINDIR_CROSS}"
+                --with-apr-util=${STAGING_BINDIR_CROSS} \
+		ac_cv_path_RUBY=none"
 
 
 inherit autotools
 
-acpaths = "-I build/ac-macros"
+export LDFLAGS += " -L${STAGING_LIBDIR} "
 
-# FIXME: Ugly hack!
-do_configure_append() {
-	if ! test -f libtool ; then cp -a *-libtool libtool ; fi
+acpaths = "-I build/ -I build/ac-macros/"
+
+do_configure_prepend () {
+	rm -f ${S}/libtool
+	rm -f ${S}/build/libtool.m4
+	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
 }
 
 SRC_URI[md5sum] = "1a53a0e72bee0bf814f4da83a9b6a636"
-- 
1.7.10.4



