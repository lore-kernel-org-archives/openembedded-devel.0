Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3A4C38A02
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 08:40:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.6980.1667205600863523418
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 01:40:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=jlbqoiJN;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667205599; i=@fujitsu.com;
	bh=wI8foIeLaUy3AQyc2YPdIzzHZE+mA6JrYpkpSuh+D0Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=jlbqoiJNnu6Qeo283KJ5w1sNnegJy9W+EjQDVrWjKffgK5B4ZWCx9WVfntQGvP0nt
	 Saan5vrXfrUEYJwKon3Rw9wMxAyasugNn6/yWkp1dTWYGwF64OiJVanmjKeuHlKfxE
	 TzUke7faWpJYQ86yTUEtUd82OwhAyWbZmK80XfkjeREZ7D3vHXjMMScrqU3ds7lnz7
	 AX9EIHx9IsFmlmqCDIzMYzbaaGW4O3hCP7xnP02o6qb9NPj0lOkvZsgEYRGypNs98K
	 HxEXbPkhsG0KZV916UppuUefvB7XlKJNBFHTAUu0J3/qz6WSwotCv1q9/56K9B/1JF
	 +0SDLfpEQLMYg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFIsWRWlGSWpSXmKPExsViZ8OxWfdeZ3y
  ywdbnBhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8ae//+ZCmZyVBz4uZe9gXE7excjF4eQwENG
  ib+dX1khnCtMEveu3GeBcPYwShyZ9xrI4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBGoudLG1icRUBV4tfuV2D1vAKOEhdn/WAEsSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGuol1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYjCnFqod2ML5a8kfv
  EKMkB5OSKO+7lvhkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8jO1AOcGi1PTUirTMHGBkwKQlO
  HiURHh7W4HSvMUFibnFmekQqVOMuhwzv7YdYBZiycvPS5US5+3uACoSACnKKM2DGwGL0kuMsl
  LCvIwMDAxCPAWpRbmZJajyrxjFORiVhHm3glzCk5lXArfpFdARTEBHsLXHgRxRkoiQkmpg0nF
  T4Y1LeWTndaig2GS6qqXU+7WMh3l/3y6SnrDDfEZ9r+6d6Q3H92r/Er7LYj3vmD+nY90azSN+
  FTUnGuf1KClu5xY2Cni8+Nq64pup/8PdHX0cttR+dIuZ5JoZZrHrfKvbZ7nHBwJC5l5W0HiT7
  lBb4rSL71fI7P/2zOnyAdwWHm6yD+7Fde5c83z7F78CX4v89ZYfmN6/2ep3YoF36uF7TG+dEm
  sUKjWWSVR+/FcsHLsxjNM7IEM+7OSu7eoXr2udvFaco5t2QVwlQEF5bb7Uow+1RRIP2327867
  sc1x8ZcLiPTdbin7VyVZ+nOWj8Ns/TDTg/jE5uSD9qpea+ze+nzBt/02rFLPPOwqVWIozEg21
  mIuKEwH3/x2UTQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1667205598!173613!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10501 invoked from network); 31 Oct 2022 08:39:58 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 08:39:58 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 80C3F155
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:39:58 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 746D4153
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:39:58 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 08:39:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cglm: upgrade 0.8.5 -> 0.8.7
Date: Mon, 31 Oct 2022 16:39:41 +0800
Message-ID: <1667205585-3786-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Oct 2022 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99365

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
fix build: add missing struct affine functions and headers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/cglm/{cglm_0.8.5.bb => cglm_0.8.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/cglm/{cglm_0.8.5.bb => cglm_0.8.7.bb} (93%)

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb b/meta-oe/recipes-graphics/cglm/cglm_0.8.7.bb
similarity index 93%
rename from meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
rename to meta-oe/recipes-graphics/cglm/cglm_0.8.7.bb
index 5a437c102f..95a651dd03 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.8.7.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
 
 SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
 # Tag v0.8.5
-SRCREV = "7e5d1f435f628b873347eb052b7d6605b0b997f2"
+SRCREV = "8cfc98d2835a8cd1a9041f257c7ba0bfe4fbc1f3"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


