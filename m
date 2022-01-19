Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C656C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 01:42:37 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.832.1642556552868590655
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 17:42:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hTvvfPBx;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1642556550; i=@fujitsu.com;
	bh=owWgqLN3+oys2NWKte+9YM9w1VajOuwcywFiEjdnNmw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=hTvvfPBx61rJy1H8YtMP9Ah8BcX84TMNs9kuMU0L8+QKOP6GKGvUTp5RTDBWdLPZ1
	 jG/L+AcAiXmAwSc5S7cbGNo9CgUSmXZDNJPbmwuiGCxKfiT6eU1zRkDP7YZJ78SVTi
	 76Y0KliyB83LFfrZVm75vvUu5Lk1xWvwkdnHNUkUAp3UO9Ag5beYsHor4BJTNlFcCX
	 3Uem8ZZt5Oc3/zeXm0XylAUUL8+nQFYP0NC1Td5f7k0mojefaZmMoOxT5NQBGoY6YI
	 5Owi8Kevki3aA4t+WldlyADo6O/GF4Geph62j3E0cUiyDYqypPgdW9TjDXiKYs/Xgn
	 zAUVGAR8ZgLSw==
Received: from [100.115.1.107] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id 1C/E7-10124-68C67E16;
 Wed, 19 Jan 2022 01:42:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSbct53m
  iwfmT7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8btqS/YC74qVGxY+YWtgfGRVBcjF4eQwBNG
  iden5zBDOBeYJKZN3cAO4ZxglDjy6B9LFyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICjhLrWvsYQWwWAVWJsz1/wWxeASeJHTdPgfVKCChITHn4nhkiLihxcuYTFog5EhIHX7
  xghqhRlJh9uZkFwq6QmDWrjQnCVpO4em4T8wRG/llI2mchaV/AyLSK0SqpKDM9oyQ3MTNH19D
  AQNfQ0FTXUNfIwFgvsUo3US+1VLc8tbhE11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwLFOKGU/v
  YNzU91PvEKMkB5OSKK9o/PNEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8rMBAFxIsSk1PrUjLz
  AHGCExagoNHSYT3aRZQmre4IDG3ODMdInWKUVFKnLczGyghAJLIKM2Da4PF5SVGWSlhXkYGBg
  YhnoLUotzMElT5V4ziHIxKwryvQcbzZOaVwE1/BbSYCWhx/7NnIItLEhFSUg1M7JdMN1z/bpP
  hYXOj4NuNms2LW0J1vx64sP1KRFCzZvHTaac735pY7G2oOyFh/us6e+7hPXcNHlnpvs7iMq2W
  sWWvZXfiUn+/ZpX6CR0PrQ9OIjmTKzd8n26S/fza/6pN0at/2c/YXXnLP17xRmyXZxn7DaalW
  o0/GYOr2AxZ05Iro8946x5d//ZC4OPmihfz/zX/V35WJft1sdGCSRaCuolMjuZuvF++LVE9Ua
  KZsUb5wslWxm1dcvnMrDw35u31TY4/N01D7tRHLlvTnd6dkuv6qp7FXX+y68H81WcW2D9PuJz
  o5PZq4Z0EG+0LSzT+V8vuc8nkKij58UVHeI7unA0vt2vJGuTICi6JdmtUYinOSDTUYi4qTgQA
  LnsK7kYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1642556549!36459!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7511 invoked from network); 19 Jan 2022 01:42:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jan 2022 01:42:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A6BC5100452
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:42:29 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 98FB8100352
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 01:42:29 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 19 Jan 2022 01:42:08 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] mtr: upgrade 0.94 -> 0.95
Date: Wed, 19 Jan 2022 09:41:57 +0800
Message-ID: <1642556519-18240-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 01:42:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94923

0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch
removed since it is included in 0.95.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ror-format-security-errors-in-printw.patch | 68 -------------------
 .../mtr/{mtr_0.94.bb => mtr_0.95.bb}          |  6 +-
 2 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta-networking/recipes-support/mtr/mtr/0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch
 rename meta-networking/recipes-support/mtr/{mtr_0.94.bb => mtr_0.95.bb} (83%)

