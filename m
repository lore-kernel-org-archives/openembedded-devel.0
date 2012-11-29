Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Te3OB-0007VC-JJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2012 13:38:51 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5575397eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2012 04:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=cZbSfkBCeGrPWfu2OEgnuqPcpsYQowtPsOeapgz4wp4=;
	b=C4efYxiiLrRbIU/Vwza+8z08aVTnTU5kb2wTQW7Or5gI4V1P9GBEa7vUu6zGtNX7af
	s+rvAT6WQfojz1cSXQpF4mHvekZ7bNpaYHOr20VMcPRbOPyPcbiMRZnTH8v/0uxrHPC8
	oH+1+n64S2jZB8qR5Y3K081ymQ8Ij7I+jnLXqkwrIIkjIZuZ8A3wAVoG8I4DCNFwBagM
	LeZ0cERPkqppQEZigzjJqfKq9RmS1dTBhoSb3cqGJNbBQBPiEziwETqDb5E3KSg0d6aD
	GaH9qLAH8K2+G6E6bvB7rqKngHNJ1ZtakfxUrumcf46AKUQ3vBg2w3jxwzFUH5Nmv16v
	YCpw==
Received: by 10.14.199.134 with SMTP id x6mr81745257een.31.1354191871962;
	Thu, 29 Nov 2012 04:24:31 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a44sm3282914eeo.7.2012.11.29.04.24.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 04:24:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Nov 2012 13:24:26 +0100
Message-Id: <1354191866-30369-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][RFC] udev: remove from meta-oe
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
X-List-Received-Date: Thu, 29 Nov 2012 12:38:51 -0000

* udev-182 is now also in oe-core, there is quite big diff between meta-oe version and oe-core version
  but I guess that most of meta-oe users are now also using meta-systemd layer and udev provided by systemd recipe

* sending as RFC because I'm using udev provided by systemd recipe
  and cannot test this properly on my targets, please test and report

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-generation-it-depends-on-a-working-docto.patch |  45 ----
 meta-oe/recipes-core/udev/udev/cache               |  24 ---
 meta-oe/recipes-core/udev/udev/default             |   4 -
 meta-oe/recipes-core/udev/udev/gtk-doc.make        | 230 ---------------------
 meta-oe/recipes-core/udev/udev/init                |  73 -------
 meta-oe/recipes-core/udev/udev/modprobe.rules      |  17 --
 meta-oe/recipes-core/udev/udev/touchscreen.rules   |  18 --
 meta-oe/recipes-core/udev/udev_173.bb              | 116 -----------
 meta-oe/recipes-core/udev/udev_175.bb              |  91 --------
 meta-oe/recipes-core/udev/udev_182.bb              |  86 --------
 10 files changed, 704 deletions(-)
 delete mode 100644 meta-oe/recipes-core/udev/udev/0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch
 delete mode 100644 meta-oe/recipes-core/udev/udev/cache
 delete mode 100644 meta-oe/recipes-core/udev/udev/default
 delete mode 100644 meta-oe/recipes-core/udev/udev/gtk-doc.make
 delete mode 100644 meta-oe/recipes-core/udev/udev/init
 delete mode 100644 meta-oe/recipes-core/udev/udev/modprobe.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev/touchscreen.rules
 delete mode 100644 meta-oe/recipes-core/udev/udev_173.bb
 delete mode 100644 meta-oe/recipes-core/udev/udev_175.bb
 delete mode 100644 meta-oe/recipes-core/udev/udev_182.bb

