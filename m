Return-Path: <superandy@localhost.localdomain>
Received: from localhost.localdomain (p5B0A2F3E.dip0.t-ipconnect.de
	[91.10.47.62])
	by mail.openembedded.org (Postfix) with ESMTP id 5E20D6CA20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.7/8.14.7) with ESMTP id r8LAfkuB013430; 
	Sat, 21 Sep 2013 12:41:46 +0200
Received: (from superandy@localhost)
	by localhost.localdomain (8.14.7/8.14.7/Submit) id r8LAfjZ0013429;
	Sat, 21 Sep 2013 12:41:45 +0200
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Sep 2013 12:41:32 +0200
Message-Id: <1379760101-13380-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 01/10] libxfce4ui: avoid dragging in gtk3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Sep 2013 10:41:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gtk3 support was introduced in b3a2a01b40affbedc2b0951f7180c1212d24d532 when we
moved to latest git

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...figure.ac.in-remove-optional-gtk3-support.patch | 37 ++++++++++++++++++++++
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac.in-remove-optional-gtk3-support.patch

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac.in-remove-optional-gtk3-support.patch b/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac.in-remove-optional-gtk3-support.patch
new file mode 100644
index 0000000..a93fabf
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac.in-remove-optional-gtk3-support.patch
@@ -0,0 +1,37 @@
+From d61dc6718a2abaf70d19f17d34128cb7e161e057 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 18 Sep 2013 20:50:11 +0200
+Subject: [PATCH] configure.ac.in: remove optional gtk3 support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+it drags in gtk3 if that was build before. This is not yet wanted
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac.in | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/configure.ac.in b/configure.ac.in
+index e47df04..b6edab1 100644
+--- a/configure.ac.in
++++ b/configure.ac.in
+@@ -129,12 +129,6 @@ XDT_CHECK_PACKAGE([GOBJECT], [gobject-2.0], [2.28.0])
+ XDT_CHECK_PACKAGE([GTK2], [gtk+-2.0], [2.24.0])
+ XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.10.0])
+ 
+-dnl ***********************************************************
+-dnl *** Optional support for a GTK+3 version of the library ***
+-dnl ***********************************************************
+-XDT_CHECK_OPTIONAL_PACKAGE([GTK3],
+-                           [gtk+-3.0], [3.2.0], [gtk3],
+-                           [GTK+ 3 support])
+ AM_CONDITIONAL([ENABLE_GTK3_LIBRARY], [test "x$GTK3_FOUND" = "xyes"])
+ 
+ dnl *************************************************
+-- 
+1.8.3.1
+
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index 594358d..1a2b58a 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -9,6 +9,7 @@ inherit xfce
 SRC_URI = " \
     git://git.xfce.org/xfce/libxfce4ui;protocol=git \
     file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
+    file://0002-configure.ac.in-remove-optional-gtk3-support.patch \
 "
 SRCREV = "530b72f50fcbd8cb4b970fcc97be0321bf78183e"
 PV = "4.10.0+git${SRCPV}"
-- 
1.8.3.1


