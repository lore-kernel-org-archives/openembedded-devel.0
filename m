Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id A8235755FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Oct 2015 22:30:45 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so3276448wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Oct 2015 15:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=38KYMDR84lpFU8pk0WkVbmKVgS/+1hEidaQ/mQMF3AE=;
	b=WavWk3kvM3l3pouihj8Hs0BhhtATkMTBaU0SqHOTzD32jx5beyOiNk71SHeHdmz7Hm
	aiUavr2El4ZxLnd7hUyXjZmMjH2uPFcVMYNjC6Kn4rYYIUIcZqHRm8wTG2/GOVLlgR/r
	L3Fz7zmhhNikNmR8dhEEv0G1s4TozicXGpC1iEksv28Ci0loknPREwaNUZyHOo2xDUEm
	L0e2kYnAmSFpV7Fi3GTT0bPNafUTprc7SIVyU4ZH6GlIfJKdIKHr+Lqe7TdSyhqAa7SN
	3oZKykdVg1kv1HYGkKcIAhkxp3Vt5ErlarmmURRgsNOWV8JWYRcyahVdX3VsILsmUo7a
	lcJA==
X-Received: by 10.180.10.197 with SMTP id k5mr18681554wib.22.1444170645106;
	Tue, 06 Oct 2015 15:30:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lv4sm35095435wjb.43.2015.10.06.15.30.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Oct 2015 15:30:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Oct 2015 00:30:41 +0200
Message-Id: <1444170642-23088-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
References: <1444170642-23088-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 7/8] Revert "epdfview: move to nonworking"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Oct 2015 22:30:47 -0000

* use PNBLACKLIST instead

This reverts commit a9733d04fad02e466919b730ad7e158cbb71042c.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../epdfview/epdfview/browser_command.patch        | 17 +++++++++
 .../epdfview/epdfview/fix-format.patch             | 19 ++++++++++
 .../epdfview/epdfview/glib-single-include.patch    | 17 +++++++++
 .../epdfview/epdfview/swap-colors.patch            | 43 ++++++++++++++++++++++
 meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb | 25 +++++++++++++
 .../epdfview/epdfview/browser_command.patch        | 17 ---------
 .../nonworking/epdfview/epdfview/fix-format.patch  | 19 ----------
 .../epdfview/epdfview/glib-single-include.patch    | 17 ---------
 .../nonworking/epdfview/epdfview/swap-colors.patch | 43 ----------------------
 .../nonworking/epdfview/epdfview_0.1.8.bb          | 21 -----------
 10 files changed, 121 insertions(+), 117 deletions(-)
 create mode 100644 meta-gnome/recipes-apps/epdfview/epdfview/browser_command.patch
 create mode 100644 meta-gnome/recipes-apps/epdfview/epdfview/fix-format.patch
 create mode 100644 meta-gnome/recipes-apps/epdfview/epdfview/glib-single-include.patch
 create mode 100644 meta-gnome/recipes-apps/epdfview/epdfview/swap-colors.patch
 create mode 100644 meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
 delete mode 100644 meta-gnome/recipes-apps/nonworking/epdfview/epdfview/browser_command.patch
 delete mode 100644 meta-gnome/recipes-apps/nonworking/epdfview/epdfview/fix-format.patch
 delete mode 100644 meta-gnome/recipes-apps/nonworking/epdfview/epdfview/glib-single-include.patch
 delete mode 100644 meta-gnome/recipes-apps/nonworking/epdfview/epdfview/swap-colors.patch
 delete mode 100644 meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb

