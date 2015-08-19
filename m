Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 90AF473CC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 06:42:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99797627"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2015 14:45:29 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7J6g9MD019153
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 14:42:09 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 19 Aug 2015 14:42:11 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Aug 2015 14:42:27 +0800
Message-ID: <1439966547-24317-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-networking][PATCH] rp-pppoe:3.8->3.11
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
X-List-Received-Date: Wed, 19 Aug 2015 06:42:19 -0000
Content-Type: text/plain

-deleted use-ldflags.patch that not needed.
-modified patches for 3.11

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../configure.in-Error-fix.patch                   | 18 +++++----
 .../configure.patch                                |  0
 .../configure_in_cross.patch                       | 46 ++++++++++++++--------
 .../discard-use-of-dnl-in-Makefile.am.patch        |  0
 .../rp-pppoe-3.11/dont-swallow-errors.patch        | 28 +++++++++++++
 .../pppoe-server.default                           |  0
 .../pppoe-server.init                              |  0
 .../pppoe-server.service                           |  0
 .../pppoe-src-restrictions.patch                   |  0
 .../top-autoconf.patch                             |  0
 .../update-config.patch                            |  0
 .../rp-pppoe-3.8/dont-swallow-errors.patch         | 15 -------
 .../rp-pppoe/rp-pppoe-3.8/use-ldflags.patch        | 27 -------------
 .../rp-pppoe/{rp-pppoe_3.8.bb => rp-pppoe_3.11.bb} |  7 ++--
 14 files changed, 71 insertions(+), 70 deletions(-)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/configure.in-Error-fix.patch (70%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/configure.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/configure_in_cross.patch (79%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/discard-use-of-dnl-in-Makefile.am.patch (100%)
 create mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/dont-swallow-errors.patch
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/pppoe-server.default (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/pppoe-server.init (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/pppoe-server.service (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/pppoe-src-restrictions.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/top-autoconf.patch (100%)
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe-3.8 => rp-pppoe-3.11}/update-config.patch (100%)
 delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
 delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe_3.8.bb => rp-pppoe_3.11.bb} (91%)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure.in-Error-fix.patch
similarity index 70%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure.in-Error-fix.patch
index 1e815f3..2661fd3 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.in-Error-fix.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure.in-Error-fix.patch
@@ -1,6 +1,6 @@
-From a546942a784a177080d9722dda873bfd7416ad41 Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Fri, 10 Apr 2015 13:13:06 +0900
+From 71956de46feef962dc0645af4c81ae074ca3b818 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 19 Aug 2015 13:52:57 +0900
 Subject: [PATCH] configure.in: Error fix.
 
 the error is: conftest.c:9:28: fatal error: ac_nonexistent.h:
@@ -10,19 +10,20 @@ Upstream-Status: pending
 
 Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
 ---
- src/configure.in | 28 ----------------------------
- 1 file changed, 28 deletions(-)
+ src/configure.in | 30 ------------------------------
+ 1 file changed, 30 deletions(-)
 
 diff --git a/src/configure.in b/src/configure.in
-index c4f1a8c..74956cc 100644
+index 0b23df5..31c7fbc 100644
 --- a/src/configure.in
 +++ b/src/configure.in
-@@ -183,34 +183,6 @@ if test "$GCC" = yes; then
- 	CFLAGS="$CFLAGS -Wall -Wstrict-prototypes -ansi"
+@@ -193,36 +193,6 @@ if test "$GCC" = yes; then
+ 	CFLAGS="$CFLAGS -fno-strict-aliasing -Wall -Wstrict-prototypes"
  fi
  
 -dnl Figure out packing order of structures
 -AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
+-if test "${rpppoe_cv_pack_bitfields+set}" != set ; then
 -AC_TRY_RUN([
 -union foo {
 -    struct bar {
@@ -47,6 +48,7 @@ index c4f1a8c..74956cc 100644
 -    }
 -}], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
 -$ECHO "no defaults for cross-compiling"; exit 1)
+-fi
 -])
 -
  if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure_in_cross.patch
similarity index 79%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure_in_cross.patch
index 1896759..88cf7e6 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/configure_in_cross.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/configure_in_cross.patch
@@ -1,14 +1,23 @@
+From cab02076afb808a43c6ff3d7b1c64e71f5a1b397 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 19 Aug 2015 12:17:03 +0900
+Subject: [PATCH] configure in cross
+
 Update the configure script to cross-compiling with OE.  This hard-codes
 a few target paths, reworks a few tests to be more friendly for cross
 and drops other tests.
 
 Upstream-Status: Inappropriate [build system specific changes]
 
-Index: src/configure.in
-===================================================================
---- rp-pppoe-3.8.orig/src/configure.in	2006-04-03 00:29:42.000000000 +1000
-+++ rp-pppoe-3.8/src/configure.in	2007-06-07 22:19:36.000000000 +1000
-@@ -5,6 +5,13 @@
+---
+ src/configure.in | 66 ++++++++++++++------------------------------------------
+ 1 file changed, 16 insertions(+), 50 deletions(-)
+
+diff --git a/src/configure.in b/src/configure.in
+index e194295..82d64d6 100644
+--- a/src/configure.in
++++ b/src/configure.in
+@@ -5,6 +5,13 @@ AC_INIT(pppoe.c)
  dnl pppd directory for kernel-mode PPPoE
  PPPD_DIR=ppp-2.4.1.pppoe2
  
@@ -22,7 +31,7 @@ Index: src/configure.in
  AC_CONFIG_HEADER(config.h)
  
  AC_PREFIX_DEFAULT(/usr)
-@@ -44,7 +51,7 @@
+@@ -45,7 +52,7 @@ ac_cv_struct_sockaddr_ll=no)
  AC_MSG_RESULT($ac_cv_struct_sockaddr_ll)
  
  if test "$ac_cv_struct_sockaddr_ll" = yes ; then
