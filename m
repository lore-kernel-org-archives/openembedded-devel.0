Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OhJQ0-0002Yq-6e
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 11:40:51 +0200
Received: by fxm12 with SMTP id 12so3825388fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=wnrK8lgXq31Ii9+Dm08x+EXXcD0Py3q6epDY8TXQM8A=;
	b=Uv+6YWawfowQgALydSGGqktPewh05tlgHQ4sTdQNLgmwPWAGn0HRNvppOTXPs2yNfX
	7FzgUMvYUkrEN0zrtnrcWFU0dKgpARbmU/4wn/StVkGocXvclIokhOWehu8qYF4bBhlO
	aJ9+rjF7TetxdlTb7ZGF5ol95+Ss4mxdOVjkU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vJrS28b5FpTPLiAnx/EjmvQF1n+BBWfs/FIfcjpDYQzoKTVt/Y4KDwAnbK7dquXAuw
	gShGKVPsMdkmWnnCYo4864lhHa/DudiCxIRQLk8h3coCc5Fl1SV6TA8sTpNDpwiAOEVp
	HBkyh/m63lXXLzfB3oEBFXRveM6KG7DmT3hrA=
Received: by 10.223.103.72 with SMTP id j8mr12508534fao.4.1281087641483;
	Fri, 06 Aug 2010 02:40:41 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id m3sm538099fai.17.2010.08.06.02.40.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 06 Aug 2010 02:40:41 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OhJPp-00035c-7n; Fri, 06 Aug 2010 11:40:37 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Aug 2010 11:40:32 +0200
Message-Id: <1281087632-11759-4-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
References: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 4/4] bison: preparation for adding 2.4.2
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
X-List-Received-Date: Fri, 06 Aug 2010 09:40:51 -0000

untested

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/bison/bison.inc               |    2 +-
 recipes/bison/bison_2.0.bb            |    4 ++
 recipes/bison/bison_2.3.bb            |    6 ++-
 recipes/bison/bison_2.4.2.bb          |    7 +++
 recipes/bison/files/m4-inttypes.patch |   70 +++++++++++++++++++++++++++++++++
 recipes/bison/files/m4.patch          |   65 ------------------------------
 6 files changed, 86 insertions(+), 68 deletions(-)
 create mode 100644 recipes/bison/bison_2.4.2.bb
 create mode 100644 recipes/bison/files/m4-inttypes.patch

diff --git a/recipes/bison/bison.inc b/recipes/bison/bison.inc
index 22672e2..0068151 100644
--- a/recipes/bison/bison.inc
+++ b/recipes/bison/bison.inc
@@ -5,7 +5,7 @@ SECTION = "devel"
 PRIORITY = "optional"
 DEPENDS = "virtual/libintl"
 
-SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
+SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.bz2 \
 	   file://m4.patch"
 
 INC_PR = "r7"
diff --git a/recipes/bison/bison_2.0.bb b/recipes/bison/bison_2.0.bb
index d027f37..db6d601 100644
--- a/recipes/bison/bison_2.0.bb
+++ b/recipes/bison/bison_2.0.bb
@@ -1,5 +1,9 @@
 require bison.inc
 
+SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.gz \
+	   file://m4.patch \
+	   file://m4-inttypes.patch"
+
 PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "c17f964fd5504b88b07a183420de25e3"
diff --git a/recipes/bison/bison_2.3.bb b/recipes/bison/bison_2.3.bb
index 2664865..e15e680 100644
--- a/recipes/bison/bison_2.3.bb
+++ b/recipes/bison/bison_2.3.bb
@@ -1,5 +1,7 @@
 require bison.inc
 
+SRC_URI += "file://m4-inttypes.patch"
+
 PR = "${INC_PR}.0"
 
 # >> bison-2.3-r0: /usr/lib/liby.a
@@ -9,5 +11,5 @@ PR = "${INC_PR}.0"
 
 FILES_${PN} += "${libdir}/liby.a"
 
-SRC_URI[md5sum] = "22327efdd5080e2b1acb6e560a04b43a"
-SRC_URI[sha256sum] = "52f78aa4761a74ceb7fdf770f3554dd84308c3b93c4255e3a5c17558ecda293e"
+SRC_URI[md5sum] = "c18640c6ec31a169d351e3117ecce3ec"
+SRC_URI[sha256sum] = "b10d7e9e354be72aee4e4911cf19dd27b5c527d4e7200857365b5fcdeea0dffb"
diff --git a/recipes/bison/bison_2.4.2.bb b/recipes/bison/bison_2.4.2.bb
new file mode 100644
index 0000000..dff3bf0
--- /dev/null
+++ b/recipes/bison/bison_2.4.2.bb
@@ -0,0 +1,7 @@
+require bison.inc
+DEFAULT_PREFERENCE = "-1"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "63584004613aaef2d3dca19088eb1654"
+SRC_URI[sha256sum] = "57fb243aa9af04a6a57c4f4d9167f4440059fe923817f1fdf5592ab892af4fb8"
diff --git a/recipes/bison/files/m4-inttypes.patch b/recipes/bison/files/m4-inttypes.patch
new file mode 100644
index 0000000..e583241
--- /dev/null
+++ b/recipes/bison/files/m4-inttypes.patch
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
1.7.1



