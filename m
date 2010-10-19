Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P87eL-0001Ww-PK
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 10:34:29 +0200
Received: by mail-fx0-f47.google.com with SMTP id 6so1460528fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=uXsfvwP19ifHguDk7NQfzW/sPno3DYwTFwOKaUINgBU=;
	b=YcayN8E7rc5+1m5dtTV9sABdMH6DVTGa88CzAc2RI67DrP08tK1mZmHtW9y0vge5lJ
	SlGzEr68DUGjBJjY0Ra6EvaeBu+L2JNWsnC5AE/srBvA96AZI3HJaXo6EE+Pq9Z+5g74
	rp+Oh5mHO3I7eLYWu8Hejy5bAm7+4+OkKExzA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=BDsVOjz4BnjiQ2jgp3+klu667HpKk/8PlYCVeM/n85WVrjdvp/kgA3Odp3UzVSQ13Q
	45jh1nJdvy+wPheXeu57Xn8gqlIr7FZ5KJyno9G2P7ICWS0kDgY63lGfjx6bnaKSh3BF
	3l7IJZ8yX2BfB7BXd7eq4Czy8ekrxyXtSQRes=
Received: by 10.103.247.1 with SMTP id z1mr3946730mur.74.1287477233593;
	Tue, 19 Oct 2010 01:33:53 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n14sm1113833fam.26.2010.10.19.01.33.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 01:33:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Oct 2010 10:33:19 +0200
Message-Id: <1287477207-27752-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
References: <1287477207-27752-1-git-send-email-Martin.Jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL, BAYES_00, OBSCURED_EMAIL,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 05/13] libmokoui2, openmoko-apps: move to obsolete as libmokoui2 doesn't build for a while and nobody cares to fix it
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
X-List-Received-Date: Tue, 19 Oct 2010 08:34:29 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../obsolete/openmoko2/libmokoui2/configure.patch  |   10 ++
 .../openmoko2/libmokoui2/makefile.am.patch         |   19 ++++
 recipes/obsolete/openmoko2/libmokoui2_svn.bb       |   24 +++++
 .../obsolete/openmoko2/openmoko-appearance_svn.bb  |    9 ++
 .../obsolete/openmoko2/openmoko-appmanager2_svn.bb |   10 ++
 .../openmoko2/openmoko-browser2/fingerscroll.diff  |   13 +++
 .../openmoko-browser2/webkit-update.patch          |   99 ++++++++++++++++++++
 .../obsolete/openmoko2/openmoko-browser2_svn.bb    |   18 ++++
 .../openmoko-calculator2/openmoko-calculator.png   |  Bin 0 -> 14278 bytes
 .../obsolete/openmoko2/openmoko-calculator2_svn.bb |   15 +++
 .../openmoko-dialer2/om-gta01/kernel-2.6.24.patch  |   13 +++
 .../openmoko-dialer2/om-gta02/kernel-2.6.24.patch  |   15 +++
 recipes/obsolete/openmoko2/openmoko-dialer2_svn.bb |   16 +++
 .../obsolete/openmoko2/openmoko-feedreader2_svn.bb |    8 ++
 .../obsolete/openmoko2/openmoko-firststart2_svn.bb |   10 ++
 .../openmoko2/openmoko-mediaplayer2_svn.bb         |   26 +++++
 .../obsolete/openmoko2/openmoko-messages2_svn.bb   |   12 +++
 recipes/obsolete/openmoko2/openmoko-sample2_svn.bb |   25 +++++
 .../openmoko2/openmoko-today2-folders_svn.bb       |   10 ++
 recipes/obsolete/openmoko2/openmoko-today2_svn.bb  |    9 ++
 .../obsolete/openmoko2/openmoko-worldclock2_svn.bb |    7 ++
 recipes/openmoko2/libmokoui2/configure.patch       |   10 --
 recipes/openmoko2/libmokoui2/makefile.am.patch     |   19 ----
 recipes/openmoko2/libmokoui2_svn.bb                |   24 -----
 recipes/openmoko2/openmoko-appearance_svn.bb       |    9 --
 recipes/openmoko2/openmoko-appmanager2_svn.bb      |   10 --
 .../openmoko2/openmoko-browser2/fingerscroll.diff  |   13 ---
 .../openmoko-browser2/webkit-update.patch          |   99 --------------------
 recipes/openmoko2/openmoko-browser2_svn.bb         |   18 ----
 .../openmoko-calculator2/openmoko-calculator.png   |  Bin 14278 -> 0 bytes
 recipes/openmoko2/openmoko-calculator2_svn.bb      |   15 ---
 .../openmoko-dialer2/om-gta01/kernel-2.6.24.patch  |   13 ---
 .../openmoko-dialer2/om-gta02/kernel-2.6.24.patch  |   15 ---
 recipes/openmoko2/openmoko-dialer2_svn.bb          |   16 ---
 recipes/openmoko2/openmoko-feedreader2_svn.bb      |    8 --
 recipes/openmoko2/openmoko-firststart2_svn.bb      |   10 --
 recipes/openmoko2/openmoko-mediaplayer2_svn.bb     |   26 -----
 recipes/openmoko2/openmoko-messages2_svn.bb        |   12 ---
 recipes/openmoko2/openmoko-sample2_svn.bb          |   25 -----
 recipes/openmoko2/openmoko-today2-folders_svn.bb   |   10 --
 recipes/openmoko2/openmoko-today2_svn.bb           |    9 --
 recipes/openmoko2/openmoko-worldclock2_svn.bb      |    7 --
 42 files changed, 368 insertions(+), 368 deletions(-)
 create mode 100644 recipes/obsolete/openmoko2/libmokoui2/configure.patch
 create mode 100644 recipes/obsolete/openmoko2/libmokoui2/makefile.am.patch
 create mode 100644 recipes/obsolete/openmoko2/libmokoui2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-appearance_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-appmanager2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-browser2/fingerscroll.diff
 create mode 100644 recipes/obsolete/openmoko2/openmoko-browser2/webkit-update.patch
 create mode 100644 recipes/obsolete/openmoko2/openmoko-browser2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-calculator2/openmoko-calculator.png
 create mode 100644 recipes/obsolete/openmoko2/openmoko-calculator2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-dialer2/om-gta01/kernel-2.6.24.patch
 create mode 100644 recipes/obsolete/openmoko2/openmoko-dialer2/om-gta02/kernel-2.6.24.patch
 create mode 100644 recipes/obsolete/openmoko2/openmoko-dialer2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-feedreader2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-firststart2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-mediaplayer2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-messages2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-sample2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-today2-folders_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-today2_svn.bb
 create mode 100644 recipes/obsolete/openmoko2/openmoko-worldclock2_svn.bb
 delete mode 100644 recipes/openmoko2/libmokoui2/configure.patch
 delete mode 100644 recipes/openmoko2/libmokoui2/makefile.am.patch
 delete mode 100644 recipes/openmoko2/libmokoui2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-appearance_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-appmanager2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-browser2/fingerscroll.diff
 delete mode 100644 recipes/openmoko2/openmoko-browser2/webkit-update.patch
 delete mode 100644 recipes/openmoko2/openmoko-browser2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-calculator2/openmoko-calculator.png
 delete mode 100644 recipes/openmoko2/openmoko-calculator2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-dialer2/om-gta01/kernel-2.6.24.patch
 delete mode 100644 recipes/openmoko2/openmoko-dialer2/om-gta02/kernel-2.6.24.patch
 delete mode 100644 recipes/openmoko2/openmoko-dialer2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-feedreader2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-firststart2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-mediaplayer2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-messages2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-sample2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-today2-folders_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-today2_svn.bb
 delete mode 100644 recipes/openmoko2/openmoko-worldclock2_svn.bb

