Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1TaifT-0007gF-Hu
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2012 08:54:55 +0100
Received: from mail175-co1-R.bigfish.com (10.243.78.253) by
	CO1EHSOBE011.bigfish.com (10.243.66.74) with Microsoft SMTP Server id
	14.1.225.23; Tue, 20 Nov 2012 07:10:31 +0000
Received: from mail175-co1 (localhost [127.0.0.1])	by
	mail175-co1-R.bigfish.com (Postfix) with ESMTP id 839C8A4009C	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2012 07:10:31 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eId772hzz1de0h1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h162dh1631h1155h)
Received: from mail175-co1 (localhost.localdomain [127.0.0.1]) by mail175-co1
	(MessageSwitch) id 1353395428796026_15396;
	Tue, 20 Nov 2012 07:10:28 +0000 (UTC)
Received: from CO1EHSMHS026.bigfish.com (unknown [10.243.78.240])	by
	mail175-co1.bigfish.com (Postfix) with ESMTP id B6979800045	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2012 07:10:28 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS026.bigfish.com
	(10.243.66.36) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 20 Nov 2012 07:10:28 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 20 Nov 2012 07:10:27 +0000
Received: from localhost.localdomain (guo-desktop.ap.freescale.net
	[10.192.208.249])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id qAK7AMOt017909;	Tue, 20 Nov 2012 00:10:24 -0700
From: Chunrong Guo <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 20 Nov 2012 15:10:37 +0800
Message-ID: <1353395437-10948-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com, B19537@freescale.com
Subject: [meta-networking v6 ] inetutils : Update to 1.9.1
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
X-List-Received-Date: Tue, 20 Nov 2012 07:54:55 -0000
Content-Type: text/plain

   * There are difference spaces between  inetutils-1.8/COPYING
     and inetutils-1.9.1/COPYING,so md5sum is changed.

   * the following patches are accepted by inetutils 1.9.1 upstream
     inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
     inetutils-1.8-1004-detect-fork-support.patch
     inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
     inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
     inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
     inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch

Signed-off-by: Chunrong Guo <b40290@freescale.com>
---
 .../disable-pre-ANSI-compilers.patch               |   16 +++
 .../inetutils-1.9.1}/fix-disable-ipv6.patch        |    2 +
 ...tf-parse-pull-in-features.h-for-__GLIBC__.patch |    2 +
 .../inetutils-1.8-0003-wchar.patch                 |    2 +
 .../inetutils/inetutils-1.9.1/remove-gets.patch    |   21 ++++
 .../inetutils/inetutils-1.9.1/version.patch        |   17 +++
 .../inetutils/inetutils_1.9.1.bb                   |   16 ++--
 ...rgp-fix-program_invocation_name-detection.patch |   51 ---------
 ...me-ruserpass-to-avoid-C-library-collision.patch |   58 -----------
 ...detect-__rcmd_errstr-support-in-the-C-lib.patch |   57 ----------
 ...e-daemon-from-the-C-library-when-possible.patch |   42 --------
 .../inetutils-1.8-1004-detect-fork-support.patch   |   54 ----------
 ...-1.8-1005-ftpd-add-daemon-D-nommu-support.patch |  109 --------------------
 13 files changed, 67 insertions(+), 380 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
 rename {meta-oe/recipes-connectivity/inetutils/inetutils-1.8 => meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1}/fix-disable-ipv6.patch (98%)
 rename {meta-oe/recipes-connectivity/inetutils/inetutils-1.8 => meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1}/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch (96%)
 rename {meta-oe/recipes-connectivity/inetutils/inetutils-1.8 => meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1}/inetutils-1.8-0003-wchar.patch (92%)
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch
 rename meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb => meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb (74%)
 delete mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
 delete mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
 delete mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
 delete mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
 delete mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1004-detect-fork-support.patch
 delete mode 100644 meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
