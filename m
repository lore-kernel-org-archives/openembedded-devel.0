Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C86CAC587
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7937.1756890230863763325
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FnVaDCbx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890231; x=1788426231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w5zW/UFVCT3r/Xa7FY8VTvbTp9qb672GSHufuhk0Tb4=;
  b=FnVaDCbxCvTNSPjt4qiwIMMHmYe04Aah1ev8gY7rnXrEC2QDUbLvXvCO
   Dv5LwW5Dc7PITF8ONywYIFyJOKvgsn/paXhO8bcRlsPSt9pGysjswDTTH
   mpjqcCs3lZG6yJAQIo6kkXXlD6W0DCUKdex3AvSxp8+FGFgQ3jkEjlHko
   RGLBzuN6roG/kQOkEBm4SGBgwN2YYTa9/s2UQbJQeQv/0c1QX2/Fj719O
   7++1t+BUH52Xssl5sRGa+Yfv/Lry6UIJhc3w34D/++24TfQtItdA8C0PS
   V0vMAzNMgPwrwmeswst/RT+kc8PvUX7U9ZyF8Q4ViiG9l5UkJToutfa9s
   w==;
X-CSE-ConnectionGUID: aiweSTqkRMWWS+mHzhWVgA==
X-CSE-MsgGUID: agl8SXVQTbyht3RnnaJviA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="212051804"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="212051804"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:51 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8CFA1C00361
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:51 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4AED91412323
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:51 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 380412005D20
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 397011A008B;
	Wed,  3 Sep 2025 17:03:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/56] python3-h2: upgrade 4.2.0 -> 4.3.0
Date: Wed,  3 Sep 2025 17:02:52 +0800
Message-ID: <20250903090317.2002-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119226

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python-h2/{python3-h2_4.2.0.bb => python3-h2_4.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-h2/{python3-h2_4.2.0.bb => python3-h2_4.3.0.bb} (77%)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_4.2.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
similarity index 77%
rename from meta-python/recipes-connectivity/python-h2/python3-h2_4.2.0.bb
rename to meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
index 55b534ebbf..11ee118831 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_4.2.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.3.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1"
 
-SRC_URI[sha256sum] = "c8a52129695e88b1a0578d8d2cc6842bbd79128ac685463b887ee278126ad01f"
+SRC_URI[sha256sum] = "6c59efe4323fa18b47a632221a1888bd7fde6249819beda254aeca909f221bf1"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


