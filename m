Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47ABCF649D
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:58 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.48956.1727682227416337757
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ez3PcbNz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682228; x=1759218228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xLMlbIdz3EFq0pXTq+ivzf91tqtgWZQIxOd8u3OJ28g=;
  b=ez3PcbNzWXPO7P8oADuxDE5d8iRvKuJVQ+5xDxO7K6uIV9BsCUBkBGGa
   1Qf3tYenQ1RGogLtcZ0ZzxT5OewEKfcqB1+58tDmUeY3eQSKDeZtK7isD
   cmCHfaJlmzBbc2PRrtVso+hf3C9mnr9o69nZznKT9wRjyAul9ljuZ/5mC
   B35N95r7aqXsUYAhP5IzLEgLG2iJTYUqtkYws6oGF7Rb9TxMmx1GMyfaX
   29wM9d95u+PebcvQ94U6tyipbsSwHALWV+ZMCscMiU5+MYVa9frEqnOCn
   aO1Rz+62AUC5wcOi6UDpEgHMY319nvhvkEEE4ju3wVqY+NFpHSCkw5GDb
   A==;
X-CSE-ConnectionGUID: mhgNDT4aRhicEHDPEOvxbg==
X-CSE-MsgGUID: CvMzHAYIQV2m88/9Lcnl2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="162602028"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="162602028"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A2C1C68E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ADDAC13F45
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 50FF92007B71C
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 012F31A000A;
	Mon, 30 Sep 2024 15:43:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/40] python3-aiohappyeyeballs: upgrade 2.4.0 -> 2.4.2
Date: Mon, 30 Sep 2024 15:42:35 +0800
Message-Id: <1727682185-12664-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-2.009000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrMoS2PLq1B76BiEGSH1NomL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uhhg
	7W1Bq9cUlgvlHEDZWvoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzk0jv6FQ5LKNHHw
	V7Q1zI0R6vY3YmX0YSpZSfIIIkHQgEht+VLX/utUNZjEC5lf08gqgT76vOPdu7S/7qaIXxaeC1H
	ayKrjMkiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112577

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Copy staggered from standard lib for python 3.12+
- Avoid passing loop to staggered.staggered_race

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...happyeyeballs_2.4.0.bb => python3-aiohappyeyeballs_2.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.4.0.bb => python3-aiohappyeyeballs_2.4.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.0.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.2.bb
index 940492283..ce2572f95 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "55a1714f084e63d49639800f95716da97a1f173d46a16dfcfda0016abb93b6b2"
+SRC_URI[sha256sum] = "4ca893e6c5c1f5bf3888b04cb5a3bee24995398efef6e0b9f747b5e89d84fd74"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


