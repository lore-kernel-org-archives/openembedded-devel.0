Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C51EC44514
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:33:01 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9541.1768995175091360328
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:32:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p00Dmf1b;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995173; x=1800531173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N9IbyUPvs+a2oglbouihDr/JAUWN1gCn/1wXbjohy4Q=;
  b=p00Dmf1bIuQ+ewN4idSOkGsOKBdAsXfDi4G4eBSoyvTw9kqPk8UghPr2
   OxRBNOTtpx/6qYknCmk5q2hYRKmSsBnmdeDGQmaqY+Pn8psEbF44vkLoa
   KDOQXSbERSqKaBnCKAwt+o45M7Zy1Et4yvNevAcl7IC0J0KKpb/AK32SR
   7FgyFicCm7M9hgcOdUffnczjt8H7IXkj8awU8sdRwMzT8iolDxkO5pakK
   0J6eCPR0Yq34hKIs8ChZefORzkCwjX+RmCgztshl65az4t78TwADKV0xB
   uuV8yj70nBpjaZoxO4jQLgX7vL3hLLrBLsUVV6DO1dYFBtwZ+bVp2HHuT
   w==;
X-CSE-ConnectionGUID: oSB42uPrT0ysD8ApnJudDg==
X-CSE-MsgGUID: mXn+l6TKRme406EFWFcGZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="205395421"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="205395421"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:32:51 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 0FE6B1000355
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:53 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AD9B4C021A7
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1B9F5140486F;
	Wed, 21 Jan 2026 11:32:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 24/30] dnsmasq: upgrade 2.91 -> 2.92
Date: Wed, 21 Jan 2026 19:29:15 +0800
Message-ID: <20260121112921.857-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123715

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnsmasq/{dnsmasq_2.91.bb => dnsmasq_2.92.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.91.bb => dnsmasq_2.92.bb} (98%)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.91.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
similarity index 98%
rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.91.bb
rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
index 25f2d4c09a..59509ecba2 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.91.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.92.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
            file://dnsmasq-noresolvconf.service \
            file://dnsmasq-resolved.conf \
 "
-SRC_URI[sha256sum] = "2d26a048df452b3cfa7ba05efbbcdb19b12fe7a0388761eb5d00938624bd76c8"
+SRC_URI[sha256sum] = "fd908e79ff37f73234afcb6d3363f78353e768703d92abd8e3220ade6819b1e1"
 
 inherit pkgconfig update-rc.d systemd
 
-- 
2.43.0


