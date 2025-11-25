Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D76CFD379
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:17:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13253.1764062254537625489
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:17:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DWkzjw2P;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062254; x=1795598254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p7rjdQMBQEhlytzZD5XAxbujB4tgJ1+8cK1OYl6/Krs=;
  b=DWkzjw2PUxIPGvCfwZ8to+ieU71oCRclsMruO5uqyikhUee2uQE/c1n1
   rYhHhUcrwRXAHT1YdC5mpw+uj5z/6DVop5MIJW2oWGLDhYb9F4666w5tZ
   kXqdewObIe+sncja8ho7iMYafteUqDS0CYPGnCKNXMr3nsONh0/EP4CtQ
   EJvxmDgKjbeXa+dHVjygqxB5+GGWZ7z4ShPjls7XwVVRhUCqeZW/n1Xuj
   Qu30wfwBMB+Ko4cdqQIlTg2al5fcr2uhQ2F6r2tTnT9EVwXSGHAHFAOM0
   DX+S8lbz4srZ4OaFhQOO8Cy67JHfIpfMdaXVZkbagQkUDlc/uhhmKYjlB
   Q==;
X-CSE-ConnectionGUID: YRTIvtSLRy+YfcA4JGo6CQ==
X-CSE-MsgGUID: RKjd1FIzRs2tEICdbfhqtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="220952606"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="220952606"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:17:33 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 0B2F41C1C700
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:33 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B8023C00892
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 48A89101A427;
	Tue, 25 Nov 2025 09:17:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/26] python3-types-psutil: upgrade 7.0.0.20250601 -> 7.1.1.20251122
Date: Tue, 25 Nov 2025 17:17:11 +0800
Message-ID: <20251125091714.1420-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091714.1420-1-wangmy@fujitsu.com>
References: <20251125091714.1420-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122049

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...7.0.0.20250601.bb => python3-types-psutil_7.1.1.20251122.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.0.0.20250601.bb => python3-types-psutil_7.1.1.20251122.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.1.1.20251122.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.1.1.20251122.bb
index fedc14f9df..a771e7b897 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.1.1.20251122.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "71fe9c4477a7e3d4f1233862f0877af87bff057ff398f04f4e5c0ca60aded197"
+SRC_URI[sha256sum] = "cdb39c30a81ce6e433aa672922d59b78c4c6a9c64cd9936f1f6894d26c82ae0f"
 
 BBCLASSEXTEND = "native"
 
-- 
2.43.0


