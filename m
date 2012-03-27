Received: from pd95cb174.dip0.t-ipconnect.de ([217.92.177.116] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1SCVJq-0004qo-Te
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 14:16:11 +0200
Received: by localhost (Postfix, from userid 1000)
	id 52117443AF7; Tue, 27 Mar 2012 14:07:10 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 27 Mar 2012 14:07:04 +0200
Message-Id: <9af6c62ba6943c6381838fb144a159a515e18714.1332849864.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8c581985c4eb9edd0843595fb0b735f70a899c48.1332849864.git.sledz@dresearch-fe.de>
References: <8c581985c4eb9edd0843595fb0b735f70a899c48.1332849864.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1332849864.git.sledz@dresearch-fe.de>
References: <cover.1332849864.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 2/3] python-2.6.6: backport pkgconfig support from version 2.7.1 and bump PR
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
X-List-Received-Date: Tue, 27 Mar 2012 12:16:11 -0000

From: Simon Busch <morphis@gravedo.de>

Version 2.6.6 of python does not have support for pkgconfig and 2.7.1 is not yet ready in
OE so I back-ported the new pkgconfig feature to 2.6.6.

Signed-off-by: Simon Busch <morphis@gravedo.de>
Acked-by: Michael 'Mickey' Lauer <mlauer@vanille-media.de>
---
 .../python/python-2.6.6/pkgconfig-support.patch    |   94 ++++++++++++++++++++
 recipes/python/python_2.6.6.bb                     |    3 +-
 2 files changed, 96 insertions(+), 1 deletions(-)
 create mode 100644 recipes/python/python-2.6.6/pkgconfig-support.patch