diff --git a/recipes/obsolete/openmoko2/libmokoui2/configure.patch b/recipes/obsolete/openmoko2/libmokoui2/configure.patch
new file mode 100644
index 0000000..174c598
--- /dev/null
+++ b/recipes/obsolete/openmoko2/libmokoui2/configure.patch
@@ -0,0 +1,10 @@
+--- libmokoui.old/configure.ac	2009-06-10 12:42:32.000000000 +0200
++++ libmokoui2/configure.ac	2009-06-10 12:42:43.000000000 +0200
+@@ -28,7 +28,6 @@
+ 
+ if test $enable_python != no ; then
+     AM_PATH_PYTHON(2.3.5)
+-    PKG_CHECK_MODULES(GNOME_PYTHON, gnome-python-2.0 >= 2.10.00)
+     AC_SUBST(PYGDK_CFLAGS)
+     AC_SUBST(PYGDK_LIBS)
+ 
diff --git a/recipes/obsolete/openmoko2/libmokoui2/makefile.am.patch b/recipes/obsolete/openmoko2/libmokoui2/makefile.am.patch
new file mode 100644
index 0000000..79f0a48
--- /dev/null
+++ b/recipes/obsolete/openmoko2/libmokoui2/makefile.am.patch
@@ -0,0 +1,19 @@
+--- libmokoui.old/bindings/python/Makefile.am	2009-06-10 12:42:32.000000000 +0200
++++ libmokoui2/bindings/python/Makefile.am	2009-06-10 12:51:45.000000000 +0200
+@@ -1,13 +1,12 @@
+-
+-PY_DEFS=`pkg-config --variable=defsdir pygtk-2.0`
+-PYTHON_INCLUDES=-I/usr/include/python${PYTHON_VERSION}
++PY_DEFS=${PKG_CONFIG_SYSROOT_DIR}`pkg-config --variable=defsdir pygtk-2.0`
++PYTHON_INCLUDES=-I${PKG_CONFIG_SYSROOT_DIR}/usr/include/python${PYTHON_VERSION}
+ 
+ CLEANFILES = \
+ 	mokoui.defs \
+ 	mokoui.c
+ 
+ mokoui.defs: ../../libmokoui/moko-finger-scroll.h
+-	python /usr/share/pygtk/2.0/codegen/h2def.py ../../libmokoui/moko-finger-scroll.h > mokoui.defs
++	python ${PKG_CONFIG_SYSROOT_DIR}`pkg-config --variable=codegendir pygtk-2.0`/h2def.py ../../libmokoui/moko-finger-scroll.h > mokoui.defs
+ 
+ mokoui.c: mokoui.defs mokoui.override
+ 	pygtk-codegen-2.0 --prefix mokoui \
diff --git a/recipes/obsolete/openmoko2/libmokoui2_svn.bb b/recipes/obsolete/openmoko2/libmokoui2_svn.bb
new file mode 100644
index 0000000..0b71da0
--- /dev/null
+++ b/recipes/obsolete/openmoko2/libmokoui2_svn.bb
@@ -0,0 +1,24 @@
+SECTION = "openmoko/libs"
+DEPENDS = "gtk+ python-pygtk"
+
+SRCREV = "4695"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r5"
+
+inherit openmoko2 python-dir
+
+SRC_URI += "\
+	file://configure.patch \
+	file://makefile.am.patch \
+	"
+LICENSE = "LGPL"
+
+EXTRA_OECONF += " --enable-python"
+
+do_configure_prepend() {
+        touch gtk-doc.make
+}
+
+FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/mokoui.*"
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
+FILES_${PN}-dev += "/usr/share/vala/vapi/"
diff --git a/recipes/obsolete/openmoko2/openmoko-appearance_svn.bb b/recipes/obsolete/openmoko2/openmoko-appearance_svn.bb
new file mode 100644
index 0000000..33d946f
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-appearance_svn.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "The Openmoko Appearance Editor"
+SECTION = "openmoko/pim"
+DEPENDS = "libmokoui2 gconf gtk+"
+RDEPENDS_${PN} = "libedata-cal openmoko-today2-folders"
+SRCREV = "3262"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r1"
+
+inherit openmoko2 gtk-icon-cache 
diff --git a/recipes/obsolete/openmoko2/openmoko-appmanager2_svn.bb b/recipes/obsolete/openmoko2/openmoko-appmanager2_svn.bb
new file mode 100644
index 0000000..86d00ad
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-appmanager2_svn.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "The Openmoko Application Manager"
+SECTION = "openmoko/applications"
+DEPENDS = "libmokoui2 libmokojournal2 startup-notification dbus-glib libice libsm opkg"
+SRCREV = "4530"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r2"
+
+inherit openmoko2 
+
+FILES_${PN} += "/usr/share/openmoko-appmanager"
diff --git a/recipes/obsolete/openmoko2/openmoko-browser2/fingerscroll.diff b/recipes/obsolete/openmoko2/openmoko-browser2/fingerscroll.diff
new file mode 100644
index 0000000..89f7949
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-browser2/fingerscroll.diff
@@ -0,0 +1,13 @@
+Index: src/current-page.c
+===================================================================
+--- openmoko-browser2/src/current-page.c	(revision 3249)
++++ openmoko-browser2/src/current-page.c	(working copy)
+@@ -129,7 +129,7 @@
+     gtk_toolbar_insert (GTK_TOOLBAR (toolbar), data->currentClose, 8);
+ 
+ 
+-    data->currentFingerScroll = gtk_scrolled_window_new (NULL, NULL); //moko_finger_scroll_new ();
++    data->currentFingerScroll = moko_finger_scroll_new ();
+     gtk_box_pack_start (box, data->currentFingerScroll, TRUE, TRUE, 0);
+ }
+ 
diff --git a/recipes/obsolete/openmoko2/openmoko-browser2/webkit-update.patch b/recipes/obsolete/openmoko2/openmoko-browser2/webkit-update.patch
new file mode 100644
index 0000000..18e8a88
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-browser2/webkit-update.patch
@@ -0,0 +1,99 @@
+diff -Nurd openmoko-browser2.orig/configure.ac openmoko-browser2/configure.ac
+--- openmoko-browser2.orig/configure.ac	2007-10-02 09:00:38.000000000 +0200
++++ openmoko-browser2/configure.ac	2008-03-05 12:12:32.954623867 +0100
+@@ -40,7 +40,7 @@
+ # base deps
+ PKG_CHECK_MODULES(OPENMOKO,  libmokoui2    >= 0.1.0)
+ PKG_CHECK_MODULES(GTHREAD,   gthread-2.0           )
+-PKG_CHECK_MODULES(WEBKITGTK, WebKitGtk)
++PKG_CHECK_MODULES(WEBKITGTK, webkit-1.0)
+ 
+ # glib-genmarshal
+ GLIB_GENMARSHAL=`$PKG_CONFIG --variable=glib_genmarshal glib-2.0`
+diff -Nurd openmoko-browser2.orig/src/browser-data.h openmoko-browser2/src/browser-data.h
+--- openmoko-browser2.orig/src/browser-data.h	2007-12-12 20:31:07.000000000 +0100
++++ openmoko-browser2/src/browser-data.h	2008-03-05 12:12:50.497959252 +0100
+@@ -27,7 +27,7 @@
+ #ifndef OPENMOKO_BROWSER_DATA_H
+ #define OPENMOKO_BROWSER_DATA_H
+ 
+-#include "webkitwebview.h"
++#include <webkit/webkitwebview.h>
+ 
+ #include <glib.h>
+ #include <gtk/gtk.h>
+diff -Nurd openmoko-browser2.orig/src/current-page.c openmoko-browser2/src/current-page.c
+--- openmoko-browser2.orig/src/current-page.c	2007-12-12 20:31:07.000000000 +0100
++++ openmoko-browser2/src/current-page.c	2008-03-05 12:13:56.032884030 +0100
+@@ -28,8 +28,8 @@
+ #include "current-page.h"
+ 
+ #include <moko-finger-scroll.h>
+-#include <webkitwebframe.h>
+-#include <webkitwebview.h>
++#include <webkit/webkitwebframe.h>
++#include <webkit/webkitwebview.h>
+ 
+ /*
+  * From a list of BrowserPage's in BrowserData::currentPage show
+@@ -42,7 +42,7 @@
+ static void current_back_clicked_closure(GtkWidget* button, struct BrowserData* data)
+ {
+     g_return_if_fail (data->currentPage);
+-    webkit_web_view_go_backward(data->currentPage->webKitPage);
++    webkit_web_view_go_back(data->currentPage->webKitPage);
+ }
+ 
+ static void current_forward_clicked_closure(GtkWidget* button, struct BrowserData* data)
+@@ -66,7 +66,7 @@
+     g_assert (page == data->currentPage->webKitPage);
+ 
+     if (prog == 100) {
+-        gtk_widget_set_sensitive (GTK_WIDGET (data->currentBack), webkit_web_view_can_go_backward (page));
++        gtk_widget_set_sensitive (GTK_WIDGET (data->currentBack), webkit_web_view_can_go_back (page));
+         gtk_widget_set_sensitive (GTK_WIDGET (data->currentForward), webkit_web_view_can_go_forward (page));
+         gtk_widget_set_sensitive (GTK_WIDGET (data->currentAdd), webkit_web_frame_get_title (webkit_web_view_get_main_frame (page)) != NULL);
+     }
+@@ -176,7 +176,7 @@
+      * Update the GtkToolItems
+      */
+     /* XXX ### FIXME TODO check if we should show stop/reload */
+-    gtk_widget_set_sensitive (GTK_WIDGET (data->currentBack), webkit_web_view_can_go_backward (data->currentPage->webKitPage));
++    gtk_widget_set_sensitive (GTK_WIDGET (data->currentBack), webkit_web_view_can_go_back (data->currentPage->webKitPage));
+     gtk_widget_set_sensitive (GTK_WIDGET (data->currentForward), webkit_web_view_can_go_forward (data->currentPage->webKitPage));
+     gtk_widget_set_sensitive (GTK_WIDGET (data->currentAdd), webkit_web_frame_get_title (webkit_web_view_get_main_frame (data->currentPage->webKitPage)) != NULL);
+     gtk_widget_set_sensitive (GTK_WIDGET (data->currentClose), TRUE);
+diff -Nurd openmoko-browser2.orig/src/main.c openmoko-browser2/src/main.c
+--- openmoko-browser2.orig/src/main.c	2007-12-12 20:31:07.000000000 +0100
++++ openmoko-browser2/src/main.c	2008-03-05 12:14:46.337942098 +0100
+@@ -33,7 +33,7 @@
+ #include <gtk/gtk.h>
+ #include <glib/gi18n.h>
+ 
+-#include <webkit.h>
++#include <webkit/webkit.h>
+ 
+ #include <moko-finger-scroll.h>
+ #include <moko-stock.h>
+@@ -55,7 +55,6 @@
+     gdk_threads_init ();
+     gdk_threads_enter ();
+     gtk_init (&argc, &argv);
+-    webkit_init ();
+     moko_stock_register ();
+     g_set_application_name (_("Browser"));
+ 
+diff -Nurd openmoko-browser2.orig/src/open-pages-page.c openmoko-browser2/src/open-pages-page.c
+--- openmoko-browser2.orig/src/open-pages-page.c	2007-12-12 20:31:07.000000000 +0100
++++ openmoko-browser2/src/open-pages-page.c	2008-03-05 12:13:37.671282983 +0100
+@@ -28,8 +28,8 @@
+ #include "open-pages-page.h"
+ #include "current-page.h"
+ 
+-#include <webkitwebframe.h>
+-#include <webkitwebview.h>
++#include <webkit/webkitwebframe.h>
++#include <webkit/webkitwebview.h>
+ #include <moko-finger-scroll.h>
+ 
+ #include <glib/gi18n.h>
diff --git a/recipes/obsolete/openmoko2/openmoko-browser2_svn.bb b/recipes/obsolete/openmoko2/openmoko-browser2_svn.bb
new file mode 100644
index 0000000..4fb5699
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-browser2_svn.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Om Webbrowser using webkit."
+SECTION = "openmoko/apps"
+DEPENDS += "intltool libmokoui2 check webkit-gtk"
+SRCREV = "4172"
+PV = "0.0.1+svnr${SRCPV}"
+PR = "r2"
+
+inherit openmoko2
+LDFLAGS_append = " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
+
+SRC_URI += "file://webkit-update.patch;minrev=3646;maxrev=4171"
+
+#SRC_URI += "file://fingerscroll.diff"
+
+do_compile_prepend() {
+        find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':"-I${STAGING_INCDIR}":g
+}
+
diff --git a/recipes/obsolete/openmoko2/openmoko-calculator2/openmoko-calculator.png b/recipes/obsolete/openmoko2/openmoko-calculator2/openmoko-calculator.png
new file mode 100644
index 0000000000000000000000000000000000000000..2811364f8322db593fa410756dccee0137d7e6bd
GIT binary patch
literal 14278
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

