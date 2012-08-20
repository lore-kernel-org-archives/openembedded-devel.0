Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T3UXM-0002fB-GT
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 18:09:09 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 20 Aug 2012 08:55:57 -0700
Received: by weyt11 with SMTP id t11so3607853wey.25
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 08:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=PDN3jCQsq1/mY4aiga3WggyETKfDbOKM+EKVNIrV//8=;
	b=ps8fJ0ZfWg7krH4QSkRn/PHGrO13xuHXAS4/E+zf7iuYVkktJQ1RKPYZyZLclOiTph
	qTX/2GCh9U0jR2IvyHXJNWycAOQCSEsxM8fLktS3nXLsfWuCIKJPs9O3F2FKdqeOd4XY
	JWwuSLP6+kpg3HR1uAvkkBu1WHssZQ3eQmoGQ8iOR32p2KHK+dnMdo0ehrscdUjWTK4V
	2V6OqMzc/d9KKd1jqKiUdbBzjmUf7PTbpL0UU/xo8jIiyjdCvBhp+g3oahNXpTtt/eqQ
	IKvy2yJH0EzvTItzniIALn28svuupv9W2QnegSNXikMFbxj/4+ZXUVmOvfpPH0EAPYtb
	jiGA==
Received: by 10.180.14.9 with SMTP id l9mr29964866wic.21.1345478155632;
	Mon, 20 Aug 2012 08:55:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dc3sm28598653wib.7.2012.08.20.08.55.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 08:55:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 16:55:20 +0100
Message-Id: <1345478120-9425-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQl15JkHxDntHQtWRLTgcIi82PeThxYvSo/dkmXccrhzQhG7l3vkFwjqYkfoV8o/7S7oYQFF
Subject: [PATCH] meta-gnome: add Pimlico (contacts, dates, tasks)
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
X-List-Received-Date: Mon, 20 Aug 2012 16:09:09 -0000

