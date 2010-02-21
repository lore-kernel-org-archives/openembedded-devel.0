Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NjDm2-00024f-6I
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Feb 2010 16:31:13 +0100
Received: by fxm8 with SMTP id 8so1610138fxm.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Feb 2010 07:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=5J4iexi4dVIIdSgQ4sZ2Q4SjU4wtD+h9m0cHo6NnrIo=;
	b=emX1RFxuc4In/PrSROOX3mdj/Or9KmdlDTfDaMVnyRV7SfAymAnaggvH5/iTfZ2/YG
	erRy8qqHfaDLUZZrd7lvw5GJWUOajHvjVk1HwXZXni09OmIJIQqJnAgaVdnRzqrX2HXK
	pcEtRtLCV6BdqYqLGOCEpoPfZd2wfrC0UzBJc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=svjKoBOM/RltchhYiMsiddD6gR0bNmmSVXlKtrtRNIBEdiw/GySjvP7d37EdIRUGG+
	GS4r2CDZKy4N5cAorvACGGmGeSwIms8rjzHLPZ7xqBvLl/OvWB806vHeCVIgWsEH38n5
	CY6Rcxg09RnY0Ir4jLXH3OPgEfq351w4xT/tc=
Received: by 10.223.63.20 with SMTP id z20mr3642549fah.98.1266766106246;
	Sun, 21 Feb 2010 07:28:26 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id y15sm3221240fkd.38.2010.02.21.07.28.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 21 Feb 2010 07:28:25 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NjDo0-0007Y9-Gl; Sun, 21 Feb 2010 16:33:12 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Feb 2010 16:33:10 +0100
Message-Id: <1266766390-28915-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.6.6.1
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] bison: split inttypes*.m4 into separate patch
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
X-List-Received-Date: Sun, 21 Feb 2010 15:31:13 -0000

..to avoid conflicts with bison-2.4.1

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/bison/bison_2.0.bb         |    4 ++-
 recipes/bison/bison_2.3.bb         |    4 ++-
 recipes/bison/files/inttypes.patch |   70 ++++++++++++++++++++++++++++++++++++
 recipes/bison/files/m4.patch       |   65 ---------------------------------
 4 files changed, 76 insertions(+), 67 deletions(-)
 create mode 100644 recipes/bison/files/inttypes.patch

diff --git a/recipes/bison/bison_2.0.bb b/recipes/bison/bison_2.0.bb
index edf549f..db3db31 100644
--- a/recipes/bison/bison_2.0.bb
+++ b/recipes/bison/bison_2.0.bb
@@ -5,6 +5,8 @@ SECTION = "devel"
 PRIORITY = "optional"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
-	   file://m4.patch;patch=1"
+	   file://m4.patch;patch=1 \
+	   file://inttypes.patch;patch=1 \
+	  "
 
 inherit autotools
diff --git a/recipes/bison/bison_2.3.bb b/recipes/bison/bison_2.3.bb
index 729756b..66e5d58 100644
--- a/recipes/bison/bison_2.3.bb
+++ b/recipes/bison/bison_2.3.bb
@@ -7,7 +7,9 @@ PRIORITY = "optional"
 PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
-	   file://m4.patch;patch=1"
+	   file://m4.patch;patch=1 \
+	   file://inttypes.patch;patch=1 \
+	  "
 
 inherit autotools
 
