Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLY-00028Z-CH
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:20 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2502442wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=0776qHhqdE6hvmnNnC0Zkn/sNqjcBO4VoMmztHTgHf4=;
	b=QQgzOC6rds5DhM6YPJWzlovUBN9aAigI4cwmDC6HXGNt08pZKPlr6B61mahNXvlwbj
	4eOY/qOyLmk97alSlSElCZfMPP0tjE0RO1OgQlDjmA5M0RyhGQxJjXIUUhLWTW2xX1az
	vVYdxXgsrIBBwOOlE3oOSsWZTCuJz2YlawXKgh0CYkbnxHhrApo2te1LwzE9N0LO5+Kg
	GoT6yULISNCoyLkSyv+Zfu/UG4CrmcIlzGAxUs8tj6/SBoSlx2rhF5iQB2RIEiDCNEDh
	bTT6Bgq4VUwei5Da4pfpihEVRiNpcid2AcPb+FWVBZXQbkMrDipMPg1pH71oNFSu5btT
	l9YQ==
Received: by 10.216.227.154 with SMTP id d26mr5226390weq.9.1338639119577;
	Sat, 02 Jun 2012 05:11:59 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:55 +0200
Message-Id: <1338639361-23775-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 09/15] xfce4-genmon-plugin: update to 3.4.0
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../genmon/files/port-to-libxfce4ui.patch          |  150 --------------------
 ...lugin_3.3.1.bb => xfce4-genmon-plugin_3.4.0.bb} |    6 +-
 2 files changed, 3 insertions(+), 153 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch
 rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_3.3.1.bb => xfce4-genmon-plugin_3.4.0.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch
