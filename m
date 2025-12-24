Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571E7E75435
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 09:13:40 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.117697.1766567615328372461
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Dec 2025 01:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jAhL7tI0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766567615; x=1798103615;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bmIovkVJv0F+/MBTOyAcsP9B/klfABR65UGtXF+1nJA=;
  b=jAhL7tI0/MpMYZrHleebbVmILxDt/IuJEC9tqD20yv57+DVCbYotXTyV
   LDIfUeosckO4L4uB8EPQFCtZJi7NUw57Z5L5aw4xwv0VIu6Iq7jEWJt27
   cpoWE0phtCeurbxRMh5uQBmakFUeoSRhWQ1OIW3vKuoziF1Wouc9fR8lf
   Am0t7AyFCejPzj0jBDrAJnEKCtDPRBapmd9ox6YrpdtLWfSUZMfMm6ao/
   46erUuC5iC3vHeolv5BVRnRQyxgNoGdQcyIvAH/8BU/NDxgGE7+//octY
   PW8xA1QrHTmdryMts5tB+B0cNegU5FNe9Fvv7BpwOfc/pUEqunN4YHhKS
   A==;
X-CSE-ConnectionGUID: 1aUfjVAMTYmlnc0xeFdjEQ==
X-CSE-MsgGUID: Yg/wTLZhTquY0uNilF7xSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="227738195"
X-IronPort-AV: E=Sophos;i="6.21,173,1763391600"; 
   d="scan'208";a="227738195"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 18:13:34 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id A115E1000341
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:33 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 56BCDC02195
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.254])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id A10E62000761;
	Wed, 24 Dec 2025 09:13:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/28] libdecor: upgrade 0.2.4 -> 0.2.5
Date: Wed, 24 Dec 2025 17:12:41 +0800
Message-ID: <20251224091304.974-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251224091304.974-1-wangmy@fujitsu.com>
References: <20251224091304.974-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 09:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122855

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdecor/{libdecor_0.2.4.bb => libdecor_0.2.5.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.2.4.bb => libdecor_0.2.5.bb} (94%)

diff --git a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.4.bb b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.5.bb
similarity index 94%
rename from meta-oe/recipes-graphics/libdecor/libdecor_0.2.4.bb
rename to meta-oe/recipes-graphics/libdecor/libdecor_0.2.5.bb
index 8264b5b7ab..0fae3274c6 100644
--- a/meta-oe/recipes-graphics/libdecor/libdecor_0.2.4.bb
+++ b/meta-oe/recipes-graphics/libdecor/libdecor_0.2.5.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
     wayland-protocols \
 "
 
-SRCREV = "4d026d59edbf8e2e876c3f2c07c480f8840aa922"
+SRCREV = "149c6f0b05663aaa69fdf7f94be2483776d1a311"
 
 PACKAGECONFIG ?= "dbus ${@bb.utils.filter('DISTRO_FEATURES', 'gtk+3', d)}"
 
-- 
2.43.0


