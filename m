Return-Path: <superandy@localhost.localdomain>
Received: from localhost.localdomain (p5B0A2F3E.dip0.t-ipconnect.de
	[91.10.47.62])
	by mail.openembedded.org (Postfix) with ESMTP id 5998C6CA20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.7/8.14.7) with ESMTP id r8LAfoMq013434; 
	Sat, 21 Sep 2013 12:41:50 +0200
Received: (from superandy@localhost)
	by localhost.localdomain (8.14.7/8.14.7/Submit) id r8LAfmC2013433;
	Sat, 21 Sep 2013 12:41:48 +0200
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Sep 2013 12:41:33 +0200
Message-Id: <1379760101-13380-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 02/10] xfce4-vala: update to 4.10.3
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
X-List-Received-Date: Sat, 21 Sep 2013 10:41:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../vala/files/0001-align-vapi-dir.patch           | 39 ----------------------
 .../recipes-bindings/vala/xfce4-vala_4.10.2.bb     | 17 ----------
 .../recipes-bindings/vala/xfce4-vala_4.10.3.bb     | 14 ++++++++
 3 files changed, 14 insertions(+), 56 deletions(-)
 delete mode 100644 meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch
 delete mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb
 create mode 100644 meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb

diff --git a/meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch b/meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch
deleted file mode 100644
index 33c6ed3..0000000
--- a/meta-xfce/recipes-bindings/vala/files/0001-align-vapi-dir.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 9ac15a092c50bb95973d1d81200af031109ad377 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 3 Feb 2013 23:31:50 +0100
-Subject: [PATCH 1/2] align vapi dir
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-
-Upstream-Status: : Inappropriate [configuration]
----
- configure.ac |   10 ++--------
- 1 files changed, 2 insertions(+), 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 1692ce9..f43f904 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -35,14 +35,8 @@ M8T_CHECK_PACKAGE([EXO], [exo-1], [0.8.0])
- 
- dnl Check for Vala
- M8T_CHECK_VALA([0.16.0])
--AC_ARG_WITH([default-vapidir],
--		AC_HELP_STRING([--with-default-vapidir],
--				[Use default VAPI prefix from Vala installation]),
--		[],
--		[with_default_vapidir=no])
--if test x"$with_default_vapidir" == xno ; then
--	AC_SUBST([vapidir], [${datarootdir}/vala-0.16/vapi])
--fi
-+
-+AC_SUBST([vapidir], [${datarootdir}/vala/vapi])
- 
- dnl Makefile outputs
- AC_OUTPUT([
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb
deleted file mode 100644
index 152335a..0000000
--- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-DESCRIPTION = "Xfce4 Vala provides bindings for the Xfce framework"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
-DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-tools-native"
-
-inherit xfce
-
-SRC_URI = " \
-    http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
-    file://0001-align-vapi-dir.patch \
-"
-SRC_URI[md5sum] = "afcca7cb5ae84b9a9a621a352eaf59c4"
-SRC_URI[sha256sum] = "7d9ee9f7f4ce88f3ebc1bd465bad1cd813fa5d268be62fc8d313cbec5345a978"
-
-FILES_${PN} += "${datadir}/vala"
-
-RDEPENDS_${PN} = "vala"
diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
new file mode 100644
index 0000000..aae3ff0
--- /dev/null
+++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Xfce4 Vala provides bindings for the Xfce framework"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
+DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-tools-native"
+
+inherit xfce
+
+SRC_URI = "http://archive.xfce.org/src/bindings/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "0bbb1d6e473e0fe9b335b7b1b49d8a71"
+SRC_URI[sha256sum] = "07a8f2b7c09fcdd3d86e0c52adea3c58ca011d0142a93997a01b4af77260ae7b"
+
+FILES_${PN} += "${datadir}/vala-*/vapi"
+
+RDEPENDS_${PN} = "vala"
-- 
1.8.3.1


