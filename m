Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A75CFD379
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:18 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13204.1764061988704712486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hXWk2J3t;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061989; x=1795597989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vtrHSFEHlfc6dMXehlgUZ9gMJfpVUrHoFxECVnFRneM=;
  b=hXWk2J3taAcXhbmS/gGOi3QFE/HxeBE8gxnT6VxHzRO0xedsQXtRANst
   n5XxeM3oF55dAj1pbmu/ct0dzz8c/NkeTT34G/EgE6pLqafDf+GKy6Rc9
   bJV6JxYqS17S9A7ppctGbutvmy22yDsYxCH2Wlg8Rftf0aTa57iXmXbiz
   lh6Ikl04tEn+nRGcsgwdGzPxQ/dzYHl/vKvBqRKsZf+0JVVbfX6X3jhhs
   lBe0yZekYEAtd2qsniuMjmGiq/lWnhC6mVrG+FlCAsFVPMiIorJxwZGxn
   rBrV9LvJxQrLxQY8B6zMm4yxshuV350OlOScIFVGRjsDeurdwJ4qK/nGt
   w==;
X-CSE-ConnectionGUID: 0eYn2tiYTleQiq2VaYsSYA==
X-CSE-MsgGUID: MDyfw+tHSteLSOtSnXoZ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="224149494"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="224149494"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:07 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 36DDEC00426
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:07 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id EDC71180027A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id B05E014001D6;
	Tue, 25 Nov 2025 09:13:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/26] nss: upgrade 3.117 -> 3.118.1
Date: Tue, 25 Nov 2025 17:11:38 +0800
Message-ID: <20251125091156.1376-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122032

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.117.bb => nss_3.118.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.117.bb => nss_3.118.1.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.117.bb b/meta-oe/recipes-support/nss/nss_3.118.1.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.117.bb
rename to meta-oe/recipes-support/nss/nss_3.118.1.bb
index 5e81441219..dad242df2f 100644
--- a/meta-oe/recipes-support/nss/nss_3.117.bb
+++ b/meta-oe/recipes-support/nss/nss_3.118.1.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "5786b523a2f2e9295ed10d711960d2e33cd620bb80d6288443eda43553a51996"
+SRC_URI[sha256sum] = "8c390a676ea37266fcd3d0cd2fb070e2f69f4d78fa4ed88e07ac0c9eb5aab8d3"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


