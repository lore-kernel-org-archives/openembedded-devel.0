Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A96BC54E92
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.16220.1747731316586528812
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=joky2kX0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731317; x=1779267317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kx+WXzu7Y3Macw9Mr4s9d/YvumdFIEKgPW98NO10irU=;
  b=joky2kX0eHMD9LIsqYFzfiypoo/ghrqV4TcDJxeoMdPvKStcUMYT3/Ee
   bDEbkWlr5VyJ1lOaqKD380YOoL2rqHkD/FB+bnvQKmhHQuT4oMok5nRXa
   3K59yBY0UOn9wUwq//bIvqWcbnipE0DC57gWgey4nXtpcDgj5JwHNTlkP
   U9EPOacNPPVcbROqMBNXnmqlbqsWl1uY/1Q4iIzd2a4v9R0TB4jdmlm11
   ZCmHgZ0zmt87+nL+eA+3oGFn58SYHXRSSZxWe6Sx7FX87mKjl6B/tod/r
   0AHQQjp/crBB5Qalkui/aHgxZHjo8XPFj6gl2MURoJFIcYB6IHTuoN/nl
   w==;
X-CSE-ConnectionGUID: kmJEirlZS5i8GEMBxp/7CA==
X-CSE-MsgGUID: JcfdT5/4Q9KBHZUAMDO00A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="179533922"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="179533922"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:15 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C6782D4C2E
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8615CD72BA
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1CF421A0078;
	Tue, 20 May 2025 16:55:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/27] libsdl3: upgrade 3.2.12 -> 3.2.14
Date: Tue, 20 May 2025 16:54:41 +0800
Message-Id: <1747731299-20448-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117490

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.2.12.bb => libsdl3_3.2.14.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.12.bb => libsdl3_3.2.14.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.12.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.14.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.12.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.14.bb
index 38c1b12807..9073a3c276 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.12.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.14.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "9734f308e130c64a2b4df6bca5884c5aca577ee6c7c77ab3379474ea85e51f96"
+SRC_URI[sha256sum] = "b7e7dc05011b88c69170fe18935487b2559276955e49113f8c1b6b72c9b79c1f"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


