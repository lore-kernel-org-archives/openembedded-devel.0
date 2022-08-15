Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB29C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:12:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.13523.1660543946635700827
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VZpyWCtN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660543945; i=@fujitsu.com;
	bh=is4KZAnc5M6i9YroSOej4aZJF8vqOYC8D7BxxOMYSWA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VZpyWCtNrD7+Qh+u0y1uWOoq/vBgFQKL24wm7NV5X3loX1zHX2AIIn+qoNdeRE9Q3
	 nwUIUGeigFlSQ7q7jMe2sDeMVJkKClBZr1UnczsBbRAclPK67Qwsvmabda2Kucr9S2
	 zhiJ3GJpn5NAuPQvrC9OHCx5mg9xlRpmDFcl1RiHoKLNgQnBjevHbrOlILFW47Dtz2
	 BDiMklcgJ1f7i8K3lK4Ik01VimbQSw4ATd6uICG7dSQL4l6FZrNibPcDA8pTwM0Jxn
	 ooOgh5cRmRdPRGRDh/ANRh9+WcCRmW1zQ+CszJFT6ntLAdTRYax4ecFzrg0DBkGKCn
	 DxPOdde4tD0Hw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8OxWffE459
  JBs0n+S0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ow/T7ML1nFWbG17xtbAuIOji5GTQ0jgAaPE
  9H1lXYxcQPZlJomWDdeZIZw9jBLN/fPYQarYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48bsHr
  EZYwFNi74OnYDUsAqoS/af+sYHYvAKOEreOTGYCsSUEFCSmPHwP1ssp4CRx8d5OVogrHCV+bD
  vLCFEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xha6hiYFeYpVuol5qqW55anGJrpFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgEKcUq/XsYDyx6qfeIUZJDiYlUd5rF38mCfEl5adUZiQWZ8QXleakFh9il
  OHgUJLgNQPGhZBgUWp6akVaZg4womDSEhw8SiK8C24DpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJ
  KXn5cqJQ4xQwCkKKM0D24ELLovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmdX8ENIUnM68
  EbtMroCOYgI7Qu/sd5IiSRISUVAPT/ikeJ96qnjCsD1RU1T1lLaJpFjXR7RHXz33lvt+fl4ZY
  H1JSndD3dfN6PetnM1tuMwZcuMntpLauZrLTMpXe4/06T9N+JooZaQcV+P0uuMzW7aGZlfCYh
  eNDcXn3TMvg9ZJLFC9NSTGa2PFZ/KzluikvKyyLVDc6vF5XuKlom43/3H/99c3fw3ZvfXvJ7u
  6pRXs2TZvmuo+BfX68eOLtxHsz3ZsiZqa+CzRr2JU6Jf1fR9+9hzkau7qP/9IXmf39zaTP057
  +k9XtjI/ffvzXg9rTj5da9t+/19BYxLSLZd53ts0vnhR/5Pb5zzlJYKmOaobRj+lG06YI/lNz
  Dz7mtlm24XRPvpOq0KxvEjHdSizFGYmGWsxFxYkAtsb532kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-565.messagelabs.com!1660543944!58624!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6671 invoked from network); 15 Aug 2022 06:12:24 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:12:24 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id EE25475
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E19A173
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:23 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:12:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] geocode-glib: upgrade 3.26.3 -> 3.26.4
Date: Mon, 15 Aug 2022 14:12:02 +0800
Message-ID: <1660543925-1319-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660543925-1319-1-git-send-email-wangmy@fujitsu.com>
References: <1660543925-1319-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:12:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98235

Changelog:
=========
This release includes a fix to a test data file not being installed, and a
bug fix for a bug in the libsoup3 port.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{geocode-glib_3.26.3.bb => geocode-glib_3.26.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/geocode-glib/{geocode-glib_3.26.3.bb => geocode-glib_3.26.4.bb} (82%)

diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.3.bb b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
similarity index 82%
rename from meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.3.bb
rename to meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
index 9783dade11..2b1ecad97c 100644
--- a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.3.bb
+++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
@@ -14,6 +14,6 @@ DEPENDS = " \
     libsoup-2.4 \
 "
 
-SRC_URI[archive.sha256sum] = "1dfeae83b90eccca1b6cf7dcf7c5e3b317828cf0b56205c4471ef0f911999766"
+SRC_URI[archive.sha256sum] = "2d9a6826d158470449a173871221596da0f83ebdcff98b90c7049089056a37aa"
 
 EXTRA_OEMESON = "-Denable-installed-tests=false"
-- 
2.25.1


