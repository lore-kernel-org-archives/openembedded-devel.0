Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49142C48BE5
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.26669.1650872532278016962
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BZrnjoyN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650872530; i=@fujitsu.com;
	bh=/P1/22cWgRmNDaslbwL74fCDTHvVKng9HZ0PIrUxv1g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BZrnjoyNYtgJ5gMUPQYJVSOjQW3+7ANgpvp/XFdyffx6ZQhDjQUwzhiI3tb3uATy6
	 3sqgw7M0sc2ObSbG7LZM7gTnNqtWSYO2S/Bx4P3d858GrmPYv1OP3/4VGXtqthqRq3
	 JekfVr37yRP3bXOE4E9ZeIU26fn285tofBJAQIs5IfD02L53cHLjUgwWG6CCKTL2a1
	 5hCognAnnaQ+rAKPFxf4u2IC5gwnlp8bUSmRrRggR7lbsUzGSXhH5m67s2SK4G4rES
	 oNXUdziTyZCSCSFoPQUd5noBVMtMJMQcFYfz+2xVj1GHAyIGVyPn68TngYXtQp4bOe
	 P2TuR/eR93lMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSfd8QFq
  SwYk91hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aLTcuZCs6IVPw7f5OlgbFJqIuRk0NI4Amj
  ROc5wS5GLiD7ApPErfN/mCGcPYwScxe+YAOpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jATGLXm/tg9SwCqhLL/81kBLF5BZwkNj5YxwRiSwgoSEx5+J4ZIi4ocXLmExaIORISB1
  +8YIaoUZSYfbmZBcKukJg1qw2qV03i6rlNzBMY+WchaZ+FpH0BI9MqRuukosz0jJLcxMwcXUM
  DA11DQ1NdY1NdQwsTvcQq3US91FLd8tTiEl0jvcTyYr3U4mK94src5JwUvbzUkk2MwLBMKVbe
  sYOxbdVPvUOMkhxMSqK890zSkoT4kvJTKjMSizPii0pzUosPMcpwcChJ8O72BcoJFqWmp1akZ
  eYAYwQmLcHBoyTCm+4NlOYtLkjMLc5Mh0idYtTlWNtwYC+zEEtefl6qlDgvFzDihARAijJK8+
  BGwOL1EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3nf+QFN4MvNK4Da9AjqCCeiIT7WpIEe
  UJCKkpBqYnHp3ZfitDVSYlXH6VvmCyIQJm1e/aNPdfqpAsrNE3N7kStaUYNv6lo6dQU/Wr9nN
  yZwby/7E+6OGf8+SFWsDdj/y6zBKS+m+cvHIV51zdtNLb0yQTZN0NJVum5fo/46d4eLlB7JrV
  tpuCrj3SfH9LrlFXr82dnQKFoU+ete5SeJj/RmLLy82X3NmCe97feMt952lUgu3Hpo3PbpVuV
  tQ4Q7X8qN6P+bkXVIXuSivKyC6v6a1Svj58fMXWjeVyOlEcS9nFJn1X/rf9wWH7t6JOqPhpr3
  J/vfWcnX1fxMzSk689wkx97l5as7Oc/ON9v15qxLEK/pHpVVkwt39v2SFC17tSF9ofvq52eOX
  H1Ss7iqxFGckGmoxFxUnAgArJTQJUgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1650872527!72797!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16521 invoked from network); 25 Apr 2022 07:42:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:42:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 83598100359
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 75EEF1000FC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:42:07 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:41:46 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] links: upgrade to 2.26
Date: Mon, 25 Apr 2022 15:41:24 +0800
Message-ID: <1650872488-31555-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96780

Changelog:
===========
 Fix a display glitch if the list is empty and the user presses '*'
 Add a possibility to pass gopher:// URLs to an external program
 Updated the German translation
 Updated the initial bookmarks
 Fix a bug when form submit url contained '#'
 Support WEBP images
 Support DNS-over-HTTPS
 Try multiple IPv4 addresses on systems that don't have getaddrinfo
 Handle the "TD" tag outside "TR" the same way as in other browsers
 Make it possible to bind a socket to a network interface
 It could be activated by specifying interface name in the "Bind to local
 IP address" box

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../links/{links-x11_2.22.bb => links-x11_2.26.bb}              | 2 +-
 meta-oe/recipes-support/links/{links_2.25.bb => links_2.26.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/links/{links-x11_2.22.bb => links-x11_2.26.bb} (91%)
 rename meta-oe/recipes-support/links/{links_2.25.bb => links_2.26.bb} (79%)

diff --git a/meta-oe/recipes-support/links/links-x11_2.22.bb b/meta-oe/recipes-support/links/links-x11_2.26.bb
similarity index 91%
rename from meta-oe/recipes-support/links/links-x11_2.22.bb
rename to meta-oe/recipes-support/links/links-x11_2.26.bb
index e354bbafd1..4c8d935ccf 100644
--- a/meta-oe/recipes-support/links/links-x11_2.22.bb
+++ b/meta-oe/recipes-support/links/links-x11_2.26.bb
@@ -10,7 +10,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI += " file://links2.desktop \
              http://www.xora.org.uk/oe/links2.png;name=icon"
 
-SRC_URI[sha256sum] = "0364986b3a7f1e8e3171bea362b53f71e1dd3360a8842d66fdc65580ebc2084d"
+SRC_URI[sha256sum] = "f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb"
 SRC_URI[icon.sha256sum] = "eddcd8b8c8698aa621d1a453943892d77b72ed492e0d14e0dbac5c6a57e52f47"
 
 S = "${WORKDIR}/links-${PV}"
diff --git a/meta-oe/recipes-support/links/links_2.25.bb b/meta-oe/recipes-support/links/links_2.26.bb
similarity index 79%
rename from meta-oe/recipes-support/links/links_2.25.bb
rename to meta-oe/recipes-support/links/links_2.26.bb
index 1986358b21..3c1ee4f2bc 100644
--- a/meta-oe/recipes-support/links/links_2.25.bb
+++ b/meta-oe/recipes-support/links/links_2.26.bb
@@ -8,4 +8,4 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-libtiff --without-svgalib --with-fb \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
-SRC_URI[sha256sum] = "2dd78508698e8279ef4f09a3a2a21e9595040113402da6c553974414fb49dd2c"
+SRC_URI[sha256sum] = "f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb"
-- 
2.25.1


