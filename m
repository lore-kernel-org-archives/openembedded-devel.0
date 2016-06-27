Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D36606E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2016 08:57:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5R8vDQT012933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 27 Jun 2016 01:57:13 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 27 Jun 2016 01:57:12 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 27 Jun 2016 04:57:11 -0400
Message-ID: <1467017831-170380-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] x11vnc: remove redundant RPATH to fix QA issue
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
X-List-Received-Date: Mon, 27 Jun 2016 08:57:16 -0000
Content-Type: text/plain

The useless rpath caused oe QA issue:
...
|ERROR: QA Issue: x11vnc: work/i586-poky-linux/x11vnc/0.9.13-r0/packages-split/
x11vnc/usr/bin/x11vnc contains probably-redundant RPATH /usr/lib [useless-rpaths]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../x11vnc/files/remove-redundant-RPATH.patch      | 71 ++++++++++++++++++++++
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb   |  4 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch b/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch
new file mode 100644
index 0000000..4b14c92
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch
@@ -0,0 +1,71 @@
+From aaca2889c15abab52bfa8fa92b3add4b7d242bea Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 27 Jun 2016 04:44:14 -0400
+Subject: [PATCH] configure.ac: remove redundant RPATH
+
+It caused oe QA issue:
+...
+|ERROR: QA Issue: x11vnc: work/i586-poky-linux/x11vnc/0.9.13-r0/packages-split/
+x11vnc/usr/bin/x11vnc contains probably-redundant RPATH /usr/lib [useless-rpaths]
+...
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6f664d0..3cb1ea3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -333,7 +333,7 @@ if test "x$with_crypto" != "xno" -a "x$with_ssl" != "xno"; then
+ 		if test "x$ld_minus_R" = "xno"; then
+ 			:
+ 		elif test "x$GCC" = "xyes"; then
+-			LDFLAGS="$LDFLAGS -Xlinker -R$with_ssl/lib"
++			:
+ 		else
+ 			LDFLAGS="$LDFLAGS -R$with_ssl/lib"
+ 		fi
+@@ -450,7 +450,7 @@ if test ! -z "$with_system_libvncserver" -a "x$with_system_libvncserver" != "xno
+ 		if test "x$ld_minus_R" = "xno"; then
+ 			:
+ 		elif test "x$GCC" = "xyes"; then
+-			rflag="-Xlinker -R$with_system_libvncserver/lib"
++			:
+ 		else
+ 			rflag="-R$with_system_libvncserver/lib"
+ 		fi
+@@ -487,7 +487,7 @@ new enough.
+ 		if test "x$ld_minus_R" = "xno"; then
+ 			:
+ 		elif test "x$GCC" = "xyes"; then
+-			rflag=" -Xlinker -R$rprefix/lib "
++			:
+ 		else
+ 			rflag=" -R$rprefix/lib "
+ 		fi
+@@ -544,8 +544,7 @@ if test "x$with_jpeg" != "xno"; then
+ 		if test "x$ld_minus_R" = "xno"; then
+ 			:
+ 		elif test "x$GCC" = "xyes"; then
+-			# this is not complete... in general a rat's nest.
+-			LDFLAGS="$LDFLAGS -Xlinker -R$with_jpeg/lib"
++			:
+ 		else
+ 			LDFLAGS="$LDFLAGS -R$with_jpeg/lib"
+ 		fi
+@@ -593,7 +592,7 @@ if test "x$with_zlib" != "xno" -a "x$with_libz" != "xno"; then
+ 		if test "x$ld_minus_R" = "xno"; then
+ 			:
+ 		elif test "x$GCC" = "xyes"; then
+-			LDFLAGS="$LDFLAGS -Xlinker -R$with_zlib/lib"
++			:
+ 		else
+ 			LDFLAGS="$LDFLAGS -R$with_zlib/lib"
+ 		fi
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 64c8a5d..98a0734 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libvncserver/x11vnc/${PV}/x11vnc-${PV}.tar.gz\
            file://starting-fix.patch \
-           file://endian-fix.patch "
+           file://endian-fix.patch \
+           file://remove-redundant-RPATH.patch \
+"
 
 SRC_URI[md5sum] = "a372ec4fe8211221547b1c108cf56e4c"
 SRC_URI[sha256sum] = "f6829f2e629667a5284de62b080b13126a0736499fe47cdb447aedb07a59f13b"
-- 
2.8.1


