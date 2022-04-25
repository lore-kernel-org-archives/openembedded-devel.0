Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1204C3E8A8
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.26602.1650871805576951685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JonEHkxF;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871803; i=@fujitsu.com;
	bh=O66kSEckeuGVbf8q1rZzzAbLtV+ohTNhahuUUz7rdY4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JonEHkxFpKW42ysE51J0SPCJJu4xAvngi0U/YHcWbZYTKlGzxxOyC4uXtGDZT3Jr5
	 UHR3JGamwSnrWQ/7jnPWesNHQ6c9LXoNcxKxzjxo60VtrM5Y+LUq5lZF77IDcOwHD8
	 /gI6TpXLKm48ONeW65u6Yt9Z6k4VXkoIsgaIeRFexNWQJI3kLoyKHheNNzXRzN6rlU
	 hLvsKZVpkkAj2SJxWZQF2uzdP+3CGttpv67vXgiuMz5ViLDIOp472IESKoQ2hmBT4A
	 7Xo8EKhyM/9+CKftWpVStLmGRlGskIG2fdULOEC3rc7ldokNTovpWLxNZwmVsMDTkN
	 oW8Nuk9JUlZxg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSfe3b1q
  SwbUeTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPSrNVsBVc5KtrXLWJpYHzL3sXIxSEk8IRR
  4sOv9WxdjJxAzgUmib9bWCASexglprZcYgJJsAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSxgL3HzxWYWEJtFQFXi6qtdYEN5BZwkNh87xAhiSwgoSEx5+B6sl1PAWWJC4xUWiMVOEj
  9m/YCqF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKprqGtkaK6XWKWbqJdaqlueWlyia6iXWF6sl1pcrFdc
  mZuck6KXl1qyiREYxCnFjDd3MLb2/dQ7xCjJwaQkynvPJC1JiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgQvlxdQTrAoNT21Ii0zBxhRMGkJDh4lEd50b6A0b3FBYm5xZjpE6hSjopQ4b6EPUEIAJJ
  FRmgfXBoviS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEedNBpvBk5pXATX8FtJgJaPGn2lS
  QxSWJCCmpBqbkHSu3J8l0Ja2OqV5VdTshU8mroKk3NHvl8r55mg/ubH2vXzvljBjLAd52wblP
  Wzc1f/PT4IjPDVhc4ysQI6wfYr0/cNXd3/8+Xr+6YNMLYYU1kgcUjCt5mRxSKlbL3Qlm5FyX1
  Hfl77/pQVc+GnQvkMtuzHvpsTHeuCE/w2vhdIEfAgKBhzetPHfE7EpwrsmX6Z++eixY+XLVae
  PVETEXvcUl+TfFmy7J6/bbJea8eZPWJf95DSW3t006M8HczvNTitCzpTw/uyqOGC1oX7j2e0V
  t6NJ+hz8pqy+86fi9UHwqg1nHJO61L/++/CEz21R6vmL8gTML1h0ti5+Vtq6/7qNK4aM710VU
  bdevsV2rxFKckWioxVxUnAgAH9up710DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1650871802!131031!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9709 invoked from network); 25 Apr 2022 07:30:03 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:30:03 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9505E10034F
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7E9C710044D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:30:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:29:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] evince: upgrade 42.1 -> 42.2
Date: Mon, 25 Apr 2022 15:29:33 +0800
Message-ID: <1650871776-31335-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650871776-31335-1-git-send-email-wangmy@fujitsu.com>
References: <1650871776-31335-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96762

Changelog:
==========
comics:
  * Fix use-after-free (#1776)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/evince/{evince_42.1.bb => evince_42.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_42.1.bb => evince_42.2.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.1.bb b/meta-gnome/recipes-gnome/evince/evince_42.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/evince/evince_42.1.bb
rename to meta-gnome/recipes-gnome/evince/evince_42.2.bb
index 2e22f2e703..af6d74c1a0 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.1.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.2.bb
@@ -24,7 +24,7 @@ inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection g
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "b24767bb3d5103b4e35b0e15cf033dbe2488f88700cdd882d22a43adeec2e80a"
+SRC_URI[archive.sha256sum] = "ff7f81f308cf8d4956ed97fb724a7e49448c214beeab998812ef9efbb38df8ae"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.25.1


