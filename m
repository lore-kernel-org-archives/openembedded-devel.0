Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DF8D0C822
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56067.1768299862472320355
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nkCoSpzV;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299862; x=1799835862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pmq/JrbD8KhGXrJIXwSWIV/BAaWRo1LrG5qVPWTMnqE=;
  b=nkCoSpzVF2ivClT5hxHpwQnfnh+ruNzjgkhdij1gK87tnahTEZr9kQC3
   Zz36EyCxAd9IRXtVuGndCknQzXLA+Oxj+Oc7gWhM3s+kaRxFzFdlFFqAV
   y6r3KVqYmJMRlm/vc35AMry+On9TutCkZ+mHNbk6BlYcCXYQLx67lqHD4
   mV6EjAAD2Mre65yRhIXRGU0wXpwNLQksjBsG8XAQARyN1zhnU/o0tuFC+
   S/IiFTBdWJys12V7yVKH+ER0aawwoHLDmTbgsJcbdXPfJUOH1eNdVxU+3
   cp2+cxju2vApUgbeze2Jydab/Tn4AEu+Km8acVovHOe743OEXdmun09HW
   g==;
X-CSE-ConnectionGUID: itawS8iJTdarcEEid1VzAw==
X-CSE-MsgGUID: llf5uEnARfOQbz5PrIoj2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="226265758"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="226265758"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:24:20 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D5D324DE6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:20 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 90F671C0017D
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E5C141019045;
	Tue, 13 Jan 2026 10:24:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 06/22] libcloudproviders: upgrade 0.3.6 -> 0.4.0
Date: Tue, 13 Jan 2026 18:23:18 +0800
Message-ID: <20260113102334.605-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123412

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Add dependencies to the pkg-config file
* Replace gtk-doc with gi-docgen
* Require meson 1.9.0
* Plug tiny memory leaks and reduce memory footprint of the library

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libcloudproviders_0.3.6.bb => libcloudproviders_0.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-support/libcloudproviders/{libcloudproviders_0.3.6.bb => libcloudproviders_0.4.0.bb} (76%)

diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.6.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.0.bb
similarity index 76%
rename from meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.6.bb
rename to meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.0.bb
index 7ea7c50462..f0a0e36022 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.6.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.4.0.bb
@@ -8,4 +8,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gobject-introspection vala
 
-SRC_URI[archive.sha256sum] = "3b75110b3a4fdef4c5c5a440e48701fe054d2ae061d156c89136bb5ba05e74b7"
+SRC_URI[archive.sha256sum] = "247b228d1027b2683868e7d7080d38693a457e908aadd0c119d52de59a398064"
-- 
2.43.0


