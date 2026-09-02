Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2006AC624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:30:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9401.1788344999262133477
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PmD2VQqy;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788345010; x=1819881010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GXlVBCP1yl8LyoUd3bWVGPrk6sANx1G94iwSJARNXwA=;
  b=PmD2VQqy79AnXGGLmA7PIkJPO3sB8V5432eloxlA/hSl4NerV81IcEM4
   U1AfYP+ka+AXk/OojluHRoUc60SUv9N0HN3jNd0x+WLZKW/jRz1UwPEyc
   3mzTEl9rDJyw35d67KBBGpV2fF9GJ/MuBPsKhOyYterXNvXuLJNU8Av46
   AZqdHaDYZxC86E9TJvW2+ERP/YxkrZ494e3zwXpfZfTEsXg4qwS/YA/Ip
   GqjsIFGwwOQyGlpBU8rLW00I/SYdPoJiXws6pY0L1L+CZp/cGjdD5U+9K
   nSAbNxZEvkyxryGIrepbu6TolYFwsLt9V9tZjHf/Tqbhmudup7/t7n7/T
   A==;
X-CSE-ConnectionGUID: krbqppO0TqKfTfi9/I5GFw==
X-CSE-MsgGUID: 2lBHBE7BRwuZn0leXtXUeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="239767280"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="239767280"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:30:09 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8780A820C13
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:05 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3A7DE180026E
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:30:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 33F1F2000772;
	Wed,  2 Sep 2026 10:30:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 33/34] xclock: upgrade 1.2.0 -> 1.2.1
Date: Wed,  2 Sep 2026 18:28:59 +0800
Message-ID: <20260902102900.1296-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129692

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xclock_1.2.0.bb => xclock_1.2.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xclock_1.2.0.bb => xclock_1.2.1.bb} (74%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xclock_1.2.0.bb b/meta-oe/recipes-graphics/xorg-app/xclock_1.2.1.bb
similarity index 74%
rename from meta-oe/recipes-graphics/xorg-app/xclock_1.2.0.bb
rename to meta-oe/recipes-graphics/xorg-app/xclock_1.2.1.bb
index 4a63a85edb..8488b63ca4 100644
--- a/meta-oe/recipes-graphics/xorg-app/xclock_1.2.0.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xclock_1.2.1.bb
@@ -7,4 +7,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2356ccad6224ad00334a72040730eb4b"
 DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "410f0372f8381efd9a8282d8227122bab882d7cffe2f7f8f886dd9876d5fc875"
+SRC_URI[sha256sum] = "e326cac20f7ad2af5412b9c4b70b1c3d392e08cd3cc6246e0a77b7c3935a4851"
-- 
2.43.0


