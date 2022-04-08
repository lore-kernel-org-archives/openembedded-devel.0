Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07804C54EC5
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.26503.1649663183201555206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 00:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SuJjXxRi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649663181; i=@fujitsu.com;
	bh=rlHLODSVZBBqR3p2HZCP6+F2tkdffa9DBVxr6AebkVY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SuJjXxRihGJjyS8uM1yunkq/2KCCQZ8+/Kjjsr0tu+QHK4PMHJtnW+tFgII7EkdtN
	 sjRUB4ZPIT7Y6BmlfhXUgLYuGa1fXR2mcO6wEw1RW/ibct7vOKDCs3MKEo96FmnMTs
	 fsYSSx4cYsedcCDE1Xsjcz0sxw5JcoDGo6aeA9H+GHyP4lIRs6MZ/NgnBeG7sxh9yo
	 UQJhyohuxyEzMq2x8gXbfZvH6yxMF5KZPxj1/kZb87BykwxfB10nyxke9ti6o9Xry6
	 gdVGLT1WpueEOe6qBOaCo09uvJWeUrikCxf97/u+OLe6N/OObZv487Yi+Z1zpopzaQ
	 bRd8c8BNl6gOQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqHvmTnC
  Swd93GhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bKZ18ZC/6wVyz4O4GpgXE+excjF4eQwBNG
  icOfTzNCOBeYJPZ1zmGDcPYwSrRM/8PaxcjJwSagJjH91g0wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sIClxLot09hAbBag+JKmtywgNq+Ak8TDHbOYQGwJAQWJKQ/fg/VyCjhLnHi1D8wWAqp59u
  8EE0S9oMTJmU9YIOZLSBx88YIZoldRYvblZhYIu0Ji1qw2qJlqElfPbWKewCg4C0n7LCTtCxi
  ZVjHaJRVlpmeU5CZm5ugaGhjoGhqa6ppZ6BqaGOslVukm6qWW6ian5pUUJQKl9RLLi/VSi4v1
  iitzk3NS9PJSSzYxAsM5pdilfwfj/b6feocYJTmYlER5118KThLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwRt+AygnWJSanlqRlpkDjC2YtAQHj5IIL8dtoDRvcUFibnFmOkTqFKOilDivNUhCAC
  SRUZoH1waL50uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlv3AKawpOZVwI3/RXQYiagxaH
  bAkEWlyQipKQamGaJqQkwLs46cbTripiWdmiPr4709CbLT+eYthjktZwWr+USkqme47lvxsOi
  nbmHGFwezn4SeSxzbtplOafTJyys115mU897Eta+e9XDVA795uV1Ve1luw5mvN2RanxMKqFcP
  d+iSJVvapzLldXbfkYedhFdyeT97JzZqbYVCpGtws8PHuq1qvN9Im1w85LAFqcFHyU07ysWql
  f2hn64qJ1578DuvJcpBgKKJ5UDOW0m/RVx+1mnf7qw51fPYtO4bcyZVy0KMyNfl7vs2jvdK2/
  P7V4Znz1Pvof/3dQ2haGaNdjO//r89KMzb8xrNFXYLbdaRCZiTcqyQGWXAyu4r5Z+Sbbn7p59
  8r5c2cFSJZbijERDLeai4kQAVxQtsmIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-528.messagelabs.com!1649663180!162266!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16658 invoked from network); 11 Apr 2022 07:46:20 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Apr 2022 07:46:20 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 0799E100236
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:46:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B7DA01001B7
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Apr 2022 08:46:19 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 11 Apr 2022 08:46:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] feh: upgrade 3.6.1 -> 3.8
Date: Fri, 8 Apr 2022 22:42:44 +0800
Message-ID: <1649428965-30248-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649428965-30248-1-git-send-email-wangmy@fujitsu.com>
References: <1649428965-30248-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96548

Changelog from 3.6.1 to 3.8 is included in https://feh.finalrewind.org/archive/

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.6.1.bb => feh_3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.6.1.bb => feh_3.8.bb} (89%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.6.1.bb b/meta-oe/recipes-graphics/feh/feh_3.8.bb
similarity index 89%
rename from meta-oe/recipes-graphics/feh/feh_3.6.1.bb
rename to meta-oe/recipes-graphics/feh/feh_3.8.bb
index 88c6337613..12951e28c5 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.6.1.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.8.bb
@@ -10,7 +10,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "9b1edec52cbae97b17530cb5db10666abfb9983f51a5d820c89added6f7b1ea8"
+SRC_URI[sha256sum] = "7f3c34552b39336d7ebee2d7c4bf5697aaaa2c6c102c357f6e82ea240bd62ba9"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.25.1


