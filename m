Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf8-0006xS-Ov
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:35 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:14 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:14 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/yiVMT1TvyGYAiONOfMZE1QyYFtCSPkiiROUwc6c
	zdFqGR8PWYLI4C
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:53 +0200
Message-Id: <1312232577-7948-16-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 15/19] thunar: Add initial recipe with version 1.2.2
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

* thunar crashes silently but since it is required by xfdesktop the patch is
  send out

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../thunar/thunar/relative-symlinks-docs.patch     |   28 ++++++++++++++++
 meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb      |   34 ++++++++++++++++++++
 2 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/thunar/thunar/relative-symlinks-docs.patch
 create mode 100644 meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb

diff --git a/meta-xfce/recipes-xfce/thunar/thunar/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/thunar/thunar/relative-symlinks-docs.patch
new file mode 100644
index 0000000..26f35be
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar/thunar/relative-symlinks-docs.patch
@@ -0,0 +1,28 @@
+From 3123ef0e38d18b6dfda644abeb4da48520aa7cb9 Mon Sep 17 00:00:00 2001
+From: Andreas Mueller <schnitzeltony@gmx.de>
+Date: Thu, 21 Jul 2011 23:18:47 +0200
+Subject: [PATCH] docs: On installation create relative paths in symlinks to
+ images
+
+
+Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
+---
+ docs/manual/Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/docs/manual/Makefile.am b/docs/manual/Makefile.am
+index 57c7c00..5207733 100644
+--- a/docs/manual/Makefile.am
++++ b/docs/manual/Makefile.am
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
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb
new file mode 100644
index 0000000..c978855
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "File manager for the Xfce Desktop Environment"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+DEPENDS = "exo gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify"
+
+PR = "r0"
+
+inherit xfce
+
+# SRC_URI must follow inherited one
+SRC_URI = "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2 \
+           file://relative-symlinks-docs.patch \
+"
+
+S = "${WORKDIR}/Thunar-${PV}/"
+
+
+# no/minimum(default)/yes/full(fails <- Werror)
+#EXTRA_OECONF += "--enable-debug=yes"
+
+FILES_${PN} += "${libdir}/thunarx-2/* \
+                ${libdir}/xfce4/panel/plugins/* \
+                ${libdir}/Thunar/[Tt]hunar* \
+                ${datadir}/dbus-1 \
+                ${datadir}/Thunar \
+                ${datadir}/xfce4/panel-plugins/*"
+
+FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug/ \
+                    ${libdir}/xfce4/panel/plugins/.debug/ \
+                    ${libdir}/Thunar/.debug/"
+
+SRC_URI[md5sum] = "a86df0212db71e61f459bda6bc7b7fb6"
+SRC_URI[sha256sum] = "56b07dddde423ae7854c5edd433948a912c27afe2a60689ffc50df3d981e90f6"
-- 
1.7.4.4



