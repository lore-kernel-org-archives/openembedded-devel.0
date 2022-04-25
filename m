Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F13DC38A06
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.26525.1650871901099133074
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 00:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XYRQQZxU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650871899; i=@fujitsu.com;
	bh=TGvGSDXW6v7M2RnpLBKKl9G3kuWtYA158Yc0625DIGs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XYRQQZxUP3nluAFsFWf0fTNdVXqedcUCTTTj7XWdTGaqN4lRNir5OSPGADT+rhW0n
	 aTChFA6aqp91Ur9JMTVK6akfTNgSl90Ox1CJXVa0nV9VHsU5+9cCybRKsCMNMwf7pg
	 JfSUpRKl1zrwDXSKl7g6hQwuCRjFyCzYmt6UEkzmmFn9MaXo9sy5G7YToj6h/JZWRt
	 +cV3yQHuCev0kpUpQAf2NoHMoHEZoyy+Yi44BdxWBz3+foGONEQ0JyRft0zyc78ZJ/
	 fh34ENyGqKixFsBugA2E0VsEqNlouGDMERcKwTmBoYUVJBnv2xHJuw/PTSsTqDbPor
	 /f29nl+Gpbwdw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqBvtl5Z
  ksGE1q8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFi5S/mgq18Fef717I0MLbwdjFycggJPGGU
  +LqJBcK+wCQxcx0XhL2HUWLa/nwQm01ATWL6rRusILaIgL7E0tl7mEFsZgEViRe/e9i7GDk4h
  AXcJM79VQYxWQRUJc7skwOp4BVwkui6+YQNxJYQUJCY8vA9WCengLPExeUP2SA2OUnsbXjNAl
  EvKHFy5hMWiOkSEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8DItIr
  RKqkoMz2jJDcxM0fX0MBA19DQVNdM18jQQC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB4U4rZLu1gnNv3U+8QoyQHk5Io7z2TtCQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  ry7fYFygkWp6akVaZk5wEiCSUtw8CiJ8KZ7A6V5iwsSc4sz0yFSpxgVpcR5H4L0CYAkMkrz4N
  pg0XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjBvug/QFJ7MvBK46a+AFjMBLf5UmwqyuCQ
  RISXVwLT1QPS9hW0mVdMC9pmeURMMectQ3r3OZvX7F9WdmUc0fA+ZXSr2OdVcfslyulbcbtNz
  6Q3uT9rWSl2qzpK9vDQ0Y6mpAPfRM8luLz0XxB21vC61uk7SdMqva99UqjfJlW66fLPwidvOO
  ye/GbbEF0yefebP7J3FO3emp17acyT28An7MJ8rWrIbbKJM/m3+1fh41j4uR8+la/hW7SiR/n
  e98qPDr0wNJ63qI3N3rJ3r/WLqjOm3ruXtM9f8u1g9bKtx1c2f7qkRzVLKB9+/3ZZz772jm/w
  c+zg+9tvZfvcZRNcws0ieKJx29LHsjDbRHxc+znT+HZ3BeDFJ+t8p8VnT9xnnN18IyorYxlAZ
  L75RiaU4I9FQi7moOBEAVWgaOVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-587.messagelabs.com!1650871898!131251!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30612 invoked from network); 25 Apr 2022 07:31:39 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Apr 2022 07:31:39 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5FFAC10018F
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 3543E10019B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:31:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 25 Apr 2022 08:31:31 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libencode-perl: upgrade 3.16 -> 3.17
Date: Mon, 25 Apr 2022 15:31:16 +0800
Message-ID: <1650871876-31392-5-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96769

Changelog:
==========
! bin/enc2xs t/enc_data.t t/enc_module.t t/encoding.t t/jperl.t
  Pulled: Fix Issue #144, spurious warnings from -Wc++-compate,
   and a few related nits
  https://github.com/dankogai/p5-encode/pull/168
! MANIFEST
  add t/utf32warnings.t which was missing
! t/taint.t
  Pulled: Skip taint tests if your perl was built without taint support
  https://github.com/dankogai/p5-encode/pull/167
! Unicode/Unicode.pm
  Pulled: fix link to Unicode standard
  https://github.com/dankogai/p5-encode/pull/165
! t/Unicode_trailing_nul.t
  Pulled: Use note() instead of diag()
  https://github.com/dankogai/p5-encode/pull/164

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libencode-perl_3.16.bb => libencode-perl_3.17.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libencode/{libencode-perl_3.16.bb => libencode-perl_3.17.bb} (97%)

diff --git a/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb b/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
similarity index 97%
rename from meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
rename to meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
index 8d239e7e2e..8b4f292a35 100644
--- a/meta-perl/recipes-perl/libencode/libencode-perl_3.16.bb
+++ b/meta-perl/recipes-perl/libencode/libencode-perl_3.17.bb
@@ -15,7 +15,7 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://META.json;beginline=8;endline=10;md5=b12e3be1e17a7e99ca4f429ff32c28b5"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/D/DA/DANKOGAI/Encode-${PV}.tar.gz"
-SRC_URI[sha256sum] = "e5e91d98a97de70dccecc2a25d049a0b5f5f12228c618680020d73043355294c"
+SRC_URI[sha256sum] = "b44cbf7dd60ec6128ec575dd348484975086522611bc7580cfd305a095faa6d2"
 
 UPSTREAM_CHECK_REGEX = "Encode\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.25.1