deleted file mode 100644
index b615fe5..0000000
--- a/meta-xfce/recipes-panel-plugins/genmon/files/port-to-libxfce4ui.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 57e2a3787261ccc33f47d4d4061148d720d88d7d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 26 Jan 2012 00:45:31 +0100
-Subject: [PATCH] port to libxfce4ui
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-Upstream status: pending https://bugzilla.xfce.org/show_bug.cgi?id=8406
-
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac              |    4 ++--
- panel-plugin/Makefile.am  |    4 ++--
- panel-plugin/cmdspawn.c   |    2 +-
- panel-plugin/config_gui.c |    2 +-
- panel-plugin/config_gui.h |    1 -
- panel-plugin/main.c       |   17 ++++++-----------
- 6 files changed, 12 insertions(+), 18 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b9d5bd3..a04d0ec 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -31,8 +31,8 @@ dnl Check for standard header files
- AC_HEADER_STDC
- 
- dnl configure the panel plugin
--XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.22])
--XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.2.0])
-+XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.8.0])
-+XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
- 
- dnl Translations
- XDT_I18N([@LINGUAS@])
-diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
-index 861a466..f819ff6 100644
---- a/panel-plugin/Makefile.am
-+++ b/panel-plugin/Makefile.am
-@@ -4,11 +4,11 @@ plugin_PROGRAMS = xfce4-genmon-plugin
- xfce4_genmon_plugin_CFLAGS =					\
- 	-DPACKAGE_LOCALE_DIR=\"$(localedir)\"			\
- 	@LIBXFCE4PANEL_CFLAGS@					\
--	@LIBXFCEGUI4_CFLAGS@
-+	@LIBXFCE4UI_CFLAGS@
- 
- xfce4_genmon_plugin_LDADD =					\
- 	@LIBXFCE4PANEL_LIBS@					\
--	@LIBXFCEGUI4_LIBS@
-+	@LIBXFCE4UI_LIBS@
- 
- xfce4_genmon_plugin_SOURCES =	\
- 	main.c			\
-diff --git a/panel-plugin/cmdspawn.c b/panel-plugin/cmdspawn.c
-index aef7689..ae9de82 100644
---- a/panel-plugin/cmdspawn.c
-+++ b/panel-plugin/cmdspawn.c
-@@ -49,7 +49,7 @@
- #include <stdarg.h>
- #include <errno.h>
- #include <sys/wait.h>
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- 
- /**********************************************************************/
-diff --git a/panel-plugin/config_gui.c b/panel-plugin/config_gui.c
-index 49ef267..3550c35 100644
---- a/panel-plugin/config_gui.c
-+++ b/panel-plugin/config_gui.c
-@@ -28,7 +28,7 @@
- #include <gtk/gtk.h>
- 
- #include <libxfce4util/libxfce4util.h>
--#include <libxfcegui4/dialogs.h>
-+#include <libxfce4ui/libxfce4ui.h>
- #include <libxfce4panel/xfce-panel-plugin.h>
- 
- 
-diff --git a/panel-plugin/config_gui.h b/panel-plugin/config_gui.h
-index 84024b2..c6bb672 100644
---- a/panel-plugin/config_gui.h
-+++ b/panel-plugin/config_gui.h
-@@ -29,7 +29,6 @@
- #include <gtk/gtk.h>
- 
- #include <libxfce4util/libxfce4util.h>
--#include <libxfcegui4/dialogs.h>
- #include <libxfce4panel/xfce-panel-plugin.h>
- 
- 
-diff --git a/panel-plugin/main.c b/panel-plugin/main.c
-index 1f741ee..14cf778 100644
---- a/panel-plugin/main.c
-+++ b/panel-plugin/main.c
-@@ -31,8 +31,7 @@
- #include <gtk/gtk.h>
- 
- #include <libxfce4util/libxfce4util.h>
--#include <libxfcegui4/dialogs.h>
--#include <libxfcegui4/xfce-exec.h>
-+#include <libxfce4ui/libxfce4ui.h>
- #include <libxfce4panel/xfce-panel-plugin.h>
- #include <libxfce4panel/xfce-panel-convenience.h>
- 
-@@ -98,7 +97,7 @@ static void ExecOnClickCmd (Widget_t p_wSc, void *p_pvPlugin)
-     struct monitor_t *poMonitor = &(poPlugin->oMonitor);
-     GError *error = NULL;
- 
--	xfce_exec(poMonitor->onClickCmd, 0, 0, &error);
-+    xfce_spawn_command_line_on_screen( gdk_screen_get_default(), poMonitor->onClickCmd, 0, 0, &error );
-     if (error) {
-         char first[256];
-         g_snprintf (first, sizeof(first), _("Could not run \"%s\""), poMonitor->onClickCmd);
-@@ -592,7 +591,8 @@ static void UpdateConf (void *p_pvPlugin)
- static void About (Widget_t w, void *unused)
- /* Called back when the About button in clicked */
- {
--    xfce_info (_("%s %s - Generic Monitor\n"
-+    xfce_dialog_show_info (NULL, NULL, 
-+        _("%s %s - Generic Monitor\n"
-         "Cyclically spawns a script/program, captures its output "
-         "and displays the resulting string in the panel\n\n"
-         "(c) 2004 Roger Seguin <roger_seguin@msn.com>\n"
-@@ -646,7 +646,7 @@ static void genmon_create_options (XfcePanelPlugin *plugin,
- /* Plugin API */
- /* Create/pop up the configuration/options GUI */
- {
--    GtkWidget *dlg, *header, *vbox;
-+    GtkWidget *dlg, *vbox;
-     struct param_t *poConf = &(poPlugin->oConf.oParam);
-     struct gui_t   *poGUI = &(poPlugin->oConf.oGUI);
-     const char     *pcFont = poConf->acFont;
-@@ -667,12 +667,7 @@ static void genmon_create_options (XfcePanelPlugin *plugin,
- 
-     gtk_container_set_border_width (GTK_CONTAINER (dlg), 2);
- 
--    header = xfce_create_header (NULL, _("Generic Monitor"));
--    gtk_widget_set_size_request (GTK_BIN (header)->child, -1, 32);
--    gtk_container_set_border_width (GTK_CONTAINER (header), BORDER - 2);
--    gtk_widget_show (header);
--    gtk_box_pack_start (GTK_BOX (GTK_DIALOG (dlg)->vbox), header,
--        FALSE, TRUE, 0);
-+    xfce_titled_dialog_set_subtitle (XFCE_TITLED_DIALOG (dlg), _("Generic Monitor"));
- 
-     vbox = gtk_vbox_new(FALSE, BORDER);
-     gtk_container_set_border_width (GTK_CONTAINER (vbox), BORDER - 2);
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.3.1.bb b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.3.1.bb
rename to meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb
index d2ed4fe..e5ef85f 100644
--- a/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.3.1.bb
+++ b/meta-xfce/recipes-panel-plugins/genmon/xfce4-genmon-plugin_3.4.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
 
 inherit xfce-panel-plugin
 
-SRC_URI += "file://port-to-libxfce4ui.patch"
+SRC_URI[md5sum] = "24108b339bb040ed360266f53a245224"
+SRC_URI[sha256sum] = "b0a5337b49c85623dc89f3c9e47c7374b1d466af2418033d2d6dfc57a9790387"
 
-SRC_URI[md5sum] = "e0022e15d4211a87c17d9f252b68e1d3"
-SRC_URI[sha256sum] = "fe439d569f9ba3c8bdbfa907022a7c4a697ae4ae7fc5001a5600dfa5e1793471"
+S = "${WORKDIR}/xfce4-genmon-plugin-3.4"
-- 
1.7.4.4



