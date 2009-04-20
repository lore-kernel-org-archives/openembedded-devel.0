Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LvwlB-0007ei-HZ
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 18:54:22 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Lvwh0-0005Pf-Na
	for openembedded-devel@openembedded.org; Mon, 20 Apr 2009 16:50:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 16:50:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 20 Apr 2009 16:50:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 20 Apr 2009 18:33:21 +0200
Message-ID: <gsi84h$ec5$3@ger.gmane.org>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-4-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <1240241104-21935-4-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 1/1] e2fsprogs_1.41.4.bb : remove bogus override of do_configure which breaks avr32 compile. Did a simple forward port of mkinstalldirs.patch that fixes the problem.
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
X-List-Received-Date: Mon, 20 Apr 2009 16:54:23 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Koen Kooi <koen@openembedded.org>


On 20-04-09 17:24, Marcin Juszkiewicz wrote:
> From: Graeme Gregory<dp@xora.org.uk>
>
> ---
>   .../e2fsprogs/e2fsprogs-1.41.4/mkinstalldirs.patch |  289 ++++++++++++++++++++
>   recipes/e2fsprogs/e2fsprogs_1.41.4.bb              |   11 +-
>   2 files changed, 291 insertions(+), 9 deletions(-)
>   create mode 100644 recipes/e2fsprogs/e2fsprogs-1.41.4/mkinstalldirs.patch
>
> diff --git a/recipes/e2fsprogs/e2fsprogs-1.41.4/mkinstalldirs.patch b/recipes/e2fsprogs/e2fsprogs-1.41.4/mkinstalldirs.patch
> new file mode 100644
> index 0000000..759e84e
> --- /dev/null
> +++ b/recipes/e2fsprogs/e2fsprogs-1.41.4/mkinstalldirs.patch
> @@ -0,0 +1,289 @@
> +This patch is based on the following:
> +
> +http://cvs.fedora.redhat.com/viewvc/rpms/e2fsprogs/F-7/e2fsprogs-1.39-mkinstalldirs.patch
> +
> +Index: e2fsprogs-1.41.4/configure.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/configure.in	2008-10-07 15:22:39.000000000 +0100
> ++++ e2fsprogs-1.41.4/configure.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -577,6 +577,7 @@
> + fi
> + AC_SUBST(MAKEINFO)
> + AC_PROG_INSTALL
> ++AC_PROG_MKDIR_P
> + # See if we need a separate native compiler.
> + if test $cross_compiling = no; then
> +   BUILD_CC="$CC"
> +Index: e2fsprogs-1.41.4/debugfs/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/debugfs/Makefile.in	2008-06-18 04:53:42.000000000 +0100
> ++++ e2fsprogs-1.41.4/debugfs/Makefile.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -47,8 +47,8 @@
> + 	@$(SUBSTITUTE_UPTIME) $(srcdir)/debugfs.8.in debugfs.8
> +
> + installdirs:
> +-	@echo "	MKINSTALLDIRS $(root_sbindir) $(man8dir)"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(root_sbindir) \
> ++	@echo "	MKDIR_P $(root_sbindir) $(man8dir)"
> ++	@$(MKDIR_P) $(DESTDIR)$(root_sbindir) \
> + 		$(DESTDIR)$(man8dir)
> +
> + install: $(PROGS) $(MANPAGES) installdirs
> +Index: e2fsprogs-1.41.4/doc/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/doc/Makefile.in	2008-05-26 00:52:27.000000000 +0100
> ++++ e2fsprogs-1.41.4/doc/Makefile.in	2009-04-09 21:20:09.000000000 +0100
> +@@ -20,8 +20,8 @@
> +
> + install-doc-libs: libext2fs.info libext2fs.dvi
> + 	@$(RM) -rf $(DESTDIR)$(infodir)/libext2fs.info*
> +-	@echo "	MKINSTALLDIRS $(infodir)"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(infodir)
> ++	@echo "	MKDIR_P $(infodir)"
> ++	@$(MKDIR_P) $(DESTDIR)$(infodir)
> + 	-@for i in libext2fs.info* ; do \
> + 		echo "	INSTALL_DATA $(infodir)/$$i" ; \
> + 		$(INSTALL_DATA) $$i $(DESTDIR)$(infodir)/$$i ; \
> +Index: e2fsprogs-1.41.4/e2fsck/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/e2fsck/Makefile.in	2008-11-15 04:19:57.000000000 +0000
> ++++ e2fsprogs-1.41.4/e2fsck/Makefile.in	2009-04-09 21:20:44.000000000 +0100
> +@@ -185,8 +185,8 @@
> + 	@$(SUBSTITUTE_UPTIME) $(srcdir)/e2fsck.conf.5.in e2fsck.conf.5
> +
> + installdirs:
> +-	@echo "	MKINSTALLDIRS $(root_sbindir) $(man8dir)"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(root_sbindir) \
> ++	@echo "	MKDIR_P $(root_sbindir) $(man8dir)"
> ++	@$(MKDIR_P) $(DESTDIR)$(root_sbindir) \
> + 		$(DESTDIR)$(man8dir) $(DESTDIR)$(man5dir)
> +
> + install: $(PROGS) $(MANPAGES) $(FMANPAGES) installdirs
> +Index: e2fsprogs-1.41.4/intl/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/intl/Makefile.in	2007-06-30 13:58:34.000000000 +0100
> ++++ e2fsprogs-1.41.4/intl/Makefile.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -40,8 +40,8 @@
> +
> + INSTALL = @INSTALL@
> + INSTALL_DATA = @INSTALL_DATA@
> +-MKINSTALLDIRS = @MKINSTALLDIRS@
> +-mkinstalldirs = $(SHELL) $(MKINSTALLDIRS)
> ++MKDIR_P = @MKDIR_P@
> ++mkdir_p = @MKDIR_P@
> +
> + l = @INTL_LIBTOOL_SUFFIX_PREFIX@
> +
> +Index: e2fsprogs-1.41.4/lib/blkid/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/lib/blkid/Makefile.in	2008-10-07 15:22:39.000000000 +0100
> ++++ e2fsprogs-1.41.4/lib/blkid/Makefile.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -142,8 +142,8 @@
> + 	@cd $(top_builddir); CONFIG_FILES=lib/blkid/blkid.pc ./config.status
> +
> + installdirs::
> +-	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/blkid"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
> ++	@echo "	MKDIR_P $(libdir) $(includedir)/blkid"
> ++	@$(MKDIR_P) $(DESTDIR)$(libdir) \
> + 		$(DESTDIR)$(includedir)/blkid $(DESTDIR)$(libdir)/pkgconfig
> +
> + install:: all installdirs
> +Index: e2fsprogs-1.41.4/lib/e2p/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/lib/e2p/Makefile.in	2008-10-07 15:22:39.000000000 +0100
> ++++ e2fsprogs-1.41.4/lib/e2p/Makefile.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -79,8 +79,8 @@
> + 	./tst_feature
> +
> + installdirs::
> +-	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/e2p"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
> ++	@echo "	MKDIR_P $(libdir) $(includedir)/e2p"
> ++	@$(MKDIR_P) $(DESTDIR)$(libdir) \
> + 		$(DESTDIR)$(includedir)/e2p $(DESTDIR)$(libdir)/pkgconfig
> +
> + install:: all installdirs
> +Index: e2fsprogs-1.41.4/lib/et/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/lib/et/Makefile.in	2008-10-07 15:22:39.000000000 +0100
> ++++ e2fsprogs-1.41.4/lib/et/Makefile.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -74,8 +74,8 @@
> + 	$(TAGS) $(SRCS)
> +
> + installdirs::
> +-	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/et $(datadir)/et $(bindir) $(man1dir) $(man3dir)"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
> ++	@echo "	MKDIR_P $(libdir) $(includedir)/et $(datadir)/et $(bindir) $(man1dir) $(man3dir)"
> ++	@$(MKDIR_P) $(DESTDIR)$(libdir) \
> + 		$(DESTDIR)$(includedir)/et $(DESTDIR)$(datadir)/et \
> + 		$(DESTDIR)$(bindir) $(DESTDIR)$(man1dir) \
> + 		$(DESTDIR)$(man3dir) $(DESTDIR)$(libdir)/pkgconfig
> +Index: e2fsprogs-1.41.4/lib/ext2fs/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/lib/ext2fs/Makefile.in	2008-10-07 15:22:39.000000000 +0100
> ++++ e2fsprogs-1.41.4/lib/ext2fs/Makefile.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -330,8 +330,8 @@
> + 	LD_LIBRARY_PATH=$(LIB) DYLD_LIBRARY_PATH=$(LIB) ./tst_csum
> +
> + installdirs::
> +-	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/ext2fs"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
> ++	@echo "	MKDIR_P $(libdir) $(includedir)/ext2fs"
> ++	@$(MKDIR_P) $(DESTDIR)$(libdir) \
> + 		$(DESTDIR)$(includedir)/ext2fs $(DESTDIR)$(libdir)/pkgconfig
> +
> + install:: all $(HFILES) $(HFILES_IN) installdirs ext2fs.pc
> +Index: e2fsprogs-1.41.4/lib/Makefile.elf-lib
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/lib/Makefile.elf-lib	2008-10-07 15:22:39.000000000 +0100
> ++++ e2fsprogs-1.41.4/lib/Makefile.elf-lib	2009-04-09 21:19:28.000000000 +0100
> +@@ -33,8 +33,8 @@
> + 	@$(LN) ../$(ELF_LIB) ../$(ELF_SONAME)
> +
> + installdirs-elf-lib::
> +-	@echo "	MKINSTALLDIRS $(ELF_INSTALL_DIR) $(libdir)"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(ELF_INSTALL_DIR) \
> ++	@echo "	MKDIR_P $(ELF_INSTALL_DIR) $(libdir)"
> ++	@$(MKDIR_P) $(DESTDIR)$(ELF_INSTALL_DIR) \
> + 		$(DESTDIR)$(libdir)
> +
> + installdirs:: installdirs-elf-lib
> +Index: e2fsprogs-1.41.4/lib/ss/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/lib/ss/Makefile.in	2008-10-07 15:22:39.000000000 +0100
> ++++ e2fsprogs-1.41.4/lib/ss/Makefile.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -129,8 +129,8 @@
> + 	@cd $(top_builddir); CONFIG_FILES=lib/ss/ss.pc ./config.status
> +
> + installdirs::
> +-	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/ss $(datadir)/ss $(bindir)"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir) \
> ++	@echo "	MKDIR_P $(libdir) $(includedir)/ss $(datadir)/ss $(bindir)"
> ++	@$(MKDIR_P) $(DESTDIR)$(libdir) \
> + 		$(DESTDIR)$(includedir)/ss $(DESTDIR)$(datadir)/ss \
> + 		$(DESTDIR)$(bindir) $(DESTDIR)$(libdir)/pkgconfig
> +
> +Index: e2fsprogs-1.41.4/lib/uuid/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/lib/uuid/Makefile.in	2008-02-19 04:33:10.000000000 +0000
> ++++ e2fsprogs-1.41.4/lib/uuid/Makefile.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -126,8 +126,8 @@
> + 	@cd $(top_builddir); CONFIG_FILES=lib/uuid/uuid.pc ./config.status
> +
> + installdirs::
> +-	@echo "	MKINSTALLDIRS $(libdir) $(includedir)/uuid $(man3dir)"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(libdir)  \
> ++	@echo "	MKDIR_P $(libdir) $(includedir)/uuid $(man3dir)"
> ++	@$(MKDIR_P) $(DESTDIR)$(libdir)  \
> + 		$(DESTDIR)$(includedir)/uuid $(DESTDIR)$(man3dir) \
> + 		$(DESTDIR)$(libdir)/pkgconfig
> +
> +Index: e2fsprogs-1.41.4/MCONFIG.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/MCONFIG.in	2008-11-15 17:17:22.000000000 +0000
> ++++ e2fsprogs-1.41.4/MCONFIG.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -64,7 +64,7 @@
> + INSTALL_PROGRAM = @INSTALL_PROGRAM@
> + INSTALL_DATA = @INSTALL_DATA@
> + INSTALL_SCRIPT = @INSTALL_SCRIPT@
> +-MKINSTALLDIRS = @MKINSTALLDIRS@
> ++MKDIR_P = @MKDIR_P@
> +
> + #
> + # Library definitions
> +Index: e2fsprogs-1.41.4/misc/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/misc/Makefile.in	2008-11-15 17:33:33.000000000 +0000
> ++++ e2fsprogs-1.41.4/misc/Makefile.in	2009-04-09 21:21:22.000000000 +0100
> +@@ -366,8 +366,8 @@
> + 	@$(SUBSTITUTE_UPTIME) $(srcdir)/filefrag.8.in filefrag.8
> +
> + installdirs:
> +-	@echo "	MKINSTALLDIRS $(sbindir) $(root_sbindir) $(bindir) $(man1dir) $(man8dir) $(libdir) $(root_sysconfdir)"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(sbindir) \
> ++	@echo "	MKDIR_P $(sbindir) $(root_sbindir) $(bindir) $(man1dir) $(man8dir) $(libdir) $(root_sysconfdir)"
> ++	@$(MKDIR_P) $(DESTDIR)$(sbindir) \
> + 		$(DESTDIR)$(root_sbindir) $(DESTDIR)$(bindir) \
> + 		$(DESTDIR)$(man1dir) $(DESTDIR)$(man8dir) \
> + 		$(DESTDIR)$(man1dir) $(DESTDIR)$(man5dir) \
> +Index: e2fsprogs-1.41.4/po/Makefile.in.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/po/Makefile.in.in	2007-06-30 13:58:34.000000000 +0100
> ++++ e2fsprogs-1.41.4/po/Makefile.in.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -26,11 +26,10 @@
> + datadir = @datadir@
> + localedir = $(datadir)/locale
> + gettextsrcdir = $(datadir)/gettext/po
> ++mkdir_p = @MKDIR_P@
> +
> + INSTALL = @INSTALL@
> + INSTALL_DATA = @INSTALL_DATA@
> +-MKINSTALLDIRS = @MKINSTALLDIRS@
> +-mkinstalldirs = $(SHELL) $(MKINSTALLDIRS)
> +
> + GMSGFMT = @GMSGFMT@
> + MSGFMT = @MSGFMT@
> +@@ -148,7 +147,7 @@
> + install-exec:
> + install-data: install-data-@USE_NLS@
> + 	if test "$(PACKAGE)" = "gettext-tools"; then \
> +-	  $(mkinstalldirs) $(DESTDIR)$(gettextsrcdir); \
> ++	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
> + 	  for file in $(DISTFILES.common) Makevars.template; do \
> + 	    $(INSTALL_DATA) $(srcdir)/$$file \
> + 			    $(DESTDIR)$(gettextsrcdir)/$$file; \
> +@@ -161,13 +160,13 @@
> + 	fi
> + install-data-no: all
> + install-data-yes: all
> +-	$(mkinstalldirs) $(DESTDIR)$(datadir)
> ++	$(mkdir_p) $(DESTDIR)$(datadir)
> + 	@catalogs='$(CATALOGS)'; \
> + 	for cat in $$catalogs; do \
> + 	  cat=`basename $$cat`; \
> + 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
> + 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
> +-	  $(mkinstalldirs) $(DESTDIR)$$dir; \
> ++	  $(mkdir_p) $(DESTDIR)$$dir; \
> + 	  if test -r $$cat; then realcat=$$cat; else realcat=$(srcdir)/$$cat; fi; \
> + 	  $(INSTALL_DATA) $$realcat $(DESTDIR)$$dir/$(DOMAIN).mo; \
> + 	  echo "installing $$realcat as $(DESTDIR)$$dir/$(DOMAIN).mo"; \
> +@@ -207,19 +206,19 @@
> + installdirs-exec:
> + installdirs-data: installdirs-data-@USE_NLS@
> + 	if test "$(PACKAGE)" = "gettext-tools"; then \
> +-	  $(mkinstalldirs) $(DESTDIR)$(gettextsrcdir); \
> ++	  $(mkdir_p) $(DESTDIR)$(gettextsrcdir); \
> + 	else \
> + 	  : ; \
> + 	fi
> + installdirs-data-no:
> + installdirs-data-yes:
> +-	$(mkinstalldirs) $(DESTDIR)$(datadir)
> ++	$(mkdir_p) $(DESTDIR)$(datadir)
> + 	@catalogs='$(CATALOGS)'; \
> + 	for cat in $$catalogs; do \
> + 	  cat=`basename $$cat`; \
> + 	  lang=`echo $$cat | sed -e 's/\.gmo$$//'`; \
> + 	  dir=$(localedir)/$$lang/LC_MESSAGES; \
> +-	  $(mkinstalldirs) $(DESTDIR)$$dir; \
> ++	  $(mkdir_p) $(DESTDIR)$$dir; \
> + 	  for lc in '' $(EXTRA_LOCALE_CATEGORIES); do \
> + 	    if test -n "$$lc"; then \
> + 	      if (cd $(DESTDIR)$(localedir)/$$lang&&  LC_ALL=C ls -l -d $$lc 2>/dev/null) | grep ' ->  '>/dev/null; then \
> +Index: e2fsprogs-1.41.4/resize/Makefile.in
> +===================================================================
> +--- e2fsprogs-1.41.4.orig/resize/Makefile.in	2007-06-30 13:58:35.000000000 +0100
> ++++ e2fsprogs-1.41.4/resize/Makefile.in	2009-04-09 21:19:28.000000000 +0100
> +@@ -57,8 +57,8 @@
> + 	@$(CC) $(ALL_LDFLAGS) -o test_extent $(TEST_EXTENT_OBJS) $(LIBS)
> +
> + installdirs:
> +-	@echo "	MKINSTALLDIRS $(root_sbindir) $(man8dir)"
> +-	@$(MKINSTALLDIRS) $(DESTDIR)$(root_sbindir) \
> ++	@echo "	MKDIR_P $(root_sbindir) $(man8dir)"
> ++	@$(MKDIR_P) $(DESTDIR)$(root_sbindir) \
> + 		$(DESTDIR)$(man8dir)
> +
> + install: $(PROGS) $(MANPAGES) installdirs
> diff --git a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb b/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
> index dda4b81..177d9af 100644
> --- a/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
> +++ b/recipes/e2fsprogs/e2fsprogs_1.41.4.bb
> @@ -1,15 +1,8 @@
>   require e2fsprogs.inc
>
> -PR = "r1"
> +SRC_URI += "file://mkinstalldirs.patch;patch=1"
>
> -#SRC_URI += "file://no-hardlinks.patch;patch=1 \
> -#	    file://mkinstalldirs.patch;patch=1 \
> -#	   "
> -
> -do_configure() {
> -	# avoid autoreconf
> -	oe_runconf $@
> -}
> +PR = "r2"
>
>   do_compile_prepend () {
>   	find ./ -print|xargs chmod u=rwX




