Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4E5C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:42:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.8981.1648460536599830893
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ubbzto9N;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648460535; i=@fujitsu.com;
	bh=NwNi7G40ixepBkda0FErJ5nFiWXEqh6HJPwCIpyLNMA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ubbzto9N1tauLmQa3s+1sg2eAixgVS9Xswj1+2QcLyZKublzO7f5LilWXnyInhMvb
	 iOEdwloHezBNlUAQbH7Ta1bCS/ppIj95daDIpAUrq/UWimw/yjTx653ymmbYwpDBpH
	 jqHH3r1s17G3jhxUKSggpQJtKzJzu0WIIw5t1INrSzuupGuVukt1BBovifBj1nf1Of
	 KIVrW2KLkuUFoUtZLHIB/3Aje/pALimsWSRvb0n2puA9La7LaNmEqoU9L1pjZF0M9v
	 kliGXjOhHU7o5eGNhOp/7+U+HLE6jB8jjR7DQFoUnwvj83BXsQ/rQty9MwJKP8UmDf
	 U4YNyHjVZQmaA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqPu9yTH
  J4MRhRouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPjj5lsBUfZK/5/3s7UwPiFrYuRi0NI4Amj
  xJmz39khnAtMEi/WvWKEcPYwSsx8Pp+5i5GTg01ATWL6rRusILaIgL7E0tl7wOLMAioSL373s
  IPYwgJ2Eoea9oDVsAioSuzfPRXM5hVwkpj//DojiC0hoCAx5eF7sF5OAWeJ7z3zwGwhoJqZe/
  8zQtQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0SirKTM8oyU3MzNE1NDDQNTQ01TU21zW01Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzjlGJV4R2MHSt/6h1ilORgUhLlNcp0TBLiS8pPqcxILM6ILyrNSS0+xCjDw
  aEkwVvRAJQTLEpNT61Iy8wBxhRMWoKDR0mEd0INUJq3uCAxtzgzHSJ1ilFRSpx3bSNQQgAkkV
  GaB9cGi+NLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5zUCm8GTmlcBNfwW0mAlo8dp3tiC
  LSxIRUlINTA3J3xKy/a0teE8pSwWJC/a7TahdsOjiEda3zMG/eGqW7KmMSj/B2TFLPz9xD2/l
  5MJN/gzR03I3Cgt7/mLky2njlZnnrpTxcH6e0fKlE17NSw/2+6dvafCCsSNadLt+fvNq5TavW
  cXhKx2apfSS1otMmPYt4MpaKaVdHVujvJfkPHmT5/X2jt3FCbq77NyX7N/tsf+l1yLt40E7Qk
  2DN69kUkq13boohEMn+0cug7zqqs4Cye6qdYvevqljzKiW7HA9p3DKaRd/p67dI5tHHeJGy22
  /zOV7Yb/2/4oMv6+93UqHbn0v7+j86M3/+XXG8blCXyIP9zx79PnpvJNfNs/MtAuNyl7wLCd+
  6dw7SizFGYmGWsxFxYkAl+qtTl4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1648460534!183349!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15447 invoked from network); 28 Mar 2022 09:42:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:42:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5767E1001A4
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:42:14 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 9EF2F100198
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:42:13 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:42:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] stm32flash: upgrade 0.6 -> 0.7
Date: Mon, 28 Mar 2022 17:41:43 +0800
Message-ID: <1648460503-15630-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648460503-15630-1-git-send-email-wangmy@fujitsu.com>
References: <1648460503-15630-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 09:42:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96234

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stm32flash/{stm32flash_0.6.bb => stm32flash_0.7.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/stm32flash/{stm32flash_0.6.bb => stm32flash_0.7.bb} (82%)

diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.6.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.7.bb
similarity index 82%
rename from meta-oe/recipes-support/stm32flash/stm32flash_0.6.bb
rename to meta-oe/recipes-support/stm32flash/stm32flash_0.7.bb
index b86b047fc1..0998aa6778 100644
--- a/meta-oe/recipes-support/stm32flash/stm32flash_0.6.bb
+++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.7.bb
@@ -10,4 +10,4 @@ do_install() {
 	oe_runmake install DESTDIR=${D} PREFIX=${prefix}
 }
 
-SRC_URI[sha256sum] = "ee9b40d4d3e5cd28b993e08ae2a2c3c559b6bea8730cd7e1d40727dedb1dda09"
+SRC_URI[sha256sum] = "c4c9cd8bec79da63b111d15713ef5cc2cd947deca411d35d6e3065e227dc414a"
-- 
2.25.1


