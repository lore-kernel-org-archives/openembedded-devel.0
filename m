Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5671BC7EE26
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:10:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.103682.1683540611980499562
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZlSY9Q5l;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540614; i=@fujitsu.com;
	bh=qZsviGxfXNBuy4g2gl7CbgoHcAkra3+slPeN2/Meyxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=ZlSY9Q5liJIPc9c49h0mcc39VFBlloWjOB1U7pYr9YbA+5UlzS3PO6hpty7rWWtvR
	 5Iu4o2KrIgJZFgjnobP1fu3B4zoBXJAWY9DHYCLHZc0xgU6+9fWSfYd+FUa3ZtYPxw
	 uxdtVN7qS17gpYMpVJCGzNclgeK2d+J8yktke8FN5k0kW4G9/UJYR+bnrjuoNyIwOj
	 9YJqioajep4ygFwplnUFdPd/ajwBT2F4Tv5tlpexNS6NMum3uGegPJ+enLOZHwlc6k
	 ji1Bw4FGziKcWgRxkNDuJLjl+5ysyWEtjc8utwOcG9iRXJFEP9BfqqSEUp+eSa3IJP
	 1nKN9L61Jcy8A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrHLMWRWlGSWpSXmKPExsViZ8ORpNt6KiL
  F4PwGbYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePiuWtsBd3cFa9+f2ZsYPzJ2cXIxSEksJFR
  YvHt40wQzjQmiTd7VwE5nBxsAhIS0/eeZAexRQR0JT5+mMsIYjMLqEjMmHwErEZYwEHi+a4mF
  hCbRUBVYsbRz8wgNq+Ak8T9H/vA4hICChJTHr4Hi3MKOEvcuXcXrFcIqObNx/9sEDVqElfPbW
  KewMizgJFhFaNZcWpRWWqRrqGRXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5
  xZW5yTopeXmrJJkZgUKQUs9zdwXho11+9Q4ySHExKorymB8NShPiS8lMqMxKLM+KLSnNSiw8x
  ynBwKEnwtm2LSBESLEpNT61Iy8wBBihMWoKDR0mEV/YIUJq3uCAxtzgzHSJ1ilGXY9PhK3uZh
  Vjy8vNSpcR5mU8CFQmAFGWU5sGNgEXLJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvJtPAE
  3hycwrgdv0CugIJqAj/C+HgxxRkoiQkmpgctHr3236Xjs1svRWu96+ub0ZjrI9f1ac/MPBHs5
  zZ/cShVVzEtO0f6yPnCn46GL4so9vX+3RPLR903S2osVZsv+u7z9ylqVfZXd75nflBZcEZ1b3
  agq9zDn2ePEmN5bHXUv+rOXrP+w98Yndvfvyx4Juh+mUGm73aH6Tfc3ISI8vcsoeVTctn9IzC
  +VPHpxXIGw34UCu/bbg0MMn7xW0dTUyPhNc8N1dct4l62drhGY9U/qYtHHrjalSpzc7zQ/YF3
  5cLWVPx+tDGYd33jLK+2tkk3Qn88vnuV92v1jWtd3dxVhNw6lVxJpBepHVl9TGjSsZ6z5cid1
  7T1e32n/zx4I7Cc11V5Pyzu6bU3HTYYkSS3FGoqEWc1FxIgBCfUGJEQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-591.messagelabs.com!1683540613!329299!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11718 invoked from network); 8 May 2023 10:10:13 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:10:13 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 577CB1D2;
	Mon,  8 May 2023 11:10:13 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7F0351C2;
	Mon,  8 May 2023 11:10:12 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] mg: upgrade 20230406 -> 20230501
Date: Mon,  8 May 2023 18:09:58 +0800
Message-Id: <1683540600-25325-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540600-25325-1-git-send-email-wangmy@fujitsu.com>
References: <1683540600-25325-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102403

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: version of hboetes updated to 20230501

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mg/{mg_20230406.bb => mg_20230501.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/mg/{mg_20230406.bb => mg_20230501.bb} (88%)

diff --git a/meta-oe/recipes-support/mg/mg_20230406.bb b/meta-oe/recipes-support/mg/mg_20230501.bb
similarity index 88%
rename from meta-oe/recipes-support/mg/mg_20230406.bb
rename to meta-oe/recipes-support/mg/mg_20230501.bb
index 8d61b7f7bc..ee00003977 100644
--- a/meta-oe/recipes-support/mg/mg_20230406.bb
+++ b/meta-oe/recipes-support/mg/mg_20230501.bb
@@ -1,11 +1,11 @@
 SUMMARY = "A portable version of the mg maintained by the OpenBSD team"
 HOMEPAGE = "http://homepage.boetes.org/software/mg/"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://version.c;md5=36d8ace99e6cd003132975a9266d3f77"
+LIC_FILES_CHKSUM = "file://version.c;md5=a8e0b53d89d277bf3b40878ac568bedd"
 DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRCREV = "4e6d2de9582cfe7f0977be4ce9532e3d33c5be15"
+SRCREV = "f21c2ba36772ffa68d9cfa55305e427d37903b4a"
 SRC_URI = "git://github.com/hboetes/mg;branch=master;protocol=https \
            file://0001-fileio-Include-sys-param.h-for-MAXNAMLEN.patch \
            file://0002-fileio-Define-DEFFILEMODE-if-platform-is-missing.patch \
-- 
2.34.1


