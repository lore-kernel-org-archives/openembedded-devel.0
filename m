Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EFECCD19A
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8421.1763456939042864076
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:08:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Cw94t1AQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456940; x=1794992940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I7bCf5E0Yh5R4Tat3oftNRraEWFAZqZf+wmeC+MTIH8=;
  b=Cw94t1AQ0Sdjo96I/2s8Zugl/bfRec1k6RSFONiT+ipi6WeFVefI6iBC
   ovNeGTMshFyAK/oTGNvxJNlWiqda85whnKG9QKxcua/efs1/aOiMkvIwd
   PKzgNr9orH1ML61pG8f4XSvUK3M7faT3klepZDhEPhGrkAXIwISFYLr4E
   4lt0rNeOWK5EtRAvyDiFFHlLXWwx7hTh2PEWE4oaGY6hAD0m55sz9Q1tw
   NAiIMtxRcao/+DEhynnR+HQkep68JoAnjtWi0KiMg+e3S7j0ejFvW0/nN
   6IDSVtfZsqH4d4YlKwQxQtb0LvsDUX8E01DUtyVNJkpC+YPDOMEhg+rcT
   Q==;
X-CSE-ConnectionGUID: YyjaSvqnTBeiDmj4HqTHvw==
X-CSE-MsgGUID: 7sOQcJ45RAygWT6jT7witA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="219577881"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="219577881"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:08:58 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 545F71438
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:57 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0E90B10000FA
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:08:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7F2C214002E5;
	Tue, 18 Nov 2025 09:08:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/29] drm-info: upgrade 2.8.0 -> 2.9.0
Date: Tue, 18 Nov 2025 17:08:20 +0800
Message-ID: <20251118090846.1484-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121814

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../drm/{drm-info_2.8.0.bb => drm-info_2.9.0.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/drm/{drm-info_2.8.0.bb => drm-info_2.9.0.bb} (87%)

diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.8.0.bb b/meta-oe/recipes-graphics/drm/drm-info_2.9.0.bb
similarity index 87%
rename from meta-oe/recipes-graphics/drm/drm-info_2.8.0.bb
rename to meta-oe/recipes-graphics/drm/drm-info_2.9.0.bb
index f94611a79e..d309d71277 100644
--- a/meta-oe/recipes-graphics/drm/drm-info_2.8.0.bb
+++ b/meta-oe/recipes-graphics/drm/drm-info_2.9.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
 
 SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "4dbc230d3236215198954e9284cdb2c5933f8f22"
+SRCREV = "67a49ad122e8fa5c85430a8e22f20b7f56e750d5"
 
 
 inherit meson pkgconfig
-- 
2.43.0


