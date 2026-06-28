Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077D8C43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:44 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69115.1782634302529156143
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gztT7051;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-30b9e755555so3464154eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634302; x=1783239102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ls3RMAyCQzFLgwKuc+T1cPbFfATbsu+99jWyheO3G8=;
        b=gztT7051OEW1O1dNh4uE8cwfpKwkQ3Vv3L9gAF1iZcJHyQqbBlNDBt6CPKz8UVz2z8
         71SXFouOcuk2Gx8TOpHv0Cfaimoiwv9bZhOdoXWvMuSYmLVqRRBk0Q3ARxHuTZ1x5igA
         6cbEZMzt30Zej9fJ/cxXQRTAFPzhQfhTGF5jroi7zmL/hpD2iyhkuLIMo2OhlPeoKBDG
         pp/Jveh53ExAt3/EmOOv2V60GTxm43ZJFHxf005BsAMmXnXdD2hp5kPNnYBq5C9OdIUz
         s3WGwwTQHlX/b/UFM7np7vYxWyivbBlRfYce1N/gdxOhuncULi06fDJDA9TMRUOQNZLU
         1M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634302; x=1783239102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Ls3RMAyCQzFLgwKuc+T1cPbFfATbsu+99jWyheO3G8=;
        b=Hd9ZxJOwTncOMUduMNey1SZyoxpdhNWC9095l+P/TXq2xihGTOBjuv+FeI8pJC+tH+
         WU3rj1nkIuZpS6lzwc3ye1/xZbHeARv4MwHkj9nVwslp6iCPhC3fb0IAxMLzu1OA/Nko
         AmjRYKgQvVKLPoUr6icbRa8qgXzlGfej9mQ/iacNAEdu12jZ/yqGr+ZVl1FA+iBNf71J
         2zO7A/3GOCZiX1Y1w1Vo+mZAJ4Al6+tIIsSZkSxSJqpYBFAjAgt2ANW4RGJNmUCCDU4V
         Iacx6k+xpobQAWlDifHT97qOlRbGfvOXG9kpqARWySJdli/kcx6Ztgx/QB/ICBN930GP
         UPdw==
X-Gm-Message-State: AOJu0Yzc6pieWViybWPhnFI+8CNcwfjA6Q8VvABJW4j/jAa20xBJAweB
	G3jpUr2q2iCktGETlmrYlrCeH7jS1XdY2nsh15KDmUK3ZkAh929TotGQKCoZFmSfiJrJyQ==
X-Gm-Gg: AfdE7cmSdctBGtL/usXud1Qko0568KJGmYy6mgcVvRK5w12KmQnaosy5W0I9LfiXQCf
	NiUytLu+/qNTv1xXeKp/sxASfOG9bfFtebs5PG23tj3+lC0FskKI/EHHrixH0jQkmYdQKGYPKaf
	y1XP6lZZja5Q4Oj02eDFEBpSPAt+xNqVtSD3XJC+WVMaVIuyTjeekvDf5BGQCwmPEjGY0reR4cJ
	fJodTMRDIbfM1qGe7m2jNvahrhuIHpg1Yd9ikrElWOXZ8DA1v12BojMf3PoN1LYtBJ9rq1c+7ZB
	kE/K+52GvJg0vHlhmrh99iRIcbg3ZQNokhPbUeZ+bSgZspr1oCluRTndim+dpsDmPY5pMuMj4yq
	xu5wLNMQ/clDhKwVqSqptQs2mCGu+UybH1bmYvQxPxH3hT7EJfjYFJjohX/mdWCHzIr+BMcwcWh
	MPAIWAprN27f8vP1OMTOIeUutD3HmQcFsOSR6LPJPHRIFBjNfLgCMO6a7j/mAI4nhZ+Mu63Ad1e
	kwuWzPu2jYWowdxbeB6tK/vJsd7Th2hLSkkD3L8wlSyh3OHfjJxZsgQHOp/sq39F6jfIpiCUMkS
	JQYKZ/QXpW1Ji9vrZl7WS0xAgvpZww==
X-Received: by 2002:a05:7300:fb86:b0:30c:ab4f:46bf with SMTP id 5a478bee46e88-30cab4f48a2mr5682206eec.37.1782634301729;
        Sun, 28 Jun 2026 01:11:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 018/128] rp-pppoe: upgrade 3.15 -> 4.0
Date: Sun, 28 Jun 2026 01:09:29 -0700
Message-ID: <20260628081122.178348-18-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127828

