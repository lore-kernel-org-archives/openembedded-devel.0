Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B022D11705
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4475.1764669141753033382
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b2KGNUB7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669141; x=1796205141;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TcleiafI/RCq40aaxtdpgopQFv3LdFZvyQCrYRXWa74=;
  b=b2KGNUB7PjkFSxbCQ01AazQhcVdqSb4CoRuD3kFYxlJxBrN76XtF5nlw
   MvKJa6ZJyih7i522jypmZ53SZIYFFJrTMkTAspxZCdHVXPeEXxptZiBA8
   uKYU87Nm14Y+2inJYPeJgMqhdBdmVm6EDMli9aM9FomioLBjFva0lxhGJ
   tnGUGfQOH9z09+BVSesNAapUEONoRr/6/+vz+coWGA/Kc/V9YQ6wb7fec
   BsMttWh/rEe5Yiy5a6nFcaS5mMjxA4lqveV4AYLuP8fqk2vsEIRTKLArb
   TPGNdYPuOeGnxqm08VaVYLz2n1Ly1HM0M6XxUF+Hwu6t4UxWiuC8zHP7d
   Q==;
X-CSE-ConnectionGUID: tEspXYntSCatBiudlnF/eQ==
X-CSE-MsgGUID: pDJOaNjzR5CRGL4Lx6HmIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="209140958"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="209140958"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:20 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id F33D2C01818
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AA8C58D2051
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2BBB3101A430;
	Tue,  2 Dec 2025 09:52:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/25] python3-types-psutil: upgrade 7.1.1.20251122 -> 7.1.3.20251130
Date: Tue,  2 Dec 2025 17:51:28 +0800
Message-ID: <20251202095132.652-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122254

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...7.1.1.20251122.bb => python3-types-psutil_7.1.3.20251130.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.1.1.20251122.bb => python3-types-psutil_7.1.3.20251130.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.1.1.20251122.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.1.3.20251130.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.1.1.20251122.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.1.3.20251130.bb
index a771e7b897..e22eb3ecd1 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.1.1.20251122.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.1.3.20251130.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "cdb39c30a81ce6e433aa672922d59b78c4c6a9c64cd9936f1f6894d26c82ae0f"
+SRC_URI[sha256sum] = "7f42e7a7845a93397e430b48a8074a35410d7a436695fd3375ec9b687d8d95f8"
 
 BBCLASSEXTEND = "native"
 
-- 
2.43.0


