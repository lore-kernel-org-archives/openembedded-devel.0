Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D494E77199
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.58736.1735543843866390841
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EHGzBjIW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543846; x=1767079846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=TwYL4DWC69w25BgC6Bb9HukejJLvRsPZSYLboZ5lgvA=;
  b=EHGzBjIWiUyBMFYBfPI3FUu1QOfMCIZFv6nXrFffo8h1+Kc7y8N0fxO0
   LzAj7FSMYXujS5GZX6cSkI5LnkBTDEpHwJCL7em4e7M6IrfIlY7Fe6ksO
   i+lyGiSopYiKsxJ3/vwU6b7mrYvF6cIFIviTEgHqrnVP2x/qJOcgF+aBb
   U/8lZmJlb0h4ub5mQoyWGrzqHi3g/pIwGMmP4fol6HiEs6SktGC++1PYD
   h02UJg61QqdPpMs7tGWPgt2s0+8aorWYicyeYNL4udSOZ7NsRAOr9c4D4
   Xls7j4GBMy6yi6+R7845J/TfQT2PnDkkN3hJSZD58XMYgAVSDXgGMHgAy
   A==;
X-CSE-ConnectionGUID: XCNKDj34R9WjoNQ8UvYQgQ==
X-CSE-MsgGUID: +3FzBJGJSJC8F7IzB+zxTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="172619676"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="172619676"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:44 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 95D31D6EA9
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:42 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 616AFCFB96
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EE4E96CB1B
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:41 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 99C9C1A006C;
	Mon, 30 Dec 2024 15:30:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/18] parallel: upgrade 20241122 -> 20241222
Date: Mon, 30 Dec 2024 15:30:25 +0800
Message-Id: <1735543836-2512-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-0.931600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy49oUcx9VMLgFEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtnlV
	v2XS+do8ZHMq9hkAPZHfJA2OilVvLJGEHeYAMBGq+ckohDrl7bB3qwpyoViFQefXLIudx/3XbLe
	G8By/qrSBTVZ7D2q7Y7u/KFSdfMHzyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114585

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20241122.bb => parallel_20241222.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20241122.bb => parallel_20241222.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20241122.bb b/meta-oe/recipes-extended/parallel/parallel_20241222.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20241122.bb
rename to meta-oe/recipes-extended/parallel/parallel_20241222.bb
index 36b522dbcf..4fc5373abe 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20241122.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20241222.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "1a9e752f42c17ca10bc07d0a63a2ca6edcee532282e55d2b34bd9dd14c978a58"
+SRC_URI[sha256sum] = "7a1b038cb198604107f9601b7c2a176e78d845858121708fa8690671cb301a79"
 
 inherit autotools bash-completion
 
-- 
2.43.0


