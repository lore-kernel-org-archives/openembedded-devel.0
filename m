Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2451CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:21:08 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.262.1778646067948782725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p/2MX3yA;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778646068; x=1810182068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H2UPfqYKJMPMqSYXKfOGTQV7qsorDx/5Z3u62bd9KFo=;
  b=p/2MX3yAmERYZqcIehFnjAAAJTTxSOkp8aeJeureFISKcwa7D5NMlLOy
   /dww8FUGB/v8QU7OTxjbrOXeUCKxz3MRJCHsMiD+eqBcxtayfuNzbIylu
   clQEGreDDScCiskZE9gbNxGdvYDY5HliwuynD6USfpwlsSBKQ3VYfHbCz
   aF8+pHd+gHmC/uYaM2KEtpDoDtB01uZbzH/EQkV2gXgHJ3166Gk5gh/Xd
   Thw0/we0E9Mz9clJUBzuSdMijkcihSKbY15u2+L6uO/WK5ekd/xRo6o5m
   6HrFucxOLnyXPBRqs/M2eVxdOrW5bipVDP/kEQf9rYzy32ylnxNcSS/bV
   w==;
X-CSE-ConnectionGUID: mk6570qqTfqkJdv6TjBoVw==
X-CSE-MsgGUID: cX97EjgrTTScPOVxlsa3yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228216596"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228216596"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:21:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 64CBE42A310
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:36 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 14F9D1802ACF
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:20:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8D6C314001C7;
	Wed, 13 May 2026 04:20:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 51/56] unbound: upgrade 1.24.2 -> 1.25.0
Date: Wed, 13 May 2026 12:19:47 +0800
Message-ID: <20260513041952.450-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041952.450-1-wangmy@fujitsu.com>
References: <20260513041952.450-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126939

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.24.2.bb => unbound_1.25.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.24.2.bb => unbound_1.25.0.bb} (98%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb b/meta-networking/recipes-support/unbound/unbound_1.25.0.bb
similarity index 98%
rename from meta-networking/recipes-support/unbound/unbound_1.24.2.bb
rename to meta-networking/recipes-support/unbound/unbound_1.25.0.bb
index e41e2dc065..8e0d3f346d 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.24.2.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.25.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://run-ptest \
            "
 
-SRCREV = "f6269baa605d31859f28770e01a24e3677e5f82c"
+SRCREV = "25fe6020248df41f891c921b254cf91d3d55f194"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 
-- 
2.43.0


