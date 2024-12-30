Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FE8E77198
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.58736.1735543843866390841
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o/YHgGQf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543847; x=1767079847;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=X/FvgJewpnRllQJJkYjzw3QxAKPV7eFbMPuDill8mhI=;
  b=o/YHgGQfe1q9CgR/YiAAIAIH4TzoozLCcjpBYG//LC0480AFrWw0eRWq
   yAaQHx2N6tGq5+OqwMJ7cnjZil/PX5+/EQLdS2LrKSDSKib6/5P5jsT9h
   YA3o8uWhp/qZR45OZrd5kE8fGxi32pql4CA7tXEff3CGibQy1n3lo/AmX
   JusZicMjnWZfYrMQoiNtLV9U9qG7B9WeCQxFd3hIzgsPp8xVAf44tYUZP
   POxeSXLa5Kqbm0x7BPV6vlE0vNl17LPtQ2LZPTtCS+rIFU8OjdYSlBAUD
   HPOl+jZEHYHdD7nvxgr2Yb94nZic77M30yUWM6nB7FeRKzaDOZs/z0UeX
   g==;
X-CSE-ConnectionGUID: JhXAOELfRZS+fCUJZLQuSA==
X-CSE-MsgGUID: RWn0l4GvQY63XNqLIs2YEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="172619677"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="172619677"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:45 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D0B17D4F6F
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:42 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C13DD39CF
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C4A320074EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:42 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D99FD1A0003;
	Mon, 30 Dec 2024 15:30:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/18] pocketpy: upgrade 2.0.3 -> 2.0.4
Date: Mon, 30 Dec 2024 15:30:26 +0800
Message-Id: <1735543836-2512-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-2.243400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPaCjFOVaqYalZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62Set/x/Sq9uznebylTIGwjA0EOWhD2I6t8/D5ygk/QZdF4H/
	LTzE0tKmBFAw7Ni4DwDSAqYEfkoOJ49ewka6TxNfNzTFZL3NXNS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114587

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pocketpy/{pocketpy_2.0.3.bb => pocketpy_2.0.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.0.3.bb => pocketpy_2.0.4.bb} (95%)

diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.3.bb b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.4.bb
similarity index 95%
rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.3.bb
rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.4.bb
index 2c0ecf0e60..3544247b8c 100644
--- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.3.bb
+++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.4.bb
@@ -14,7 +14,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8cdfa87bc5e09bc07f8cf64135026d91"
 
 SRC_URI = "git://github.com/pocketpy/pocketpy.git;protocol=https;branch=main"
-SRCREV = "3be557f95dbc706716b9a9947e41c1f2db92e251"
+SRCREV = "416ee069fdd275b141e3b292fcfe913c8abfa194"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


