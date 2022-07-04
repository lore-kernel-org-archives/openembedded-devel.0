Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFABC43334
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 09:07:59 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.70274.1656925672801604043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GzPVzIlW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656925677; i=@fujitsu.com;
	bh=9WNFpqmACgDnY1qeQixYvQ/gHTqRg7a7cWUClA8pF+Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GzPVzIlWm81Lc90WqHZuLU572hhwhJz7q93sNCYc6WgItE1KvqyUa8pBIzFZcFvG5
	 8mI5KRujOvlFDF+IGk+1yCC8JHs/SzKTa6NnT4Deb8V5R9ndEdMLlX/orKQUUYAwYH
	 CMZqoqbNvIeuLTyGMX+L3Lx6Gr2u1+OEvsnjK9r7v/HPj4AVP8CaWvcaPiJF6vavMO
	 s01TdY+eLwz4/NodF5yvP/MMS0FqPmlub8AcTTZ6vLXEnobeE41JxI59x68d5ZbXk4
	 oF8w5Koo/XZvXKI3ZBFj8aYlFjAT6LpiznABU4Hhr1GUAaIP3oIEGDp6JuooQHoHN9
	 LVNz9Jj4MH4GQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWffN2kN
  JBv9bbSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox7XakF0zgqjk49yNbAuIW9i5GLQ0jgIaPE
  sturmLsYOYGcy0wSnU3WEIndjBITli5nBUmwCahJTL91A8wWEdCXWDp7D1gDs4CKxIvfPewgt
  rCAk8Su/8vAaliA4p2dMxhBbF4BR4l1F76C2RICChJTHr4H6+UEqn/aMJWpi5EDaJmjxPS5ih
  DlghInZz5hgRgvIXHwxQtmiFZFidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7QsYmVY
  xWiQVZaZnlOQmZuboGhoY6Boamuoa6hrpJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To
  5aWWbGIEBm9KMSPTDsZlfT/1DjFKcjApifJOrT2UJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC1
  2k1UE6wKDU9tSItMwcYSTBpCQ4eJRHer4uA0rzFBYm5xZnpEKlTjLocV69c2cssxJKXn5cqJc
  67dg1QkQBIUUZpHtwIWFRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMexqYIoR4MvNK4Da
  9AjqCCeiIG1UHQI4oSURISTUwTRR0vnM18w6fS7rDgrx1LtsWad1QqZqsbrnDjofFOP3lhRvb
  t3BEL21T3FM8RX2G53xWzifXmG99ko46evpFxuVlOXPmi/B2LJfeJRaRdlWaMyCJwX6i5PWiu
  Ph9jCrmpvG8U2p4zXVktnHx1DMYxurcOcNicvyVGndKTJD+Eh+9PW/szHd82f5QxuWmq66j3t
  OXBfuYXqyfISOtHpn5Li3iEvOKYwuaxW9OeisvcTk/+oPZ41siu57cC17L3SVT2bB5lv6sg5m
  F7paL8+0SCmK4shl3/FxrXO7ak/+m5fA+fc1y/dm/Z8YKrVBI0n3//MlE+QWb+eW3shmG5IWJ
  TGr5+UjbgVFVJJLLt0eJpTgj0VCLuag4EQDT2k7BZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1656925676!128800!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6642 invoked from network); 4 Jul 2022 09:07:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Jul 2022 09:07:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 94A27142
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  4 Jul 2022 10:07:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 872007B
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  4 Jul 2022 10:07:56 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 4 Jul 2022 10:07:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] capnproto: upgrade 0.9.1 -> 0.10.2
Date: Mon, 4 Jul 2022 17:07:22 +0800
Message-ID: <1656925643-8143-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656925643-8143-1-git-send-email-wangmy@fujitsu.com>
References: <1656925643-8143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 09:07:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97684

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../capnproto/{capnproto_0.9.1.bb => capnproto_0.10.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_0.9.1.bb => capnproto_0.10.2.bb} (93%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb b/meta-oe/recipes-devtools/capnproto/capnproto_0.10.2.bb
similarity index 93%
rename from meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_0.10.2.bb
index d14bd843e..3d4f549b6 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.9.1.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_0.10.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https \
            "
-SRCREV = "b49431c48d40490ef979247d308af63345376cee"
+SRCREV = "2e88221d3dde22266bfccf40eaee6ff9b40d113d"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.25.1


