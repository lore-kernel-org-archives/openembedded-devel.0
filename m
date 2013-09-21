Return-Path: <superandy@localhost.localdomain>
Received: from localhost.localdomain (p5B0A2F3E.dip0.t-ipconnect.de
	[91.10.47.62])
	by mail.openembedded.org (Postfix) with ESMTP id A1F366CA5C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.7/8.14.7) with ESMTP id r8LAg7kZ013458; 
	Sat, 21 Sep 2013 12:42:07 +0200
Received: (from superandy@localhost)
	by localhost.localdomain (8.14.7/8.14.7/Submit) id r8LAg6GE013457;
	Sat, 21 Sep 2013 12:42:06 +0200
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Sep 2013 12:41:39 +0200
Message-Id: <1379760101-13380-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 08/10] xfce4-taskmanager: inital add git-version
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
X-List-Received-Date: Sat, 21 Sep 2013 10:42:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

we use git sources - the last release is 3 years ago

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...d-documantation-Makefile-has-no-install-t.patch | 29 ++++++++++++++++++++++
 .../xfce4-taskmanager/xfce4-taskmanager_git.bb     | 22 ++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch
 create mode 100644 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch b/meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch
new file mode 100644
index 0000000..eeee8f7
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/files/0001-do-not-build-documantation-Makefile-has-no-install-t.patch
@@ -0,0 +1,29 @@
+From 9902fb9d4fce474426c35b73617149014799a0c8 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 19 Sep 2013 16:43:59 +0200
+Subject: [PATCH] do not build documantation - Makefile has no install target
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 6ffa8d9..6aef17a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,6 +1,5 @@
+ SUBDIRS =								\
+ 	po								\
+-	doc								\
+ 	src
+ 
+ desktopdir = $(datadir)/applications
+-- 
+1.8.3.1
+
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
new file mode 100644
index 0000000..502c203
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "Easy to use task manager"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-app
+
+DEPENDS = "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
+
+SRC_URI = " \
+    git://git.xfce.org/apps/xfce4-taskmanager;protocol=git \
+    file://0001-do-not-build-documantation-Makefile-has-no-install-t.patch \
+"
+
+SRCREV = "e5d958738b6d2828a4c8353df67d3c1656c46af5"
+S = "${WORKDIR}/git"
+PV = "1.0.0+git${SRCPV}"
+
+EXTRA_OECONF += "--enable-maintainer-mode"
+
+do_configure_prepend() {
+       NOCONFIGURE=yes ./autogen.sh
+}
-- 
1.8.3.1


