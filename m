Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6633CCA47B
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 08:52:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.3592.1655110352891518325
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 01:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kLKGCPG0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655110350; i=@fujitsu.com;
	bh=Md3sh6ytCAajEcVOAzKO0UbqC7O67e4xm6K/sq3Kx6M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kLKGCPG0oRS7UXftrXMea3u/eXGY0SvReCctfzcBQgTMhnKl2Ikc/JL5xJIpytA1C
	 ptZ7loEZCNujzIfldk9cG2PycfcB6LS8NJJzD93B0vLRAztFs8HuPbwDGbHDXR3Vrr
	 7WWPjApIgmg4LyxzU9Scv45Uv2sicWDS5d5nfkNA/LNDZ/9FUq9VMN4RwjeE36Ke3q
	 X1pEiSKI+KvfyAr8DsMrbTDxXXvLGCTj4cgQLaCIWXCxFnrVmkfbQXdSSDpGWl4Z/X
	 oX0WBUz6of0tfhIYMHDUbkyimk3ypsEg5cbEoexaWWwI8xTc4AJ8iJ+7L7D59hm6n9
	 GnSfruRaflupw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqHv217I
  kgxmLOSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxpLX/ZC+azV7ReW8fcwHiGrYuRi0NI4Amj
  xK/mHlYI5wKTxMvO9VCZPYwSj1/sZe9i5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8es
  BphAXOJpfO7gWo4OFgEVCVWTIkCCfMKOElcnTofrFxCQEFiysP3YDangLPE1zcv2UBsIaCaRQ
  tPsULUC0qcnPmEBWK8hMTBFy+gehUlZl9uZoGwKyRmzNjGBmGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVonVSUmZ5RkpuYmaNraGCga2hoqmtsoWtoZK6XWKWbqJdaqlueWlyia6SXWF6sl1pcrFdc
  mZuck6KXl1qyiREYxinFavU7GF+s/Kl3iFGSg0lJlHfvl2VJQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4H30FygkWpaanVqRl5gBjCiYtwcGjJMLr9x0ozVtckJhbnJkOkTrFqMsx82vbAWYhlr
  z8vFQpcV6bn0BFAiBFGaV5cCNg8X2JUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvR5ApPJl
  5JXCbXgEdwQR0xMaTS0COKElESEk1MMUtUL5cxaHN6OTck3cttrWaJWKxxHmrzpIH/KU799wP
  2jDf6OG2Vxcupm5fw1bItaLj/ImtUiKrvLaskVFgYzQylOwKX12e5Nu4k0XmnNGBuOfb7+yr/
  vIvYUqByOGnfg/jJi5T3RNTF3eaec1DxvZDMzUX7M2Zd0hB8fjJvC9rjFctUZyyUyuCMaOrws
  Rm6ZV3C4PfuXcm6tTo7P3SdrC9agXngd231298n6XXPKeZ++iXBxI8b7sblIMeBa/dtDOmd32
  E9+/MbTpbNd6l7dpx1c6AQc2U76pBjkC9/Su5ogq/DWunqp1wXO+rcTSeR2PP0ndf1r44u5m3
  ynfbhMchQcd/FFzhevaDx+UR00slluKMREMt5qLiRACMReUNagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-548.messagelabs.com!1655110348!4497!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24347 invoked from network); 13 Jun 2022 08:52:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jun 2022 08:52:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A4BA510004E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 70C85100194
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 13 Jun 2022 09:52:15 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] feh: upgrade 3.8 -> 3.9
Date: Mon, 13 Jun 2022 16:51:53 +0800
Message-ID: <1655110315-25174-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655110315-25174-1-git-send-email-wangmy@fujitsu.com>
References: <1655110315-25174-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 08:52:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97484

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.8.bb => feh_3.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.8.bb => feh_3.9.bb} (89%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.8.bb b/meta-oe/recipes-graphics/feh/feh_3.9.bb
similarity index 89%
rename from meta-oe/recipes-graphics/feh/feh_3.8.bb
rename to meta-oe/recipes-graphics/feh/feh_3.9.bb
index 12951e28c..e4422668f 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.8.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.9.bb
@@ -10,7 +10,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "7f3c34552b39336d7ebee2d7c4bf5697aaaa2c6c102c357f6e82ea240bd62ba9"
+SRC_URI[sha256sum] = "8649962c41d2c7ec4cc3f438eb327638a1820ad5a66df6a9995964601ae6bca0"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.25.1


