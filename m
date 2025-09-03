Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D009CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.7938.1756890231044712977
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kl28VHwn;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890231; x=1788426231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jl9FxFwbCe+5SgU9dIXM4zbGPr+/z6oxLyvgNZ6I63g=;
  b=Kl28VHwn6gNw928JY1vAIl/Xw16BP+7O8kNEVAPOTB6zBRg+n2Wf4KZs
   tZhI5NKs28Wq/wPY5bzRAGAHjZZoouQkwSFLbJl+TiOsPe3DIFsl0y3ym
   eAXWIiR7mw+Wc667abvz/lgKtIKz7OuMbQZcpFs0o2EHvtRHZ7CppwYfl
   HN60M+jtgvF47vVTzLIlAjaMDKJZhoWhR6w2yQFhmav7WzVK+mNRLgT5+
   EXkga8Uyjali6qUxacJXTMyF4Wge2wo/M7vzGfhkZca/BAZ1RrxHvPpdY
   SfdbhgHaw5H46PMRN6Yphqe6u/VUk4XtbBYK9OrPfIiswybG6t8t1ApJt
   w==;
X-CSE-ConnectionGUID: f6kI5Wy9RCGurHvkDUaWzg==
X-CSE-MsgGUID: KfP0P8sMQDi5IJdJeWeTVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="190352776"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="190352776"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:49 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 51F2582071C
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0EFDA1479245
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id EAAB32005D24
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F3CD1A007E;
	Wed,  3 Sep 2025 17:03:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/56] python3-beautifulsoup4: upgrade 4.13.4 -> 4.13.5
Date: Wed,  3 Sep 2025 17:02:43 +0800
Message-ID: <20250903090317.2002-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119223

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...eautifulsoup4_4.13.4.bb => python3-beautifulsoup4_4.13.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-beautifulsoup4_4.13.4.bb => python3-beautifulsoup4_4.13.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.4.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.4.bb
rename to meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.5.bb
index ba75b06396..43c861c6e0 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.4.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.13.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
-SRC_URI[sha256sum] = "dbb3c4e1ceae6aefebdaf2423247260cd062430a410e38c66f2baa50a8437195"
+SRC_URI[sha256sum] = "5e70131382930e7c3de33450a2f54a63d5e4b19386eab43a5b34d594268f3695"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