literal 0
HcmV?d00001

diff --git a/recipes/obsolete/openmoko2/openmoko-calculator2_svn.bb b/recipes/obsolete/openmoko2/openmoko-calculator2_svn.bb
new file mode 100644
index 0000000..f52bbe3
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-calculator2_svn.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Legacy Om calculator application."
+SECTION = "openmoko/tools"
+DEPENDS = "libmokoui2"
+SRCREV = "3655"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r1"
+
+inherit openmoko2
+LICENSE = "GPL"
+SRC_URI += " file://openmoko-calculator.png "
+
+do_install_append_openmoko() {
+        install -d ${D}/${datadir}/pixmaps/
+        install ${WORKDIR}//openmoko-calculator.png ${D}/${datadir}/pixmaps/openmoko-calculator.png
+}
diff --git a/recipes/obsolete/openmoko2/openmoko-dialer2/om-gta01/kernel-2.6.24.patch b/recipes/obsolete/openmoko2/openmoko-dialer2/om-gta01/kernel-2.6.24.patch
new file mode 100644
index 0000000..c6f34f4
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-dialer2/om-gta01/kernel-2.6.24.patch
@@ -0,0 +1,13 @@
+Index: openmoko-dialer2/src/phone-kit/moko-notify.c
+===================================================================
+--- openmoko-dialer2/src/phone-kit/moko-notify.c.orig	2008-02-14 17:47:23.000000000 +0800
++++ openmoko-dialer2/src/phone-kit/moko-notify.c	2008-02-14 17:48:19.000000000 +0800
+@@ -38,7 +38,7 @@
+ 
+ #define DEFAULT_RINGTONE "/default_ringtone.ogg"
+ #define SYS_BRIGHTNESS "/sys/class/backlight/gta01-bl"
+-#define SYS_VIBRATE "/sys/class/leds/gta01:vibrator"
++#define SYS_VIBRATE "/sys/class/leds/neo1973:vibrator"
+ 
+ struct _MokoNotifyPrivate
+ {
diff --git a/recipes/obsolete/openmoko2/openmoko-dialer2/om-gta02/kernel-2.6.24.patch b/recipes/obsolete/openmoko2/openmoko-dialer2/om-gta02/kernel-2.6.24.patch
new file mode 100644
index 0000000..72c516f
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-dialer2/om-gta02/kernel-2.6.24.patch
@@ -0,0 +1,15 @@
+Index: openmoko-dialer2/src/phone-kit/moko-notify.c
+===================================================================
+--- openmoko-dialer2/src/phone-kit/moko-notify.c	(revision 4051)
++++ openmoko-dialer2/src/phone-kit/moko-notify.c	(working copy)
+@@ -37,8 +37,8 @@
+         MOKO_TYPE_NOTIFY, MokoNotifyPrivate))
+ 
+ #define DEFAULT_RINGTONE "/default_ringtone.ogg"
+-#define SYS_BRIGHTNESS "/sys/class/backlight/gta01-bl"
+-#define SYS_VIBRATE "/sys/class/leds/gta01:vibrator"
++#define SYS_BRIGHTNESS "/sys/class/backlight/pcf50633-bl"
++#define SYS_VIBRATE "/sys/class/leds/neo1973:vibrator"
+ 
+ struct _MokoNotifyPrivate
+ {
diff --git a/recipes/obsolete/openmoko2/openmoko-dialer2_svn.bb b/recipes/obsolete/openmoko2/openmoko-dialer2_svn.bb
new file mode 100644
index 0000000..33b90ff
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-dialer2_svn.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Legacy Om dialer."
+SECTION = "openmoko/pim"
+DEPENDS = "libgsmd libjana libmokoui2 libmokojournal2 pulseaudio libnotify"
+SRCREV = "4364"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r9"
+PE = "1"
+
+inherit openmoko2
+
+SRC_URI_append_om-gta01 = " file://kernel-2.6.24.patch"
+SRC_URI_append_om-gta02 = " file://kernel-2.6.24.patch"
+
+EXTRA_OECONF = "--with-dbusbindir=${STAGING_BINDIR_NATIVE}"
+
+FILES_${PN} += "${datadir}/openmoko-dialer/ ${datadir}/dbus-1/services/"
diff --git a/recipes/obsolete/openmoko2/openmoko-feedreader2_svn.bb b/recipes/obsolete/openmoko2/openmoko-feedreader2_svn.bb
new file mode 100644
index 0000000..550832e
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-feedreader2_svn.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "The Openmoko Feed Reader"
+SECTION = "openmoko/apps"
+DEPENDS += "libmokoui2 libmrss check webkit-gtk"
+SRCREV = "3645"
+PV = "0.0.1+svnr${SRCPV}"
+PR = "r1"
+
+inherit openmoko2
diff --git a/recipes/obsolete/openmoko2/openmoko-firststart2_svn.bb b/recipes/obsolete/openmoko2/openmoko-firststart2_svn.bb
new file mode 100644
index 0000000..68c2110
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-firststart2_svn.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "The Openmoko First Start Wizard"
+SECTION = "openmoko/apps"
+DEPENDS += "libmokoui2 libglade"
+SRCREV = "3158"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r0"
+
+inherit openmoko2
+
+FILES_${PN} += "${datadir}"
diff --git a/recipes/obsolete/openmoko2/openmoko-mediaplayer2_svn.bb b/recipes/obsolete/openmoko2/openmoko-mediaplayer2_svn.bb
new file mode 100644
index 0000000..897483a
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-mediaplayer2_svn.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Om application for playing media files."
+SECTION = "openmoko/tools"
+DEPENDS = "libmokoui2 expat gstreamer libspiff curl"
+RDEPENDS_${PN} = "gst-meta-audio gconf gst-plugin-alsa"
+SRCREV = "4750"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r7"
+
+inherit openmoko2
+
+FILES_${PN} += "${datadir}/openmoko-mediaplayer"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/gconf/schemas
+	install -m 0644 ${S}/openmoko-mediaplayer.schemas ${D}${sysconfdir}/gconf/schemas/openmoko-mediaplayer.schemas
+}
+
+pkg_postinst_openmoko-mediaplayer2 () {
+#!/bin/sh -e
+if [ "x$D" != "x" ]; then
+    exit 1
+fi
+
+export GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source`
+gconftool-2 --makefile-install-rule ${sysconfdir}/gconf/schemas/openmoko-mediaplayer.schemas > /dev/null
+}
diff --git a/recipes/obsolete/openmoko2/openmoko-messages2_svn.bb b/recipes/obsolete/openmoko2/openmoko-messages2_svn.bb
new file mode 100644
index 0000000..81a0d8d
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-messages2_svn.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Legacy Om application for sms."
+SECTION = "openmoko/pim"
+DEPENDS = "libmokogsmd2 libmokoui2 libmokojournal2 libjana"
+SRCREV = "4340"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r2"
+
+inherit openmoko2
+
+EXTRA_OECONF = "--with-dbusbindir=${STAGING_BINDIR_NATIVE}"
+
+FILES_${PN} += "${datadir}/openmoko-messages/ ${datadir}/dbus-1/services/"
diff --git a/recipes/obsolete/openmoko2/openmoko-sample2_svn.bb b/recipes/obsolete/openmoko2/openmoko-sample2_svn.bb
new file mode 100644
index 0000000..d5eb61d
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-sample2_svn.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "The Openmoko Sample Project"
+SECTION = "openmoko/applications"
+DEPENDS = "libmokoui2 intltool gconf"
+SRCREV = "3537"
+PV = "0.0.1+svnr${SRCPV}"
+PR = "r0"
+
+inherit openmoko2
+
+PACKAGES += "${PN}-src"
+# path should match the toolchain path
+FILES_${PN}-src = "/usr/local/openmoko"
+PACKAGE_ARCH_${PN}-src = "${BUILD_ARCH}-all-sdk"
+
+do_configure_prepend() {
+	install -d ${WORKDIR}/source
+	cp -pPR ${S} ${WORKDIR}/source/
+	find ${WORKDIR}/source -name ".svn"|xargs rm -rf
+}
+
+do_install_append() {
+	install -d ${D}/usr/local/openmoko/source/
+	cp -pPR ${WORKDIR}/source/* ${D}/usr/local/openmoko/source/
+}
+
diff --git a/recipes/obsolete/openmoko2/openmoko-today2-folders_svn.bb b/recipes/obsolete/openmoko2/openmoko-today2-folders_svn.bb
new file mode 100644
index 0000000..d2badfb
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-today2-folders_svn.bb
@@ -0,0 +1,10 @@
+DESCRIPTION = "The Openmoko Today2 vfolder files"
+SECTION = "openmoko/misc"
+SRCREV = "3704"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r3"
+RCONFLICTS_${PN} = "matchbox-common"
+
+inherit openmoko2
+
+FILES_${PN} += "${datadir}"
diff --git a/recipes/obsolete/openmoko2/openmoko-today2_svn.bb b/recipes/obsolete/openmoko2/openmoko-today2_svn.bb
new file mode 100644
index 0000000..6feee46
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-today2_svn.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "The Openmoko Application Launcher"
+SECTION = "openmoko/pim"
+DEPENDS = "libmokoui2 libmokojournal2 libjana startup-notification dbus-glib libice libsm"
+RDEPENDS_${PN} = "libedata-cal openmoko-today2-folders"
+SRCREV = "4168"
+PV = "0.1.0+svnr${SRCPV}"
+PR = "r3"
+
+inherit openmoko2 gtk-icon-cache 
diff --git a/recipes/obsolete/openmoko2/openmoko-worldclock2_svn.bb b/recipes/obsolete/openmoko2/openmoko-worldclock2_svn.bb
new file mode 100644
index 0000000..fad55a9
--- /dev/null
+++ b/recipes/obsolete/openmoko2/openmoko-worldclock2_svn.bb
@@ -0,0 +1,7 @@
+DESCRIPTION = "A World-Clock for Openmoko"
+SECTION = "openmoko/tools"
+DEPENDS = "libmokoui2 libjana"
+SRCREV = "3365"
+PV = "0.1.0+svnr${SRCPV}"
+
+inherit openmoko2
diff --git a/recipes/openmoko2/libmokoui2/configure.patch b/recipes/openmoko2/libmokoui2/configure.patch
deleted file mode 100644
index 174c598..0000000
--- a/recipes/openmoko2/libmokoui2/configure.patch
+++ /dev/null
@@ -1,10 +0,0 @@
---- libmokoui.old/configure.ac	2009-06-10 12:42:32.000000000 +0200
-+++ libmokoui2/configure.ac	2009-06-10 12:42:43.000000000 +0200
-@@ -28,7 +28,6 @@
- 
- if test $enable_python != no ; then
-     AM_PATH_PYTHON(2.3.5)
--    PKG_CHECK_MODULES(GNOME_PYTHON, gnome-python-2.0 >= 2.10.00)
-     AC_SUBST(PYGDK_CFLAGS)
-     AC_SUBST(PYGDK_LIBS)
- 
diff --git a/recipes/openmoko2/libmokoui2/makefile.am.patch b/recipes/openmoko2/libmokoui2/makefile.am.patch
deleted file mode 100644
index 79f0a48..0000000
--- a/recipes/openmoko2/libmokoui2/makefile.am.patch
+++ /dev/null
@@ -1,19 +0,0 @@
---- libmokoui.old/bindings/python/Makefile.am	2009-06-10 12:42:32.000000000 +0200
-+++ libmokoui2/bindings/python/Makefile.am	2009-06-10 12:51:45.000000000 +0200
-@@ -1,13 +1,12 @@
--
--PY_DEFS=`pkg-config --variable=defsdir pygtk-2.0`
--PYTHON_INCLUDES=-I/usr/include/python${PYTHON_VERSION}
-+PY_DEFS=${PKG_CONFIG_SYSROOT_DIR}`pkg-config --variable=defsdir pygtk-2.0`
-+PYTHON_INCLUDES=-I${PKG_CONFIG_SYSROOT_DIR}/usr/include/python${PYTHON_VERSION}
- 
- CLEANFILES = \
- 	mokoui.defs \
- 	mokoui.c
- 
- mokoui.defs: ../../libmokoui/moko-finger-scroll.h
--	python /usr/share/pygtk/2.0/codegen/h2def.py ../../libmokoui/moko-finger-scroll.h > mokoui.defs
-+	python ${PKG_CONFIG_SYSROOT_DIR}`pkg-config --variable=codegendir pygtk-2.0`/h2def.py ../../libmokoui/moko-finger-scroll.h > mokoui.defs
- 
- mokoui.c: mokoui.defs mokoui.override
- 	pygtk-codegen-2.0 --prefix mokoui \
diff --git a/recipes/openmoko2/libmokoui2_svn.bb b/recipes/openmoko2/libmokoui2_svn.bb
deleted file mode 100644
index 0b71da0..0000000
--- a/recipes/openmoko2/libmokoui2_svn.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SECTION = "openmoko/libs"
-DEPENDS = "gtk+ python-pygtk"
-
-SRCREV = "4695"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r5"
-
-inherit openmoko2 python-dir
-
-SRC_URI += "\
-	file://configure.patch \
-	file://makefile.am.patch \
-	"
-LICENSE = "LGPL"
-
-EXTRA_OECONF += " --enable-python"
-
-do_configure_prepend() {
-        touch gtk-doc.make
-}
-
-FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/mokoui.*"
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
-FILES_${PN}-dev += "/usr/share/vala/vapi/"
diff --git a/recipes/openmoko2/openmoko-appearance_svn.bb b/recipes/openmoko2/openmoko-appearance_svn.bb
deleted file mode 100644
index 33d946f..0000000
--- a/recipes/openmoko2/openmoko-appearance_svn.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "The Openmoko Appearance Editor"
-SECTION = "openmoko/pim"
-DEPENDS = "libmokoui2 gconf gtk+"
-RDEPENDS_${PN} = "libedata-cal openmoko-today2-folders"
-SRCREV = "3262"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r1"
-
-inherit openmoko2 gtk-icon-cache 
diff --git a/recipes/openmoko2/openmoko-appmanager2_svn.bb b/recipes/openmoko2/openmoko-appmanager2_svn.bb
deleted file mode 100644
index 86d00ad..0000000
--- a/recipes/openmoko2/openmoko-appmanager2_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "The Openmoko Application Manager"
-SECTION = "openmoko/applications"
-DEPENDS = "libmokoui2 libmokojournal2 startup-notification dbus-glib libice libsm opkg"
-SRCREV = "4530"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r2"
-
-inherit openmoko2 
-
-FILES_${PN} += "/usr/share/openmoko-appmanager"
diff --git a/recipes/openmoko2/openmoko-browser2/fingerscroll.diff b/recipes/openmoko2/openmoko-browser2/fingerscroll.diff
deleted file mode 100644
index 89f7949..0000000
--- a/recipes/openmoko2/openmoko-browser2/fingerscroll.diff
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: src/current-page.c
-===================================================================
---- openmoko-browser2/src/current-page.c	(revision 3249)
-+++ openmoko-browser2/src/current-page.c	(working copy)
-@@ -129,7 +129,7 @@
-     gtk_toolbar_insert (GTK_TOOLBAR (toolbar), data->currentClose, 8);
- 
- 
--    data->currentFingerScroll = gtk_scrolled_window_new (NULL, NULL); //moko_finger_scroll_new ();
-+    data->currentFingerScroll = moko_finger_scroll_new ();
-     gtk_box_pack_start (box, data->currentFingerScroll, TRUE, TRUE, 0);
- }
- 
diff --git a/recipes/openmoko2/openmoko-browser2/webkit-update.patch b/recipes/openmoko2/openmoko-browser2/webkit-update.patch
deleted file mode 100644
index 18e8a88..0000000
--- a/recipes/openmoko2/openmoko-browser2/webkit-update.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-diff -Nurd openmoko-browser2.orig/configure.ac openmoko-browser2/configure.ac
---- openmoko-browser2.orig/configure.ac	2007-10-02 09:00:38.000000000 +0200
-+++ openmoko-browser2/configure.ac	2008-03-05 12:12:32.954623867 +0100
-@@ -40,7 +40,7 @@
- # base deps
- PKG_CHECK_MODULES(OPENMOKO,  libmokoui2    >= 0.1.0)
- PKG_CHECK_MODULES(GTHREAD,   gthread-2.0           )
--PKG_CHECK_MODULES(WEBKITGTK, WebKitGtk)
-+PKG_CHECK_MODULES(WEBKITGTK, webkit-1.0)
- 
- # glib-genmarshal
- GLIB_GENMARSHAL=`$PKG_CONFIG --variable=glib_genmarshal glib-2.0`
-diff -Nurd openmoko-browser2.orig/src/browser-data.h openmoko-browser2/src/browser-data.h
---- openmoko-browser2.orig/src/browser-data.h	2007-12-12 20:31:07.000000000 +0100
-+++ openmoko-browser2/src/browser-data.h	2008-03-05 12:12:50.497959252 +0100
-@@ -27,7 +27,7 @@
- #ifndef OPENMOKO_BROWSER_DATA_H
- #define OPENMOKO_BROWSER_DATA_H
- 
--#include "webkitwebview.h"
-+#include <webkit/webkitwebview.h>
- 
- #include <glib.h>
- #include <gtk/gtk.h>
-diff -Nurd openmoko-browser2.orig/src/current-page.c openmoko-browser2/src/current-page.c
---- openmoko-browser2.orig/src/current-page.c	2007-12-12 20:31:07.000000000 +0100
-+++ openmoko-browser2/src/current-page.c	2008-03-05 12:13:56.032884030 +0100
-@@ -28,8 +28,8 @@
- #include "current-page.h"
- 
- #include <moko-finger-scroll.h>
--#include <webkitwebframe.h>
--#include <webkitwebview.h>
-+#include <webkit/webkitwebframe.h>
-+#include <webkit/webkitwebview.h>
- 
- /*
-  * From a list of BrowserPage's in BrowserData::currentPage show
-@@ -42,7 +42,7 @@
- static void current_back_clicked_closure(GtkWidget* button, struct BrowserData* data)
- {
-     g_return_if_fail (data->currentPage);
--    webkit_web_view_go_backward(data->currentPage->webKitPage);
-+    webkit_web_view_go_back(data->currentPage->webKitPage);
- }
- 
- static void current_forward_clicked_closure(GtkWidget* button, struct BrowserData* data)
-@@ -66,7 +66,7 @@
-     g_assert (page == data->currentPage->webKitPage);
- 
-     if (prog == 100) {
--        gtk_widget_set_sensitive (GTK_WIDGET (data->currentBack), webkit_web_view_can_go_backward (page));
-+        gtk_widget_set_sensitive (GTK_WIDGET (data->currentBack), webkit_web_view_can_go_back (page));
-         gtk_widget_set_sensitive (GTK_WIDGET (data->currentForward), webkit_web_view_can_go_forward (page));
-         gtk_widget_set_sensitive (GTK_WIDGET (data->currentAdd), webkit_web_frame_get_title (webkit_web_view_get_main_frame (page)) != NULL);
-     }
-@@ -176,7 +176,7 @@
-      * Update the GtkToolItems
-      */
-     /* XXX ### FIXME TODO check if we should show stop/reload */
--    gtk_widget_set_sensitive (GTK_WIDGET (data->currentBack), webkit_web_view_can_go_backward (data->currentPage->webKitPage));
-+    gtk_widget_set_sensitive (GTK_WIDGET (data->currentBack), webkit_web_view_can_go_back (data->currentPage->webKitPage));
-     gtk_widget_set_sensitive (GTK_WIDGET (data->currentForward), webkit_web_view_can_go_forward (data->currentPage->webKitPage));
-     gtk_widget_set_sensitive (GTK_WIDGET (data->currentAdd), webkit_web_frame_get_title (webkit_web_view_get_main_frame (data->currentPage->webKitPage)) != NULL);
-     gtk_widget_set_sensitive (GTK_WIDGET (data->currentClose), TRUE);
-diff -Nurd openmoko-browser2.orig/src/main.c openmoko-browser2/src/main.c
---- openmoko-browser2.orig/src/main.c	2007-12-12 20:31:07.000000000 +0100
-+++ openmoko-browser2/src/main.c	2008-03-05 12:14:46.337942098 +0100
-@@ -33,7 +33,7 @@
- #include <gtk/gtk.h>
- #include <glib/gi18n.h>
- 
--#include <webkit.h>
-+#include <webkit/webkit.h>
- 
- #include <moko-finger-scroll.h>
- #include <moko-stock.h>
-@@ -55,7 +55,6 @@
-     gdk_threads_init ();
-     gdk_threads_enter ();
-     gtk_init (&argc, &argv);
--    webkit_init ();
-     moko_stock_register ();
-     g_set_application_name (_("Browser"));
- 
-diff -Nurd openmoko-browser2.orig/src/open-pages-page.c openmoko-browser2/src/open-pages-page.c
---- openmoko-browser2.orig/src/open-pages-page.c	2007-12-12 20:31:07.000000000 +0100
-+++ openmoko-browser2/src/open-pages-page.c	2008-03-05 12:13:37.671282983 +0100
-@@ -28,8 +28,8 @@
- #include "open-pages-page.h"
- #include "current-page.h"
- 
--#include <webkitwebframe.h>
--#include <webkitwebview.h>
-+#include <webkit/webkitwebframe.h>
-+#include <webkit/webkitwebview.h>
- #include <moko-finger-scroll.h>
- 
- #include <glib/gi18n.h>
diff --git a/recipes/openmoko2/openmoko-browser2_svn.bb b/recipes/openmoko2/openmoko-browser2_svn.bb
deleted file mode 100644
index 4fb5699..0000000
--- a/recipes/openmoko2/openmoko-browser2_svn.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Om Webbrowser using webkit."
-SECTION = "openmoko/apps"
-DEPENDS += "intltool libmokoui2 check webkit-gtk"
-SRCREV = "4172"
-PV = "0.0.1+svnr${SRCPV}"
-PR = "r2"
-
-inherit openmoko2
-LDFLAGS_append = " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
-
-SRC_URI += "file://webkit-update.patch;minrev=3646;maxrev=4171"
-
-#SRC_URI += "file://fingerscroll.diff"
-
-do_compile_prepend() {
-        find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':"-I${STAGING_INCDIR}":g
-}
-
diff --git a/recipes/openmoko2/openmoko-calculator2/openmoko-calculator.png b/recipes/openmoko2/openmoko-calculator2/openmoko-calculator.png
deleted file mode 100644
index 2811364f8322db593fa410756dccee0137d7e6bd..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 14278
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

diff --git a/recipes/openmoko2/openmoko-calculator2_svn.bb b/recipes/openmoko2/openmoko-calculator2_svn.bb
deleted file mode 100644
index f52bbe3..0000000
--- a/recipes/openmoko2/openmoko-calculator2_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Legacy Om calculator application."
-SECTION = "openmoko/tools"
-DEPENDS = "libmokoui2"
-SRCREV = "3655"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r1"
-
-inherit openmoko2
-LICENSE = "GPL"
-SRC_URI += " file://openmoko-calculator.png "
-
-do_install_append_openmoko() {
-        install -d ${D}/${datadir}/pixmaps/
-        install ${WORKDIR}//openmoko-calculator.png ${D}/${datadir}/pixmaps/openmoko-calculator.png
-}
diff --git a/recipes/openmoko2/openmoko-dialer2/om-gta01/kernel-2.6.24.patch b/recipes/openmoko2/openmoko-dialer2/om-gta01/kernel-2.6.24.patch
deleted file mode 100644
index c6f34f4..0000000
--- a/recipes/openmoko2/openmoko-dialer2/om-gta01/kernel-2.6.24.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: openmoko-dialer2/src/phone-kit/moko-notify.c
-===================================================================
---- openmoko-dialer2/src/phone-kit/moko-notify.c.orig	2008-02-14 17:47:23.000000000 +0800
-+++ openmoko-dialer2/src/phone-kit/moko-notify.c	2008-02-14 17:48:19.000000000 +0800
-@@ -38,7 +38,7 @@
- 
- #define DEFAULT_RINGTONE "/default_ringtone.ogg"
- #define SYS_BRIGHTNESS "/sys/class/backlight/gta01-bl"
--#define SYS_VIBRATE "/sys/class/leds/gta01:vibrator"
-+#define SYS_VIBRATE "/sys/class/leds/neo1973:vibrator"
- 
- struct _MokoNotifyPrivate
- {
diff --git a/recipes/openmoko2/openmoko-dialer2/om-gta02/kernel-2.6.24.patch b/recipes/openmoko2/openmoko-dialer2/om-gta02/kernel-2.6.24.patch
deleted file mode 100644
index 72c516f..0000000
--- a/recipes/openmoko2/openmoko-dialer2/om-gta02/kernel-2.6.24.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: openmoko-dialer2/src/phone-kit/moko-notify.c
-===================================================================
---- openmoko-dialer2/src/phone-kit/moko-notify.c	(revision 4051)
-+++ openmoko-dialer2/src/phone-kit/moko-notify.c	(working copy)
-@@ -37,8 +37,8 @@
-         MOKO_TYPE_NOTIFY, MokoNotifyPrivate))
- 
- #define DEFAULT_RINGTONE "/default_ringtone.ogg"
--#define SYS_BRIGHTNESS "/sys/class/backlight/gta01-bl"
--#define SYS_VIBRATE "/sys/class/leds/gta01:vibrator"
-+#define SYS_BRIGHTNESS "/sys/class/backlight/pcf50633-bl"
-+#define SYS_VIBRATE "/sys/class/leds/neo1973:vibrator"
- 
- struct _MokoNotifyPrivate
- {
diff --git a/recipes/openmoko2/openmoko-dialer2_svn.bb b/recipes/openmoko2/openmoko-dialer2_svn.bb
deleted file mode 100644
index 33b90ff..0000000
--- a/recipes/openmoko2/openmoko-dialer2_svn.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-DESCRIPTION = "Legacy Om dialer."
-SECTION = "openmoko/pim"
-DEPENDS = "libgsmd libjana libmokoui2 libmokojournal2 pulseaudio libnotify"
-SRCREV = "4364"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r9"
-PE = "1"
-
-inherit openmoko2
-
-SRC_URI_append_om-gta01 = " file://kernel-2.6.24.patch"
-SRC_URI_append_om-gta02 = " file://kernel-2.6.24.patch"
-
-EXTRA_OECONF = "--with-dbusbindir=${STAGING_BINDIR_NATIVE}"
-
-FILES_${PN} += "${datadir}/openmoko-dialer/ ${datadir}/dbus-1/services/"
diff --git a/recipes/openmoko2/openmoko-feedreader2_svn.bb b/recipes/openmoko2/openmoko-feedreader2_svn.bb
deleted file mode 100644
index 550832e..0000000
--- a/recipes/openmoko2/openmoko-feedreader2_svn.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-DESCRIPTION = "The Openmoko Feed Reader"
-SECTION = "openmoko/apps"
-DEPENDS += "libmokoui2 libmrss check webkit-gtk"
-SRCREV = "3645"
-PV = "0.0.1+svnr${SRCPV}"
-PR = "r1"
-
-inherit openmoko2
diff --git a/recipes/openmoko2/openmoko-firststart2_svn.bb b/recipes/openmoko2/openmoko-firststart2_svn.bb
deleted file mode 100644
index 68c2110..0000000
--- a/recipes/openmoko2/openmoko-firststart2_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "The Openmoko First Start Wizard"
-SECTION = "openmoko/apps"
-DEPENDS += "libmokoui2 libglade"
-SRCREV = "3158"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r0"
-
-inherit openmoko2
-
-FILES_${PN} += "${datadir}"
diff --git a/recipes/openmoko2/openmoko-mediaplayer2_svn.bb b/recipes/openmoko2/openmoko-mediaplayer2_svn.bb
deleted file mode 100644
index 897483a..0000000
--- a/recipes/openmoko2/openmoko-mediaplayer2_svn.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-DESCRIPTION = "Om application for playing media files."
-SECTION = "openmoko/tools"
-DEPENDS = "libmokoui2 expat gstreamer libspiff curl"
-RDEPENDS_${PN} = "gst-meta-audio gconf gst-plugin-alsa"
-SRCREV = "4750"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r7"
-
-inherit openmoko2
-
-FILES_${PN} += "${datadir}/openmoko-mediaplayer"
-
-do_install_append() {
-	install -d ${D}${sysconfdir}/gconf/schemas
-	install -m 0644 ${S}/openmoko-mediaplayer.schemas ${D}${sysconfdir}/gconf/schemas/openmoko-mediaplayer.schemas
-}
-
-pkg_postinst_openmoko-mediaplayer2 () {
-#!/bin/sh -e
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
-
-export GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source`
-gconftool-2 --makefile-install-rule ${sysconfdir}/gconf/schemas/openmoko-mediaplayer.schemas > /dev/null
-}
diff --git a/recipes/openmoko2/openmoko-messages2_svn.bb b/recipes/openmoko2/openmoko-messages2_svn.bb
deleted file mode 100644
index 81a0d8d..0000000
--- a/recipes/openmoko2/openmoko-messages2_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Legacy Om application for sms."
-SECTION = "openmoko/pim"
-DEPENDS = "libmokogsmd2 libmokoui2 libmokojournal2 libjana"
-SRCREV = "4340"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r2"
-
-inherit openmoko2
-
-EXTRA_OECONF = "--with-dbusbindir=${STAGING_BINDIR_NATIVE}"
-
-FILES_${PN} += "${datadir}/openmoko-messages/ ${datadir}/dbus-1/services/"
diff --git a/recipes/openmoko2/openmoko-sample2_svn.bb b/recipes/openmoko2/openmoko-sample2_svn.bb
deleted file mode 100644
index d5eb61d..0000000
--- a/recipes/openmoko2/openmoko-sample2_svn.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "The Openmoko Sample Project"
-SECTION = "openmoko/applications"
-DEPENDS = "libmokoui2 intltool gconf"
-SRCREV = "3537"
-PV = "0.0.1+svnr${SRCPV}"
-PR = "r0"
-
-inherit openmoko2
-
-PACKAGES += "${PN}-src"
-# path should match the toolchain path
-FILES_${PN}-src = "/usr/local/openmoko"
-PACKAGE_ARCH_${PN}-src = "${BUILD_ARCH}-all-sdk"
-
-do_configure_prepend() {
-	install -d ${WORKDIR}/source
-	cp -pPR ${S} ${WORKDIR}/source/
-	find ${WORKDIR}/source -name ".svn"|xargs rm -rf
-}
-
-do_install_append() {
-	install -d ${D}/usr/local/openmoko/source/
-	cp -pPR ${WORKDIR}/source/* ${D}/usr/local/openmoko/source/
-}
-
diff --git a/recipes/openmoko2/openmoko-today2-folders_svn.bb b/recipes/openmoko2/openmoko-today2-folders_svn.bb
deleted file mode 100644
index d2badfb..0000000
--- a/recipes/openmoko2/openmoko-today2-folders_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "The Openmoko Today2 vfolder files"
-SECTION = "openmoko/misc"
-SRCREV = "3704"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r3"
-RCONFLICTS_${PN} = "matchbox-common"
-
-inherit openmoko2
-
-FILES_${PN} += "${datadir}"
diff --git a/recipes/openmoko2/openmoko-today2_svn.bb b/recipes/openmoko2/openmoko-today2_svn.bb
deleted file mode 100644
index 6feee46..0000000
--- a/recipes/openmoko2/openmoko-today2_svn.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "The Openmoko Application Launcher"
-SECTION = "openmoko/pim"
-DEPENDS = "libmokoui2 libmokojournal2 libjana startup-notification dbus-glib libice libsm"
-RDEPENDS_${PN} = "libedata-cal openmoko-today2-folders"
-SRCREV = "4168"
-PV = "0.1.0+svnr${SRCPV}"
-PR = "r3"
-
-inherit openmoko2 gtk-icon-cache 
diff --git a/recipes/openmoko2/openmoko-worldclock2_svn.bb b/recipes/openmoko2/openmoko-worldclock2_svn.bb
deleted file mode 100644
index fad55a9..0000000
--- a/recipes/openmoko2/openmoko-worldclock2_svn.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-DESCRIPTION = "A World-Clock for Openmoko"
-SECTION = "openmoko/tools"
-DEPENDS = "libmokoui2 libjana"
-SRCREV = "3365"
-PV = "0.1.0+svnr${SRCPV}"
-
-inherit openmoko2
-- 
1.7.3.1



