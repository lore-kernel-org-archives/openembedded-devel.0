Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04370C83F0C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.56133.1751879234076487371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PIqLza2U;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879234; x=1783415234;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LYjqcgVV6lXYn399ZDdaaS/yWshLamGm6LevZ8iAH2Y=;
  b=PIqLza2UAq4Zd68s/uN6sMQu5B+nejxXru5bhwDjVBxA4gEsw4dM5+jj
   NJpcmbTQ6/A54n7RbV/04uwTYSNz5Nh2KiFHx9tBfGTvohMZibn+Y/LCr
   /Rt5q8GrHincqDukuc0uj2nBYAQrFBSC8QNDU+mbLtstFOWkEAYsG1Vqy
   9QS2vCCgFtAxZDxXSN4/4W5fcINbMHvP0B7ky9FTKLjU9HdgGsm71K4VU
   pOA18pgQeYqcUTeGaH/ynNyKOZZJ2EmxmnVK2BVVk9yJmBj8/q+tmMIyR
   +neoj/c4PBdHMcaCZjfvN6LKMg7jepB+Wcx/CryMBY3LBGg2zAMSzYW2D
   A==;
X-CSE-ConnectionGUID: qN4BDzWBSmu9LuGCXCj33Q==
X-CSE-MsgGUID: 8XSHDRblRTiP/BcLO/B42Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="193950569"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="193950569"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:12 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 91D9F8203D6
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:12 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTP id 15650C0183F
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:12 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 693F925B93E
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:11 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F13021A0074;
	Mon,  7 Jul 2025 17:07:10 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 14/35] libnet-dns-perl: upgrade 1.50 -> 1.51
Date: Mon,  7 Jul 2025 17:06:34 +0800
Message-ID: <20250707090656.1216-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118259

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Resync with IANA DNS Parameters registry.
- Add prototype DELEG RR package.
- Minor code and documentation improvements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.50.bb => libnet-dns-perl_1.51.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.50.bb => libnet-dns-perl_1.51.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.51.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.51.bb
index 05027f693c..48dba40a8c 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.50.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.51.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "c660500b9d96e5aa2b16d9f4260b6f9f05b5602d3c4bea0ca39b45bcd02ba993"
+SRC_URI[sha256sum] = "40eec0b2866c67b86505a1c79cbb4b131c98c0bb59f305aa48959c89093d4503"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.43.0


