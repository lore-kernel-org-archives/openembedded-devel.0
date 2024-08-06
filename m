Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3730C53218
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:07 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.2883.1722934016725115195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qUcR69I5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934017; x=1754470017;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=KWXB13VSypZEcFDu2mzWJYNYofB7eUHNfy83PLZD+fU=;
  b=qUcR69I5emm2Pzzo+Ynyy9mbCJFgR3GXkkslKKJxs2mMVJYlFbzoDkLP
   ekhE/qVDH2Q1hgZY851ZWfalkAaCtCLKeK7PrmxKwRg7jIXzN5doxTzLj
   CgI4+/jA0xqYnnqoK7ZyULUdg5gbHwiJZah+bakiLw326fdbtkpLzoB+5
   gQlvedIduNMAUcxnyX0FVAO6tGsovVRxdTSCmkVuHHO5TbQH2xXs2waNV
   DRrR87wZliTXTtk6D4+YcA4s1au0PaV5wWT7iZKXhbSjTnR4lE0XIEN/G
   92dFlPifPNjFEtuGnCT1iFOfOYUqrTuhuZ56nuYSaJfBUstX3/BKCOFGM
   g==;
X-CSE-ConnectionGUID: Wy1rbDIUSae6SD0SrvCs9A==
X-CSE-MsgGUID: 0JLvWXnJQ/GrpfC7w8BzKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="157929856"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="157929856"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:56 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 91686C9447
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D17F6CFBB4
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C71F20076D14
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 175851A0002;
	Tue,  6 Aug 2024 16:46:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/60] libpaper: upgrade 2.1.2 -> 2.2.5
Date: Tue,  6 Aug 2024 16:45:51 +0800
Message-Id: <1722933994-32549-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--1.680000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZnVTWWiNp+v8gX2Xt4pvYkTcSzfHZ2T3VA6J
	UWkXudIk6hUOcTonr9IAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz6eM1RIepcm1eM0
	6aZw4KcpOfxqI2tpQ0bOcaKG1bgAe16lWUgIicPXgMZa5NutZzRPF/kDg/M3RcIIFGxRonsO9Hg
	hmWOCJZiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111528

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpaper/{libpaper_2.1.2.bb => libpaper_2.2.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libpaper/{libpaper_2.1.2.bb => libpaper_2.2.5.bb} (80%)

diff --git a/meta-oe/recipes-support/libpaper/libpaper_2.1.2.bb b/meta-oe/recipes-support/libpaper/libpaper_2.2.5.bb
similarity index 80%
rename from meta-oe/recipes-support/libpaper/libpaper_2.1.2.bb
rename to meta-oe/recipes-support/libpaper/libpaper_2.2.5.bb
index 9369d2837..3b0e1bf0d 100644
--- a/meta-oe/recipes-support/libpaper/libpaper_2.1.2.bb
+++ b/meta-oe/recipes-support/libpaper/libpaper_2.2.5.bb
@@ -2,7 +2,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://github.com/rrthomas/libpaper/releases/download/v${PV}/libpaper-${PV}.tar.gz"
-SRC_URI[sha256sum] = "1fda0cf64efa46b9684a4ccc17df4386c4cc83254805419222c064bf62ea001f"
+SRC_URI[sha256sum] = "7be50974ce0df0c74e7587f10b04272cd53fd675cb6a1273ae1cc5c9cc9cab09"
 
 UPSTREAM_CHECK_URI = "https://github.com/rrthomas/libpaper/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