License-Update: license header switched from "LIC: GPL" to SPDX GPL-2.0-or-later; license text unchanged

Adapt the patches to the 4.0 source restructure: refresh
configure_in_cross.patch for the new configure, and drop
0001-ppoe-Dont-include-linux-if_ether.h and
0002-Enable-support-for-the-kernel-module which are obsolete/upstreamed
in 4.0.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...1-ppoe-Dont-include-linux-if_ether.h.patch |  30 -----
 ...Enable-support-for-the-kernel-module.patch |  25 ----
 .../rp-pppoe/configure_in_cross.patch         | 120 +++---------------
 .../rp-pppoe/rp-pppoe/update-config.patch     |  41 ------
 .../{rp-pppoe_3.15.bb => rp-pppoe_4.0.bb}     |   7 +-
 5 files changed, 23 insertions(+), 200 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
 delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
 delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/update-config.patch
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe_3.15.bb => rp-pppoe_4.0.bb} (89%)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
deleted file mode 100644
index 572886a26c..0000000000
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0001-ppoe-Dont-include-linux-if_ether.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From fdb64d21560bfdafeefccc7d20e105e4857faa99 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Mar 2017 19:20:07 -0700
-Subject: [PATCH] ppoe: Dont include linux/if_ether.h
-
-Fixes build with musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
-Upstream-Status: Pending
-
- src/pppoe.h | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/src/pppoe.h b/src/pppoe.h
-index ec067a0..281879c 100644
---- a/src/pppoe.h
-+++ b/src/pppoe.h
-@@ -127,10 +127,6 @@ typedef unsigned long UINT32_t;
- #error Could not find a 32-bit integer type
- #endif
- 
--#ifdef HAVE_LINUX_IF_ETHER_H
--#include <linux/if_ether.h>
--#endif
--
- #include <netinet/in.h>
- 
- #ifdef HAVE_NETINET_IF_ETHER_H
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
deleted file mode 100644
index cd9e40d5eb..0000000000
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/0002-Enable-support-for-the-kernel-module.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 31b6eecd7e5ebfb9a37915f28823e5af9d1062b4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Mar 2017 19:24:53 -0700
-Subject: [PATCH] Enable support for the kernel module
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
-Upstream-Status: Pending
-
- src/configure.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/configure.in b/src/configure.in
-index cae0976..951a042 100644
---- a/src/configure.in
-+++ b/src/configure.in
-@@ -33,6 +33,7 @@ AC_CHECK_HEADERS(linux/if_pppox.h, [], [],
- #include<net/ethernet.h>
- #include<linux/if.h>
- #include<linux/in.h>
-+#include<linux/in6.h>
- ])
- 
- dnl Checks for typedefs, structures, and compiler characteristics.
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
index 6e859a354c..3e119b5b6e 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
@@ -4,72 +4,38 @@ Date: Wed, 19 Aug 2015 12:17:03 +0900
 Subject: [PATCH] configure in cross
 
 Update the configure script to cross-compiling with OE.  This hard-codes
-a few target paths, reworks a few tests to be more friendly for cross
-and drops other tests.
+a few target paths and drops the host program lookups (ip, pppd, setsid,
+id) which are inappropriate when cross-compiling.
 
 Upstream-Status: Inappropriate [build system specific changes]
+
+Refreshed for rp-pppoe 4.0 (configure.in -> configure.ac).
 ---
- src/configure.in | 62 ++++++++++--------------------------------------
- 1 file changed, 12 insertions(+), 50 deletions(-)
+ src/configure.ac | 17 ++++++-----------
+ 1 file changed, 6 insertions(+), 11 deletions(-)
 
-diff --git a/src/configure.in b/src/configure.in
+diff --git a/src/configure.ac b/src/configure.ac
 index 4add50c..9dff457 100644
---- a/src/configure.in
-+++ b/src/configure.in
-@@ -5,6 +5,13 @@ AC_INIT(pppoe.c)
+--- a/src/configure.ac
++++ b/src/configure.ac
+@@ -4,6 +4,13 @@ AC_CONFIG_SRCDIR([pppoe.c])
+
  dnl pppd directory for kernel-mode PPPoE
  PPPD_DIR=ppp-2.4.1.pppoe2
- 
++
 +dnl hard code some paths
 +PPPD=/usr/sbin/pppd
 +ID=/usr/bin/id
 +ECHO=/bin/echo
 +AC_ARG_VAR(PPPD)
 +AC_ARG_VAR(ID)
