Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E21AA706E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jul 2014 08:57:19 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6I8hCIA030371; Fri, 18 Jul 2014 09:43:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4_PBHypodocx; Fri, 18 Jul 2014 09:43:11 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6I8gwKL030243
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 18 Jul 2014 09:43:04 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X83ki-0006iW-VC; Fri, 18 Jul 2014 09:42:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Jul 2014 09:42:24 +0100
Message-Id: <1405672966-25729-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1405672966-25729-1-git-send-email-richard.purdie@linuxfoundation.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 05/27] dejagnu: Use "foreign" automake strictness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jul 2014 08:57:20 -0000

---
 .../dejagnu/dejagnu/configure.patch                | 45 ++++++++++++++++++++++
 meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb  |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/dejagnu/dejagnu/configure.patch

diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu/configure.patch b/meta-oe/recipes-devtools/dejagnu/dejagnu/configure.patch
new file mode 100644
index 0000000..2eb8af7
--- /dev/null
+++ b/meta-oe/recipes-devtools/dejagnu/dejagnu/configure.patch
@@ -0,0 +1,45 @@
+Index: dejagnu-1.4.4/configure.in
+===================================================================
+--- dejagnu-1.4.4.orig/configure.in	2014-07-18 07:05:49.997481207 +0000
++++ dejagnu-1.4.4/configure.in	2014-07-18 07:05:50.085481210 +0000
+@@ -1,10 +1,10 @@
+ dnl Process this file with autoconf to produce a configure script.
+ AC_PREREQ(2.13)
+-AC_INIT(runtest.exp)
++AC_INIT(dejagnu, 1.4.4)
+ dnl AC_CONFIG_AUX_DIR(..)
+ 
+ dnl These are required by automake
+-AM_INIT_AUTOMAKE(dejagnu, 1.4.4)
++AM_INIT_AUTOMAKE([foreign])
+ AM_MAINTAINER_MODE
+ AC_PROG_MAKE_SET
+ 
+Index: dejagnu-1.4.4/example/calc/configure.in
+===================================================================
+--- dejagnu-1.4.4.orig/example/calc/configure.in	2002-04-26 03:32:40.000000000 +0000
++++ dejagnu-1.4.4/example/calc/configure.in	2014-07-18 07:11:59.085491266 +0000
+@@ -1,8 +1,8 @@
+ dnl Process this file with autoconf to produce a configure script.
+ AC_PREREQ(2.5)
+-AC_INIT(calc.c)
++AC_INIT(calc, 1.1)
+ AM_CONFIG_HEADER(calc.h)
+-AM_INIT_AUTOMAKE(calc, 1.1)
++AM_INIT_AUTOMAKE([foreign])
+ 
+ AC_PROG_CC
+ AC_PROG_INSTALL
+Index: dejagnu-1.4.4/example/hello/configure.in
+===================================================================
+--- dejagnu-1.4.4.orig/example/hello/configure.in	2002-08-31 05:46:16.000000000 +0000
++++ dejagnu-1.4.4/example/hello/configure.in	2014-07-18 07:12:23.721491937 +0000
+@@ -25,7 +25,7 @@
+ # ------------------------------------------------------------------------
+ 
+ AC_INIT(helloworld, demo-version, philip.wilsey@ieee.org)
+-AM_INIT_AUTOMAKE(helloworld, demo-version)
++AM_INIT_AUTOMAKE([foreign])
+ 
+ #AC_CONFIG_SRCDIR([hello.cc])
+ #AC_CONFIG_HEADER([config.h])
diff --git a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
index f5fe9b9..63726b2 100644
--- a/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
+++ b/meta-oe/recipes-devtools/dejagnu/dejagnu_1.4.4.bb
@@ -5,7 +5,8 @@ SECTION = "devel"
 
 inherit autotools
 
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://configure.patch"
 
 SRC_URI[md5sum] = "053f18fd5d00873de365413cab17a666"
 SRC_URI[sha256sum] = "d0fbedef20fb0843318d60551023631176b27ceb1e11de7468a971770d0e048d"
-- 
2.0.2


