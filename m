Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889B2E75446
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:14:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117715.1766567683859837999
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:14:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=obauHLO3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567683; x=1798103683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2uHP+Io9SDzE7Tq98IBoJubWyPTWWH6THXkdZZxqXfM=;
  b=obauHLO3k8K5xfJm6J1l8ZjKtdROVIYyHILeuWOrNuKlNKN+M9D3CeTm
   hIvKB5s6xSAtgix6u+Y5hlsHDgX73Emt8IOWgNNIKGDzEXBdDEnPZG5md
   z6pwLa/6MibN022V1imvzrFG0ihMgiWu+oTfUDeZNZZOZuY7q6sMoSBu7
   rgY3nQPMdF2Z/JyenMcxZ0yRbY0tuKdsh0n0OoIohKbHdNPtHUYELH5Xh
   /pK47lg8uErPlqz0Dabui1DjIWKsqpm34I+/XUXAVPdAN2sY03H7RAcpZ
   hKYwTQrAA+1iximShSpJPSGIv1ZNsFPpLtt3CL1GvS2gWTQsMawU0Jgmu
   A==;
X-CSE-ConnectionGUID: MicwZ1dqSSypfEGyMVDi7w==
X-CSE-MsgGUID: qlOmNA2SR/+2s3Lq3C6rdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="202625889"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="202625889"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:14:38 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 881AB1000341
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:38 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 382A31803208
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 84DF8200076A;
	Wed, 24 Dec 2025 09:14:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/28] python3-sdbus: upgrade 0.14.1 -> 0.14.2
Date: Wed, 24 Dec 2025 17:12:59 +0800
Message-ID: <20251224091304.974-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122874

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix segmentation fault if export handle outlives the exported object.
- Fix some tests failing on slow systems.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sdbus_0.14.1.bb => python3-sdbus_0.14.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sdbus_0.14.1.bb => python3-sdbus_0.14.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sdbus_0.14.1.bb b/meta-python/recipes-devtools/python/python3-sdbus_0.14.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sdbus_0.14.1.bb
rename to meta-python/recipes-devtools/python/python3-sdbus_0.14.2.bb
index 36af5fd22d..532349dcbe 100644
--- a/meta-python/recipes-devtools/python/python3-sdbus_0.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sdbus_0.14.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-sdbus.readthedocs.io/en/latest/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "424364e03853817398aa31c945aeac8f681f012c7bf808e73f60e7365ff54251"
+SRC_URI[sha256sum] = "4f5d13b196e1e1de35311ebb2563a32de791451a30f5b9a4894528ba98766412"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS += "systemd"
-- 
2.43.0


