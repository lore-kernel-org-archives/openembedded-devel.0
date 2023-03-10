Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD0FC6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:13:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.13448.1678428830043869254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RP3ge2lE;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428828; i=@fujitsu.com;
	bh=sTEjbjkpyoYFkneBoBMt0VwQhJfaVv+gAWNc3qncY2Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RP3ge2lEf85HzQWUjABy2/KXXrEvdgw7gmpjTohlIYYFwJrkW2p8f3GzUboz3XZAV
	 8ot5pvHxCC7ZgpwlLil4yV5nHm5r3JZTB11MTc9u3XNoUpNGW7PD9WNQOomC/NK/eJ
	 VJJL8NdJj+k9dRPe5xCBZCkMkksmqKZ9qUWNuCtvrZZOFYsN5nns4p85tPi5/9e7Zj
	 eBfZuy8Ua/Csyk69ce5TAuif+LA/ImICGduS6cPq9/TBFRZm9k9zSmSV0tjJY82hAH
	 LRg24flkCJzC42UsIhW0uHLOFvfbUbVcnlEzNP5BXhWQSWGqB4Ew9t+fH1yZcJmtZG
	 B7yQUPX3X2hlA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8MxSXf2Ka4
  UgxmHlS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozu9z2sBUucKia2TmduYLxq2cXIxSEk8IRR
  4tbRbmYI5zqTxK2uaYwQzh5GiZ1fVwNlODnYBKQkbtz/zwZiiwjoSyydvQcsziygIvHidw87i
  C0s4CPxZXM3WJxFQFVif+N1sHpeAUeJd0t2sYLYEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqFCVmX25mgbArJBqnH2KCsNUkrp7bxDyBkX8WkvZZSNoXMDKtYjQrTi0qSy3SNTTSSyrKTM8
  oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMx5RileQdjN/6/uod
  YpTkYFIS5VVO5UoR4kvKT6nMSCzOiC8qzUktPsQow8GhJMG79wRQTrAoNT21Ii0zBxgbMGkJD
  h4lEV7WHUBp3uKCxNzizHSI1ClGY46Pfy7uZea4euXKXmYhlrz8vFQpcV7W40ClAiClGaV5cI
  NgMXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvBMg9PJl5JXD7XgGdwgR0yq4tHCCnlCQ
  ipKQamBb+eHRltWhd2ebYHY4N6/U7jTR9drYxiS9KZhDq316coyw/ue2t2g3Fb5VXjrgZsu0R
  V5r7Yf6bk1G/dv9W3Prq3pP4GTsKXm5ZVXVe7Bn3Da7Wk0tkPijc/7WjR2zu6zrWmI7WI6rMm
  25xlu64MTPKyPf02WUPL51X/iMmX1mkH6asKdT0qqotZ+/uY7nnrx/50BZhlGtpzqqc6mb85f
  8Z2Q3816Lt1t+aoKDbN/Nvp0NgdMehmVNU/V85Hz2r3OC6x7y4QWvd6053zQ+pvB53J6f/fhv
  gu8FwO1vPwtf7ZM5KqYj0/ud262iY8csmuKeksD4kcmpas+6PrT8D3C9/3PDif8Zt78aUjAmM
  RkosxRmJhlrMRcWJACBW7OhUAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-571.messagelabs.com!1678428827!324852!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14484 invoked from network); 10 Mar 2023 06:13:47 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:13:47 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 441D81000FE
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:47 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 36AAD1000FB
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:13:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 01/11] rp-pppoe: upgrade 3.14 -> 3.15
Date: Fri, 10 Mar 2023 14:13:28 +0800
Message-ID: <1678428812-7622-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:13:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101473

From: Wang Mingyu <wangmy@fujitsu.com>

dont-swallow-errors.patch
configure.in-Error-fix.patch
removed since they're not available in 3.14.

