Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TQkGJ-0006u3-9q
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 21:35:39 +0200
Received: by mail-gg0-f175.google.com with SMTP id p1so838956ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 12:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=VJEGwUv4IHg8jWxugT0jo7OzIF2GcL/c4unK9jJm6bw=;
	b=mh5RZmU1LhkqaxgQYfPeLsGPEyQu/fj357hWyXkA9+J800DH2h3TKt18RqizRBtN4a
	xo15CSeUxZthWofzKVE8KimtzS07ok6W3uOCA95OdTakqQ39jNoyWYdpoDnxFkiBymG5
	XvcDt6CuwmCXuYHA1kNWlmn7SvdLjAQlEe97leVtgh/V+Waz+DJslg9ydPo99Z8VI/C1
	UPKhJQnNhY8xjNMnPcyD0TrlXpN+45OTYzASU+VdAgekInXAdtjexJKzmkcFA5yYEYUY
	ssDC2ZRJM58T74DxcovLAGLg8Ant8Ccf58sseiU6A1H+vK6fIkSNNjbu/gjOE3u/D+rt
	XCQw==
Received: by 10.236.193.71 with SMTP id j47mr12570825yhn.79.1351020132531;
	Tue, 23 Oct 2012 12:22:12 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id u13sm11444414anl.5.2012.10.23.12.22.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 12:22:11 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2012 17:22:02 -0200
Message-Id: <1351020123-22871-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] epdfview: Sync with Debian 0.1.8-3 patches
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
X-List-Received-Date: Tue, 23 Oct 2012 19:35:39 -0000

This includes the patches in use in Debian package to fix color
inversion and other minor issues.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-efl/efl/epdfview/browser_command.patch |   17 ++++++++
 meta-efl/recipes-efl/efl/epdfview/fix-format.patch |   19 +++++++++
 meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch  |   12 -----
 .../efl/epdfview/glib-single-include.patch         |   17 ++++++++
 .../recipes-efl/efl/epdfview/swap-colors.patch     |   43 ++++++++++++++++++++
 meta-efl/recipes-efl/efl/epdfview_0.1.8.bb         |    7 ++-
 6 files changed, 101 insertions(+), 14 deletions(-)
 create mode 100644 meta-efl/recipes-efl/efl/epdfview/browser_command.patch
 create mode 100644 meta-efl/recipes-efl/efl/epdfview/fix-format.patch
 delete mode 100644 meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch
 create mode 100644 meta-efl/recipes-efl/efl/epdfview/glib-single-include.patch
 create mode 100644 meta-efl/recipes-efl/efl/epdfview/swap-colors.patch

