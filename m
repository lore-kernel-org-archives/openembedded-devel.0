Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA68CCCA48B
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:35:40 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.2586.1658806532880934622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OG9tAFqd;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806531; i=@fujitsu.com;
	bh=tdIvQz6ApGdcw6BXXIFSJqbp3o61Y2jNWMPVVd6c8PQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OG9tAFqdWq5RA5E1OMqhMbGyNS9Zwp9p6VCzJ3aqXjoOQ6Z2Un8114szOUkd+qjE0
	 IOSlGg/lzdHiISpHX2DRVgypLmOmp5UKp2ifI54OzAqqcJfX1a+6TdlD1vpX+veHtK
	 hqxK4Szm0kMS9qc9q5GDLVtaWLi6WMZE0/So9KU2BYu48BMPeTv/zj/7JCNnMfxY1F
	 xPur90GrM3V7x+hsN7RRjXwnzN9dQl6kzTKmzjVUd6/k7bzxeDhWBwHb4htysI3MRS
	 Bt1ycd9N3B8pTh1/qmG8bHvXvJcs0YNfq6tQgMePxXHUGkotMfCwm8q0NbpIWuyI5H
	 NBLsHYM+92wnA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpMuUeD/
  JYPERVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNl23u2gn7Oiglf5zI2MK7i6GLk4hASeMgo
  sfPzBlYI5zKTxOaFn1ggnD2MEnu/9gE5nBxsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3D3
  sXIziEs4CnxwLWLkYODRUBV4u4fHpACXgFHiX0/P7OD2BICChJTHr4Ha+QUcJK49LubDcQWAq
  rpn7uQFaJeUOLkzCcsEMMlJA6+eMEM0asoMftyMwuEXSExY8Y2NghbTeLquU3MExgFZyFpn4W
  kfQEj0ypGm6SizPSMktzEzBxdQwMDXUNDUyBtqGtsoJdYpZuol1qqm5dfVJKha6iXWF6sl1pc
  rFdcmZuck6KXl1qyiREYxCnFqXI7GA/s+6V3iFGSg0lJlHdL570kIb6k/JTKjMTijPii0pzU4
  kOMMhwcShK8r+PuJwkJFqWmp1akZeYAIwomLcHBoyTCW5IAlOYtLkjMLc5Mh0idYtTluHrlyl
  5mIZa8/LxUKXHeOpAiAZCijNI8uBGw6L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3QTz
  QFJ7MvBK4Ta+AjmACOuKT9h2QI0oSEVJSDUz7vbsqFNpS3vP5RX/b+vH3ohbHrLYub/8UyzsP
  /udoXXj6gPPaGb25D6V3Lz80WfyCnkpBkuyl76+t1zJ96L+2JWzWu3t2emqvuiamBa9RyTktx
  Hh+PoP5JeWJM29mnzu2Wmru9L2125jLsw4pet+7uv+30bMZDzNmfohrX/Zt6pSgQ6v/zkzeN+
  fe++0nHTRv1B/adNts/s0Ws5n7GFb8i2nifbz0RGysjNbNfb+qnRo37X3H4aiduVpmu43LcRd
  3mbOyd9Iu76zzvq6zfV9Whsj5w6d2TrdkMbW2jrsmVRMSt3X+eTGWXB7Nya4995VyVnyIWMZu
  +899/j6L9z8clC3czjE/5dnLcvw808r4/0osxRmJhlrMRcWJAMXsXKxpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-732.messagelabs.com!1658806529!104897!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31906 invoked from network); 26 Jul 2022 03:35:30 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:35:30 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 8324B1AB
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:35:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 786E07C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:35:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:35:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] unattended-upgrades: upgrade 2.6 -> 2.9.1
Date: Sat, 23 Jul 2022 13:40:46 +0800
Message-ID: <1658554848-9357-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554848-9357-1-git-send-email-wangmy@fujitsu.com>
References: <1658554848-9357-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:35:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97984

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{unattended-upgrades_2.6.bb => unattended-upgrades_2.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/unattended-upgrades/{unattended-upgrades_2.6.bb => unattended-upgrades_2.9.1.bb} (96%)

diff --git a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
similarity index 96%
rename from meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
rename to meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
index d4f5b8d0cb..e37dbcd02f 100644
--- a/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.6.bb
+++ b/meta-oe/recipes-devtools/unattended-upgrades/unattended-upgrades_2.9.1.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/mvo5/unattended-upgrades.git;protocol=https;branch=m
            file://0001-setup.py-Disable-autodection-of-modules.patch \
            "
 
-SRCREV = "c6db6fad26a2b83ba301b52ff5dee98cef7558ca"
+SRCREV = "5aff8fa2b5b60b7c11bbfb39c884477e72d11d02"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


