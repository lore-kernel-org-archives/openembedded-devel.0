Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4223FCA0FF0
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.15381.1755679202592972223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IQyM5EFa;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679202; x=1787215202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WOlNSJuzAvChd0p4wD6iippDeQuYUrcIcW+G8TWskiY=;
  b=IQyM5EFaXcIOohzkKwSJCZwkcrpM5O/QPa3jPhb5czvn2GWx4uhbx5ic
   1dmqtyv+7d7Lss6GPHO4IR+oxZsEiYfBjObSY8Q5V2pk3lJX6OukHVWo6
   +xzrUG2zkX1a0RLdY+0e+lYglwcfasnphgEWuoJjnkIX1aKxK1GxQoiUy
   Lx3bZpMBILa3y1tB8MXCsileM24ZSey3F7XGm0yiD2DSKdXUw1UEBJwuV
   wMFMYk/ki75cQ78ovbC2zfklgQ4PcBtyY8oP2Z8yhpXtTFzJ4AXfwqlWj
   3GpA0uLCekUpFySey+OHj0tJRL4K6v2Ek3YfwYBHaT/ruzugFYE9tHDvy
   g==;
X-CSE-ConnectionGUID: ADvYfij7TOSmLk9PsRqyCA==
X-CSE-MsgGUID: HtxMscUDR9CD4Z9cLYelDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="188901707"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="188901707"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:40:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id DD7581C1C702
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:00 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9A73B8D65E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id AB27B40769A
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B7D061A0071;
	Wed, 20 Aug 2025 16:39:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 07/26] libdaq: upgrade 3.0.20 -> 3.0.21
Date: Wed, 20 Aug 2025 16:39:26 +0800
Message-ID: <20250820083945.802-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119020

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 api: add support for handling DIOCTL_SET_INJECT_DROP

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.20.bb => libdaq_3.0.21.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.20.bb => libdaq_3.0.21.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.20.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.21.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.20.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.21.bb
index e74763ecd6..bd4ea4b8dc 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.20.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.21.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master;tag=v${PV} \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "ec9741c22f74b6ed8955b5f1fb4113775d4df0d4"
+SRCREV = "e48649648790e4e2ead7fe4ae1017f911b1cc177"
 
 
 FILES:${PN} += "${libdir}/daq/*.so"
-- 
2.43.0


