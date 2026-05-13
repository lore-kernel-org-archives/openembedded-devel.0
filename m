Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F47DCD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:09:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.113.1778645396019237712
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iWMGz4Rz;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645396; x=1810181396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T81UmqBakhdiU7pqcBh+D0rHaxiHP2n2BdjdpY15R8c=;
  b=iWMGz4RzVdr6pMWBxzI2HyD1Szqx0aqTVkYoUmact5hQrbWj4LDfC9eN
   Km10haLCoPQaAioBK8MFALqpv9HHeSjtyXmHTxqSNEcp418uGfSGDOQMd
   EpF3ov0XpNE5Fl3E5XR8Ns23aHLoaOtwz8ZCyzvCSeiT6V3jB0LG5fKkP
   gUQpjfZy6tJKC/6CoBHXZhAXiMXGwqnbumqlOYfH8rGZ4RgqfZjvW+W7f
   f5D8xUSx7bsM7nM/HXE6pNv0m3lICzqrxOLsXCxrwh24yJBjEjhh5OQKx
   +3waq+7is6lJWuXx9U+Cj4fHhTii2czehfE9B5dDwSh+JkgtMXHgPGdX2
   Q==;
X-CSE-ConnectionGUID: igAFoFDBRlSIzQk+hB2OYQ==
X-CSE-MsgGUID: x5hxZLw+SqCO5kLscC14kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228213909"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228213909"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:09:54 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 785E71000340
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:24 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 2BC131004160
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 98AB914000AF;
	Wed, 13 May 2026 04:09:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/56] libsdl3: upgrade 3.4.4 -> 3.4.8
Date: Wed, 13 May 2026 12:05:16 +0800
Message-ID: <20260513040555.377-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126904

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.4.4.bb => libsdl3_3.4.8.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.4.bb => libsdl3_3.4.8.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.4.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.8.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.4.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.8.bb
index 0159021280..34211a88ee 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.4.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.8.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "ee712dbe6a89bb140bbfc2ce72358fb5ee5cc2240abeabd54855012db30b3864"
+SRC_URI[sha256sum] = "e9fff7467fb60f037e6708da18b25560649e4c63edc2a69bb871b960d9cbfbba"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


