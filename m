Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9ED710A1E92
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:12 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45643.1774526230001879933
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J9VzBNVG;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526230; x=1806062230;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Po+IgVLcZeabEl6g54jc40mXHxO6OIFYc6+b000s60I=;
  b=J9VzBNVGjVZ/0cNWZIf02YEI3X6uuooDtVrrptnfcI074H9qL7zSWou+
   +SToI2bH5eCyUmAbLqDwMoXilaOsXlY606ZLEWfDudLMAv2MYQ7B09EJq
   F3wbVnL3Imk8bq8BRlFKvbwls30A5vsbtrRH8h/JyrJcI11eklBC8tPte
   vTNvbEFeEQHNLCm0Vw0SrMOEAOWSCeTaAB6hOhESo90KIP/f8WKZCZsX2
   30CiNFhg3eo1OEHfu3mo1c9mnw/2ZI5bMe8/veFXtNFodEa6gHUorb7LN
   7aXb+H/mN8ttyjMwPwHJCp4Cgr7vVsll6JHgiAv8+YuhHq2LFKgdVU4+p
   A==;
X-CSE-ConnectionGUID: LI8piakkTVi2D6uDDQ9LWg==
X-CSE-MsgGUID: AkmtcSYYTz2KwqjVCHsUlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234652609"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234652609"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:08 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5FDB14DD1
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:08 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 0E7791846192
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8F59B1807148;
	Thu, 26 Mar 2026 11:57:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/63] iwd: upgrade 3.11 -> 3.12
Date: Thu, 26 Mar 2026 19:55:47 +0800
Message-ID: <20260326115634.1199-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125672

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix issue with handling expiration of PMKSA.
- Fix issue with handling uninitialized buffer and PMKID.
- Fix issue with checking for PKCS#8 key parser in unit tests.
- Fix issue with using -std=c23 compiler setting.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_3.11.bb => iwd_3.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_3.11.bb => iwd_3.12.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.11.bb b/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/iwd/iwd_3.11.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
index c4956fb22c..a53137537e 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.11.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
            file://iwd \ 
            "
-SRC_URI[sha256sum] = "85730e79de05978e26e44b958fd11e2ebb45424ca181f8db7a8daf25fc2226ea"
+SRC_URI[sha256sum] = "d89a5e45c7180170e19be828f9e944a768c593758094fc57a358d0e7c4cb1a49"
 
 inherit autotools manpages pkgconfig python3native systemd update-rc.d
 
-- 
2.43.0


