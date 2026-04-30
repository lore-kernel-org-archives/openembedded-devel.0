Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBEDFFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:46 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17433.1777546184395626817
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pnpCH7SK;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546184; x=1809082184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HClWMzZMIa9fwFSa+KsmRpInCXPMw7EfuD/xv00P75g=;
  b=pnpCH7SK4lXa/RFu7wzkvYXXn1NEOJU34HJ/REe9XGlaNnZ7/9Jg5p2M
   Knwj62GX9N8q1N9Wp9EJ6/CigivKGccDgP2i93k7LKzxdwZM0BhUm3EdT
   86f+p7p0++R4Qtg9EiQLyENsL66Q/+xI7zDe5433DGssp0UtEEmIXX/Or
   LeHldTGRzEhANR2TFntYvaZU+IpRtW4wRviOju2B06gLbvzQsUcMC0hWO
   1MAxCmegxEB0i/llFQPL9L2QFiyQOHmhmo9BJ/lp32QKiAqrtCbRc6ltl
   5uCe6es9Muo3geh8z844rrxN2exJQJe+qPfwka7pUAT/6Mj7HjCxyACQ4
   Q==;
X-CSE-ConnectionGUID: 0sbiOz4tS5ajBUtdBz2IHw==
X-CSE-MsgGUID: mwuq9tmITBaYHmVeuZ6AKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636920"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636920"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:43 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 807078203CA
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:44 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 39A3092674F
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id CCD7C1801137;
	Thu, 30 Apr 2026 10:49:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/64] iceauth: upgrade 1.0.10 -> 1.0.11
Date: Thu, 30 Apr 2026 18:48:29 +0800
Message-ID: <20260430104924.1106-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126679

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- meson: Add option to build with meson
- gitlab CI: drop the ci-fairy check-mr job
- Improve man page formatting
- Add --help and --version options

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{iceauth_1.0.10.bb => iceauth_1.0.11.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{iceauth_1.0.10.bb => iceauth_1.0.11.bb} (79%)

diff --git a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.10.bb b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.11.bb
similarity index 79%
rename from meta-oe/recipes-graphics/xorg-app/iceauth_1.0.10.bb
rename to meta-oe/recipes-graphics/xorg-app/iceauth_1.0.11.bb
index 7d025de4c4..d10d9d2cfb 100644
--- a/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.10.bb
+++ b/meta-oe/recipes-graphics/xorg-app/iceauth_1.0.11.bb
@@ -12,5 +12,5 @@ BBCLASSEXTEND = "native"
 DEPENDS += "libice"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "3deefb7da26af9dc799b5628d929d91c9af68c78575639944db3b955f29aa029"
+SRC_URI[sha256sum] = "9d633cf0d4d1d98e3ef02d18660372958b60a67016e8a72cd04093a8d8f8d4e9"
 
-- 
2.43.0


