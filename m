Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37965C76196
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:17:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.65427.1679548626377346275
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Nj0wpYLx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548624; i=@fujitsu.com;
	bh=seR2juuTU90yLpH5xAuumA7U1UM6Du3HNZChE6B1jsc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Nj0wpYLxtiboLiwUWgyKR+Z4Dk9zCkZFG78gPBCrvpN45m2QL4ifwx0FLV13UzAyg
	 2jmkF37Mcz6lRM7X6x+JGnRKugXz1KWQ/qKoKglqEU/FyQrdltXndI1a1tfQFtbX7F
	 1LkgOcmXhLsu8eK+zVXf8P1y7olifpksPGQAfVlFs1betyZR8HYOPg7Ea6szDixCVm
	 dt2uUxdvrNJfPBqJkhUZj9UpjLnGnt3e080FZMXsnIxJQ7MdV2PWIXo5NkXUcuGh8i
	 ypHVJ2nZku4H83bLW7D/S32KIVDTkCQUOiviNovZkFdmRB+0+TBQUKgOcg7BzI5/sX
	 ULmbZLDjGBDvg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8OxWff8A+k
  Ugx9btS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owt7Q/ZCrZrVhxqOcHewPhLqYuRi0NI4AGj
  xLYNZxghnMtMEl+6d7NAOHsYJX40/WLuYuTkYBOQkrhx/z8biC0ioC+xdPYesDizgIrEi9897
  CC2sIClxJodfWA1LAKqEotXXQOr4RVwklh4eSdYXEJAQWLKw/dgcU4BZ4nfvTfBeoWAah5MP8
  QEUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukGiEqpcQUJO4em4T8wRGwVlI2mchaV/AyLS
  K0bw4tagstUjX0EgvqSgzPaMkNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0Uv
  L7VkEyMwgFOK09x2MP7u+6t3iFGSg0lJlFciVDpFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvw
  B2gnGBRanpqRVpmDjCaYNISHDxKIrxzDwKleYsLEnOLM9MhUqcYjTnWNhzYy8xx9cqVvcxCLH
  n5ealS4rxM94FKBUBKM0rz4AbBovwSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFenXtAU3g
  y80rg9r0COoUJ6JS4GRIgp5QkIqSkGpjOBtyZwlj6hifPWNp/r+bH8JlxS0LYH4qExigtS120
  uH7aScbCZXtn/xCPnbt2zsfN27NMpjAklrZ8uLpOrEh7lbr0xFyXuVd++rEa9Zxmi/VMbC80s
  p1V7hZlXb61MyB605rblQnnDBctORM8ybKy6ce5N4bOn7buXcxfuCluYRhn+lfThztjLi3g9U
  gxfTHpUqO737r3MkLln68vzlnMctk1Z3+ifs/60jec+1t7ZpfaiauK6SytbJ7i9U06S1ZUbva
  2H217DXbzhGx9n9ObdLq89aKK9Xthju9vL7Id737qd0iE9UPBKiWHTc1dJS8XLPzvlVcrek60
  KWrKXse7j2/nHD4891A40xJFjz9KLMUZiYZazEXFiQDFc67ZbQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-745.messagelabs.com!1679548623!570761!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11390 invoked from network); 23 Mar 2023 05:17:03 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:17:03 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 133347C
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:17:03 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 06F7373
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:17:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:17:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xterm: upgrade 378 -> 379
Date: Thu, 23 Mar 2023 13:16:38 +0800
Message-ID: <1679548598-20478-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548598-20478-1-git-send-email-wangmy@fujitsu.com>
References: <1679548598-20478-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101666

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* improve text-cursor (patch by Jan Engelhardt):
     + allow selecting CURSOR_BAR mode from command-line/Xresources.
     + draw  cursor  using  filled  rectangle  instead  of  rectangle
       outline to permit thicker underlines/bars.
     + scale up cursor relative to font size.
