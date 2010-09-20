Received: from [93.100.16.104] (helo=mate.hex)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rik@mate.hex>) id 1OxlYy-000263-87
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Sep 2010 20:58:06 +0200
Received: by mate.hex (Postfix, from userid 1000)
	id 92FF72439D; Mon, 20 Sep 2010 22:58:00 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Sep 2010 22:57:54 +0400
Message-Id: <1285009075-19687-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 93.100.16.104
X-SA-Exim-Mail-From: rik@mate.hex
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	RCVD_IN_PBL,RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] bzip2: update 1.0.5 to 1.0.6
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
X-List-Received-Date: Mon, 20 Sep 2010 18:58:06 -0000

 * fixes CVE-2010-0405

Signed-off-by: Roman I Khimov <khimov@altell.ru>
---
 .../bzip2-1.0.5/bzip2-1.0.5-autoconfiscated.patch  |  286 --------------------
 .../bzip2-1.0.6/bzip2-1.0.5-autoconfiscated.patch  |  286 ++++++++++++++++++++
 recipes/bzip2/bzip2-full-native_1.0.5.bb           |   19 --
 recipes/bzip2/bzip2-full-native_1.0.6.bb           |   18 ++
 recipes/bzip2/bzip2_1.0.5.bb                       |   35 ---
 recipes/bzip2/bzip2_1.0.6.bb                       |   34 +++
 6 files changed, 338 insertions(+), 340 deletions(-)
 delete mode 100644 recipes/bzip2/bzip2-1.0.5/bzip2-1.0.5-autoconfiscated.patch
 create mode 100644 recipes/bzip2/bzip2-1.0.6/bzip2-1.0.5-autoconfiscated.patch
 delete mode 100644 recipes/bzip2/bzip2-full-native_1.0.5.bb
 create mode 100644 recipes/bzip2/bzip2-full-native_1.0.6.bb
 delete mode 100644 recipes/bzip2/bzip2_1.0.5.bb
 create mode 100644 recipes/bzip2/bzip2_1.0.6.bb

