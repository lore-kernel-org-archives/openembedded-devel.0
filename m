Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1041D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:50 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4201.1765274198307219023
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mGhjfDwk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274201; x=1796810201;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7DtJYbo+QvwFgc+9/u2ywh47lUZ7SWWb1wGwHvzTJKw=;
  b=mGhjfDwk2f+/2vBtG5N+sE9/e1ff26X80eXCUwDIfsFA7mNScBHIBwFa
   dVWIsEl4tT/PM8JF8fxfKeMyt5lfVTXTXeqClu7XWMUCPlMSKNhHH8Z+5
   XuxcvH2xRZxhHDQB45os2jkpEvKpHJN0nWqgbp+wluFlI4OXsxJRX5T0m
   H5HxfcSvRebxNInFi569COkO4MNwHBlOWeEYUSisyNt+esQU9+KzNW8d4
   FQp3vEPgxy2u6TueVXMKZ9sMo21oiaxQ/UmB1/xnmMgFpuunjxcz0n1Ro
   Tqm+VAHofqFNvAGyDgf/c51QyU3nUTc+oiO/u7twETLTXroK78oBkUQ7D
   w==;
X-CSE-ConnectionGUID: Qq9nL38VSbOcIXmHsXP/BQ==
X-CSE-MsgGUID: tc/fYSoaT+KBLRsa18664w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221991928"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221991928"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:41 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 89BFA1002BAA
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:41 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 443E28D205F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id BB02120002B8;
	Tue,  9 Dec 2025 09:56:38 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/38] python3-cantools: upgrade 41.0.0 -> 41.0.2
Date: Tue,  9 Dec 2025 17:55:32 +0800
Message-ID: <20251209095552.690-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122422

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Add support for INT VFrameFormat
- Check ./tests directory with ruff

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_41.0.0.bb => python3-cantools_41.0.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_41.0.0.bb => python3-cantools_41.0.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_41.0.0.bb b/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_41.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
index 24249dba9d..a640df3f29 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_41.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_41.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "81d7efa32d66a149934b21b691a40fb40db9e0b74fa02c24f4f257f587d169ae"
+SRC_URI[sha256sum] = "5c91a66e5e03a4ac5727f20207df1da5681748a154c2bc85ef532fef9e0109d1"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


