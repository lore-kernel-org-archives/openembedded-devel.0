Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1QTNUO-0004qS-SM
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 02:16:17 +0200
Received: by pxj1 with SMTP id 1so1209372pxj.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Jun 2011 17:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=MgD9mS3bOvDDRIMVeLAEJMGjU9ZpaXIEBqKDg9c/V+w=;
	b=kizY3dYhUDw4DIqX5mvbsvBPDbZcsDvWdFXeC4Xw3S+3Ci0dXXlpScbJUh2dF5EDKs
	B17UqD8CFbLIrP2eziZrFNMtH1B9uHE2Pqxlk7k1tYxbi9GykuU4GSXGG0xe1ves9GSA
	5uY3UF4Vh05sOWaDqqeExvcYiHfAh7fQ3UC6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uCTS8OAyBGkerOVyxK1JSYpqb1ZmnYh/f2Oo+A6Em9okf7ctHWEmjHuBCV4zE4XJHj
	4ewdGqB8P++OUKkyJV8u0z1VjoF4ywa5x1ZgUfcC98Ws6ptAGTxHLFYJ67N8EvAbDxwt
	iVAnwOY3TiKjHa/ogSQbn83aDsaRBs4/LoV4I=
Received: by 10.68.25.164 with SMTP id d4mr1608147pbg.473.1307319173862;
	Sun, 05 Jun 2011 17:12:53 -0700 (PDT)
Received: from localhost.localdomain ([173.8.168.17])
	by mx.google.com with ESMTPS id w2sm3257620pbg.5.2011.06.05.17.12.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Jun 2011 17:12:53 -0700 (PDT)
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  5 Jun 2011 17:12:25 -0700
Message-Id: <1307319145-4356-1-git-send-email-kg4ysn@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] fakeroot-native: Move from not fetchable 1.9.6 to 1.15.1.
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
X-List-Received-Date: Mon, 06 Jun 2011 00:16:17 -0000

Fakeroot 1.9.6 was not fetchable anymore.  Updating fakeroot-native to 1.15.1.

Signed-off-by: Chris Verges <kg4ysn@gmail.com>
---
 conf/distro/chinook-compat.conf                    |    2 +-
 conf/distro/maemo5-compat.conf                     |    2 +-
 .../fakeroot-1.9.6/configure-libtool.patch         |   18 -----------------
 recipes/fakeroot/fakeroot-1.9.6/fix-prefix.patch   |   18 -----------------
 recipes/fakeroot/fakeroot-native_1.15.1.bb         |   21 ++++++++++++++++++++
 recipes/fakeroot/fakeroot-native_1.9.6.bb          |   21 --------------------
 recipes/fakeroot/fakeroot_1.9.6.bb                 |   21 --------------------
 7 files changed, 23 insertions(+), 80 deletions(-)
 delete mode 100644 recipes/fakeroot/fakeroot-1.9.6/configure-libtool.patch
 delete mode 100644 recipes/fakeroot/fakeroot-1.9.6/fix-prefix.patch
 create mode 100644 recipes/fakeroot/fakeroot-native_1.15.1.bb
 delete mode 100644 recipes/fakeroot/fakeroot-native_1.9.6.bb
 delete mode 100644 recipes/fakeroot/fakeroot_1.9.6.bb

diff --git a/conf/distro/chinook-compat.conf b/conf/distro/chinook-compat.conf
index e9e2e1a..be2d579 100644
--- a/conf/distro/chinook-compat.conf
+++ b/conf/distro/chinook-compat.conf
@@ -198,7 +198,7 @@ PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk-hildon"
 PREFERRED_VERSION_swt3.4-gtk-hildon = "3.4"
 
 # Does not build with later versions
-PREFERRED_VERSION_fakeroot-native = "1.9.6"
+PREFERRED_VERSION_fakeroot-native = "1.15.1"
 
 # newer Versions needs newer autotools we cant relay on
 PREFERRED_VERSION_guile-native = "1.8.2"
diff --git a/conf/distro/maemo5-compat.conf b/conf/distro/maemo5-compat.conf
index c1f0e4b..30327fc 100644
--- a/conf/distro/maemo5-compat.conf
+++ b/conf/distro/maemo5-compat.conf
@@ -184,7 +184,7 @@ PREFERRED_PROVIDER_swt3.4-gtk = "swt3.4-gtk-hildon"
 PREFERRED_VERSION_swt3.4-gtk-hildon = "3.4"
 
 # Does not build with later versions
-PREFERRED_VERSION_fakeroot-native = "1.9.6"
+PREFERRED_VERSION_fakeroot-native = "1.15.1"
 
 # newer Versions needs newer autotools we cant relay on
 PREFERRED_VERSION_guile-native = "1.8.2"