This has just been removed from oe-core and some people are still using the
applications.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-gnome/recipes-gnome/pimlico/contacts.inc      |   34 ++++++++++
 .../contacts-conditionally-install-schema.patch    |   37 +++++++++++
 .../contacts/contacts-owl-window-menu.patch        |   54 ++++++++++++++++
 .../recipes-gnome/pimlico/contacts/make-382.patch  |   16 +++++
 .../pimlico/contacts/stock_contact.png             |  Bin 0 -> 2311 bytes
 .../pimlico/contacts/stock_person.png              |  Bin 0 -> 2280 bytes
 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb   |   18 ++++++
 meta-gnome/recipes-gnome/pimlico/contacts_git.bb   |   19 ++++++
 meta-gnome/recipes-gnome/pimlico/dates.inc         |   20 ++++++
 .../pimlico/dates/dates-owl-window-menu.patch      |   67 ++++++++++++++++++++
 .../dates/dso_linking_change_build_fix.patch       |   44 +++++++++++++
 .../recipes-gnome/pimlico/dates/make-382.patch     |   18 ++++++
 .../uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch      |   37 +++++++++++
 meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb    |    5 ++
 meta-gnome/recipes-gnome/pimlico/dates_git.bb      |   18 ++++++
 meta-gnome/recipes-gnome/pimlico/tasks.inc         |   16 +++++
 .../recipes-gnome/pimlico/tasks/tasks-owl.diff     |   67 ++++++++++++++++++++
 meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb     |   15 +++++
 meta-gnome/recipes-gnome/pimlico/tasks_git.bb      |    9 +++
 19 files changed, 494 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts.inc
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/contacts-conditionally-install-schema.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/contacts-owl-window-menu.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/make-382.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/contacts_git.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates.inc
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/dates-owl-window-menu.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/make-382.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/dates_git.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/tasks.inc
 create mode 100644 meta-gnome/recipes-gnome/pimlico/tasks/tasks-owl.diff
 create mode 100644 meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
 create mode 100644 meta-gnome/recipes-gnome/pimlico/tasks_git.bb

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts.inc b/meta-gnome/recipes-gnome/pimlico/contacts.inc
new file mode 100644
index 0000000..9798985
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/contacts.inc
@@ -0,0 +1,34 @@
+DESCRIPTION = "Address-book application."
+HOMEPAGE = "http://pimlico-project.org/contacts.html"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2 & GPLv2+ & GPLv3+ "
+SECTION = "x11"
+DEPENDS = "glib-2.0 gtk+ evolution-data-server"
+DEPENDS_append_poky = " libowl"
+RDEPENDS_${PN} = "libedata-book"
+
+inherit autotools pkgconfig
+
+OWL = "--disable-owl"
+OWL_poky = "--enable-owl"
+
+EXTRA_OECONF += "--disable-gnome-vfs ${OWL}"
+EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
+
+do_install_append () {
+	install -d ${D}/${datadir}/pixmaps
+	install -m 0644 ${WORKDIR}/stock_contact.png ${D}/${datadir}/pixmaps
+	install -m 0644 ${WORKDIR}/stock_person.png ${D}/${datadir}/pixmaps
+}
+
+FILES_${PN} += "${datadir}/pixmaps/stock_contact.png \
+		${datadir}/pixmaps/stock_person.png \
+		${datadir}/icons/hicolor"
+
+SRC_URI = "file://stock_contact.png \
+           file://stock_person.png \
+           file://contacts-conditionally-install-schema.patch \
+          "
+
+SRC_URI_append_poky = " file://contacts-owl-window-menu.patch;apply=yes "
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/contacts-conditionally-install-schema.patch b/meta-gnome/recipes-gnome/pimlico/contacts/contacts-conditionally-install-schema.patch
new file mode 100644
index 0000000..2ab7882
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/contacts/contacts-conditionally-install-schema.patch
@@ -0,0 +1,37 @@
+Install schema should respect to GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL
+
+If GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL is set, the schema should not
+be installed.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ data/Makefile.am |    7 ++++---
+ 1 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/data/Makefile.am b/data/Makefile.am
+index f790823..b6fd643 100644
+--- a/data/Makefile.am
++++ b/data/Makefile.am
+@@ -14,13 +14,14 @@ dist_man1_MANS = contacts.1
+ 
+ if HAVE_GCONF
+ install-data-local:
+-	GCONF_CONFIG_SOURCE=$(GCONF_SCHEMA_CONFIG_SOURCE) \
++	if [ "$(GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL)" != "1" ]; then \
++		GCONF_CONFIG_SOURCE=$(GCONF_SCHEMA_CONFIG_SOURCE) \
+ 		$(GCONFTOOL) --makefile-install-rule $(schema_DATA) || \
+ 		(echo ;\
+ 		echo "*****************************************************"; \
+ 		echo "Installation of schemas failed, install them manually"; \
+-		echo "*****************************************************";)
+-		@true
++		echo "*****************************************************";); \
++	fi
+ endif
+ 
+ CLEANFILES = $(desktop_DATA)
+-- 
+1.7.7.6
+
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/contacts-owl-window-menu.patch b/meta-gnome/recipes-gnome/pimlico/contacts/contacts-owl-window-menu.patch
new file mode 100644
index 0000000..5323876
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/contacts/contacts-owl-window-menu.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Inappropriate [enable feature]
+
+Index: contacts-0.9/src/contacts-gtk.c
+===================================================================
+--- contacts-0.9.orig/src/contacts-gtk.c	2008-06-06 12:56:08.000000000 +0100
++++ contacts-0.9/src/contacts-gtk.c	2008-06-16 08:14:28.000000000 +0100
+@@ -220,8 +220,8 @@
+ 	vbox7 = gtk_vbox_new (FALSE, 0);
+ 	gtk_container_add (GTK_CONTAINER (main_window), vbox7);
+ 
+-	main_menubar = gtk_menu_bar_new ();
+-	gtk_box_pack_start (GTK_BOX (vbox7), main_menubar, FALSE, FALSE, 0);
++	main_menubar = gtk_menu_new ();
++	gtk_widget_show (main_menubar);
+ 
+ 	contacts_menu = gtk_menu_item_new_with_mnemonic (_("C_ontacts"));
+ 	gtk_container_add (GTK_CONTAINER (main_menubar), contacts_menu);
+Index: contacts-0.9/src/Makefile.am
+===================================================================
+--- contacts-0.9.orig/src/Makefile.am	2008-06-03 09:16:56.000000000 +0100
++++ contacts-0.9/src/Makefile.am	2008-06-16 08:15:34.000000000 +0100
+@@ -40,7 +40,7 @@
+                     contacts-@FRONTEND@.c \
+                     contacts-@FRONTEND@.h
+ 
+-contacts_LDADD   = $(CONTACTS_LIBS) $(DBUS_LIBS)
++contacts_LDADD   = $(CONTACTS_LIBS) $(DBUS_LIBS) -lowl
+ 
+ contacts_LDFLAGS = @CONTACTS_LIBS@ @DBUS_LIBS@
+ 
+Index: contacts-0.9/src/contacts-main.c
+===================================================================
+--- contacts-0.9.orig/src/contacts-main.c	2008-06-06 10:26:52.000000000 +0100
++++ contacts-0.9/src/contacts-main.c	2008-06-16 08:14:28.000000000 +0100
+@@ -27,6 +27,8 @@
+ #include <libgnomevfs/gnome-vfs.h>
+ #endif
+ 
++#include <libowl/owlwindowmenu.h>
++
+ #include "bacon-message-connection.h"
+ #include "contacts-defs.h"
+ #include "contacts-utils.h"
+@@ -266,6 +268,10 @@
+ 		gtk_widget_show_all (widget);
+ 	}
+ 
++	gtk_widget_show_all (data->ui->main_menubar);
++	owl_set_window_menu (GTK_WINDOW (data->ui->main_window),
++			     GTK_MENU (data->ui->main_menubar));
++
+ 	gtk_main ();
+ 
+ 	/* if we have modified the current contact, but not saved it, do so now */
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/make-382.patch b/meta-gnome/recipes-gnome/pimlico/contacts/make-382.patch
new file mode 100644
index 0000000..a7cfee3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/contacts/make-382.patch
@@ -0,0 +1,16 @@
+Fix for stricter parser in make 3.82. This fix has been pushed to upstream git.
+
+JL - 15/12/10
+
+Upstream-Status: Accepted
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -11,4 +11,4 @@ DISTCLEANFILES = $(INTLTOOL_BUILT)
+ MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub configure depcomp $(INTLTOOL_BUILT:=.in) install-sh ltmain.sh mkinstalldirs Makefile.in missing
+ 
+ snapshot:
+-        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
++	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png b/meta-gnome/recipes-gnome/pimlico/contacts/stock_contact.png
new file mode 100644
index 0000000000000000000000000000000000000000..123b4485acaaaf665eb9dbff5e9f126a02e6e6d4
GIT binary patch
literal 2311
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

