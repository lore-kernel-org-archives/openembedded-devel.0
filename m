Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53587FD7F71
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92457.1772187293125646259
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k39otYZr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187293; x=1803723293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i/FB5Jw+e1uMxxyeUb8tDM+SFiTymT6E0rJL01MFvX0=;
  b=k39otYZrsWOfyls7euE8+oxwpCTOBM3uj6yk7sy/pnUljlibK7xy8vbl
   LKl79GunUj0COTyjHVLM1g5Ut4gnzO9ej4tkQXaE4NWBATpPdLzEd9pWc
   DvkEReimfTjR+QjJjNe4rM31DDWrkEOoP1ftg7SE6BxfQ466sbnDAbseF
   06UARop5WFl/NDqrIVlI+2DCG0L6ItFFJywhAdveq+FJ4S38Y6gL5DaLE
   iMIQw4AE2GoS8NKuNna3bvi4wDsdJpktghSon7n2/JD9s8sZle6NO1Mgb
   RQae85qSMD1uu5FtIj40/MVm7TgZk7acwJ1RsIBXIaII6okII3C3rT+NL
   Q==;
X-CSE-ConnectionGUID: LoF3aWkMTPKignv9ZyL2zA==
X-CSE-MsgGUID: 099qLhzbTXy42af0kxyWTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="230730666"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="230730666"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AD9761000340
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:51 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 63B831009E1F
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 79E6818005A1;
	Fri, 27 Feb 2026 10:14:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/52] python3-pystemd: upgrade 0.15.1 -> 0.15.3
Date: Fri, 27 Feb 2026 18:13:02 +0800
Message-ID: <20260227101327.1432-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124727

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix type invariance causing too strict typing
- Add E2E testing infrastructure using mkosi for running tests in a real systemd environment
- Improve type annotations throughout pystemd, modernizing to Python 3.10+ syntax
- Add AmbientCapabilities to systemd1 KNOWN_UNIT_SIGNATURES
- Improve README.md clarity, spelling, and grammar

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pystemd_0.15.1.bb => python3-pystemd_0.15.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.15.1.bb => python3-pystemd_0.15.3.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.15.1.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.15.3.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.15.1.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.15.3.bb
index 7698d6394d..b987007e39 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.15.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python bindings for interacting with systemd over DBus"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "f217b5792f1e7c391ae46262f43566b6f83364507eaab5d5e73fcd05ab12d2bb"
+SRC_URI[sha256sum] = "3533f6d287a1ffe39dbfffcf2f547454bb8ef7a169ac6a24e81f446ddb258802"
 
 DEPENDS = "systemd"
 RDEPENDS:${PN} += "\
-- 
2.43.0


