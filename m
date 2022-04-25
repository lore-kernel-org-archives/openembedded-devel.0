Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28923C4743F
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.26839.1650871900705342317
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S7dM6R5Y;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871899; i=@fujitsu.com;
	bh=pXxUsE4vVqxvlzZtEdkjtEHrpiYgIS7o9wd5NFYHmak=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=S7dM6R5YPoJPIpmsF+J3vANO7aIfkTbOor/R/COWVcBq0hAOTukCMmRvv6khEJZWv
	 ZE3KP/JQQySHxhuausajgWh1tidVv1VzAmdgUgX6hM0ZtP4/kgUaQ23DrH2SLaar3D
	 ISDgSh42cRkOqTwmEosvU3jl5qvExkuY0TFPMqF3qZ6b2R+ot6HJb8M4RjXMgRCuLD
	 L7kgyTdZMmEXhnOKpl8Dyt5LWgJtgB7RqHnCwp2ZtsHX0Nwvh9BDNs6EJfqtRiXEuI
	 AJUKDAHrrNhCTPzSOJRb9VEaIx4e7LdiiJ0fLF7LkSurRsWYPo9WI3bHbDG3W6tWq+
	 Q20Ea8GKGCxcQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqBvll5Z
  kcHOfnsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH7zxbmgifcFSd+b2FpYNzA1cXIxSEk8IRR
  YvOmtawQzgUmid1rW1kgnD2MEs8/vGbuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897
  CC2sICXxN3dV1lAbBYBVYmOMwcYuxg5OHgFnCSmtNqBhCUEFCSmPHwP1sop4CxxcflDNhBbCK
  hkb8NrsFZeAUGJkzOfsECMl5A4+OIFM0SvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4
  LSfsCRqZVjNZJRZnpGSW5iZk5uoYGBrqGhqa6xua6hmZGeolVuol6qaW65anFJbpAbnmxXmpx
  sV5xZW5yTopeXmrJJkZgGKcUqy7awbh/1U+9Q4ySHExKorz3TNKShPiS8lMqMxKLM+KLSnNSi
  w8xynBwKEnw7vYFygkWpaanVqRl5gBjCiYtwcGjJMKb7g2U5i0uSMwtzkyHSJ1iVJQS533vA5
  QQAElklObBtcHi+BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd50kCk8mXklcNNfAS1mAlr
  8qTYVZHFJIkJKqoHJ23tt4SxuH3vb8Amp32MsK5L27NNyk+9fsyiRW0Lyp4XXpc2zjkoet7ly
  udNw3bmTwQ+mSroe3auddycv0t97sXyP5tNeOauUmwrSu3on6pXwV24r3vb7psDsvgU9L1sf/
  Z97V3KBcjPX0bezVSX2sOWe+LZB1vVPvjGT2stj59rCxR55X7cJPBee9vDowxChhWL3H2///Y
  zP8JeTlN1lzU/XF3vENHBmFkzf1H7u6Hk+g+6y4i4tC5a9upruagKPJqbIKfxWbrJW0nshcn3
  up8Yg0yA5Mc4gPuYmBg5drdadH6qdbnQu8kmsM+T/UFjQVJp9NE3G//xrnZezE3yvzchbOzGH
  q89qSrFrgxJLcUaioRZzUXEiAG4KMkJeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1650871898!70149!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15926 invoked from network); 25 Apr 2022 07:31:38 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:31:38 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4AC771001A4
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 31448100198
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:31:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libdbd-sqlite-perl: upgrade 1.68 -> 1.70
Date: Mon, 25 Apr 2022 15:31:15 +0800
Message-ID: <1650871876-31392-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1650871876-31392-1-git-send-email-wangmy@fujitsu.com>
References: <1650871876-31392-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/96767

Changelog:
==========
    - Fix doc to use the correct attribute with sqlite_ (GH#86, eekboek++)
    - Modify the fix to silence the sqlite_unicode warning not to check
      the attribute twice
    - Fix an encoding issue of naive (GH#83, HaraldJoerg++)
    - Typo (GH#85, grr++)
    - Silenced deprecation warning of sqlite_unicode not to break
      tests of existing applications

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libdbd-sqlite-perl_1.68.bb => libdbd-sqlite-perl_1.70.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.68.bb => libdbd-sqlite-perl_1.70.bb} (94%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.70.bb
similarity index 94%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.70.bb
index c7baeab6be..17ec3298c8 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.68.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.70.bb
@@ -14,7 +14,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[sha256sum] = "0e84e831a50d547d2e634b66650455f1791f223495c9138db82d42360c691e61"
+SRC_URI[sha256sum] = "40fd8ddf539e0e773a7a4e6d376794c3301459f9ab0050978bdcf97113dafe3e"
 
 UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


