Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SanLV-00029q-Hr
	for openembedded-devel@lists.openembedded.org;
	Sat, 02 Jun 2012 14:22:17 +0200
Received: by wgbds1 with SMTP id ds1so1163108wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Jun 2012 05:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=E4mQrPTlwUmPAgdhdRqpLwn4l3+lVOdj5Yg+aLXKk2c=;
	b=ga1kMOcGfd0fsPQYt+doGKmaoftqX0jOHlJPAwa7Rvu+Sqgrf+KtdnriZAZO+XDL4T
	jo3TvMohKwt0ut0TsnKn7DafmxP7FpOkhpmx92LxWUq9sXy37WxinYd1B/68EnVc276y
	4DEqaxhUeWpkWv75VMluShZb7Elr2rB0CfC8Qn8gYPPRMWXpbE6SqMmBSIfUs5Qprb2T
	MnV3uEe2fm9v0alizh64eUhzQNGlkSNitlYoEVsC8iQb3pQ+lBzpHXK9RMaG5ya812ZI
	5MhFE1wMOkjhOb3HFKL46b397FxgKvZYlE7QrJGO7pssd0Eu52QYp36dXsMg2HQw70l8
	rmqw==
Received: by 10.216.227.214 with SMTP id d64mr4959722weq.93.1338639115175;
	Sat, 02 Jun 2012 05:11:55 -0700 (PDT)
Received: from localhost.localdomain (p5B0A09D7.dip.t-dialin.net.
	[91.10.9.215])
	by mx.google.com with ESMTPS id d10sm6981854wiy.3.2012.06.02.05.11.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 05:11:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  2 Jun 2012 14:15:52 +0200
