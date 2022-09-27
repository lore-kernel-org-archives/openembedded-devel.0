Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6B8C6FA86
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:20:22 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.8577.1664266813102137286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LR1GO4eL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266811; i=@fujitsu.com;
	bh=goSjT9IEXGUXu/q/UKuIM+0zW7AjvvTkzvwRfK4iudY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LR1GO4eLZJoKfenPAvvcfvnCVTeMxoWzzIZd9sjnyUFtFoZzA5L7Ba5s6QvHkdUat
	 eGfU1PFmXqfQHtJA/mWzsNzTInXlYf9huPDC9ipoWEWE2QKGloxyWKLDdhFUfah5DU
	 9kKHemBvMeVxUGoHWY2p5xatY5eTV11Lu6wGcwG84bEvoT2cKifVR4J5AukaVgTld9
	 Y9i6YS90bK4duBNZRSW/fqvr2EcieRvLKTJtuH+4xgL3/48IxIrDd6fnK4nIZK6pMW
	 15ZW/lUeGgJLmmG9uos6fXMahChL1S1+/yT4Igfjr1TPSzzlXn505DxYQWjtNoyMuq
	 xHVdoAgpgvr6g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8ORqGu1ySj
  ZYPIhI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePGn2/MBYu5K45cecXewDiBq4uRi0NI4Amj
  xJ0NP1kgnOtMEldmbGaCcPYwSkw7dwMow8nBJqAmMf3WDVYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICXxPXuHWA2i4CqRMvLf2xdjBwcvAKOEpu78kDCEgIKElMevmcGCXMKOEmcXB4GYgoBVf
  Qu0Qep4BUQlDg58wkLxHAJiYMvXjBDdCpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVonVSUmZ5RkpuYmaNraGCga2hoqmtppmtoppdYpZuol1qqm5dfVJKha6iXWF6sl1pc
  rFdcmZuck6KXl1qyiREYwinFCQI7GPfu+6V3iFGSg0lJlNd+kVGyEF9SfkplRmJxRnxRaU5q8
  SFGGQ4OJQlepvVAOcGi1PTUirTMHGA8waQlOHiURHjXLQFK8xYXJOYWZ6ZDpE4x6nJ8OHRlL7
  MQS15+XqqUOO/MjUBFAiBFGaV5cCNgsX2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDv0rV
  AU3gy80rgNr0COoIJ6Ag7Pn2QI0oSEVJSDUzS9WvzVJ7MvzVjQXRKp+z7OcJrxI6f8f/sXFKY
  Kl03ea3aEb3Gvj6zVx9Dpt9SvqDOLpxjrG23mz9297T6hQyl/04cP9rmWJR2/h1v9e2/JlLlq
  72qFxiKnNixZfdOC/OD6dNX1fdMjNefcYVpdk9U5e2ZM3awqZw7uGSTt92zcuGu2q2l1vNCzU
  4dyY/XLErXNRE3ZOw4YFt2QrjkRdb0v1Uf/AOzl4VWRrdFfA3P3CKkP/1xjknayXrJMM5ZP7n
  lb96Y/LF0q0TH37eBHkyvmtYEpdgoMcp8vHr9on1A5e3gS6X5vysa885rPO6ufCrdmji5dJq+
  9JkXW7QEPs1+8VJMP+ZucQJX3UWhFiWW4oxEQy3mouJEAOujiWJoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-728.messagelabs.com!1664266810!245950!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12748 invoked from network); 27 Sep 2022 08:20:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-6.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:20:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3E75C100191
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:10 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 32628100199
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:20:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:20:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-font-viewer: upgrade 42.0 -> 43.0
Date: Tue, 27 Sep 2022 16:19:49 +0800
Message-ID: <1664266791-2194-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664266791-2194-1-git-send-email-wangmy@fujitsu.com>
References: <1664266791-2194-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98961

Changelog:
===========
Fonts 43.beta comes with a new "About" button in the main window and the
following translation updates:
 - Abkhazian
 - Dutch
 - Friulian
 - Georgian
 - Hebrew
 - Icelandic
 - Italian
 - Latvian
 - Nepali
 - Occitan (post 1500)
 - Turkish

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-font-viewer_42.0.bb => gnome-font-viewer_43.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_42.0.bb => gnome-font-viewer_43.0.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_42.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb
index c14e57c7c0..50fd034af5 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_43.0.bb
@@ -16,7 +16,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "cfa2b8dfff21a105a1a021dadfa213f13627e6a179a77c7b59fdcedaca848dcc"
+SRC_URI[archive.sha256sum] = "81c6bffb06d5332346e00eaecaec1bdcfd617c51dfd95bcd058d6c76c76dd2b9"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.25.1