diff --git a/meta-oe/recipes-core/udev/udev/0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch b/meta-oe/recipes-core/udev/udev/0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch
deleted file mode 100644
index baf5acd..0000000
--- a/meta-oe/recipes-core/udev/udev/0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 85dcc3a22951d3586b05e3305d735f33b84ee3e5 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 16 May 2011 14:11:01 +0200
-Subject: [PATCH] rip put doc generation, it depends on a working doctools setup
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- Makefile.am |   21 +--------------------
- 1 files changed, 1 insertions(+), 20 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 651a154..69eb9d9 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -174,26 +174,7 @@ udev_udevadm_LDADD = libudev/libudev-private.la
- # ------------------------------------------------------------------------------
- # udev man pages
- # ------------------------------------------------------------------------------
--dist_man_MANS = \
--	udev/udev.7 \
--	udev/udevadm.8 \
--	udev/udevd.8
--
--dist_noinst_DATA = \
--	udev/udev.html \
--	udev/udevadm.html \
--	udev/udevd.html
--
--EXTRA_DIST += \
--	udev/udev.xml \
--	udev/udevadm.xml \
--	udev/udevd.xml
--
--udev/%.7 udev/%.8 : udev/%.xml
--	$(AM_V_GEN)$(XSLTPROC) -o $@ -nonet http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl $<
--
--udev/%.html : udev/%.xml
--	$(AM_V_GEN)$(XSLTPROC) -o $@ -nonet http://docbook.sourceforge.net/release/xsl/current/xhtml-1_1/docbook.xsl $<
-+dist_man_MANS = 
- 
- # ------------------------------------------------------------------------------
- # udev tests
--- 
-1.6.6.1
-
diff --git a/meta-oe/recipes-core/udev/udev/cache b/meta-oe/recipes-core/udev/udev/cache
deleted file mode 100644
index 6936170..0000000
--- a/meta-oe/recipes-core/udev/udev/cache
+++ /dev/null
@@ -1,24 +0,0 @@
-#!/bin/sh -e
-
-export TZ=/etc/localtime
-
-[ -f /etc/default/udev ] && . /etc/default/udev
-
-echo "Caching udev devnodes"
-
-if [ "$DEVCACHE" != "" ]; then
-	echo -n "Populating dev cache"
-	(cd /; tar cf $DEVCACHE dev)
-	mv /tmp/uname /etc/udev/saved.uname
-	mv /tmp/cmdline /etc/udev/saved.cmdline
-	mv /tmp/devices /etc/udev/saved.devices
-	mv /tmp/atags /etc/udev/saved.atags
-	echo
-else
-	rm -f /tmp/uname
-	rm -f /tmp/cmdline
-	rm -f /tmp/devices
-	rm -f /tmp/atags
-fi
-
-exit 0
diff --git a/meta-oe/recipes-core/udev/udev/default b/meta-oe/recipes-core/udev/udev/default
deleted file mode 100644
index 5c4937a..0000000
--- a/meta-oe/recipes-core/udev/udev/default
+++ /dev/null
@@ -1,4 +0,0 @@
-# Default for /etc/init.d/udev
-
-# Comment this out to disable device cache
-DEVCACHE="/etc/dev.tar"
diff --git a/meta-oe/recipes-core/udev/udev/gtk-doc.make b/meta-oe/recipes-core/udev/udev/gtk-doc.make
deleted file mode 100644
index 57fab98..0000000
--- a/meta-oe/recipes-core/udev/udev/gtk-doc.make
+++ /dev/null
@@ -1,230 +0,0 @@
-# -*- mode: makefile -*-
-
-####################################
-# Everything below here is generic #
-####################################
-
-if GTK_DOC_USE_LIBTOOL
-GTKDOC_CC = $(LIBTOOL) --tag=CC --mode=compile $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(LIBTOOL) --tag=CC --mode=link $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-GTKDOC_RUN = $(LIBTOOL) --mode=execute
-else
-GTKDOC_CC = $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-GTKDOC_RUN =
-endif
-
-# We set GPATH here; this gives us semantics for GNU make
-# which are more like other make's VPATH, when it comes to
-# whether a source that is a target of one rule is then
-# searched for in VPATH/GPATH.
-#
-GPATH = $(srcdir)
-
-TARGET_DIR=$(HTML_DIR)/$(DOC_MODULE)
-
-EXTRA_DIST = 				\
-	$(content_files)		\
-	$(HTML_IMAGES)			\
-	$(DOC_MAIN_SGML_FILE)		\
-	$(DOC_MODULE)-sections.txt	\
-	$(DOC_MODULE)-overrides.txt
-
-DOC_STAMPS=scan-build.stamp tmpl-build.stamp sgml-build.stamp html-build.stamp \
-	pdf-build.stamp \
-	$(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp \
-	$(srcdir)/pdf.stamp
-
-SCANOBJ_FILES = 		 \
-	$(DOC_MODULE).args 	 \
-	$(DOC_MODULE).hierarchy  \
-	$(DOC_MODULE).interfaces \
-	$(DOC_MODULE).prerequisites \
-	$(DOC_MODULE).signals
-
-REPORT_FILES = \
-	$(DOC_MODULE)-undocumented.txt \
-	$(DOC_MODULE)-undeclared.txt \
-	$(DOC_MODULE)-unused.txt
-
-CLEANFILES = $(SCANOBJ_FILES) $(REPORT_FILES) $(DOC_STAMPS)
-
-if ENABLE_GTK_DOC
-if GTK_DOC_BUILD_HTML
-HTML_BUILD_STAMP=html-build.stamp
-else
-HTML_BUILD_STAMP=
-endif
-if GTK_DOC_BUILD_PDF
-PDF_BUILD_STAMP=pdf-build.stamp
-else
-PDF_BUILD_STAMP=
-endif
-
-all-local: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
-else
-all-local:
-endif
-
-docs: $(HTML_BUILD_STAMP) $(PDF_BUILD_STAMP)
-
-$(REPORT_FILES): sgml-build.stamp
-
-#### scan ####
-
-scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
-	@echo 'gtk-doc: Scanning header files'
-	@-chmod -R u+w $(srcdir)
-	@_source_dir='' ; for i in $(DOC_SOURCE_DIR) ; do \
-	    _source_dir="$${_source_dir} --source-dir=$$i" ; \
-	  done ; \
-	  cd $(srcdir) && \
-	  gtkdoc-scan --module=$(DOC_MODULE) --ignore-headers="$(IGNORE_HFILES)" $${_source_dir} $(SCAN_OPTIONS) $(EXTRA_HFILES)
-	@if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; then \
-	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" RUN="$(GTKDOC_RUN)" CFLAGS="$(GTKDOC_CFLAGS) $(CFLAGS)" LDFLAGS="$(GTKDOC_LIBS) $(LDFLAGS)" gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=$(DOC_MODULE) --output-dir=$(srcdir) ; \
-	else \
-	    cd $(srcdir) ; \
-	    for i in $(SCANOBJ_FILES) ; do \
-               test -f $$i || touch $$i ; \
-	    done \
-	fi
-	@touch scan-build.stamp
-
-$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt: scan-build.stamp
-	@true
-
-#### templates ####
-
-tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
-	@echo 'gtk-doc: Rebuilding template files'
-	@-chmod -R u+w $(srcdir)
-	@cd $(srcdir) && gtkdoc-mktmpl --module=$(DOC_MODULE) $(MKTMPL_OPTIONS)
-	@touch tmpl-build.stamp
-
-tmpl.stamp: tmpl-build.stamp
-	@true
-
-$(srcdir)/tmpl/*.sgml:
-	@true
-
-#### xml ####
-
-sgml-build.stamp: tmpl.stamp $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expand_content_files)
-	@echo 'gtk-doc: Building XML'
-	@-chmod -R u+w $(srcdir)
-	@_source_dir='' ; for i in $(DOC_SOURCE_DIR) ; do \
-	    _source_dir="$${_source_dir} --source-dir=$$i" ; \
-	  done ; \
-	  cd $(srcdir) && \
-	  gtkdoc-mkdb --module=$(DOC_MODULE) --output-format=xml --expand-content-files="$(expand_content_files)" --main-sgml-file=$(DOC_MAIN_SGML_FILE) $${_source_dir} $(MKDB_OPTIONS)
-	@touch sgml-build.stamp
-
-sgml.stamp: sgml-build.stamp
-	@true
-
-#### html ####
-
-html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
-	@echo 'gtk-doc: Building HTML'
-	@-chmod -R u+w $(srcdir)
-	@rm -rf $(srcdir)/html
-	@mkdir $(srcdir)/html
-	@mkhtml_options=""; \
-	gtkdoc-mkhtml 2>&1 --help | grep  >/dev/null "\-\-path"; \
-	if test "$(?)" = "0"; then \
-	  mkhtml_options=--path="$(srcdir)"; \
-	fi; \
-	cd $(srcdir)/html && gtkdoc-mkhtml $$mkhtml_options $(MKHTML_OPTIONS) $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
-	@test "x$(HTML_IMAGES)" = "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) html )
-	@echo 'gtk-doc: Fixing cross-references'
-	@cd $(srcdir) && gtkdoc-fixxref --module=$(DOC_MODULE) --module-dir=html --html-dir=$(HTML_DIR) $(FIXXREF_OPTIONS)
-	@touch html-build.stamp
-
-#### pdf ####
-
-pdf-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
-	@echo 'gtk-doc: Building PDF'
-	@-chmod -R u+w $(srcdir)
-	@rm -rf $(srcdir)/$(DOC_MODULE).pdf
-	@mkpdf_imgdirs=""; \
-	if test "x$(HTML_IMAGES)" != "x"; then \
-	  for img in $(HTML_IMAGES); do \
-	    part=`dirname $$img`; \
-	    echo $$mkpdf_imgdirs | grep >/dev/null "\-\-imgdir=$$part "; \
-	    if test $$? != 0; then \
-	      mkpdf_imgdirs="$$mkpdf_imgdirs --imgdir=$$part"; \
-	    fi; \
-	  done; \
-	fi; \
-	cd $(srcdir) && gtkdoc-mkpdf --path="$(abs_srcdir)" $$mkpdf_imgdirs $(DOC_MODULE) $(DOC_MAIN_SGML_FILE) $(MKPDF_OPTIONS)
-	@touch pdf-build.stamp
-
-##############
-
-clean-local:
-	rm -f *~ *.bak
-	rm -rf .libs
-
-distclean-local:
-	cd $(srcdir) && \
-	  rm -rf xml $(REPORT_FILES) $(DOC_MODULE).pdf \
-	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
-
-maintainer-clean-local: clean
-	cd $(srcdir) && rm -rf xml html
-
-install-data-local:
-	@installfiles=`echo $(srcdir)/html/*`; \
-	if test "$$installfiles" = '$(srcdir)/html/*'; \
-	then echo '-- Nothing to install' ; \
-	else \
-	  if test -n "$(DOC_MODULE_VERSION)"; then \
-	    installdir="$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
-	  else \
-	    installdir="$(DESTDIR)$(TARGET_DIR)"; \
-	  fi; \
-	  $(mkinstalldirs) $${installdir} ; \
-	  for i in $$installfiles; do \
-	    echo '-- Installing '$$i ; \
-	    $(INSTALL_DATA) $$i $${installdir}; \
-	  done; \
-	  if test -n "$(DOC_MODULE_VERSION)"; then \
-	    mv -f $${installdir}/$(DOC_MODULE).devhelp2 \
-	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp2; \
-	    mv -f $${installdir}/$(DOC_MODULE).devhelp \
-	      $${installdir}/$(DOC_MODULE)-$(DOC_MODULE_VERSION).devhelp; \
-	  fi; \
-	  $(GTKDOC_REBASE) --relative --dest-dir=$(DESTDIR) --html-dir=$${installdir}; \
-	fi
-
-uninstall-local:
-	@if test -n "$(DOC_MODULE_VERSION)"; then \
-	  installdir="$(DESTDIR)$(TARGET_DIR)-$(DOC_MODULE_VERSION)"; \
-	else \
-	  installdir="$(DESTDIR)$(TARGET_DIR)"; \
-	fi; \
-	rm -rf $${installdir}
-
-#
-# Require gtk-doc when making dist
-#
-if ENABLE_GTK_DOC
-dist-check-gtkdoc:
-else
-dist-check-gtkdoc:
-	@echo "*** gtk-doc must be installed and enabled in order to make dist"
-	@false
-endif
-
-dist-hook: dist-check-gtkdoc dist-hook-local
-	mkdir $(distdir)/tmpl
-	mkdir $(distdir)/html
-	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
-	cp $(srcdir)/html/* $(distdir)/html
-	-cp $(srcdir)/$(DOC_MODULE).pdf $(distdir)/
-	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
-	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
-	cd $(distdir) && rm -f $(DISTCLEANFILES)
-	$(GTKDOC_REBASE) --online --relative --html-dir=$(distdir)/html
-
-.PHONY : dist-hook-local docs
diff --git a/meta-oe/recipes-core/udev/udev/init b/meta-oe/recipes-core/udev/udev/init
deleted file mode 100644
index d160300..0000000
--- a/meta-oe/recipes-core/udev/udev/init
+++ /dev/null
@@ -1,73 +0,0 @@
-#!/bin/sh
-
-### BEGIN INIT INFO
-# Provides:          udev
-# Required-Start:    mountvirtfs
-# Required-Stop:     
-# Default-Start:     S
-# Default-Stop:
-# Short-Description: Start udevd, populate /dev and load drivers.
-### END INIT INFO
-
-export TZ=/etc/localtime
-
-[ -d /sys/class ] || exit 1
-[ -r /proc/mounts ] || exit 1
-[ -x /sbin/udevd ] || exit 1
-[ -f /etc/default/udev ] && . /etc/default/udev
-[ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
-
-kill_udevd() {
-	pid=`pidof -x udevd`
-	[ -n "$pid" ] && kill $pid
-}
-
-export ACTION=add
-# propagate /dev from /sys
-echo "Starting udev"
-
-# mount the tmpfs on /dev, if not already done
-LANG=C awk "\$2 == \"/dev\" && \$3 == \"tmpfs\" { exit 1 }" /proc/mounts && {
-	mount -n -o mode=0755 -t tmpfs none "/dev"
-	mkdir -m 0755 /dev/pts
-	mkdir -m 1777 /dev/shm
-}
-
-if [ "$DEVCACHE" != "" ]; then
-	# Invalidate udev cache if the kernel or its bootargs/cmdline have changed
-	[ -x /bin/uname ] && /bin/uname -mrspv > /tmp/uname || touch /tmp/uname
-	[ -r /proc/cmdline ] && cat /proc/cmdline > /tmp/cmdline || touch /tmp/cmdline
-	[ -r /proc/devices ] && cat /proc/devices > /tmp/devices || touch /tmp/devices
-	[ -r /proc/atags ] && cat /proc/atags > /tmp/atags || touch /tmp/atags
-	if [ -e $DEVCACHE ] && \
-		cmp -s /tmp/uname /etc/udev/saved.uname && \
-		cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
-		cmp -s /tmp/devices /etc/udev/saved.devices && \
-		cmp -s /tmp/atags /etc/udev/saved.atags; then
-		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
-		not_first_boot=1
-	fi
-fi
-
-if [ ! -e "/lib/modules/$(uname -r)"/modules.dep ] ; then
-	mkdir -p /lib/modules/$(uname -r)
-	depmod -ae
-fi
-
-# make_extra_nodes
-kill_udevd > "/dev/null" 2>&1
-
-# trigger the sorted events
-echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
-/sbin/udevd -d
-
-/sbin/udevadm control --env STARTUP=1
-if [ "$not_first_boot" != "" ];then
-	/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics	--subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform --action=add
-	(/sbin/udevadm settle --timeout=8; /sbin/udevadm control --env STARTUP=)&
-else
-	/sbin/udevadm trigger --action=add
-	/sbin/udevadm settle
-fi
-
-exit 0
diff --git a/meta-oe/recipes-core/udev/udev/modprobe.rules b/meta-oe/recipes-core/udev/udev/modprobe.rules
deleted file mode 100644
index d4a096b..0000000
--- a/meta-oe/recipes-core/udev/udev/modprobe.rules
+++ /dev/null
@@ -1,17 +0,0 @@
-# There are a number of modifiers that are allowed to be used in some
-# of the different fields. They provide the following subsitutions:
-#
-# %n the "kernel number" of the device.
-#    For example, 'sda3' has a "kernel number" of '3'
-# %e the smallest number for that name which does not matches an existing node
-# %k the kernel name for the device
-# %M the kernel major number for the device
-# %m the kernel minor number for the device
-# %b the bus id for the device
-# %c the string returned by the PROGRAM
-# %s{filename} the content of a sysfs attribute
-# %% the '%' char itself
-#
-
-# Try and modprobe for drivers for new hardware
-ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
diff --git a/meta-oe/recipes-core/udev/udev/touchscreen.rules b/meta-oe/recipes-core/udev/udev/touchscreen.rules
deleted file mode 100644
index d83fd16..0000000
--- a/meta-oe/recipes-core/udev/udev/touchscreen.rules
+++ /dev/null
@@ -1,18 +0,0 @@
-# There are a number of modifiers that are allowed to be used in some
-# of the different fields. They provide the following subsitutions:
-#
-# %n the "kernel number" of the device.
-#    For example, 'sda3' has a "kernel number" of '3'
-# %e the smallest number for that name which does not matches an existing node
-# %k the kernel name for the device
-# %M the kernel major number for the device
-# %m the kernel minor number for the device
-# %b the bus id for the device
-# %c the string returned by the PROGRAM
-# %s{filename} the content of a sysfs attribute
-# %% the '%' char itself
-#
-
-# Create a symlink to any touchscreen input device
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
-SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="ads7846", SYMLINK+="input/touchscreen0"
diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-core/udev/udev_173.bb
deleted file mode 100644
index 576302c..0000000
--- a/meta-oe/recipes-core/udev/udev_173.bb
+++ /dev/null
@@ -1,116 +0,0 @@
-DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
-/dev/, handles hotplug events and loads drivers at boot time. It replaces \
-the hotplug package and requires a kernel not older than 2.6.27."
-
-# udev 169 and up require kernel 2.6.36 for ARM: 
-# http://git.kernel.org/?p=linux/hotplug/udev.git;a=commit;h=67a77c8bf299f6264f001677becd056316ebce2f
-
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LICENSE_${PN} = "GPLv2+"
-LICENSE_libudev = "LGPLv2.1+"
-LICENSE_libgudev = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-# Needed for udev-extras
-DEPENDS = "gperf-native usbutils acl glib-2.0"
-
-PR = "r4"
-
-# version specific SRC_URI
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.bz2 \
-           file://0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch \
-           file://gtk-doc.make"
-
-# generic SRC_URI
-SRC_URI += " \
-       file://touchscreen.rules \
-       file://modprobe.rules \
-       file://default \
-       file://init \
-       file://cache \
-"
-
-SRC_URI[md5sum] = "2afd20ee1c790eac6d7abe0498ebb414"
-SRC_URI[sha256sum] = "0f753ad9c3022a074d1c052bcee9139581db825283771ac78c0be0d1de109d0c"
-
-# Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
-
-inherit update-rc.d autotools
-
-EXTRA_OECONF += " \
-                  --disable-introspection \
-                  --with-pci-ids-path=/usr/share/misc \
-                  ac_cv_file__usr_share_pci_ids=no \
-                  ac_cv_file__usr_share_hwdata_pci_ids=no \
-                  ac_cv_file__usr_share_misc_pci_ids=yes \
-                  --sbindir=${base_sbindir} \
-                  --libexecdir=${base_libdir}/udev \
-                  --with-rootlibdir=${base_libdir} \
-                  --disable-gtk-doc-html \
-                  --with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
-"
-
-do_configure_prepend() {
-	cp ${WORKDIR}/gtk-doc.make ${S}
-}
-
-INITSCRIPT_NAME = "udev"
-INITSCRIPT_PARAMS = "start 04 S ."
-
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit"
-
-FILES_${PN}-systemd = "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd += "udev"
-
-FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libgudev = "${base_libdir}/libgudev*.so.*"
-
-FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
-
-RPROVIDES_${PN} = "hotplug"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
-FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
-RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
-RRECOMMENDS_${PN} += "util-linux-blkid"
-
-# udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
-# is ${prefix}/lib64
-FILES_${PN} += "/lib/udev*"
-FILES_${PN}-dbg += "/lib/udev/.debug"
- 
-FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
-
-do_install () {
-	install -d ${D}${usrsbindir} \
-		   ${D}${sbindir}
-	oe_runmake 'DESTDIR=${D}' INSTALL=install install
-	install -d ${D}${sysconfdir}/init.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
-	install -m 0755 ${WORKDIR}/cache ${D}${sysconfdir}/init.d/udev-cache
-
-	install -d ${D}${sysconfdir}/default
-	install -m 0755 ${WORKDIR}/default ${D}${sysconfdir}/default/udev
-
-	install -m 0644 ${WORKDIR}/*.rules         ${D}${sysconfdir}/udev/rules.d/
-
-	touch ${D}${sysconfdir}/udev/saved.uname
-	touch ${D}${sysconfdir}/udev/saved.cmdline
-	touch ${D}${sysconfdir}/udev/saved.devices
-	touch ${D}${sysconfdir}/udev/saved.atags
-
-	# disable udev-cache sysv script on systemd installs
-	ln -sf /dev/null ${D}/${base_libdir}/systemd/system/udev-cache.service
-}
-
-# Create the cache after checkroot has run
-pkg_postinst_udev_append() {
-	if test "x$D" != "x"; then
-		OPT="-r $D"
-	else
-		OPT="-s"
-	fi
-	update-rc.d $OPT udev-cache start 36 S .
-}
diff --git a/meta-oe/recipes-core/udev/udev_175.bb b/meta-oe/recipes-core/udev/udev_175.bb
deleted file mode 100644
index 2550db2..0000000
--- a/meta-oe/recipes-core/udev/udev_175.bb
+++ /dev/null
@@ -1,91 +0,0 @@
-DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
-/dev/, handles hotplug events and loads drivers at boot time. It replaces \
-the hotplug package and requires a kernel not older than 2.6.27."
-
-DEFAULT_PREFERENCE = "-1"
-
-# udev 169 and up require kernel 2.6.36 for ARM: 
-# http://git.kernel.org/?p=linux/hotplug/udev.git;a=commit;h=67a77c8bf299f6264f001677becd056316ebce2f
-
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LICENSE_${PN} = "GPLv2+"
-LICENSE_libudev = "LGPLv2.1+"
-LICENSE_libgudev = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://libudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://extras/gudev/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
-
-# Needed for udev-extras
-DEPENDS = "gperf-native usbutils acl glib-2.0"
-
-PR = "r1"
-
-# 6f410b81aa6d588b03ae795c9b76468591ef7efa -> 175 tag
-SRCREV = "6f410b81aa6d588b03ae795c9b76468591ef7efa"
-
-# version specific SRC_URI
-SRC_URI = "git://git.kernel.org/pub/scm/linux/hotplug/udev.git;protocol=git \
-           file://0001-rip-put-doc-generation-it-depends-on-a-working-docto.patch \
-           file://gtk-doc.make"
-
-# generic SRC_URI
-SRC_URI += " \
-       file://touchscreen.rules \
-       file://modprobe.rules \
-"
-
-S = "${WORKDIR}/git"
-
-# Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
-
-inherit autotools
-
-EXTRA_OECONF += " \
-                  --disable-introspection \
-                  --with-pci-ids-path=/usr/share/misc \
-                  ac_cv_file__usr_share_pci_ids=no \
-                  ac_cv_file__usr_share_hwdata_pci_ids=no \
-                  ac_cv_file__usr_share_misc_pci_ids=yes \
-                  --sbindir=${base_sbindir} \
-                  --libexecdir=${base_libdir}/udev \
-                  --with-rootlibdir=${base_libdir} \
-                  --disable-gtk-doc-html \
-                  --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
-"
-
-do_configure_prepend() {
-	cp ${WORKDIR}/gtk-doc.make ${S}
-}
-
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit"
-
-FILES_${PN}-systemd = "${systemd_unitdir}"
-RDEPENDS_${PN}-systemd += "udev"
-
-FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libgudev = "${base_libdir}/libgudev*.so.*"
-
-FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
-
-RPROVIDES_${PN} = "hotplug"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
-FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
-RDEPENDS_${PN} += "module-init-tools-depmod udev-utils"
-RRECOMMENDS_${PN} += "util-linux-blkid"
-
-# udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
-# is ${prefix}/lib64
-FILES_${PN} += "/lib/udev*"
-FILES_${PN}-dbg += "/lib/udev/.debug"
- 
-FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
-
-do_install () {
-	install -d ${D}${usrsbindir} \
-		   ${D}${sbindir}
-	oe_runmake 'DESTDIR=${D}' INSTALL=install install
-
-	install -m 0644 ${WORKDIR}/*.rules         ${D}${sysconfdir}/udev/rules.d/
-}
-
diff --git a/meta-oe/recipes-core/udev/udev_182.bb b/meta-oe/recipes-core/udev/udev_182.bb
deleted file mode 100644
index 7d88aed..0000000
--- a/meta-oe/recipes-core/udev/udev_182.bb
+++ /dev/null
@@ -1,86 +0,0 @@
-DESCRIPTION = "udev is a daemon which dynamically creates and removes device nodes from \
-/dev/, handles hotplug events and loads drivers at boot time."
-
-# udev 169 and up require kernel 2.6.36 for ARM: 
-# http://git.kernel.org/?p=linux/hotplug/udev.git;a=commit;h=67a77c8bf299f6264f001677becd056316ebce2f
-
-LICENSE = "GPLv2+ & LGPLv2.1+"
-LICENSE_${PN} = "GPLv2+"
-LICENSE_libudev = "LGPLv2.1+"
-LICENSE_libgudev = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://src/COPYING;md5=17c4e5fb495e6707ac92a3864926f979 \
-                    file://src/gudev/COPYING;md5=fb494485a7d0505308cb68e4997cc266"
-
-PR = "r1"
-# glib-2.0: Needed for udev-extras
-# util-linux: Needed for libblkid
-# kmod: needed for libkmod
-DEPENDS = "gperf-native usbutils acl glib-2.0 util-linux kmod"
-
-# version specific SRC_URI
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/${P}.tar.gz \
-           file://gtk-doc.make"
-SRC_URI[md5sum] = "1b964456177fbf48023dfee7db3a708d"
-SRC_URI[sha256sum] = "7857ed19fafd8f3ca8de410194e8c7336e9eb8a20626ea8a4ba6449b017faba4"
-
-# generic SRC_URI
-SRC_URI += " \
-       file://touchscreen.rules \
-       file://modprobe.rules \
-"
-
-# Machine specific udev rules should be in their own recipe that ${PN} can add to RRECOMMENDS
-
-inherit autotools
-
-EXTRA_OECONF += " \
-                  --disable-introspection \
-                  --with-pci-ids-path=/usr/share/misc \
-                  ac_cv_file__usr_share_pci_ids=no \
-                  ac_cv_file__usr_share_hwdata_pci_ids=no \
-                  ac_cv_file__usr_share_misc_pci_ids=yes \
-                  --sbindir=${base_sbindir} \
-                  --libexecdir=${base_libdir} \
-                  --with-rootlibdir=${base_libdir} \
-                  --with-rootprefix= \
-                  --disable-gtk-doc-html \
-                  --with-systemdsystemunitdir=${systemd_unitdir}/system/ \
-"
-
-do_configure_prepend() {
-	cp ${WORKDIR}/gtk-doc.make ${S}
-}
-
-LDFLAGS_prepend-libc-uclibc = " -lrt "
-PACKAGES =+ "${PN}-systemd libudev libgudev udev-consolekit udev-utils"
-
-FILES_${PN}-systemd = "${systemd_unitdir}"
-RDEPENDS_${PN}-systemd += "udev"
-
-FILES_libudev = "${base_libdir}/libudev.so.*"
-FILES_libgudev = "${base_libdir}/libgudev*.so.*"
-
-RDEPENDS_${PN} += "udev-utils"
-RPROVIDES_${PN} = "hotplug"
-FILES_${PN} += "${usrbindir}/* ${usrsbindir}/udevd"
-FILES_${PN}-dbg += "${usrbindir}/.debug ${usrsbindir}/.debug"
-
-# udev installs binaries under $(udev_prefix)/lib/udev, even if ${libdir}
-# is ${prefix}/lib64
-FILES_${PN} += "/lib/udev*"
-FILES_${PN}-dbg += "/lib/udev/.debug"
-
-FILES_${PN}-consolekit += "${libdir}/ConsoleKit"
-RDEPENDS_${PN}-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
-
-FILES_udev-utils = "${bindir}/udevadm"
-
-do_install () {
-	install -d ${D}${usrsbindir} \
-		   ${D}${sbindir}
-	oe_runmake 'DESTDIR=${D}' INSTALL=install install
-
-	install -m 0644 ${WORKDIR}/*.rules         ${D}${sysconfdir}/udev/rules.d/
-}
-
-- 
1.8.0



