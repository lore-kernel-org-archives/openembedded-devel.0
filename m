Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EB9D29F92
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.40141.1730874690857138668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iSZG+VxE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874691; x=1762410691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=e3zs91693FlTxowPjZqYl1Mj+PZvkDXpaTzfrv9z2yI=;
  b=iSZG+VxE6XzZGhxYX09R+EfzjyA0MfJfiUblB6y6vVVU1LW5rRKpdeo+
   dNJuV7Y4D7q10wXc2faZAoTpeNw25MkHQH3hzP/xDWPn+0CoVHheyReZK
   Hry/6jjXr1homSoxhyIiCz8A6l998q1I8jMldXJRvZ/vGPhuyd66Mv95p
   IAiHCAQNgoQcRAvcubFnKz3STIKLyF4DwyxOROU5VWUVmWHA+cV5Fm3sv
   wNweZjqUeRVaQu2vHj72jYduSCwSImvgouC9L3gbW2+nqs1Vqh3/vWHX3
   j44JSGK+CU2+bmFKa6+CGTOXMQs9pINEdQHpu6nRoXyIkj6ZqHH/fG2J2
   g==;
X-CSE-ConnectionGUID: lt3JnUM4TF6+2bjDQdbcXw==
X-CSE-MsgGUID: 5+CPUjwBR+SLGJgxvFE6yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158735940"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158735940"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:29 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D79EBC684F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:26 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3398AD50E0
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BE70E6BA6D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:25 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6C3121A000A;
	Wed,  6 Nov 2024 14:31:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/46] python3-pytest-codspeed: upgrade 2.2.1 -> 3.0.0
Date: Wed,  6 Nov 2024 14:30:48 +0800
Message-Id: <1730874660-2364-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--1.026300-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIQaoaJtPOWuFFl8B+Ev2VeXx5BQiR/cKo4su
	P5YT56AwG3mDkBgPeuKEvE6lge+si8V1qihhF60SGC4Td26jD0jS9ms7ZlFbv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113718

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/CodSpeedHQ/pytest-codspeed/releases/tag/v3.0.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-codspeed_2.2.1.bb => python3-pytest-codspeed_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-codspeed_2.2.1.bb => python3-pytest-codspeed_3.0.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_2.2.1.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-pytest-codspeed_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
index b7b5461f6..b731e77f1 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_3.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2856cbe664e8843cd4fd4c1d1d85c2c3"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "0adc24baf01c64a6ca0a0b83b3cd704351708997e09ec086b7776c32227d4e0a"
+SRC_URI[sha256sum] = "c5b80100ea32dd44079bb2db298288763eb8fe859eafa1650a8711bd2c32fd06"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


