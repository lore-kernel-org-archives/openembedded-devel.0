Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1B510A3D78
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:25 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46438.1774526295011502153
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eTNCV1XD;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526295; x=1806062295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uvPdHVe1k6V0fGLgYHD3l9ohXCS3jg3tgn1zI4TGEaA=;
  b=eTNCV1XDzjKd8ilVYPHaXVjts0EQRQBd3l4JtO0uwok08olDF27y1qm5
   OHhuqrlBn//9RSBYJVJ32tv4S7QNQPUEL+9A3+EzUDsL0sP1cT1m0DXDh
   buxTbZ9cILpxDG37JzpFp/j/C6+otHEyweTJlpLzwXyJLnKLagLm8J02Z
   ocHnNqesaGpUcietyWcEe1DuuMJCKcBOUxt/TC7pZxxGOezebhNoctsxn
   pQax8BcXeI4Yi+h2NHskU0Y7Iw6BLTcLU6hB2Z9xjSHdxjlUc62yo6KU9
   uYFwEWMRqfGyY6jMi8lzAO+/LU3dIwDyCHXWPbyEvbP9Sywbf281kttTj
   g==;
X-CSE-ConnectionGUID: jLfqj6/NT9eQz2FJOx2XEA==
X-CSE-MsgGUID: 3ScOJnzDThCqa0+Ru3PCng==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222647337"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222647337"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:13 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6ED3A1C1C702
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:13 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2814D181AA4C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C5EE21807148;
	Thu, 26 Mar 2026 11:58:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 58/63] rtorrent: upgrade 0.16.7 -> 0.16.8
Date: Thu, 26 Mar 2026 19:56:28 +0800
Message-ID: <20260326115634.1199-58-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125713

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added dns cache
- Fix crash on double scrape request
- Use callback in DnsBuffer result and catch EINTR in Listen
- Fixed various SCGI issues

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rtorrent/{rtorrent_0.16.7.bb => rtorrent_0.16.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/rtorrent/{rtorrent_0.16.7.bb => rtorrent_0.16.8.bb} (89%)

diff --git a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.7.bb b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.8.bb
similarity index 89%
rename from meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.7.bb
rename to meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.8.bb
index 0ec048dcf5..9fc6f1e5e9 100644
--- a/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.7.bb
+++ b/meta-oe/recipes-connectivity/rtorrent/rtorrent_0.16.8.bb
@@ -7,7 +7,7 @@ DEPENDS = "autoconf-archive libsigc++-2.0 curl cppunit libtool libtorrent ncurse
 
 SRC_URI = "git://github.com/rakshasa/rtorrent;branch=master;protocol=https;tag=v${PV}"
 
-SRCREV = "7ead88448b8068c6737a975604884f96f6ae498c"
+SRCREV = "39f186e523f6ea2e72a3715a72d6e9ae4081ed84"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