@@ -31,7 +40,7 @@ Index: src/configure.in
  fi
  
  dnl Check for N_HDLC line discipline
-@@ -55,7 +62,7 @@
+@@ -56,7 +63,7 @@ AC_TRY_COMPILE([#include <linux/termios.h>],
  	ac_cv_n_hdlc=no)
  AC_MSG_RESULT($ac_cv_n_hdlc)
  if test "$ac_cv_n_hdlc" = yes ; then
@@ -40,7 +49,7 @@ Index: src/configure.in
  fi
  
  AC_ARG_ENABLE(plugin, [  --enable-plugin=pppd_src_path   build pppd plugin], ac_cv_pluginpath=$enableval, ac_cv_pluginpath=no)
-@@ -100,13 +107,13 @@
+@@ -104,7 +111,7 @@ PPPD_INCDIR=""
  if test "$ac_cv_header_linux_if_pppox_h" = yes ; then
  	if test "$ac_cv_pluginpath" != no ; then
  		LINUX_KERNELMODE_PLUGIN=rp-pppoe.so
@@ -49,6 +58,8 @@ Index: src/configure.in
  		PPPD_INCDIR=$ac_cv_pluginpath
  	fi
  fi
+@@ -114,7 +121,7 @@ if test "$PPPD_INCDIR" = "" ; then
+ fi
  
  if test "$ac_cv_debugging" = "yes" ; then
 -   AC_DEFINE(DEBUGGING_ENABLED)
@@ -56,7 +67,7 @@ Index: src/configure.in
  fi
  
  AC_SUBST(LINUX_KERNELMODE_PLUGIN)
-@@ -131,15 +138,8 @@
+@@ -140,15 +147,8 @@ AC_CHECK_SIZEOF(unsigned short)
  AC_CHECK_SIZEOF(unsigned int)
  AC_CHECK_SIZEOF(unsigned long)
  
@@ -73,8 +84,8 @@ Index: src/configure.in
  
  dnl Check for Linux-specific kernel support for PPPoE
  AC_MSG_CHECKING(for Linux 2.4.X kernel-mode PPPoE support)
-@@ -183,44 +183,8 @@
- 	CFLAGS="$CFLAGS -Wall -Wstrict-prototypes -ansi"
+@@ -193,44 +193,8 @@ if test "$GCC" = yes; then
+ 	CFLAGS="$CFLAGS -fno-strict-aliasing -Wall -Wstrict-prototypes"
  fi
  
 -dnl If we couldn't find pppd, die
@@ -116,13 +127,13 @@ Index: src/configure.in
  dnl Figure out packing order of structures
 -AC_MSG_CHECKING([packing order of bit fields])
 +AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
+ if test "${rpppoe_cv_pack_bitfields+set}" != set ; then
  AC_TRY_RUN([
  union foo {
-     struct bar {
-@@ -245,10 +209,11 @@
-     }
+@@ -257,10 +221,11 @@ main(void)
  }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
  $ECHO "no defaults for cross-compiling"; exit 0)
+ fi
 +])
  
  if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
@@ -132,11 +143,14 @@ Index: src/configure.in
  else
  	AC_MSG_RESULT(normal)
  fi
-@@ -312,6 +277,7 @@
+@@ -324,6 +289,7 @@ AC_SUBST(PPPOE_SERVER_DEPS)
  AC_SUBST(RDYNAMIC)
  AC_SUBST(LIBEVENT)
  AC_SUBST(ECHO)
 +AC_SUBST(HAVE_STRUCT_SOCKADDR_LL)
+ AC_SUBST(LDFLAGS)
  
  datadir_evaluated=`eval echo $datadir`