-+
- AC_CONFIG_HEADER(config.h)
- 
- AC_PREFIX_DEFAULT(/usr)
-@@ -45,7 +52,7 @@ ac_cv_struct_sockaddr_ll=no)
- AC_MSG_RESULT($ac_cv_struct_sockaddr_ll)
- 
- if test "$ac_cv_struct_sockaddr_ll" = yes ; then
--AC_DEFINE(HAVE_STRUCT_SOCKADDR_LL)
-+AC_DEFINE([HAVE_STRUCT_SOCKADDR_LL], [], [Have struct SOCKADDR_LL])
- fi
- 
- dnl Check for N_HDLC line discipline
-@@ -58,7 +65,7 @@ AC_TRY_COMPILE([
- 	ac_cv_n_hdlc=no)
- AC_MSG_RESULT($ac_cv_n_hdlc)
- if test "$ac_cv_n_hdlc" = yes ; then
--AC_DEFINE(HAVE_N_HDLC)
-+AC_DEFINE([HAVE_N_HDLC], [], [Have N_HDLC])
- fi
- 
- AC_ARG_ENABLE(plugin, [  --enable-plugin=pppd_src_path   build pppd plugin], ac_cv_pluginpath=$enableval, ac_cv_pluginpath=no)
-@@ -106,7 +113,7 @@ PPPD_INCDIR=""
- if test "$ac_cv_header_linux_if_pppox_h" = yes ; then
- 	if test "$ac_cv_pluginpath" != no ; then
- 		LINUX_KERNELMODE_PLUGIN=rp-pppoe.so
--		AC_DEFINE(HAVE_LINUX_KERNEL_PPPOE)
-+		AC_DEFINE([HAVE_LINUX_KERNEL_PPPOE], [], [Have kernel PPPoE])
- 		PPPD_INCDIR=$ac_cv_pluginpath
- 	fi
- fi
-@@ -116,7 +123,7 @@ if test "$PPPD_INCDIR" = "" ; then
- fi
- 
- if test "$ac_cv_debugging" = "yes" ; then
--   AC_DEFINE(DEBUGGING_ENABLED)
-+   AC_DEFINE([DEBUGGING_ENABLED], [], [Debugging enabled])
- fi
- 
- AC_SUBST(LINUX_KERNELMODE_PLUGIN)
-@@ -142,17 +149,8 @@ AC_CHECK_SIZEOF(unsigned short)
- AC_CHECK_SIZEOF(unsigned int)
- AC_CHECK_SIZEOF(unsigned long)
- 
+
+ AC_CONFIG_HEADERS([config.h])
+
+@@ -111,17 +118,8 @@ AC_FUNC_MEMCMP
+ AC_CHECK_FUNCS(select socket strerror strtol strlcpy)
+ AC_PROG_INSTALL
+
 -dnl Check for location of ip
 -AC_PATH_PROG(IP, ip, NOTFOUND, $PATH:/bin:/sbin:/usr/bin:/usr/sbin)
 -
@@ -82,52 +48,8 @@ index 4add50c..9dff457 100644
  dnl Check for an "id" which accepts "-u" option -- hack for Solaris.
 -AC_PATH_PROG(ID, id, "", /usr/xpg4/bin:$PATH)
 +dnl AC_PATH_PROG(ID, id, "", /usr/xpg4/bin:$PATH)
- 
+
  dnl Check for Linux-specific kernel support for PPPoE
  AC_MSG_CHECKING(for Linux 2.4.X kernel-mode PPPoE support)
-@@ -195,42 +193,6 @@ if test "$GCC" = yes; then
- 	CFLAGS="$CFLAGS -fno-strict-aliasing -Wall -Wstrict-prototypes"
- fi
- 
--dnl If we couldn't find pppd, die
--if test "$PPPD" = "NOTFOUND"; then
--        AC_MSG_WARN([*** Oops!  I couldn't find pppd, the PPP daemon anywhere.])
--	AC_MSG_WARN([*** You must install pppd, version 2.3.10 or later.])
--	AC_MSG_WARN([*** I will keep going, but it may not work.])
--	PPPD=pppd
--fi
--
--dnl Figure out pppd version.  2.3.7 to 2.3.9 -- issue warning.  Less than
--dnl 2.3.7 -- stop
--
--PPPD_VERSION=`$PPPD --version 2>&1 | awk ' /version/ {print $NF}'`
--
--case "$PPPD_VERSION" in
--1.*|2.0.*|2.1.*|2.2.*|2.3.0|2.3.1|2.3.2|2.3.3|2.3.4|2.3.5|2.3.6)
--	AC_MSG_WARN([*** Oops! Your version of pppd is $PPPD_VERSION, which is too old.])
--	AC_MSG_WARN([*** You need at least 2.3.7 (2.3.10 or newer recommended.])
--	AC_MSG_WARN([*** I will keep going, but it may not work.])
--	;;
--
--2.3.7|2.3.8|2.3.9)
--	AC_MSG_WARN([*** Warning.  Your version of pppd is $PPPD_VERSION.  You will])
--	AC_MSG_WARN([*** not be able to use connect-on-demand.  Upgrade to pppd])
--	AC_MSG_WARN([*** 2.3.10 or newer if you need connect-on-demand.])
--	;;
--
--2*|3*|4*|5*|6*|7*|8*|9*)
--	;;
--
--*)
--	AC_MSG_WARN([*** Oops.  I cannot figure out what version of pppd you have.])
--	AC_MSG_WARN([*** All I got back was '$PPPD_VERSION'])
--	AC_MSG_WARN([*** I will keep going, but it may not work.])
--	;;
--esac
--
- # Sigh... got to fix this up for tcl
- test "x$prefix" = xNONE && prefix=$ac_default_prefix
- # Let make expand exec_prefix.
--- 
+--
 2.34.1