diff --git a/recipes/bzip2/bzip2-1.0.5/bzip2-1.0.5-autoconfiscated.patch b/recipes/bzip2/bzip2-1.0.5/bzip2-1.0.5-autoconfiscated.patch
deleted file mode 100644
index ad720b8..0000000
--- a/recipes/bzip2/bzip2-1.0.5/bzip2-1.0.5-autoconfiscated.patch
+++ /dev/null
@@ -1,286 +0,0 @@
-diff -urN files/autogen.sh ./autogen.sh
---- bzip2-1.0.5.orig/autogen.sh	1970-01-01 01:00:00.000000000 +0100
-+++ bzip2-1.0.5.autoconfiscated/autogen.sh	2009-11-06 12:10:43.574602171 +0100
-@@ -0,0 +1,8 @@
-+mv LICENSE COPYING
-+mv CHANGES NEWS
-+touch AUTHORS
-+touch ChangeLog
-+libtoolize --force
-+aclocal
-+automake --add-missing --gnu
-+autoconf
-diff -urN bzip2-1.0.5.orig/README.autotools bzip2-1.0.5.autoconfiscated/README.autotools
---- bzip2-1.0.5.orig/README.autotools	1970-01-01 01:00:00.000000000 +0100
-+++ bzip2-1.0.5.autoconfiscated/README.autotools	2009-11-05 23:06:27.000000000 +0100
-@@ -0,0 +1,39 @@
-+bzip2 autoconfiscated
-+=====================
-+
-+Temporarily at http://pack.suse.cz/sbrabec/bzip2/ expecting that it will
-+become a new upstream version to prevent per-distribution shared library
-+patching done by nearly each Linux vendor separately.
-+
-+Autoconfiscation brings standard ./configure ; make ; make install
-+installation, seamless support of DESTDIR, automatic check for supported
-+CFLAGS, standard shared library support, automatic large files CFLAGS
-+check and all things that are supported by automake.
-+
-+It makes obsolete Makefile-libbz2_so and README.COMPILATION.PROBLEMS.
-+Now configure should automatically detect correct build flags.
-+
-+In case of any problem or question with autotools support feel free to
-+contact me: Stanislav Brabec <sbrabec@suse.cz>
-+
-+Autoconfiscated version binaries are exactly equal to
-+bzip2-1.0.5.tar.gz. There are only few changes. See below.
-+
-+
-+New features:
-+
-+Trivial link man pages for bzcat and bunzip2 added.
-+
-+bzip2.pc file for pkg-config. Packages can use it for checks.
-+
-+
-+Incompatible changes:
-+
-+soname change. Libtool has no support for two parts name suffix (e. g.
-+libbz2.so.1.0). It must be a single number (e. g. libbz2.so.1). That is
-+why soname must change. But I see not a big problem with it. Several
-+distributions already use the new number instead of the non-standard
-+number from Makefile-libbz2_so.
-+
-+To be super-safe, I incremented minor number of the library file, so
-+both instances of the shared library can live together.
-diff -urN bzip2-1.0.5.orig/configure.ac bzip2-1.0.5.autoconfiscated/configure.ac
---- bzip2-1.0.5.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
-+++ bzip2-1.0.5.autoconfiscated/configure.ac	2009-11-06 17:04:04.000000000 +0100
-@@ -0,0 +1,70 @@
-+#                                               -*- Autoconf -*-
-+# Process this file with autoconf to produce a configure script.
-+
-+AC_PREREQ([2.57])
-+AC_INIT([bzip2], [1.0.5], [Julian Seward <jseward@bzip.org>])
-+BZIP2_LT_CURRENT=1
-+BZIP2_LT_REVISION=5
-+BZIP2_LT_AGE=0
-+AC_CONFIG_SRCDIR([bzlib.h])
-+AC_CONFIG_MACRO_DIR([m4])
-+
-+AM_INIT_AUTOMAKE
-+AM_MAINTAINER_MODE
-+
-+# Checks for programs.
-+AC_PROG_AWK
-+AC_PROG_CC
-+AC_PROG_INSTALL
-+AC_PROG_LN_S
-+AC_PROG_MAKE_SET
-+AC_PROG_LIBTOOL
-+PKG_PROG_PKG_CONFIG
-+
-+# Checks for libraries.
-+
-+# Checks for header files.
-+
-+# Checks for typedefs, structures, and compiler characteristics.
-+
-+# Check for system features.
-+AC_SYS_LARGEFILE
-+
-+AC_MSG_CHECKING([whether compiler understands -Wall])
-+save_CFLAGS="$CFLAGS"
-+CFLAGS="$CFLAGS -Wall"
-+AC_TRY_COMPILE([], [], [
-+	AC_MSG_RESULT([yes])
-+], [
-+	AC_MSG_RESULT([no])
-+	CFLAGS="$save_CFLAGS"
-+])
-+
-+AC_MSG_CHECKING([whether compiler understands -Winline])
-+save_CFLAGS="$CFLAGS"
-+CFLAGS="$CFLAGS -Winline"
-+AC_TRY_COMPILE([], [], [
-+	AC_MSG_RESULT([yes])
-+], [
-+	AC_MSG_RESULT([no])
-+	CFLAGS="$save_CFLAGS"
-+])
-+
-+AC_MSG_CHECKING([whether compiler understands -fno-strength-reduce])
-+save_CFLAGS="$CFLAGS"
-+CFLAGS="$CFLAGS -fno-strength-reduce"
-+AC_TRY_COMPILE([], [], [
-+	AC_MSG_RESULT([yes])
-+], [
-+	AC_MSG_RESULT([no])
-+	CFLAGS="$save_CFLAGS"
-+])
-+
-+# Checks for library functions.
-+
-+# Write the output.
-+AC_SUBST([BZIP2_LT_CURRENT])
-+AC_SUBST([BZIP2_LT_REVISION])
-+AC_SUBST([BZIP2_LT_AGE])
-+AC_CONFIG_FILES([Makefile bzip2.pc])
-+AC_OUTPUT
-diff -urN bzip2-1.0.5.orig/Makefile.am bzip2-1.0.5.autoconfiscated/Makefile.am
---- bzip2-1.0.5.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
-+++ bzip2-1.0.5.autoconfiscated/Makefile.am	2009-11-05 16:45:11.000000000 +0100
-@@ -0,0 +1,138 @@
-+lib_LTLIBRARIES = libbz2.la
-+
-+libbz2_la_SOURCES = \
-+	blocksort.c \
-+	huffman.c \
-+	crctable.c \
-+	randtable.c \
-+	compress.c \
-+	decompress.c \
-+	bzlib.c
-+
-+libbz2_la_LDFLAGS = \
-+	-version-info $(BZIP2_LT_CURRENT):$(BZIP2_LT_REVISION):$(BZIP2_LT_AGE) \
-+	-no-undefined
-+
-+include_HEADERS = bzlib.h
-+
-+noinst_HEADERS = bzlib_private.h
-+
-+bin_PROGRAMS = bzip2 bzip2recover
-+
-+bzip2_SOURCES = bzip2.c
-+bzip2_LDADD = libbz2.la
-+
-+bzip2recover_SOURCES = bzip2recover.c
-+bzip2recover_LDADD = libbz2.la
-+
-+bin_SCRIPTS = bzgrep bzmore bzdiff
-+
-+man_MANS = bzip2.1 bzgrep.1 bzmore.1 bzdiff.1
-+
-+pkgconfigdir = $(libdir)/pkgconfig
-+pkgconfig_DATA = bzip2.pc
-+
-+$(pkgconfig_DATA): $(srcdir)/bzip2.pc.in config.status
-+
-+install-exec-hook:
-+	rm -f $(DESTDIR)$(bindir)/`echo "bunzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzcat" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzegrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzfgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzless" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzcmp" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	$(LN_S) `echo "bzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bunzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	$(LN_S) `echo "bzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzcat" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	$(LN_S) `echo "bzgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzegrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	$(LN_S) `echo "bzgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzfgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	$(LN_S) `echo "bzmore" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzless" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	$(LN_S) `echo "bzdiff" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzcmp" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+
-+install-data-hook:
-+	echo ".so man1/`echo "bzip2" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bunzip2" | sed 's,^.*/,,;$(transform)'`.1
-+	echo ".so man1/`echo "bzip2" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzcat" | sed 's,^.*/,,;$(transform)'`.1
-+	echo ".so man1/`echo "bzgrep" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzegrep" | sed 's,^.*/,,;$(transform)'`.1
-+	echo ".so man1/`echo "bzgrep" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzfgrep" | sed 's,^.*/,,;$(transform)'`.1
-+	echo ".so man1/`echo "bzmore" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzless" | sed 's,^.*/,,;$(transform)'`.1
-+	echo ".so man1/`echo "bzdiff" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzcmp" | sed 's,^.*/,,;$(transform)'`.1
-+
-+uninstall-hook:
-+	rm -f $(DESTDIR)$(bindir)/`echo "bunzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzcat" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzegrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzfgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzless" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(bindir)/`echo "bzcmp" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
-+	rm -f $(DESTDIR)$(mandir)/man1/`echo "bunzip2" | sed 's,^.*/,,;$(transform)'`.1
-+	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzcat" | sed 's,^.*/,,;$(transform)'`.1
-+	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzegrep" | sed 's,^.*/,,;$(transform)'`.1
-+	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzfgrep" | sed 's,^.*/,,;$(transform)'`.1
-+	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzless" | sed 's,^.*/,,;$(transform)'`.1
-+	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzcmp" | sed 's,^.*/,,;$(transform)'`.1
-+
-+test: bzip2
-+	@cat $(srcdir)/words1
-+	./bzip2 -1  <$(srcdir)/sample1.ref >sample1.rb2
-+	./bzip2 -2  <$(srcdir)/sample2.ref >sample2.rb2
-+	./bzip2 -3  <$(srcdir)/sample3.ref >sample3.rb2
-+	./bzip2 -d  <$(srcdir)/sample1.bz2 >sample1.tst
-+	./bzip2 -d  <$(srcdir)/sample2.bz2 >sample2.tst
-+	./bzip2 -ds <$(srcdir)/sample3.bz2 >sample3.tst
-+	cmp $(srcdir)/sample1.bz2 sample1.rb2
-+	cmp $(srcdir)/sample2.bz2 sample2.rb2
-+	cmp $(srcdir)/sample3.bz2 sample3.rb2
-+	cmp sample1.tst $(srcdir)/sample1.ref
-+	cmp sample2.tst $(srcdir)/sample2.ref
-+	cmp sample3.tst $(srcdir)/sample3.ref
-+	@cat $(srcdir)/words3
-+
-+manual: $(srcdir)/manual.html $(srcdir)/manual.ps $(srcdir)/manual.pdf
-+
-+manual.ps: $(MANUAL_SRCS)
-+	cd $(srcdir); ./xmlproc.sh -ps manual.xml
-+
-+manual.pdf: $(MANUAL_SRCS)
-+	cd $(srcdir); ./xmlproc.sh -pdf manual.xml
-+
-+manual.html: $(MANUAL_SRCS)
-+	cd $(srcdir); ./xmlproc.sh -html manual.xml
-+
-+EXTRA_DIST = \
-+	$(bin_SCRIPTS) \
-+	$(man_MANS) \
-+	README.autotools \
-+	README.XML.STUFF \
-+	bz-common.xsl \
-+	bz-fo.xsl \
-+	bz-html.xsl \
-+	bzip.css \
-+	bzip2.1.preformatted \
-+	bzip2.pc.in \
-+	bzip2.txt \
-+	dlltest.c \
-+	dlltest.dsp \
-+	entities.xml \
-+	format.pl \
-+	libbz2.def \
-+	libbz2.dsp \
-+	makefile.msc \
-+	manual.html \
-+	manual.pdf \
-+	manual.ps \
-+	manual.xml \
-+	mk251.c \
-+	sample1.bz2 \
-+	sample1.ref \
-+	sample2.bz2 \
-+	sample2.ref \
-+	sample3.bz2 \
-+	sample3.ref \
-+	spewG.c \
-+	unzcrash.c \
-+	words0 \
-+	words1 \
-+	words2 \
-+	words3 \
-+	xmlproc.sh
-+
-+ACLOCAL_AMFLAGS = -I m4
-diff -urN bzip2-1.0.5.orig/bzip2.pc.in bzip2-1.0.5.autoconfiscated/bzip2.pc.in
---- bzip2-1.0.5.orig/bzip2.pc.in	1970-01-01 01:00:00.000000000 +0100
-+++ bzip2-1.0.5.autoconfiscated/bzip2.pc.in	2009-11-03 18:48:28.000000000 +0100
-@@ -0,0 +1,11 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+bindir=@bindir@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+Name: bzip2
-+Description: Lossless, block-sorting data compression
-+Version: @VERSION@
-+Libs: -L${libdir} -lbz2
-+Cflags: -I${includedir}
diff --git a/recipes/bzip2/bzip2-1.0.6/bzip2-1.0.5-autoconfiscated.patch b/recipes/bzip2/bzip2-1.0.6/bzip2-1.0.5-autoconfiscated.patch
new file mode 100644
index 0000000..af2bc7e
--- /dev/null
+++ b/recipes/bzip2/bzip2-1.0.6/bzip2-1.0.5-autoconfiscated.patch
@@ -0,0 +1,286 @@
+diff -urN files/autogen.sh ./autogen.sh
+--- bzip2-1.0.5.orig/autogen.sh	1970-01-01 01:00:00.000000000 +0100
++++ bzip2-1.0.5.autoconfiscated/autogen.sh	2009-11-06 12:10:43.574602171 +0100
+@@ -0,0 +1,8 @@
++mv LICENSE COPYING
++mv CHANGES NEWS
++touch AUTHORS
++touch ChangeLog
++libtoolize --force
++aclocal
++automake --add-missing --gnu
++autoconf
+diff -urN bzip2-1.0.5.orig/README.autotools bzip2-1.0.5.autoconfiscated/README.autotools
+--- bzip2-1.0.5.orig/README.autotools	1970-01-01 01:00:00.000000000 +0100
++++ bzip2-1.0.5.autoconfiscated/README.autotools	2009-11-05 23:06:27.000000000 +0100
+@@ -0,0 +1,39 @@
++bzip2 autoconfiscated
++=====================
++
++Temporarily at http://pack.suse.cz/sbrabec/bzip2/ expecting that it will
++become a new upstream version to prevent per-distribution shared library
++patching done by nearly each Linux vendor separately.
++
++Autoconfiscation brings standard ./configure ; make ; make install
++installation, seamless support of DESTDIR, automatic check for supported
++CFLAGS, standard shared library support, automatic large files CFLAGS
++check and all things that are supported by automake.
++
++It makes obsolete Makefile-libbz2_so and README.COMPILATION.PROBLEMS.
++Now configure should automatically detect correct build flags.
++
++In case of any problem or question with autotools support feel free to
++contact me: Stanislav Brabec <sbrabec@suse.cz>
++
++Autoconfiscated version binaries are exactly equal to
++bzip2-1.0.5.tar.gz. There are only few changes. See below.
++
++
++New features:
++
++Trivial link man pages for bzcat and bunzip2 added.
++
++bzip2.pc file for pkg-config. Packages can use it for checks.
++
++
++Incompatible changes:
++
++soname change. Libtool has no support for two parts name suffix (e. g.
++libbz2.so.1.0). It must be a single number (e. g. libbz2.so.1). That is
++why soname must change. But I see not a big problem with it. Several
++distributions already use the new number instead of the non-standard
++number from Makefile-libbz2_so.
++
++To be super-safe, I incremented minor number of the library file, so
++both instances of the shared library can live together.
+diff -urN bzip2-1.0.5.orig/configure.ac bzip2-1.0.5.autoconfiscated/configure.ac
+--- bzip2-1.0.5.orig/configure.ac	1970-01-01 01:00:00.000000000 +0100
++++ bzip2-1.0.5.autoconfiscated/configure.ac	2009-11-06 17:04:04.000000000 +0100
+@@ -0,0 +1,70 @@
++#                                               -*- Autoconf -*-
++# Process this file with autoconf to produce a configure script.
++
++AC_PREREQ([2.57])
++AC_INIT([bzip2], [1.0.6], [Julian Seward <jseward@bzip.org>])
++BZIP2_LT_CURRENT=1
++BZIP2_LT_REVISION=6
++BZIP2_LT_AGE=0
++AC_CONFIG_SRCDIR([bzlib.h])
++AC_CONFIG_MACRO_DIR([m4])
++
++AM_INIT_AUTOMAKE
++AM_MAINTAINER_MODE
++
++# Checks for programs.
++AC_PROG_AWK
++AC_PROG_CC
++AC_PROG_INSTALL
++AC_PROG_LN_S
++AC_PROG_MAKE_SET
++AC_PROG_LIBTOOL
++PKG_PROG_PKG_CONFIG
++
++# Checks for libraries.
++
++# Checks for header files.
++
++# Checks for typedefs, structures, and compiler characteristics.
++
++# Check for system features.
++AC_SYS_LARGEFILE
++
++AC_MSG_CHECKING([whether compiler understands -Wall])
++save_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -Wall"
++AC_TRY_COMPILE([], [], [
++	AC_MSG_RESULT([yes])
++], [
++	AC_MSG_RESULT([no])
++	CFLAGS="$save_CFLAGS"
++])
++
++AC_MSG_CHECKING([whether compiler understands -Winline])
++save_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -Winline"
++AC_TRY_COMPILE([], [], [
++	AC_MSG_RESULT([yes])
++], [
++	AC_MSG_RESULT([no])
++	CFLAGS="$save_CFLAGS"
++])
++
++AC_MSG_CHECKING([whether compiler understands -fno-strength-reduce])
++save_CFLAGS="$CFLAGS"
++CFLAGS="$CFLAGS -fno-strength-reduce"
++AC_TRY_COMPILE([], [], [
++	AC_MSG_RESULT([yes])
++], [
++	AC_MSG_RESULT([no])
++	CFLAGS="$save_CFLAGS"
++])
++
++# Checks for library functions.
++
++# Write the output.
++AC_SUBST([BZIP2_LT_CURRENT])
++AC_SUBST([BZIP2_LT_REVISION])
++AC_SUBST([BZIP2_LT_AGE])
++AC_CONFIG_FILES([Makefile bzip2.pc])
++AC_OUTPUT
+diff -urN bzip2-1.0.5.orig/Makefile.am bzip2-1.0.5.autoconfiscated/Makefile.am
+--- bzip2-1.0.5.orig/Makefile.am	1970-01-01 01:00:00.000000000 +0100
++++ bzip2-1.0.5.autoconfiscated/Makefile.am	2009-11-05 16:45:11.000000000 +0100
+@@ -0,0 +1,138 @@
++lib_LTLIBRARIES = libbz2.la
++
++libbz2_la_SOURCES = \
++	blocksort.c \
++	huffman.c \
++	crctable.c \
++	randtable.c \
++	compress.c \
++	decompress.c \
++	bzlib.c
++
++libbz2_la_LDFLAGS = \
++	-version-info $(BZIP2_LT_CURRENT):$(BZIP2_LT_REVISION):$(BZIP2_LT_AGE) \
++	-no-undefined
++
++include_HEADERS = bzlib.h
++
++noinst_HEADERS = bzlib_private.h
++
++bin_PROGRAMS = bzip2 bzip2recover
++
++bzip2_SOURCES = bzip2.c
++bzip2_LDADD = libbz2.la
++
++bzip2recover_SOURCES = bzip2recover.c
++bzip2recover_LDADD = libbz2.la
++
++bin_SCRIPTS = bzgrep bzmore bzdiff
++
++man_MANS = bzip2.1 bzgrep.1 bzmore.1 bzdiff.1
++
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = bzip2.pc
++
++$(pkgconfig_DATA): $(srcdir)/bzip2.pc.in config.status
++
++install-exec-hook:
++	rm -f $(DESTDIR)$(bindir)/`echo "bunzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzcat" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzegrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzfgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzless" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzcmp" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	$(LN_S) `echo "bzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bunzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	$(LN_S) `echo "bzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzcat" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	$(LN_S) `echo "bzgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzegrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	$(LN_S) `echo "bzgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzfgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	$(LN_S) `echo "bzmore" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzless" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	$(LN_S) `echo "bzdiff" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'` $(DESTDIR)$(bindir)/`echo "bzcmp" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++
++install-data-hook:
++	echo ".so man1/`echo "bzip2" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bunzip2" | sed 's,^.*/,,;$(transform)'`.1
++	echo ".so man1/`echo "bzip2" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzcat" | sed 's,^.*/,,;$(transform)'`.1
++	echo ".so man1/`echo "bzgrep" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzegrep" | sed 's,^.*/,,;$(transform)'`.1
++	echo ".so man1/`echo "bzgrep" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzfgrep" | sed 's,^.*/,,;$(transform)'`.1
++	echo ".so man1/`echo "bzmore" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzless" | sed 's,^.*/,,;$(transform)'`.1
++	echo ".so man1/`echo "bzdiff" | sed 's,^.*/,,;$(transform)'`.1" >$(DESTDIR)$(mandir)/man1/`echo "bzcmp" | sed 's,^.*/,,;$(transform)'`.1
++
++uninstall-hook:
++	rm -f $(DESTDIR)$(bindir)/`echo "bunzip2" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzcat" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzegrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzfgrep" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzless" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(bindir)/`echo "bzcmp" | sed 's,^.*/,,;$(transform);s/$$/$(EXEEXT)/'`
++	rm -f $(DESTDIR)$(mandir)/man1/`echo "bunzip2" | sed 's,^.*/,,;$(transform)'`.1
++	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzcat" | sed 's,^.*/,,;$(transform)'`.1
++	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzegrep" | sed 's,^.*/,,;$(transform)'`.1
++	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzfgrep" | sed 's,^.*/,,;$(transform)'`.1
++	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzless" | sed 's,^.*/,,;$(transform)'`.1
++	rm -f $(DESTDIR)$(mandir)/man1/`echo "bzcmp" | sed 's,^.*/,,;$(transform)'`.1
++
++test: bzip2
++	@cat $(srcdir)/words1
++	./bzip2 -1  <$(srcdir)/sample1.ref >sample1.rb2
++	./bzip2 -2  <$(srcdir)/sample2.ref >sample2.rb2
++	./bzip2 -3  <$(srcdir)/sample3.ref >sample3.rb2
++	./bzip2 -d  <$(srcdir)/sample1.bz2 >sample1.tst
++	./bzip2 -d  <$(srcdir)/sample2.bz2 >sample2.tst
++	./bzip2 -ds <$(srcdir)/sample3.bz2 >sample3.tst
++	cmp $(srcdir)/sample1.bz2 sample1.rb2
++	cmp $(srcdir)/sample2.bz2 sample2.rb2
++	cmp $(srcdir)/sample3.bz2 sample3.rb2
++	cmp sample1.tst $(srcdir)/sample1.ref
++	cmp sample2.tst $(srcdir)/sample2.ref
++	cmp sample3.tst $(srcdir)/sample3.ref
++	@cat $(srcdir)/words3
++
++manual: $(srcdir)/manual.html $(srcdir)/manual.ps $(srcdir)/manual.pdf
++
++manual.ps: $(MANUAL_SRCS)
++	cd $(srcdir); ./xmlproc.sh -ps manual.xml
++
++manual.pdf: $(MANUAL_SRCS)
++	cd $(srcdir); ./xmlproc.sh -pdf manual.xml
++
++manual.html: $(MANUAL_SRCS)
++	cd $(srcdir); ./xmlproc.sh -html manual.xml
++
++EXTRA_DIST = \
++	$(bin_SCRIPTS) \
++	$(man_MANS) \
++	README.autotools \
++	README.XML.STUFF \
++	bz-common.xsl \
++	bz-fo.xsl \
++	bz-html.xsl \
++	bzip.css \
++	bzip2.1.preformatted \
++	bzip2.pc.in \
++	bzip2.txt \
++	dlltest.c \
++	dlltest.dsp \
++	entities.xml \
++	format.pl \
++	libbz2.def \
++	libbz2.dsp \
++	makefile.msc \
++	manual.html \
++	manual.pdf \
++	manual.ps \
++	manual.xml \
++	mk251.c \
++	sample1.bz2 \
++	sample1.ref \
++	sample2.bz2 \
++	sample2.ref \
++	sample3.bz2 \
++	sample3.ref \
++	spewG.c \
++	unzcrash.c \
++	words0 \
++	words1 \
++	words2 \
++	words3 \
++	xmlproc.sh
++
++ACLOCAL_AMFLAGS = -I m4
+diff -urN bzip2-1.0.5.orig/bzip2.pc.in bzip2-1.0.5.autoconfiscated/bzip2.pc.in
+--- bzip2-1.0.5.orig/bzip2.pc.in	1970-01-01 01:00:00.000000000 +0100
++++ bzip2-1.0.5.autoconfiscated/bzip2.pc.in	2009-11-03 18:48:28.000000000 +0100
+@@ -0,0 +1,11 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++bindir=@bindir@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: bzip2
++Description: Lossless, block-sorting data compression
++Version: @VERSION@
++Libs: -L${libdir} -lbz2
++Cflags: -I${includedir}
diff --git a/recipes/bzip2/bzip2-full-native_1.0.5.bb b/recipes/bzip2/bzip2-full-native_1.0.5.bb
deleted file mode 100644
index 14240e2..0000000
--- a/recipes/bzip2/bzip2-full-native_1.0.5.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Very high-quality data compression program"
-SECTION = "console/utils"
-PR = "r1"
-
-LICENSE = "bzip2"
-FILESPATHPKG =. "bzip2-${PV}:"
-SRC_URI = "http://www.bzip.org/${PV}/bzip2-${PV}.tar.gz \
-	   file://bzip2-1.0.5-autoconfiscated.patch"
-
-S = "${WORKDIR}/bzip2-${PV}"
-
-inherit autotools pkgconfig native
-
-do_configure_prepend () {
-	if test -f LICENSE ; then sh ./autogen.sh ; fi
-}
-
-SRC_URI[md5sum] = "3c15a0c8d1d3ee1c46a1634d00617b1a"
-SRC_URI[sha256sum] = "f7bf5368309d76e5daf3a89d4d1bea688dac7780742e7a0ae1af19be9316fe22"
diff --git a/recipes/bzip2/bzip2-full-native_1.0.6.bb b/recipes/bzip2/bzip2-full-native_1.0.6.bb
new file mode 100644
index 0000000..896a271
--- /dev/null
+++ b/recipes/bzip2/bzip2-full-native_1.0.6.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Very high-quality data compression program"
+SECTION = "console/utils"
+PR = "r0"
+
+LICENSE = "bzip2"
+FILESPATHPKG =. "bzip2-${PV}:"
+SRC_URI = "http://www.bzip.org/${PV}/bzip2-${PV}.tar.gz \
+	   file://bzip2-1.0.5-autoconfiscated.patch"
+SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
+SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
+
+S = "${WORKDIR}/bzip2-${PV}"
+
+inherit autotools pkgconfig native
+
+do_configure_prepend () {
+	if test -f LICENSE ; then sh ./autogen.sh ; fi
+}
diff --git a/recipes/bzip2/bzip2_1.0.5.bb b/recipes/bzip2/bzip2_1.0.5.bb
deleted file mode 100644
index a088230..0000000
--- a/recipes/bzip2/bzip2_1.0.5.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-DESCRIPTION = "Very high-quality data compression program"
-SECTION = "console/utils"
-PR = "r2"
-
-LICENSE = "bzip2"
-SRC_URI = "http://www.bzip.org/${PV}/bzip2-${PV}.tar.gz \
-	   file://bzip2-1.0.5-autoconfiscated.patch"
-
-inherit autotools pkgconfig
-
-do_configure_prepend () {
-	if test -f LICENSE ; then sh ./autogen.sh ; fi
-}
-
-do_install_append () {
-	mv ${D}${bindir}/bunzip2 ${D}${bindir}/bunzip2.${PN}
-	mv ${D}${bindir}/bzcat ${D}${bindir}/bzcat.${PN}
-	ln -sf libbz2.so.1.0.5 ${D}${libdir}/libbz2.so.1.0
-}
-
-PACKAGES =+ "libbz2"
-FILES_libbz2 = "${libdir}/libbz2.so.*"
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/bunzip2 bunzip2 bunzip2.${PN} 100
-	update-alternatives --install ${bindir}/bzcat bzcat bzcat.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove bunzip2 bunzip2.${PN}
-	update-alternatives --remove bzcat bzcat.${PN}
-}
-
-SRC_URI[md5sum] = "3c15a0c8d1d3ee1c46a1634d00617b1a"
-SRC_URI[sha256sum] = "f7bf5368309d76e5daf3a89d4d1bea688dac7780742e7a0ae1af19be9316fe22"
diff --git a/recipes/bzip2/bzip2_1.0.6.bb b/recipes/bzip2/bzip2_1.0.6.bb
new file mode 100644
index 0000000..0d6d030
--- /dev/null
+++ b/recipes/bzip2/bzip2_1.0.6.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Very high-quality data compression program"
+SECTION = "console/utils"
+PR = "r0"
+
+LICENSE = "bzip2"
+SRC_URI = "http://www.bzip.org/${PV}/bzip2-${PV}.tar.gz \
+	   file://bzip2-1.0.5-autoconfiscated.patch"
+SRC_URI[md5sum] = "00b516f4704d4a7cb50a1d97e6e8e15b"
+SRC_URI[sha256sum] = "a2848f34fcd5d6cf47def00461fcb528a0484d8edef8208d6d2e2909dc61d9cd"
+
+inherit autotools pkgconfig
+
+do_configure_prepend () {
+	if test -f LICENSE ; then sh ./autogen.sh ; fi
+}
+
+do_install_append () {
+	mv ${D}${bindir}/bunzip2 ${D}${bindir}/bunzip2.${PN}
+	mv ${D}${bindir}/bzcat ${D}${bindir}/bzcat.${PN}
+	ln -sf libbz2.so.${PV} ${D}${libdir}/libbz2.so.1.0
+}
+
+PACKAGES =+ "libbz2"
+FILES_libbz2 = "${libdir}/libbz2.so.*"
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${bindir}/bunzip2 bunzip2 bunzip2.${PN} 100
+	update-alternatives --install ${bindir}/bzcat bzcat bzcat.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove bunzip2 bunzip2.${PN}
+	update-alternatives --remove bzcat bzcat.${PN}
+}
-- 
1.6.4.2



