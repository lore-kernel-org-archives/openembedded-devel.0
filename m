Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OhJPz-0002Yp-K9
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 11:40:49 +0200
Received: by fxm12 with SMTP id 12so3825386fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=gwYxyHasK1tKjmNINjxthsDIDC0DqEWJQGlV4PDEig4=;
	b=AoiRWntLce2C0k0l+Thy1R5ecM3jtUlPZ5dq2keT7rXdRaJ1uMl0todrplYT+YaNEV
	2hx9eg6jpxGZqrpMTttYW6YpE1/Fv3UGRRKMJCWIg/7dx58sQMauWtC0WFSF2jwIy/n/
	IkNu7q7ac11EAmbWxae+SbvCaxRPgWhKilRWE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Y0BaR4MbwGICctKGsRFs+hqCiZT8IUOrTt5io/nZwa7KAT8H2JhXEJMmJ4kh2fLkQe
	gS3tVMscI8M+u+DvEWKCgyHcSNOwJ8Six3LC5IYvg9ugc7fM+EMBhFV2Ux1yFVStwIPb
	NcLFnn7cRglnXDBVD6AXrsbaAa6+1mDGb1g7Y=
Received: by 10.223.112.10 with SMTP id u10mr12444067fap.50.1281087641656;
	Fri, 06 Aug 2010 02:40:41 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id e22sm955057faa.0.2010.08.06.02.40.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 06 Aug 2010 02:40:41 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OhJPp-00035Y-6V; Fri, 06 Aug 2010 11:40:37 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Aug 2010 11:40:30 +0200
Message-Id: <1281087632-11759-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
References: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/4] e2fsprogs: add 1.41.12, remove old versions
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
X-List-Received-Date: Fri, 06 Aug 2010 09:40:49 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../e2fsprogs/e2fsprogs-1.38/file-open-mode.patch  |   11 -
 .../e2fsprogs/e2fsprogs-1.38/mkinstalldirs.patch   |  273 --------------------
 .../e2fsprogs/e2fsprogs-1.38/no-hardlinks.patch    |   82 ------
 recipes/e2fsprogs/e2fsprogs_1.38.bb                |   13 -
 recipes/e2fsprogs/e2fsprogs_1.41.12.bb             |   10 +
 recipes/e2fsprogs/e2fsprogs_1.41.4.bb              |    8 -
 recipes/e2fsprogs/e2fsprogs_1.41.5.bb              |    8 -
 recipes/e2fsprogs/e2fsprogs_1.41.9.bb              |   10 -
 8 files changed, 10 insertions(+), 405 deletions(-)
 delete mode 100644 recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch
 delete mode 100644 recipes/e2fsprogs/e2fsprogs-1.38/mkinstalldirs.patch
 delete mode 100644 recipes/e2fsprogs/e2fsprogs-1.38/no-hardlinks.patch
 delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.38.bb
 create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.12.bb
 delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.4.bb
 delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.5.bb
 delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.9.bb