-
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/update-config.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/update-config.patch
deleted file mode 100644
index c759e09aa0..0000000000
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/update-config.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4d34e0d7d790ec41b0afb731c7dc1b1ee90dd377 Mon Sep 17 00:00:00 2001
-From: Tom Rini <tom_rini@mentor.com>
-Date: Wed, 27 Jul 2011 03:46:52 +0000
-Subject: [PATCH] rp-pppoe: Port from oe.dev
-
-Set the timeout to 0 since we don't want pppoe to try reconnecting,
-we want whatever is calling it to reconnect. Lots of odd things
-happen when you have pppoe retrying itself.
-
-The path for the plugin is wrong, it's now part of ppp and is in a
-ppp's plugin lib directory. If no path is specified then that's where
-ppp looks, so that's what we do here.
-
-Upstream-Status: Inappropriate [configuration]
-
----
- configs/pppoe.conf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configs/pppoe.conf b/configs/pppoe.conf
-index c222b2f..65618a5 100644
---- a/configs/pppoe.conf
-+++ b/configs/pppoe.conf
-@@ -66,7 +66,7 @@ DEFAULTROUTE=yes
- # to connect forever after pppoe-start is called.  Otherwise, it will
- # give out after CONNECT_TIMEOUT seconds and will not attempt to
- # connect again, making it impossible to reach.
--CONNECT_TIMEOUT=30
-+CONNECT_TIMEOUT=0
- 
- # How often in seconds pppoe-start polls to check if link is up
- CONNECT_POLL=2
-@@ -115,7 +115,7 @@ PPPOE_TIMEOUT=80
- FIREWALL=NONE
- 
- # Linux kernel-mode plugin for pppd.  If you want to try the kernel-mode
--# plugin, use LINUX_PLUGIN=/etc/ppp/plugins/rp-pppoe.so
-+# plugin, use LINUX_PLUGIN=rp-pppoe.so
- LINUX_PLUGIN=
- 
- # Any extra arguments to pass to pppoe.  Normally, use a blank string
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_4.0.bb
similarity index 89%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_4.0.bb
index 42e9c4260f..97c68e307a 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_4.0.bb
@@ -2,23 +2,20 @@ SUMMARY = "A user-mode PPPoE client and server suite for Linux"
 HOMEPAGE = "http://www.roaringpenguin.com/products/pppoe"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=aaa8b7bfb03da19eee6187365c352a80"
 
 
 SRC_URI = "https://downloads.uls.co.za/rp-pppoe/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
-           file://update-config.patch \
            file://discard-use-of-dnl-in-Makefile.am.patch \
            file://configure.patch \
            file://pppoe-server.default \
            file://pppoe-server.init \
            file://pppoe-server.service \
-           file://0001-ppoe-Dont-include-linux-if_ether.h.patch \
-           file://0002-Enable-support-for-the-kernel-module.patch \
            "
 
-SRC_URI[sha256sum] = "b1f318bc7e4e5b0fd8a8e23e8803f5e6e43165245a5a10a7162a92a6cf17829a"
+SRC_URI[sha256sum] = "41ac34e5db4482f7a558780d3b897bdbb21fae3fef4645d2852c3c0c19d81cea"
 
 inherit autotools-brokensep update-rc.d systemd
 

