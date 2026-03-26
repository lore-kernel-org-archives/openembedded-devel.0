Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29BF10A3D74
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:14 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45666.1774526280547053646
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JjEoBR6u;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526286; x=1806062286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CmgA2i3lP32D9aKXH6IftJ95XUQwxKTNoLNJBe74kRA=;
  b=JjEoBR6u2Apzzhctfqpn/clqAC8sKXMbUNIlFWWRHWMm5esYfEf/DNz+
   iDQ3/fJmLNXggPoUjqctu9OJ+GNSl0Yp5xGqZ3u1z8EZM3DpI9lrLvVgK
   3yghwjXR02SElxF3x/58SXxE33u+0XDbXnN5UvKFvhfIJN9RNrvs9+crF
   Su8PjV239LlncmMUx00YkGzlGUUWLY7FNHev7kOxpz3wvh5s/mdo3GQeQ
   IYNvea0l/0DUNiAhGbe1ITxk/KoErQEtc3HC61spTQBSpKu/6wM38dEP0
   GUhl03LKjZd4MsnXIE4/8gqymxQbZ1aG+Kx7hBBG/0yaP31VyUZPOyfAJ
   Q==;
X-CSE-ConnectionGUID: /WHDVyvRSTixrf6fo7VSrg==
X-CSE-MsgGUID: 8AoRdAiQQ2W5XG6w4WKfWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213717133"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213717133"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AF86F1C001BF
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:05 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 59CEE1C0029A
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id CEC151807164;
	Thu, 26 Mar 2026 11:58:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 53/63] python3-ujson: upgrade 5.11.0 -> 5.12.0
Date: Thu, 26 Mar 2026 19:56:23 +0800
Message-ID: <20260326115634.1199-53-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125708

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ujson_5.11.0.bb => python3-ujson_5.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.11.0.bb => python3-ujson_5.12.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
index 95199de839..a1539d5c49 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
-SRC_URI[sha256sum] = "e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c12eb8b991fe2010e0"
+SRC_URI[sha256sum] = "14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e8567c9675b8b13bcf4"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 
-- 
2.43.0


