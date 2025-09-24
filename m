Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5701CAC5B3
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:55 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8322.1758704444729047245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ccCXRCwb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704447; x=1790240447;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f9B/MPTqzQ/+dD8220Sc/YwuwumKmAzMyGbbqmxGb2k=;
  b=ccCXRCwbwZ6gjf2BKRXhjDYWv1Z//H1EI9+tT0C6We3wZ8smeSGAJO87
   hMi9/l1Piv8uASVloarmX4HoCKiBpAsLACLWQptgMazL2oBsyEwXZwWZ/
   ZOX7yuPrv4TS6FoWsxMrfTImTpHaZWJioRJbQeL/vzzdA1l6bf9hQWK4p
   KtMaq/lO8xZcYvTjfm9z1k/LNsBahePWJmkU9DYBE+R0sQGjpu4uNQvvK
   NWkg6ecXzKXUHe4IFoJ/6TJrHnDJ7Re25bAtI//PV3K2gCCismhDPQmDU
   LcuBJYo64RDjP4KaUodsqW2wCVCWVkipRr0qheQlkZy+li58aMfrholDS
   g==;
X-CSE-ConnectionGUID: PzOovjjHQX6pABY7UdgeVA==
X-CSE-MsgGUID: hKVGINX3QBOElyVffJSBJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="214326391"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="214326391"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:47 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 2AE671000346
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:47 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E05001C00160
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:46 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 52EE61400BEF;
	Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 65E091A0078;
	Wed, 24 Sep 2025 17:00:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/29] python3-spidev: upgrade 3.7 -> 3.8
Date: Wed, 24 Sep 2025 17:00:28 +0800
Message-ID: <20250924090029.1786-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119790

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-spidev_3.7.bb => python3-spidev_3.8.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-spidev_3.7.bb => python3-spidev_3.8.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-spidev_3.7.bb b/meta-python/recipes-devtools/python/python3-spidev_3.8.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-spidev_3.7.bb
rename to meta-python/recipes-devtools/python/python3-spidev_3.8.bb
index 287d612448..2fc1f355d9 100644
--- a/meta-python/recipes-devtools/python/python3-spidev_3.7.bb
+++ b/meta-python/recipes-devtools/python/python3-spidev_3.8.bb
@@ -10,6 +10,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2077511c543a7c85245a516c47f4de78"
 SRCNAME = "spidev"
 
-SRC_URI[sha256sum] = "ce628a5ff489f45132679879bff5f455a66abf9751af01843850155b06ae92f0"
+SRC_URI[sha256sum] = "2bc02fb8c6312d519ebf1f4331067427c0921d3f77b8bcaf05189a2e8b8382c0"
 
 inherit pypi python_setuptools_build_meta
-- 
2.43.0


