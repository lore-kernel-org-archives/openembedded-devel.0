Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id ACA1860068
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Nov 2016 11:44:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 15 Nov 2016 03:44:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,494,1473145200"; d="scan'208";a="1085433491"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 15 Nov 2016 03:44:14 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6BE3B6A4006;
	Tue, 15 Nov 2016 03:43:34 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Nov 2016 13:44:07 +0200
Message-Id: <1479210247-9859-3-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1479210247-9859-1-git-send-email-jussi.kukkonen@intel.com>
References: <1479210247-9859-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] xserver-common: Don't install some Xsession files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2016 11:44:12 -0000

The goal is that the graphical_init_manager (xserver-nodm-init)
provides Xsession (and some basic scripts) and that xserver-common
can then provide additional Xsession scripts. Remove the Xsession
files that xserver-nodm-init installs.

Bump PR so xserver-nodm-init can RCONFLICT with old one.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-Don-t-install-Xsession-or-Xserver.patch   | 30 ++++++++++++++++++++++
 ...0003-add-89xdgautostart-Xsession.d-script.patch | 29 ---------------------
 ...0005-add-XWindowManager-Xsession.d-script.patch | 23 -----------------
 ...erver-Start-Xsession-like-x11-common-does.patch | 26 -------------------
 .../xserver-common/xserver-common_1.34.bb          |  6 ++---
 5 files changed, 32 insertions(+), 82 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0003-add-89xdgautostart-Xsession.d-script.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch
 delete mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0014-Xserver-Start-Xsession-like-x11-common-does.patch

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
new file mode 100644
index 0000000..26288d6
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0001-Don-t-install-Xsession-or-Xserver.patch
@@ -0,0 +1,30 @@
+From c92ce6a4b3622874f820b5ec487a2b63f519826c Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 10 Nov 2016 14:33:05 +0200
+Subject: [PATCH] Don't install Xsession or Xserver
+
+The goal is to use Xsession and Xserver from xserver-nodm-init.
+Xsession scripts and xserver-common from this recipe will still
+be used as before.
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index caa5de1..7e36bbc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -20,7 +20,5 @@ install-program:
+ 	install -m 755 run-calibrate.sh $(DESTDIR)$(PREFIX)/bin/run-calibrate.sh
+ 	install -m 644 X11/Xdefaults $(DESTDIR)/etc/X11/Xdefaults
+ 	install -m 755 X11/Xinit $(DESTDIR)/etc/X11/Xinit
+-	install -m 755 X11/Xserver $(DESTDIR)/etc/X11/Xserver
+-	install -m 755 X11/Xsession $(DESTDIR)/etc/X11/Xsession
+ 	install -m 755 X11/xserver-common $(DESTDIR)/etc/X11/xserver-common
+ 	install -m 755 X11/functions $(DESTDIR)/etc/X11/functions
+ 	install -d $(DESTDIR)/etc/X11/xmodmap
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0003-add-89xdgautostart-Xsession.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0003-add-89xdgautostart-Xsession.d-script.patch
deleted file mode 100644
index bf806a9..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0003-add-89xdgautostart-Xsession.d-script.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a93a86c2ff1ca5eb35615f4e1568409ff342aa7f Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:29:41 +0200
-Subject: [PATCH 03/12] add 89xdgautostart Xsession.d script
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- X11/Xsession.d/89xdgautostart |    9 +++++++++
- 1 files changed, 9 insertions(+), 0 deletions(-)
- create mode 100644 X11/Xsession.d/89xdgautostart
-
-diff --git a/X11/Xsession.d/89xdgautostart b/X11/Xsession.d/89xdgautostart
-new file mode 100644
-index 0000000..9886f9f
---- /dev/null
-+++ b/X11/Xsession.d/89xdgautostart
-@@ -0,0 +1,9 @@
-+#!/bin/sh
-+
-+XDGAUTOSTART=/etc/xdg/autostart
-+if [ -d $XDGAUTOSTART ] ; then
-+    for SCRIPT in $XDGAUTOSTART/*; do
-+        CMD=`grep ^Exec= $SCRIPT | cut -d '=' -f 2`
-+        $CMD &
-+    done
-+fi
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch
deleted file mode 100644
index 1782665..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0005-add-XWindowManager-Xsession.d-script.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From b01a532ebb525552e23d7169a2aeb55c42b3ec99 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 11 Apr 2012 14:32:13 +0200
-Subject: [PATCH 05/12] add XWindowManager Xsession.d script
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- X11/Xsession.d/90xXWindowManager |    6 ++++++
- 1 files changed, 6 insertions(+), 0 deletions(-)
- create mode 100644 X11/Xsession.d/90xXWindowManager
-
-Index: xserver-common-1.34/X11/Xsession.d/90xXWindowManager
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ xserver-common-1.34/X11/Xsession.d/90xXWindowManager	2012-06-28 15:02:22.010521773 +0200
-@@ -0,0 +1,7 @@
-+if [ -x $HOME/.Xsession ]; then
-+    exec $HOME/.Xsession
-+elif [ -x /usr/bin/x-session-manager ]; then
-+    exec /usr/bin/x-session-manager
-+else
-+    exec /usr/bin/x-window-manager
-+fi
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0014-Xserver-Start-Xsession-like-x11-common-does.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0014-Xserver-Start-Xsession-like-x11-common-does.patch
deleted file mode 100644
index 5a75964..0000000
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/0014-Xserver-Start-Xsession-like-x11-common-does.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8171f89944969a081be1ac193b2a59016e39a345 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 29 Oct 2013 17:07:21 +0100
-Subject: [PATCH 14/14] Xserver: Start Xsession like x11-common does
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- X11/Xserver | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/X11/Xserver b/X11/Xserver
-index 559f059..4b88637 100755
---- a/X11/Xserver
-+++ b/X11/Xserver
-@@ -4,6 +4,6 @@
- . /etc/X11/xserver-common
- 
- echo "tslib: $TSLIB_TSDEVICE"
--echo "exec $XSERVER $ARGS -dpi $DPI $*"
--exec $XSERVER $ARGS -dpi $DPI $*
-+echo "exec xinit /etc/X11/Xsession -- $BINDIR/$XSERVER $ARGS -dpi $DPI $*"
- 
-+exec xinit /etc/X11/Xsession -- $BINDIR/$XSERVER $ARGS -dpi $DPI $*
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 0315ed7..cc30541 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -2,7 +2,7 @@ SUMMARY = "Common X11 scripts and support files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r8"
+PR = "r9"
 
 # we are using a gpe-style Makefile
 inherit gpe
@@ -13,8 +13,6 @@ SRC_URI[sha256sum] = "cd04c33418f776b1e13fcc7af3d6bd0c7cccd03fbabd7dbcd97f88166c
 SRC_URI_append = " \
     file://0001-COPYING-add-GPLv2-license-file.patch \
     file://0002-add-setdpi-Xinit.d-script.patch \
-    file://0003-add-89xdgautostart-Xsession.d-script.patch \
-    file://0005-add-XWindowManager-Xsession.d-script.patch \
     file://0006-add-support-for-etc-X11-xserver-system.patch \
     file://0007-use-own-functions-file-instead-etc-init.d-functions.patch \
     file://0008-xserver-common-add-dpi-and-nocursor-params-for-gta01.patch \
@@ -23,8 +21,8 @@ SRC_URI_append = " \
     file://0011-xserver-common-add-support-for-nexus-one-alias-mahim.patch \
     file://0012-xserver-common-add-support-for-gta04-alias-OpenPhoen.patch \
     file://0013-xserver-common-add-support-for-tuna-alias-Galaxy-Nex.patch \
-    file://0014-Xserver-Start-Xsession-like-x11-common-does.patch \
     file://0015-xserver-common-disable-TCP-connections.patch \
+    file://0001-Don-t-install-Xsession-or-Xserver.patch \
 "
 
 do_install_append() {
-- 
2.1.4


