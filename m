Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLjev-0002B9-FC
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 23:51:49 +0100
Received: (qmail invoked by alias); 02 Nov 2011 22:45:41 -0000
Received: from p5B0A24CF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.36.207]
	by mail.gmx.net (mp068) with SMTP; 02 Nov 2011 23:45:41 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/nt2EeuArnC6idfgb4QuQvH0zapQSUUaeo4Zs7QK
	A+Cp3MLHSDXjNt
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Nov 2011 23:50:22 +0100
Message-Id: <1320274223-32174-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 1/2] xfce4-netload-plugin: initial add 1.0.0
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
X-List-Received-Date: Wed, 02 Nov 2011 22:51:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* patch taken from xfce-bugzilla [1]
* run tested with wlan0 on overo

[1] https://bugzilla.xfce.org/show_bug.cgi?id=7083

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../netload/files/port-to-libxfce4ui.patch         |   72 ++++++++++++++++++++
 .../netload/xfce4-netload-plugin_1.0.0.bb          |   11 +++
 2 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/netload/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.0.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/netload/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/netload/files/port-to-libxfce4ui.patch
new file mode 100644
index 0000000..55bdffc
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/netload/files/port-to-libxfce4ui.patch
@@ -0,0 +1,72 @@
+From 95fcb98d0189c3f9a051b56416503b42ac29ff90 Mon Sep 17 00:00:00 2001
+From: Christoph J. Thompson <cjsthompson@gmail.com>
+Date: Tue, 11 Jan 2011 16:17:48 +0100
+Subject: [PATCH 1/2] Port to libxfce4ui.
+
+	modified:   configure.ac
+	modified:   panel-plugin/Makefile.am
+	modified:   panel-plugin/netload.c
+---
+ configure.ac             |    2 +-
+ panel-plugin/Makefile.am |    4 ++--
+ panel-plugin/netload.c   |    5 +++--
+ 3 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0348bfa..3baaa14 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -56,7 +56,7 @@ dnl configure the panel plugin
+ XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.20])
+ 
+ dnl configure the libxfcegui4
+-XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.4.0])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.7.0])
+ 
+ dnl Check for i18n support
+ XDT_I18N([@LINGUAS@])
+diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
+index 0635d67..2163277 100644
+--- a/panel-plugin/Makefile.am
++++ b/panel-plugin/Makefile.am
+@@ -17,12 +17,12 @@ xfce4_netload_plugin_SOURCES =						\
+ xfce4_netload_plugin_CFLAGS =						\
+ 	-DPACKAGE_LOCALE_DIR=\"$(localedir)\"				\
+ 	@LIBXFCE4PANEL_CFLAGS@				\
+-	@LIBXFCEGUI4_CFLAGS@
++	@LIBXFCE4UI_CFLAGS@
+ 
+ xfce4_netload_plugin_LDADD =						\
+ 	@SOLLIBS@                                   			\
+ 	@LIBXFCE4PANEL_LIBS@                                   			\
+-	@LIBXFCEGUI4_LIBS@
++	@LIBXFCE4UI_LIBS@
+ 
+ # .desktop file
+ #
+diff --git a/panel-plugin/netload.c b/panel-plugin/netload.c
+index b4868c4..43035f2 100644
+--- a/panel-plugin/netload.c
++++ b/panel-plugin/netload.c
+@@ -30,7 +30,7 @@
+ #include <gtk/gtk.h>
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #include <libxfce4panel/xfce-panel-plugin.h>
+ 
+ 
+@@ -460,7 +460,8 @@ static void setup_monitor(t_global_monitor *global, gboolean supress_warnings)
+     if (!init_netload( &(global->monitor->data), global->monitor->options.network_device)
+             && !supress_warnings)
+     {
+-        xfce_err (_("%s: Error in initalizing:\n%s"),
++        xfce_dialog_show_error (NULL, NULL,
++	    _("%s: Error in initalizing:\n%s"),
+             _(APP_NAME),
+             _(errormessages[
+                 global->monitor->data.errorcode == 0 
+-- 
+1.7.1
+
diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.0.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.0.0.bb
new file mode 100644
index 0000000..a0013b4
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.0.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Panel plugin displaying current load of the network interfaces"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-netload-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
+
+inherit xfce-panel-plugin
+
+# SRC_URI must follow inherited one
+SRC_URI += "file://port-to-libxfce4ui.patch"
+SRC_URI[md5sum] = "cab53e8cc2b9bfdf7ffd2230916ca3df"
+SRC_URI[sha256sum] = "f312d19fc6bfae525886a1f6e84e7d839f19a9f672be4e01f3df1c813f6a6032"
-- 
1.7.4.4



