Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 787B9EA3C33
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:40 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129120.1775730813363895421
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BJcxZT9g;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730817; x=1807266817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hF8ZgfDXsoJl0xLuS6/IT9oMCXeb1q/yvAJafS1Gnw4=;
  b=BJcxZT9gXdyFR980Omm8v3rUSuIt+IiS4EzH6rhjKmkO9cRUXKonCWG2
   AKpv7N2oscS7JbK/dpMOZu2p+uIxtAZRGrkBwIVb/X0Yp9+SpDS48uEj1
   vrJ0I11G/T5vpRI1E5p7BZbdwKwCRk+eSqETe9Vu0+zmb3xQ30ANcPxg7
   l1zM1GiwtPksWGbvTPmtAZcrhiIoMYvBMdWyhpYKJIrSXlMOexvBON3Ud
   ffuAhQOY1WV6BYHwQ6Xu925tmGf15bwSyT2nI/eUirVjgag/f6M3aBVLU
   saiEvCSkptgKpOdme5TJrsepagXEYpcLyyGEXBhf3BA+6+aSq1FXzoCZ3
   A==;
X-CSE-ConnectionGUID: 935CUUJfS4y2uAl51Svffg==
X-CSE-MsgGUID: 1T8wPIbmTnu0YsuerfGL3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="236327347"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="236327347"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:37 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 580B4100015B
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:36 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 052FD1804152
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 64DEB4046AC;
	Thu,  9 Apr 2026 10:33:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/37] libsdl3: upgrade 3.4.2 -> 3.4.4
Date: Thu,  9 Apr 2026 18:31:57 +0800
Message-ID: <20260409103223.1574-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126160

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.4.2.bb => libsdl3_3.4.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.2.bb => libsdl3_3.4.4.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.2.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.4.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.2.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.4.bb
index d6501f855c..0159021280 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.2.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.4.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "ef39a2e3f9a8a78296c40da701967dd1b0d0d6e267e483863ce70f8a03b4050c"
+SRC_URI[sha256sum] = "ee712dbe6a89bb140bbfc2ce72358fb5ee5cc2240abeabd54855012db30b3864"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


