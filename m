Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RrVNh-0001Yk-7Y
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jan 2012 15:05:21 +0100
Received: by mail-ey0-f175.google.com with SMTP id l12so913780eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2012 05:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wCsIpdmk36VZ7CHOOn2MKXrv5cqnd2tNMt6TO2iKgv0=;
	b=baSbX2GLZFukph/5k0NMn+ZRXwv01w2AXXW3JcThpHEzySdratQGQwkE0zNxtvnky3
	xACF8RORd9gp6SomJbZDLczuN8zjbJd/tmOQAcw9dcWrRm/j5Hy+DbzP2IFhpI+h7JXR
	mSFymEWVHxyGiGIDw9CSaccFt4jZgpxV819bI=
Received: by 10.213.102.12 with SMTP id e12mr2289049ebo.128.1327845447503;
	Sun, 29 Jan 2012 05:57:27 -0800 (PST)
Received: from localhost.localdomain (p4FDF017C.dip.t-dialin.net.
	[79.223.1.124])
	by mx.google.com with ESMTPS id t11sm31778265eea.10.2012.01.29.05.57.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 05:57:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 29 Jan 2012 14:59:32 +0100
Message-Id: <1327845574-26155-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1327845574-26155-1-git-send-email-schnitzeltony@googlemail.com>
References: <1327845574-26155-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 2/4] xfce4-genmon-plugin: initial add 3.3.1
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
X-List-Received-Date: Sun, 29 Jan 2012 14:05:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* build tested from scratch
* run tested on overo

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../genmon/files/port-to-libxfce4ui.patch          |  150 ++++++++++++++++++++
 .../genmon/xfce4-genmon-plugin_3.3.1.bb            |   11 ++
 2 files changed, 161 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.3.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch
