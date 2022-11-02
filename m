Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F402C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 06:51:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.3268.1667371907703424720
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 23:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LHzejixW;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667371906; i=@fujitsu.com;
	bh=4CimXSU6R+mkffyBGzkmu4RZzUGeiMi9v7PE8+nWpEM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=LHzejixWO2Lk4/SZBqZvKzT/oyhFVra7BRDo1+TBcpZh0WGQciz4QoJDck5xaZqy8
	 T+oiUL8fKtjcxnyX9TnuDNRxTzdM9/jx5788l1mtD/U5+NF35W9mneMKsZUCR9XGI9
	 s1jkgeEZjkPu1FkmomMwU542nz19TSIxUgkbt/capwGI9U3ceEM0R1ybci78ISSCcd
	 WGhsAaVeAykiervJBwheOJrn7QXB9Ynk9xApITqg4XAkgvMrz4irr2VG0me7btgxVJ
	 ggIfxDLFkJAogs4z9Hiz3fiamCFS+wOmmUa/5sNv2IztNICfRqpyQSY3ITavAHRp7G
	 KKMiqbwfAf7yA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqNsonJR
  sMHOvpMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvF8mknBfI6K1S9fszcwHmHvYuTiEBJ4wiix
  ZddLti5GTiDnOpNE/ys+iMRuRonTM9+zgyTYBKQkbtz/D1YkIqAvsXT2HmYQm1lAReLF7x6wG
  mEBB4nmm/1gNgtQfOft+awgNq+Ak8Sfn3PBeiUEFCSmPHwP1ssp4CxxfFMTM8RiJ4lNb9vYIO
  oFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxiZVjG
  aFacWlaUW6Rqa6SUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWW
  bGIEhm5KseLWHYw3lv3RO8QoycGkJMqbzJ6ULMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC9xMfU
  E6wKDU9tSItMwcYRzBpCQ4eJRFeTRagNG9xQWJucWY6ROoUoy7H2oYDe5mFWPLy81KlxHmnCQ
  EVCYAUZZTmwY2AxfQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8XvxAU3gy80rgNr0COoI
  J6Ai29jiQI0oSEVJSDUwrVfKeZ7ntL9FcKavD/ukCn7FCwvdfVy4XcXklrtc1e7TjtOP1ucJ+
  SSLPnFMX6jJaXvy046iZGlfBJdsvQiwfPn03SEqeV/hmXmT0POau4P/zZsmIvPr6Ycrq6Zy6Y
  QJsbXzJfk8O1iSIz+nVOcB5P4vL6ZxwqvzbOFn5RJd3VRwy9Rvvtb5QdFy6xEmKa3HpxXfcBf
  aSInrXyt9Guz1tedOwK5FFw6U5KfxJvl6Vfe0+2dbbnW8Uf0tejhE6znhDdLNu+eXNzq/zl/5
  6y79Cv37Wpfnm8/r2nDiz6q331BVFfyIfpQtdjFz9it/w8rcEz86Ykwor2szcOzyyP6+Uevim
  Rmdfltb0XVE765RYijMSDbWYi4oTAWWMws1kAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1667371905!55420!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4841 invoked from network); 2 Nov 2022 06:51:45 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Nov 2022 06:51:45 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 24F55100192
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Nov 2022 06:51:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1908510018D
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Nov 2022 06:51:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 2 Nov 2022 06:51:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xkbprint: upgrade 1.0.5 -> 1.0.6
Date: Wed, 2 Nov 2022 14:51:24 +0800
Message-ID: <1667371885-20154-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667371885-20154-1-git-send-email-wangmy@fujitsu.com>
References: <1667371885-20154-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 06:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99408

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xkbprint_1.0.5.bb => xkbprint_1.0.6.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbprint_1.0.5.bb => xkbprint_1.0.6.bb} (71%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.6.bb
similarity index 71%
rename from meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.5.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.6.bb
index 7b6ef96825..e866bed016 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.5.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.6.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "9c34da77363dc3d0f616980da87244bf"
-SRC_URI[sha256sum] = "5b58fe834f0822f06d63d283fac404098c6d3f6acce61888b81016f1c41023fa"
+SRC_URI[sha256sum] = "99cc9404f7b90289ae04944c0d98a208cc8b158492ad6481386e31d4d09aa7b0"
+SRC_URI_EXT = "xz"
-- 
2.25.1


