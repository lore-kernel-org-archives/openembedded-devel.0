Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RJDAq-0005JM-Hz
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Oct 2011 01:46:20 +0200
Received: (qmail invoked by alias); 26 Oct 2011 23:40:21 -0000
Received: from p4FDF0B1A.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.11.26]
	by mail.gmx.net (mp070) with SMTP; 27 Oct 2011 01:40:21 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/sOCc/SH3s+DHqQS6A7+8BXIKHEh2ajFso9jW0vZ
	K3ZToq6Cb9iihW
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Oct 2011 01:45:04 +0200
Message-Id: <1319672704-7181-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1319672704-7181-1-git-send-email-schnitzeltony@gmx.de>
References: <1319672704-7181-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce 3/3] xfce4-eyes-plugin: initial add 4.4.1
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
X-List-Received-Date: Wed, 26 Oct 2011 23:46:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* port-to-libxfce4ui.patch was send to xfce-buglist [1]
* run tested on overo

[1] https://bugzilla.xfce.org/show_bug.cgi?id=8074

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../eyes/files/port-to-libxfce4ui.patch            |   68 ++++++++++++++++++++
 .../eyes/xfce4-eyes-plugin_4.4.1.bb                |   13 ++++
 2 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb

diff --git a/meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch
new file mode 100644
index 0000000..2fa96f7
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch
@@ -0,0 +1,68 @@
+From aef48031ed443be04bfd16ae755766ff75d624b6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
+Date: Wed, 26 Oct 2011 00:40:09 +0200
+Subject: [PATCH] port to libxfce4ui
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
+---
+ configure.ac             |    6 +++---
+ panel-plugin/Makefile.am |    4 ++--
+ panel-plugin/eyes.c      |    2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5ff1397..67e2288 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -56,9 +56,9 @@ dnl *** Check for required packages ***
+ dnl ***********************************
+ XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.6.0])
+ XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.6.0])
+-XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.90.2])
+-XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.3.90.2])
+-XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.99.1])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
++XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.8.0])
++XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.8.0])
+ 
+ dnl ***********************************
+ dnl *** Check for debugging support ***
+diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
+index 1ee4d28..249303c 100644
+--- a/panel-plugin/Makefile.am
++++ b/panel-plugin/Makefile.am
+@@ -13,12 +13,12 @@ xfce4_eyes_plugin_SOURCES =						\
+ 	themes.c
+ 
+ xfce4_eyes_plugin_CFLAGS =						\
+-	$(LIBXFCEGUI4_CFLAGS)						\
++	$(LIBXFCE4UI_CFLAGS)						\
+ 	$(LIBXFCE4PANEL_CFLAGS)
+ 	
+ xfce4_eyes_plugin_LDADD =						\
+ 	$(LIBXFCE4PANEL_LIBS)						\
+-	$(LIBXFCEGUI4_LIBS)
++	$(LIBXFCE4UI_LIBS)
+ 
+ desktopdir = $(datadir)/xfce4/panel-plugins
+ desktop_in_in_files = eyes.desktop.in.in
+diff --git a/panel-plugin/eyes.c b/panel-plugin/eyes.c
+index 6c71938..f3cd195 100644
+--- a/panel-plugin/eyes.c
++++ b/panel-plugin/eyes.c
+@@ -33,7 +33,7 @@
+ #include <stdlib.h>
+ 
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ #include "eyes.h"
+ #include "themes.h"
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb
new file mode 100644
index 0000000..6ca49c7
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Panel plugin with graphical representation of the cpu frequency"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-eyes-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+# SRC_URI must follow inherited one
+SRC_URI += "file://port-to-libxfce4ui.patch"
+SRC_URI[md5sum] = "dcbf6ea9035d379d168b479be0d09f14"
+SRC_URI[sha256sum] = "eaae5d230b5c2fe6a8b448b59cfe959bf126796911c166a7343a51dc440fbbb2"
+
+FILES_${PN} += "${datadir}/xfce4/eyes"
-- 
1.7.4.4



