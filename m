Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B51DCAC59F
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.15057.1758015723129926724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pdSpXzNF;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015724; x=1789551724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2qsbOzO8MmNr7QerkZOqmmhANMCjGCN5uSsDhzF12LY=;
  b=pdSpXzNFp5KgIj5EV08INYYtisxRUYVzxb3mFzmbE/oijyIDqSYbMSzy
   tCLyc7G2O6SBdn/Rv5LNuSa6MPmVJN842Umj7PGME9xeLcd/PWsJzc9h3
   FggBRsAkXkLTKol/JpfZ3dWCjYJ1+PhkiK5nn8Rxrjt6vPaas8Sni/54r
   5AdiRkxQe3T0OhEKfWon6EKAtZxW9g7TGeT7J2M5Y4j1BOT+9jwZcfJfE
   9OvjpDqw/ZFQwm2bCQkufj2X9BtBsnjwPeAjT+913YqMr9Dt4CJsvq4Il
   ktZMq09JGUGFU0j0Hjr16jOdGs6w21wYdChLpB4Egs8fnxiRcc1Tu33AI
   Q==;
X-CSE-ConnectionGUID: QxBAGrWxQ/mpLT6v2gLxDg==
X-CSE-MsgGUID: +if31Vw1Q2iAD4GMs78eSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="216458827"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="216458827"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:03 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 245E342A30E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:03 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D23121C00124
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 42FEE1806763;
	Tue, 16 Sep 2025 09:42:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F5151A008F;
	Tue, 16 Sep 2025 17:41:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/42] libirecovery: upgrade 1.2.1 -> 1.3.0
Date: Tue, 16 Sep 2025 17:41:18 +0800
Message-ID: <20250916094152.1479-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119428

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libirecovery_1.2.1.bb => libirecovery_1.3.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libirecovery/{libirecovery_1.2.1.bb => libirecovery_1.3.0.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.0.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
rename to meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.0.bb
index 6049369290..4bbacbfa06 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.2.1.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libimobiledevice-glue libusb1 readline"
 
-SRCREV = "2fb767d784c01269a0ded5bacd5539aee3768c35"
+SRCREV = "23f201d13f2fad05f5096e254e104bcaf35fd607"
 SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
 
 inherit autotools pkgconfig
-- 
2.43.0


