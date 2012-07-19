Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrtPb-0004Ew-Hm
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 18:17:11 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2153382bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=b0affeO6Iydunn9OuRISm56zxCnxcMKXnLuHz796vhc=;
	b=ka1GnKPqEfc7VPNYNkBhs8PMr8u8jC3pg6N6v8Xd5qjhIKrf4y90mRbEw6aPcpePxV
	vnSwqEmvzq1thW5gXV45bfoSEIl0vPWphSikZsxaA6+HWLGPW3f6Gqi8dOKm4horHeLM
	lcxV9Fdx56Z0qmbrh8pcf6ETOc2qnTMOEoVhnCZ886I152RonLOm1/KM5207tW3f8z19
	wQfnLVbrs5cbYzoYGGMrgGB1HWXzngYzhGiitsqqz1hroMugNyFdCHjjqVR3IDIf8Gj0
	yPWzMFX9zy5jJdvnvMxOlSoABWKWHvKriC4Ps1nWQPDsgSb+4K1CDN/OYM+QXKBXgbs3
	6YUA==
Received: by 10.204.132.80 with SMTP id a16mr1522269bkt.82.1342713951671;
	Thu, 19 Jul 2012 09:05:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm1507647bkq.12.2012.07.19.09.05.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:05:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 18:05:53 +0200
Message-Id: <1342713953-13000-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342713953-13000-1-git-send-email-Martin.Jansa@gmail.com>
References: <1342713953-13000-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] check: upgrade to 0.9.8 and fix build with new automake-1.12.x - WIP
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
X-List-Received-Date: Thu, 19 Jul 2012 16:17:11 -0000

* configure_fix.patch and
  check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch
  were already resolved upstream

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../check/check-0.9.8/fix.automake-1.12.x.patch    |   26 ++++++++++++++++++++
 meta-oe/recipes-support/check/check_0.9.5.bb       |   19 --------------
 meta-oe/recipes-support/check/check_0.9.8.bb       |   15 +++++++++++
 ...graphs-in-macro-names-to-unbreak-autoconf.patch |   18 -------------
 .../check/files/configure_fix.patch                |   12 ---------
 5 files changed, 41 insertions(+), 49 deletions(-)
 create mode 100644 meta-oe/recipes-support/check/check-0.9.8/fix.automake-1.12.x.patch
 delete mode 100644 meta-oe/recipes-support/check/check_0.9.5.bb
 create mode 100644 meta-oe/recipes-support/check/check_0.9.8.bb
 delete mode 100644 meta-oe/recipes-support/check/files/check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch
 delete mode 100644 meta-oe/recipes-support/check/files/configure_fix.patch