diff --git a/meta-gnome/recipes-apps/epdfview/epdfview/browser_command.patch b/meta-gnome/recipes-apps/epdfview/epdfview/browser_command.patch
new file mode 100644
index 0000000..75e45e0
--- /dev/null
+++ b/meta-gnome/recipes-apps/epdfview/epdfview/browser_command.patch
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
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview/fix-format.patch b/meta-gnome/recipes-apps/epdfview/epdfview/fix-format.patch
new file mode 100644
index 0000000..8ad5b97
--- /dev/null
+++ b/meta-gnome/recipes-apps/epdfview/epdfview/fix-format.patch
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
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview/glib-single-include.patch b/meta-gnome/recipes-apps/epdfview/epdfview/glib-single-include.patch
new file mode 100644
index 0000000..84a4913
--- /dev/null
+++ b/meta-gnome/recipes-apps/epdfview/epdfview/glib-single-include.patch
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
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview/swap-colors.patch b/meta-gnome/recipes-apps/epdfview/epdfview/swap-colors.patch
new file mode 100644
index 0000000..282bfb1
--- /dev/null
+++ b/meta-gnome/recipes-apps/epdfview/epdfview/swap-colors.patch
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
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb b/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
new file mode 100644
index 0000000..b6509ea
--- /dev/null
+++ b/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
@@ -0,0 +1,25 @@
+SUMMARY = "A lightweight PDF viewer based on gtk and poppler"
+HOMEPAGE = "http://www.emma-soft.com/projects/epdfview/"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+SECTION = "x11/applications"
+DEPENDS = "gtk+ poppler"
+
+PR = "r3"
+
+EXTRA_OECONF += "--without-cups"
+
+inherit autotools gettext
+
+SRC_URI = "http://www.emma-soft.com/projects/${BPN}/chrome/site/releases/${BP}.tar.bz2 \
+           file://browser_command.patch \
+           file://fix-format.patch \
+           file://glib-single-include.patch \
+           file://swap-colors.patch \
+"
+SRC_URI[md5sum] = "e50285b01612169b2594fea375f53ae4"
+SRC_URI[sha256sum] = "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d6b846a8de0f2f8f0"
+
+PNBLACKLIST[epdfview] ?= "BROKEN: images are not displayed anymore
+# There will be no further development / upstream is gone [1]
+# [1] https://bugzilla.redhat.com/show_bug.cgi?id=906121
diff --git a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/browser_command.patch b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/browser_command.patch
deleted file mode 100644
index 75e45e0..0000000
--- a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/browser_command.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Imported from Debian 0.1.8-3
-
-Upstream-Status: Pending
-
-diff --git a/src/Config.cxx b/src/Config.cxx
-index 28f37ab..bc58819 100644
---- a/src/Config.cxx
-+++ b/src/Config.cxx
-@@ -22,7 +22,7 @@
- using namespace ePDFView;
- 
- // Constants
--static const gchar *DEFAULT_EXTERNAL_BROWSER_COMMAND_LINE = "firefox %s";
-+static const gchar *DEFAULT_EXTERNAL_BROWSER_COMMAND_LINE = "x-www-browser %s";
- static const gchar *DEFAULT_OPEN_FILE_FOLDER = NULL;
- static const gchar *DEFAULT_SAVE_FILE_FOLDER = NULL;
- static const gboolean DEFAULT_SHOW_STATUSBAR = TRUE;
diff --git a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/fix-format.patch b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/fix-format.patch
deleted file mode 100644
index 8ad5b97..0000000
--- a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/fix-format.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Imported from Debian 0.1.8-3
-
-Upstream-Status: Pending
-
-diff --git a/src/gtk/MainView.cxx b/src/gtk/MainView.cxx
-index b983bff..f87de28 100644
---- a/src/gtk/MainView.cxx
-+++ b/src/gtk/MainView.cxx
-@@ -634,8 +634,9 @@ MainView::showErrorMessage (const gchar *title, const gchar *body)
-             GTK_DIALOG_DESTROY_WITH_PARENT,
-             GTK_MESSAGE_ERROR,
-             GTK_BUTTONS_OK,
-+            "%s",
-             title);
--    gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG(errorDialog),
-+    gtk_message_dialog_format_secondary_text (GTK_MESSAGE_DIALOG(errorDialog), "%s",
-                                               body);
-     gtk_dialog_run (GTK_DIALOG (errorDialog));
-     gtk_widget_destroy (errorDialog);
diff --git a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/glib-single-include.patch b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/glib-single-include.patch
deleted file mode 100644
index 84a4913..0000000
--- a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/glib-single-include.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Imported from Debian 0.1.8-3
-
-Upstream-Status: Pending
-
-diff --git a/src/gtk/StockIcons.h b/src/gtk/StockIcons.h
-index c142a7a..58fcf2e 100644
---- a/src/gtk/StockIcons.h
-+++ b/src/gtk/StockIcons.h
-@@ -18,7 +18,7 @@
- #if !defined (__STOCK_ICONS_H__)
- #define __STOCK_ICONS_H__
- 
--#include <glib/gmacros.h>
-+#include <glib.h>
- 
- G_BEGIN_DECLS
- 
diff --git a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/swap-colors.patch b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/swap-colors.patch
deleted file mode 100644
index 282bfb1..0000000
--- a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview/swap-colors.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Imported from Debian 0.1.8-3
-
-Upstream-Status: Pending
-
-Index: trunk/src/PDFDocument.cxx
-===================================================================
---- trunk/src/PDFDocument.cxx	(revision 361)
-+++ trunk/src/PDFDocument.cxx	(revision 367)
-@@ -21,4 +21,5 @@
- #include <poppler.h>
- #include <unistd.h>
-+#include <algorithm>
- #include "epdfview.h"
- 
-@@ -33,4 +34,22 @@
- static PageMode convertPageMode (gint pageMode);
- static gchar *getAbsoluteFileName (const gchar *fileName);
-+
-+namespace
-+{
-+    void
-+    convert_bgra_to_rgba (guint8 *data, int width, int height)
-+    {
-+        using std::swap;
-+
-+        for (int y = 0; y < height; y++)
-+        {
-+            for (int x = 0; x < width; x++)
-+            {
-+                swap(data[0], data[2]);
-+                data += 4;
-+            }
-+        }
-+    }
-+}
- 
- ///
-@@ -651,4 +670,5 @@
-         cairo_destroy(context);
-         cairo_surface_destroy (surface);
-+        convert_bgra_to_rgba(renderedPage->getData (), width, height);
- #else // !HAVE_POPPLER_0_17_0
-         // Create the pixbuf from the data and render to it.
diff --git a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb b/meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb
deleted file mode 100644
index 9167cd3..0000000
--- a/meta-gnome/recipes-apps/nonworking/epdfview/epdfview_0.1.8.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "A lightweight PDF viewer based on gtk and poppler"
-HOMEPAGE = "http://www.emma-soft.com/projects/epdfview/"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-SECTION = "x11/applications"
-DEPENDS = "gtk+ poppler"
-
-PR = "r3"
-
-EXTRA_OECONF += "--without-cups"
-
-inherit autotools gettext
-
-SRC_URI = "http://www.emma-soft.com/projects/${BPN}/chrome/site/releases/${BP}.tar.bz2 \
-           file://browser_command.patch \
-           file://fix-format.patch \
-           file://glib-single-include.patch \
-           file://swap-colors.patch \
-"
-SRC_URI[md5sum] = "e50285b01612169b2594fea375f53ae4"
-SRC_URI[sha256sum] = "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d6b846a8de0f2f8f0"
-- 
2.6.0


