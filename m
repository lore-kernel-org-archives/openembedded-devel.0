Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6897001D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2016 08:20:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5S8K0Lr000968
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jun 2016 01:20:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 28 Jun 2016 01:20:00 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Jun 2016 04:19:58 -0400
Message-ID: <1467101998-72781-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1467017831-170380-1-git-send-email-hongxu.jia@windriver.com>
References: <1467017831-170380-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] x11vnc: remove redundant RPATH to fix QA issue
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
X-List-Received-Date: Tue, 28 Jun 2016 08:20:04 -0000
Content-Type: text/plain

The useless rpath caused oe QA issue:
...
|ERROR: QA Issue: x11vnc: work/i586-poky-linux/x11vnc/0.9.13-r0/packages-split/
x11vnc/usr/bin/x11vnc contains probably-redundant RPATH /usr/lib [useless-rpaths]
...

In oe build, it is unnecessary and redundant to pass "-R/usr/lib" to the linker.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../x11vnc/files/remove-redundant-RPATH.patch      | 86 ++++++++++++++++++++++
 meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.13.bb   |  4 +-
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch b/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch
new file mode 100644
index 0000000..8e894bd
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/remove-redundant-RPATH.patch
@@ -0,0 +1,86 @@
+From 7be055c13c7d0d640941830a3291af3b404928c1 Mon Sep 17 00:00:00 2001
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
+ configure.ac | 21 +++++----------------
+ 1 file changed, 5 insertions(+), 16 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 6f664d0..f986686 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -330,10 +330,8 @@ if test "x$with_crypto" != "xno" -a "x$with_ssl" != "xno"; then
+ 		saved_LDFLAGS="$LDFLAGS"
+ 		CPPFLAGS="$CPPFLAGS -I$with_ssl/include"
+ 		LDFLAGS="$LDFLAGS -L$with_ssl/lib"
+-		if test "x$ld_minus_R" = "xno"; then
++		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
+ 			:
+-		elif test "x$GCC" = "xyes"; then
+-			LDFLAGS="$LDFLAGS -Xlinker -R$with_ssl/lib"
+ 		else
+ 			LDFLAGS="$LDFLAGS -R$with_ssl/lib"
+ 		fi
+@@ -447,10 +445,8 @@ if test ! -z "$with_system_libvncserver" -a "x$with_system_libvncserver" != "xno
+ 	fi
+ 	if test "x$with_system_libvncserver" != "xyes"; then
+ 		rflag=""
+-		if test "x$ld_minus_R" = "xno"; then
++		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
+ 			:
+-		elif test "x$GCC" = "xyes"; then
+-			rflag="-Xlinker -R$with_system_libvncserver/lib"
+ 		else
+ 			rflag="-R$with_system_libvncserver/lib"
+ 		fi
+@@ -484,10 +480,8 @@ new enough.
+ 	elif libvncserver-config --version 1>/dev/null 2>&1; then
+ 		rflag=""
+ 		rprefix=`libvncserver-config --prefix`
+-		if test "x$ld_minus_R" = "xno"; then
++		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
+ 			:
+-		elif test "x$GCC" = "xyes"; then
+-			rflag=" -Xlinker -R$rprefix/lib "
+ 		else
+ 			rflag=" -R$rprefix/lib "
+ 		fi
+@@ -541,11 +535,8 @@ if test "x$with_jpeg" != "xno"; then
+ 		saved_LDFLAGS="$LDFLAGS"
+ 		CPPFLAGS="$CPPFLAGS -I$with_jpeg/include"
+ 		LDFLAGS="$LDFLAGS -L$with_jpeg/lib"
+-		if test "x$ld_minus_R" = "xno"; then
++		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
+ 			:
+-		elif test "x$GCC" = "xyes"; then
+-			# this is not complete... in general a rat's nest.
+-			LDFLAGS="$LDFLAGS -Xlinker -R$with_jpeg/lib"
+ 		else
+ 			LDFLAGS="$LDFLAGS -R$with_jpeg/lib"
+ 		fi
+@@ -590,10 +581,8 @@ if test "x$with_zlib" != "xno" -a "x$with_libz" != "xno"; then
+ 		saved_LDFLAGS="$LDFLAGS"
+ 		CPPFLAGS="$CPPFLAGS -I$with_zlib/include"
+ 		LDFLAGS="$LDFLAGS -L$with_zlib/lib"
+-		if test "x$ld_minus_R" = "xno"; then
++		if test "x$ld_minus_R" = "xno" -o "x$GCC" = "xyes"; then
+ 			:
+-		elif test "x$GCC" = "xyes"; then
+-			LDFLAGS="$LDFLAGS -Xlinker -R$with_zlib/lib"
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


