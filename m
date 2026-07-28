Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16578C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:06:59 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5764.1785218810579443964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HJXTnve2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218819; x=1816754819;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=df2EmRyS9R6FAv+abDpdzGXtNOckJcrLUdqTsDZ0ATE=;
  b=HJXTnve225hCSjGrQY/omW6YkZDcQ7AypZgJnRw8/Fbm3riicLLdSaxH
   QN9xF7ULLtNbuJ/Z7YQ5u20eR0iypvisLAVcs11nKczZdLvZ0iVt6e8BG
   DXdosViQ7EVlwjIqDEJVtKlmAd0W/atfpj1WxTclLQJVX3314H83guTmd
   IJV3VwEv6GhlLUloI2dvkgcsJGSWkOQ6w1hYGIKyevxa93Yyc0iUNLfFP
   yoJ0loOmyCSISZSgBY8UEgs5ZWhxXP+qxPjCI1KD4bAchfUTGGSUybj2D
   DM8WXMfq37Anv7ld41QwYYWEdMxtCUK4ho4NXcO22gbRGlQ324fn1yxxb
   Q==;
X-CSE-ConnectionGUID: p/Ue8pQ8Qea1MzjviBjUew==
X-CSE-MsgGUID: Os0MDVnKR9iuu6h58Dx58A==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="236797072"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="236797072"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:06:59 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A23341C00084
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:56 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 53D45C020AC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:56 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 93A8210005F4
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:54 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] libosip2: upgrade 5.3.1 -> 5.3.2
Date: Tue, 28 Jul 2026 14:06:19 +0800
Message-ID: <20260728060645.819-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128475

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libosip2/{libosip2_5.3.1.bb => libosip2_5.3.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/libosip2/{libosip2_5.3.1.bb => libosip2_5.3.2.bb} (88%)

diff --git a/meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb b/meta-networking/recipes-support/libosip2/libosip2_5.3.2.bb
similarity index 88%
rename from meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb
rename to meta-networking/recipes-support/libosip2/libosip2_5.3.2.bb
index fa99d33e1c..2de4f4345d 100644
--- a/meta-networking/recipes-support/libosip2/libosip2_5.3.1.bb
+++ b/meta-networking/recipes-support/libosip2/libosip2_5.3.2.bb
@@ -10,6 +10,6 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://src/osip2/osip.c;beginline=1;endline=19;md5=22ca0da0e41276c50c81b733953c208d"
 
 SRC_URI = "${GNU_MIRROR}/osip/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "fe82fe841608266ac15a5c1118216da00c554d5006e2875a8ac3752b1e6adc79"
+SRC_URI[sha256sum] = "16186f6f5540936b62c3aaca6e8409e1af25cd22abc3882b393be215f49d3b00"
 
 inherit autotools
-- 
2.43.0