diff --git a/recipes/fakeroot/fakeroot-1.9.6/configure-libtool.patch b/recipes/fakeroot/fakeroot-1.9.6/configure-libtool.patch
deleted file mode 100644
index 8830328..0000000
--- a/recipes/fakeroot/fakeroot-1.9.6/configure-libtool.patch
+++ /dev/null
@@ -1,18 +0,0 @@
---- fakeroot-1.8.3/configure.ac.orig	2007-10-31 00:17:27.000000000 -0500
-+++ fakeroot-1.8.3/configure.ac	2007-10-31 00:18:12.000000000 -0500
-@@ -1,14 +1,12 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_INIT([fakeroot],[FAKEROOT_VERSION],[schizo@debian.org],[fakeroot])
- AC_PREREQ(2.61)
--LT_PREREQ(2.1a)
- AC_CANONICAL_TARGET
- AM_INIT_AUTOMAKE
- AM_MAINTAINER_MODE
- AC_CONFIG_HEADERS([config.h])
- AC_PROG_MAKE_SET
--LT_INIT
--LT_LANG(C)
-+AC_PROG_LIBTOOL
- 
- AC_ARG_WITH([ipc],
- 	    AS_HELP_STRING([--with-ipc@<:@=IPCTYPE@:>@],
diff --git a/recipes/fakeroot/fakeroot-1.9.6/fix-prefix.patch b/recipes/fakeroot/fakeroot-1.9.6/fix-prefix.patch
deleted file mode 100644
index 3884aca..0000000
--- a/recipes/fakeroot/fakeroot-1.9.6/fix-prefix.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
---- fakeroot-1.2.13/scripts/fakeroot.in~fix-prefix
-+++ fakeroot-1.2.13/scripts/fakeroot.in
-@@ -15,8 +15,8 @@
- }
- 
- # strip /bin/fakeroot to find install prefix
--PREFIX=@prefix@
--BINDIR=@bindir@
-+BINDIR=`dirname $0`
-+PREFIX=`dirname ${BINDIR}`
-     
- LIB=lib@fakeroot_transformed@.so.0
- PATHS=@libdir@:${PREFIX}/lib64/libfakeroot:${PREFIX}/lib32/libfakeroot
diff --git a/recipes/fakeroot/fakeroot-native_1.15.1.bb b/recipes/fakeroot/fakeroot-native_1.15.1.bb
new file mode 100644
index 0000000..8fb8bce
--- /dev/null
+++ b/recipes/fakeroot/fakeroot-native_1.15.1.bb
@@ -0,0 +1,21 @@
+require fakeroot_${PV}.bb
+
+RDEPENDS_${PN} = "util-linux-native"
+
+SRC_URI += "file://fix-prefix.patch "
+S = "${WORKDIR}/fakeroot-${PV}"
+
+inherit native
+
+EXTRA_OECONF = " --program-prefix="
+
+# Compatability for the rare systems not using or having SYSV
+python () {
+    if bb.data.getVar('HOST_NONSYSV', d, True) and bb.data.getVar('HOST_NONSYSV', d, True) != '0':
+        bb.data.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ', d)
+}
+
+do_stage_append () {
+    oe_libinstall -so libfakeroot ${STAGING_LIBDIR}/libfakeroot/
+}
+
diff --git a/recipes/fakeroot/fakeroot-native_1.9.6.bb b/recipes/fakeroot/fakeroot-native_1.9.6.bb
deleted file mode 100644
index 8fb8bce..0000000
--- a/recipes/fakeroot/fakeroot-native_1.9.6.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require fakeroot_${PV}.bb
-
-RDEPENDS_${PN} = "util-linux-native"
-
-SRC_URI += "file://fix-prefix.patch "
-S = "${WORKDIR}/fakeroot-${PV}"
-
-inherit native
-
-EXTRA_OECONF = " --program-prefix="
-
-# Compatability for the rare systems not using or having SYSV
-python () {
-    if bb.data.getVar('HOST_NONSYSV', d, True) and bb.data.getVar('HOST_NONSYSV', d, True) != '0':
-        bb.data.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ', d)
-}
-
-do_stage_append () {
-    oe_libinstall -so libfakeroot ${STAGING_LIBDIR}/libfakeroot/
-}
-
diff --git a/recipes/fakeroot/fakeroot_1.9.6.bb b/recipes/fakeroot/fakeroot_1.9.6.bb
deleted file mode 100644
index 0a3ea93..0000000
--- a/recipes/fakeroot/fakeroot_1.9.6.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Gives a fake root environment"
-HOMEPAGE = "http://fakeroot.alioth.debian.org/"
-SECTION = "base"
-LICENSE = "GPL"
-# fakeroot needs getopt which is provided by the util-linux package
-RDEPENDS_${PN} = "util-linux"
-PR = "r3"
-
-SRC_URI = "${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.tar.gz \
-           file://configure-libtool.patch"
-	    
-inherit autotools
-
-do_stage() {
-        install -d ${STAGING_INCDIR}/fakeroot
-        install -m 644 *.h ${STAGING_INCDIR}/fakeroot
-        autotools_stage_all
-}
-
-SRC_URI[md5sum] = "9441c981bfd4e521abcd5d93385f71d8"
-SRC_URI[sha256sum] = "06c2772ae6e446227f6798ad8994fcdb1fe64385bc83a34f7e29fd8af2e4f5da"
-- 
1.7.4.1



