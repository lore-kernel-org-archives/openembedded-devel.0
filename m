Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF5BCA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7939.1756890232276940491
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UZIUr//w;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890241; x=1788426241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+17rhSLGQmXV+lE5hwD6adLKeupzoKefeNDQzCm08UM=;
  b=UZIUr//wf7o4jyp7Cpb8myEd4cmqOYjoeyjj1MI1bSRV9GbZRBOA9XDF
   E41XaFf8nPgs75Q1Byjih0BjcGSUi1OHSV7qcwQAXGI2dadd2DsJO7Csx
   CYKylhqFRLa/uGfJdnzogw+lx+43g3VCCDo3q951gFeVQo0BVOiIjqeaw
   tDDEH+pE2ZXo/puctva9h5ZzYOy6nnsfoC8mtg5HlSp0TkUgTgwQKZsOe
   CBskujrhr3cBK4jRfer1eHcY4ALwRm5+dx0/LswPXcSk3wsByIr5UDcVT
   o/KXE7vF8eSQIfdEVuGcnSMXex/vTDoN97am53GVY7VX8MyfGl4oDX5Xz
   Q==;
X-CSE-ConnectionGUID: 5FrcIYLiTpGBdDzyl254vw==
X-CSE-MsgGUID: 2Idk2PnnSGGX1xMMOcM9aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="199987498"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="199987498"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:04:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 8826D1C1C71B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 39DDC8B67B1
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id ED1BA1001510
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E5D261A007E;
	Wed,  3 Sep 2025 17:03:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/56] python3-ujson: upgrade 5.10.0 -> 5.11.0
Date: Wed,  3 Sep 2025 17:03:15 +0800
Message-ID: <20250903090317.2002-54-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119251

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-ujson_5.10.0.bb => python3-ujson_5.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.10.0.bb => python3-ujson_5.11.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
index 9832a4fe40..95199de839 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.11.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
-SRC_URI[sha256sum] = "b3cd8f3c5d8c7738257f1018880444f7b7d9b66232c64649f562d7ba86ad4bc1"
+SRC_URI[sha256sum] = "e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c12eb8b991fe2010e0"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 
-- 
2.43.0


