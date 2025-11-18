Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1046CEBF92
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:09:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8405.1763456949034386068
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LzOzjwEE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763456951; x=1794992951;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oCb0hgDZVFienUeBNGB+ANIBsIGXMhlZTj0E7HILrkE=;
  b=LzOzjwEEVBtcFg4oD42nmeE5bFmYnnRgnYojBtPaHMb+siHQUZ9XYd8Z
   UNOy5H65+sLp3lDk+fIAely33bxgo4mXetSuZfhI1xu9vGYhKRpw1l+OP
   5UJzz9/GxvNrAebKwsosfCa3E7MHRMztQY5BnyIi0sOO1wWqFy0MAqLwY
   pr0FrHZ0u1QqSP23USr0iGOEk9+Yiei9crBWAP+Dw8Pqu0iZ2MtUTRmHO
   MVRxOead0oiHn+2s8RheE53kgmuruff6n/i6EOO0BeGudqwgfLuh6BXfP
   wWuIT9HrIZ7PTh3VIyjqcUoimGXO+y3YKLPzAz1tYFX3/kaMBps3xbCoT
   w==;
X-CSE-ConnectionGUID: 0olVhcX/RE656K6Q58lj9w==
X-CSE-MsgGUID: rpAVGCbhR0S42zJIgzJlFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="208179084"
X-IronPort-AV: E=Sophos;i="6.19,314,1754924400"; 
   d="scan'208";a="208179084"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 18:09:11 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id DC79A8203C4
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:10 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 97BD3C01825
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 35D941400096;
	Tue, 18 Nov 2025 09:09:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/29] pkcs11-helper: upgrade 1.30.0 -> 1.31.0
Date: Tue, 18 Nov 2025 17:08:28 +0800
Message-ID: <20251118090846.1484-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251118090846.1484-1-wangmy@fujitsu.com>
References: <20251118090846.1484-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121822

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Packeging changed to Packaging

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...kcs11-helper_1.30.0.bb => pkcs11-helper_1.31.0.bb} | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-crypto/pkcs11-helper/{pkcs11-helper_1.30.0.bb => pkcs11-helper_1.31.0.bb} (75%)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb
similarity index 75%
rename from meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb
index 15d0aefc36..000218988b 100644
--- a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.30.0.bb
+++ b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.31.0.bb
@@ -10,15 +10,14 @@ HOMEPAGE = "https://github.com/OpenSC/pkcs11-helper"
 SECTION = "Development/Libraries"
 
 LICENSE = "GPL-2.0-only & BSD-3-Clause"
-LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=30f10d22cfb1ba98ccd714a41ad3311a \
-    file://COPYING.GPL;md5=8a71d0475d08eee76d8b6d0c6dbec543 \
-    file://COPYING.BSD;md5=66b7a37c3c10483c1fd86007726104d7 \
-"
+LIC_FILES_CHKSUM = "file://COPYING;md5=008a5b65f5d167bd0f646530ad3d3293 \
+                    file://COPYING.GPL;md5=8a71d0475d08eee76d8b6d0c6dbec543 \
+                    file://COPYING.BSD;md5=66b7a37c3c10483c1fd86007726104d7 \
+                    "
 SRC_URI = "git://github.com/OpenSC/${BPN}.git;branch=master;protocol=https"
 
 # master
-SRCREV = "8bed16034f629a0361fa8ff89deed2b43dc45d8b"
+SRCREV = "286b4415b95f298ab35d62508a37c2aefc055037"
 PV .= "+1.30.0+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "pkcs11-helper-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


