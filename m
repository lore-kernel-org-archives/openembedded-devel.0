Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.6092.1612518748480501426
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 01:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1159qDk8023450
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Feb 2021 01:52:13 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 5 Feb 2021 01:52:13 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 5 Feb 2021 01:52:13 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] spice: make conpatible to autoconf-2.70
Date: Fri, 5 Feb 2021 01:52:13 -0800
Message-ID: <20210205095213.17584-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In order to build with autoconf 2.7, explicitly link to jpeg lib
since lib jpeg is already in DEPENDS
...
| checking for jpeglib.h... ../git/configure: line 16008: CPP: command not found
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...igure.ac-explicitly-link-to-jpeg-lib.patch | 48 +++++++++++++++++++
 .../recipes-support/spice/spice_git.bb        |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/spice/0001-configure.ac-explicitly-link-to-jpeg-lib.patch

diff --git a/meta-networking/recipes-support/spice/spice/0001-configure.ac-explicitly-link-to-jpeg-lib.patch b/meta-networking/recipes-support/spice/spice/0001-configure.ac-explicitly-link-to-jpeg-lib.patch
new file mode 100644
index 000000000..2d05143db
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice/0001-configure.ac-explicitly-link-to-jpeg-lib.patch
@@ -0,0 +1,48 @@
+From 6ffd9db8e02e411bda2f421abf7951dab6cf0e38 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 5 Feb 2021 01:43:44 -0800
+Subject: [PATCH] configure.ac: explicitly link to jpeg lib
+
+Since oe has added lib jpeg to the depends, explicitly link to jpeg lib
+to workaround build failure with autoconf 2.7
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 14 +-------------
+ 1 file changed, 1 insertion(+), 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1ce81f91..8bbb50de 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -191,24 +191,12 @@ AC_SUBST(SSL_CFLAGS)
+ AC_SUBST(SSL_LIBS)
+ AS_VAR_APPEND([SPICE_REQUIRES], [" openssl"])
+ 
+-AC_CHECK_LIB(jpeg, jpeg_destroy_decompress,
+-    AC_MSG_CHECKING([for jpeglib.h])
+-    AC_TRY_CPP(
+-[#include <stdio.h>
+-#undef PACKAGE
+-#undef VERSION
+-#undef HAVE_STDLIB_H
+-#include <jpeglib.h>],
+-        JPEG_LIBS='-ljpeg'
+-        AC_MSG_RESULT($jpeg_ok),
+-	AC_MSG_ERROR([jpeglib.h not found])),
+-    AC_MSG_ERROR([libjpeg not found]))
++JPEG_LIBS='-ljpeg'
+ AC_SUBST(JPEG_LIBS)
+ 
+ AC_CHECK_LIB(z, deflate, Z_LIBS='-lz', AC_MSG_ERROR([zlib not found]))
+ AC_SUBST(Z_LIBS)
+ 
+-
+ AC_ARG_ENABLE([manual],
+                AS_HELP_STRING([--enable-manual=@<:@auto/yes/no@:>@],
+                               [Build SPICE manual]),
+-- 
+2.29.2
+
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index fad8b639e..52dad7124 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common \
     file://0001-Convert-pthread_t-to-be-numeric.patch \
     file://0001-Fix-compile-errors-on-Linux-32bit-system.patch \
+    file://0001-configure.ac-explicitly-link-to-jpeg-lib.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.29.2

