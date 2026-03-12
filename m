Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98E3103E316
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18753.1773312786351924193
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Nz8K5mfx;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312784; x=1804848784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UgkhZoIYySiG4yKuurJXhHN6d9/rrIrLnR6t0emsFcc=;
  b=Nz8K5mfx1RdYH7O8Voydjf+4CshdplIfiNmXnmgtZ/0n48WQvWj70xwU
   9apn26V7k9EuoPS5Vua7DGNfoXhjLPaE3pSdBLGAhmP6ntcVS2fbfC17m
   Yee1PcXnTvtZfkva0unjnqGrruI9isl+y3wc8e4giJQNm2+W6ks+IUCSe
   m6GH2/UeJTBhSlKVbezzvNHwc/MwdNqN1e6uf/3kB7/jTu94hA7ZCjcut
   dsgNBU+8tmXob6Q8LgvlXGRu1GrSK5erk6tmkEa8XYybiBRiVP+f8a420
   bLYrV5FLjwxN5N9iIzT3RBhvLLuevjh5KqfxSsPqkX2xEPC749DQSiHSJ
   Q==;
X-CSE-ConnectionGUID: qV+21bs4RfSF/ir92BnmaA==
X-CSE-MsgGUID: 2QkF4/drSymHObZxFyfQsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211824337"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211824337"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:03 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D0F891000A0B
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:04 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7F7791C0CACC
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9FE5718029A2;
	Thu, 12 Mar 2026 10:53:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/64] libsdl3: upgrade 3.4.0 -> 3.4.2
Date: Thu, 12 Mar 2026 18:51:34 +0800
Message-ID: <20260312105220.1856-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125118

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.4.0.bb => libsdl3_3.4.2.bb}  | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.4.0.bb => libsdl3_3.4.2.bb} (86%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.0.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.2.bb
similarity index 86%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.0.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.2.bb
index 5eb21c5cc7..d6501f855c 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.0.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.4.2.bb
@@ -8,18 +8,17 @@ BUGTRACKER = "http://bugzilla.libsdl.org/"
 SECTION = "libs"
 
 LICENSE = "Zlib & BSD-2-Clause"
-LIC_FILES_CHKSUM = "\
-    file://LICENSE.txt;md5=cbf0e3161523f9a9315b6b915c5c4457 \
-    file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077 \
-    file://src/hidapi/LICENSE-bsd.txt;md5=b5fa085ce0926bb50d0621620a82361f \
-    file://src/video/yuv2rgb/LICENSE;md5=79f8f3418d91531e05f0fc94ca67e071 \
-"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=036a54229112040a743509a86b30c80c \
+                    file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077 \
+                    file://src/hidapi/LICENSE-bsd.txt;md5=b5fa085ce0926bb50d0621620a82361f \
+                    file://src/video/yuv2rgb/LICENSE;md5=79f8f3418d91531e05f0fc94ca67e071 \
+                    "
 
 SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "082cbf5f429e0d80820f68dc2b507a94d4cc1b4e70817b119bbb8ec6a69584b8"
+SRC_URI[sha256sum] = "ef39a2e3f9a8a78296c40da701967dd1b0d0d6e267e483863ce70f8a03b4050c"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


