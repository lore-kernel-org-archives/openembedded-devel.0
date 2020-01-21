Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4E73B7FD53
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:04:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id d139so1433835wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 23:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+G4s0ZeiEnFwkmQnnvJ6Y5OqtGhUBNqIOJiKvaiVez4=;
	b=FNdpFdYU/Lit/Z9yDUhBv1dGTpUeGPoMiwF0lA/85V+8WcVtRFsr+ntocUiau4tkiv
	p/jTxgEDGG5uk3FNkgpCrMbHFGkVTYyBlL1lSXPOkifJbtDYEc9rk3dZqEU48FQq+qm9
	19m1NKev1bzza69aOFRyQFt43GMK8H6o9tb9iBSJyh8nI1lRZa551nXWbC48zbwsn1zo
	8BVwqOTAzBONphyJ4ZS68NifFMNj8cqFrPhKlAvHi0P0QrLOyzGhROQ2IL6P9SdX/Y5h
	rxqkZvCi1Od1CEDc/MSiI3DtFqAuagJ4ksJGX+ETI1/rP9pFvW4Wsr005dbAJYA0I3em
	YEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+G4s0ZeiEnFwkmQnnvJ6Y5OqtGhUBNqIOJiKvaiVez4=;
	b=JhNR5rg8tkP0UtPdr5CEtuZPv1dSFAMxFXaaUaMkzN4gppWB8a+dEct/25Eb2QUlUq
	bzypah7md5MISwEuDcrfuxK3Q1lhBjCyJP2RwXd6DM76MTbvIuIPG6N8cB3gmSBOzqxb
	4LAQpAyCWBbImoMNA7hKmi6lg7OthAPPMm08quhL740yVHFsC6VkcY8WNWl4qypTzrlh
	hxBjqYaVJ8H/2r5QOMqcJL+NuqaplZ4q0rxOaf4sHjm35oTeJ6sZhnOQ+IEwBaXY3hLe
	TRN/Gi231189yENyqC8NFHMDbp2IaDwgjJYEtehRtoAa3UVnEYF0dztdiamq8CF7/X8X
	WXRQ==
X-Gm-Message-State: APjAAAW8eeOD9PMK6dk6RtaPYaXmPNShV0+vtIx3/Mit43LskeUjuRgf
	DqMuK4qEtoz3BzgCQbK5wKgwEL/Sd1s=
X-Google-Smtp-Source: APXvYqx0B13i62Ej/xqyP2gaGD4L8+vFMiwPOP6QlnhSJQrnzwu7wxf+1qwfsjcT9GQdmyT6Yjcj0A==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr2764486wmc.21.1579590278577; 
	Mon, 20 Jan 2020 23:04:38 -0800 (PST)
Received: from superandy.speedport.ip ([2003:f0:7f3c:a181:cd3d:6aad:9ff5:758d])
	by smtp.gmail.com with ESMTPSA id
	e16sm51237593wrs.73.2020.01.20.23.04.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 23:04:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Tue, 21 Jan 2020 08:04:17 +0100
Message-Id: <20200121070418.2197-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2] autoconf-2.13-native: initial add
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
X-List-Received-Date: Tue, 21 Jan 2020 07:04:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This ancient version of autoconf is a requirement when building mozjs from
firefox-esr sources.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../autoconf-2.13-native_2.13.bb              | 67 +++++++++++++++++++
 ....guess-config.sub-install-to-destdir.patch | 67 +++++++++++++++++++
 2 files changed, 134 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
 create mode 100644 meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13/0001-Add-config.guess-config.sub-install-to-destdir.patch

diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
new file mode 100644
index 000000000..a54a7331d
--- /dev/null
+++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13-native_2.13.bb
@@ -0,0 +1,67 @@
+SUMMARY = "A GNU tool that produce shell scripts to automatically configure software"
+DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \ 
+configure software source code packages. Autoconf creates a configuration script for a package from a template \
+file that lists the operating system features that the package can use, in the form of M4 macro calls."
+SECTION = "devel"
+
+HOMEPAGE = "http://www.gnu.org/software/autoconf/"
+
+LICENSE = "GPLv3"
+LICENSE = "GPLv2 & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
+
+SRC_URI = " \
+    ${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
+    file://0001-Add-config.guess-config.sub-install-to-destdir.patch \
+"
+
+S = "${WORKDIR}/${BPN}"
+SRC_URI[md5sum] = "9de56d4a161a723228220b0f425dc711"
+SRC_URI[sha256sum] = "f0611136bee505811e9ca11ca7ac188ef5323a8e2ef19cffd3edb3cf08fd791e"
+
+inherit native texinfo
+
+DEPENDS += "m4-native gnu-config-native"
+RDEPENDS_${PN} = "m4-native gnu-config-native"
+
+PERL = "${USRBINPATH}/perl"
+
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
+
+CONFIGUREOPTS = " \
+    --build=${BUILD_SYS} \
+    --host=${HOST_SYS} \
+    --target=${TARGET_SYS} \
+    --prefix=${prefix} \
+    --exec_prefix=${exec_prefix} \
+    --bindir=${bindir} \
+    --sbindir=${sbindir} \
+    --libexecdir=${libexecdir} \
+    --datadir=${datadir} \
+    --sysconfdir=${sysconfdir} \
+    --sharedstatedir=${sharedstatedir} \
+    --localstatedir=${localstatedir} \
+    --libdir=${libdir} \
+    --includedir=${includedir} \
+    --oldincludedir=${oldincludedir} \
+    --infodir=${infodir} \
+    --mandir=${mandir} \
+    --disable-silent-rules \
+"
+
+EXTRA_OECONF += "ac_cv_path_M4=m4 ac_cv_prog_TEST_EMACS=no"
+
+do_configure() {
+    ./configure ${CONFIGUREOPTS}
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+
+    # avoid conflicts with standard autotools
+    ver="213"
+    for file in `find ${D}${bindir} -type f`; do
+        mv $file $file$ver
+    done
+	mv ${D}${datadir}/autoconf ${D}${datadir}/autoconf213
+}
diff --git a/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13/0001-Add-config.guess-config.sub-install-to-destdir.patch b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13/0001-Add-config.guess-config.sub-install-to-destdir.patch
new file mode 100644
index 000000000..f6e9ecb9a
--- /dev/null
+++ b/meta-oe/recipes-devtools/autoconf-2.13/autoconf-2.13/0001-Add-config.guess-config.sub-install-to-destdir.patch
@@ -0,0 +1,67 @@
+From 3d3e23f7b14e87849405a4e109a69b76696615fc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Wed, 11 Dec 2019 23:18:19 +0100
+Subject: [PATCH] Add config.guess config.sub / install to destdir
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [Configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ Makefile.in | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index a6c94d4..4b1b708 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -137,23 +137,23 @@ installcheck: all install
+ 	cd testsuite && ${MAKE} AUTOCONF=${bindir}/autoconf $@
+ 
+ installdirs:
+-	$(SHELL) ${srcdir}/mkinstalldirs $(bindir) $(infodir) $(acdatadir)
++	$(SHELL) ${srcdir}/mkinstalldirs ${DESTDIR}$(bindir) ${DESTDIR}$(infodir) ${DESTDIR}$(acdatadir)
+ 
+ install: all $(M4FILES) acconfig.h installdirs install-info
+ 	for p in $(ASCRIPTS); do \
+-	  $(INSTALL_PROGRAM) $$p $(bindir)/`echo $$p|sed '$(transform)'`; \
++	  $(INSTALL_PROGRAM) $$p ${DESTDIR}$(bindir)/`echo $$p|sed '$(transform)'`; \
+ 	done
+ 	for i in $(M4FROZEN); do \
+-	  $(INSTALL_DATA) $$i $(acdatadir)/$$i; \
++	  $(INSTALL_DATA) $$i ${DESTDIR}$(acdatadir)/$$i; \
+ 	done
+ 	for i in $(M4FILES) acconfig.h; do \
+-	  $(INSTALL_DATA) $(srcdir)/$$i $(acdatadir)/$$i; \
++	  $(INSTALL_DATA) $(srcdir)/$$i ${DESTDIR}$(acdatadir)/$$i; \
+ 	done
+ 	-if test -f autoscan; then \
+-	$(INSTALL_PROGRAM) autoscan $(bindir)/`echo autoscan|sed '$(transform)'`; \
++	$(INSTALL_PROGRAM) autoscan ${DESTDIR}$(bindir)/`echo autoscan|sed '$(transform)'`; \
+ 	for i in acfunctions acheaders acidentifiers acprograms \
+-	  acmakevars; do \
+-	$(INSTALL_DATA) $(srcdir)/$$i $(acdatadir)/$$i; \
++	  acmakevars config.guess config.sub; do \
++	$(INSTALL_DATA) $(srcdir)/$$i ${DESTDIR}$(acdatadir)/$$i; \
+ 	done; \
+ 	else :; fi
+ 
+@@ -161,11 +161,11 @@ install: all $(M4FILES) acconfig.h installdirs install-info
+ install-info: info installdirs
+ 	if test -f autoconf.info; then \
+ 	  for i in *.info*; do \
+-	    $(INSTALL_DATA) $$i $(infodir)/$$i; \
++	    $(INSTALL_DATA) $$i ${DESTDIR}$(infodir)/$$i; \
+ 	  done; \
+ 	else \
+ 	  for i in $(srcdir)/*.info*; do \
+-	    $(INSTALL_DATA) $$i $(infodir)/`echo $$i | sed 's|^$(srcdir)/||'`; \
++	    $(INSTALL_DATA) $$i ${DESTDIR}$(infodir)/`echo $$i | sed 's|^$(srcdir)/||'`; \
+ 	  done; \
+ 	fi
+ 
+-- 
+2.21.0
+
-- 
2.21.0