Message-Id: <1338639361-23775-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338639361-23775-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 06/15] xfce4-diskperf-plugin: update to 2.5.3
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
X-List-Received-Date: Sat, 02 Jun 2012 12:22:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../diskperf/files/port-to-libxfce4ui.patch        |  142 --------------------
 ...gin_2.3.0.bb => xfce4-diskperf-plugin_2.5.3.bb} |    6 +-
 2 files changed, 2 insertions(+), 146 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch
 rename meta-xfce/recipes-panel-plugins/diskperf/{xfce4-diskperf-plugin_2.3.0.bb => xfce4-diskperf-plugin_2.5.3.bb} (55%)

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch
deleted file mode 100644
index 498bf11..0000000
--- a/meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From c154d023bca9b3022cc3b99094c0a3aedb2f3bfb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
-Date: Wed, 2 Nov 2011 18:11:39 +0100
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
- panel-plugin/config_gui.c |    2 +-
- panel-plugin/config_gui.h |    2 +-
- panel-plugin/main.c       |   17 +++++++++++------
- 5 files changed, 17 insertions(+), 12 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e083872..e0eb74b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -48,8 +48,8 @@ XDT_I18N([@LINGUAS@])
- dnl ***********************************
- dnl *** Check for required packages ***
- dnl ***********************************
--XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.90])
--XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.90])
-+XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.8.0])
-+XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
- 
- dnl ***********************************
- dnl *** Check for debugging support ***
-diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
-index 8f86c9a..6a30116 100644
---- a/panel-plugin/Makefile.am
-+++ b/panel-plugin/Makefile.am
-@@ -21,11 +21,11 @@ xfce4_diskperf_plugin_SOURCES =					\
- 
- xfce4_diskperf_plugin_CFLAGS =					\
- 	$(LIBXFCE4PANEL_CFLAGS)					\
--	$(LIBXFCEGUI4_CFLAGS)
-+	$(LIBXFCE4UI_CFLAGS)
- 
- xfce4_diskperf_plugin_LDADD=					\
- 	$(LIBXFCE4PANEL_LIBS)					\
--	$(LIBXFCEGUI4_LIBS)
-+	$(LIBXFCE4UI_LIBS)
- 
- #
- # Desktop file
-diff --git a/panel-plugin/config_gui.c b/panel-plugin/config_gui.c
-index 89f630a..34982bf 100644
---- a/panel-plugin/config_gui.c
-+++ b/panel-plugin/config_gui.c
-@@ -32,7 +32,7 @@
- #include <gtk/gtk.h>
- 
- #include <libxfce4util/libxfce4util.h>
--#include <libxfcegui4/dialogs.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- 
- #define COPYVAL(var, field)	((var)->field = field)
-diff --git a/panel-plugin/config_gui.h b/panel-plugin/config_gui.h
-index aa49838..6b49a94 100644
---- a/panel-plugin/config_gui.h
-+++ b/panel-plugin/config_gui.h
-@@ -24,7 +24,7 @@
- #include <gtk/gtk.h>
- 
- #include <libxfce4util/libxfce4util.h>
--#include <libxfcegui4/dialogs.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- 
- typedef struct gui_t {
-diff --git a/panel-plugin/main.c b/panel-plugin/main.c
-index 43b0390..45020c1 100644
---- a/panel-plugin/main.c
-+++ b/panel-plugin/main.c
-@@ -25,7 +25,7 @@
- #include <gtk/gtk.h>
- 
- #include <libxfce4util/libxfce4util.h>
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- #include <libxfce4panel/xfce-panel-plugin.h>
- 
- #include <stdlib.h>
-@@ -631,7 +631,8 @@ static void SetDevice (Widget_t p_wTF, void *p_pvPlugin)
- 
-     status = stat (pcDevice, &oStat);
-     if (status == -1) {
--	xfce_err ("%s\n"
-+	xfce_dialog_show_error (NULL, NULL,
-+                  "%s\n"
- 		  "%s: %s (%d)",
- 		  PLUGIN_NAME, pcDevice, strerror (errno), errno);
- 	return;
-@@ -853,7 +854,8 @@ static int CheckStatsAvailability ()
- 	return (0);
-     if (status < 0) {
- 	status *= -1;
--	xfce_err (_("%s\n"
-+	xfce_dialog_show_error (NULL, NULL, 
-+                  _("%s\n"
- 		  "%s: %s (%d)\n\n"
- 		  "This monitor will not work!\n"
- 		  "Please remove it."),
-@@ -863,14 +865,16 @@ static int CheckStatsAvailability ()
-     }
-     switch (status) {
- 	case NO_EXTENDED_STATS:
--	    xfce_err (_("%s: No disk extended statistics found!\n"
-+	    xfce_dialog_show_error (NULL, NULL, 
-+                      _("%s: No disk extended statistics found!\n"
- 		      "Either old kernel (< 2.4.20) or not\n"
- 		      "compiled with CONFIG_BLK_STATS turned on.\n\n"
- 		      "This monitor will not work!\n"
- 		      "Please remove it."), PLUGIN_NAME);
- 	    break;
- 	default:
--	    xfce_err (_("%s: Unknown error\n\n"
-+	    xfce_dialog_show_error (NULL, NULL, 
-+                      _("%s: Unknown error\n\n"
- 		      "This monitor will not work!\n"
- 		      "Please remove it."), PLUGIN_NAME);
-     }
-@@ -882,7 +886,8 @@ static int CheckStatsAvailability ()
- static void About (Widget_t w, void *unused)
- 	/* Called back when the About button in clicked */
- {
--    xfce_info (_("%s %s - Disk Performance Monitor\n"
-+    xfce_dialog_show_info (NULL, NULL, 
-+               _("%s %s - Disk Performance Monitor\n"
- 	       "Display instantaneous disk I/O transfer rates and busy times "
- 	       "on Linux and NetBSD systems\n\n"
- 	       "(c) 2003, 2004 Roger Seguin <roger_seguin@msn.com>\n"
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.3.0.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.3.bb
similarity index 55%
rename from meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.3.0.bb
rename to meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.3.bb
index 39acd40..e80d0bd 100644
--- a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.3.0.bb
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.5.3.bb
@@ -5,7 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
 
 inherit xfce-panel-plugin
 
-# SRC_URI must follow inherited one
-SRC_URI += "file://port-to-libxfce4ui.patch"
-SRC_URI[md5sum] = "c6ece8123c762ee203cbc6fd5450b503"
-SRC_URI[sha256sum] = "d75e2cd846c784cba804c5cc7796964b3965c764003ca4c1751c68ff83e85793"
+SRC_URI[md5sum] = "ba880f763e273787d0c8365eebc4feab"
+SRC_URI[sha256sum] = "418a250fe8d48f1fd87658206a8e6762032d35dc1b2e98e27d309a35f873f9b6"
-- 
1.7.4.4