diff --git a/meta-networking/recipes-support/mtr/mtr/0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch b/meta-networking/recipes-support/mtr/mtr/0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch
deleted file mode 100644
index 5a8ee49d5..000000000
--- a/meta-networking/recipes-support/mtr/mtr/0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 628b4b3a16c5e3416aac3eea041ff03375fb495b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Oct 2021 11:00:59 -0700
-Subject: [PATCH] Fix a lot of -Werror=format-security errors in
- printw/mvprintw
-
-In all these places a non-constant is used as a format string which
-compiler complains about. Fix by using "%s" as format.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ui/curses.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/ui/curses.c b/ui/curses.c
-index 34bf30d..c24cf28 100644
---- a/ui/curses.c
-+++ b/ui/curses.c
-@@ -432,7 +432,7 @@ static void mtr_curses_hosts(
-                 attron(A_BOLD);
- #ifdef HAVE_IPINFO
-             if (is_printii(ctl))
--                printw(fmt_ipinfo(ctl, addr));
-+                printw("%s", fmt_ipinfo(ctl, addr));
- #endif
-             if (name != NULL) {
-                 if (ctl->show_ips)
-@@ -485,7 +485,7 @@ static void mtr_curses_hosts(
-                 printw("\n    ");
- #ifdef HAVE_IPINFO
-                 if (is_printii(ctl))
--                    printw(fmt_ipinfo(ctl, addrs));
-+                    printw("%s", fmt_ipinfo(ctl, addrs));
- #endif
-                 if (name != NULL) {
-                     if (ctl->show_ips)
-@@ -650,7 +650,7 @@ static void mtr_curses_graph(
- 
- #ifdef HAVE_IPINFO
-             if (is_printii(ctl))
--                printw(fmt_ipinfo(ctl, addr));
-+                printw("%s", fmt_ipinfo(ctl, addr));
- #endif
-             name = dns_lookup(ctl, addr);
-             printw("%s", name ? name : strlongip(ctl, addr));
-@@ -700,7 +700,7 @@ void mtr_curses_redraw(
- 
-     mvprintw(1, 0, "%s (%s) -> %s", ctl->LocalHostname, net_localaddr(), ctl->Hostname);
-     t = time(NULL);
--    mvprintw(1, maxx - 25, iso_time(&t));
-+    mvprintw(1, maxx - 25, "%s", iso_time(&t));
-     printw("\n");
- 
-     printw("Keys:  ");
-@@ -760,7 +760,7 @@ void mtr_curses_redraw(
-         startstat = padding - 2;
- 
-         snprintf(msg, sizeof(msg), " Last %3d pings", max_cols);
--        mvprintw(rowstat - 1, startstat, msg);
-+        mvprintw(rowstat - 1, startstat, "%s", msg);
- 
-         attroff(A_BOLD);
-         move(rowstat, 0);
--- 
-2.33.1
-
diff --git a/meta-networking/recipes-support/mtr/mtr_0.94.bb b/meta-networking/recipes-support/mtr/mtr_0.95.bb
similarity index 83%
rename from meta-networking/recipes-support/mtr/mtr_0.94.bb
rename to meta-networking/recipes-support/mtr/mtr_0.95.bb
index 460fd2e8b..b5e2fae50 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.94.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.95.bb
@@ -8,10 +8,8 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://ui/mtr.c;beginline=5;endline=16;md5=00a894a39d53726a27386534d1c4e468"
 
-SRCREV = "2c73cbf4094e4eed343ed11ae5bab2580f3122d1"
-SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https \
-           file://0001-Fix-a-lot-of-Werror-format-security-errors-in-printw.patch \
-          "
+SRCREV = "852e5617fbf331cf292723702161f0ac9afe257c"
+SRC_URI = "git://github.com/traviscross/mtr;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


