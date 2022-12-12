Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C63C4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:35:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.37605.1670830513386536612
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:35:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TwdQy1tp;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830511; i=@fujitsu.com;
	bh=k4pAMGEG6rvY5AzG6L6s6MegDtzUCiipyHge0BjyuB8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TwdQy1tpCJVjP2SQNgsyezbgKfSTfSfaPWFmZLd3Xmspry/CQZpUawuALx8MaVSUr
	 nXaNgsBjHxBUGsKjsisgLmyD5mPf3Zf70czFtBsrIol7fym7MOz0TxFCEG/IFTukHp
	 BX76Qldbiw0WMF3VLB6AaCK6LGOY1ZX6WokF4O+pUn/nTDphFYv5tcwGFvC98awvlK
	 ggRRpJGAhaHmvhznBGMuRXkkt+fc1ZtbScijnSarum+cHCq9g1V380KrAN1HoXB7pJ
	 RQdvPTd1idug6UMMpAYG6VpMDsFRn0553xDkJtI+1hAHGWimuaXW4VusQrVLtij1zn
	 wA82JGzAom8Nw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8MxSXf9zWn
  JBqs3CFpcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBnLZh5iKtgpVtF1ooe1gXGbSBcjF4eQwBNG
  iSU969m7GDmBnOtMEmeXV0Ek9jBKtDbPZAVJsAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1izsICdRNOBDrA4i4CqxN0398F6eQUcJf60t7CA2BICChJTHr4Hq+EUcJLY0r0SarGjxJ1rG1
  kg6gUlTs58wgIxX0Li4IsXzBC9ihKzLzdDzamQmDWrjQnCVpO4em4T8wRGwVlI2mchaV/AyLS
  K0aw4tagstUjX0EAvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzB4U4pZ4ncwPlz2R+8QoyQHk5Iob+WVaclCfEn5KZUZicUZ8UWlOanFhxhlODiUJHg3X
  APKCRalpqdWpGXmACMJJi3BwaMkwusG0spbXJCYW5yZDpE6xWjMMfNr2wFmjk37ug4wC7Hk5e
  elSonzst8AKhUAKc0ozYMbBIvwS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeW2uA03hycw
  rgdv3CugUJqBTol5OBTmlJBEhJdXAtEhyXkBb51YrubnutguYm6oqWcKnft6zUNc9+t+9E9O0
  z8VdWP5wH1vww/1VYadW77v79d+8G3vmKn23vupU2f26jmnJng9i8y+/8eQ4kJUarux9UbQjI
  ObC5rBJt2qOOs5hmfz0e6B3mOA54167zcydL6YfOhn5pmXF8jfGkc+Vze8qfPJKun5EdJZ3cT
  rHaq73m49lcx4+NiusIuKWuBr38TOi+6bsNONMU9mdpboldaYH6+b033dyH3ovEeX9EhPVuuv
  kYpXDZ4KlVs29enMCQ5P5pJU2h+x/+c7uV5568cesN/k3GsOu/WV1nHzpa0yYXqvEgfte56f4
  RKfc8tiyYN7V25WdDK9O6m04KcuuxFKckWioxVxUnAgA9qIhtWsDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-585.messagelabs.com!1670830511!316509!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8839 invoked from network); 12 Dec 2022 07:35:11 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:35:11 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D97DD1000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CC93B1000C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:35:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] hwdata: upgrade 0.364 -> 0.365
Date: Mon, 12 Dec 2022 15:34:30 +0800
Message-ID: <1670830471-3000-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830471-3000-1-git-send-email-wangmy@fujitsu.com>
References: <1670830471-3000-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100038

From: Wang Mingyu <wangmy@fujitsu.com>

0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.patch
removed since it's included in 0.365

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-sysroot-prefix-for-pkgdatadir-varia.patch | 30 -------------------
 .../{hwdata_0.364.bb => hwdata_0.365.bb}      |  7 ++---
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.patch
 rename meta-oe/recipes-support/hwdata/{hwdata_0.364.bb => hwdata_0.365.bb} (70%)

diff --git a/meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.patch b/meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.patch
deleted file mode 100644
index d51d8d00a..000000000
--- a/meta-oe/recipes-support/hwdata/hwdata/0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f5311fb8519c6360333934537abeb64198e2c212 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Wed, 9 Nov 2022 18:37:41 +0100
-Subject: [PATCH] hwdata.pc.in: use sysroot prefix for pkgdatadir variable
-
-The pc_sysroot is automatically added to cflags and libs but not
-to 'pkg-config --variable'. This matches what wayland-protocols does.
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Backport [https://github.com/vcrhonek/hwdata/pull/19/commits/d3325fd72bd45ba74e709b4083521104193b224e]
----
- hwdata.pc.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hwdata.pc.in b/hwdata.pc.in
-index 8dd73b6..c5791d3 100644
---- a/hwdata.pc.in
-+++ b/hwdata.pc.in
-@@ -1,6 +1,6 @@
- prefix=@prefix@
- datadir=@datadir@
--pkgdatadir=@pkgdatadir@
-+pkgdatadir=${pc_sysrootdir}@pkgdatadir@
- 
- Name: @NAME@
- Description: Hardware identification and configuration data
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/hwdata/hwdata_0.364.bb b/meta-oe/recipes-support/hwdata/hwdata_0.365.bb
similarity index 70%
rename from meta-oe/recipes-support/hwdata/hwdata_0.364.bb
rename to meta-oe/recipes-support/hwdata/hwdata_0.365.bb
index b61f68f86..d37b73af2 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_0.364.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_0.365.bb
@@ -5,11 +5,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0-or-later | XFree86-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-SRCREV = "3ac83cecf56f299e7390e5afeab2808632719243"
-SRC_URI = " \
-    git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https \
-    file://0001-hwdata.pc.in-use-sysroot-prefix-for-pkgdatadir-varia.patch \
-"
+SRCREV = "803068db92b8bb249014f1c947b91b452f539f5f"
+SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