configure_in_cross.patch
refreshed for 3.14.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rp-pppoe/configure.in-Error-fix.patch     | 57 -------------------
 .../rp-pppoe/configure_in_cross.patch         | 48 +++++-----------
 .../rp-pppoe/dont-swallow-errors.patch        | 26 ---------
 .../{rp-pppoe_3.13.bb => rp-pppoe_3.15.bb}    |  7 +--
 4 files changed, 16 insertions(+), 122 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
 delete mode 100644 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
 rename meta-networking/recipes-protocols/rp-pppoe/{rp-pppoe_3.13.bb => rp-pppoe_3.15.bb} (92%)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
deleted file mode 100644
index 9e60b98fd..000000000
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure.in-Error-fix.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From bdd20b7a584a20504dfabb409a41ee2b9ae41657 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Wed, 19 Aug 2015 13:52:57 +0900
-Subject: [PATCH] configure.in: Error fix.
-
-the error is: conftest.c:9:28: fatal error: ac_nonexistent.h:
-No such file or directory #include <ac_nonexistent.h>
-
-Upstream-Status: Pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
-
----
- src/configure.in | 30 ------------------------------
- 1 file changed, 30 deletions(-)
-
-diff --git a/src/configure.in b/src/configure.in
-index 1714e69..cae0976 100644
---- a/src/configure.in
-+++ b/src/configure.in
-@@ -195,36 +195,6 @@ if test "$GCC" = yes; then
- 	CFLAGS="$CFLAGS -fno-strict-aliasing -Wall -Wstrict-prototypes"
- fi
- 
--dnl Figure out packing order of structures
--AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
--if test "${rpppoe_cv_pack_bitfields+set}" != set ; then
--AC_TRY_RUN([
--union foo {
--    struct bar {
--	unsigned int ver:4;
--	unsigned int type:4;
--    } bb;
--    unsigned char baz;
--};
--
--int
--main(void)
--{
--    union foo x;
--    x.bb.ver = 1;
--    x.bb.type = 2;
--    if (x.baz == 0x21) {
--	return 1;
--    } else if (x.baz == 0x12) {
--	return 0;
--    } else {
--	return 2;
--    }
--}], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
--$ECHO "no defaults for cross-compiling"; exit 1)
--fi
--])
--
- if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
- 	AC_MSG_RESULT(reversed)
- 	AC_DEFINE([PACK_BITFIELDS_REVERSED], [], [Reversed bitfields])
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
index 3b945934f..6e859a354 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/configure_in_cross.patch
@@ -8,13 +8,12 @@ a few target paths, reworks a few tests to be more friendly for cross
 and drops other tests.
 
 Upstream-Status: Inappropriate [build system specific changes]
-
 ---
- src/configure.in | 66 ++++++++++++++------------------------------------------
- 1 file changed, 16 insertions(+), 50 deletions(-)
+ src/configure.in | 62 ++++++++++--------------------------------------
+ 1 file changed, 12 insertions(+), 50 deletions(-)
 
 diff --git a/src/configure.in b/src/configure.in
-index 90a07df..1d30243 100644
+index 4add50c..9dff457 100644
 --- a/src/configure.in
 +++ b/src/configure.in
 @@ -5,6 +5,13 @@ AC_INIT(pppoe.c)
@@ -67,13 +66,15 @@ index 90a07df..1d30243 100644
  fi
  
  AC_SUBST(LINUX_KERNELMODE_PLUGIN)
-@@ -142,15 +149,8 @@ AC_CHECK_SIZEOF(unsigned short)
+@@ -142,17 +149,8 @@ AC_CHECK_SIZEOF(unsigned short)
  AC_CHECK_SIZEOF(unsigned int)
  AC_CHECK_SIZEOF(unsigned long)
  
+-dnl Check for location of ip
+-AC_PATH_PROG(IP, ip, NOTFOUND, $PATH:/bin:/sbin:/usr/bin:/usr/sbin)
+-
 -dnl Check for location of pppd
 -AC_PATH_PROG(PPPD, pppd, NOTFOUND, $PATH:/sbin:/usr/sbin:/usr/local/sbin)
--AC_PATH_PROG(ECHO, echo, echo)
 -
 -dnl Check for setsid (probably Linux-specific)
 -AC_PATH_PROG(SETSID, setsid, "", $PATH:/sbin:/usr/sbin:/usr/local/sbin)
