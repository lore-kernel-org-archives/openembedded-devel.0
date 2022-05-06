Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C107BC4332F
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 15:07:11 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.30210.1652713621416804431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 08:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v1Sx1y/K;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652713619; i=@fujitsu.com;
	bh=JvXMM6prwtnNpbGTBvxir2WMob0BjePLJLQG9ACPhFc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=v1Sx1y/K2qNw0j5BKywRIUSP/M0L2GyNbxr9jLDqojyH65xpW/fFWFvXdNM0RVvV1
	 kXDniXRQ3+Hy4yJeuno2yJZ2AUtfiWpx5U1e7lNd3w3tCFjoBpah+12pfUpaGQ0lNU
	 F5ayqxl65GbhSICM3wplDa4Icc0TgRA2d9Qgi50E+9u1gQEV44F6knJM0Pyj9TATKd
	 RqsdVCrclDwrYqrePhlkgx2uelFiYWpzjQ2C74Iami2O/VxyTWJJ0Cs7gxZb1jKWvA
	 QnORzgcYx66rQulVoQd6YzQSlz+IHPSTCaA3cCWe9feO9mKtie2PXAWW3G8efd5ZXH
	 XHQIJd9+NlmNg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORqDspoyn
  J4PlXC4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePqikOMBU0cFfsnzGJuYFzM3sXIxSEk8IRR
  4umqP2xdjJxAzgUmicNH2CASexglFrZcYQJJsAmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgIXF4Sx+QzcHBAhRff4QPJMwr4CQxZ3YLWKuEgILElIfvwVo5BZwlDt3byQix10li98
  epTBD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWicVZaZnlOQmZuboGhoY6BoamuoaW+oaGRjoJVbpJuqlluqWpxaX6BrpJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnFKsfqJHYxPV/7UO8QoycGkJMq7JrkpSYgvKT+lMiOxOCO+qDQntfgQo
  wwHh5IEb0MaUE6wKDU9tSItMwcYUTBpCQ4eJRHe4/FAad7igsTc4sx0iNQpRl2Ouwv37mUWYs
  nLz0uVEuc9mQBUJABSlFGaBzcCFt2XGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzKgNThRB
  PZl4J3KZXQEcwAR0hot8IckRJIkJKqoHJ7+SS3Ra3jy5h2nhsDuMxAWmpCtPCkOYS7m/THvl2
  fvnF05eyY5GnPNd/590XL5RlXej4tdTj2np12dipc+2Un/F7fpz8vujWhOuuQZmJ7yd0RU0on
  H1tTX5iw/zGqSd9GR4vi3CoXFcwScbh7uk1wWsaTlVZbDj9epfBzLuaa55N0eRpmZjzuNjCrT
  Rz/oFV79h1J57RkVl5Nvjm4fznbCn6XzXrd7Zna56TqWQ8d2feOhttjls8+pUCtSVHtp2aqdL
  DdPqd+aRfVn3stYLO0xv17Jm0vjvEPj9VuflWR2P8JeefV+L/OvAGrcw2aX0uPs9IMOPZWQkx
  MZks+dX8t7ee3ehjuobtMrvCBYb/SizFGYmGWsxFxYkAOD2BtmkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1652713618!467301!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12124 invoked from network); 16 May 2022 15:06:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 May 2022 15:06:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 4D2AA100195
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:06:58 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0DF14100181
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 16:06:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 16 May 2022 16:06:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.2 -> 1.31.5
Date: Fri, 6 May 2022 22:48:28 +0800
Message-ID: <1651848510-13012-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651848510-13012-1-git-send-email-wangmy@fujitsu.com>
References: <1651848510-13012-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 15:07:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97130

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.2.bb => nbdkit_1.31.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.2.bb => nbdkit_1.31.5.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.2.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.5.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.2.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.5.bb
index 16e29a2fd..79b0001b5 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.2.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
 
-SRCREV = "4a5e55f798beb922dd4bbfd7c40837e35a9754b6"
+SRCREV = "a671de5017546149ef38bfdbdae95c675538b93b"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