literal 0
HcmV?d00001

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png b/meta-gnome/recipes-gnome/pimlico/contacts/stock_person.png
new file mode 100644
index 0000000000000000000000000000000000000000..2b1328b4e2cc6a131a7ff9df4722c6fa49b0a6f1
GIT binary patch
literal 2280
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
CvpRJE

literal 0
HcmV?d00001

diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
new file mode 100644
index 0000000..251bbe1
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
@@ -0,0 +1,18 @@
+require contacts.inc
+
+PR = "r7"
+
+SRC_URI =+ "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "aab5affbf93d6fa7b978b323a8d44de0"
+SRC_URI[sha256sum] = "9cacec98f8123993033aaa255f3f4c04c86a1be65e487dd21f0aaa54384a6f6d"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/contacts-main.h;endline=18;md5=0371af46fbc72e33575e0072dca5fb19 \
+                    file://src/contacts-dbus.c;endline=18;md5=e4da9ac1a0539fafc7df431010904fd5 \
+                    file://src/contacts-gtk.c;endline=21;md5=1c2e3f55b215635eff4ba76f7696f8ee"
+
+do_configure_prepend () {
+	# It used 8 spaces to instead of a tab, but it doesn't work for us
+	sed -i 's/^        $(MAKE) dist distdir=/\t$(MAKE) dist distdir/' Makefile.am
+}
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
new file mode 100644
index 0000000..45a6a0d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
@@ -0,0 +1,19 @@
+require contacts.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/contacts-main.h;endline=20;md5=9dc3531c914fb6d6d4a8d1aee4519fef \
+                    file://src/contacts-dbus.c;endline=20;md5=95e02d77f155fbd07a14dba3348b9b03 \
+                    file://src/contacts-gtk.c;endline=23;md5=e1ee9b9e72045f2d3aa44cf17313b46e"
+
+SRCREV = "19853893fdb595de6aa59db0d9dc2f9451ed2933"
+PV = "0.12+git${SRCPV}"
+PR = "r4"
+
+S = "${WORKDIR}/git"
+
+SRC_URI =+ "git://git.gnome.org/${BPN};protocol=git \
+	    file://make-382.patch"
+
+S = "${WORKDIR}/git"
+
+
diff --git a/meta-gnome/recipes-gnome/pimlico/dates.inc b/meta-gnome/recipes-gnome/pimlico/dates.inc
new file mode 100644
index 0000000..9b338fd
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/dates.inc
@@ -0,0 +1,20 @@
+DESCRIPTION = "Dates is a calendar application."
+HOMEPAGE = "http://pimlico-project.org/dates.html"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2 & GPLv2+ & LGPLv2+"
+
+SECTION = "x11"
+DEPENDS = "glib-2.0 gtk+ libglade evolution-data-server"
+RDEPENDS_${PN} = "libedata-cal"
+
+inherit autotools gettext pkgconfig gtk-icon-cache
+
+# Poky/Sato specific enhancements
+OWL = "--disable-owl"
+OWL_poky = "--enable-owl --disable-dnd"
+
+EXTRA_OECONF += "${OWL}"
+DEPENDS_append_poky = " libowl"
+SRC_URI_append_poky = " file://dates-owl-window-menu.patch;apply=yes "
+
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/dates-owl-window-menu.patch b/meta-gnome/recipes-gnome/pimlico/dates/dates-owl-window-menu.patch
new file mode 100644
index 0000000..714623e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/dates/dates-owl-window-menu.patch
@@ -0,0 +1,67 @@
+---
+ src/dates_gtk.c      |    5 -----
+ src/dates_main.c     |    5 +++++
+ src/dates_platform.h |    2 +-
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+Upstream-Status: Inappropriate [enable feature]
+
+Index: git/src/dates_gtk.c
+===================================================================
+--- git.orig/src/dates_gtk.c	2009-08-18 12:44:56.000000000 +0100
++++ git/src/dates_gtk.c	2009-09-03 22:28:50.000000000 +0100
+@@ -33,10 +33,6 @@
+ #endif
+ 
+ #ifndef DATES_PLATFORM_create_main_window
+-/* the default implementation assumes that menu is GtkMenuBar */
+-#ifdef DATES_MENU_WITHOUT_BAR
+-#error Cannot use default create_main_window () if DATES_MENU_WITHOUT_BAR is defined !!!
+-#endif
+ static GtkWidget *
+ create_main_window (DatesData * d, GtkWidget * toolbar,
+ 					GtkWidget * menu, GtkAccelGroup * accel_group)
+@@ -59,7 +55,6 @@
+ 	gtk_container_add (GTK_CONTAINER (d->main_window), main_vbox);
+ 
+ 	gtk_widget_show (menu);
+-	gtk_box_pack_start (GTK_BOX (main_vbox), menu, FALSE, FALSE, 0);
+ 
+ 	gtk_box_pack_end (GTK_BOX (main_vbox), toolbar, FALSE, FALSE, 0);
+ 	gtk_container_set_border_width (GTK_CONTAINER (toolbar), 3);
+Index: git/src/dates_main.c
+===================================================================
+--- git.orig/src/dates_main.c	2009-08-18 12:44:56.000000000 +0100
++++ git/src/dates_main.c	2009-09-03 22:29:21.000000000 +0100
+@@ -26,6 +26,8 @@
+ #include <libical/icaltime.h>
+ #include <gconf/gconf-client.h>
+ 
++#include <gtk/gtkmenuitem.h>
++#include <libowl/owlwindowmenu.h>
+ #include "dates_types.h"
+ #include "dates_platform.h"
+ #include "dates_callbacks.h"
+@@ -582,6 +584,9 @@
+ 		g_free (url_uri);
+ 	}
+ 
++	owl_set_window_menu (GTK_WINDOW (data.main_window),
++			     GTK_MENU (data.main_menu));
++
+ 	gtk_main ();
+ 
+ 	return 0;
+Index: git/src/dates_platform.h
+===================================================================
+--- git.orig/src/dates_platform.h	2009-08-18 12:44:56.000000000 +0100
++++ git/src/dates_platform.h	2009-09-03 22:28:50.000000000 +0100
+@@ -20,7 +20,7 @@
+ 
+ #include "dates_types.h"
+ 
+-#ifdef WITH_HILDON
++#if 1
+ #define DATES_MENU_WITHOUT_BAR 1
+ #endif
+ 
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch b/meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
new file mode 100644
index 0000000..649d59d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/dates/dso_linking_change_build_fix.patch
@@ -0,0 +1,44 @@
+after gcc linking has changed, all the libraries must be explicitely specified 
+This patch avoids these linking errors:
+
+
+| make[2]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/dates-0.4.11+git0+514185dc1f6588085fda41eb59898b93d0487dd4-r2/git/src'^M
+...
+| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: e: invalid DSO for symbol `pow@@GLIBC_2.0' definition^M
+| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libm.so: could not read symbols: Bad value^M
+| collect2: ld returned 1 exit status^M
+| make[2]: *** [dates] Error 1
+
+
+
+| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: z: invalid DSO for symbol `pango_layout_get_extents' definition
+| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libpango-1.0.so: could not read symbols: Bad value
+| collect2: ld returned 1 exit status
+| make[2]: *** [dates] Error 1
+
+
+Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2011/01/11
+
+Update:
+This is identified as a libtool issue. While creating the libgtkdatesview.la 
+file, libtool should have added these needed libraries in there.
+ A bug has been created for this issue: 
+   http://bugzilla.pokylinux.org/show_bug.cgi?id=664
+Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2011/01/19
+
+Upstream-Status: Pending
+
+Index: git/src/Makefile.am
+===================================================================
+--- git.orig/src/Makefile.am
++++ git/src/Makefile.am
+@@ -34,6 +34,6 @@ dates_SOURCES = $(platform) 	\
+ 	gconf-bridge.h		\
+ 	gconf-bridge.c
+ 
+-dates_LDADD = $(DATES_LIBS) $(OWL_LIBS) libgtkdatesview.la
++dates_LDADD = $(DATES_LIBS) $(OWL_LIBS) libgtkdatesview.la -lm -lpango-1.0
+ 
+ MAINTAINERCLEANFILES = config.h.in Makefile.in
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/make-382.patch b/meta-gnome/recipes-gnome/pimlico/dates/make-382.patch
new file mode 100644
index 0000000..fad3c58
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/dates/make-382.patch
@@ -0,0 +1,18 @@
+Make 3.82 is offended by the use of spaces instead of tabs. This has been fixed
+in upstream git.
+
+JL - 15/12/10
+
+Upstream-Status: Accepted
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -7,5 +7,5 @@ DISTCLEANFILES = intltool-extract intlto
+ MAINTAINERCLEANFILES = $(DISTCLEANFILES) aclocal.m4 compile config.guess config.sub configure depcomp install-sh ltmain.sh Makefile.in missing
+ 
+ snapshot:
+-        $(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
++	$(MAKE) dist distdir=$(PACKAGE)-snap`date +"%Y%m%d"`
+ 
diff --git a/meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch b/meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
new file mode 100644
index 0000000..6ade470
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/dates/uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch
@@ -0,0 +1,37 @@
+uclibc has langinfo.h but it does not define _NL_TIME_FIRST_WEEKDAY
+therefore we introduce a check in configure for the this define
+and then we make sure that we use it when it really exists
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac	2011-07-18 10:34:15.000000000 -0700
++++ git/configure.ac	2011-07-18 10:54:26.403798188 -0700
+@@ -98,6 +98,8 @@
+ 		src/libgtkdatesview.pc
+ ])
+ 
++AC_CHECK_DECLS([_NL_TIME_FIRST_WEEKDAY],[],[],[[#include <langinfo.h>]])
++
+ AC_OUTPUT
+ 
+ echo " "
+Index: git/src/dates_view.c
+===================================================================
+--- git.orig/src/dates_view.c	2011-07-18 10:34:15.000000000 -0700
++++ git/src/dates_view.c	2011-07-18 10:58:46.093798136 -0700
+@@ -1505,7 +1505,11 @@
+ 	priv->days = 1;
+ 	priv->months = 0;
+ 	priv->months_in_row = 4;
++#if HAVE_DECL__NL_TIME_FIRST_WEEKDAY
+ 	priv->week_start = *nl_langinfo (_NL_TIME_FIRST_WEEKDAY) - 1;
++#else
++	priv->week_start = 0;
++#endif
+ 	priv->dragbox = TRUE;
+ 	priv->single_click = TRUE;
+ 	priv->double_click = FALSE;
diff --git a/meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb b/meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb
new file mode 100644
index 0000000..da3f273
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/dates_0.4.8.bb
@@ -0,0 +1,5 @@
+require dates.inc
+
+PR = "r6"
+
+SRC_URI = "http://pimlico-project.org/sources/dates/dates-${PV}.tar.gz"
diff --git a/meta-gnome/recipes-gnome/pimlico/dates_git.bb b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
new file mode 100644
index 0000000..9ee0105
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/dates_git.bb
@@ -0,0 +1,18 @@
+require dates.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+                    file://src/dates_view.h;endline=22;md5=29f934f356eb970309cdeb6693b3123a \
+                    file://src/dates_hildon.c;endline=19;md5=63938904198b25de429abb65fbdbdb8a \
+                    file://src/gconf-bridge.c;endline=22;md5=ad7626c6daf4aec590474a243f4912fa"
+
+SRCREV = "514185dc1f6588085fda41eb59898b93d0487dd4"
+PV = "0.4.11+git${SRCPV}"
+PR = "r8"
+
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://git.gnome.org/${BPN};protocol=git \
+	   file://make-382.patch \
+	   file://dso_linking_change_build_fix.patch \
+	   file://uclibc-NL_TIME_FIRST_WEEKDAY-absent.patch \
+          "
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks.inc b/meta-gnome/recipes-gnome/pimlico/tasks.inc
new file mode 100644
index 0000000..9cd5259
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/tasks.inc
@@ -0,0 +1,16 @@
+DESCRIPTION = "Task list application"
+HOMEPAGE = "http://pimlico-project.org/tasks.html"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "GPLv2 & GPLv2+"
+
+SECTION = "x11"
+DEPENDS = "glib-2.0 gtk+ evolution-data-server"
+DEPENDS_append_poky = " libowl"
+
+inherit autotools pkgconfig gtk-icon-cache
+
+OWL ?= "--disable-owl"
+OWL_poky ?= "--enable-owl"
+
+EXTRA_OECONF += "${OWL}"
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks/tasks-owl.diff b/meta-gnome/recipes-gnome/pimlico/tasks/tasks-owl.diff
new file mode 100644
index 0000000..aab23ff
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/tasks/tasks-owl.diff
@@ -0,0 +1,67 @@
+This patch enable owl menu, which is hidden in the title bar to save space on
+small screen. It has not been used for a long time, rebase needed.
+
+Upstream-Status: Inappropriate [enable feature]
+
+Index: src/gtk/tasks-ui.xml
+===================================================================
+--- src/gtk/tasks-ui.xml	(revision 338)
++++ src/gtk/tasks-ui.xml	(working copy)
+@@ -7,17 +7,14 @@
+       <menuitem action="EditTask"/>
+       <menuitem action="CompleteTask"/>
+       <separator/>
++      <menuitem action="Undo"/>
++      <menuitem action="Redo"/>
++      <separator/>
+       <menuitem action="DeleteTask"/>
+       <menuitem action="PurgeTasks"/>
+       <separator/>
++      <menuitem action="About"/>
+       <menuitem action="Quit"/>
+     </menu>
+-    <menu action="EditMenu">
+-      <menuitem action="Undo"/>
+-      <menuitem action="Redo"/>
+-    </menu>
+-    <menu action="HelpMenu">
+-      <menuitem action="About"/>
+-    </menu>
+   </menubar>
+ </ui>
+Index: src/gtk/main.c
+===================================================================
+--- src/gtk/main.c	(revision 338)
++++ src/gtk/main.c	(working copy)
+@@ -21,6 +21,7 @@
+ #include <libecal/e-cal.h>
+ #include <glib/gi18n.h>
+ #include <gtk/gtk.h>
++#include <libowl/owlwindowmenu.h>
+ 
+ #include <libkoto/ical-util.h>
+ #include <libkoto/koto-actions.h>
+@@ -564,8 +565,8 @@
+   gtk_window_add_accel_group (GTK_WINDOW (window), gtk_ui_manager_get_accel_group (ui_manager));
+   gtk_ui_manager_ensure_update (ui_manager);
+ 
+-  menu = gtk_ui_manager_get_widget (ui_manager, "/MenuBar");
+-  gtk_box_pack_start (GTK_BOX (top_box), menu, FALSE, FALSE, 0);
++  menu = gtk_ui_manager_get_widget (ui_manager, "/MenuBar/TasksMenu");
++  owl_set_window_menu_item (GTK_WINDOW (window), GTK_MENU_ITEM (menu));
+ 
+   box = gtk_vbox_new (FALSE, 4);
+   gtk_container_set_border_width (GTK_CONTAINER (box), 4);
+Index: src/gtk/Makefile.am
+===================================================================
+--- src/gtk/Makefile.am	(revision 338)
++++ src/gtk/Makefile.am	(working copy)
+@@ -4,7 +4,7 @@
+ bin_PROGRAMS = tasks
+ tasks_CPPFLAGS = -I$(top_srcdir)/
+ tasks_CFLAGS = $(WARN_CFLAGS) $(GTK_CFLAGS) $(ECAL_CFLAGS) $(SEXY_CFLAGS)
+-tasks_LDADD = $(top_builddir)/libkoto/libkoto.a $(GTK_LIBS) $(ECAL_LIBS) $(SEXY_LIBS) 
++tasks_LDADD = $(top_builddir)/libkoto/libkoto.a $(GTK_LIBS) $(ECAL_LIBS) $(SEXY_LIBS)  -lowl
+ 
+ tasks_SOURCES = \
+ 	main.c \
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb b/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
new file mode 100644
index 0000000..f0d9542
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
@@ -0,0 +1,15 @@
+require tasks.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://src/gtk/main.c;endline=19;md5=8659d0b7fd68a2ad6ac30c6539ea5b82 \
+                    file://src/omoko/openmoko-tasks.c;endline=20;md5=04d56a46863c9f4247694f40257a836a \
+                    file://src/hildon/hildon-tasks.c;endline=21;md5=488ddf31dc14b2196dec7cc736211b52"
+
+SRC_URI = "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0afd969758561599fd782e1effb39c08"
+SRC_URI[sha256sum] = "1a7fdc5f95a2193a1a25fdb13f071867fb7e42245ce19ccee4bcccb69e557f2e"
+
+OWL_poky = "--with-owl"
+
+PR = "r2"
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_git.bb b/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
new file mode 100644
index 0000000..16c0430
--- /dev/null
+++ b/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
@@ -0,0 +1,9 @@
+require tasks.inc
+
+SRC_URI = "git://git.gnome.org/${BPN};protocol=git"
+
+SRCREV = "ea52d46d691c5fce4473ea4e24a35411381f3a65"
+PV = "0.13+git${SRCPV}"
+PR = "r3"
+
+S = "${WORKDIR}/git"
-- 
1.7.10



