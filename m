Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28780C0218F
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.32638.1737360858607546361
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BwPF7pMD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360858; x=1768896858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yef7pXfB7cxjrqFe1mNFgCI3JUkX9rorTyLlDPHLWTM=;
  b=BwPF7pMDbSkhX+6lDLsBLFrkrRzml6UPYeo1Fff4sJCalL0T7gzLDE9g
   NAmkO4BLxrrWoslgDRi5cuJdBpLY4kYE/OTnUf+GCIwu1E/6T8sLwjg/F
   kjt5xz7bjEU8tfpiXjmY0hItP6WlbqZhAeR3GRsukGWW6sqyJbhgcBR2E
   h1OmK6UaVBld3nX0QKp8vxVVHhEFtYW7IV4MFT6z4MdgXu42/ICXibk0p
   1CK03xxsG3N4kcrjWeH8Ab0yy0/xghHGcZHlqqwsM5txdWBq8QW2Y7gQi
   X2ez6PIpzAHzqve1YD6eoynR2wxI3jzAgoK20bIko25EHbqubrIcnJWUe
   g==;
X-CSE-ConnectionGUID: Z04mAzvYQ7iK/xwg/KSb8Q==
X-CSE-MsgGUID: 9VSvpXiZSdGiBpvFFQPTrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="175108124"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="175108124"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:16 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E13CE0765
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:14 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F417E15907
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 774AE6BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 285BF1A0074;
	Mon, 20 Jan 2025 16:14:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/32] libgee: upgrade 0.20.6 -> 0.20.8
Date: Mon, 20 Jan 2025 16:13:41 +0800
Message-Id: <1737360846-4824-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-2.502700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrG24YVeuZGmPtjfny5P3G5b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BHyz3bB5kG5/CI1ZvwYLbklMC
	1svsubLRP3kHQPYxqzIAy6p60ZV62yA7duzCw6dIBpRCTkRk5SfoLR4+zsDTtoubv1b7BWh3d5s
	sb1qmqxkj9VJN/1UoDTxmF0BNXwEFdMkYGVDgfG1BNhNb/2OpZXigSpaLzSW3sO5rq+nFkONbaz
	irejrhPk4yhqesvKCryDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114969

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * Fixes for new release process
 * Fixes for newer valac

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libgee/{libgee_0.20.6.bb => libgee_0.20.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/libgee/{libgee_0.20.6.bb => libgee_0.20.8.bb} (98%)

diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.8.bb
similarity index 98%
rename from meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
rename to meta-oe/recipes-devtools/libgee/libgee_0.20.8.bb
index 7e2781bcb0..7e29c72c02 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.8.bb
@@ -20,7 +20,7 @@ do_configure:prepend() {
     done
 }
 
-SRC_URI[archive.sha256sum] = "1bf834f5e10d60cc6124d74ed3c1dd38da646787fbf7872220b8b4068e476d4d"
+SRC_URI[archive.sha256sum] = "189815ac143d89867193b0c52b7dc31f3aa108a15f04d6b5dca2b6adfad0b0ee"
 
 # http://errors.yoctoproject.org/Errors/Details/766884/
 # libgee-0.20.6/gee/concurrentlist.c:1169:177: error: passing argument 4 of 'gee_hazard_pointer_get_pointer' from incompatible pointer type [-Wincompatible-pointer-types]
-- 
2.43.0


