Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7D0C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:19:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.29532.1652084346362217250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Xt2zyYXU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084344; i=@fujitsu.com;
	bh=pU10vt7bSPi4QSgLPiQFEin0Bo/vSKJXdq+6gxtgBO8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Xt2zyYXUKwszpnE15X8ic2lIeaKfqzWpC/TJGGd8b+ZNS9H0y6gM2KSIAL4/aKcCy
	 LEVcv8HAg7/84vFkdamk/ugw1O/LnUOLZomOV0BmSazygNUX7kK3iZEvOt7Glw6cyD
	 nzWaJyzuqcIbVe2miqqamYB1Ds+1CDjYp7xE667jCe9NpACrz4Wjw0sNRXdo1CbMkT
	 NnFCHZ330+nU+eoLBX7mEaukVcdsPHpYEgrUvEbEqAe3/hp1JOrJLj2KoZVNdmWaCj
	 sPQVW/rWn6YMvF44CJEsimRhwkyv5x9l/t2mkpn9/YAspMNcftc4yQE7gTq4g4+J+N
	 vriXRR44EWOVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqFt+riL
  J4PVPM4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePl/BvsBT+4KmZ9XMXcwPiYs4uRi0NI4Amj
  xOXnO1khnAtMEtPf/WPsYuQEcnYzSlyakwxiswmoSUy/dYMVxBYR0JdYOnsPM4jNLKAi8eJ3D
  zuILSzgIvHr4goWEJtFQFXi2NrzYHFeASeJ/3fXg9kSAgoSUx6+Z4aIC0qcnPmEBWKOhMTBFy
  +YIWoUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itE4qykzPKMlNzMzRNTQ
  w0DU0NNU1NtY1NLfUS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDMuUYsXN
  Oxgnrvypd4hRkoNJSZS3sqkiSYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr8MpoJxgUWp6akVaZ
  g4wRmDSEhw8SiK8d08ApXmLCxJzizPTIVKnGC057i7cu5eZ48OhK0By2fJre5mFWPLy81KlxH
  m5zwI1CIA0ZJTmwY2DxfElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8jiBTeDLzSuC2vgI
  6iAnooI8BpSAHlSQipKQamLI6gpdfP3a8/5DoFV0GkRPfTJiVWEzULjspn1jyiGPSR/1U2S9/
  3y2OnpXnuzPzsL7nifhbWzp1LNSi7D9uufPiKJPABNPQdpffN+ynGy0+rHFFUVKm0XOlJXflx
  fZfcmpvpwUo32o6n7YpKY2dWbb/ROq7L61qlpazwo4dtI5yvf9x5WqPXrUCsZylvyqqGwLTzz
  lZbsmZ2JlbXpgt6NQ07elN+WVWbkw861T8Ty+cfHxyqslt7g3b2GOK0s0+fTu3b4rvkeCJJpr
  /9+5eyKPxwuKgtlmb2KZ3jkoycx35rV02Vopt4BJTqpE/Yl2wdLrA8ZOv5D8JrSotYJlVtoFj
  Vkb+Iac9RvOjdwj8UWIpzkg01GIuKk4EANN8JWpeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-34.tower-548.messagelabs.com!1652084343!204665!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28526 invoked from network); 9 May 2022 08:19:03 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-34.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:19:03 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 73CC5100192
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:19:03 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5239D10018E
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:19:03 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:19:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] babeld: upgrade 1.11 -> 1.12
Date: Fri, 29 Apr 2022 16:01:09 +0800
Message-ID: <1651219273-27341-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:19:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96987

5 May 2022: babeld-1.12

  * Implement v4-via-v6 routing (RFC 9229), which allows a router with
    IPv4 addresses only to route IPv4.
  * Enable extended Netlink acks when available.
  * Fix restoring of interface configuration to avoid unbounded memory
    consumption.
  * Fix handling of deny filters in the install chain.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-protocols/babeld/{babeld_1.11.bb => babeld_1.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/babeld/{babeld_1.11.bb => babeld_1.12.bb} (94%)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.11.bb b/meta-networking/recipes-protocols/babeld/babeld_1.12.bb
similarity index 94%
rename from meta-networking/recipes-protocols/babeld/babeld_1.11.bb
rename to meta-networking/recipes-protocols/babeld/babeld_1.12.bb
index dd1d6931d..747c16cb7 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.11.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.12.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
 
 SRC_URI = "gitsm://github.com/jech/babeld.git;protocol=https;branch=master"
-SRCREV = "f82a10e97a02849cd82087863055c9af08ca3454"
+SRCREV = "420a7087b7d6350084edfd7d1aef8a62209cbf04"
 
 UPSTREAM_CHECK_GITTAGREGEX = "babeld-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


