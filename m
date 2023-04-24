Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2367C6FD18
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:19:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.43073.1682306383747317401
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=H89nYass;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306388; i=@fujitsu.com;
	bh=n3GK+ndLM4xPwTdpOqP0HKArkk4mJ4/WV9jfXcfJvyg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=H89nYassrzHmfbiT+C8PCDRjH5+Ru1LV6mAqip0+zo7yNdbI7SQPDlal7XlyBl/pD
	 C6aBW5MKtzw1E7iRI/apXO4lixpazR5pyu1b3ouG2maQDSDllHsg+2nUZb2J8NfY2k
	 kPaWDWf0KgE9cxuhuHPUVo28CZdxNbh19twbDpPy6a4za2zSWJX3qYGFvoitLHMsFL
	 QlyzzCE8yndMigk4k/2d67ffRBaKTXn72TxjkkqqRb9OZrvX8D2QDlg++1mKlaXegK
	 RuZSHAU1kGAv6I5XaEz0d61iG2WS5LkLKiVqpm6TJzRmSBtP8EwvlX70ICGzNSE7/C
	 2bCi7O4cn6ANw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSTf4q2u
  Kwe7X1hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aaOy3sBS18FV9aDrI3ML7j6WLk4hASeMIo
  0bzuIiOEc4NJ4lHPPxYIZy+jxNK1M4EynBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCwRLzLg9HayeRUBVYvvaZjCbV8BJ4seyN2C2hICCxJSH74F6OTg4BZwl3vZngISFgEquLH
  vFDFEuKHFy5hMWiPESEgdfvGCGaFWUmH25mQXCrpRo/fALylaTuHpuE/MERsFZSNpnIWlfwMi
  0itG0OLWoLLVI11wvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzB0U4qVenYw/tv5V+8QoyQHk5Io75INLilCfEn5KZUZicUZ8UWlOanFhxhlODiUJHiLP
  rmmCAkWpaanVqRl5gDjCCYtwcGjJMK77AtQmre4IDG3ODMdInWKUZfjw6Ere5mFWPLy81KlxH
  kDQYoEQIoySvPgRsBi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV7JD0BTeDLzSuA2vQI
  6ggnoiF3cLiBHlCQipKQamBa1XOIzZZyVWfXuRoJb/XePvUwyZR8vVE/3/Jp0xbnjucfk6g4B
  id9bQ150fUmr4Xu8X6jqw94bz1YWF7sICM6WjXjY906VS35X9pFXXf/ztGpFdjDnd4mnMvP/Z
  6h//Pvqj/d6GeLCb17mH1aUd/e7dVb7eHjsZa97hTq1Ebutjmin+7y0j/r3KKwk5KJpwY6Yki
  nZDz8eypSc90n/1KLyPcb1H+5sfrjWJ1bYUlZ07nauK/8W/TxcxCb7KdNwKvP8P9PEG+fFzZR
  NXNd88PSh7Sf2K0eKvC5L37n98tPLV/9lhSYcSN2aukxptdbSiUIrLaaaia7IS05jeXI8Krgl
  fXZBnYbNebNF6z3kI5RYijMSDbWYi4oTAZLPeK5kAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1682306387!215608!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10554 invoked from network); 24 Apr 2023 03:19:47 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:19:47 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A9D0310032D
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:47 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9D81C10032B
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:19:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:19:46 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] network-manager-applet: upgrade 1.30.0 -> 1.32.0
Date: Mon, 24 Apr 2023 11:19:11 +0800
Message-ID: <1682306351-11741-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306351-11741-1-git-send-email-wangmy@fujitsu.com>
References: <1682306351-11741-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102153

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Allow using MTU larger than 10000 octets.
* Prefer using AppIndicator outside X11.
* Added support for importing WireGuard profiles from wg-quick files.
* Added Interlingue translation.
* Updated Basque, Catalan, Croatian, Danish, Georgian, German, Indonesian,
  Lithuanian, Polish, Portuguese, Moscoviyan, Slovenian, Swedish, Turkish
  and Ukrainian translations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...anager-applet_1.30.0.bb => network-manager-applet_1.32.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.30.0.bb => network-manager-applet_1.32.0.bb} (90%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.30.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
similarity index 90%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.30.0.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
index 8c7564a8e..cc37291c8 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.30.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
@@ -9,7 +9,7 @@ inherit features_check gnomebase gsettings gtk-icon-cache gettext
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI[archive.sha256sum] = "9516b84e9d9f100db89a0c67cbfe57cedb0562310d45caafb6332e27bbeb5cd3"
+SRC_URI[archive.sha256sum] = "a2b5affa1505ad43902959fdbe09e5bcec57b11ed333fa60458ffb9c62efba38"
 
 # We don't not have ubuntu's appindicator (yet?)
 EXTRA_OEMESON = "-Dappindicator=no"
-- 
2.34.1


