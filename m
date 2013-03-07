Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UDZWV-0001A9-W6
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 13:02:15 +0100
Received: by mail-ee0-f51.google.com with SMTP id d17so216613eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 03:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=dvtrFu7Q69wbO2cbpMrRSNDa2i+SIbi6IGrdYXGOl+w=;
	b=gmF7NSBe/6MLWxk9wGVKNIf5uR2t7AbdswBJTLFu+vYxdqWfIlA8G5DvXo8s4oQ3Ol
	acnpZGzOJsrPdv/lodNuwYZBiBCZ/j4rYLAm+8BauDLFUn0OcKtyzGpTWvKli3kO9OUE
	7XwHpXHyF3HYPivZ2GwfqtjDsboLn0RnLhvsRTtrAiUopxZMBhNJx3PfSK5z7F1MWZpH
	w0PdigxDklOb1Igxxzn0wfOJ0Ys8ezySu5chqa+1FvNDYWB+ythUFp8nrndLgQcfdEBr
	Ej+kXKcel0qQ5zQVtEWMO47ZG20enfHmxDHmO2zu4ou39Ut+DPPZs8N2jN+0Zf4K7vD7
	RaGw==
X-Received: by 10.14.0.73 with SMTP id 49mr42684941eea.21.1362656740259;
	Thu, 07 Mar 2013 03:45:40 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-251-141.unitymediagroup.de.
	[95.223.251.141])
	by mx.google.com with ESMTPS id q42sm1778870eem.14.2013.03.07.03.45.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 03:45:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 12:43:32 +0100
Message-Id: <1362656613-10357-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
References: <1362656613-10357-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce/meta-gnome 3/4] xfce4-eyes-plugin: update to 4.4.2
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
X-List-Received-Date: Thu, 07 Mar 2013 12:02:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

minor license changes see [1]

[1] http://git.xfce.org/panel-plugins/xfce4-eyes-plugin/commit/?id=7cfd829fe7cd5a9df8dc855d3779db6f1f90ab4e

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../eyes/files/port-to-libxfce4ui.patch            |   68 --------------------
 .../eyes/xfce4-eyes-plugin_4.4.1.bb                |   13 ----
 .../eyes/xfce4-eyes-plugin_4.4.2.bb                |   11 +++
 3 files changed, 11 insertions(+), 81 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch
 delete mode 100644 meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb

diff --git a/meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch b/meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch
deleted file mode 100644
index 2fa96f7..0000000
--- a/meta-xfce/recipes-panel-plugins/eyes/files/port-to-libxfce4ui.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From aef48031ed443be04bfd16ae755766ff75d624b6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
-Date: Wed, 26 Oct 2011 00:40:09 +0200
-Subject: [PATCH] port to libxfce4ui
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
----
- configure.ac             |    6 +++---
- panel-plugin/Makefile.am |    4 ++--
- panel-plugin/eyes.c      |    2 +-
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5ff1397..67e2288 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -56,9 +56,9 @@ dnl *** Check for required packages ***
- dnl ***********************************
- XDT_CHECK_PACKAGE([GTHREAD], [gthread-2.0], [2.6.0])
- XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.6.0])
--XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.3.90.2])
--XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.3.90.2])
--XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.3.99.1])
-+XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.8.0])
-+XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.8.0])
-+XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.8.0])
- 
- dnl ***********************************
- dnl *** Check for debugging support ***
-diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
-index 1ee4d28..249303c 100644
---- a/panel-plugin/Makefile.am
-+++ b/panel-plugin/Makefile.am
-@@ -13,12 +13,12 @@ xfce4_eyes_plugin_SOURCES =						\
- 	themes.c
- 
- xfce4_eyes_plugin_CFLAGS =						\
--	$(LIBXFCEGUI4_CFLAGS)						\
-+	$(LIBXFCE4UI_CFLAGS)						\
- 	$(LIBXFCE4PANEL_CFLAGS)
- 	
- xfce4_eyes_plugin_LDADD =						\
- 	$(LIBXFCE4PANEL_LIBS)						\
--	$(LIBXFCEGUI4_LIBS)
-+	$(LIBXFCE4UI_LIBS)
- 
- desktopdir = $(datadir)/xfce4/panel-plugins
- desktop_in_in_files = eyes.desktop.in.in
-diff --git a/panel-plugin/eyes.c b/panel-plugin/eyes.c
-index 6c71938..f3cd195 100644
---- a/panel-plugin/eyes.c
-+++ b/panel-plugin/eyes.c
-@@ -33,7 +33,7 @@
- #include <stdlib.h>
- 
- #include <libxfce4util/libxfce4util.h>
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- #include "eyes.h"
- #include "themes.h"
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb
deleted file mode 100644
index 6ca49c7..0000000
--- a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-DESCRIPTION = "Panel plugin with graphical representation of the cpu frequency"
-HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-eyes-plugin"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit xfce-panel-plugin
-
-# SRC_URI must follow inherited one
-SRC_URI += "file://port-to-libxfce4ui.patch"
-SRC_URI[md5sum] = "dcbf6ea9035d379d168b479be0d09f14"
-SRC_URI[sha256sum] = "eaae5d230b5c2fe6a8b448b59cfe959bf126796911c166a7343a51dc440fbbb2"
-
-FILES_${PN} += "${datadir}/xfce4/eyes"
diff --git a/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb
new file mode 100644
index 0000000..4acc3d8
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/eyes/xfce4-eyes-plugin_4.4.2.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Panel plugin with graphical representation of the cpu frequency"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-eyes-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "1ef352c68dd8929c9e8743200b758b3c"
+SRC_URI[sha256sum] = "dad102fedd0d9e6df45338a018387b2aacaf24b05eb798275be0dfc05ffa3021"
+
+FILES_${PN} += "${datadir}/xfce4/eyes"
-- 
1.7.6.5



