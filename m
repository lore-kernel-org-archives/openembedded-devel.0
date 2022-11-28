Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D829C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:06:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.111279.1669615597055763743
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Oa3gD2fv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615594; i=@fujitsu.com;
	bh=u/ijyu/wZ8hSI9Lr1CP/M/ZH9GZ8NXoJTbg+hLOZvJ4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Oa3gD2fvbXcRi6Q11f2Ikg02/a+WhB9VWRmWqxobDTphCqJCrA7PD9KsAgUs/HM76
	 7ldXyghad4dpzY9D0k1kZke0dUSFCjusg0qaP58yuQo4pemGL3rnJ70N4LBp/CVk50
	 njhmDRt1rpXdniCAnPBxAYwy2cJfRKrkxaU/vWcz2I3HYpJikeParbZ/8Jx7K9UEnz
	 ZWUDTi5+1rfEKeusoHQfdL0mJ6ceUFt9VSf7kiE6dkwpK4MO9uBQgfWR7BCm0ya1h3
	 9Zgq/OBg5yXxlQuvQRntoHThO7hJPmC+F5SDcQw+8IrLtHkpf6nnDpM37H1N4d9wE9
	 rfG1oUOTtnIlg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpPvSvyX
  Z4M9aaYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPz7mz2gj+cFRvOL2RtYOzm7GLk4hASeMgo
  0XntKxuEc4VJYs/5A1DOHkaJ+y8Ws3QxcnKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAvce37bjCbRUBVYv7nxUD1HBy8Ak4Sc1o0QMISAgoSUx6+B2vlFHCW6NpxHMwWAirZO/
  E5K4jNKyAocXLmExaI8RISB1+8YIboVZSYfbmZBcKukJg1q40JwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itG0OLWoLLVI10QvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzkn
  RS8vtWQTIzB0U4rZfHYw/lv6R+8QoyQHk5Io78JLTclCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HjXe7YkCwkWpaanVqRl5gDjCCYtwcGjJMK72B4ozVtckJhbnJkOkTrFaMxx9cqVvcwcM7+2HW
  AWYsnLz0uVEued6wdUKgBSmlGaBzcIFt+XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzCoJ
  M4cnMK4Hb9wroFCagUzYpNoGcUpKIkJJqYFrSUFp8JEQjSVZsm5920cuZrvpHljxbnOKg+8Dc
  pWNd2gHDhvf7Hu/kusEX4vVceoGg09eTWTMmKDpfD1wY7D/bcSuzfX3jjt6eWH+jCzNVa+9Nt
  JJbFsevundT+LSp8++6pBRY3n+dXZH68+j3h85XIqfcfchvwZ0yd/eGK3ee8a01ZDAqPmT43m
  n6t6ynsjuzOG8YlByW1mNb1tW3/qfmerXX/9bVffVbPtv2inWF9PTkHdO5utVfTdu+2vTfgpC
  DX7qiXKNluj9ffLytPP34If3tp4Q1bjxRSe/TmHLFYcmHhIe+ebI/1t6yfPH95apt3+q/+nvy
  6b53ZHaLVtm2bQqf9v3t83MvX2D6vbVBiaU4I9FQi7moOBEAFQNIomoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1669615593!132035!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28100 invoked from network); 28 Nov 2022 06:06:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:06:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 175A81AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:33 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0C39C1AE
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:33 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:06:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20221106.0 -> 5.9.20221120.0
Date: Mon, 28 Nov 2022 14:05:51 +0800
Message-ID: <1669615552-13033-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615552-13033-1-git-send-email-wangmy@fujitsu.com>
References: <1669615552-13033-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99789

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
build-sys: add clean-tlib and clean-gcov to the dependecy list of clean-local
Fortran: reset "newline" state when processing a new input file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20221106.0.bb => ctags_5.9.20221120.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221106.0.bb => ctags_5.9.20221120.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221106.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221120.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221106.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221120.0.bb
index 6ef767710..269d9141b 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221106.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221120.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "bf0d53505856d4b3e662be22bbe5fcb740451ca1"
+SRCREV = "08fd0c4d931e929e21ae46568c603727e44b897f"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