* improve readline modes (Fedora #2166860):
     + document readline modes
     + change the feature to configure by default
     + replace hard-coded SS3 for cursor movement with current mode
     + replace hard-coded erase/lnext characters with current values
* improve status-line (report by Thomas Wolff):
     + RIS turns off status-line
     + Right-margin  (DECLRMM  and DECSLRM) limits the length of text
       written/updated in the status-line.
     + Most  controls which affect the whole screen are ignored while
       updating the status-line.
* modify  configure check for tgetent to allow for some special cases
  of ncurses configuration (report by Satadru Pramani).
* reduce  timeout,  improve  warning  message  if  resize is run on a
  terminal which is not VT100-compatible.
* reduce compiler warnings in configure script.

0001-Add-configure-time-check-for-setsid.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-Add-configure-time-check-for-setsid.patch | 26 +++++++++----------
 .../xorg-app/{xterm_378.bb => xterm_379.bb}   |  2 +-
 2 files changed, 13 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_378.bb => xterm_379.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch b/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
index 92ecdac22..a6cf16e4e 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/0001-Add-configure-time-check-for-setsid.patch
@@ -1,4 +1,4 @@
-From 3730a38efad969fb6f8227df07eb4461a078f5a3 Mon Sep 17 00:00:00 2001
+From b23d38f1216c4d70738edaa367cf9ecd2dd4b660 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 13 Dec 2019 12:59:26 -0800
 Subject: [PATCH] Add configure time check for setsid
@@ -7,18 +7,19 @@ Do not assume glibc == linux
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure    | 1 +
  configure.in | 1 +
  main.c       | 4 ++--
  xtermcfg.hin | 1 +
- 5 files changed, 6 insertions(+), 2 deletions(-)
+ 4 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 0aafefc..03e8df0 100755
+index 72342c7..c2ec2ac 100755
 --- a/configure
 +++ b/configure
-@@ -5605,6 +5605,7 @@ for ac_func in \
+@@ -5803,6 +5803,7 @@ for ac_func in \
  	unsetenv \
  	sched_yield \
  	setpgid \
@@ -27,7 +28,7 @@ index 0aafefc..03e8df0 100755
  	tcgetattr \
  	waitpid \
 diff --git a/configure.in b/configure.in
-index d2fee88..74d65df 100644
+index 56dbc25..0608c80 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -99,6 +99,7 @@ AC_CHECK_FUNCS( \
@@ -39,10 +40,10 @@ index d2fee88..74d65df 100644
  	tcgetattr \
  	waitpid \
 diff --git a/main.c b/main.c
-index 5e60589..b81d2be 100644
+index 24da0eb..332174c 100644
 --- a/main.c
 +++ b/main.c
-@@ -2903,7 +2903,7 @@ main(int argc, char *argv[]ENVP_ARG)
+@@ -2956,7 +2956,7 @@ main(int argc, char *argv[]ENVP_ARG)
      }
  }
  
@@ -51,7 +52,7 @@ index 5e60589..b81d2be 100644
  #define USE_OPENPTY 1
  static int opened_tty = -1;
  #endif
-@@ -4074,7 +4074,7 @@ spawnXTerm(XtermWidget xw, unsigned line_speed)
+@@ -4205,7 +4205,7 @@ spawnXTerm(XtermWidget xw, unsigned line_speed)
  	    /*
  	     * now in child process
  	     */
@@ -61,17 +62,14 @@ index 5e60589..b81d2be 100644
  #else
  	    int pgrp = getpid();
 diff --git a/xtermcfg.hin b/xtermcfg.hin
-index 1dbc3b8..4f3ff5b 100644
+index 19048cd..e54d2cd 100644
 --- a/xtermcfg.hin
 +++ b/xtermcfg.hin
-@@ -95,6 +95,7 @@
- #undef HAVE_PUTENV		/* AC_CHECK_FUNCS(putenv) */
+@@ -98,6 +98,7 @@
  #undef HAVE_SCHED_YIELD		/* AC_CHECK_FUNCS(sched_yield) */
+ #undef HAVE_SETITIMER		/* CF_SETITIMER */
  #undef HAVE_SETPGID		/* AC_CHECK_FUNCS(setpgid) */
 +#undef HAVE_SETSID		/* AC_CHECK_FUNCS(setsid) */
  #undef HAVE_STDINT_H		/* AC_PROG_CC_STDC */
  #undef HAVE_STDLIB_H		/* AC_CHECK_HEADERS(stdlib.h) */
  #undef HAVE_STDNORETURN_H	/* CF_C11_NORETURN */
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_378.bb b/meta-oe/recipes-graphics/xorg-app/xterm_379.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_378.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_379.bb
index c82042b21..1c32b5d5b 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_378.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_379.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
           "
 
-SRC_URI[sha256sum] = "649dfbfd5edd0ed9e47cf8e4d953b4b0d3c30bc280166dfc4ffd14973fec3e92"
+SRC_URI[sha256sum] = "a7ddf274ee84b97fb1283675009d53ca2d02a0ffd5ce5a5118dafc3623ebb310"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