- AC_SUBST(datadir_evaluated)
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/discard-use-of-dnl-in-Makefile.am.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/discard-use-of-dnl-in-Makefile.am.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/dont-swallow-errors.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/dont-swallow-errors.patch
new file mode 100644
index 0000000..f61337f
--- /dev/null
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/dont-swallow-errors.patch
@@ -0,0 +1,28 @@
+From bbdadb803b19f002e76e7bb5ce3faf770dd7c413 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 19 Aug 2015 12:33:41 +0900
+Subject: [PATCH] don't swallow errors
+
+Further fixup to the configure scripts to not swallow errors
+
+Upstream-Status: Pending
+---
+ src/configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/configure.in b/src/configure.in
+index 82d64d6..0b23df5 100644
+--- a/src/configure.in
++++ b/src/configure.in
+@@ -219,7 +219,7 @@ main(void)
+ 	return 2;
+     }
+ }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
+-$ECHO "no defaults for cross-compiling"; exit 0)
++$ECHO "no defaults for cross-compiling"; exit 1)
+ fi
+ ])
+ 
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.default b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.default
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.default
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.default
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.init b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.init
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.init
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.init
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.service
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-server.service
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-server.service
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-src-restrictions.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/pppoe-src-restrictions.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/pppoe-src-restrictions.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/top-autoconf.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/top-autoconf.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/top-autoconf.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/update-config.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/update-config.patch
similarity index 100%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/update-config.patch
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.11/update-config.patch
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
deleted file mode 100644
index c7fc9cf..0000000
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/dont-swallow-errors.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Further fixup to the configure scripts to not swallow errors
-
-Upstream-Status: Pending
-
---- a/src/configure.in.org	2008-01-14 21:08:38.000000000 +0200
-+++ a/src/configure.in	2008-01-14 21:20:09.000000000 +0200
-@@ -208,7 +208,7 @@
- 	return 2;
-     }
- }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
--$ECHO "no defaults for cross-compiling"; exit 0)
-+$ECHO "no defaults for cross-compiling"; exit 1)
- ])
- 
- if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
deleted file mode 100644
index 95f6292..0000000
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe-3.8/use-ldflags.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Make the Makefile obey LDFLAGS.
-
-Upstream-Status: Pending
-
---- a/src/Makefile.in	2006-04-02 18:29:42.000000000 +0400
-+++ b/src/Makefile.in	2010-04-16 17:51:31.000000000 +0400
-@@ -67,16 +67,16 @@ all: $(TARGETS)
- 	@echo "Type 'make install' as root to install the software."
- 
- pppoe-sniff: pppoe-sniff.o if.o common.o debug.o
--	@CC@ -o pppoe-sniff pppoe-sniff.o if.o common.o debug.o
-+	@CC@ -o pppoe-sniff pppoe-sniff.o if.o common.o debug.o $(LDFLAGS)
- 
- pppoe-server: pppoe-server.o if.o debug.o common.o md5.o libevent/libevent.a @PPPOE_SERVER_DEPS@
--	@CC@ -o pppoe-server @RDYNAMIC@ pppoe-server.o if.o debug.o common.o md5.o $(PPPOE_SERVER_LIBS) -Llibevent -levent
-+	@CC@ -o pppoe-server @RDYNAMIC@ pppoe-server.o if.o debug.o common.o md5.o $(PPPOE_SERVER_LIBS) -Llibevent -levent $(LDFLAGS)
- 
- pppoe: pppoe.o if.o debug.o common.o ppp.o discovery.o
--	@CC@ -o pppoe pppoe.o if.o debug.o common.o ppp.o discovery.o
-+	@CC@ -o pppoe pppoe.o if.o debug.o common.o ppp.o discovery.o $(LDFLAGS)
- 
- pppoe-relay: relay.o if.o debug.o common.o
--	@CC@ -o pppoe-relay relay.o if.o debug.o common.o
-+	@CC@ -o pppoe-relay relay.o if.o debug.o common.o $(LDFLAGS)
- 
- pppoe.o: pppoe.c pppoe.h
- 	@CC@ $(CFLAGS) '-DVERSION="$(VERSION)"' -c -o pppoe.o pppoe.c
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.11.bb
similarity index 91%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.11.bb
index 4418db8..4415c4b 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.8.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.11.bb
@@ -13,15 +13,14 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${BP}.tar.gz \
            file://update-config.patch \
            file://dont-swallow-errors.patch \
            file://discard-use-of-dnl-in-Makefile.am.patch \
-           file://use-ldflags.patch \
            file://configure.patch \
            file://pppoe-server.default \
            file://pppoe-server.init \
            file://configure.in-Error-fix.patch \
            file://pppoe-server.service"
 
-SRC_URI[md5sum] = "0e32760f498f9cde44081ee6aafc823b"
-SRC_URI[sha256sum] = "d916e9cfe1e62395f63a5361936fa855f6d0f0a37dc7227b394cdb725f553479"
+SRC_URI[md5sum] = "13b5900c56bd602df6cc526e5e520722"
+SRC_URI[sha256sum] = "86a1a4d92fcea74fa6dd45516c5975933fa978b36fafe71f76ea70b4b4747720"
 
 inherit autotools-brokensep update-rc.d systemd
 
@@ -38,7 +37,7 @@ do_install() {
     install -m 0644 ${WORKDIR}/pppoe-server.default ${D}${sysconfdir}/default/pppoe-server
     install -m 0755 ${WORKDIR}/pppoe-server.init ${D}${sysconfdir}/init.d/pppoe-server
     # Install
-    oe_runmake -C ${S} RPM_INSTALL_ROOT=${D} docdir=${docdir} install
+    oe_runmake -C ${S} DESTDIR=${D} docdir=${docdir} install
     chmod 4755 ${D}${sbindir}/pppoe
 }
 
-- 
1.8.4.2