new file mode 100644
index 0000000..ebb9405
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch
@@ -0,0 +1,150 @@
+From 57e2a3787261ccc33f47d4d4061148d720d88d7d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 26 Jan 2012 00:45:31 +0100
+Subject: [PATCH] port to libxfce4ui
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+Upstrem atatus: pending https://bugzilla.xfce.org/show_bug.cgi?id=8406
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac              |    4 ++--
+ panel-plugin/Makefile.am  |    4 ++--
+ panel-plugin/cmdspawn.c   |    2 +-
+ panel-plugin/config_gui.c |    2 +-
+ panel-plugin/config_gui.h |    1 -
+ panel-plugin/main.c       |   17 ++++++-----------
+ 6 files changed, 12 insertions(+), 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b9d5bd3..a04d0ec 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,8 +31,8 @@ dnl Check for standard header files
+ AC_HEADER_STDC
+ 
+ dnl configure the panel plugin
+-XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.22])
+-XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.2.0])
++XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.8.0])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
+ 
+ dnl Translations
+ XDT_I18N([@LINGUAS@])
+diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
+index 861a466..f819ff6 100644
+--- a/panel-plugin/Makefile.am
++++ b/panel-plugin/Makefile.am
+@@ -4,11 +4,11 @@ plugin_PROGRAMS = xfce4-genmon-plugin
+ xfce4_genmon_plugin_CFLAGS =					\
+ 	-DPACKAGE_LOCALE_DIR=\"$(localedir)\"			\
+ 	@LIBXFCE4PANEL_CFLAGS@					\
+-	@LIBXFCEGUI4_CFLAGS@
++	@LIBXFCE4UI_CFLAGS@
+ 
+ xfce4_genmon_plugin_LDADD =					\
+ 	@LIBXFCE4PANEL_LIBS@					\
+-	@LIBXFCEGUI4_LIBS@
++	@LIBXFCE4UI_LIBS@
+ 
+ xfce4_genmon_plugin_SOURCES =	\
+ 	main.c			\
+diff --git a/panel-plugin/cmdspawn.c b/panel-plugin/cmdspawn.c
+index aef7689..ae9de82 100644
+--- a/panel-plugin/cmdspawn.c
++++ b/panel-plugin/cmdspawn.c
+@@ -49,7 +49,7 @@
+ #include <stdarg.h>
+ #include <errno.h>
+ #include <sys/wait.h>
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ 
+ /**********************************************************************/
+diff --git a/panel-plugin/config_gui.c b/panel-plugin/config_gui.c
+index 49ef267..3550c35 100644
+--- a/panel-plugin/config_gui.c
++++ b/panel-plugin/config_gui.c
+@@ -28,7 +28,7 @@
+ #include <gtk/gtk.h>
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/dialogs.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #include <libxfce4panel/xfce-panel-plugin.h>
+ 
+ 
+diff --git a/panel-plugin/config_gui.h b/panel-plugin/config_gui.h
+index 84024b2..c6bb672 100644
+--- a/panel-plugin/config_gui.h
++++ b/panel-plugin/config_gui.h
+@@ -29,7 +29,6 @@
+ #include <gtk/gtk.h>
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/dialogs.h>
+ #include <libxfce4panel/xfce-panel-plugin.h>
+ 
+ 
+diff --git a/panel-plugin/main.c b/panel-plugin/main.c
+index 1f741ee..14cf778 100644
+--- a/panel-plugin/main.c
++++ b/panel-plugin/main.c
+@@ -31,8 +31,7 @@
+ #include <gtk/gtk.h>
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/dialogs.h>
+-#include <libxfcegui4/xfce-exec.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #include <libxfce4panel/xfce-panel-plugin.h>
+ #include <libxfce4panel/xfce-panel-convenience.h>
+ 
+@@ -98,7 +97,7 @@ static void ExecOnClickCmd (Widget_t p_wSc, void *p_pvPlugin)
+     struct monitor_t *poMonitor = &(poPlugin->oMonitor);
+     GError *error = NULL;
+ 
+-	xfce_exec(poMonitor->onClickCmd, 0, 0, &error);
++    xfce_spawn_command_line_on_screen( gdk_screen_get_default(), poMonitor->onClickCmd, 0, 0, &error );
+     if (error) {
+         char first[256];
+         g_snprintf (first, sizeof(first), _("Could not run \"%s\""), poMonitor->onClickCmd);
+@@ -592,7 +591,8 @@ static void UpdateConf (void *p_pvPlugin)
+ static void About (Widget_t w, void *unused)
+ /* Called back when the About button in clicked */
+ {
+-    xfce_info (_("%s %s - Generic Monitor\n"
++    xfce_dialog_show_info (NULL, NULL, 
++        _("%s %s - Generic Monitor\n"
+         "Cyclically spawns a script/program, captures its output "
+         "and displays the resulting string in the panel\n\n"
+         "(c) 2004 Roger Seguin <roger_seguin@msn.com>\n"
+@@ -646,7 +646,7 @@ static void genmon_create_options (XfcePanelPlugin *plugin,
+ /* Plugin API */
+ /* Create/pop up the configuration/options GUI */
+ {
+-    GtkWidget *dlg, *header, *vbox;
++    GtkWidget *dlg, *vbox;
+     struct param_t *poConf = &(poPlugin->oConf.oParam);
+     struct gui_t   *poGUI = &(poPlugin->oConf.oGUI);
+     const char     *pcFont = poConf->acFont;
+@@ -667,12 +667,7 @@ static void genmon_create_options (XfcePanelPlugin *plugin,
+ 
+     gtk_container_set_border_width (GTK_CONTAINER (dlg), 2);
+ 
+-    header = xfce_create_header (NULL, _("Generic Monitor"));
+-    gtk_widget_set_size_request (GTK_BIN (header)->child, -1, 32);
+-    gtk_container_set_border_width (GTK_CONTAINER (header), BORDER - 2);
+-    gtk_widget_show (header);
+-    gtk_box_pack_start (GTK_BOX (GTK_DIALOG (dlg)->vbox), header,
+-        FALSE, TRUE, 0);
++    xfce_titled_dialog_set_subtitle (XFCE_TITLED_DIALOG (dlg), _("Generic Monitor"));
+ 
+     vbox = gtk_vbox_new(FALSE, BORDER);
+     gtk_container_set_border_width (GTK_CONTAINER (vbox), BORDER - 2);
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.3.1.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.3.1.bb
new file mode 100644
index 0000000..d2ed4fe
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.3.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "This plugin cyclically spawns the indicated script/program, captures its output (stdout) and displays the resulting string into the panel."
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-genmon-plugin"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
+
+inherit xfce-panel-plugin
+
+SRC_URI += "file://port-to-libxfce4ui.patch"
+
+SRC_URI[md5sum] = "e0022e15d4211a87c17d9f252b68e1d3"
+SRC_URI[sha256sum] = "fe439d569f9ba3c8bdbfa907022a7c4a697ae4ae7fc5001a5600dfa5e1793471"
-- 
1.7.4.4



