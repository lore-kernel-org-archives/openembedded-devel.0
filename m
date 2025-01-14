Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03986C0218B
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.40584.1736843345993561557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ioD1uL6C;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843347; x=1768379347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RoXwvwKMQxiQ4Ny/MgdcpranwJDPEVnHW9bTq2Yss5Y=;
  b=ioD1uL6CwwFD3x4YOBoeW6wzFVfK/TL2Cdaz4yrzY4SplFDAPi57/Uuk
   2+oxlwbNnBN1TqVKlSmtyz0GPUY4UVszfoTwOBJxr7/7jnBFObLH4uyPW
   lsnD4VX0FpEDYRNtYd4q1LaIwHDbtOM1eE9mro5QwfahZYyTmFLcpfLC1
   i2Ovk5cn2qsNdpsZQ5nuOF9pnb9vKJJP6kN38/Jxzj+W7OJVV7Mlf/aPo
   SpXl9gIUGfBXRpd8n+D9C47H9mDZbpGYp8gWZFliorOWOIzFFSm1WK8Bt
   HGtdGyfAneQ6owm5jVf1BS7S7fAJhmVBDTqPW8XJIDf6CQFIeB5D90CJo
   g==;
X-CSE-ConnectionGUID: ChhxxKTPQdK/i3lWqVr6EA==
X-CSE-MsgGUID: 9IUJ14kXRpidXF2W9X2Y3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="186491593"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="186491593"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D1505E8525
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A6BF6F310
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 361C26B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D84621A000B;
	Tue, 14 Jan 2025 16:29:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/30] libserialport: upgrade 0.1.1 -> 0.1.2
Date: Tue, 14 Jan 2025 16:28:29 +0800
Message-Id: <1736843329-4131-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--0.907900-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGMwNeg64CU4ua87CDXaKRVJ9LQinZ4QefCP/VFuTOXUT6C2
	1l3Lq9xrkwjHXXC/4I8ZW5ai5WKlybEil9qTYKmaKletQwdZHpT6SZzYuhK4Q7k+8v8CgSgjecu
	2o5pGb42/l7bX5SUTmj5S7bk6SeeuiDSFK1GnMZ9d8j3Dp3B60/r/b+dmSKFo6AH9/PcRd1xUpP
	R4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114853

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libserialport_0.1.1.bb => libserialport_0.1.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libserialport/{libserialport_0.1.1.bb => libserialport_0.1.2.bb} (83%)

diff --git a/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb b/meta-oe/recipes-extended/libserialport/libserialport_0.1.2.bb
similarity index 83%
rename from meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
rename to meta-oe/recipes-extended/libserialport/libserialport_0.1.2.bb
index 089d426bb0..71dc33da90 100644
--- a/meta-oe/recipes-extended/libserialport/libserialport_0.1.1.bb
+++ b/meta-oe/recipes-extended/libserialport/libserialport_0.1.2.bb
@@ -8,4 +8,4 @@ inherit autotools
 
 SRC_URI = "http://sigrok.org/download/source/libserialport/libserialport-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "4a2af9d9c3ff488e92fb75b4ba38b35bcf9b8a66df04773eba2a7bbf1fa7529d"
+SRC_URI[sha256sum] = "5deb92b5ca72c0347b07b786848350deca2dcfd975ce613b8e0e1d947a4b4ca9"
-- 
2.43.0


