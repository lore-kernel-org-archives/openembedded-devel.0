Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RIQC8-0001tZ-SY
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 21:28:25 +0200
Received: (qmail invoked by alias); 24 Oct 2011 19:22:20 -0000
Received: from p4FDF19E4.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.25.228]
	by mail.gmx.net (mp044) with SMTP; 24 Oct 2011 21:22:20 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+yfMYgu6CyPFwHlPdPDHDDZeq2taNJcmUwZGfKLt
	CexREThpkN91SO
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 21:26:57 +0200
Message-Id: <1319484417-20399-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1319484417-20399-1-git-send-email-schnitzeltony@gmx.de>
References: <1319484417-20399-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 3/3] xfce4-datetime-plugin: Initial add git (0.6.1)
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
X-List-Received-Date: Mon, 24 Oct 2011 19:28:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 0.6.1 was release about 3 years ago. The patch to migrate from
libxfcegui4->libxfce4ui hopefully shall be applied mainline [1]. It would have
caused extra efforts to base the patch on 0.6.1 release.

[1] https://bugzilla.xfce.org/show_bug.cgi?id=8064

Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../datetime/files/port-to-libxfce4ui.patch        |  360 ++++++++++++++++++++
 .../datetime/xfce4-datetime-plugin_git.bb          |   20 ++
 2 files changed, 380 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/datetime/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_git.bb

