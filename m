Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIH7G-0006bW-Le
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 11:46:46 +0200
Received: by wwe32 with SMTP id 32so3458306wwe.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 02:40:46 -0700 (PDT)
Received: by 10.216.220.159 with SMTP id o31mr2794373wep.113.1319449245649;
	Mon, 24 Oct 2011 02:40:45 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id es5sm37907362wbb.11.2011.10.24.02.40.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 02:40:44 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 11:40:29 +0200
Message-Id: <1319449234-12080-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1319449234-12080-2-git-send-email-koen@dominion.thruhere.net>
References: <1319449234-12080-1-git-send-email-koen@dominion.thruhere.net>
	<1319449234-12080-2-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 3/8] enca 1.9: import from OE classic
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
X-List-Received-Date: Mon, 24 Oct 2011 09:46:46 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-support/enca/enca/configure-hack.patch |   12 ++++++
 .../enca/enca/configure-remove-dumbness.patch      |   26 ++++++++++++++
 .../recipes-support/enca/enca/dont-run-tests.patch |   13 +++++++
 .../enca/enca/makefile-remove-tools.patch          |   13 +++++++
 meta-oe/recipes-support/enca/enca_1.9.bb           |   36 ++++++++++++++++++++
 5 files changed, 100 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/enca/enca/configure-hack.patch
 create mode 100644 meta-oe/recipes-support/enca/enca/configure-remove-dumbness.patch
 create mode 100644 meta-oe/recipes-support/enca/enca/dont-run-tests.patch
 create mode 100644 meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
 create mode 100644 meta-oe/recipes-support/enca/enca_1.9.bb

diff --git a/meta-oe/recipes-support/enca/enca/configure-hack.patch b/meta-oe/recipes-support/enca/enca/configure-hack.patch
new file mode 100644
index 0000000..85abcdc
--- /dev/null
+++ b/meta-oe/recipes-support/enca/enca/configure-hack.patch
@@ -0,0 +1,12 @@
+--- enca-1.9/configure.ac.orig	2006-02-15 00:57:39.000000000 -0800
++++ enca-1.9/configure.ac	2006-02-15 00:57:46.000000000 -0800
+@@ -92,9 +92,6 @@
+ dnl And for gtk-doc
+ gtk_CHECK_GTK_DOC
+ 
+-dnl Check for good random number sources
+-AC_CHECK_FILES(/dev/random /dev/urandom /dev/srandom /dev/arandom)
+-
+ dnl Dirty path hack.  Helps some people with badly set up search paths.
+ if test "$prefix" = "NONE"; then
+   LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
diff --git a/meta-oe/recipes-support/enca/enca/configure-remove-dumbness.patch b/meta-oe/recipes-support/enca/enca/configure-remove-dumbness.patch
new file mode 100644
index 0000000..6f6f3e3
--- /dev/null
+++ b/meta-oe/recipes-support/enca/enca/configure-remove-dumbness.patch
@@ -0,0 +1,26 @@
+--- enca-1.9/configure.ac.orig	2006-06-29 15:30:44.000000000 +0100
++++ enca-1.9/configure.ac	2006-06-29 15:31:41.000000000 +0100
+@@ -92,14 +92,15 @@
+ dnl And for gtk-doc
+ gtk_CHECK_GTK_DOC
+ 
+-dnl Dirty path hack.  Helps some people with badly set up search paths.
+-if test "$prefix" = "NONE"; then
+-  LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
+-else
+-  LDFLAGS="$LDFLAGS -L$prefix/lib"
+-  CPPFLAGS="$CPPFLAGS -I$prefix/include"
+-fi
++# This is really dumb code
++#dnl Dirty path hack.  Helps some people with badly set up search paths.
++#if test "$prefix" = "NONE"; then
++#  LDFLAGS="$LDFLAGS -L$ac_default_prefix/lib"
++#  CPPFLAGS="$CPPFLAGS -I$ac_default_prefix/include"
++#else
++#  LDFLAGS="$LDFLAGS -L$prefix/lib"
++#  CPPFLAGS="$CPPFLAGS -I$prefix/include"
++#fi
+ 
+ dnl Checks for libraries.
+ ye_CHECK_LIBM
diff --git a/meta-oe/recipes-support/enca/enca/dont-run-tests.patch b/meta-oe/recipes-support/enca/enca/dont-run-tests.patch
new file mode 100644
index 0000000..321d1e6
--- /dev/null
+++ b/meta-oe/recipes-support/enca/enca/dont-run-tests.patch
@@ -0,0 +1,13 @@
+Index: enca-1.9/Makefile.am
+===================================================================
+--- enca-1.9.orig/Makefile.am	2005-11-24 11:21:32.000000000 +0100
++++ enca-1.9/Makefile.am	2006-04-11 11:14:21.832502904 +0200
+@@ -2,7 +2,7 @@
+ if MAINTAINER_MODE
+ SUBDIRS = tools data script lib src devel-docs test
+ else
+-SUBDIRS = tools script lib src devel-docs test
++SUBDIRS = tools script lib src devel-docs
+ endif
+ man_MANS = man/enca.1
+ 
diff --git a/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch b/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
new file mode 100644
index 0000000..accfbcc
--- /dev/null
+++ b/meta-oe/recipes-support/enca/enca/makefile-remove-tools.patch
@@ -0,0 +1,13 @@
+--- enca-1.9/Makefile.am.orig	2006-06-29 15:34:55.000000000 +0100
++++ enca-1.9/Makefile.am	2006-06-29 15:35:20.000000000 +0100
+@@ -1,8 +1,8 @@
+ # @(#) $Id: Makefile.am,v 1.35 2005/11/24 10:21:32 yeti Exp $
+ if MAINTAINER_MODE
+-SUBDIRS = tools data script lib src devel-docs test
++SUBDIRS = data script lib src devel-docs test
+ else
+-SUBDIRS = tools script lib src devel-docs
++SUBDIRS = script lib src devel-docs
+ endif
+ man_MANS = man/enca.1
+ 
diff --git a/meta-oe/recipes-support/enca/enca_1.9.bb b/meta-oe/recipes-support/enca/enca_1.9.bb
new file mode 100644
index 0000000..5472af4
--- /dev/null
+++ b/meta-oe/recipes-support/enca/enca_1.9.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Enca is an Extremely Naive Charset Analyser"
+SECTION = "libs"
+HOMEPAGE = "http://trific.ath.cx/software/enca/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=24b9569831c46d4818450b55282476b4"
+
+SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/enca-${PV}.tar.bz2 \
+	file://configure-hack.patch \
+	file://dont-run-tests.patch \
+	file://configure-remove-dumbness.patch \
+	file://makefile-remove-tools.patch "
+
+SRC_URI[md5sum] = "b3581e28d68d452286fb0bfe58bed3b3"
+SRC_URI[sha256sum] = "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c410f4d"
+
+inherit autotools
+
+EXTRA_OECONF = "--with-libiconv-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+do_configure_prepend() {
+	# remove failing test which checks for something that isn't even used
+	sed -i -e '/ye_FUNC_SCANF_MODIF_SIZE_T/d' configure.ac
+}
+
+do_configure_append() {
+	sed -i s:-I/usr/include::g Makefile
+	sed -i s:-I/usr/include::g */Makefile
+}
+
+do_compile() {
+    cd ${S}/tools && ${BUILD_CC} -o make_hash make_hash.c
+    cd ..
+    oe_runmake
+}
+
-- 
1.6.6.1