diff --git a/meta-oe/recipes-support/check/check-0.9.8/fix.automake-1.12.x.patch b/meta-oe/recipes-support/check/check-0.9.8/fix.automake-1.12.x.patch
new file mode 100644
index 0000000..e11aabe
--- /dev/null
+++ b/meta-oe/recipes-support/check/check-0.9.8/fix.automake-1.12.x.patch
@@ -0,0 +1,26 @@
+Fixes this error:
+
+| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libcompat.la': linking libtool libraries using a non-POSIX
+| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+| lib/Makefile.am:3:   while processing Libtool library 'libcompat.la'
+| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libcheck.la': linking libtool libraries using a non-POSIX
+| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+| src/Makefile.am:3:   while processing Libtool library 'libcheck.la'
+| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libcheckinternal.la': linking libtool libraries using a non-POSIX
+| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+| src/Makefile.am:4:   while processing Libtool library 'libcheckinternal.la'
+| autoreconf: automake failed with exit status: 1
+
+Upstream-Status: Pending
+
+diff -uNr check-0.9.8.orig//configure.ac check-0.9.8/configure.ac
+--- check-0.9.8.orig//configure.ac	2009-09-23 12:50:08.000000000 +0200
++++ check-0.9.8/configure.ac	2012-07-19 17:43:51.000000000 +0200
+@@ -102,6 +102,7 @@
+ AC_PROG_INSTALL
+ AC_PROG_LN_S
+ AC_PROG_LIBTOOL
++AM_PROG_AR
+ 
+ # add these options to CFLAGS if the compiler supports them
+ AC_DEFUN([AX_CFLAGS_ADD],[AX_C_CHECK_FLAG($1, , , CFLAGS="$CFLAGS $1")])
diff --git a/meta-oe/recipes-support/check/check_0.9.5.bb b/meta-oe/recipes-support/check/check_0.9.5.bb
deleted file mode 100644
index 2f1ae94..0000000
--- a/meta-oe/recipes-support/check/check_0.9.5.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "a unit test framework for C"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
-SECTION = "devel"
-
-PR = "r2"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
-           file://configure_fix.patch \
-           file://check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch \
-          "
-S = "${WORKDIR}/check-${PV}"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "--enable-plain-docdir"
-
-SRC_URI[md5sum] = "30143c7974b547a12a7da47809a90951"
-SRC_URI[sha256sum] = "961b3c66869018d02226bbbc394e79362cd898962ce810bce8417b3c497f7ad6"
diff --git a/meta-oe/recipes-support/check/check_0.9.8.bb b/meta-oe/recipes-support/check/check_0.9.8.bb
new file mode 100644
index 0000000..ca79740
--- /dev/null
+++ b/meta-oe/recipes-support/check/check_0.9.8.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "a unit test framework for C"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
+SECTION = "devel"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
+           file://fix.automake-1.12.x.patch \
+          "
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--enable-plain-docdir"
+
+SRC_URI[md5sum] = "5d75e9a6027cde79d2c339ef261e7470"
+SRC_URI[sha256sum] = "82acf956bb07584ffea2bf04d5989fe939c3e74ecf93133a21037fd0f7996a7f"
diff --git a/meta-oe/recipes-support/check/files/check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch b/meta-oe/recipes-support/check/files/check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch
deleted file mode 100644
index 61bdf1d..0000000
--- a/meta-oe/recipes-support/check/files/check-m4-am-path-check-use-quadrigraphs-in-macro-names-to-unbreak-autoconf.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Imported from http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=395466
-
--Khem
-Index: check-0.9.5/check.m4
-===================================================================
---- check-0.9.5.orig/check.m4
-+++ check-0.9.5/check.m4
-@@ -4,8 +4,8 @@ dnl
- 
- AC_DEFUN([AM_PATH_CHECK],
- [
--  AC_MSG_WARN([[AM_PATH_CHECK() is deprecated]])
--  AC_MSG_WARN([[use PKG_CHECK_MODULES([CHECK], [check >= 0.9.4]) instead]])
-+  AC_MSG_WARN([A@&t@M_PATH_CHECK() is deprecated])
-+  AC_MSG_WARN([[use P@&t@KG_CHECK_MODULES([CHECK], [check >= 0.9.4]) instead]])
-   AC_ARG_WITH([check],
-   [  --with-check=PATH       prefix where check is installed [default=auto]])
-  
diff --git a/meta-oe/recipes-support/check/files/configure_fix.patch b/meta-oe/recipes-support/check/files/configure_fix.patch
deleted file mode 100644
index 3e79319..0000000
--- a/meta-oe/recipes-support/check/files/configure_fix.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: check-0.9.5/configure.ac
-===================================================================
---- check-0.9.5.orig/configure.ac	2008-10-29 04:09:50.000000000 +0000
-+++ check-0.9.5/configure.ac	2008-10-29 04:10:06.000000000 +0000
-@@ -71,6 +71,7 @@
- AC_PROG_INSTALL
- AC_PROG_LN_S
- AC_PROG_LIBTOOL
-+AM_PROG_CC_C_O
- if test -n "$GCC"; then
-   CFLAGS="$CFLAGS -Wall -Wstrict-prototypes -Wmissing-prototypes -Wwrite-strings"
- fi
-- 
1.7.8.6



