Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D779FA0C46
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 07:19:17 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13242.1776237546592720720
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 00:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MykMbvVu;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776237547; x=1807773547;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5bjMwytwyCqbJ/rWSdpX1EZPZtoJrFVDfPgXxDKLKzo=;
  b=MykMbvVuyTeAa4oRw3jKqNODdsJguwN+8bDaLVwT5aRuL4wK1jT8cxbh
   uWeMFLrla27xdS35FWXGFqVgpgBTT5LBD0bHCfJZLmKKLz0MGz/uwrLIJ
   IhC3RT9LCxUw+Ki2dN04y6+il36INbXbhf14OkTzZtqVdxAHKYM3cZnRf
   8joT8P2AIKIPBFO7aTAlmrjLpmz4DuzszMqnUVlnVWG87kEMMWoSDkfBU
   hKTqbTep4hCGc8/09ZXWp+C5suxnX4C5EQfQ2FRBw3j8sUSz+02LPfT5A
   VutWqUwpfzFqlaR/zj8J94MYjzOJS+zNm1/QhPHvZRASPX70JRJV82wzr
   g==;
X-CSE-ConnectionGUID: 8xYgnq0KTWqEBgBQo6Wq0g==
X-CSE-MsgGUID: zE6ZmHGeQbKVLoXotncB2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="236968141"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="236968141"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 16:19:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B1EA82B88
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:04 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5DB471C002C8
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:04 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 24C911800B21
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:01 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] htop: upgrade 3.4.1 -> 3.5.0
Date: Wed, 15 Apr 2026 15:18:54 +0800
Message-ID: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126344

1.ChangeLog
https://github.com/htop-dev/htop/blob/main/ChangeLog

2.Use --with-libunwind instead of --enable-unwind

3.Update 0001-configure.ac-Remove-usr-include-libnl3.patch for 3.5.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...nfigure.ac-Remove-usr-include-libnl3.patch | 49 +++++++++----------
 .../htop/{htop_3.4.1.bb => htop_3.5.0.bb}     |  6 +--
 2 files changed, 25 insertions(+), 30 deletions(-)
 rename meta-oe/recipes-support/htop/{htop_3.4.1.bb => htop_3.5.0.bb} (89%)

diff --git a/meta-oe/recipes-support/htop/files/0001-configure.ac-Remove-usr-include-libnl3.patch b/meta-oe/recipes-support/htop/files/0001-configure.ac-Remove-usr-include-libnl3.patch
index f00f3ac4db..c1f763ce17 100644
--- a/meta-oe/recipes-support/htop/files/0001-configure.ac-Remove-usr-include-libnl3.patch
+++ b/meta-oe/recipes-support/htop/files/0001-configure.ac-Remove-usr-include-libnl3.patch
@@ -1,6 +1,6 @@
-From 87d66b3b60176197e785670214b0bbc5bedd6552 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Mon, 8 Dec 2025 11:06:01 +0000
+From 652b208b8c3038934fb55169f44068bbdf399b69 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Wed, 15 Apr 2026 01:34:56 +0000
 Subject: [PATCH] configure.ac: Remove /usr/include/libnl3
 
 Fixes:
@@ -11,40 +11,35 @@ netlink/attr.h, netlink/handlers.h, netlink/msg.h
 Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+
+Update for 3.5.0.
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
 ---
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 9f2f46b3..f3906692 100644
+index 2d174d73..ee8b29ca 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -980,14 +980,14 @@ case "$enable_delayacct" in
-          enable_delayacct=no
-       else
-          old_CFLAGS="$CFLAGS"
--         CFLAGS="$CFLAGS -I/usr/include/libnl3"
-+         CFLAGS="$CFLAGS"
-          AC_CHECK_HEADERS([netlink/attr.h netlink/handlers.h netlink/msg.h], [enable_delayacct=yes], [enable_delayacct=no])
-          CFLAGS="$old_CFLAGS"
-       fi
-       ;;
-    yes)
-       old_CFLAGS="$CFLAGS"
--      CFLAGS="$CFLAGS -I/usr/include/libnl3"
+@@ -1638,7 +1638,7 @@ case "$enable_delayacct" in
+ 
+       htop_save_CFLAGS=$CFLAGS
+       # New include path searched after what user has specified
+-      CFLAGS="$CFLAGS $LIBNL3_CFLAGS"
 +      CFLAGS="$CFLAGS"
-       AC_CHECK_HEADERS([netlink/attr.h netlink/handlers.h netlink/msg.h], [], [AC_MSG_ERROR([can not find required header files netlink/attr.h, netlink/handlers.h, netlink/msg.h])])
-       CFLAGS="$old_CFLAGS"
-       ;;
-@@ -997,7 +997,7 @@ case "$enable_delayacct" in
+       AC_CHECK_HEADERS(
+          [netlink/attr.h netlink/handlers.h netlink/msg.h],
+          [],
+@@ -1681,7 +1681,7 @@ case "$enable_delayacct" in
  esac
  if test "$enable_delayacct" = yes; then
-   AC_DEFINE([HAVE_DELAYACCT], [1], [Define if delay accounting support should be enabled.])
--  AM_CFLAGS="$AM_CFLAGS -I/usr/include/libnl3"
-+  AM_CFLAGS="$AM_CFLAGS"
+    AC_DEFINE([HAVE_DELAYACCT], [1], [Define if delay accounting support should be enabled.])
+-   AM_CFLAGS="$AM_CFLAGS $LIBNL3_CFLAGS"
++   AM_CFLAGS="$AM_CFLAGS"
  fi
  AM_CONDITIONAL([HAVE_DELAYACCT], [test "$enable_delayacct" = yes])
  
 -- 
-2.47.3
+2.43.0
 
diff --git a/meta-oe/recipes-support/htop/htop_3.4.1.bb b/meta-oe/recipes-support/htop/htop_3.5.0.bb
similarity index 89%
rename from meta-oe/recipes-support/htop/htop_3.4.1.bb
rename to meta-oe/recipes-support/htop/htop_3.5.0.bb
index e3f8a7fdb4..961a87097b 100644
--- a/meta-oe/recipes-support/htop/htop_3.4.1.bb
+++ b/meta-oe/recipes-support/htop/htop_3.5.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "ncurses libnl"
 
-SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https \
+SRC_URI = "git://github.com/htop-dev/htop.git;branch=main;protocol=https;tag=${PV} \
            file://0001-configure.ac-Remove-usr-include-libnl3.patch \
 "
-SRCREV = "348c0a6bf4f33571835a0b6a1a0f5deb15132128"
+SRCREV = "a21f043b253a6dfa89df1ff4130fe7d2e505000f"
 
 
 inherit autotools pkgconfig
@@ -23,7 +23,7 @@ PACKAGECONFIG ??= " \
 "
 PACKAGECONFIG[unicode] = "--enable-unicode,--disable-unicode"
 PACKAGECONFIG[affinity] = "--enable-affinity,--disable-affinity,,,,hwloc"
-PACKAGECONFIG[unwind] = "--enable-unwind,--disable-unwind,libunwind"
+PACKAGECONFIG[unwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[hwloc] = "--enable-hwloc,--disable-hwloc,hwloc,,,affinity"
 PACKAGECONFIG[openvz] = "--enable-openvz,--disable-openvz"
 PACKAGECONFIG[vserver] = "--enable-vserver,--disable-vserver"
-- 
2.43.0


