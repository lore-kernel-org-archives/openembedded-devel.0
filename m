Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D29FCAC5BB
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.15428.1758015733122644992
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TH3jZdg9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015733; x=1789551733;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=51C954HiTh5il9b2EvblaMkf7d/TzyBtsoTyOg0J2vc=;
  b=TH3jZdg9l/2In3wsQpDHVTjqZlneBfSJTnJjc6FVA2fGMtWOxWn6H/tq
   UvOFxWBxwwd7sVkDFgiRxTygwCaXKl3fYoc+kYMMpxZryP4L1Bnw2Pyr4
   e67S7fLG2mN435DNUuSNZhEmVcg9TEf9cKCRRPPTDli3Xk+SJRcShrInl
   UOQpgz1ZleyeTjdYHoCfLj8R4/sM1jrya46i8gZXBmE506GuvUA4Z568B
   X9hsGWM3aDlzfzAMES6nkp/LcxRvtMAWyLCoe92rUSDfNF+SJeZpETfqR
   j5mgbsE+9vgT7TTvaURfzLMWsstOwF+kux3tl+SS/ZsK41gUTc6j1gr8g
   w==;
X-CSE-ConnectionGUID: GudcWF7dRFi/wnsG3QeVfg==
X-CSE-MsgGUID: 5ooHBXcZRNyCbpXE3lRlKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212969221"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212969221"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:12 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 862111002B81
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:11 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 3AC7EC00880
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 8588520012FF;
	Tue, 16 Sep 2025 09:42:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 075AF1A008A;
	Tue, 16 Sep 2025 17:42:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/42] python3-starlette: upgrade 0.47.3 -> 0.48.0
Date: Tue, 16 Sep 2025 17:41:42 +0800
Message-ID: <20250916094152.1479-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119456

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.47.3.bb => python3-starlette_0.48.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.47.3.bb => python3-starlette_0.48.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.47.3.bb b/meta-python/recipes-devtools/python/python3-starlette_0.48.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.47.3.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.48.0.bb
index f27be4d6d0..ef1986f46b 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.47.3.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.48.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "6bc94f839cc176c4858894f1f8908f0ab79dfec1a6b8402f6da9be26ebea52e9"
+SRC_URI[sha256sum] = "7e8cee469a8ab2352911528110ce9088fdc6a37d9876926e73da7ce4aa4c7a46"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


