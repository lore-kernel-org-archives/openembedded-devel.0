Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A546DC43334
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 03:31:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.2521.1658806276396131748
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jul 2022 20:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=onRaYDRJ;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658806274; i=@fujitsu.com;
	bh=KAlfLAXSWAYORtUygpTs77fqOYtXk5xk64QgWPAJxOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=onRaYDRJNgcsTVtc5otNSvXJ3R5rFRkGDWW7cVqznr0ykyJtgpUpUEs8hh+0fKVHf
	 uvHhZ1g8Z/ROQ2Lbz1g7F7VYE3JNDKYYe2nCBVIYh6+cXG9hFXgpxTKE5H0OMkzq+R
	 iULqDBciyci0DaIYAfIG/9Mw09pblM9ce4HmzAj5OXqfvKaSHGuX/Asmxr19qcmJUV
	 goIpI3/ah/hEanJZSXklBcRRvTvy9IwRoAyc08baRkKWkrSuKxgYFQlQ1RxUilgXMX
	 EKesxKonNNrvJ1/DpVInoxxdDroAJxDTckY+jsT5YIPMKmIk7lVMlbsycoAyG5ICpj
	 kus3TeLh+3Btg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWZcx4X6
  SwYpFqhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a0dw+ZCiZwVNzf+JytgXEjexcjF4eQwENG
  if0PdzNDOFeYJKa2P4HK7GGUmPvvJ2sXIycHm4CaxPRbN8BsEQF9iaWz9zCD2MwCKhIvfvewg
  9jCAu4SqybuBbNZBFQlvi2CqOEVcJR43PmODcSWEFCQmPLwPVicU8BJ4vyykywgthBQzZa7X6
  DqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSM2Zsg5qpJnH13CbmCYyCs5C0z0LSvoCRaRW
  jVVJRZnpGSW5iZo6uoYGBrqGhqS6QNDLWS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDOOUYobqHYz/e3/qHWKU5GBSEuXd0nkvSYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  +u4+0lCgkWp6akVaZk5wJiCSUtw8CiJ8JbGAKV5iwsSc4sz0yFSpxh1OWZ+bTvALMSSl5+XKi
  XOuwJkhgBIUUZpHtwIWHxfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMmxoPNIUnM68EbtM
  roCOYgI74pH0H5IiSRISUVANT5f7LrxPO37u0NuOf6BOB5rhLoicjTq/nX8bjyKhpbbfnVarP
  vm0TTu94cNCALaGBj3Pb77qzEpufuqxZHXzBwVp/ScLhddtyT0r3WHqGbTzd/v2yxrHvXw6+U
  uI51O213Dsi/E6ZZn/2553bBU/87K2V36e17El06dM3Olw7K5YU8jFravNrFvda/HevX9qXox
  IuzB1y/6bPt6p/z6tepjwsfX2DVcRus+7577Pm1RwWbb7HpBmd3bQqveeA4xU55TP/Z+/fpr6
  xxVFy8cbbXm8WTVwmlJZ59HVI08L/IQzhssbhcxwveBzIKprT9Gzq7wm3BRx/9gZtu3fxltHq
  adEf516JNODs1V12vkfFU4mlOCPRUIu5qDgRAO31mjZqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1658806273!141510!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32443 invoked from network); 26 Jul 2022 03:31:13 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Jul 2022 03:31:13 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3F908154
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:31:13 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 33086151
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 04:31:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 26 Jul 2022 04:31:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] wolfssl: upgrade 5.3.0 -> 5.4.0
Date: Sat, 23 Jul 2022 13:36:08 +0800
Message-ID: <1658554568-9257-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
References: <1658554568-9257-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 03:31:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97977

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wolfssl/{wolfssl_5.3.0.bb => wolfssl_5.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.3.0.bb => wolfssl_5.4.0.bb} (93%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.3.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.4.0.bb
similarity index 93%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.3.0.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.4.0.bb
index 40a48f6d62..6918ece0b0 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.3.0.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.4.0.bb
@@ -13,7 +13,7 @@ PROVIDES += "cyassl"
 RPROVIDES:${PN} = "cyassl"
 
 SRC_URI = "git://github.com/wolfSSL/wolfssl.git;protocol=https;branch=master"
-SRCREV = "e722c15be860794179082a05d09e6a90dc77ccf0"
+SRCREV = "57aac1c50b45275c7a99eca32ad985998b292dc8"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