diff --git a/meta-xfce/recipes-panel-plugins/datetime/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/datetime/files/port-to-libxfce4ui.patch
new file mode 100644
index 0000000..aab20ca
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/datetime/files/port-to-libxfce4ui.patch
@@ -0,0 +1,360 @@
+From 2041c011c62e13c5bc1f0824733bc34ebb8a8bfe Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
+Date: Sun, 23 Oct 2011 20:14:42 +0200
+Subject: [PATCH] port to libxfce4ui
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
+---
+ configure.ac.in                |    9 +--
+ panel-plugin/Makefile.am       |    8 +-
+ panel-plugin/datetime-dialog.c |    8 +-
+ panel-plugin/datetime.c        |    4 +-
+ panel-plugin/xfce46-compat.c   |  193 ----------------------------------------
+ panel-plugin/xfce46-compat.h   |   20 ----
+ 6 files changed, 11 insertions(+), 231 deletions(-)
+ delete mode 100644 panel-plugin/xfce46-compat.c
+ delete mode 100644 panel-plugin/xfce46-compat.h
+
+diff --git a/configure.ac.in b/configure.ac.in
+index 4d58211..5200268 100644
+--- a/configure.ac.in
++++ b/configure.ac.in
+@@ -31,12 +31,9 @@ XDT_I18N([@LINGUAS@])
+ 
+ dnl Check for required packages
+ XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.6.0])
+-XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.99.2])
+-XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.3.99.2])
+-XDT_CHECK_PACKAGE([LIBXFCE4PANEL],[libxfce4panel-1.0],[4.3.99.2])
+-
+-dnl check for optional packages/versions
+-XDT_CHECK_OPTIONAL_PACKAGE([LIBXFCE4PANEL_46], [libxfce4panel-1.0], [4.5.92], [libxfce4panel46], [Take advantage of Xfce 4.6 panel changes])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
++XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.8.0])
++XDT_CHECK_PACKAGE([LIBXFCE4PANEL],[libxfce4panel-1.0],[4.8.0])
+ 
+ #CFLAGS="$CFLAGS -Wall -Werror"
+ 
+diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
+index 4005f85..18bbc7e 100644
+--- a/panel-plugin/Makefile.am
++++ b/panel-plugin/Makefile.am
+@@ -7,16 +7,14 @@ libdatetime_la_SOURCES = 			\
+ 	datetime.h				\
+ 	datetime.c				\
+ 	datetime-dialog.h			\
+-	datetime-dialog.c			\
+-	xfce46-compat.h				\
+-	xfce46-compat.c
++	datetime-dialog.c
+ 
+ libdatetime_la_CFLAGS = 			\
+ 	-I$(top_srcdir)				\
+ 	-DLOCALEDIR=\"$(localedir)\"		\
+ 	$(GTK_CFLAGS)				\
+ 	$(LIBXFCE4PANEL_CFLAGS)			\
+-	$(LIBXFCEGUI4_CFLAGS)			\
++	$(LIBXFCE4UI_CFLAGS)			\
+ 	$(LIBXFCE4UTIL_CFLAGS)
+ 
+ libdatetime_la_LDFLAGS = 			\
+@@ -31,7 +29,7 @@ endif
+ libdatetime_la_LIBADD = 			\
+ 	$(GTK_LIBS)				\
+ 	$(LIBXFCE4PANEL_LIBS)			\
+-	$(LIBXFCEGUI4_LIBS)			\
++	$(LIBXFCE4UI_LIBS)			\
+ 	$(LIBXFCE4UTIL_LIBS)
+ 
+ desktopdir = $(datadir)/xfce4/panel-plugins
+diff --git a/panel-plugin/datetime-dialog.c b/panel-plugin/datetime-dialog.c
+index 193587e..4ef3ab8 100644
+--- a/panel-plugin/datetime-dialog.c
++++ b/panel-plugin/datetime-dialog.c
+@@ -28,7 +28,7 @@
+ #include <string.h>
+ 
+ /* xfce includes */
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #include <libxfce4util/libxfce4util.h>
+ #include <libxfce4panel/xfce-panel-plugin.h>
+ 
+@@ -388,7 +388,7 @@ datetime_properties_dialog(XfcePanelPlugin *plugin, t_datetime * datetime)
+   /*
+    * layout frame
+    */
+-  frame = xfce_create_framebox(_("Layout"), &bin);
++  frame = xfce_gtk_frame_box_new(_("Layout"), &bin);
+   gtk_box_pack_start(GTK_BOX(GTK_DIALOG(dlg)->vbox), frame,
+       FALSE, FALSE, 0);
+   gtk_container_set_border_width(GTK_CONTAINER(frame), 6);
+@@ -422,7 +422,7 @@ datetime_properties_dialog(XfcePanelPlugin *plugin, t_datetime * datetime)
+   /*
+    * Date frame
+    */
+-  datetime->date_frame = xfce_create_framebox(_("Date"), &bin);
++  datetime->date_frame = xfce_gtk_frame_box_new(_("Date"), &bin);
+   gtk_box_pack_start(GTK_BOX(GTK_DIALOG(dlg)->vbox), datetime->date_frame,
+       FALSE, FALSE, 0);
+   gtk_container_set_border_width(GTK_CONTAINER(datetime->date_frame), 6);
+@@ -525,7 +525,7 @@ datetime_properties_dialog(XfcePanelPlugin *plugin, t_datetime * datetime)
+   /*
+    * time frame
+    */
+-  datetime->time_frame = xfce_create_framebox(_("Time"), &bin);
++  datetime->time_frame = xfce_gtk_frame_box_new(_("Time"), &bin);
+   gtk_box_pack_start(GTK_BOX(GTK_DIALOG(dlg)->vbox), datetime->time_frame,
+       FALSE, FALSE, 0);
+   gtk_container_set_border_width(GTK_CONTAINER(datetime->time_frame), 6);
+diff --git a/panel-plugin/datetime.c b/panel-plugin/datetime.c
+index 30ee04a..0738889 100644
+--- a/panel-plugin/datetime.c
++++ b/panel-plugin/datetime.c
+@@ -28,13 +28,11 @@
+ #include <string.h>
+ 
+ /* xfce includes */
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #include <libxfce4util/libxfce4util.h>
+ #include <libxfce4panel/xfce-panel-plugin.h>
+ #include <libxfce4panel/xfce-panel-convenience.h>
+ 
+-#include "xfce46-compat.h"
+-
+ #include "datetime.h"
+ #include "datetime-dialog.h"
+ 
+diff --git a/panel-plugin/xfce46-compat.c b/panel-plugin/xfce46-compat.c
+deleted file mode 100644
+index 97f10b1..0000000
+--- a/panel-plugin/xfce46-compat.c
++++ /dev/null
+@@ -1,193 +0,0 @@
+-/*
+- * Code was taken from libxfce4panel (LGPL2 or any later version),
+- * distributed here under the GPL.
+- *
+- * Copyright (c) 2005-2007 Jasper Huijsmans <jasper@xfce.org>
+- *
+- *  This program is free software; you can redistribute it and/or modify
+- *  it under the terms of the GNU General Public License as published by
+- *  the Free Software Foundation; either version 2 of the License, or
+- *  (at your option) any later version.
+- *
+- *  This program is distributed in the hope that it will be useful,
+- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+- *  GNU Library General Public License for more details.
+- *
+- *  You should have received a copy of the GNU General Public License
+- *  along with this program; if not, write to the Free Software
+- *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+- */
+-
+-#ifdef HAVE_CONFIG_H
+-#  include <config.h>
+-#endif
+-
+-#ifndef HAVE_LIBXFCE4PANEL_46
+-
+-#include "xfce46-compat.h"
+-
+-#include <libxfce4panel/xfce-panel-plugin.h>
+-#include <libxfce4panel/xfce-panel-macros.h>
+-
+-/* support macros for debugging */
+-#ifndef NDEBUG
+-#define _panel_assert(expr)                  g_assert (expr)
+-#define _panel_assert_not_reached()          g_assert_not_reached ()
+-#define _panel_return_if_fail(expr)          g_return_if_fail (expr)
+-#define _panel_return_val_if_fail(expr, val) g_return_val_if_fail (expr, (val))
+-#else
+-#define _panel_assert(expr)                  G_STMT_START{ (void)0; }G_STMT_END
+-#define _panel_assert_not_reached()          G_STMT_START{ (void)0; }G_STMT_END
+-#define _panel_return_if_fail(expr)          G_STMT_START{ (void)0; }G_STMT_END
+-#define _panel_return_val_if_fail(expr, val) G_STMT_START{ (void)0; }G_STMT_END
+-#endif
+-
+-/**
+- * xfce_panel_plugin_arrow_type:
+- * @plugin        : an #XfcePanelPlugin
+- *
+- * Determine the #GtkArrowType for a widget that opens a menu and uses
+- *  xfce_panel_plugin_position_menu() to position the menu.
+- *
+- * Returns: The #GtkArrowType to use.
+- **/
+-GtkArrowType
+-xfce_panel_plugin_arrow_type (XfcePanelPlugin *plugin)
+-{
+-    XfceScreenPosition  position;
+-    GdkScreen          *screen;
+-    GdkRectangle        geom;
+-    gint                mon, x, y;
+-
+-    if (!GTK_WIDGET_REALIZED (plugin))
+-        return GTK_ARROW_UP;
+-
+-    position = xfce_panel_plugin_get_screen_position (plugin);
+-    switch (position)
+-    {
+-        /* top */
+-        case XFCE_SCREEN_POSITION_NW_H:
+-        case XFCE_SCREEN_POSITION_N:
+-        case XFCE_SCREEN_POSITION_NE_H:
+-            return GTK_ARROW_DOWN;
+-
+-        /* left */
+-        case XFCE_SCREEN_POSITION_NW_V:
+-        case XFCE_SCREEN_POSITION_W:
+-        case XFCE_SCREEN_POSITION_SW_V:
+-            return GTK_ARROW_RIGHT;
+-
+-        /* right */
+-        case XFCE_SCREEN_POSITION_NE_V:
+-        case XFCE_SCREEN_POSITION_E:
+-        case XFCE_SCREEN_POSITION_SE_V:
+-            return GTK_ARROW_LEFT;
+-
+-        /* bottom */
+-        case XFCE_SCREEN_POSITION_SW_H:
+-        case XFCE_SCREEN_POSITION_S:
+-        case XFCE_SCREEN_POSITION_SE_H:
+-            return GTK_ARROW_UP;
+-
+-        /* floating */
+-        default:
+-            /* get the screen information */
+-            screen = gtk_widget_get_screen (GTK_WIDGET (plugin));
+-            mon = gdk_screen_get_monitor_at_window (screen, GTK_WIDGET (plugin)->window);
+-            gdk_screen_get_monitor_geometry (screen, mon, &geom);
+-            gdk_window_get_root_origin (GTK_WIDGET (plugin)->window, &x, &y);
+-
+-            /* get the position based on the screen position */
+-            if (position == XFCE_SCREEN_POSITION_FLOATING_H)
+-                return ((y < (geom.y + geom.height / 2)) ? GTK_ARROW_DOWN : GTK_ARROW_UP);
+-            else
+-                return ((x < (geom.x + geom.width / 2)) ? GTK_ARROW_RIGHT : GTK_ARROW_LEFT);
+-    }
+-}
+-
+-
+-
+-/**
+- * xfce_panel_plugin_position_widget:
+- * @plugin        : an #XfcePanelPlugin
+- * @menu_widget   : a #GtkWidget that will be used as popup menu
+- * @attach_widget : a #GtkWidget relative to which the menu should be positioned
+- * @x             : return location for the x coordinate
+- * @y             : return location for the y coordinate
+- *
+- * The menu widget is positioned relative to @attach_widget.
+- * If @attach_widget is NULL, the menu widget is instead positioned
+- * relative to @panel_plugin.
+- *
+- * This function is intended for custom menu widgets.
+- * For a regular #GtkMenu you should use xfce_panel_plugin_position_menu()
+- * instead (as callback argument to gtk_menu_popup()).
+- *
+- * See also: xfce_panel_plugin_position_menu().
+- **/
+-void
+-xfce_panel_plugin_position_widget (XfcePanelPlugin  *plugin,
+-                                   GtkWidget        *menu_widget,
+-                                   GtkWidget        *attach_widget,
+-                                   gint             *x,
+-                                   gint             *y)
+-{
+-    GtkRequisition  req;
+-    GdkScreen      *screen;
+-    GdkRectangle    geom;
+-    gint            mon;
+-
+-    _panel_return_if_fail (XFCE_IS_PANEL_PLUGIN (plugin));
+-    _panel_return_if_fail (GTK_IS_WIDGET (menu_widget));
+-    _panel_return_if_fail (attach_widget == NULL || GTK_IS_WIDGET (attach_widget));
+-
+-    if (attach_widget == NULL)
+-        attach_widget = GTK_WIDGET (plugin);
+-
+-    if (!GTK_WIDGET_REALIZED (menu_widget))
+-        gtk_widget_realize (menu_widget);
+-
+-    gtk_widget_size_request (menu_widget, &req);
+-    gdk_window_get_origin (attach_widget->window, x, y);
+-
+-    switch (xfce_panel_plugin_arrow_type (plugin))
+-    {
+-        case GTK_ARROW_UP:
+-            *y -= req.height;
+-            break;
+-
+-        case GTK_ARROW_DOWN:
+-            *y += attach_widget->allocation.height;
+-            break;
+-
+-        case GTK_ARROW_LEFT:
+-            *x -= req.width;
+-            break;
+-
+-        default: /* GTK_ARROW_RIGHT and GTK_ARROW_NONE */
+-            *x += attach_widget->allocation.width;
+-            break;
+-    }
+-
+-    screen = gtk_widget_get_screen (attach_widget);
+-    mon = gdk_screen_get_monitor_at_window (screen, attach_widget->window);
+-    gdk_screen_get_monitor_geometry (screen, mon, &geom);
+-
+-    /* keep inside the screen */
+-    if (*x > geom.x + geom.width - req.width)
+-        *x = geom.x + geom.width - req.width;
+-    if (*x < geom.x)
+-        *x = geom.x;
+-    if (*y > geom.y + geom.height - req.height)
+-        *y = geom.y + geom.height - req.height;
+-    if (*y < geom.y)
+-        *y = geom.y;
+-
+-    if (G_LIKELY (GTK_IS_MENU (menu_widget)))
+-        gtk_menu_set_screen (GTK_MENU (menu_widget), screen);
+-    else if (GTK_IS_WINDOW (menu_widget))
+-        gtk_window_set_screen (GTK_WINDOW (menu_widget), screen);
+-}
+-
+-#endif
+diff --git a/panel-plugin/xfce46-compat.h b/panel-plugin/xfce46-compat.h
+deleted file mode 100644
+index d385ec4..0000000
+--- a/panel-plugin/xfce46-compat.h
++++ /dev/null
+@@ -1,20 +0,0 @@
+-#ifndef _XFCE46_COMPAT
+-#define _XFCE46_COMPAT
+-
+-#ifdef HAVE_CONFIG_H
+-#  include <config.h>
+-#endif
+-
+-#ifndef HAVE_LIBXFCE4PANEL_46
+-
+-#include <gtk/gtk.h>
+-#include <libxfce4panel/xfce-panel-plugin.h>
+-
+-void                 xfce_panel_plugin_position_widget      (XfcePanelPlugin  *plugin,
+-                                                             GtkWidget        *menu_widget,
+-                                                             GtkWidget        *attach_widget,
+-                                                             gint             *x,
+-                                                             gint             *y);
+-
+-#endif
+-#endif
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_git.bb b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_git.bb
new file mode 100644
index 0000000..18dec94
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/datetime/xfce4-datetime-plugin_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Panel plugin displaying date and time and a calendar when left-clicked"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-datetime-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+inherit xfce-panel-plugin
+
+SRCREV = "e268210db6a32b2a47c03c63e5908ee3ba9461cc"
+PV = "0.6.1+gitr${SRCPV}"
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://git.xfce.org/panel-plugins/xfce4-datetime-plugin;protocol=git;branch=master \
+           file://port-to-libxfce4ui.patch \
+          "
+SRC_URI[md5sum] = "e82f51ff0e75a63e5cbd139e43e094f9"
+SRC_URI[sha256sum] = "fb340c1c2170d4f33c7f278772966f3c01caaedcd4a7f58f670bf8e28580bb1b"
+
+do_configure_prepend() {
+	NOCONFIGURE=yes ./autogen.sh
+}
-- 
1.7.4.4



