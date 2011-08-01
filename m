Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf9-0006xi-Bu
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:35 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:15 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:15 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19vFr4vivhvmjnAElEetoQK0slQ1Lx+/ckVZIgUTv
	wGIvb4bGMqe50c
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:54 +0200
Message-Id: <1312232577-7948-17-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 16/19] xfdesktop: Add initial recipe with version 4.8.2
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:35 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../xfdesktop/relative-symlinks-docs.patch         |   28 ++++++++++++++++++++
 .../recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb      |   19 +++++++++++++
 2 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
 create mode 100644 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
new file mode 100644
index 0000000..fa70f6e
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop/relative-symlinks-docs.patch
@@ -0,0 +1,28 @@
+From 90e191cc4719172aa84e6a8ae694a6f2d6ee8989 Mon Sep 17 00:00:00 2001
+From: Andreas Mueller <schnitzeltony@gmx.de>
+Date: Fri, 22 Jul 2011 00:05:15 +0200
+Subject: [PATCH] docs: On installation create relative paths in symlinks to
+ images
+
+
+Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
+---
+ doc/manual/Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/doc/manual/Makefile.am b/doc/manual/Makefile.am
+index 646821d..cbf79e1 100644
+--- a/doc/manual/Makefile.am
++++ b/doc/manual/Makefile.am
+@@ -20,7 +20,7 @@ install-data-local:
+ 			done; \
+ 			if test x"$$lang" != x"C" -a ! -d $(srcdir)/images/$$lang; then \
+ 				echo "--- Creating symlink to C images for $$lang"; \
+-				ln -sf $(docdir)/html/C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
++				ln -sf ../C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
+ 			fi \
+ 		fi \
+ 	done;
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb
new file mode 100644
index 0000000..c3be330
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.8.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Xfce4 Desktop Manager"
+SECTION = "x11/base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib thunar garcon exo"
+
+PR = "r0"
+
+inherit xfce
+
+# SRC_URI must follow inherited one
+SRC_URI += " \
+    file://relative-symlinks-docs.patch \
+"
+
+FILES_${PN} += "${datadir}/xfce4/backdrops"
+
+SRC_URI[md5sum] = "ed25d59f478afda552d121e96657d16f"
+SRC_URI[sha256sum] = "9d0a48c4e9ed6723a3f9a1c5303e2bbe9b04a3b483c52472da46881df4595e71"
-- 
1.7.4.4