diff --git a/meta-efl/recipes-efl/efl/epdfview/browser_command.patch b/meta-efl/recipes-efl/efl/epdfview/browser_command.patch
new file mode 100644
index 0000000..75e45e0
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdfview/browser_command.patch
@@ -0,0 +1,17 @@
+Imported from Debian 0.1.8-3
+
+Upstream-Status: Pending
+
+diff --git a/src/Config.cxx b/src/Config.cxx
+index 28f37ab..bc58819 100644
+--- a/src/Config.cxx
++++ b/src/Config.cxx
+@@ -22,7 +22,7 @@
+ using namespace ePDFView;
+ 
+ // Constants
+-static const gchar *DEFAULT_EXTERNAL_BROWSER_COMMAND_LINE = "firefox %s";
++static const gchar *DEFAULT_EXTERNAL_BROWSER_COMMAND_LINE = "x-www-browser %s";
+ static const gchar *DEFAULT_OPEN_FILE_FOLDER = NULL;
+ static const gchar *DEFAULT_SAVE_FILE_FOLDER = NULL;
+ static const gboolean DEFAULT_SHOW_STATUSBAR = TRUE;
diff --git a/meta-efl/recipes-efl/efl/epdfview/fix-format.patch b/meta-efl/recipes-efl/efl/epdfview/fix-format.patch
new file mode 100644
index 0000000..8ad5b97
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdfview/fix-format.patch
@@ -0,0 +1,19 @@
+Imported from Debian 0.1.8-3
+
+Upstream-Status: Pending
+
+diff --git a/src/gtk/MainView.cxx b/src/gtk/MainView.cxx
+index b983bff..f87de28 100644
+--- a/src/gtk/MainView.cxx
++++ b/src/gtk/MainView.cxx
+@@ -634,8 +634,9 @@ MainView::showErrorMessage (const gchar *title, const gchar *body)
+             GTK_DIALOG_DESTROY_WITH_PARENT,
+             GTK_MESSAGE_ERROR,
+             GTK_BUTTONS_OK,
++            "%s",
+             title);
+-    gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG(errorDialog),
++    gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG(errorDialog), "%s",
+                                               body);
+     gtk_dialog_run (GTK_DIALOG (errorDialog));
+     gtk_widget_destroy (errorDialog);
diff --git a/meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch b/meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch
deleted file mode 100644
index e08584c..0000000
--- a/meta-efl/recipes-efl/efl/epdfview/glib-2.32.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr epdfview-0.1.8.orig/src/gtk/StockIcons.h epdfview-0.1.8/src/gtk/StockIcons.h
---- epdfview-0.1.8.orig/src/gtk/StockIcons.h	2011-05-28 12:24:57.000000000 +0200
-+++ epdfview-0.1.8/src/gtk/StockIcons.h	2012-04-30 07:48:08.528285594 +0200
-@@ -18,8 +18,6 @@
- #if !defined (__STOCK_ICONS_H__)
- #define __STOCK_ICONS_H__
- 
--#include <glib/gmacros.h>
--
- G_BEGIN_DECLS
- 
- // ePDFView stock icons.
diff --git a/meta-efl/recipes-efl/efl/epdfview/glib-single-include.patch b/meta-efl/recipes-efl/efl/epdfview/glib-single-include.patch
new file mode 100644
index 0000000..84a4913
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdfview/glib-single-include.patch
@@ -0,0 +1,17 @@
+Imported from Debian 0.1.8-3
+
+Upstream-Status: Pending
+
+diff --git a/src/gtk/StockIcons.h b/src/gtk/StockIcons.h
+index c142a7a..58fcf2e 100644
+--- a/src/gtk/StockIcons.h
++++ b/src/gtk/StockIcons.h
+@@ -18,7 +18,7 @@
+ #if !defined (__STOCK_ICONS_H__)
+ #define __STOCK_ICONS_H__
+ 
+-#include <glib/gmacros.h>
++#include <glib.h>
+ 
+ G_BEGIN_DECLS
+ 
diff --git a/meta-efl/recipes-efl/efl/epdfview/swap-colors.patch b/meta-efl/recipes-efl/efl/epdfview/swap-colors.patch
new file mode 100644
index 0000000..2949c7b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/epdfview/swap-colors.patch
@@ -0,0 +1,43 @@
+Imported from Debian 0.1.8-3
+
+Upstream-Status: Pending
+
+Index: trunk/src/PDFDocument.cxx
+===================================================================
+--- trunk/src/PDFDocument.cxx	(revision 361)
++++ trunk/src/PDFDocument.cxx	(revision 367)
+@@ -21,4 +21,5 @@
+ #include <poppler.h>
+ #include <unistd.h>
++#include <algorithm>
+ #include "epdfview.h"
+ 
+@@ -33,4 +34,22 @@
+ static PageMode convertPageMode (gint pageMode);
+ static gchar *getAbsoluteFileName (const gchar *fileName);
++
++namespace
++{
++    void
++    convert_bgra_to_rgba (guint8 *data, int width, int height)
++    {
++        using std::swap;
++
++        for (int y = 0; y < height; y++)
++        {
++            for (int x = 0; x < width; x++)
++            {
++                swap(data[0], data[2]);
++                data += 4;
++            }
++        }
++    }
++}
+ 
+ ///
+@@ -651,4 +670,5 @@
+         cairo_destroy(context);
+         cairo_surface_destroy (surface);
++        convert_bgra_to_rgba(renderedPage->getData (), width, height);
+ #else // !HAVE_POPPLER_0_17_0
+         // Create the pixbuf from the data and render to it.
diff --git a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
index c16137e..53951e1 100644
--- a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
+++ b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
@@ -5,14 +5,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "x11/applications"
 DEPENDS = "gtk+ poppler"
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF += "--without-cups"
 
 inherit autotools gettext
 
 SRC_URI = "http://www.emma-soft.com/projects/${BPN}/chrome/site/releases/${BP}.tar.bz2 \
-  file://glib-2.32.patch \
+           file://browser_command.patch \
+           file://fix-format.patch \
+           file://glib-single-include.patch \
+           file://swap-colors.patch \
 "
 SRC_URI[md5sum] = "e50285b01612169b2594fea375f53ae4"
 SRC_URI[sha256sum] = "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d6b846a8de0f2f8f0"
-- 
1.7.2.5



