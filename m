Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECB5C43602
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:11 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17260.1782811382361875305
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BrvUII+9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811382; x=1814347382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LOGPwpxfGNcd8gA1r4GBdUaWv723Vw0aNJKtBDj1gKs=;
  b=BrvUII+9s+SojY4IPfUW6ZKitupC/SrXVV7jpcZBLCxti7uzPlKHWxAc
   kxet1xGoCt0JYsRvUFRliNt4m0+sVd78ocLigERwIa0xTtWVUTGMw75G2
   sgr1yA/LeIXYVq31QDzHG9svs8wrUxvd/H8qEzyIkIi+Y9MVaGZTjk6Xp
   K4DomRjRGxic0DQ7WExjqfeeMk3D1YhPmX4aq3IOj9eQwN/dz9hvAUPug
   eJEcSkzvvnE33Cx8J/I5OCOt3ihdbmh9PqQtjsu/h/COaVKhSRgVfxknx
   9TM324CIJrOSLZXPjxtHCgEiFHD3GYWmSoSK8BUMwZlTiONFGCMGEOWHW
   Q==;
X-CSE-ConnectionGUID: kUi16OMfRGmXS5KVs81chQ==
X-CSE-MsgGUID: cp46VLwJSyySPXJKx9Q8ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233776277"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233776277"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:23:00 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ADE771C000D4
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:00 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5783B1C28511
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7EC3C82DDC0;
	Tue, 30 Jun 2026 09:22:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 32/37] rasdaemon: upgrade 0.8.4 -> 0.8.5
Date: Tue, 30 Jun 2026 17:22:00 +0800
Message-ID: <20260630092206.322-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127974

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* rasdaemon: Add NVIDIA non-standard CPER decoder (Vera and Grace)
* rasdaemon: Add Intel Diamond Rapids, Granite Rapids, Sierra Forest, and Clearwater Forest support
* rasdaemon: Add Zhaoxin CPUs support for MCE record events
* rasdaemon: Fix uuid_le() buffer size calculation and SQLite API return code checks
* rasdaemon: Allow built-in or modules EDAC in status checks
* rasdaemon: Add RERI handler implementation
* ras-mc-ctl: Consolidate error counts by DIMM label
* ras-mc-ctl: Fix signal events query column
* ras-mc-ctl: Fix mc_event_trigger.local reference
* ras-mc-ctl: Correct --error-count alignment output
* ras-events: Fix event file endianness handling
* ras-aer-handler: Add support for AER triggers
* tracing: Address deprecated /sys/kernel/debug/tracing path
* ras-page-isolation.c: Clean up compiler warning
* types.c: Add missing newline at end of file
* Documentation: Update README.md and SECURITY.md

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rasdaemon/{rasdaemon_0.8.4.bb => rasdaemon_0.8.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/{rasdaemon_0.8.4.bb => rasdaemon_0.8.5.bb} (96%)

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.4.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.5.bb
similarity index 96%
rename from meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.4.bb
rename to meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.5.bb
index 0024729a91..750a6ea227 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.4.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.5.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "https://github.com/mchehab/rasdaemon"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
 
-SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https;tag=v${PV} \
            file://rasdaemon.service \
            file://init"
 
-SRCREV = "5a1efb8f324498df8cbaaa5adff0e9db96f648a9"
+SRCREV = "769593be915b4f00a9a7d56569df99bc0cff249a"
 
 DEPENDS = "libtraceevent pciutils"
 RDEPENDS:${BPN} = "perl perl-module-file-basename perl-module-file-find perl-module-file-spec perl-module-getopt-long \
-- 
2.43.0


