Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04599C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:13:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.2923.1663063980808196222
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EAi8C8hO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663063979; i=@fujitsu.com;
	bh=1ulAHl7TARzU4Vqc/7c8m8no+3W1rH3cT7/cUp6T/KU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=EAi8C8hOV7cxnXAdUCcJJnzTkN91EHA00BOFV90sFpaBXKkOpRKyaERWXjHgKIsNC
	 5qK+X8jhmP0HrfImhkssWt9DFJhQ7UXFBFeMsj/geKtJAv9Sw9M8bL7BUfr0fnpdDD
	 tEdbuFjioEWxaelueKvhx62DaZ8uxnSnmvyhnaPMKfL5byXvZn+Jlw6D14/v4n22xy
	 Y+x6OtS0xY5AEyvwMutGuOIvGPCyN5uV4RHLOVNHqu2/XvFUBsohL6vszaHbf+H9Tb
	 LKG4jsaT0Fa9xNvAUGXdpHVC7aL3TtGiV98wBA2z6Do9SBFHzk58lpi9oTjimInJbW
	 db5jbp9fnB+0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSXdVuEK
  ywcn70hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bqbbtZCiZwVrQufc/SwLieo4uRi0NI4Amj
  xPEHjaxdjJxAznUmiWO73CESexglFn58yASSYBNQk5h+6wZYkYiAvsTS2XuYQWxmARWJF7972
  EFsYQF/iYVP14LZLAKqEqvu/gezeQUcJZp3PQXrlRBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdIdE4/RAThK0mcfXcJuYJjPyzkLTPQtK+gJFpFaN1UlFmekZJbmJmjq6hgYG
  uoaGprrGprqGJpV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmBYphQrT93B
  eHrVT71DjJIcTEqivJFeCslCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjjQ4BygkWp6akVaZk5w
  BiBSUtw8CiJ8PIEA6V5iwsSc4sz0yFSpxgtOabO/refmWM5mJz5te0AsxBLXn5eqpQ470xvoA
  YBkIaM0jy4cbA4vsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFciDGgKT2ZeCdzWV0AHMQE
  dZGQtD3JQSSJCSqqByWTjlOO6k3wni8Wt21xesk66t8Ij3vCe+9vI42+8PD9L1jNoPnxQ+v3B
  +oP2NTZPkrhmX+syvKKzv6bPIk/vzpyrByRfR/Dea1k50eHE1qUGM3+48e3n6Di17v2OGa/WO
  XN+W2bfsrAvWOSE4Ip//3fuldz7OmmWlTZ7bmt5zazFZX8/+b0+265Z6nnZq03cvbyyYtos3Q
  U/q40f8pVsWSzhpPuUbyOTzrOcLSWb+A7ZPnLJPXvtmPKm+dG5nrefJHe94Dmzq6Vbcn7ua5+
  PX1eZiMxaGL3p96Udde84sycJPeaLuh/RUKntzSvxb/eBuoKMKsuP9naHVit/iBHfxsWhk3L8
  6xzV9ztOJZ3KalRiKc5INNRiLipOBABybvkZXgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-565.messagelabs.com!1663063978!254165!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5221 invoked from network); 13 Sep 2022 10:12:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-2.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:12:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2CB411000CD
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:12:58 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1FFE7100078
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:12:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:12:56 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220828.0 ->
 5.9.20220904.0
Date: Tue, 13 Sep 2022 18:12:47 +0800
Message-ID: <1663063967-3098-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:13:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98756

Changelog:
===========
docs(man): remove unexpected newline from the rendered verilog man page

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220828.0.bb => ctags_5.9.20220904.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220828.0.bb => ctags_5.9.20220904.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220828.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220904.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220828.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220904.0.bb
index 7fd0a839ca..be50b36766 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220828.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220904.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "dfffd3d8e18183e0e9131f2c301e18f78866ceb5"
+SRCREV = "096dc1c1337edeff41c3e6600553c3b43bdde131"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


