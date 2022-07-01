Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EC4C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 00:22:24 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.32820.1656634941547445351
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 17:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HSuneXO5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656634939; i=@fujitsu.com;
	bh=aD/i+McfUYr0OBv6wDo0C9p8sQv098SVOesxa0HUbv8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HSuneXO5zuvx+o4BoEj8hTzZaqQ0zLxQQ+/9Pof1//qkGO2MYnef4xmzB0zg6z7id
	 P0i9GTMUL/xR7DtL3k8MZd3r5/CJ5TgGGy7Ry9zbo6txZkyLL/3K8ehCN+KVZVhLwG
	 Oad+VdNs2Mcu20ryKmV/O1dNSsLFdUggBfnbPFqSF+Wk/GgcicY+x2ELZOGsa3dQkc
	 VeW/ADkYY9Ziht+io9VfuT8nujklZ1oljguhRT9X+sozU6K1NIBbKsZCAP2o0wp0tr
	 3FLP18nAcK2w2n9fjf7hJpLEfOV9Iw+mcwLbpcqm5/YyWPwT/AE0wEdxMrxHmZ+edn
	 8uYg7pzVvwJtA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqGttty/
  JYOs6JouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPTh6+sBQ84K7qvajUwNnF2MXJxCAk8YZT4
  tPI+E4RznUniUddUZghnN6PEoc8NQBlODjYBNYnpt26wgtgiAvoSS2fvYQaxmQVUJF787mEHs
  YUF/CReNv9gA7FZgOJ7/hwA6+UVcJKYdO8EC4gtIaAgMeXhe7BeTgFniQ9/msBsIaCaee1TWC
  DqBSVOznzCAjFfQuLgixfMEL2KErMvN0PNqZCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoCRaRW
  jdVJRZnpGSW5iZo6uoYGBrqGhqa6xha6RoZFeYpVuol5qqW55anGJLpBbXqyXWlysV1yZm5yT
  opeXWrKJERjGKcVqV3Yw7ln1U+8QoyQHk5Iob+S5vUlCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  HhFbfYlCQkWpaanVqRl5gBjCiYtwcGjJMJbBpLmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqp
  Q4bxRIkQBIUUZpHtwIWHxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMmwcyhSczrwRu0yu
  gI5iAjtg5bQ/IESWJCCmpBqZqzhkOsff4K9+uvHqsdXrpveNtnyVn/GhY+sg4VvhQyba26aeW
  3i49/N/ucm7Kue/XnjRtVdErslsssXFTeSPn3N7rs9PCVJIDsj88fCKyafta3RMRom4Zh2PrV
  KX37q6aVrdaT0D1YVnvEYPwScGeGUHu0QmmDUzqU5gsfz+LnaP9okzv9Klfe9f1zEsXXLdrkf
  2hh5N+Mfz+8F+IoefgX8ekvLXXts18XSw8e6fTQfVjEVq6Fy6tudy+5lVzgO3rm3OuS+lt+3P
  qbcDx6acklj/Q3i5bdiZVVi9/N4OUDl9TcrRdfkbs3SMM0ctMsxax/Y7imcuzc1no7p3hQk8/
  nTdkSd439Zgkt7JiusVCJZbijERDLeai4kQAfaix72oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-548.messagelabs.com!1656634938!14683!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 742 invoked from network); 1 Jul 2022 00:22:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 00:22:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id BAA56100190
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:22:18 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id AE02610018D
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:22:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 01:22:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.38.6 -> 0.38.7
Date: Fri, 1 Jul 2022 08:21:27 +0800
Message-ID: <1656634887-17192-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656634887-17192-1-git-send-email-wangmy@fujitsu.com>
References: <1656634887-17192-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 00:22:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97649

Changelog:
==========
Performance improvements for parsing incoming packet data (#1076)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.38.6.bb => python3-zeroconf_0.38.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.38.6.bb => python3-zeroconf_0.38.7.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.6.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.7.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.38.6.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.38.7.bb
index bf97e4ff9..3f67f5fc8 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.6.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "c98f87a9145c58ad544cf1708b5eb2f444d40cd5defc69c88eeaac0527a28795"
+SRC_URI[sha256sum] = "eaee2293e5f4e6d249f6155f9d3cca1668cb22b2545995ea72c6a03b4b7706d4"
 
 inherit pypi setuptools3
 
-- 
2.25.1


