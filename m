Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DE9C27C7A
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 09:07:11 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.9834.1717664825105557901
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 02:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DZ8mRjLf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1717664831; x=1749200831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RZ7rKCGS6rcug/c8G2uzS7SJ8BAoLaf4gZ8w8nZjOIQ=;
  b=DZ8mRjLfupKuPQvlLQiDE0qzGjxSeLBiaCgtTyoQVgnz6UhCz2sHkfIQ
   0F9yjkb8NNpKDPgzbMjnA5dlmQevakv/nbyrPtiMwe34EB6WNBl58NW+P
   g5BLAu9fKsk164+kAXUTaQ+alOWnXWkQtfbKZOvigY3OPlhrY5WmzJU43
   bV0zZfFzxmRzipqxep4XZydrs2xIIHDDKFqmanwhICVQ1NKjr6qOr+aln
   vEI3UhIAMyU/OgkHSGKRyGlksLMzJhxaveVyVdtFOezVOPti0VWjTV/nF
   +P1LAfnnLEV0Bna6oEbpCvEhjZA2XcY/e/3deoFx7df2/e8Msrcs212ay
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="162245370"
X-IronPort-AV: E=Sophos;i="6.08,218,1712588400"; 
   d="scan'208";a="162245370"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:07:10 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99BCDD504F
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2D3413F58
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DED1401D8
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Jun 2024 18:07:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2B9A81A000A;
	Thu,  6 Jun 2024 17:07:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 33/36] pangomm-2.48: upgrade 2.50.1 -> 2.52.0
Date: Thu,  6 Jun 2024 17:06:32 +0800
Message-Id: <1717664795-13902-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
References: <1717664795-13902-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28434.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28434.006
X-TMASE-Result: 10--1.991900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNSHCU59h5KrHpKYVp5Qz2967DmE7ja1ybo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKnh+ME2Z6Opni5ftPxzjfdpHOvXu1KFLEBR8
	4EJZc77qktpiCnrnoMboyBYHkzhmoDLj9XDRvqmpeXmtZ7zaKd80CKA8dYoUv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Jun 2024 09:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110740

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* FontFamily: Add property_item_type(), property_n_items(),
  property_name(), property_is_monospace(), property_is_variable().
* FontMap: Add reload_font(), property_item_type(),
  property_n_items().
* Require pango >= 1.52.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pango/{pangomm-2.48_2.50.1.bb => pangomm-2.48_2.52.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/pango/{pangomm-2.48_2.50.1.bb => pangomm-2.48_2.52.0.bb} (84%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.52.0.bb
similarity index 84%
rename from meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
rename to meta-oe/recipes-graphics/pango/pangomm-2.48_2.52.0.bb
index 86787a6b7..3b0fbd3e7 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.52.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "mm-common cairomm-1.16 glibmm-2.68 pango"
 GNOMEBN = "pangomm"
 inherit gnomebase features_check
 
-SRC_URI[archive.sha256sum] = "ccc9923413e408c2bff637df663248327d72822f11e394b423e1c5652b7d9214"
+SRC_URI[archive.sha256sum] = "34a134126a6484ff12f774358c36ecc44d0e9df094e1b83796d9774bb7d24947"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
-- 
2.34.1


