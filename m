Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLjew-0002BA-C8
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 23:51:50 +0100
Received: (qmail invoked by alias); 02 Nov 2011 22:45:42 -0000
Received: from p5B0A24CF.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.36.207]
	by mail.gmx.net (mp068) with SMTP; 02 Nov 2011 23:45:42 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19kQNw6bcdkjJa2PLicBQ2C4exRRiwwYZjp32dLnz
	Vk2UOQMunKUvYK
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Nov 2011 23:50:23 +0100
Message-Id: <1320274223-32174-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1320274223-32174-1-git-send-email-schnitzeltony@gmx.de>
References: <1320274223-32174-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 2/2] xfce4-diskperf-plugin: initial add 2.3.0
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
X-List-Received-Date: Wed, 02 Nov 2011 22:51:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* patch sent to xfce-bugzilla [1]
* run tested with memory stick on overo

[1] https://bugzilla.xfce.org/show_bug.cgi?id=8099

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../diskperf/files/port-to-libxfce4ui.patch        |  142 ++++++++++++++++++++
 .../diskperf/xfce4-diskperf-plugin_2.3.0.bb        |   11 ++
 2 files changed, 153 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.3.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch
new file mode 100644
index 0000000..498bf11
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/diskperf/files/port-to-libxfce4ui.patch
@@ -0,0 +1,142 @@
+From c154d023bca9b3022cc3b99094c0a3aedb2f3bfb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
+Date: Wed, 2 Nov 2011 18:11:39 +0100
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
+ panel-plugin/config_gui.c |    2 +-
+ panel-plugin/config_gui.h |    2 +-
+ panel-plugin/main.c       |   17 +++++++++++------
+ 5 files changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e083872..e0eb74b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,8 +48,8 @@ XDT_I18N([@LINGUAS@])
+ dnl ***********************************
+ dnl *** Check for required packages ***
+ dnl ***********************************
+-XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.90])
+-XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.90])
++XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.8.0])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
+ 
+ dnl ***********************************
+ dnl *** Check for debugging support ***
+diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
+index 8f86c9a..6a30116 100644
+--- a/panel-plugin/Makefile.am
++++ b/panel-plugin/Makefile.am
+@@ -21,11 +21,11 @@ xfce4_diskperf_plugin_SOURCES =					\
+ 
+ xfce4_diskperf_plugin_CFLAGS =					\
+ 	$(LIBXFCE4PANEL_CFLAGS)					\
+-	$(LIBXFCEGUI4_CFLAGS)
++	$(LIBXFCE4UI_CFLAGS)
+ 
+ xfce4_diskperf_plugin_LDADD=					\
+ 	$(LIBXFCE4PANEL_LIBS)					\
+-	$(LIBXFCEGUI4_LIBS)
++	$(LIBXFCE4UI_LIBS)
+ 
+ #
+ # Desktop file
+diff --git a/panel-plugin/config_gui.c b/panel-plugin/config_gui.c
+index 89f630a..34982bf 100644
+--- a/panel-plugin/config_gui.c
++++ b/panel-plugin/config_gui.c
+@@ -32,7 +32,7 @@
+ #include <gtk/gtk.h>
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/dialogs.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ 
+ #define COPYVAL(var, field)	((var)->field = field)
+diff --git a/panel-plugin/config_gui.h b/panel-plugin/config_gui.h
+index aa49838..6b49a94 100644
+--- a/panel-plugin/config_gui.h
++++ b/panel-plugin/config_gui.h
+@@ -24,7 +24,7 @@
+ #include <gtk/gtk.h>
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/dialogs.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ 
+ typedef struct gui_t {
+diff --git a/panel-plugin/main.c b/panel-plugin/main.c
+index 43b0390..45020c1 100644
+--- a/panel-plugin/main.c
++++ b/panel-plugin/main.c
+@@ -25,7 +25,7 @@
+ #include <gtk/gtk.h>
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ #include <libxfce4panel/xfce-panel-plugin.h>
+ 
+ #include <stdlib.h>
+@@ -631,7 +631,8 @@ static void SetDevice (Widget_t p_wTF, void *p_pvPlugin)
+ 
+     status = stat (pcDevice, &oStat);
+     if (status == -1) {
+-	xfce_err ("%s\n"
++	xfce_dialog_show_error (NULL, NULL,
++                  "%s\n"
+ 		  "%s: %s (%d)",
+ 		  PLUGIN_NAME, pcDevice, strerror (errno), errno);
+ 	return;
+@@ -853,7 +854,8 @@ static int CheckStatsAvailability ()
+ 	return (0);
+     if (status < 0) {
+ 	status *= -1;
+-	xfce_err (_("%s\n"
++	xfce_dialog_show_error (NULL, NULL, 
++                  _("%s\n"
+ 		  "%s: %s (%d)\n\n"
+ 		  "This monitor will not work!\n"
+ 		  "Please remove it."),
+@@ -863,14 +865,16 @@ static int CheckStatsAvailability ()
+     }
+     switch (status) {
+ 	case NO_EXTENDED_STATS:
+-	    xfce_err (_("%s: No disk extended statistics found!\n"
++	    xfce_dialog_show_error (NULL, NULL, 
++                      _("%s: No disk extended statistics found!\n"
+ 		      "Either old kernel (< 2.4.20) or not\n"
+ 		      "compiled with CONFIG_BLK_STATS turned on.\n\n"
+ 		      "This monitor will not work!\n"
+ 		      "Please remove it."), PLUGIN_NAME);
+ 	    break;
+ 	default:
+-	    xfce_err (_("%s: Unknown error\n\n"
++	    xfce_dialog_show_error (NULL, NULL, 
++                      _("%s: Unknown error\n\n"
+ 		      "This monitor will not work!\n"
+ 		      "Please remove it."), PLUGIN_NAME);
+     }
+@@ -882,7 +886,8 @@ static int CheckStatsAvailability ()
+ static void About (Widget_t w, void *unused)
+ 	/* Called back when the About button in clicked */
+ {
+-    xfce_info (_("%s %s - Disk Performance Monitor\n"
++    xfce_dialog_show_info (NULL, NULL, 
++               _("%s %s - Disk Performance Monitor\n"
+ 	       "Display instantaneous disk I/O transfer rates and busy times "
+ 	       "on Linux and NetBSD systems\n\n"
+ 	       "(c) 2003, 2004 Roger Seguin <roger_seguin@msn.com>\n"
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.3.0.bb b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.3.0.bb
new file mode 100644
index 0000000..39acd40
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/diskperf/xfce4-diskperf-plugin_2.3.0.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Panel plugin displaying instant disk/partition performance"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-diskperf-plugin"
+LICENSE = "RogerSeguin"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d3e627798d6a60bece47aa8b3532e1f1"
+
+inherit xfce-panel-plugin
+
+# SRC_URI must follow inherited one
+SRC_URI += "file://port-to-libxfce4ui.patch"
+SRC_URI[md5sum] = "c6ece8123c762ee203cbc6fd5450b503"
+SRC_URI[sha256sum] = "d75e2cd846c784cba804c5cc7796964b3965c764003ca4c1751c68ff83e85793"
-- 
1.7.4.4



