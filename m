Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE73CD6E64
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:14 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21211.1780394884280178988
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PWoYH9ZZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394893; x=1811930893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XE+PGM3uQbgk2smwOutv5iqkZjvggoRNl/QRfWgFdG0=;
  b=PWoYH9ZZUiz8hhxzDhlDObJTETzughvrdAhh2oPdK2jJH+4kH9feomVC
   ZZYXH9IDuyx95RGoBYd6ffw73iweCrASxcZjyHqPUaq+Jce9OoLVtWYDC
   GznzDGiVKaUymxQUp1i2pwG31ept1u991xahOM4+9KBzzo8XmlhACMr38
   sjC9w72xTU94qlAAcPGiq6CbiSyQD9Dpzfm1PLjBkuedsIC2waARgJ7T0
   w5UowtgXuCjCyews2i/YCaXoBnYzbCrvRyA3xd/hISNoTIn8KLEKgWT4L
   E4M16tXpYI/mhx4UyJPGcCNU1qQlS9Ql7DUJbPpQtj8vfhKe5rp06cD1H
   Q==;
X-CSE-ConnectionGUID: ItU5TDfwTtubeamMWj4vrw==
X-CSE-MsgGUID: nrQQpMrISAyr45PcKYtnPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="245981270"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="245981270"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:13 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A51BF1000374
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:12 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5D03718026D4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 7547F18005A7;
	Tue,  2 Jun 2026 10:08:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/38] glaze: upgrade 7.7.0 -> 7.7.1
Date: Tue,  2 Jun 2026 18:07:22 +0800
Message-ID: <20260602100755.2117-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127328

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Support YAML tagged variants (meta::tag/ids discriminator)
- Add CORS preflight test coverage for under-tested scenarios
- Fix float serialization on 32-bit MSVC (zmij SIMD path)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/glaze/{glaze_7.7.0.bb => glaze_7.7.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.7.0.bb => glaze_7.7.1.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.7.0.bb b/meta-oe/recipes-support/glaze/glaze_7.7.1.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.7.0.bb
rename to meta-oe/recipes-support/glaze/glaze_7.7.1.bb
index 88bdcb75f5..8b10e8d344 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.7.0.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.7.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "dc90e3a31ef9b93e53efb8320aae1a36f7abd80f"
+SRCREV = "ae87b187e2264ad452777bca68e35595406e9dca"
 
 inherit cmake
 
-- 
2.43.0


