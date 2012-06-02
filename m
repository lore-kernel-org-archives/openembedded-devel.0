Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLU-000286-EY
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:16 +0200
Received: by mail-we0-f175.google.com with SMTP id g55so1925828wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=PzlkJnylwNCciadsP1DYb/faMFuATQBTKcu8jHm3Enk=;
	b=cs2vUsiZ14uJuVfWugUvyjLuy2MSlmuATabk5fNzI7SwOV+2bBJAYupyfCYtmB/OW1
	CYxTmuvYSlpIVsq5gnajoqHVy9m1oY82EVTkWpUVOe6rRcDvX4y6YuH7kAQyyq9T5ZeS
	jdHMWTGL4KH8TWeS3KiU51xrh2pMBeApDew7zZNUf8qZYAEoeOeinKyefCNcoCkT3cGP
	1BodApeE4dgGbdPL1NqofpIwoYEGXFSLUSF091z2/GZRYCLOeslW46sWEOXpyoV4KaQo
	nA+9CSScGEe7NRhxGjn6MEj49rMMdmvlfIoWi6EHHTsb0kFjehDN+vnqU3NIYLuToW71
	TXKA==
Received: by 10.216.214.88 with SMTP id b66mr5215492wep.114.1338639116544;
	Sat, 02 Jun 2012 05:11:56 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:53 +0200
Message-Id: <1338639361-23775-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 07/15] xfce4-cpugraph-plugin: update to 1.0.2
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../cpugraph/files/port-to-libxfce4ui.patch        |  102 --------------------
 ...gin_1.0.1.bb => xfce4-cpugraph-plugin_1.0.2.bb} |    6 +-
 2 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.0.1.bb => xfce4-cpugraph-plugin_1.0.2.bb} (55%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch
deleted file mode 100644
index cb8025a..0000000
--- a/meta-xfce/recipes-panel-plugins/cpugraph/files/port-to-libxfce4ui.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 2db9e1d1a91ea335bfede19ec513dee69569f60a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
-Date: Tue, 18 Oct 2011 01:43:30 +0200
-Subject: [PATCH] port to libxfce4ui
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
----
- configure.ac              |    4 ++--
- panel-plugin/Makefile.am  |    4 ++--
- panel-plugin/cpu.c        |    4 ++--
- panel-plugin/properties.c |    2 +-
- panel-plugin/settings.c   |    2 +-
- 5 files changed, 8 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e20015e..3aa57bb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,8 +27,8 @@ dnl Check for standard header files
- AC_HEADER_STDC
- 
- dnl configure the panel plugin
--XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.20])
--XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.20])
-+XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
-+XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.8.0])
- XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.12.0])
- 
- dnl translations
-diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
-index 595c61f..6340196 100644
---- a/panel-plugin/Makefile.am
-+++ b/panel-plugin/Makefile.am
-@@ -3,11 +3,11 @@ plugin_PROGRAMS = xfce4-cpugraph-plugin
- 
- xfce4_cpugraph_plugin_CFLAGS =					\
- 	-DPACKAGE_LOCALE_DIR=\"$(localedir)\"			\
--	@LIBXFCEGUI4_CFLAGS@					\
-+	@LIBXFCE4UI_CFLAGS@					\
- 	@LIBXFCE4PANEL_CFLAGS@
- 
- xfce4_cpugraph_plugin_LDADD =					\
--	@LIBXFCEGUI4_LIBS@					\
-+	@LIBXFCE4UI_LIBS@					\
- 	@LIBXFCE4PANEL_LIBS@
- 
- xfce4_cpugraph_plugin_SOURCES =                                 \
-diff --git a/panel-plugin/cpu.c b/panel-plugin/cpu.c
-index 63431f6..1f13b51 100644
---- a/panel-plugin/cpu.c
-+++ b/panel-plugin/cpu.c
-@@ -26,7 +26,7 @@
- #include "mode.h"
- #include "properties.h"
- 
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- #include <libxfce4panel/xfce-hvbox.h>
- #ifndef _
- # include <libintl.h>
-@@ -344,7 +344,7 @@ static gboolean command_cb( GtkWidget *w,GdkEventButton *event, CPUGraph *base )
- {
- 	if( event->button == 1 && base->command )
- 	{
--		xfce_exec( base->command, base->in_terminal, base->startup_notification, NULL );
-+		xfce_spawn_command_line_on_screen( gdk_screen_get_default(), base->command, base->in_terminal, base->startup_notification, NULL );
- 	}
- 	return FALSE;
- }
-diff --git a/panel-plugin/properties.c b/panel-plugin/properties.c
-index 411fafd..ed191dd 100644
---- a/panel-plugin/properties.c
-+++ b/panel-plugin/properties.c
-@@ -26,7 +26,7 @@
- #include "settings.h"
- 
- #include <glib/gprintf.h>
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- #ifndef _
- # include <libintl.h>
-diff --git a/panel-plugin/settings.c b/panel-plugin/settings.c
-index dcc474e..c0f1fed 100644
---- a/panel-plugin/settings.c
-+++ b/panel-plugin/settings.c
-@@ -22,7 +22,7 @@
-  *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-  */
- #include "settings.h"
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- static void default_command( const gchar ** command, gboolean * in_terminal, gboolean * startup_notification )
- {
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.1.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.2.bb
similarity index 55%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.1.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.2.bb
index abbc7f1..e3bea63 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.1.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.0.2.bb
@@ -5,7 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-# SRC_URI must follow inherited one
-SRC_URI += "file://port-to-libxfce4ui.patch"
-SRC_URI[md5sum] = "ff551087b1f61c47b8746e8687c572aa"
-SRC_URI[sha256sum] = "b5fada35a92083b67818da0ce3fe5ba6a2443fee26d6eec71755ff383df7c407"
+SRC_URI[md5sum] = "93d7658d989ebf110875bc2deb76d7b3"
+SRC_URI[sha256sum] = "b535a9c3d105c0d1597fa4071fe140912bb483c4401c84ad178531fc85de0577"
-- 
1.7.4.4



