Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf6-0006x5-N4
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:04:32 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:12 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:12 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/2dI5aa8L2GGrvx8nKrEKjUGjUhCh+1DBa/kb36y
	ATahzgptT+pQxO
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:49 +0200
Message-Id: <1312232577-7948-12-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 11/19] xfce4-session: Add initial recipe with version 4.8.1
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
X-List-Received-Date: Mon, 01 Aug 2011 21:04:32 -0000

* xfce4-session needs iceauth for building and running properly. A patch
  was sent but is trapped for style-guide / license issues (see [1] and [2])

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/034169.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-July/034176.html

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../xfce4-session/relative-symlinks-docs.patch     |   11 +++++++
 .../xfce4-session/xfce4-session_4.8.1.bb           |   32 ++++++++++++++++++++
 2 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.1.bb

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch
new file mode 100644
index 0000000..fb78c57
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/relative-symlinks-docs.patch
@@ -0,0 +1,11 @@
+--- a/doc/manual/Makefile.am	2010-09-08 18:37:19.000000000 +0200
++++ b/doc/manual/Makefile.am	2011-07-17 23:17:28.602626999 +0200
+@@ -20,7 +20,7 @@
+ 			done; \
+ 			if test x"$$lang" != x"C" -a ! -d $(srcdir)/images/$$lang; then \
+ 				echo "--- Creating symlink to C images for $$lang"; \
+-				ln -sf $(docdir)/html/C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
++				ln -sf ../C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
+ 			fi \
+ 		fi \
+ 	done;
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.1.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.1.bb
new file mode 100644
index 0000000..bedd35f
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.8.1.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf xfce4-panel gconf gnome-keyring"
+RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth"
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
+# protect from frightening message that xfce might not work correctly
+pkg_postinst_${PN} () {
+    echo 127.0.0.1    ${MACHINE} >> /etc/hosts
+}
+
+FILES_${PN} += "${libdir}/xfce4/*/*/*.so \
+                ${libdir}/xfce4/session/*-*-* \
+                ${datadir}/xfce4/*/* \
+                ${datadir}/themes/Default/balou/*"
+
+FILES_${PN}-dbg += "${libdir}/xfce4/*/*/.debug"
+
+FILES_${PN}-dev += "${libdir}/xfce4/*/*/*.*a"
+
+SRC_URI[md5sum] = "478080ff666fdd36786a243829663efd"
+SRC_URI[sha256sum] = "1df52a77d87ed4d27b4f40a2f03a0b6334422d64bdc4e31b9aac22e25e68b829"
-- 
1.7.4.4