@@ -84,7 +85,7 @@ index 90a07df..1d30243 100644
  
  dnl Check for Linux-specific kernel support for PPPoE
  AC_MSG_CHECKING(for Linux 2.4.X kernel-mode PPPoE support)
-@@ -195,44 +195,8 @@ if test "$GCC" = yes; then
+@@ -195,42 +193,6 @@ if test "$GCC" = yes; then
  	CFLAGS="$CFLAGS -fno-strict-aliasing -Wall -Wstrict-prototypes"
  fi
  
@@ -124,30 +125,9 @@ index 90a07df..1d30243 100644
 -	;;
 -esac
 -
- dnl Figure out packing order of structures
--AC_MSG_CHECKING([packing order of bit fields])
-+AC_CACHE_CHECK([packing order of bit fields],rpppoe_cv_pack_bitfields,[
- if test "${rpppoe_cv_pack_bitfields+set}" != set ; then
- AC_TRY_RUN([
- union foo {
-@@ -259,10 +223,11 @@ main(void)
- }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
- $ECHO "no defaults for cross-compiling"; exit 0)
- fi
-+])
- 
- if test "$rpppoe_cv_pack_bitfields" = "rev" ; then
- 	AC_MSG_RESULT(reversed)
--	AC_DEFINE(PACK_BITFIELDS_REVERSED)
-+	AC_DEFINE([PACK_BITFIELDS_REVERSED], [], [Reversed bitfields])
- else
- 	AC_MSG_RESULT(normal)
- fi
-@@ -326,6 +291,7 @@ AC_SUBST(PPPOE_SERVER_DEPS)
- AC_SUBST(RDYNAMIC)
- AC_SUBST(LIBEVENT)
- AC_SUBST(ECHO)
-+AC_SUBST(HAVE_STRUCT_SOCKADDR_LL)
- AC_SUBST(LDFLAGS)
- 
- datadir_evaluated=`eval echo $datadir`
+ # Sigh... got to fix this up for tcl
+ test "x$prefix" = xNONE && prefix=$ac_default_prefix
+ # Let make expand exec_prefix.
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
deleted file mode 100644
index 8a857888b..000000000
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe/dont-swallow-errors.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a9a7322273c51882af58c35ba288a0fae00ba841 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Wed, 19 Aug 2015 12:33:41 +0900
-Subject: [PATCH] don't swallow errors
-
-Further fixup to the configure scripts to not swallow errors
-
-Upstream-Status: Pending
-
----
- src/configure.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/configure.in b/src/configure.in
-index 1d30243..1714e69 100644
---- a/src/configure.in
-+++ b/src/configure.in
-@@ -221,7 +221,7 @@ main(void)
- 	return 2;
-     }
- }], rpppoe_cv_pack_bitfields=normal, rpppoe_cv_pack_bitfields=rev,
--$ECHO "no defaults for cross-compiling"; exit 0)
-+$ECHO "no defaults for cross-compiling"; exit 1)
- fi
- ])
- 
diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
similarity index 92%
rename from meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
rename to meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
index 846abca03..4e5def297 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.13.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
@@ -4,25 +4,22 @@ SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
            file://update-config.patch \
-           file://dont-swallow-errors.patch \
            file://discard-use-of-dnl-in-Makefile.am.patch \
            file://configure.patch \
            file://pppoe-server.default \
            file://pppoe-server.init \
-           file://configure.in-Error-fix.patch \
            file://pppoe-server.service \
            file://0001-ppoe-Dont-include-linux-if_ether.h.patch \
            file://0002-Enable-support-for-the-kernel-module.patch \
            "
 
-SRC_URI[md5sum] = "ec9dccd9a367a1f71f2dc81069796dd8"
-SRC_URI[sha256sum] = "8cd6bc71ba46bd5f6eb4daf60220ccdcd991a8525111dee466501b1b9717e676"
+SRC_URI[sha256sum] = "b1f318bc7e4e5b0fd8a8e23e8803f5e6e43165245a5a10a7162a92a6cf17829a"
 
 inherit autotools-brokensep update-rc.d systemd
 
-- 
2.34.1