diff --git a/recipes/bison/files/inttypes.patch b/recipes/bison/files/inttypes.patch
new file mode 100644
index 0000000..e583241
--- /dev/null
+++ b/recipes/bison/files/inttypes.patch
@@ -0,0 +1,70 @@
+
+#
+# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
+#
+
+--- /dev/null
++++ bison-1.875/m4/inttypes-pri.m4
+@@ -0,0 +1,32 @@
++# inttypes-pri.m4 serial 1 (gettext-0.11.4)
++dnl Copyright (C) 1997-2002 Free Software Foundation, Inc.
++dnl This file is free software, distributed under the terms of the GNU
++dnl General Public License.  As a special exception to the GNU General
++dnl Public License, this file may be distributed as part of a program
++dnl that contains a configuration script generated by Autoconf, under
++dnl the same distribution terms as the rest of that program.
++
++dnl From Bruno Haible.
++
++# Define PRI_MACROS_BROKEN if <inttypes.h> exists and defines the PRI*
++# macros to non-string values.  This is the case on AIX 4.3.3.
++
++AC_DEFUN([gt_INTTYPES_PRI],
++[
++  AC_REQUIRE([gt_HEADER_INTTYPES_H])
++  if test $gt_cv_header_inttypes_h = yes; then
++    AC_CACHE_CHECK([whether the inttypes.h PRIxNN macros are broken],
++      gt_cv_inttypes_pri_broken,
++      [
++        AC_TRY_COMPILE([#include <inttypes.h>
++#ifdef PRId32
++char *p = PRId32;
++#endif
++], [], gt_cv_inttypes_pri_broken=no, gt_cv_inttypes_pri_broken=yes)
++      ])
++  fi
++  if test "$gt_cv_inttypes_pri_broken" = yes; then
++    AC_DEFINE_UNQUOTED(PRI_MACROS_BROKEN, 1,
++      [Define if <inttypes.h> exists and defines unusable PRI* macros.])
++  fi
++])
+--- /dev/null
++++ bison-1.875/m4/inttypes.m4
+@@ -0,0 +1,27 @@
++# inttypes.m4 serial 1 (gettext-0.11.4)
++dnl Copyright (C) 1997-2002 Free Software Foundation, Inc.
++dnl This file is free software, distributed under the terms of the GNU
++dnl General Public License.  As a special exception to the GNU General
++dnl Public License, this file may be distributed as part of a program
++dnl that contains a configuration script generated by Autoconf, under
++dnl the same distribution terms as the rest of that program.
++
++dnl From Paul Eggert.
++
++# Define HAVE_INTTYPES_H if <inttypes.h> exists and doesn't clash with
++# <sys/types.h>.
++
++AC_DEFUN([gt_HEADER_INTTYPES_H],
++[
++  AC_CACHE_CHECK([for inttypes.h], gt_cv_header_inttypes_h,
++  [
++    AC_TRY_COMPILE(
++      [#include <sys/types.h>
++#include <inttypes.h>],
++      [], gt_cv_header_inttypes_h=yes, gt_cv_header_inttypes_h=no)
++  ])
++  if test $gt_cv_header_inttypes_h = yes; then
++    AC_DEFINE_UNQUOTED(HAVE_INTTYPES_H, 1,
++      [Define if <inttypes.h> exists and doesn't clash with <sys/types.h>.])
++  fi
++])
diff --git a/recipes/bison/files/m4.patch b/recipes/bison/files/m4.patch
index b62fe89..b060532 100644
--- a/recipes/bison/files/m4.patch
+++ b/recipes/bison/files/m4.patch
@@ -4,41 +4,6 @@
 #
 
 --- /dev/null
-+++ bison-1.875/m4/inttypes-pri.m4
-@@ -0,0 +1,32 @@
-+# inttypes-pri.m4 serial 1 (gettext-0.11.4)
-+dnl Copyright (C) 1997-2002 Free Software Foundation, Inc.
-+dnl This file is free software, distributed under the terms of the GNU
-+dnl General Public License.  As a special exception to the GNU General
-+dnl Public License, this file may be distributed as part of a program
-+dnl that contains a configuration script generated by Autoconf, under
-+dnl the same distribution terms as the rest of that program.
-+
-+dnl From Bruno Haible.
-+
-+# Define PRI_MACROS_BROKEN if <inttypes.h> exists and defines the PRI*
-+# macros to non-string values.  This is the case on AIX 4.3.3.
-+
-+AC_DEFUN([gt_INTTYPES_PRI],
-+[
-+  AC_REQUIRE([gt_HEADER_INTTYPES_H])
-+  if test $gt_cv_header_inttypes_h = yes; then
-+    AC_CACHE_CHECK([whether the inttypes.h PRIxNN macros are broken],
-+      gt_cv_inttypes_pri_broken,
-+      [
-+        AC_TRY_COMPILE([#include <inttypes.h>
-+#ifdef PRId32
-+char *p = PRId32;
-+#endif
-+], [], gt_cv_inttypes_pri_broken=no, gt_cv_inttypes_pri_broken=yes)
-+      ])
-+  fi
-+  if test "$gt_cv_inttypes_pri_broken" = yes; then
-+    AC_DEFINE_UNQUOTED(PRI_MACROS_BROKEN, 1,
-+      [Define if <inttypes.h> exists and defines unusable PRI* macros.])
-+  fi
-+])
---- /dev/null
 +++ bison-1.875/m4/lcmessage.m4
 @@ -0,0 +1,32 @@
 +# lcmessage.m4 serial 3 (gettext-0.11.3)
@@ -529,36 +494,6 @@
 +  rm -f conf.glibtest
 +])
 --- /dev/null
-+++ bison-1.875/m4/inttypes.m4
-@@ -0,0 +1,27 @@
-+# inttypes.m4 serial 1 (gettext-0.11.4)
-+dnl Copyright (C) 1997-2002 Free Software Foundation, Inc.
-+dnl This file is free software, distributed under the terms of the GNU
-+dnl General Public License.  As a special exception to the GNU General
-+dnl Public License, this file may be distributed as part of a program
-+dnl that contains a configuration script generated by Autoconf, under
-+dnl the same distribution terms as the rest of that program.
-+
-+dnl From Paul Eggert.
-+
-+# Define HAVE_INTTYPES_H if <inttypes.h> exists and doesn't clash with
-+# <sys/types.h>.
-+
-+AC_DEFUN([gt_HEADER_INTTYPES_H],
-+[
-+  AC_CACHE_CHECK([for inttypes.h], gt_cv_header_inttypes_h,
-+  [
-+    AC_TRY_COMPILE(
-+      [#include <sys/types.h>
-+#include <inttypes.h>],
-+      [], gt_cv_header_inttypes_h=yes, gt_cv_header_inttypes_h=no)
-+  ])
-+  if test $gt_cv_header_inttypes_h = yes; then
-+    AC_DEFINE_UNQUOTED(HAVE_INTTYPES_H, 1,
-+      [Define if <inttypes.h> exists and doesn't clash with <sys/types.h>.])
-+  fi
-+])
---- /dev/null
 +++ bison-1.875/m4/isc-posix.m4
 @@ -0,0 +1,26 @@
 +# isc-posix.m4 serial 2 (gettext-0.11.2)
-- 
1.6.6