diff --git a/recipes/python/python-2.6.6/pkgconfig-support.patch b/recipes/python/python-2.6.6/pkgconfig-support.patch
new file mode 100644
index 0000000..d970b00
--- /dev/null
+++ b/recipes/python/python-2.6.6/pkgconfig-support.patch
@@ -0,0 +1,94 @@
+diff -Naur Python-2.6.6-orig/Makefile.pre.in Python-2.6.6/Makefile.pre.in
+--- Python-2.6.6-orig/Makefile.pre.in	2010-08-02 00:05:31.000000000 +0200
++++ Python-2.6.6/Makefile.pre.in	2011-05-24 21:16:19.943550002 +0200
+@@ -763,6 +763,9 @@
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) python$(VERSION)$(EXE) $(PYTHON))
+ 	-rm -f $(DESTDIR)$(BINDIR)/python-config
+ 	(cd $(DESTDIR)$(BINDIR); $(LN) -s python$(VERSION)-config python-config)
++	-test -d $(DESTDIR)$(LIBPC) || $(INSTALL) -d -m $(DIRMODE) $(DESTDIR)$(LIBPC)
++	-rm -f $(DESTDIR)$(LIBPC)/python.pc
++	(cd $(DESTDIR)$(LIBPC); $(LN) -s python-$(VERSION).pc python.pc)
+ 
+ # Install the interpreter with $(VERSION) affixed
+ # This goes into $(exec_prefix)
+@@ -936,8 +939,12 @@
+ # Install the library and miscellaneous stuff needed for extending/embedding
+ # This goes into $(exec_prefix)
+ LIBPL=		$(LIBP)/config
++
++# pkgconfig directory
++LIBPC=		$(LIBDIR)/pkgconfig
++
+ libainstall:	all
+-	@for i in $(LIBDIR) $(LIBP) $(LIBPL); \
++	@for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC); \
+ 	do \
+ 		if test ! -d $(DESTDIR)$$i; then \
+ 			echo "Creating directory $$i"; \
+@@ -964,6 +971,7 @@
+ 	$(INSTALL_DATA) Modules/Setup $(DESTDIR)$(LIBPL)/Setup
+ 	$(INSTALL_DATA) Modules/Setup.local $(DESTDIR)$(LIBPL)/Setup.local
+ 	$(INSTALL_DATA) Modules/Setup.config $(DESTDIR)$(LIBPL)/Setup.config
++	$(INSTALL_DATA) Misc/python.pc $(DESTDIR)$(LIBPC)/python-$(VERSION).pc
+ 	$(INSTALL_SCRIPT) $(srcdir)/Modules/makesetup $(DESTDIR)$(LIBPL)/makesetup
+ 	$(INSTALL_SCRIPT) $(srcdir)/install-sh $(DESTDIR)$(LIBPL)/install-sh
+ 	# Substitution happens here, as the completely-expanded BINDIR
+@@ -1159,7 +1167,8 @@
+ # Keep configure and Python-ast.[ch], it's possible they can't be generated
+ distclean: clobber
+ 	-rm -f core Makefile Makefile.pre config.status \
+-		Modules/Setup Modules/Setup.local Modules/Setup.config
++		Modules/Setup Modules/Setup.local Modules/Setup.config \
++		Misc/python.pc
+ 	find $(srcdir) '(' -name '*.fdc' -o -name '*~' \
+ 			   -o -name '[@,#]*' -o -name '*.old' \
+ 			   -o -name '*.orig' -o -name '*.rej' \
+diff -Naur Python-2.6.6-orig/Misc/python.pc.in Python-2.6.6/Misc/python.pc.in
+--- Python-2.6.6-orig/Misc/python.pc.in	1970-01-01 01:00:00.000000000 +0100
++++ Python-2.6.6/Misc/python.pc.in	2011-05-24 21:09:22.733550002 +0200
+@@ -0,0 +1,13 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: Python
++Description: Python library
++Requires: 
++Version: @VERSION@
++Libs.private: @LIBS@
++Libs: -L${libdir} -lpython@VERSION@
++Cflags: -I${includedir}/python@VERSION@ 
++
+diff -Naur Python-2.6.6-orig/configure Python-2.6.6/configure
+--- Python-2.6.6-orig/configure	2010-05-25 04:27:03.000000000 +0200
++++ Python-2.6.6/configure	2011-05-24 21:14:55.553550001 +0200
+@@ -12863,7 +12863,7 @@
+ $as_echo "done" >&6; }
+ 
+ # generate output files
+-ac_config_files="$ac_config_files Makefile.pre Modules/Setup.config"
++ac_config_files="$ac_config_files Makefile.pre Modules/Setup.config Misc/python.pc"
+ 
+ cat >confcache <<\_ACEOF
+ # This file is a shell script that caches the results of configure
+@@ -13557,6 +13557,7 @@
+     "Mac/Resources/app/Info.plist") CONFIG_FILES="$CONFIG_FILES Mac/Resources/app/Info.plist" ;;
+     "Makefile.pre") CONFIG_FILES="$CONFIG_FILES Makefile.pre" ;;
+     "Modules/Setup.config") CONFIG_FILES="$CONFIG_FILES Modules/Setup.config" ;;
++    "Misc/python.pc") CONFIG_FILES="$CONFIG_FILES Misc/python.pc" ;;
+ 
+   *) as_fn_error "invalid argument: \`$ac_config_target'" "$LINENO" 5;;
+   esac
+diff -Naur Python-2.6.6-orig/configure.in Python-2.6.6/configure.in
+--- Python-2.6.6-orig/configure.in	2010-05-25 04:27:03.000000000 +0200
++++ Python-2.6.6/configure.in	2011-05-24 21:09:53.733550001 +0200
+@@ -3935,7 +3935,7 @@
+ AC_MSG_RESULT(done)
+ 
+ # generate output files
+-AC_CONFIG_FILES(Makefile.pre Modules/Setup.config)
++AC_CONFIG_FILES(Makefile.pre Modules/Setup.config Misc/python.pc)
+ AC_OUTPUT
+ 
+ echo "creating Modules/Setup"
diff --git a/recipes/python/python_2.6.6.bb b/recipes/python/python_2.6.6.bb
index 3c054bb..eacc5c2 100644
--- a/recipes/python/python_2.6.6.bb
+++ b/recipes/python/python_2.6.6.bb
@@ -3,7 +3,7 @@ DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
            ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
 # set to .0 on every increase of INC_PR
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 SRC_URI = "\
   http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
@@ -17,6 +17,7 @@ SRC_URI = "\
   file://ipv6-cross.patch \
   file://python-module-rpath-fix.patch \
   file://sitecustomize.py \
+  file://pkgconfig-support.patch \
 "
 SRC_URI[md5sum] = "cf4e6881bb84a7ce6089e4a307f71f14"
 SRC_URI[sha256sum] = "134c5e0736bae2e5570d0b915693374f11108ded63c35a23a35d282737d2ce83"
-- 
1.7.7



