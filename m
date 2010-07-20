Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1ObHtW-0006nV-3N
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 20:50:24 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 08E6B80C536; Tue, 20 Jul 2010 20:45:06 +0200 (CEST)
Received: from localhost (p5489DD67.dip.t-dialin.net [84.137.221.103])
	by gravedo.de (Postfix) with ESMTPSA id DA0D280C536;
	Tue, 20 Jul 2010 20:45:03 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Jul 2010 20:44:54 +0200
Message-Id: <1279651497-20918-2-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/4] lvm2: rebase all recipes on a global lvm2.inc recipe
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
X-List-Received-Date: Tue, 20 Jul 2010 18:50:25 -0000

This rebases all specific versions of lvm2 on a global recipe lvm2.inc which defines the
common parameters for building lvm2. Staging is overwritten as we don't need any of the
executables or manpages the build of lvm2 produces for any related builds.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 recipes/lvm2/files/crosscompile_fix.patch        |   13 +++++++++++++
 recipes/lvm2/lvm2-2.01.15/crosscompile_fix.patch |   13 -------------
 recipes/lvm2/lvm2.inc                            |   20 ++++++++++++++++++++
 recipes/lvm2/lvm2_2.01.09.bb                     |   11 ++---------
 recipes/lvm2/lvm2_2.01.15.bb                     |   17 ++---------------
 5 files changed, 37 insertions(+), 37 deletions(-)
 create mode 100644 recipes/lvm2/files/crosscompile_fix.patch
 delete mode 100644 recipes/lvm2/lvm2-2.01.15/crosscompile_fix.patch
 create mode 100644 recipes/lvm2/lvm2.inc

diff --git a/recipes/lvm2/files/crosscompile_fix.patch b/recipes/lvm2/files/crosscompile_fix.patch
new file mode 100644
index 0000000..7f54f80
--- /dev/null
+++ b/recipes/lvm2/files/crosscompile_fix.patch
@@ -0,0 +1,13 @@
+Index: LVM2.2.01.15/make.tmpl.in
+===================================================================
+--- LVM2.2.01.15.orig/make.tmpl.in	2008-03-26 11:24:50.000000000 +0000
++++ LVM2.2.01.15/make.tmpl.in	2008-03-26 11:25:02.000000000 +0000
+@@ -72,7 +72,7 @@
+   CFLAGS += -DINTL_PACKAGE=\"@INTL_PACKAGE@\" -DLOCALEDIR=\"@LOCALEDIR@\"
+ endif
+ 
+-LDFLAGS += -L$(top_srcdir)/lib -L$(libdir)
++LDFLAGS += -L$(top_srcdir)/lib
+ 
+ #CFLAGS += -DDEBUG_POOL
+ #CFLAGS += -DBOUNDS_CHECK
diff --git a/recipes/lvm2/lvm2-2.01.15/crosscompile_fix.patch b/recipes/lvm2/lvm2-2.01.15/crosscompile_fix.patch
deleted file mode 100644
index 7f54f80..0000000
--- a/recipes/lvm2/lvm2-2.01.15/crosscompile_fix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: LVM2.2.01.15/make.tmpl.in
-===================================================================
---- LVM2.2.01.15.orig/make.tmpl.in	2008-03-26 11:24:50.000000000 +0000
-+++ LVM2.2.01.15/make.tmpl.in	2008-03-26 11:25:02.000000000 +0000
-@@ -72,7 +72,7 @@
-   CFLAGS += -DINTL_PACKAGE=\"@INTL_PACKAGE@\" -DLOCALEDIR=\"@LOCALEDIR@\"
- endif
- 
--LDFLAGS += -L$(top_srcdir)/lib -L$(libdir)
-+LDFLAGS += -L$(top_srcdir)/lib
- 
- #CFLAGS += -DDEBUG_POOL
- #CFLAGS += -DBOUNDS_CHECK
diff --git a/recipes/lvm2/lvm2.inc b/recipes/lvm2/lvm2.inc
new file mode 100644
index 0000000..a7e37b5
--- /dev/null
+++ b/recipes/lvm2/lvm2.inc
@@ -0,0 +1,20 @@
+SECTION = "utils"
+DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
+LICENSE = "GPL"
+DEPENDS = "device-mapper"
+INC_PR = "r2"
+
+S = "${WORKDIR}/LVM2.${PV}"
+SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
+           file://crosscompile_fix.patch"
+
+# Unset user/group to unbreak install.
+EXTRA_OECONF = "--with-user= --with-group= --disable-o_direct"
+EXTRA_OECONF_arm = "--with-user= --with-group= --disable-o_direct"
+
+inherit autotools
+
+# We don't need to stage anything (the executables are no needed at build time by any
+# other recipe)
+do_stage() {
+}
diff --git a/recipes/lvm2/lvm2_2.01.09.bb b/recipes/lvm2/lvm2_2.01.09.bb
index e708d10..9682fa7 100644
--- a/recipes/lvm2/lvm2_2.01.09.bb
+++ b/recipes/lvm2/lvm2_2.01.09.bb
@@ -1,15 +1,8 @@
-SECTION = "utils"
-DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
-LICENSE = "GPL"
-PR = "r1"
-DEPENDS = "device-mapper"
+require lvm2.inc
 
-S = "${WORKDIR}/LVM2.${PV}"
-
-SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz"
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "ed6fe3b734d05c6497cfa4f9932046e6"
 SRC_URI[sha256sum] = "f72b5868f8ab4c6d5ba4cd470e33ef8d916e9c6c1363a7ae48aefd9361e5fc90"
 
-inherit autotools
 
diff --git a/recipes/lvm2/lvm2_2.01.15.bb b/recipes/lvm2/lvm2_2.01.15.bb
index d66e355..0c4d0ea 100644
--- a/recipes/lvm2/lvm2_2.01.15.bb
+++ b/recipes/lvm2/lvm2_2.01.15.bb
@@ -1,19 +1,6 @@
-SECTION = "utils"
-DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
-LICENSE = "GPL"
-PR = "r1"
-DEPENDS = "device-mapper"
-
-S = "${WORKDIR}/LVM2.${PV}"
-
-SRC_URI = "ftp://sources.redhat.com/pub/lvm2/LVM2.${PV}.tgz \
-           file://crosscompile_fix.patch"
-
-# Unset user/group to unbreak install.
-EXTRA_OECONF = "--with-user= --with-group= --disable-o_direct"
-EXTRA_OECONF_arm = "--with-user= --with-group= --disable-o_direct"
-inherit autotools
+require lvm2.inc
 
+PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "c71654baff263254fb5a226624ee8ef3"
 SRC_URI[sha256sum] = "80b47604ace83db4450f43d94a99fdf2ca317323fde8a591f57290d28ece7d3b"
-- 
1.7.0.4



