Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UVP9U-0005TS-BJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Apr 2013 18:36:09 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so1319874eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Apr 2013 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=HLM4SwcT9EwLQ8BGOdMH90yiuhJ6zB+kqreT4JpAlH0=;
	b=nKskuxbq5GIIhRkadu5kVNYkPqGl8GVIA31XDii469tHdJg8pGfxNvDLli0TPLRAK4
	Hp1piRJ0HQpdzML+h8JNI8N0PhlXiGnGPy/fNWd8chsuQ5avACwUD9SWQO6Im06qglPA
	fnVsqhxu8lY0+ACI0f7EzAbCFq7pVElsRprIhBuaec7jpcNE0fZD4JJ32WT4AOb9PsKm
	gESC2Z5VJJZpfEgnHgAWQlQ1TQH+T0pqM3Hv0MP/58Mv2Wz49ThMqZNqDrqoBMK34K0m
	WFdOFkV9Ppgkr1aMIE77L2vlo+AZRordOPDB8BsGboaNuhMzFqi9JpfkPfcof6rTf+x0
	xyAw==
X-Received: by 10.15.102.3 with SMTP id bq3mr77085417eeb.42.1366906704812;
	Thu, 25 Apr 2013 09:18:24 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id cd3sm11122257eeb.6.2013.04.25.09.18.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 25 Apr 2013 09:18:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2013 18:16:01 +0200
