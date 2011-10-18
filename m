Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RFxt4-0000Pl-2v
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 02:50:34 +0200
Received: (qmail invoked by alias); 18 Oct 2011 00:44:45 -0000
Received: from p5B0A17D4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.212]
	by mail.gmx.net (mp020) with SMTP; 18 Oct 2011 02:44:45 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1837IMZwC03fFh6R1bLHeUduJos//Y3cFU5iwgDzH
	IcVivR91UKh9HG
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 02:49:21 +0200
Message-Id: <1318898961-19779-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1318898961-19779-1-git-send-email-schnitzeltony@gmx.de>
References: <1318898961-19779-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce][V2 3/3] xfce4-cpugraph-plugin: initial add 1.0.1
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
X-List-Received-Date: Tue, 18 Oct 2011 00:50:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* based on Koen's patch [1]
* xfce4-cpugraph-plugin ported to libxfce4ui

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035591.html

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../cpugraph/files/port-to-libxfce4ui.patch        |  102 ++++++++++++++++++++
 .../cpugraph/xfce4-cpugraph-plugin_1.0.1.bb        |   11 ++
 2 files changed, 113 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch
new file mode 100644
index 0000000..cb8025a
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch
@@ -0,0 +1,102 @@
+From 2db9e1d1a91ea335bfede19ec513dee69569f60a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
+Date: Tue, 18 Oct 2011 01:43:30 +0200
+Subject: [PATCH] port to libxfce4ui
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
+---
+ configure.ac              |    4 ++--
+ panel-plugin/Makefile.am  |    4 ++--
+ panel-plugin/cpu.c        |    4 ++--
+ panel-plugin/properties.c |    2 +-
+ panel-plugin/settings.c   |    2 +-
+ 5 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e20015e..3aa57bb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -27,8 +27,8 @@ dnl Check for standard header files
+ AC_HEADER_STDC
+ 
+ dnl configure the panel plugin
+-XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.20])
+-XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.20])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
++XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.8.0])
+ XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.12.0])
+ 
+ dnl translations
+diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
+index 595c61f..6340196 100644
+--- a/panel-plugin/Makefile.am
++++ b/panel-plugin/Makefile.am
+@@ -3,11 +3,11 @@ plugin_PROGRAMS = xfce4-cpugraph-plugin
+ 
+ xfce4_cpugraph_plugin_CFLAGS =					\
+ 	-DPACKAGE_LOCALE_DIR=\"$(localedir)\"			\
+-	@LIBXFCEGUI4_CFLAGS@					\
++	@LIBXFCE4UI_CFLAGS@					\
+ 	@LIBXFCE4PANEL_CFLAGS@
+ 
+ xfce4_cpugraph_plugin_LDADD =					\
+-	@LIBXFCEGUI4_LIBS@					\
++	@LIBXFCE4UI_LIBS@					\
+ 	@LIBXFCE4PANEL_LIBS@
+ 
+ xfce4_cpugraph_plugin_SOURCES =                                 \
+diff --git a/panel-plugin/cpu.c b/panel-plugin/cpu.c
+index 63431f6..1f13b51 100644
+--- a/panel-plugin/cpu.c
++++ b/panel-plugin/cpu.c
+@@ -26,7 +26,7 @@
+ #include "mode.h"
+ #include "properties.h"
+ 
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #include <libxfce4panel/xfce-hvbox.h>
+ #ifndef _
+ # include <libintl.h>
+@@ -344,7 +344,7 @@ static gboolean command_cb( GtkWidget *w,GdkEventButton *event, CPUGraph *base )
+ {
+ 	if( event->button == 1 && base->command )
+ 	{
+-		xfce_exec( base->command, base->in_terminal, base->startup_notification, NULL );
++		xfce_spawn_command_line_on_screen( gdk_screen_get_default(), base->command, base->in_terminal, base->startup_notification, NULL );
+ 	}
+ 	return FALSE;
+ }
+diff --git a/panel-plugin/properties.c b/panel-plugin/properties.c
+index 411fafd..ed191dd 100644
+--- a/panel-plugin/properties.c
++++ b/panel-plugin/properties.c
+@@ -26,7 +26,7 @@
+ #include "settings.h"
+ 
+ #include <glib/gprintf.h>
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ #ifndef _
+ # include <libintl.h>
+diff --git a/panel-plugin/settings.c b/panel-plugin/settings.c
+index dcc474e..c0f1fed 100644
+--- a/panel-plugin/settings.c
++++ b/panel-plugin/settings.c
+@@ -22,7 +22,7 @@
+  *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+  */
+ #include "settings.h"
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ static void default_command( const gchar ** command, gboolean * in_terminal, gboolean * startup_notification )
+ {
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.1.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.1.bb
new file mode 100644
index 0000000..abbc7f1
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Panel plugin with graphical representation of the cpu frequency"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
+
+inherit xfce-panel-plugin
+
+# SRC_URI must follow inherited one
+SRC_URI += "file://port-to-libxfce4ui.patch"
+SRC_URI[md5sum] = "ff551087b1f61c47b8746e8687c572aa"
+SRC_URI[sha256sum] = "b5fada35a92083b67818da0ce3fe5ba6a2443fee26d6eec71755ff383df7c407"
-- 
1.7.4.4



