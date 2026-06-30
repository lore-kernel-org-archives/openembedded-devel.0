Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B22DC43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16857.1782811348376169001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kIkdN1xX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811348; x=1814347348;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8CzQzvaRMT64GNkheopW2SfZJ+lLHMXNQKd8Mc13buo=;
  b=kIkdN1xXvo8zC/7S+nbPll80iggNG4WIIs4XlOebWzn7EJrnK4VUM3aR
   IJDQfp8JYf8VmIWt/iJHPjEv1V+86scITt08B8rnbdrVpUutxZLULcPtv
   WwGHr+VjjfKZkVX86zs/a0ah5IC5vrR9TYYDVLuZrGAHJ8cofPGSWO96M
   CCl6TqmgdvrrtNCIJM1WA9gBNQrh795bu/uZAVYZ1SGteUQJ6YRIrbfHT
   0JxQxrN0fPd0u8YdOxMXW/+bPiKDQoOlgB9Fj0Wso44HoXh0iUrTvU0T9
   i4ku6I3myS9TTmykroKQ7i1Y/ite2glGul2HID0hyTCYp/PDH8yFeOVBn
   A==;
X-CSE-ConnectionGUID: v5Rikhq8TsWfyRWH3XjAIw==
X-CSE-MsgGUID: pAO1e0X5TeaOF7b8oHQfEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233222228"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233222228"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:26 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D989B42A307
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:26 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 9427B101D683
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B5E01826FFD;
	Tue, 30 Jun 2026 09:22:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/37] python3-aioresponses: upgrade 0.7.8 -> 0.7.9
Date: Tue, 30 Jun 2026 17:21:39 +0800
Message-ID: <20260630092206.322-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127953

From: Wang Mingyu <wangmy@fujitsu.com>

Fix double-query-encoding bug

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-aioresponses_0.7.8.bb => python3-aioresponses_0.7.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aioresponses_0.7.8.bb => python3-aioresponses_0.7.9.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.9.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb
rename to meta-python/recipes-devtools/python/python3-aioresponses_0.7.9.bb
index 4fe9577b7b..87081fc658 100644
--- a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.8.bb
+++ b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.9.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pnuckowski/aioresponses"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b22b40d5974300051216633098387c57"
 
-SRC_URI[sha256sum] = "b861cdfe5dc58f3b8afac7b0a6973d5d7b2cb608dd0f6253d16b8ee8eaf6df11"
+SRC_URI[sha256sum] = "1dcfa28938fc006f046a98383a7c07ac180be7a492c1ed557f5cd7b0805357d3"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.43.0


