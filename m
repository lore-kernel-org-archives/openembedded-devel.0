Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27B8C6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:21:14 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.7321.1663640464613586912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=coeSti/9;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640462; i=@fujitsu.com;
	bh=cyJrBw0firjIGxm/aWOeCUzpMqWLl7D1cojgj2i9nq4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=coeSti/9UKqIRNlz8tsCw1oVKw3Hl82QOnGAM4gkZzFZReNlB7xS85ULMnkPuf7lr
	 MDSc0R4DG6dIihd2OO8ASh1hJBfp3nrAlm+oL6yGu5DazSpzMGElHvLa44/KWoY0tT
	 xPCXBgT1LqUt8fqiAmRM/eFEIaGjJGSOSCgf2dO6TGFeb5oT+lwfvUvyB3mG8UM/ex
	 y+0RYFm358hTk8ZgufeCBrp/WehDfUlNsC3/4usN0AWjlpmK/FO0NP18nBv7TjeN+R
	 MHk43jf+mvwAPZI66eu0a7CdmB756eNQirsIWr1pbH5MJC9hQyhDI2G7MRk0v99ZQf
	 Wd1ybts7GhVjw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORqNurrJl
  s8K5f1eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzbjXc5CpYCZHxdmvv1kbGLezdzFycQgJPGGU
  2PWqkQXCuc4k8f3GMTYIZw+jxMbn+5i6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhawkdi+/RBjFyMHB4uAqsSb47IgYV4BJ4nWaafASiQEFCSmPHzPDBEXlDg58wkLxBgJiY
  MvXjBD1ChKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVom1SUmZ5RkpuYmaN
  raGCga2hoCqSNdQ1NjPQSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L08lJLNjECQzOl
  OL1vB+PGfb/0DjFKcjApifJy1WkkC/El5adUZiQWZ8QXleakFh9ilOHgUJLgtRfUTBYSLEpNT
  61Iy8wBxglMWoKDR0mEl00KKM1bXJCYW5yZDpE6xWjPsbbhwF5mjqmz/+1n5lgOJmd+bTvALM
  SSl5+XKiXOm6IA1CYA0pZRmgc3FBbXlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ84bLAU3
  hycwrgdv9CugsJqCzbqiog5xVkoiQkmpgmvIuwXry9luVs5QOHjMuzmlVCv3M5d2zaoPA4qtb
  M/5+bc69UlIUL/Xs4atDhhq6OudvvH8SOW/e74mZB13MhdcxK/s0Brp6nnv1M9P5puSFfiOlW
  zu4M/+Im1p3PUlSCL/OfVUylWtLdexLj5RmrflvgyPWzrSuubBm5j0Gt/+bJznfyTBc0Pan+z
  5zj7WF04/pM/6F19k2pEpV+PJlMXInPhPhdG3gjA61Di7+32Nx65CFlYph4aTcykx32XVPHPQ
  yeud5bZIVWML1Lu5Ga8i1jzZej7nOLHjx5NWKh09dGFPzvsoFbp3Ttus6i+4yibezfhzK8Qs7
  IqxZ/3BZ/cfTQRMX5ASfXp43eyefEktxRqKhFnNRcSIAG1yVq2YDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-745.messagelabs.com!1663640461!253264!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30320 invoked from network); 20 Sep 2022 02:21:01 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:21:01 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 09C8210019A
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:21:01 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id F178F100199
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:21:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:20:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xmag: upgrade 1.0.6 -> 1.0.7
Date: Tue, 20 Sep 2022 10:20:47 +0800
Message-ID: <1663640447-27417-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:21:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98881

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xmag_1.0.6.bb => xmag_1.0.7.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xmag_1.0.6.bb => xmag_1.0.7.bb} (68%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xmag_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.7.bb
similarity index 68%
rename from meta-oe/recipes-graphics/xorg-app/xmag_1.0.6.bb
rename to meta-oe/recipes-graphics/xorg-app/xmag_1.0.7.bb
index ab74f5bd67..f3dac53451 100644
--- a/meta-oe/recipes-graphics/xorg-app/xmag_1.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.7.bb
@@ -7,5 +7,5 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3413fe6832380b44b69b172d2d1b2387"
 DEPENDS += " libxaw libxt"
 
-SRC_URI[md5sum] = "8aaa41374935d697ee55d7dc9de70781"
-SRC_URI[sha256sum] = "87a2bc23b251e2d8f8370d3283a4d6c8dac98a30cb5749a04336cdb55c14e161"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "009936cc5a2706084079127b26cf55c713767650a34cb69e5682d60e33ce7461"
-- 
2.25.1


