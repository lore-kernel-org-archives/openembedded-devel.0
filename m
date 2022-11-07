Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E90AC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:28:50 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.1210.1667809724694099373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jKsKh2i3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809723; i=@fujitsu.com;
	bh=XdcERSkJyRG8q7COtbiJ0KiN+m+gLVkeoD6R9ErSBBA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=jKsKh2i3ftXKGy3arsvDMGAPBgVri6rTA1XssO8lgfaae9xtfYDeHptjb5hnTDGV8
	 6lirO1nTcpg974/UARuVEYd80K+T8QXJnRIfNSlL9ranzQDN3YKho8Lj6NUbgWV0vr
	 Q50qAwOHYuGdC0YMntPklTOdyQNOJUe17Yy6HEoAa/rRG/wUlfgdUGJDMmdL+aJC4N
	 ZyQJkYmwhuHzirV/czIbakRgDh0T7IA2LS78u9nJClAyNr6OA4JKnnUgQtq8WEglR3
	 f49Z9/bk8xXibmX1UdCaFZqCgPWAun8CYX0/nIq9yyLhjOrzaCsP5BDYrc1ySNc+c6
	 EHmr3OejdzLUg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqLvrYEa
  yQe8dRYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWuqmMBb28FRsfKDYw3uPuYuTiEBJ4wihx
  ct8RVgjnOpPEj1V9TBDObkaJax2X2LsYOTnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48bsHr
  EZYwEviz4ZGVhCbBSi+YM8NsDivgJPEnK6jYLaEgILElIfvwXo5BZwleo4uAbOFgGou3G5hga
  gXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2BkWsV
  oWpxaVJZapGuhl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qy
  iREYuinF6lt3MB5e9kfvEKMkB5OSKO/v5RnJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4b2wEy
  gkWpaanVqRl5gDjCCYtwcGjJMIbtg8ozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd5ru4
  GKBECKMkrz4EbAYvoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFe5j1AU3gy80rgNr0COoI
  J6IjqgjSQI0oSEVJSDUzluytyomWuyf6zYf2yu0jb8fqKG/Oc1k+fW6Sxl43RZNrCH4Eah2Wz
  75xp/nB8U6ho9KOCb61ftzHtVaiL+1RlxBNQ6RsXVpNpk//U/+6zpqcJfrtuq4uUqV68/XPfk
  f03/0y/IMC5LiA+/vzJrQq+slufWh85s5V1ycw3Pk331mQUakRd5xf48mDxn9ncm0/zr1GZVl
  X+MT5sxcKzc+O+/P6gXc/v7anDfVft2PuYNc/nM09ewhYqO7vlA+uGyH/rXIptr7Gs5JZczes
  X3nnwwEOfvp71kaldl9ddeptzWKVp+9ZTdoarftcbPrksoO6Qx5/0ziDR/d6qz76X0u70vtB8
  OuNgf5a17LGVNx9HKrEUZyQaajEXFScCAL6ulDFkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1667809722!1051!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31782 invoked from network); 7 Nov 2022 08:28:42 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:28:42 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 454CB100194
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:28:42 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 39B63100182
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:28:42 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:28:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libdbd-sqlite-perl: upgrade 1.70 -> 1.72
Date: Mon, 7 Nov 2022 16:28:21 +0800
Message-ID: <1667809704-30790-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809704-30790-1-git-send-email-wangmy@fujitsu.com>
References: <1667809704-30790-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99443

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Upgraded SQLite to 3.39.4
- Set UTF8CACHE to avoid slowdown with -DDEBUGGING (andk, Leont, FGasper)
- Fix another test failure on perl built with -DDEBUGGING
- Lowercase datatype in table column metadata for backcompat
- Fix test failure on perl built with -DDEBUGGING (andk++)
- Expose sqlite_error_offset introduced in 3.38.0
- Improve sqlite_load_extension doc (GH#94, Derek Lamb++)
- Add a feature to unregister a created function
- Fix accented characters in POD (GH#90, HaraldJoerg++)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libdbd-sqlite-perl_1.70.bb => libdbd-sqlite-perl_1.72.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libdb/{libdbd-sqlite-perl_1.70.bb => libdbd-sqlite-perl_1.72.bb} (94%)

diff --git a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.70.bb b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.72.bb
similarity index 94%
rename from meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.70.bb
rename to meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.72.bb
index 17ec3298c..975034a07 100644
--- a/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.70.bb
+++ b/meta-perl/recipes-perl/libdb/libdbd-sqlite-perl_1.72.bb
@@ -14,7 +14,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/I/IS/ISHIGAKI/DBD-SQLite-${PV}.tar.gz \
            file://sqlite-perl-test.pl \
 "
 
-SRC_URI[sha256sum] = "40fd8ddf539e0e773a7a4e6d376794c3301459f9ab0050978bdcf97113dafe3e"
+SRC_URI[sha256sum] = "5ca41e61eb52b52bd862a3088b912a75fe70910ac789b9a9983e0a449e94f551"
 
 UPSTREAM_CHECK_REGEX = "DBD\-SQLite\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


