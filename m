Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Qnzf8-0006xU-Pc
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 23:05:32 +0200
Received: (qmail invoked by alias); 01 Aug 2011 21:00:11 -0000
Received: from p4FDF0322.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.3.34]
	by mail.gmx.net (mp054) with SMTP; 01 Aug 2011 23:00:11 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1956CM+tgV5mBaMfh1l1iiVTPWB7cWB+3VTHMmjoK
	O2tFSCY2vR5Q9n
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Aug 2011 23:02:47 +0200
Message-Id: <1312232577-7948-10-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
References: <1312232577-7948-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [meta-oe 09/19] xfce-utils: Add initial recipe with version 4.8.2
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
X-List-Received-Date: Mon, 01 Aug 2011 21:05:32 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../xfce-utils/relative-symlinks-docs.patch        |   11 ++++++++
 .../recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb    |   27 ++++++++++++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce-utils/xfce-utils/relative-symlinks-docs.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb

diff --git a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils/relative-symlinks-docs.patch
new file mode 100644
index 0000000..d0d80fe
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils/relative-symlinks-docs.patch
@@ -0,0 +1,11 @@
+--- a/doc/manual/Makefile.am	2011-06-18 08:05:25.000000000 +0200
++++ b/doc/manual/Makefile.am	2011-07-13 21:45:17.079143002 +0200
+@@ -21,7 +21,7 @@
+ 			done; \
+ 			if test x"$$lang" != x"C" -a ! -d $(srcdir)/images/$$lang; then \
+ 				echo "--- Creating symlink to C images for $$lang"; \
+-				ln -sf $(docdir)/html/C/images $$dest/images; \
++				ln -sf ../C/images $$dest/images; \
+ 			fi \
+ 		fi \
+ 	done;
diff --git a/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb
new file mode 100644
index 0000000..e36b6a7
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce-utils/xfce-utils_4.8.2.bb
@@ -0,0 +1,27 @@
+DESCRIPTION="Xfce4 Utilities"
+SECTION = "x11"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+DEPENDS = "gtk+ virtual/libx11 dbus libxfce4util libxfce4ui"
+RDEPENDS_${PN} = "xrdb"
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
+# usually we do not migrate (requires perl on target)
+EXTRA_OECONF += "--disable-xfconf-migration"
+
+FILES_${PN} += " \ 
+	${libdir}/xfce4/xfconf-migration \
+        ${datadir}/dbus-1/* \
+        ${datadir}/xsessions/xfce.desktop \
+"
+
+SRC_URI[md5sum] = "7f48198f4bee3edf7869064c2922c609"
+SRC_URI[sha256sum] = "a12b708b0cd19ffa07afb2ab2cd1bf9377ff7fbbfbe16d7493a5bb973bcb0aa5"
-- 
1.7.4.4