Message-Id: <1366906562-30093-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe 1/2] networkmanager: update to 0.9.8.0
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
X-List-Received-Date: Thu, 25 Apr 2013 16:36:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested for eth0 / hidden WLAN on overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...o-run-sbin-dhclient-to-get-the-version-nu.patch |   44 +++---
 ...ger.service-remove-reference-to-NetworkMa.patch |   32 ++++
 ...se-struct-ifpppstatsreq-that-was-removed-.patch |   48 ------
 .../networkmanager/networkmanager/gtk-doc.make     |  173 --------------------
 ...anager_0.9.2.0.bb => networkmanager_0.9.8.0.bb} |   67 ++++----
 5 files changed, 92 insertions(+), 272 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch
 delete mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/gtk-doc.make
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_0.9.2.0.bb => networkmanager_0.9.8.0.bb} (54%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
index 4356982..5c9ed92 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
@@ -1,32 +1,36 @@
-From 6e7ff802b689df18d7bd1d1a83639925371650cc Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Thu, 17 Nov 2011 11:17:42 +0100
-Subject: [PATCH] don't try to run /sbin/dhclient to get the version number, this break cross-compiling
+From 7dd40db6606c3b3559365a03944cb99aee5ceabc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 4 Apr 2013 12:57:58 +0200
+Subject: [PATCH] don't try to run /sbin/dhclient to get the version number,
+ this break cross-compiling
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
-Upstream-Status: Unknown
+Upstream-Status: Inappropriate [build system specific]
 
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
  configure.ac |    6 ------
  1 files changed, 0 insertions(+), 6 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 5ee0cb0..b727db7 100644
+index cc66e9b..7163287 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -497,12 +497,6 @@ case "${with_dhclient}" in
- 	/*)
- 		DHCLIENT_PATH="${with_dhclient}"
- 		DHCLIENT_VERSION=4
--		if test -x "${with_dhclient}"; then
--			case `"${with_dhclient}" --version 2>&1` in
--				"isc-dhclient-4"*) DHCLIENT_VERSION=4; break;;
--				"isc-dhclient-V3"*) DHCLIENT_VERSION=3; break;;
--			esac
+@@ -488,12 +488,6 @@ AS_IF([test -z "$with_dhcpcd"], with_dhcpcd=yes)
+ # Search and check the executables
+ if test "$with_dhclient" = "yes"; then
+ 	AC_PATH_PROGS(with_dhclient, dhclient, no, /sbin:/usr/sbin:/usr/local/sbin)
+-	if test "$with_dhclient" != "no"; then
+-		if ! $with_dhclient --version 2>&1 | grep -q "^isc-dhclient-4\."; then
+-			AC_MSG_WARN([Cannot use dhclient, version 4.x is required])
+-			with_dhclient=no
 -		fi
- 		AC_MSG_NOTICE(using dhclient at ${DHCLIENT_PATH})
- 		;;
- 	no)	AC_MSG_NOTICE(dhclient support disabled)
+-	fi
+ fi
+ if test "$with_dhcpcd" = "yes"; then
+ 	AC_PATH_PROGS(with_dhcpcd, dhcpcd, no, /sbin:/usr/sbin:/usr/local/sbin)
 -- 
-1.7.2.5
+1.7.6.5
 
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch
new file mode 100644
index 0000000..bbcd021
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-NetworkManager.service-remove-reference-to-NetworkMa.patch
@@ -0,0 +1,32 @@
+From 1137846f778dc9f3be0c89cb2df18d3a37f844d7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 19 Apr 2013 18:34:09 +0200
+Subject: [PATCH] NetworkManager.service: remove reference to
+ NetworkManager-wait-online.service
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* NetworkManager-wait-online.service crashes
+* NetworkManager works fine without NetworkManager-wait-online
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ data/NetworkManager.service.in |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/data/NetworkManager.service.in b/data/NetworkManager.service.in
+index 16b53b6..a2e913c 100644
+--- a/data/NetworkManager.service.in
++++ b/data/NetworkManager.service.in
+@@ -18,5 +18,4 @@ KillMode=process
+ [Install]
+ WantedBy=multi-user.target
+ Alias=dbus-org.freedesktop.NetworkManager.service
+-Also=NetworkManager-wait-online.service
+ 
+-- 
+1.7.4.4
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch
deleted file mode 100644
index e2f43f3..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ji=C5=99=C3=AD=20Klime=C5=A1?= <jklimes@redhat.com>
-Date: Wed, 28 Mar 2012 16:42:24 +0200
-Subject: [PATCH 7/9] ppp: don't use struct ifpppstatsreq that was removed
- from linux/ip_ppp.h
-
-in recent kernels.
-
-We can use ifreq and ppp_stats structures separately. They needn't have to
-to be packed in a structure.
----
-Upstream-Status: Backport [1]
-[1] http://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=6b64e4db2f3c9cfc0e0e240cf0bc58f3b3e90c1f
- src/ppp-manager/nm-ppp-manager.c |   12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/src/ppp-manager/nm-ppp-manager.c b/src/ppp-manager/nm-ppp-manager.c
-index 59698c3..243d2e1 100644
---- a/src/ppp-manager/nm-ppp-manager.c
-+++ b/src/ppp-manager/nm-ppp-manager.c
-@@ -304,18 +304,20 @@ monitor_cb (gpointer user_data)
- {
- 	NMPPPManager *manager = NM_PPP_MANAGER (user_data);
- 	NMPPPManagerPrivate *priv = NM_PPP_MANAGER_GET_PRIVATE (manager);
--	struct ifpppstatsreq req;
-+	struct ifreq req;
-+	struct ppp_stats stats;
- 
- 	memset (&req, 0, sizeof (req));
--	req.stats_ptr = (caddr_t) &req.stats;
-+	memset (&stats, 0, sizeof (stats));
-+	req.ifr_data = (caddr_t) &stats;
- 
--	strncpy (req.ifr__name, priv->ip_iface, sizeof (req.ifr__name));
-+	strncpy (req.ifr_name, priv->ip_iface, sizeof (req.ifr_name));
- 	if (ioctl (priv->monitor_fd, SIOCGPPPSTATS, &req) < 0) {
- 		nm_log_warn (LOGD_PPP, "could not read ppp stats: %s", strerror (errno));
- 	} else {
- 		g_signal_emit (manager, signals[STATS], 0, 
--		               req.stats.p.ppp_ibytes,
--		               req.stats.p.ppp_obytes);
-+		               stats.p.ppp_ibytes,
-+		               stats.p.ppp_obytes);
- 	}
- 
- 	return TRUE;
--- 
-1.7.9.4
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/gtk-doc.make b/meta-oe/recipes-connectivity/networkmanager/networkmanager/gtk-doc.make
deleted file mode 100644
index 354ffb7..0000000
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager/gtk-doc.make
+++ /dev/null
@@ -1,173 +0,0 @@
-# -*- mode: makefile -*-
-
-####################################
-# Everything below here is generic #
-####################################
-
-if GTK_DOC_USE_LIBTOOL
-GTKDOC_CC = $(LIBTOOL) --mode=compile $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(LIBTOOL) --mode=link $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
-else
-GTKDOC_CC = $(CC) $(INCLUDES) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-GTKDOC_LD = $(CC) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
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
-	   $(srcdir)/tmpl.stamp $(srcdir)/sgml.stamp $(srcdir)/html.stamp
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
-all-local: html-build.stamp
-else
-all-local:
-endif
-
-docs: html-build.stamp
-
-#### scan ####
-
-scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
-	@echo 'gtk-doc: Scanning header files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	  gtkdoc-scan --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --ignore-headers="$(IGNORE_HFILES)" $(SCAN_OPTIONS) $(EXTRA_HFILES)
-	if grep -l '^..*$$' $(srcdir)/$(DOC_MODULE).types > /dev/null 2>&1 ; then \
-	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" CFLAGS="$(GTKDOC_CFLAGS)" LDFLAGS="$(GTKDOC_LIBS)" gtkdoc-scangobj $(SCANGOBJ_OPTIONS) --module=$(DOC_MODULE) --output-dir=$(srcdir) ; \
-	else \
-	    cd $(srcdir) ; \
-	    for i in $(SCANOBJ_FILES) ; do \
-               test -f $$i || touch $$i ; \
-	    done \
-	fi
-	touch scan-build.stamp
-
-$(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt: scan-build.stamp
-	@true
-
-#### templates ####
-
-tmpl-build.stamp: $(DOC_MODULE)-decl.txt $(SCANOBJ_FILES) $(DOC_MODULE)-sections.txt $(DOC_MODULE)-overrides.txt
-	@echo 'gtk-doc: Rebuilding template files'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && gtkdoc-mktmpl --module=$(DOC_MODULE) $(MKTMPL_OPTIONS)
-	touch tmpl-build.stamp
-
-tmpl.stamp: tmpl-build.stamp
-	@true
-
-tmpl/*.sgml:
-	@true
-
-
-#### xml ####
-
-sgml-build.stamp: tmpl.stamp $(HFILE_GLOB) $(CFILE_GLOB) $(DOC_MODULE)-sections.txt $(srcdir)/tmpl/*.sgml $(expand_content_files)
-	@echo 'gtk-doc: Building XML'
-	@-chmod -R u+w $(srcdir)
-	cd $(srcdir) && \
-	gtkdoc-mkdb --module=$(DOC_MODULE) --source-dir=$(DOC_SOURCE_DIR) --output-format=xml --expand-content-files="$(expand_content_files)" --main-sgml-file=$(DOC_MAIN_SGML_FILE) $(MKDB_OPTIONS)
-	touch sgml-build.stamp
-
-sgml.stamp: sgml-build.stamp
-	@true
-
-#### html ####
-
-html-build.stamp: sgml.stamp $(DOC_MAIN_SGML_FILE) $(content_files)
-	@echo 'gtk-doc: Building HTML'
-	@-chmod -R u+w $(srcdir)
-	rm -rf $(srcdir)/html
-	mkdir $(srcdir)/html
-	cd $(srcdir)/html && gtkdoc-mkhtml $(DOC_MODULE) ../$(DOC_MAIN_SGML_FILE)
-	test "x$(HTML_IMAGES)" = "x" || ( cd $(srcdir) && cp $(HTML_IMAGES) html )
-	@echo 'gtk-doc: Fixing cross-references'
-	cd $(srcdir) && gtkdoc-fixxref --module-dir=html --html-dir=$(HTML_DIR) $(FIXXREF_OPTIONS)
-	touch html-build.stamp
-
-##############
-
-clean-local:
-	rm -f *~ *.bak
-	rm -rf .libs
-
-distclean-local:
-	cd $(srcdir) && \
-	  rm -rf xml $(REPORT_FILES) \
-	         $(DOC_MODULE)-decl-list.txt $(DOC_MODULE)-decl.txt
-
-maintainer-clean-local: clean
-	cd $(srcdir) && rm -rf xml html
-
-install-data-local:
-	-installfiles=`echo $(srcdir)/html/*`; \
-	if test "$$installfiles" = '$(srcdir)/html/*'; \
-	then echo '-- Nothing to install' ; \
-	else \
-	  $(mkinstalldirs) $(DESTDIR)$(TARGET_DIR); \
-	  for i in $$installfiles; do \
-	    echo '-- Installing '$$i ; \
-	    $(INSTALL_DATA) $$i $(DESTDIR)$(TARGET_DIR); \
-	  done; \
-	  echo '-- Installing $(srcdir)/html/index.sgml' ; \
-	  $(INSTALL_DATA) $(srcdir)/html/index.sgml $(DESTDIR)$(TARGET_DIR) || :; \
-	  which gtkdoc-rebase >/dev/null && \
-	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
-	fi
-	
-
-uninstall-local:
-	rm -f $(DESTDIR)$(TARGET_DIR)/*
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
-	mkdir $(distdir)/xml
-	mkdir $(distdir)/html
-	-cp $(srcdir)/tmpl/*.sgml $(distdir)/tmpl
-	-cp $(srcdir)/xml/*.xml $(distdir)/xml
-	cp $(srcdir)/html/* $(distdir)/html
-	-cp $(srcdir)/$(DOC_MODULE).types $(distdir)/
-	-cp $(srcdir)/$(DOC_MODULE)-sections.txt $(distdir)/
-	cd $(distdir) && rm -f $(DISTCLEANFILES)
-	-gtkdoc-rebase --online --relative --html-dir=$(distdir)/html
-
-.PHONY : dist-hook-local docs
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
similarity index 54%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
index e63955d..5b53f7f 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.8.0.bb
@@ -4,26 +4,28 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-PR = "r11"
-
 DEPENDS = "libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 inherit gnome gettext systemd
 
-SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.bz2 \
+SRC_URI = " \
+    ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
-    file://0002-ppp-don-t-use-struct-ifpppstatsreq-that-was-removed-.patch \
-    file://gtk-doc.make \
+    file://0002-NetworkManager.service-remove-reference-to-NetworkMa.patch \
 "
-SRC_URI[md5sum] = "bc0b00b8a187762d93c50a9706b4c5c3"
-SRC_URI[sha256sum] = "a178ed2f0b5a1045ec47b217ea531d0feba9208f6bcfe64b701174a5c1479816"
+SRC_URI[md5sum] = "38d28f6bd9220d85dfff47210706195c"
+SRC_URI[sha256sum] = "c366bcded6354d8186ad93c05d26d6a20bc550aa0391f974704e7a60e9f6096b"
 
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
 EXTRA_OECONF = " \
-    --with-distro=debian \
+    --enable-ifupdown \
+    --disable-ifcfg-rh \
+    --disable-ifnet \
+    --disable-ifcfg-suse \
+    --with-netconfig \
     --with-crypto=gnutls \
     --disable-more-warnings \
     --with-dhclient=${base_sbindir}/dhclient \
@@ -33,17 +35,12 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-do_configure_prepend() {
-    cp ${WORKDIR}/gtk-doc.make ${S}/
-    echo "EXTRA_DIST = version.xml" > gnome-doc-utils.make
-    sed -i -e 's:man \\:man:' -e s:docs::g ${S}/Makefile.am
-    sed -i -e /^docs/d ${S}/configure.ac
-}
-
 # Work around dbus permission problems since we lack a proper at_console
 do_install_prepend() {
-    sed -i -e s:deny:allow:g ${S}/src/NetworkManager.conf
-    sed -i -e s:deny:allow:g ${S}/callouts/nm-dispatcher.conf
+    sed -i 's:deny send_destination:allow send_destination:g' ${S}/src/org.freedesktop.NetworkManager.conf
+    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callouts/nm-dispatcher.conf
+    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callouts/nm-dhcp-client.conf
+    sed -i 's:deny send_destination:allow send_destination:g' ${S}/callouts/nm-avahi-autoipd.conf
 }
 
 do_install_append () {
@@ -52,18 +49,16 @@ do_install_append () {
     install -d ${D}/usr/bin
     install -m 0755 ${S}/test/.libs/libnm* ${D}/usr/bin
 
-    install -d ${D}/etc/NetworkManager/
-
     # Install an empty VPN folder as nm-connection-editor will happily segfault without it :o.
     # With or without VPN support built in ;).
     install -d ${D}/etc/NetworkManager/VPN
 }
 
-PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests" 
+PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests ${PN}-bash-completion"
 
 FILES_libnmutil += "${libdir}/libnm-util.so.*"
-FILES_libnmglib += "${libdir}/libnm_glib.so.*"
-FILES_libnmglib-vpn += "${libdir}/libnm_glib_vpn.so.*"
+FILES_libnmglib += "${libdir}/libnm-glib.so.*"
+FILES_libnmglib-vpn += "${libdir}/libnm-glib-vpn.so.*"
 
 FILES_${PN} += " \
     ${libexecdir} \
@@ -77,19 +72,29 @@ FILES_${PN} += " \
 
 RRECOMMENDS_${PN} += "iptables"
 RCONFLICTS_${PN} = "connman"
-RDEPENDS_${PN} = "wpa-supplicant dhcp-client \
+RDEPENDS_${PN} = " \
+    wpa-supplicant \
+    dhcp-client \
     ${@base_contains('COMBINED_FEATURES', '3gmodem', 'ppp', '', d)} \
 "
 
-FILES_${PN}-dbg += "${libdir}/NetworkManager/.debug/ \
-                    ${libdir}/pppd/*/.debug/ "
+FILES_${PN}-dbg += " \
+    ${libdir}/NetworkManager/.debug/ \
+    ${libdir}/pppd/*/.debug/ \
+"
+
+FILES_${PN}-dev += " \
+    ${datadir}/NetworkManager/gdb-cmd \
+    ${libdir}/pppd/*/*.la \
+    ${libdir}/NetworkManager/*.la \
+"
 
-FILES_${PN}-dev += "${datadir}/NetworkManager/gdb-cmd \
-                    ${libdir}/pppd/*/*.la \
-                    ${libdir}/NetworkManager/*.la"
+FILES_${PN}-tests = " \
+    ${bindir}/nm-tool \
+    ${bindir}/libnm-glib-test \
+    ${bindir}/nm-online \
+"
 
-FILES_${PN}-tests = "${bindir}/nm-tool \
-                     ${bindir}/libnm_glib_test \
-                     ${bindir}/nm-online"
+FILES_${PN}-bash-completion = "${datadir}/bash-completion"
 
 SYSTEMD_SERVICE_${PN} = "NetworkManager.service"
-- 
1.7.6.5



