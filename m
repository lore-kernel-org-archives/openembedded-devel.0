Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77A3CDB466
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:56 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7225.1782378102392819022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cgfgbdp3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378108; x=1813914108;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/HUc8Ghql+jSPwnxmSmqb8PFIlGNtwE1O6uTDuGDJLA=;
  b=cgfgbdp3uWi1yEmyFWYrndR4yx8J2MxzUMwnCT1SHgbYWJpJAaADVOrF
   xp5YfaXKjYsozBMbzzy3PP8zL4muHx12bYT+057v2F0/5XpZllvsgL+EO
   RbNXyWIWLp2R9NlZ0WuI4zWvxNbkq2nTMGYonuZOte9IwJnc24e4jImMp
   cA0t+VLuIvO60lzIrfsz9k//8R1pFGpXeGM3i+ktqIQWYV2PU1aMaIy+k
   lu8oxqSP55W4e6ZWidMKaje1u4ho/mAZ1n6riprbeKlAKzBGpgYLtHXYY
   tjZixQbeuzotfpCQ6c+7HTtJodEn7OVWMLtLAxqoTjAaCgbMB4G9SJ/X4
   A==;
X-CSE-ConnectionGUID: b89Q4NEJTkuje8Nr//sSZg==
X-CSE-MsgGUID: RO6qiWK1SHa3wIrJbNe9yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245302341"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245302341"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:47 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0F29C1002B87
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:47 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id BEA9EC0075E
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id C1FFA1017328;
	Thu, 25 Jun 2026 09:01:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 10/47] mdns: upgrade 2881.100.56.0.1 -> 2881.120.11
Date: Thu, 25 Jun 2026 17:00:50 +0800
Message-ID: <20260625090127.1563-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127742

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mdns/{mdns_2881.100.56.0.1.bb => mdns_2881.120.11.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/mdns/{mdns_2881.100.56.0.1.bb => mdns_2881.120.11.bb} (99%)

diff --git a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb b/meta-networking/recipes-protocols/mdns/mdns_2881.120.11.bb
similarity index 99%
rename from meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
rename to meta-networking/recipes-protocols/mdns/mdns_2881.120.11.bb
index 4bbf012b83..27bce6e484 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_2881.100.56.0.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_2881.120.11.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https
            file://0001-mDNSPosix-Rework-mbedtls-for-compatibility-with-mbed.patch \
            "
 BRANCH = "rel/mDNSResponder-2881"
-SRCREV = "ea3902cfeff86a04b4c684753c80e425edbd1a21"
+SRCREV = "641cdf73ef46e1824895cbc44ad8ac7647da2479"
 
 inherit github-releases manpages systemd update-rc.d
 
-- 
2.43.0


