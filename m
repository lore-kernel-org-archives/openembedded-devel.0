Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D94DC433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 02:16:38 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.19911.1656555389782777165
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 19:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=I8QQbcLD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656555387; i=@fujitsu.com;
	bh=RcQEdhMy5X0R0hhGEaDob92MVxBRVjT0B+XLYR5ZPYE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=I8QQbcLDOhg/cC0GT1EMiCKngomlY8VnxWaLJPPUvnzZ2P5oU/HPRmZ9xKi/W5x8+
	 Y+m6CVrSvu7zqK34Mn0/nm9eznZvc6qCNY+AQo8XRxaQtb76TSADrSYabfxmW5Wv/q
	 S8fYvhqXoHwxBj05IdFCo7y6PHc6t9vsovVPbPp2OFAopIta5rPghUHyqZa9lW4+/1
	 yEPAI6FfuLP8RaC0KMH+R4PR804ixiyk8uinY1r4cJ4ZQjhloTStscAdzKsdr8IL93
	 XqyHTpPJD8LaJczLPE9Cj2CDBvMx6wA808IpNAjfsuKlK1UgaK7mYpAH5EdISKOViA
	 JlfTtWVBO606Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8ORqFvNvjf
  JYMshEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePthTOMBdM5K549OsvWwHiUo4uRk0NI4Amj
  xPKtTl2MXED2dSaJO20v2SGcA4wSW2buYwGpYhPQlXjxYzGYLSKgL7F09h5mEFtYIEBi08xNj
  CA2i4CqxJFfp9hBbF4Bd4lnU3azgtgSAgoSUx6+Z4aIC0qcnPkEbA6zgITEwRcvgOIcQDWKEr
  Ony0OUV0i8PnyJGcJWk7h6bhPzBEa+WUi6ZyHpXsDItIrRKqkoMz2jJDcxM0fX0MBA19DQVNd
  E18jYUi+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzD0UopZ3u9gbOr7qXeI
  UZKDSUmU9+m0PUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHjXM+xNEhIsSk1PrUjLzAHGAUxag
  oNHSYT3xnegVt7igsTc4sx0iNQpRkuOqbP/7WfmWA4mZ35tO8AsxJKXn5cqJc67kgVongBIQ0
  ZpHtw4WKxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMy8AGNIUnM68EbusroIOYgA7aOQ3
  soJJEhJRUAxPnh5fcGqZuOZs/qcxurHlRqKTltaJaR/KlziqOeas+5z200Ah+xdotLbvLK/nY
  /7ymH6KT5vAvYdmi0FH7PWrD3+A5mlMn/7lS9aX74fpV8cvKvF/MNq2K9t5j4Pm69MP+9R8VV
  X8eWiF05UqS94EoK5EfWuHM/DsyGQ1vWLz4MuXHAXGmOzul/2kIVfZJn0reM3uyyJvMY6djyp
  Qd+27ZB4tUvVtQURw3ibV38w8zq5RcpntlCbXLhU0+vNq0crmex7QrhR/FivamqTSXXxc68fn
  dpIeT5k2NybHbVJpwM3tKSWP16muZB1KX7Ungmqq0133xt2Y3w4MLXFrS/v1w/PDw1aoZd56m
  btc8sYtRiaU4I9FQi7moOBEAtXEW2lADAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-585.messagelabs.com!1656555387!400159!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20091 invoked from network); 30 Jun 2022 02:16:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 02:16:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E0DF810018D
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:16:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D4B42100043
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:16:26 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 03:16:25 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-asyncinotify: upgrade 2.0.4 ->
 2.0.5
Date: Thu, 30 Jun 2022 10:16:18 +0800
Message-ID: <1656555378-9756-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 02:16:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97628

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...hon3-asyncinotify_2.0.4.bb => python3-asyncinotify_2.0.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_2.0.4.bb => python3-asyncinotify_2.0.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.4.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_2.0.5.bb
index efa91c654..4c6450875 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_2.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec941a1cd6616454970d03cb9c9e8f8"
 
-SRC_URI[sha256sum] = "0ec20725b09decced856e46bb4dae6843ab429bfec87c42340dd0fefe1e2a25a"
+SRC_URI[sha256sum] = "e4d95cba362f10d33b6fdd558afd39f0ea7a5be1a9694434e738141cbed366d9"
 
 inherit pypi setuptools3
 
-- 
2.25.1


