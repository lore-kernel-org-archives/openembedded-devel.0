Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFxt3-0000Pk-LT
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 02:50:33 +0200
Received: (qmail invoked by alias); 18 Oct 2011 00:44:44 -0000
Received: from p5B0A17D4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.212]
	by mail.gmx.net (mp020) with SMTP; 18 Oct 2011 02:44:44 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+5Zxl9C3G5+xkze0eIoGg//sCYmERKz6M/gHcn9r
	Pbs3Whr01jmr0Z
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 02:49:20 +0200
Message-Id: <1318898961-19779-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1318898961-19779-1-git-send-email-schnitzeltony@gmx.de>
References: <1318898961-19779-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 2/3] xfce4-cpufreq-plugin: initial add 1.0.0
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
X-List-Received-Date: Tue, 18 Oct 2011 00:50:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* based on Koen's patch [1]
* xfce4-cpufreq-plugin ported to libxfce4ui

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035590.html

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../cpufreq/files/port-to-libxfce4ui.patch         |  138 ++++++++++++++++++++
 .../cpufreq/xfce4-cpufreq-plugin_1.0.0.bb          |   11 ++
 2 files changed, 149 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/cpufreq/files/port-to-libxfce4ui.patch
new file mode 100644
index 0000000..7afec61
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/files/port-to-libxfce4ui.patch
@@ -0,0 +1,138 @@
+From 273bac3e85098f422036b5e5f7c803b8abaecb7c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
+Date: Mon, 17 Oct 2011 23:14:29 +0200
+Subject: [PATCH] port to libxfce4ui
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
+---
+ configure.ac                           |    6 +++---
+ panel-plugin/Makefile.am               |    4 ++--
+ panel-plugin/xfce4-cpufreq-configure.c |    2 +-
+ panel-plugin/xfce4-cpufreq-linux.c     |    4 ++--
+ panel-plugin/xfce4-cpufreq-overview.c  |    2 +-
+ panel-plugin/xfce4-cpufreq-plugin.c    |    6 +++---
+ 6 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1856861..19672e0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -30,9 +30,9 @@ XDT_I18N([@LINGUAS@])
+ dnl configure the panel plugin
+ XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.6.0])
+ XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.6.0])
+-XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.3.90])
+-XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.90])
+-XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.90])
++XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.8.0])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
++XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.8.0])
+ 
+ dnl ***********************************
+ dnl *** Check for debugging support ***
+diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
+index d890f85..688402a 100644
+--- a/panel-plugin/Makefile.am
++++ b/panel-plugin/Makefile.am
+@@ -5,13 +5,13 @@ xfce4_cpufreq_plugin_CFLAGS =					\
+ 	-I$(top_srcdir)						\
+ 	@LIBXFCE4PANEL_CFLAGS@					\
+ 	@LIBXFCE4UTIL_CFLAGS@					\
+-	@LIBXFCEGUI4_CFLAGS@					\
++	@LIBXFCE4UI_CFLAGS@					\
+ 	-DPACKAGE_LOCALE_DIR=\"$(localedir)\"
+ 
+ xfce4_cpufreq_plugin_LDADD =					\
+ 	@LIBXFCE4PANEL_LIBS@					\
+ 	@LIBXFCE4UTIL_LIBS@					\
+-	@LIBXFCEGUI4_LIBS@
++	@LIBXFCE4UI_LIBS@
+ 
+ xfce4_cpufreq_plugin_SOURCES =					\
+ 	xfce4-cpufreq-plugin.h					\
+diff --git a/panel-plugin/xfce4-cpufreq-configure.c b/panel-plugin/xfce4-cpufreq-configure.c
+index 3de12c8..60af8a7 100644
+--- a/panel-plugin/xfce4-cpufreq-configure.c
++++ b/panel-plugin/xfce4-cpufreq-configure.c
+@@ -23,7 +23,7 @@
+ #include <config.h>
+ #endif
+ 
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #include "xfce4-cpufreq-plugin.h"
+ #include "xfce4-cpufreq-configure.h"
+ 
+diff --git a/panel-plugin/xfce4-cpufreq-linux.c b/panel-plugin/xfce4-cpufreq-linux.c
+index 9a27419..00c6dd4 100644
+--- a/panel-plugin/xfce4-cpufreq-linux.c
++++ b/panel-plugin/xfce4-cpufreq-linux.c
+@@ -27,7 +27,7 @@
+ #include "xfce4-cpufreq-plugin.h"
+ #include "xfce4-cpufreq-linux.h"
+ 
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ #ifndef _
+ # include <libintl.h>
+@@ -410,7 +410,7 @@ cpufreq_linux_init (void)
+ 	{
+ 		if (cpuFreq->options->show_warning)
+ 		{
+-			xfce_warn (_("Your system does not support cpufreq.\nThe applet only shows the current cpu frequency"));
++			xfce_dialog_show_warning (NULL, NULL, _("Your system does not support cpufreq.\nThe applet only shows the current cpu frequency"));
+ 			cpuFreq->options->show_warning = FALSE;
+ 		}
+ 
+diff --git a/panel-plugin/xfce4-cpufreq-overview.c b/panel-plugin/xfce4-cpufreq-overview.c
+index a186f30..c4937bf 100644
+--- a/panel-plugin/xfce4-cpufreq-overview.c
++++ b/panel-plugin/xfce4-cpufreq-overview.c
+@@ -23,7 +23,7 @@
+ #include <config.h>
+ #endif
+ 
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #ifndef _
+ # include <libintl.h>
+ # define _(String) gettext (String)
+diff --git a/panel-plugin/xfce4-cpufreq-plugin.c b/panel-plugin/xfce4-cpufreq-plugin.c
+index fd9788d..8bbc7c4 100644
+--- a/panel-plugin/xfce4-cpufreq-plugin.c
++++ b/panel-plugin/xfce4-cpufreq-plugin.c
+@@ -26,7 +26,7 @@
+ #endif
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #ifndef _
+ # include <libintl.h>
+ # define _(String) gettext (String)
+@@ -329,7 +329,7 @@ cpufreq_construct (XfcePanelPlugin *plugin)
+ 
+ #ifdef __linux__
+ 	if (cpufreq_linux_init () == FALSE)
+-		xfce_err (_("Your system is not configured correctly to support cpu frequency scaling !"));
++		xfce_dialog_show_error (NULL, NULL, _("Your system is not configured correctly to support cpu frequency scaling !"));
+ 
+ 	gtk_widget_set_size_request (GTK_WIDGET (plugin), -1, -1);
+ 	cpufreq_widgets ();
+@@ -339,7 +339,7 @@ cpufreq_construct (XfcePanelPlugin *plugin)
+ 			(GSourceFunc) cpufreq_update_cpus,
+ 			NULL);
+ #else
+-	xfce_err (_("Your system is not supported yet !"));
++	xfce_dialog_show_error (NULL, NULL, _("Your system is not supported yet !"));
+ #endif /* __linux__ */
+ 
+ 	g_signal_connect (plugin, "free-data", G_CALLBACK (cpufreq_free),
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
new file mode 100644
index 0000000..2c9789d
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.0.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Panel plugin to display frequency of all cpus"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpufreq-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
+
+inherit xfce-panel-plugin
+
+# SRC_URI must follow inherited one
+SRC_URI += "file://port-to-libxfce4ui.patch"
+SRC_URI[md5sum] = "24cae9b8583cae82b715b4f72aa8e341"
+SRC_URI[sha256sum] = "e1b39a997487ef67d4f7863c81e2d9c1a700abded840ebdbe009c72214925460"
-- 
1.7.4.4



