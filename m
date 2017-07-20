Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id BF6B96AC37
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 15:35:19 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id 33so15821431wrz.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Zy2nr+9JwzmbeOEUH6tmPXzW8HQBeqrExbwU/mWPJlo=;
	b=wN0Co7hvnjeHOE3ga5hoY4DLs49JyL0DGB4b2PCM3p4ZslHR9CbnsHIaCq63i/Lw91
	VSK8Gbrqjj50KraXKyANthpFW6811K1JAgdMAkbIeE2gcAf5ZCIZfluR3l+69k0izR2z
	99iuvDPdTNd34LpObxofzHxoPy/jCFwN10X/1Rd29njzYBKTEdG3mmKauV7i8BKTCqBa
	5aTAFSoi3DlsR6B15gGaM9+HEglg/jgQoVbh4tYwXK9JSwN71iBpQNBvT4b4ByOlzUVl
	GyUWLibRqi2o5kKEQi5YKjpstzgyGDzdkHKqOW2cxZ5It+TusHw7ydW0ich90bYGPL78
	vroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Zy2nr+9JwzmbeOEUH6tmPXzW8HQBeqrExbwU/mWPJlo=;
	b=AALob43XUHuH7ZEoWT8gB7piGWynqG45vkoqhTgc5OAxZnpKuRSOpgmhxRAgTXpjad
	XHUFo5cyQflv+hSC4O1VCV6+MVpApY0wra9a79nnjWU4MW6syRAbmx3pv4iBXylwlmHk
	EnkEyNr+KWHDHNKI7VB1uuqjrp4lum1+ySH17H/gnou0hh178bEVWZ0yicvfrWIwGILv
	9pM0fZ1fimc0NGlDm/JXXXgdLprMIx69uhFKtvSXppE+HdkhrsgsWPfB38EHJo/ibQFA
	hjW8mawjZQGXgL79+34RFAsL+gVsJrp/u/JaIoKXuAZ+wjX3846rFv4NFkSyaz5h2LXB
	pHDQ==
X-Gm-Message-State: AIVw111YiBlLdy25QfaXY5IP2Q42OjdOdJnM0j8J7umLP/rIHa6erNCM
	IuV7TkvfaT5Zf+2XVk0=
X-Received: by 10.223.173.246 with SMTP id w109mr7516293wrc.113.1500564919516; 
	Thu, 20 Jul 2017 08:35:19 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	190sm2853628wmh.36.2017.07.20.08.35.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Jul 2017 08:35:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:35:03 +0100
Message-Id: <20170720153508.23113-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170720153508.23113-1-ross.burton@intel.com>
References: <20170720153508.23113-1-ross.burton@intel.com>
Subject: [PATCH][meta-gnome 4/9] pimlico: remove (previously blacklisted)
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
X-List-Received-Date: Thu, 20 Jul 2017 15:35:20 -0000

