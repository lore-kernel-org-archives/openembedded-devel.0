Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4D4ECAAD2
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 01:35:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.1609.1662082534196841224
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Sep 2022 18:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LZdpArU6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662082531; i=@fujitsu.com;
	bh=Qq8zXTwj7NdAKFBhrKtPTC88Ihnm214A70UGVHu0LG4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LZdpArU6uWyROGD7KvHnCk36Pu2bAiW+zi89/rA/Sla714TJtEtQJ4uAb3WwE+r22
	 egbkvpQ0CRWlu8QWhuteWpZiV7889LRsBVfv03TTtl7NnOpyrWXbuUolVWigqZkYl8
	 I0oyahB9ckn4lOzd4L2BOiffBbnZP/LblmuaXQIKSF34483gsbkbO6IdjvxL5EZPLN
	 1k1UyNbWFdLml+3pQoJfgrp1MGqJnl/DSsvOCu+/0+ScJ6UQeAU9/BOjKyqkgap13W
	 cRawcHBcQTL0nr+Pt97fA4pdsDsfp5b90wmgWAfqCdR0xGWV56a+iZpung6nP5WmSr
	 2yF4t6t/jXzsQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqPs4VjD
  Z4OwrQYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePTxGlMBfs4K1pv/2ZuYLzI0cXIxSEk8IRR
  ov/mFHYI5zqTxNs/P1khnBOMEq0rWpm7GDk52ATUJR7ffM0IYosI6Essnb0HLM4soCrRfXENO
  4gtLOAjsXftZTYQm0VAReLGv21gcV4Bd4meKVvBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNUoSJ1Z8ZIKwKyQapx+CstUkrp7bxDyBkX8WkvZZSNoXMDKtYrRKKspMzyjJTczM0TU0MNA
  1NDTVNdY1tLTUS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st2cQIDMuUYubjOxin
  9P3UO8QoycGkJMrL9EcgWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr1aMYLKQYFFqempFWmYOM
  EZg0hIcPEoivH/DgdK8xQWJucWZ6RCpU4y6HDO/th1gFmLJy89LlRLnjY0CKhIAKcoozYMbAY
  vXS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEef0jgKbwZOaVwG16BXQEE9AR02fygxxRkoi
  Qkmpg0u+KeaZfwfLF723ArZC+RaVefXcZP6w3M+46F9ToKvI7JuFC7x93iSNFL6vXzdnwZfqE
  4x5LZ3Kr7rK01Dn4lF9zjmmw56kZDq3cC7Q6duwUe1e9V0B2cZ/Tmkcywhu8ak/PSJvFos62u
  El/4dqul+u+xXZESOzeWdoRENR24UnUctnX/e8sltxODk32yFrctHXn3JWdB71ueilr5y+ulI
  k4w938aVnRmcl6P1YpNdaul5jx3kFAsylBsi7l+2YfcT9bo0Zxq0I+Dp4rmn6GHqfW1VckPHw
  69xbP85d+7xWYy/ZdC3jHKjxPs4SXwb7Hfs79+6Im+wT1InK2CDLvynB5u+CD4kyLRh/n1VeV
  WIozEg21mIuKEwF3q2ufUgMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1662082531!184406!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30273 invoked from network); 2 Sep 2022 01:35:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Sep 2022 01:35:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E2499100043
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:30 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D4DCE100198
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  2 Sep 2022 02:35:30 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 2 Sep 2022 02:35:29 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-greenlet: upgrade 1.1.2 -> 1.1.3
Date: Fri, 2 Sep 2022 09:36:37 +0800
Message-ID: <1662082601-12677-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Sep 2022 01:35:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98589

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-greenlet_1.1.2.bb => python3-greenlet_1.1.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_1.1.2.bb => python3-greenlet_1.1.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb b/meta-python/recipes-devtools/python/python3-greenlet_1.1.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_1.1.3.bb
index d14987b1fe..5175212a71 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_1.1.3.bb
@@ -4,6 +4,6 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "e30f5ea4ae2346e62cedde8794a56858a67b878dd79f7df76a0767e356b1744a"
+SRC_URI[sha256sum] = "bcb6c6dd1d6be6d38d6db283747d07fda089ff8c559a835236560a4410340455"
 
 inherit pypi setuptools3
-- 
2.25.1


