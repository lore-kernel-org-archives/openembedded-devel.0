Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf7-0006x7-Lo
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:33 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:13 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:13 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX190Ael2IH90mc0lqZPv26UvHiGmrv8PkrkPMWrHw1
	QNC067ZlAV7j+S
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:51 +0200
Message-Id: <1312232577-7948-14-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 13/19] xfwm4: Add initial recipe with version 4.8.1
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:34 -0000

* xfwm4 must be started once manually to work

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../xfwm4/xfwm4/relative-symlinks-docs.patch       |   28 +++++++++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb        |   37 ++++++++++++++++++++
 2 files changed, 65 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
new file mode 100644
index 0000000..4e855e4
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4/relative-symlinks-docs.patch
@@ -0,0 +1,28 @@
+From 09d0d36450e25554785bf7f730e4ba0e31982be6 Mon Sep 17 00:00:00 2001
+From: Andreas Mueller <schnitzeltony@gmx.de>
+Date: Thu, 21 Jul 2011 19:52:28 +0200
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
+index b21962f..88e234b 100644
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
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb
new file mode 100644
index 0000000..e31471d
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.1.bb
@@ -0,0 +1,37 @@
+DESCRIPTION="Xfce4 Window Manager"
+SECTION = "x11/wm"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
+DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui xfconf libwnck dbus-glib startup-notification"
+RDEPENDS_${PN} = "xfwm4-theme-default"
+
+PR = "r0"
+
+inherit xfce update-alternatives
+
+# SRC_URI must follow inherited one
+SRC_URI += " \
+    file://relative-symlinks-docs.patch \
+"
+
+EXTRA_OECONF += " --enable-startup-notification"
+
+python populate_packages_prepend () {
+	themedir = bb.data.expand('${datadir}/themes', d)
+	do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s', allow_dirs=True)
+}
+
+PACKAGES_DYNAMIC += "xfwm4-theme-*"
+
+ALTERNATIVE_NAME = "x-window-manager"
+ALTERNATIVE_LINK = "${bindir}/x-window-manager"
+ALTERNATIVE_PATH = "${bindir}/xfce4-session"
+ALTERNATIVE_PRIORITY = "30"
+
+FILES_${PN} += "${libdir}/xfce4/xfwm4/helper-dialog \
+                ${datadir}/xfwm4/defaults \
+               "
+FILES_${PN}-dbg += "${libexecdir}/xfce4/xfwm4/.debug/*"
+
+SRC_URI[md5sum] = "447433dca613180ebd6cfed4beb1c1c9"
+SRC_URI[sha256sum] = "6a3cbf6c92a0cc3bcaf7cf2565c35beae6354768ec26b4d616a3c2544a8f8499"
-- 
1.7.4.4