The Pimlico Suite of Contacts/Dates/Tasks don't build and are unmaintained, so
remove them.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-gnome/pimlico/contacts.inc      |  28 -----------
 .../contacts-conditionally-install-schema.patch    |  37 --------------
 .../recipes-gnome/pimlico/contacts/make-382.patch  |  16 ------
 .../pimlico/contacts/stock_contact.png             | Bin 2311 -> 0 bytes
 .../pimlico/contacts/stock_person.png              | Bin 2280 -> 0 bytes
 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb   |  20 --------
 meta-gnome/recipes-gnome/pimlico/contacts_git.bb   |  19 --------
 meta-gnome/recipes-gnome/pimlico/dates.inc         |  11 -----
 .../dates/0001-Fix-format-security-warnings.patch  |  54 ---------------------
 .../dates/dso_linking_change_build_fix.patch       |  44 -----------------
 .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |  37 --------------
 meta-gnome/recipes-gnome/pimlico/dates_git.bb      |  18 -------
 meta-gnome/recipes-gnome/pimlico/tasks.inc         |  10 ----
 meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb     |  16 ------
 meta-gnome/recipes-gnome/pimlico/tasks_git.bb      |  12 -----
 15 files changed, 322 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts.inc
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/contacts-conditionally-install-schema.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/make-382.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts_git.bb
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates.inc
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/dates_git.bb
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/tasks.inc
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/tasks_git.bb

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts.inc b/meta-gnome/recipes-gnome/pimlico/contacts.inc
deleted file mode 100644
index fedd22332..000000000
--- a/meta-gnome/recipes-gnome/pimlico/contacts.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Address-book application."
-HOMEPAGE = "http://pimlico-project.org/contacts.html"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2 & GPLv2+ & GPLv3+ "
-SECTION = "x11"
-DEPENDS = "glib-2.0 gtk+ evolution-data-server intltool-native"
-RDEPENDS_${PN} = "libedata-book"
-
-inherit autotools pkgconfig gconf
-
-EXTRA_OECONF += "--disable-gnome-vfs"
-EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
-
-do_install_append () {
-    install -d ${D}/${datadir}/pixmaps
-    install -m 0644 ${WORKDIR}/stock_contact.png ${D}/${datadir}/pixmaps
-    install -m 0644 ${WORKDIR}/stock_person.png ${D}/${datadir}/pixmaps
-}
-
-FILES_${PN} += "${datadir}/pixmaps/stock_contact.png \
-        ${datadir}/pixmaps/stock_person.png \
-        ${datadir}/icons/hicolor"
-
-SRC_URI = "file://stock_contact.png \
-           file://stock_person.png \
-           file://contacts-conditionally-install-schema.patch \
-"
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/contacts-conditionally-install-schema.patch b/meta-gnome/recipes-gnome/pimlico/contacts/contacts-conditionally-install-schema.patch
deleted file mode 100644
index 2ab7882c8..000000000
--- a/meta-gnome/recipes-gnome/pimlico/contacts/contacts-conditionally-install-schema.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Install schema should respect to GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL
-
-If GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL is set, the schema should not
-be installed.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Upstream-Status: Pending
----
- data/Makefile.am |    7 ++++---
- 1 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/data/Makefile.am b/data/Makefile.am
-index f790823..b6fd643 100644
---- a/data/Makefile.am
-+++ b/data/Makefile.am
-@@ -14,13 +14,14 @@ dist_man1_MANS = contacts.1
- 
- if HAVE_GCONF
- install-data-local:
--	GCONF_CONFIG_SOURCE=$(GCONF_SCHEMA_CONFIG_SOURCE) \
-+	if [ "$(GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL)" != "1" ]; then \
-+		GCONF_CONFIG_SOURCE=$(GCONF_SCHEMA_CONFIG_SOURCE) \
- 		$(GCONFTOOL) --makefile-install-rule $(schema_DATA) || \
- 		(echo ;\
- 		echo "*****************************************************"; \
- 		echo "Installation of schemas failed, install them manually"; \
--		echo "*****************************************************";)
--		@true
-+		echo "*****************************************************";); \
-+	fi
- endif
- 
- CLEANFILES = $(desktop_DATA)
--- 
-1.7.7.6
-
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/make-382.patch b/meta-gnome/recipes-gnome/pimlico/contacts/make-382.patch
deleted file mode 100644
index a7cfee3a0..000000000
--- a/meta-gnome/recipes-gnome/pimlico/contacts/make-382.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Fix for stricter parser in make 3.82. This fix has been pushed to upstream git.
-
-JL - 15/12/10
-
-Upstream-Status: Accepted
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -11,4 +11,4 @@ DISTCLEANFILES = $(INTLTOOL_BUILT)
- MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp $(INTLTOOL_BUILT:=.in) install-sh ltmain.sh mkinstalldirs Makefile.in missing
- 
- snapshot:
--        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
-+	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png b/meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png
deleted file mode 100644
index 123b4485acaaaf665eb9dbff5e9f126a02e6e6d4..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 2311
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

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png b/meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png
deleted file mode 100644
index 2b1328b4e2cc6a131a7ff9df4722c6fa49b0a6f1..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 2280
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
CvpRJE

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
deleted file mode 100644
index 516cf93e4..000000000
--- a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require contacts.inc
-
-PR = "r8"
-
-SRC_URI =+ "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "aab5affbf93d6fa7b978b323a8d44de0"
-SRC_URI[sha256sum] = "9cacec98f8123993033aaa255f3f4c04c86a1be65e487dd21f0aaa54384a6f6d"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/contacts-main.h;endline=18;md5=0371af46fbc72e33575e0072dca5fb19 \
-                    file://src/contacts-dbus.c;endline=18;md5=e4da9ac1a0539fafc7df431010904fd5 \
-                    file://src/contacts-gtk.c;endline=21;md5=1c2e3f55b215635eff4ba76f7696f8ee"
-
-do_configure_prepend () {
-    # It used 8 spaces to instead of a tab, but it doesn't work for us
-    sed -i 's/^        $(MAKE) dist distdir=/\t$(MAKE) dist distdir/' Makefile.am
-}
-
-PNBLACKLIST[contacts] ?= "Fails to fetch, pimlico-project.org is gone http://errors.yoctoproject.org/Errors/Details/132854/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
deleted file mode 100644
index b46e9d9db..000000000
--- a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require contacts.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/contacts-main.h;endline=20;md5=9dc3531c914fb6d6d4a8d1aee4519fef \
-                    file://src/contacts-dbus.c;endline=20;md5=95e02d77f155fbd07a14dba3348b9b03 \
-                    file://src/contacts-gtk.c;endline=23;md5=e1ee9b9e72045f2d3aa44cf17313b46e"
-
-SRCREV = "19853893fdb595de6aa59db0d9dc2f9451ed2933"
-PV = "0.12+git${SRCPV}"
-PR = "r4"
-
-S = "${WORKDIR}/git"
-
-SRC_URI =+ "git://git.gnome.org/${BPN} \
-        file://make-382.patch"
-
-S = "${WORKDIR}/git"
-
-PNBLACKLIST[contacts] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132826/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/dates.inc b/meta-gnome/recipes-gnome/pimlico/dates.inc
deleted file mode 100644
index 12d2f83f9..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "Dates is a calendar application."
-HOMEPAGE = "http://pimlico-project.org/dates.html"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2 & GPLv2+ & LGPLv2+"
-
-SECTION = "x11"
-DEPENDS = "glib-2.0 gtk+ libglade evolution-data-server intltool-native"
-RDEPENDS_${PN} = "libedata-cal"
-
-inherit autotools gettext pkgconfig gtk-icon-cache
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch b/meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
deleted file mode 100644
index 4f551a7d8..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates/0001-Fix-format-security-warnings.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 687881c5fa342686c8724adcdac0f9d555a351c3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Apr 2017 18:10:57 -0700
-Subject: [PATCH] Fix format security warnings
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/dates_callbacks.c | 2 +-
- src/dates_gtk.c       | 2 +-
- src/gconf-bridge.c    | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/dates_callbacks.c b/src/dates_callbacks.c
-index d704c8f..46b8cb1 100644
---- a/src/dates_callbacks.c
-+++ b/src/dates_callbacks.c
-@@ -365,7 +365,7 @@ dates_about_cb (GtkWidget *widget, DatesData *d)
- 
- 	if (!pixb) {
- 		g_assert (error);
--		g_warning (error->message);
-+		g_warning ("%s", error->message);
- 		g_clear_error (&error);
- 	}
- 
-diff --git a/src/dates_gtk.c b/src/dates_gtk.c
-index 403bc25..fd691d2 100644
---- a/src/dates_gtk.c
-+++ b/src/dates_gtk.c
-@@ -1114,7 +1114,7 @@ calendar_do_edit_dialog_response_cb (GtkDialog *dialog, gint response_id, gpoint
- 				GTK_DIALOG_MODAL | GTK_DIALOG_DESTROY_WITH_PARENT,
- 				GTK_MESSAGE_WARNING,
- 				GTK_BUTTONS_NONE,
--				prompt);
-+				"%s", prompt);
- 
- 		g_free (prompt);
- 
-diff --git a/src/gconf-bridge.c b/src/gconf-bridge.c
-index 49754cf..67d3757 100644
---- a/src/gconf-bridge.c
-+++ b/src/gconf-bridge.c
-@@ -1220,7 +1220,7 @@ error_handler (GConfClient *client,
-                 dlg = gtk_message_dialog_new (NULL, 0,
-                                               GTK_MESSAGE_ERROR,
-                                               GTK_BUTTONS_OK,
--                                              message);
-+                                              "%s", message);
-                 g_free (message);
- 
-                 gtk_message_dialog_format_secondary_text
--- 
-2.12.2
-
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch b/meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
deleted file mode 100644
index 649d59d91..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-after gcc linking has changed, all the libraries must be explicitely specified 
-This patch avoids these linking errors:
-
-
-| make[2]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/dates-0.4.11+git0+514185dc1f6588085fda41eb59898b93d0487dd4-r2/git/src'^M
-...
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: e: invalid DSO for symbol `pow@@GLIBC_2.0' definition^M
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libm.so: could not read symbols: Bad value^M
-| collect2: ld returned 1 exit status^M
-| make[2]: *** [dates] Error 1
-
-
-
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: z: invalid DSO for symbol `pango_layout_get_extents' definition
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpango-1.0.so: could not read symbols: Bad value
-| collect2: ld returned 1 exit status
-| make[2]: *** [dates] Error 1
-
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/11
-
-Update:
-This is identified as a libtool issue. While creating the libgtkdatesview.la 
-file, libtool should have added these needed libraries in there.
- A bug has been created for this issue: 
-   http://bugzilla.pokylinux.org/show_bug.cgi?id=664
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/19
-
-Upstream-Status: Pending
-
-Index: git/src/Makefile.am
-===================================================================
---- git.orig/src/Makefile.am
-+++ git/src/Makefile.am
-@@ -34,6 +34,6 @@ dates_SOURCES = $(platform) 	\
- 	gconf-bridge.h		\
- 	gconf-bridge.c
- 
--dates_LDADD = $(DATES_LIBS) $(OWL_LIBS) libgtkdatesview.la
-+dates_LDADD = $(DATES_LIBS) $(OWL_LIBS) libgtkdatesview.la -lm -lpango-1.0
- 
- MAINTAINERCLEANFILES = config.h.in Makefile.in
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch b/meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
deleted file mode 100644
index 6ade4708f..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-uclibc has langinfo.h but it does not define _NL_TIME_FIRST_WEEKDAY
-therefore we introduce a check in configure for the this define
-and then we make sure that we use it when it really exists
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2011-07-18 10:34:15.000000000 -0700
-+++ git/configure.ac	2011-07-18 10:54:26.403798188 -0700
-@@ -98,6 +98,8 @@
- 		src/libgtkdatesview.pc
- ])
- 
-+AC_CHECK_DECLS([_NL_TIME_FIRST_WEEKDAY],[],[],[[#include <langinfo.h>]])
-+
- AC_OUTPUT
- 
- echo " "
-Index: git/src/dates_view.c
-===================================================================
---- git.orig/src/dates_view.c	2011-07-18 10:34:15.000000000 -0700
-+++ git/src/dates_view.c	2011-07-18 10:58:46.093798136 -0700
-@@ -1505,7 +1505,11 @@
- 	priv->days = 1;
- 	priv->months = 0;
- 	priv->months_in_row = 4;
-+#if HAVE_DECL__NL_TIME_FIRST_WEEKDAY
- 	priv->week_start = *nl_langinfo (_NL_TIME_FIRST_WEEKDAY) - 1;
-+#else
-+	priv->week_start = 0;
-+#endif
- 	priv->dragbox = TRUE;
- 	priv->single_click = TRUE;
- 	priv->double_click = FALSE;
diff --git a/meta-gnome/recipes-gnome/pimlico/dates_git.bb b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
deleted file mode 100644
index 14965e94f..000000000
--- a/meta-gnome/recipes-gnome/pimlico/dates_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require dates.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://src/dates_view.h;endline=22;md5=29f934f356eb970309cdeb6693b3123a \
-                    file://src/dates_hildon.c;endline=19;md5=63938904198b25de429abb65fbdbdb8a \
-                    file://src/gconf-bridge.c;endline=22;md5=ad7626c6daf4aec590474a243f4912fa"
-
-SRCREV = "c8e30fa3211dcdfcda48184f4c57746a552b9c7a"
-PV = "0.4.11+git${SRCPV}"
-PR = "r9"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = "git://git.gnome.org/${BPN} \
-           file://dso_linking_change_build_fix.patch \
-           file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
-           file://0001-Fix-format-security-warnings.patch \
-           "
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks.inc b/meta-gnome/recipes-gnome/pimlico/tasks.inc
deleted file mode 100644
index f8217dc3a..000000000
--- a/meta-gnome/recipes-gnome/pimlico/tasks.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "Task list application"
-HOMEPAGE = "http://pimlico-project.org/tasks.html"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2 & GPLv2+"
-
-SECTION = "x11"
-DEPENDS = "glib-2.0 gtk+ evolution-data-server intltool-native"
-
-inherit autotools pkgconfig gtk-icon-cache
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb b/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
deleted file mode 100644
index 42c20c47e..000000000
--- a/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require tasks.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/gtk/main.c;endline=19;md5=8659d0b7fd68a2ad6ac30c6539ea5b82 \
-                    file://src/omoko/openmoko-tasks.c;endline=20;md5=04d56a46863c9f4247694f40257a836a \
-                    file://src/hildon/hildon-tasks.c;endline=21;md5=488ddf31dc14b2196dec7cc736211b52"
-
-SRC_URI = "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "0afd969758561599fd782e1effb39c08"
-SRC_URI[sha256sum] = "1a7fdc5f95a2193a1a25fdb13f071867fb7e42245ce19ccee4bcccb69e557f2e"
-
-PR = "r3"
-
-# tasks-0.19/libkoto/koto-utils.c:81:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-PNBLACKLIST[tasks] ?= "Fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_git.bb b/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
deleted file mode 100644
index b71f1dc5b..000000000
--- a/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require tasks.inc
-
-SRC_URI = "git://git.gnome.org/${BPN}"
-
-SRCREV = "ea52d46d691c5fce4473ea4e24a35411381f3a65"
-PV = "0.13+git${SRCPV}"
-PR = "r3"
-
-S = "${WORKDIR}/git"
-
-# ../../git/libkoto/koto-utils.c:81:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-PNBLACKLIST[tasks] ?= "Fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.11.0