new file mode 100644
index 0000000..a7fa61c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/disable-pre-ANSI-compilers.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+
+disable pre-ANSI compilers
+
+Signed-off-by: Chunrong Guo <b40290@freescale.com>
+--- inetutils-1.9.1/configure.ac	2012-01-06 22:05:05.000000000 +0800
++++ inetutils-1.9.1/configure.ac	2012-11-12 14:05:30.756957063 +0800
+@@ -586,7 +586,7 @@
+ 		  #include <arpa/tftp.h>])
+ 
+ ### Checks for compiler characteristics.
+-AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI compilers?
++#AM_C_PROTOTYPES dnl FIXME: Does inetutils even compile on pre-ANSI compilers?
+ AC_C_CONST
+ 
+ dnl See if `weak refs' are possible; these make it possible (with shared
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/fix-disable-ipv6.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/fix-disable-ipv6.patch
similarity index 98%
rename from meta-oe/recipes-connectivity/inetutils/inetutils-1.8/fix-disable-ipv6.patch
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/fix-disable-ipv6.patch
index 75d51a1..bd3ae47 100644
--- a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/fix-disable-ipv6.patch
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/fix-disable-ipv6.patch
@@ -1,5 +1,7 @@
 Upstream: http://www.mail-archive.com/bug-inetutils@gnu.org/msg02103.html
 
+Upstream-Status: Pending
+
 diff -ur inetutils-1.8.orig/ping/ping_common.h inetutils-1.8/ping/ping_common.h
 --- inetutils-1.8.orig/ping/ping_common.h	2010-05-15 20:55:47.000000000 +0930
 +++ inetutils-1.8/ping/ping_common.h	2010-12-01 12:19:08.000000000 +1030
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
similarity index 96%
rename from meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
index d328f13..3da4e9f 100644
--- a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
@@ -3,6 +3,8 @@ From: Mike Frysinger <vapier at gentoo.org>
 Date: Thu, 18 Nov 2010 16:59:14 -0500
 Subject: [PATCH gnulib] printf-parse: pull in features.h for __GLIBC__
 
+Upstream-Status: Pending
+
 Signed-off-by: Mike Frysinger <vapier at gentoo.org>
 ---
  lib/printf-parse.h |    3 +++
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0003-wchar.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0003-wchar.patch
similarity index 92%
rename from meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0003-wchar.patch
rename to meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0003-wchar.patch
index 21635a7..b13bb92 100644
--- a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0003-wchar.patch
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.8-0003-wchar.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- inetutils-1.8/lib/wchar.in.h
 +++ inetutils-1.8/lib/wchar.in.h
 @@ -70,6 +70,9 @@
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch
new file mode 100644
index 0000000..61d16e3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/remove-gets.patch
@@ -0,0 +1,21 @@
+Uptream-Status: Pending
+
+remove gets function
+
+Signed-off-by: Chunrong Guo <b40290@freescale.com>
+--- inetutils-1.9.1.org/lib/stdio.in.h	2012-01-06 22:11:13.000000000 +0800
++++ inetutils-1.9.1/lib/stdio.in.h	2012-11-12 14:30:49.044958001 +0800
+@@ -715,9 +715,13 @@
+ /* It is very rare that the developer ever has full control of stdin,
+    so any use of gets warrants an unconditional warning.  Assume it is
+    always declared, since it is required by C89.  */
++#if defined gets
++#undef gets
+ _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
+ #endif
+ 
++#endif
++
+ 
+ #if @GNULIB_OBSTACK_PRINTF@ || @GNULIB_OBSTACK_PRINTF_POSIX@
+ struct obstack;
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch
new file mode 100644
index 0000000..ac3181d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/version.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+remove m4_esyscmd function
+
+Signed-off-by: Chunrong Guo <b40290@freescale.com>
+--- inetutils-1.9.1/configure.ac	2012-01-06 22:05:05.000000000 +0800
++++ inetutils-1.9.1/configure.ac	2012-11-12 14:01:11.732957019 +0800
+@@ -20,8 +20,7 @@
+ 
+ AC_PREREQ(2.59)
+ 
+-AC_INIT([GNU inetutils],
+- m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v/;s/_/./g']),
++AC_INIT([GNU inetutils],[1.9.1],
+  [bug-inetutils@gnu.org])
+ 
+ AC_CONFIG_SRCDIR([src/inetd.c])
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
similarity index 74%
rename from meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
rename to meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index ce0df82..81457d7 100644
--- a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -6,21 +6,19 @@ SECTION = "libs"
 DEPENDS = "ncurses"
 LICENSE = "GPLv3"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
+
 
 SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
+           file://disable-pre-ANSI-compilers.patch \
+           file://version.patch \
+           file://remove-gets.patch \
            file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
-           file://inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch \
            file://inetutils-1.8-0003-wchar.patch \
-           file://inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch \
-           file://inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch \
-           file://inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch \
-           file://inetutils-1.8-1004-detect-fork-support.patch \
-           file://inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch \
            file://fix-disable-ipv6.patch \
 " 
-SRC_URI[md5sum] = "ad8fdcdf1797b9ca258264a6b04e48fd"
-SRC_URI[sha256sum] = "c8500baee04b9ea408c9e65e24ad7f5b41e7d96d42fb1d29abf25b52b68311c7"
+SRC_URI[md5sum] = "944f7196a2b3dba2d400e9088576000c"
+SRC_URI[sha256sum] = "02a9ebde8a198cb85f87545b9d88fb103a183958139864a85fe9e027ad79ff2b"
 
 inherit autotools gettext
 
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
deleted file mode 100644
index 6861f21..0000000
--- a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-0002-argp-fix-program_invocation_name-detection.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 93dbd3319232613ff8f5f3f08bf5f57b21980ef1 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier at gentoo.org>
-Date: Thu, 18 Nov 2010 17:14:21 -0500
-Subject: [PATCH gnulib] argp: fix program_invocation_name detection
-
-The current program_invocation_name symbol detection fails if the argp.h
-header is missing.  So check for the header first before detecting if the
-symbol exists.
-
-Signed-off-by: Mike Frysinger <vapier at gentoo.org>
----
- m4/argp.m4 |   15 +++++++++++++--
- 1 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/m4/argp.m4 b/m4/argp.m4
-index d3ca5ba..efa562c 100644
---- a/m4/argp.m4
-+++ b/m4/argp.m4
-@@ -31,8 +31,14 @@ AC_DEFUN([gl_ARGP],
-   # are defined elsewhere. It is improbable that only one of them will
-   # be defined and other not, I prefer to stay on the safe side and to
-   # test each one separately.
-+  AC_CHECK_HEADERS_ONCE([argp.h])
-   AC_MSG_CHECKING([whether program_invocation_name is defined])
--  AC_TRY_LINK([#include <argp.h>],
-+  AC_TRY_LINK([
-+#include <errno.h>
-+#ifdef HAVE_ARGP_H
-+# include <argp.h>
-+#endif
-+],
-               [ program_invocation_name = "test"; ],
-               [ AC_DEFINE([HAVE_PROGRAM_INVOCATION_NAME], [1],
-                  [Define if program_invocation_name is defined])
-@@ -40,7 +46,12 @@ AC_DEFUN([gl_ARGP],
-               [ AC_MSG_RESULT([no])] )
- 
-   AC_MSG_CHECKING([whether program_invocation_short_name is defined])
--  AC_TRY_LINK([#include <argp.h>],
-+  AC_TRY_LINK([
-+#include <errno.h>
-+#ifdef HAVE_ARGP_H
-+# include <argp.h>
-+#endif
-+],
-               [ program_invocation_short_name = "test"; ],
-               [ AC_DEFINE([HAVE_PROGRAM_INVOCATION_SHORT_NAME], [1],
-                  [Define if program_invocation_short_name is defined])
--- 
-1.7.3.2
-
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
deleted file mode 100644
index a6e366d..0000000
--- a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1001-ftp-rename-ruserpass-to-avoid-C-library-collision.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 4f890adb39b52bc43c578966071625004988e3b8 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier at gentoo.org>
-Date: Thu, 18 Nov 2010 22:11:48 -0500
-Subject: [PATCH] ftp: rename ruserpass to avoid C library collision
-
-The C library itself defines a "ruserpass" function.  When linking
-statically, it is possible to hit a symbol collision linker error.
-So rename the local ftp version to "remote_userpass".
-
-Signed-off-by: Mike Frysinger <vapier at gentoo.org>
----
- ftp/extern.h    |    2 +-
- ftp/ftp.c       |    2 +-
- ftp/ruserpass.c |    2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/ftp/extern.h b/ftp/extern.h
-index 8cdb8aa..037cb61 100644
---- a/ftp/extern.h
-+++ b/ftp/extern.h
-@@ -119,7 +119,7 @@ void reset (int, char **);
- void restart (int, char **);
- void rmthelp (int, char **);
- void rmtstatus (int, char **);
--int ruserpass (char *, char **, char **, char **);
-+int remote_userpass (char *, char **, char **, char **);
- void sendrequest (char *, char *, char *, int);
- void setascii (int, char **);
- void setbell (int, char **);
-diff --git a/ftp/ftp.c b/ftp/ftp.c
-index c20ba41..95675cc 100644
---- a/ftp/ftp.c
-+++ b/ftp/ftp.c
-@@ -251,7 +251,7 @@ login (char *host)
-   int n, aflag = 0;
- 
-   user = pass = acct = 0;
--  if (ruserpass (host, &user, &pass, &acct) < 0)
-+  if (remote_userpass (host, &user, &pass, &acct) < 0)
-     {
-       code = -1;
-       return (0);
-diff --git a/ftp/ruserpass.c b/ftp/ruserpass.c
-index 8572b95..c08fbc0 100644
---- a/ftp/ruserpass.c
-+++ b/ftp/ruserpass.c
-@@ -111,7 +111,7 @@ static struct toktab
- };
- 
- int
--ruserpass (char *host, char **aname, char **apass, char **aacct)
-+remote_userpass (char *host, char **aname, char **apass, char **aacct)
- {
-   char *hdir, buf[BUFSIZ], *tmp;
-   char *myname = 0, *mydomain;
--- 
-1.7.3.2
-
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
deleted file mode 100644
index 7708c40..0000000
--- a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1002-rshd-detect-__rcmd_errstr-support-in-the-C-lib.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 730015f060fe76eee615f361a65eb719cdf22eef Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier at gentoo.org>
-Date: Thu, 18 Nov 2010 22:20:39 -0500
-Subject: [PATCH] rshd: detect __rcmd_errstr support in the C lib
-
-Not all C libraries support __rcmd_errstr, so add a configure test for it.
-
-Signed-off-by: Mike Frysinger <vapier at gentoo.org>
----
- configure.ac |    2 +-
- src/rshd.c   |    4 ++++
- 2 files changed, 5 insertions(+), 1 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index c1ac270..79d655c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -587,7 +587,7 @@ AC_CHECK_FUNCS(cfsetspeed cgetent dirfd fchdir flock \
-                setsid setregid setreuid setresgid setresuid setutent_r \
-                sigaction sigvec strchr setproctitle tcgetattr tzset utimes \
-                utime uname \
--               updwtmp updwtmpx vhangup wait3 wait4 opendir2)
-+               updwtmp updwtmpx vhangup wait3 wait4 opendir2 __rcmd_errstr)
- 
- dnl Functions that we will define if necessary.
- AC_REPLACE_FUNCS(getpass getusershell memcmp memcpy memmove memset \
-diff --git a/src/rshd.c b/src/rshd.c
-index d49facd..9301ef2 100644
---- a/src/rshd.c
-+++ b/src/rshd.c
-@@ -284,7 +284,9 @@ extern char **environ;
- void
- doit (int sockfd, struct sockaddr_in *fromp)
- {
-+#ifdef HAVE___RCMD_ERRSTR
-   extern char *__rcmd_errstr;	/* syslog hook from libc/net/rcmd.c. */
-+#endif
-   struct hostent *hp;
-   struct passwd *pwd;
-   u_short port;
-@@ -757,11 +759,13 @@ doit (int sockfd, struct sockaddr_in *fromp)
-                      && (iruserok (fromp->sin_addr.s_addr, pwd->pw_uid == 0,
-                                    remuser, locuser)) < 0))
-     {
-+#ifdef HAVE___RCMD_ERRSTR
-       if (__rcmd_errstr)
- 	syslog (LOG_INFO | LOG_AUTH,
- 		"%s@%s as %s: permission denied (%s). cmd='%.80s'",
- 		remuser, hostname, locuser, __rcmd_errstr, cmdbuf);
-       else
-+#endif
- 	syslog (LOG_INFO | LOG_AUTH,
- 		"%s@%s as %s: permission denied. cmd='%.80s'",
- 		remuser, hostname, locuser, cmdbuf);
--- 
-1.7.3.2
-
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
deleted file mode 100644
index 8575c10..0000000
--- a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1003-use-daemon-from-the-C-library-when-possible.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 3b9f64c6a668849b37b884a7826885c70b95787b Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier at gentoo.org>
-Date: Thu, 18 Nov 2010 22:24:06 -0500
-Subject: [PATCH] use daemon from the C library when possible
-
-Signed-off-by: Mike Frysinger <vapier at gentoo.org>
----
- configure.ac          |    2 +-
- libinetutils/daemon.c |    2 ++
- 2 files changed, 3 insertions(+), 1 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 79d655c..25cc3db 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -579,7 +579,7 @@ AC_FUNC_MMAP
- AC_FUNC_MALLOC
- AC_FUNC_REALLOC
- 
--AC_CHECK_FUNCS(bcopy bcmp bzero cfsetspeed cgetent dirfd fchdir flock \
-+AC_CHECK_FUNCS(bcopy bcmp bzero cfsetspeed cgetent daemon dirfd fchdir flock \
-                fpathconf ftruncate \
- 	       getcwd getmsg getspnam initgroups initsetproctitle killpg \
-                mkstemp ptsname \
-diff --git a/libinetutils/daemon.c b/libinetutils/daemon.c
-index 2156af4..9beb255 100644
---- a/libinetutils/daemon.c
-+++ b/libinetutils/daemon.c
-@@ -197,8 +197,10 @@ waitdaemon (int nochdir, int noclose, int maxwait)
-   return ppid;
- }
- 
-+#ifndef HAVE_DAEMON
- int
- daemon (int nochdir, int noclose)
- {
-   return (waitdaemon (nochdir, noclose, 0) == -1) ? -1 : 0;
- }
-+#endif
--- 
-1.7.3.2
-
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1004-detect-fork-support.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1004-detect-fork-support.patch
deleted file mode 100644
index fc9d726..0000000
--- a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1004-detect-fork-support.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 0acaed0d4b2bf9495e71ec4c898733bed2a86be0 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier at gentoo.org>
-Date: Thu, 18 Nov 2010 22:27:55 -0500
-Subject: [PATCH] detect fork() support
-
-Linux/nommu systems cannot support a fork(), so add a configure test for
-it so apps can pick that or vfork().
-
-Signed-off-by: Mike Frysinger <vapier at gentoo.org>
----
- configure.ac                |    2 +-
- libinetutils/libinetutils.h |    9 +++++++++
- 2 files changed, 10 insertions(+), 1 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 25cc3db..98196f4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -580,7 +580,7 @@ AC_FUNC_MALLOC
- AC_FUNC_REALLOC
- 
- AC_CHECK_FUNCS(bcopy bcmp bzero cfsetspeed cgetent daemon dirfd fchdir flock \
--               fpathconf ftruncate \
-+               fork fpathconf ftruncate \
- 	       getcwd getmsg getspnam initgroups initsetproctitle killpg \
-                mkstemp ptsname \
-                setegid seteuid setpgid \
-diff --git a/libinetutils/libinetutils.h b/libinetutils/libinetutils.h
-index 19bbde5..86365b0 100644
---- a/libinetutils/libinetutils.h
-+++ b/libinetutils/libinetutils.h
-@@ -17,6 +17,8 @@
-   You should have received a copy of the GNU General Public License
-   along with this program.  If not, see `http://www.gnu.org/licenses/'. */
- 
-+#include <config.h>
-+
- #include "argp-version-etc.h"
- 
- void utmp_init (char *line, char *user, char *id);
-@@ -32,3 +34,10 @@ extern const char *default_program_authors[];
- #define iu_argp_init(name, authors)				\
-   argp_program_bug_address = "<" PACKAGE_BUGREPORT ">";		\
-   argp_version_setup (name, authors);
-+
-+#ifdef HAVE_FORK
-+# define fork_exit(s) exit(s)
-+#else
-+# define fork() vfork()
-+# define fork_exit(s) _exit(s)
-+#endif
--- 
-1.7.3.2
-
diff --git a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch b/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
deleted file mode 100644
index 844905b..0000000
--- a/meta-oe/recipes-connectivity/inetutils/inetutils-1.8/inetutils-1.8-1005-ftpd-add-daemon-D-nommu-support.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 1dee55b90d2971859377156e6210efdfdf1bac84 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier at gentoo.org>
-Date: Fri, 19 Nov 2010 20:26:48 -0500
-Subject: [PATCH] ftpd: add daemon (-D) nommu support
-
-The current daemon design of ftpd is to:
-	- loop in server_mode() waiting for a connection
-	- fork a child and return to main() to process like inetd
-	- have parent continue looping in server_mode()
-
-On a nommu system where we can only vfork(), the child returning
-from server_mode() corrupts the stack and messes up the the parent.
-So rather than having the child return, exec a new ftpd process in
-the normal inetd mode.  This also fixes the problem in nommu where
-a vfork-ed child pauses the parent until it either exits or execs
-something.
-
-Signed-off-by: Mike Frysinger <vapier at gentoo.org>
----
- ftpd/extern.h      |    3 ++-
- ftpd/ftpd.c        |   17 ++++++++++++++---
- ftpd/server_mode.c |    9 ++++++++-
- 3 files changed, 24 insertions(+), 5 deletions(-)
-
-diff --git a/ftpd/extern.h b/ftpd/extern.h
-index 2483fe6..81182e0 100644
---- a/ftpd/extern.h
-+++ b/ftpd/extern.h
-@@ -110,7 +110,8 @@ extern char tmpline[];
- extern off_t restart_point;
- 
- /* Exported from server_mode.c.  */
--extern int server_mode (const char *pidfile, struct sockaddr_in *phis_addr);
-+extern int server_mode (const char *pidfile, struct sockaddr_in *phis_addr,
-+			char *argv[]);
- 
- /* Credential for the request.  */
- struct credentials
-diff --git a/ftpd/ftpd.c b/ftpd/ftpd.c
-index aed74e6..c5c4c90 100644
---- a/ftpd/ftpd.c
-+++ b/ftpd/ftpd.c
-@@ -424,8 +424,7 @@ main (int argc, char *argv[], char **envp)
-   argp_parse (&argp, argc, argv, 0, &index, NULL);
-   
-   /* Bail out, wrong usage */
--  argc -= index;
--  if (argc != 0)
-+  if (argc - index != 0)
-     error (1, 0, "surplus arguments; try `%s --help' for more info",
- 	   program_name);
- 
-@@ -438,7 +437,19 @@ main (int argc, char *argv[], char **envp)
-      fd = accept(). tcpd is check if compile with the support  */
-   if (daemon_mode)
-     {
--      if (server_mode (pid_file, &his_addr) < 0)
-+#ifndef HAVE_FORK
-+      /* Shift out the daemon option in subforks  */
-+      int i;
-+      for (i = 0; i < argc; ++i)
-+	if (strcmp (argv[i], "-D") == 0)
-+	  {
-+	    int j;
-+	    for (j = i; j < argc; ++j)
-+	      argv[j] = argv[j + 1];
-+	    argv[--argc] = NULL;
-+	  }
-+#endif
-+      if (server_mode (pid_file, &his_addr, argv) < 0)
- 	exit (1);
-     }
-   else
-diff --git a/ftpd/server_mode.c b/ftpd/server_mode.c
-index 3d3a498..605e13e 100644
---- a/ftpd/server_mode.c
-+++ b/ftpd/server_mode.c
-@@ -37,6 +37,8 @@
- # include <tcpd.h>
- #endif
- 
-+#include <libinetutils.h>
-+
- static void reapchild (int);
- 
- #define DEFPORT 21
-@@ -92,7 +94,7 @@ reapchild (int signo ARG_UNUSED)
- }
- 
- int
--server_mode (const char *pidfile, struct sockaddr_in *phis_addr)
-+server_mode (const char *pidfile, struct sockaddr_in *phis_addr, char *argv[])
- {
-   int ctl_sock, fd;
-   struct servent *sv;
-@@ -176,5 +178,10 @@ server_mode (const char *pidfile, struct sockaddr_in *phis_addr)
-   if (!check_host ((struct sockaddr *) phis_addr))
-     return -1;
- #endif
-+
-+#ifndef HAVE_FORK
-+  _exit(execvp(argv[0], argv));
-+#endif
-+
-   return fd;
- }
--- 
-1.7.3.2
-
-- 
1.7.0.4