diff --git a/recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch b/recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch
deleted file mode 100644
index 97679d6..0000000
--- a/recipes/e2fsprogs/e2fsprogs-1.38/file-open-mode.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- e2fsprogs-1.38/lib/ext2fs/ismounted.c~	2005-06-06 06:05:22.000000000 +1000
-+++ e2fsprogs-1.38/lib/ext2fs/ismounted.c	2009-04-03 15:07:35.000000000 +1100
-@@ -147,7 +147,7 @@
- is_root:
- #define TEST_FILE "/.ismount-test-file"		
- 		*mount_flags |= EXT2_MF_ISROOT;
--		fd = open(TEST_FILE, O_RDWR|O_CREAT);
-+		fd = open(TEST_FILE, O_RDWR|O_CREAT, S_IRUSR|S_IWUSR);
- 		if (fd < 0) {
- 			if (errno == EROFS)
- 				*mount_flags |= EXT2_MF_READONLY;
diff --git a/recipes/e2fsprogs/e2fsprogs-1.38/mkinstalldirs.patch b/recipes/e2fsprogs/e2fsprogs-1.38/mkinstalldirs.patch
deleted file mode 100644
index d1dbd07..0000000
--- a/recipes/e2fsprogs/e2fsprogs-1.38/mkinstalldirs.patch
+++ /dev/null
@@ -1,273 +0,0 @@
-This patch is based on the following:
-
-http://cvs.fedora.redhat.com/viewvc/rpms/e2fsprogs/F-7/e2fsprogs-1.39-mkinstalldirs.patch
-
-diff -urN e2fsprogs-1.38.orig/configure.in e2fsprogs-1.38/configure.in
---- e2fsprogs-1.38.orig/configure.in	2005-04-06 20:44:15.000000000 +0200
-+++ e2fsprogs-1.38/configure.in	2008-10-16 23:44:10.000000000 +0200
-@@ -518,6 +518,7 @@
- AC_CHECK_TOOL(RANLIB, ranlib, :)
- AC_CHECK_TOOL(STRIP, strip, :)
- AC_PROG_INSTALL
-+AC_PROG_MKDIR_P
- # See if we need a separate native compiler.
- if test $cross_compiling = no; then
-   BUILD_CC="$CC"
-diff -urN e2fsprogs-1.38.orig/debugfs/Makefile.in e2fsprogs-1.38/debugfs/Makefile.in
---- e2fsprogs-1.38.orig/debugfs/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/debugfs/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -48,8 +48,8 @@
- 	@$(SUBSTITUTE_UPTIME) $(srcdir)/debugfs.8.in debugfs.8
- 
- installdirs:
--	@echo "	MKINSTALLDIRS $(root_sbindir) $(man8dir)"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(root_sbindir) \
-+	@echo "	MKDIR_P $(root_sbindir) $(man8dir)"
-+	@$(MKDIR_P) $(DESTDIR)$(root_sbindir) \
- 		$(DESTDIR)$(man8dir)
- 
- install: $(PROGS) $(MANPAGES) installdirs
-diff -urN e2fsprogs-1.38.orig/doc/Makefile.in e2fsprogs-1.38/doc/Makefile.in
---- e2fsprogs-1.38.orig/doc/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/doc/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -20,8 +20,8 @@
- 
- install-doc-libs:
- 	@$(RM) -rf $(DESTDIR)$(infodir)/libext2fs.info*
--	@echo "	MKINSTALLDIRS $(infodir)"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(infodir)
-+	@echo "	MKDIR_P $(infodir)"
-+	@$(MKDIR_P) $(DESTDIR)$(infodir)
- 	@for i in libext2fs.info* ; do \
- 		echo "	INSTALL_DATA $(infodir)/$$i" ; \
- 		$(INSTALL_DATA) $$i $(DESTDIR)$(infodir)/$$i ; \
-diff -urN e2fsprogs-1.38.orig/e2fsck/Makefile.in e2fsprogs-1.38/e2fsck/Makefile.in
---- e2fsprogs-1.38.orig/e2fsck/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/e2fsck/Makefile.in	2008-10-16 23:44:55.000000000 +0200
-@@ -151,8 +151,8 @@
- 	@$(SUBSTITUTE_UPTIME) $(srcdir)/e2fsck.8.in e2fsck.8
- 
- installdirs:
--	@echo "	MKINSTALLDIRS $(root_sbindir) $(man8dir)"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(root_sbindir) \
-+	@echo "	MKDIR_P $(root_sbindir) $(man8dir)"
-+	@$(MKDIR_P) $(DESTDIR)$(root_sbindir) \
- 		$(DESTDIR)$(man8dir)
- 
- install: $(PROGS) $(MANPAGES) installdirs
-diff -urN e2fsprogs-1.38.orig/intl/Makefile.in e2fsprogs-1.38/intl/Makefile.in
---- e2fsprogs-1.38.orig/intl/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/intl/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -39,8 +39,8 @@
- 
- INSTALL = @INSTALL@
- INSTALL_DATA = @INSTALL_DATA@
--MKINSTALLDIRS = @MKINSTALLDIRS@
--mkinstalldirs = $(SHELL) $(MKINSTALLDIRS)
-+MKDIR_P = @MKDIR_P@
-+mkdir_p = @MKDIR_P@
- 
- l = @INTL_LIBTOOL_SUFFIX_PREFIX@
- 
-diff -urN e2fsprogs-1.38.orig/lib/blkid/Makefile.in e2fsprogs-1.38/lib/blkid/Makefile.in
---- e2fsprogs-1.38.orig/lib/blkid/Makefile.in	2005-06-29 19:39:54.000000000 +0200
-+++ e2fsprogs-1.38/lib/blkid/Makefile.in	2008-10-16 23:45:16.000000000 +0200
-@@ -129,8 +129,8 @@
- 	@cd $(top_builddir); CONFIG_FILES=lib/blkid/blkid.pc ./config.status
- 
- installdirs::
--	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/blkid"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
-+	@echo "	MKDIR_P $(libdir) $(includedir)/blkid"
-+	@$(MKDIR_P) $(DESTDIR)$(libdir) \
- 		$(DESTDIR)$(includedir)/blkid $(DESTDIR)$(libdir)/pkgconfig
- 
- install:: all installdirs 
-diff -urN e2fsprogs-1.38.orig/lib/e2p/Makefile.in e2fsprogs-1.38/lib/e2p/Makefile.in
---- e2fsprogs-1.38.orig/lib/e2p/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/lib/e2p/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -73,8 +73,8 @@
- 	./tst_ostype
- 
- installdirs::
--	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/e2p"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
-+	@echo "	MKDIR_P $(libdir) $(includedir)/e2p"
-+	@$(MKDIR_P) $(DESTDIR)$(libdir) \
- 		$(DESTDIR)$(includedir)/e2p $(DESTDIR)$(libdir)/pkgconfig
- 
- install:: all installdirs 
-diff -urN e2fsprogs-1.38.orig/lib/et/Makefile.in e2fsprogs-1.38/lib/et/Makefile.in
---- e2fsprogs-1.38.orig/lib/et/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/lib/et/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -74,8 +74,8 @@
- 	$(TAGS) $(SRCS)
- 
- installdirs::
--	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/et $(datadir)/et $(bindir) $(man1dir) $(man3dir)"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
-+	@echo "	MKDIR_P $(libdir) $(includedir)/et $(datadir)/et $(bindir) $(man1dir) $(man3dir)"
-+	@$(MKDIR_P) $(DESTDIR)$(libdir) \
- 		$(DESTDIR)$(includedir)/et $(DESTDIR)$(datadir)/et \
- 		$(DESTDIR)$(bindir) $(DESTDIR)$(man1dir) \
- 		$(DESTDIR)$(man3dir) $(DESTDIR)$(libdir)/pkgconfig
-diff -urN e2fsprogs-1.38.orig/lib/ext2fs/Makefile.in e2fsprogs-1.38/lib/ext2fs/Makefile.in
---- e2fsprogs-1.38.orig/lib/ext2fs/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/lib/ext2fs/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -230,8 +230,8 @@
- @SWAPFS_CMT@	LD_LIBRARY_PATH=$(LIB) DYLD_LIBRARY_PATH=$(LIB) ./tst_byteswap
- 
- installdirs::
--	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/ext2fs"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
-+	@echo "	MKDIR_P $(libdir) $(includedir)/ext2fs"
-+	@$(MKDIR_P) $(DESTDIR)$(libdir) \
- 		$(DESTDIR)$(includedir)/ext2fs $(DESTDIR)$(libdir)/pkgconfig
- 
- install:: all $(HFILES) $(HFILES_IN) installdirs ext2fs.pc
-diff -urN e2fsprogs-1.38.orig/lib/Makefile.elf-lib e2fsprogs-1.38/lib/Makefile.elf-lib
---- e2fsprogs-1.38.orig/lib/Makefile.elf-lib	2004-12-15 17:30:39.000000000 +0100
-+++ e2fsprogs-1.38/lib/Makefile.elf-lib	2008-10-16 23:44:10.000000000 +0200
-@@ -35,8 +35,8 @@
- 	@$(LN) ../$(ELF_LIB) ../$(ELF_SONAME)
- 
- installdirs-elf-lib::
--	@echo "	MKINSTALLDIRS $(ELF_INSTALL_DIR) $(libdir)"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(ELF_INSTALL_DIR) \
-+	@echo "	MKDIR_P $(ELF_INSTALL_DIR) $(libdir)"
-+	@$(MKDIR_P) $(DESTDIR)$(ELF_INSTALL_DIR) \
- 		$(DESTDIR)$(libdir)
- 
- installdirs:: installdirs-elf-lib
-diff -urN e2fsprogs-1.38.orig/lib/ss/Makefile.in e2fsprogs-1.38/lib/ss/Makefile.in
---- e2fsprogs-1.38.orig/lib/ss/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/lib/ss/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -125,8 +125,8 @@
- 	@cd $(top_builddir); CONFIG_FILES=lib/ss/ss.pc ./config.status
- 
- installdirs::
--	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/ss $(datadir)/ss $(bindir)"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
-+	@echo "	MKDIR_P $(libdir) $(includedir)/ss $(datadir)/ss $(bindir)"
-+	@$(MKDIR_P) $(DESTDIR)$(libdir) \
- 		$(DESTDIR)$(includedir)/ss $(DESTDIR)$(datadir)/ss \
- 		$(DESTDIR)$(bindir) $(DESTDIR)$(libdir)/pkgconfig
- 
-diff -urN e2fsprogs-1.38.orig/lib/uuid/Makefile.in e2fsprogs-1.38/lib/uuid/Makefile.in
---- e2fsprogs-1.38.orig/lib/uuid/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/lib/uuid/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -126,8 +126,8 @@
- 	@cd $(top_builddir); CONFIG_FILES=lib/uuid/uuid.pc ./config.status
- 
- installdirs::
--	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/uuid $(man3dir)"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir)  \
-+	@echo "	MKDIR_P $(libdir) $(includedir)/uuid $(man3dir)"
-+	@$(MKDIR_P) $(DESTDIR)$(libdir)  \
- 		$(DESTDIR)$(includedir)/uuid $(DESTDIR)$(man3dir) \
- 		$(DESTDIR)$(libdir)/pkgconfig
- 
-diff -urN e2fsprogs-1.38.orig/MCONFIG.in e2fsprogs-1.38/MCONFIG.in
---- e2fsprogs-1.38.orig/MCONFIG.in	2005-02-04 16:43:57.000000000 +0100
-+++ e2fsprogs-1.38/MCONFIG.in	2008-10-16 23:44:10.000000000 +0200
-@@ -59,7 +59,7 @@
- INSTALL_PROGRAM = @INSTALL_PROGRAM@
- INSTALL_DATA = @INSTALL_DATA@
- INSTALL_SCRIPT = @INSTALL_SCRIPT@
--MKINSTALLDIRS = @MKINSTALLDIRS@
-+MKDIR_P = @MKDIR_P@
- 
- #
- # Library definitions
-diff -urN e2fsprogs-1.38.orig/misc/Makefile.in e2fsprogs-1.38/misc/Makefile.in
---- e2fsprogs-1.38.orig/misc/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/misc/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -215,8 +215,8 @@
- 	@$(SUBSTITUTE_UPTIME) $(srcdir)/filefrag.8.in filefrag.8
- 
- installdirs:
--	@echo "	MKINSTALLDIRS $(sbindir) $(root_sbindir) $(bindir) $(man1dir) $(man8dir) $(libdir)"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(sbindir) \
-+	@echo "	MKDIR_P $(sbindir) $(root_sbindir) $(bindir) $(man1dir) $(man8dir) $(libdir)"
-+	@$(MKDIR_P) $(DESTDIR)$(sbindir) \
- 		$(DESTDIR)$(root_sbindir) $(DESTDIR)$(bindir) \
- 		$(DESTDIR)$(man1dir) $(DESTDIR)$(man8dir) $(DESTDIR)$(libdir)
- 
-diff -urN e2fsprogs-1.38.orig/po/Makefile.in.in e2fsprogs-1.38/po/Makefile.in.in
---- e2fsprogs-1.38.orig/po/Makefile.in.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/po/Makefile.in.in	2008-10-16 23:44:10.000000000 +0200
-@@ -25,11 +25,10 @@
- datadir = @datadir@
- localedir = $(datadir)/locale
- gettextsrcdir = $(datadir)/gettext/po
-+mkdir_p = @MKDIR_P@
- 
- INSTALL = @INSTALL@
- INSTALL_DATA = @INSTALL_DATA@
--MKINSTALLDIRS = @MKINSTALLDIRS@
--mkinstalldirs = $(SHELL) $(MKINSTALLDIRS)
- 
- GMSGFMT = @GMSGFMT@
- MSGFMT = @MSGFMT@
-@@ -147,7 +146,7 @@
- install-exec:
- install-data: install-data-@USE_NLS@
- 	if test "$(PACKAGE)" = "gettext-tools"; then \
--	  $(mkinstalldirs) $(DESTDIR)$(gettextsrcdir); \
-+	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
- 	  for file in $(DISTFILES.common) Makevars.template; do \
- 	    $(INSTALL_DATA) $(srcdir)/$$file \
- 			    $(DESTDIR)$(gettextsrcdir)/$$file; \
-@@ -160,13 +159,13 @@
- 	fi
- install-data-no: all
- install-data-yes: all
--	$(mkinstalldirs) $(DESTDIR)$(datadir)
-+	$(mkdir_p) $(DESTDIR)$(datadir)
- 	@catalogs='$(CATALOGS)'; \
- 	for cat in $$catalogs; do \
- 	  cat=`basename $$cat`; \
- 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
- 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
--	  $(mkinstalldirs) $(DESTDIR)$$dir; \
-+	  $(mkdir_p) $(DESTDIR)$$dir; \
- 	  if test -r $$cat; then realcat=$$cat; else realcat=$(srcdir)/$$cat; fi; \
- 	  $(INSTALL_DATA) $$realcat $(DESTDIR)$$dir/$(DOMAIN).mo; \
- 	  echo "installing $$realcat as $(DESTDIR)$$dir/$(DOMAIN).mo"; \
-@@ -206,19 +205,19 @@
- installdirs-exec:
- installdirs-data: installdirs-data-@USE_NLS@
- 	if test "$(PACKAGE)" = "gettext-tools"; then \
--	  $(mkinstalldirs) $(DESTDIR)$(gettextsrcdir); \
-+	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
- 	else \
- 	  : ; \
- 	fi
- installdirs-data-no:
- installdirs-data-yes:
--	$(mkinstalldirs) $(DESTDIR)$(datadir)
-+	$(mkdir_p) $(DESTDIR)$(datadir)
- 	@catalogs='$(CATALOGS)'; \
- 	for cat in $$catalogs; do \
- 	  cat=`basename $$cat`; \
- 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
- 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
--	  $(mkinstalldirs) $(DESTDIR)$$dir; \
-+	  $(mkdir_p) $(DESTDIR)$$dir; \
- 	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
- 	    if test -n "$$lc"; then \
- 	      if (cd $(DESTDIR)$(localedir)/$$lang && LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' -> ' >/dev/null; then \
-diff -urN e2fsprogs-1.38.orig/resize/Makefile.in e2fsprogs-1.38/resize/Makefile.in
---- e2fsprogs-1.38.orig/resize/Makefile.in	2005-06-29 19:42:20.000000000 +0200
-+++ e2fsprogs-1.38/resize/Makefile.in	2008-10-16 23:44:10.000000000 +0200
-@@ -56,8 +56,8 @@
- 	@$(CC) $(ALL_LDFLAGS) -o test_extent $(TEST_EXTENT_OBJS) $(LIBS) 
- 
- installdirs:
--	@echo "	MKINSTALLDIRS $(root_sbindir) $(man8dir)"
--	@$(MKINSTALLDIRS) $(DESTDIR)$(root_sbindir) \
-+	@echo "	MKDIR_P $(root_sbindir) $(man8dir)"
-+	@$(MKDIR_P) $(DESTDIR)$(root_sbindir) \
- 		$(DESTDIR)$(man8dir)
- 
- install: $(PROGS) $(MANPAGES) installdirs
diff --git a/recipes/e2fsprogs/e2fsprogs-1.38/no-hardlinks.patch b/recipes/e2fsprogs/e2fsprogs-1.38/no-hardlinks.patch
deleted file mode 100644
index 979f0d1..0000000
--- a/recipes/e2fsprogs/e2fsprogs-1.38/no-hardlinks.patch
+++ /dev/null
@@ -1,82 +0,0 @@
---- e2fsprogs-1.38/misc/Makefile.in.orig	2005-11-08 23:56:06.000000000 +0100
-+++ e2fsprogs-1.38/misc/Makefile.in	2005-11-08 23:59:15.000000000 +0100
-@@ -230,17 +230,13 @@
- 		$(INSTALL_PROGRAM) $$i $(DESTDIR)$(sbindir)/$$i; \
- 	done
- 	@echo "	LINK $(root_sbindir)/mkfs.ext2"
--	@$(LN) -f $(DESTDIR)$(root_sbindir)/mke2fs \
--		$(DESTDIR)$(root_sbindir)/mkfs.ext2
-+	@(cd $(DESTDIR)$(root_sbindir) && $(LN_S) -f mke2fs mkfs.ext2)
- 	@echo "	LINK $(root_sbindir)/mkfs.ext3"
--	@$(LN) -f $(DESTDIR)$(root_sbindir)/mke2fs \
--		$(DESTDIR)$(root_sbindir)/mkfs.ext3
-+	@(cd $(DESTDIR)$(root_sbindir) && $(LN_S) -f mke2fs mkfs.ext3)
- 	@echo "	LINK $(root_sbindir)/e2label"
--	@$(LN) -f $(DESTDIR)$(root_sbindir)/tune2fs \
--		$(DESTDIR)$(root_sbindir)/e2label
-+	@(cd $(DESTDIR)$(root_sbindir) && $(LN_S) -f tune2fs e2label)
- 	@echo "	LINK $(root_sbindir)/findfs"
--	@$(LN) -f $(DESTDIR)$(root_sbindir)/tune2fs \
--		$(DESTDIR)$(root_sbindir)/findfs
-+	@(cd $(DESTDIR)$(root_sbindir) && $(LN_S) -f tune2fs findfs)
- 	@for i in $(UPROGS); do \
- 		echo "	INSTALL $(bindir)/$$i"; \
- 		$(INSTALL_PROGRAM) $$i $(DESTDIR)$(bindir)/$$i; \
-@@ -259,11 +255,9 @@
- 	@$(RM) -f $(DESTDIR)$(man8dir)/mkfs.ext2.8.gz \
- 		$(DESTDIR)$(man8dir)/mkfs.ext3.8.gz
- 	@echo "	LINK mkfs.ext2.8"
--	@$(LN) -f $(DESTDIR)$(man8dir)/mke2fs.8 \
--		$(DESTDIR)$(man8dir)/mkfs.ext2.8
-+	@(cd $(DESTDIR)$(man8dir) && $(LN_S) -f mke2fs.8 mkfs.ext2.8)
- 	@echo "	LINK mkfs.ext3.8"
--	@$(LN) -f $(DESTDIR)$(man8dir)/mke2fs.8 \
--		$(DESTDIR)$(man8dir)/mkfs.ext3.8
-+	@(cd $(DESTDIR)$(man8dir) && $(LN_S) -f mke2fs.8 mkfs.ext3.8)
- 	@for i in $(UMANPAGES); do \
- 		$(RM) -f $(DESTDIR)$(man1dir)/$$i.gz; \
- 		echo "	INSTALL_DATA $(man1dir)/$$i"; \
---- e2fsprogs-1.38/lib/uuid/Makefile.in.orig	2005-11-08 23:54:17.000000000 +0100
-+++ e2fsprogs-1.38/lib/uuid/Makefile.in	2005-11-08 23:55:51.000000000 +0100
-@@ -146,9 +146,9 @@
- 	@$(RM) -f $(DESTDIR)$(man3dir)/uuid_generate_random.3.gz \
- 		$(DESTDIR)$(man3dir)/uuid_generate_time.3.gz
- 	@echo "	LINK $(man3dir)/uuid_generate_random.3"
--	@$(LN) -f $(DESTDIR)$(man3dir)/uuid_generate.3 $(DESTDIR)$(man3dir)/uuid_generate_random.3
-+	@(cd $(DESTDIR)$(man3dir) && $(LN_S) -f uuid_generate.3 uuid_generate_random.3)
- 	@echo "	LINK $(man3dir)/uuid_generate_time.3"
--	@$(LN) -f $(DESTDIR)$(man3dir)/uuid_generate.3 $(DESTDIR)$(man3dir)/uuid_generate_time.3
-+	@(cd $(DESTDIR)$(man3dir) && $(LN_S) -f uuid_generate.3 uuid_generate_time.3)
- 	@echo "	INSTALL_DATA $(libdir)/pkgconfig/uuid.pc"
- 	@$(INSTALL_DATA) uuid.pc $(DESTDIR)$(libdir)/pkgconfig/uuid.pc
- 
---- e2fsprogs-1.38/e2fsck/Makefile.in.orig	2005-11-08 23:53:07.000000000 +0100
-+++ e2fsprogs-1.38/e2fsck/Makefile.in	2005-11-08 23:53:43.000000000 +0100
-@@ -161,11 +161,9 @@
- 		$(INSTALL_PROGRAM) $$i $(DESTDIR)$(root_sbindir)/$$i; \
- 	done
- 	@echo "	LINK $(root_sbindir)/fsck.ext2"
--	@$(LN) -f $(DESTDIR)$(root_sbindir)/e2fsck \
--			$(DESTDIR)$(root_sbindir)/fsck.ext2
-+	@(cd $(DESTDIR)$(root_sbindir) && $(LN_S) -f e2fsck fsck.ext2)
- 	@echo "	LINK $(root_sbindir)/fsck.ext3"
--	@$(LN) -f $(DESTDIR)$(root_sbindir)/e2fsck \
--			$(DESTDIR)$(root_sbindir)/fsck.ext3
-+	@(cd $(DESTDIR)$(root_sbindir) && $(LN_S) -f e2fsck fsck.ext3)
- 	@for i in $(MANPAGES); do \
- 		for j in $(COMPRESS_EXT); do \
- 			$(RM) -f $(DESTDIR)$(man8dir)/$$i.$$j; \
-@@ -174,11 +172,9 @@
- 		$(INSTALL_DATA) $$i $(DESTDIR)$(man8dir)/$$i; \
- 	done
- 	@echo "	LINK $(man8dir)/fsck.ext2.8"
--	@$(LN) -f $(DESTDIR)$(man8dir)/e2fsck.8 \
--		$(DESTDIR)$(man8dir)/fsck.ext2.8
-+	@(cd $(DESTDIR)$(man8dir) && $(LN_S) -f e2fsck.8 fsck.ext2.8)
- 	@echo "	LINK $(man8dir)/fsck.ext3.8"
--	@$(LN) -f $(DESTDIR)$(man8dir)/e2fsck.8 \
--		$(DESTDIR)$(man8dir)/fsck.ext3.8
-+	@(cd $(DESTDIR)$(man8dir) && $(LN_S) -f e2fsck.8 fsck.ext3.8)
- 
- install-strip: install
- 	@for i in $(PROGS); do \
diff --git a/recipes/e2fsprogs/e2fsprogs_1.38.bb b/recipes/e2fsprogs/e2fsprogs_1.38.bb
deleted file mode 100644
index 3401ed0..0000000
--- a/recipes/e2fsprogs/e2fsprogs_1.38.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require e2fsprogs.inc
-
-PR = "${INC_PR}"
-
-SRC_URI += "file://no-hardlinks.patch \
-	    file://mkinstalldirs.patch \
-            file://file-open-mode.patch \
-           "
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-SRC_URI[md5sum] = "d774d4412bfb80d12cf3a4fdfd59de5a"
-SRC_URI[sha256sum] = "c4e482687d0cff240d02a70fcf423cc14296b6a7869cd8dd42d5404d098e0bb7"
diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.12.bb b/recipes/e2fsprogs/e2fsprogs_1.41.12.bb
new file mode 100644
index 0000000..5798501
--- /dev/null
+++ b/recipes/e2fsprogs/e2fsprogs_1.41.12.bb
@@ -0,0 +1,10 @@
+require e2fsprogs.inc
+
+PR = "${INC_PR}"
+
+do_configure() {
+        oe_runconf
+}
+
+SRC_URI[md5sum] = "1b24a21fc0c2381ef420961cbfec733f"
+SRC_URI[sha256sum] = "9c26d0dc20bfdafd0f27f3564791d6121d1c1876549d4f2ff1e41955c9bb9f20"
diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb b/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
deleted file mode 100644
index d51cdcc..0000000
--- a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require e2fsprogs.inc
-
-PR = "${INC_PR}"
-
-SRC_URI += "file://mkinstalldirs.patch"
-
-SRC_URI[md5sum] = "59033388df36987d2b9c9bbf7e19bd57"
-SRC_URI[sha256sum] = "2cc10fee2b29add737e454eb634513135b34a638f7ca2b18364864fe089020dc"
diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.5.bb b/recipes/e2fsprogs/e2fsprogs_1.41.5.bb
deleted file mode 100644
index 9e9d7c0..0000000
--- a/recipes/e2fsprogs/e2fsprogs_1.41.5.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require e2fsprogs.inc
-
-PR = "${INC_PR}"
-
-SRC_URI += "file://mkinstalldirs.patch"
-
-SRC_URI[md5sum] = "e218df6c84fc17c1126d31de9472a76c"
-SRC_URI[sha256sum] = "b3d7d0e1058a3740ddae83d47285bd9dce161eec9e299dde7996ed721da32198"
diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb b/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
deleted file mode 100644
index 6a8c113..0000000
--- a/recipes/e2fsprogs/e2fsprogs_1.41.9.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require e2fsprogs.inc
-
-PR = "${INC_PR}"
-
-do_configure() {
-        oe_runconf
-}
-
-SRC_URI[md5sum] = "52f60a9e19a02f142f5546f1b5681927"
-SRC_URI[sha256sum] = "cbf1e34261a16b3d7911b60b91290b19f2010036d6ba628d45b5f0b2af2b66e8"
-- 
1.7.1



