Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CF9CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.15064.1758015739401197304
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rpwFGJ8p;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015739; x=1789551739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mP77YHHY8TtTs38nNs1ufawcPaD0ndGSrHFvvJzlX08=;
  b=rpwFGJ8pSXURmUnXRNsZp8O3cZv8d8tZfbwjwxn54XV1GlW3msYo7bQ1
   GV0oAoelrSGkGrUQzJvNFOxxMuT8IP+q7XYq3ArQ43Xm/WxXh6tkmI3Uf
   +pEImm/ndDlICysK6TQ3s34/lPLwyg3Z8P5awGdBMUUohsJNf3xT8xqyb
   s5d6taQcaVYxy3f0yKCOUDIDVH/3UyqiyknPF3213g5fHFWIjK6bFKVbK
   cFKlpclqa/21erMNr/aTdVHw1QpYBrC5RWNacx4ln35fenZEIhAiVVND6
   vNdMtCWsVnFnLgd58BORA7TWsUb5SZZCgPCRzBVs48cYffXCuIomxBz/E
   Q==;
X-CSE-ConnectionGUID: 1NUVgEevQAeLHkaDGl5v6Q==
X-CSE-MsgGUID: gmrcQ4KrS6yXetvuLxqz5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="201479453"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="201479453"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:18 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 047F21000343
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:18 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B06071800EA2
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 18220200348A;
	Tue, 16 Sep 2025 09:42:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8E92E1A0074;
	Tue, 16 Sep 2025 17:42:12 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/42] python3-wrapt: upgrade 1.17.2 -> 1.17.3
Date: Tue, 16 Sep 2025 17:41:46 +0800
Message-ID: <20250916094152.1479-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119458

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wrapt_1.17.2.bb => python3-wrapt_1.17.3.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.17.2.bb => python3-wrapt_1.17.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.17.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.17.3.bb
index 3a187f9386..68e356e23b 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.17.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.17.3.bb
@@ -8,9 +8,8 @@ SRC_URI[sha256sum] = "5f370f952971e7d17c7d1ead40e49f32345a7f7a5373571ef44d800d06
 
 inherit setuptools3 ptest-python-pytest
 
-SRCREV = "bcc1f26b2fe8fc962f5033c3a3a773425500789a"
-SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=master \
-"
+SRCREV = "99130c02842c87001f40dbe73e21934c0615398d"
+SRC_URI += "git://github.com/GrahamDumpleton/wrapt;protocol=https;branch=1.17.x;tag=${PV}"
 
 
 # python3-misc for 'this' module
-- 
2.43.0


