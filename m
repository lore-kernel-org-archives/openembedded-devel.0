Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDE0CA1014
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.8052.1756890209000338735
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OKm1TrNi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890211; x=1788426211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6HP2zVtleOuL5Xck4LMyxRK2j634WTx0KbsGV1pJgsE=;
  b=OKm1TrNiBcKdNC4WK+Asf5820amnnh50NtlNW5OrVa4YkYUVdh1Y8dK8
   agw5eL+1jVgsHqmv442WEWIDV+UqixEXn9gtc7ubzzebeANdR40LVE0Ta
   tsTV1QiYrI01cgwyyxWTlV42qeXu4sRM0VbJInWnr9rvuca3Gtv1AqQVu
   9DIHQqoJzWUqRTziwOn6L4ObxaxBmZ7f9MbOR8JJeXTv4Ty5AmpC58WTV
   2aDH2OgtdNEYqLTCRjFFIBSfDwWK2Rb5xNNmWtzn06NUC6nOpjn3wA2h/
   AE7eUaCw8caVY8FW1hr8WYcl3eocVPK7ZXq29jlrP2PlCqCinasTnc2Ws
   g==;
X-CSE-ConnectionGUID: YEba6YvDS/6vTBeNn6h0Gw==
X-CSE-MsgGUID: y/AK1fmSTLOBsIzlq6qZ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="211549634"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="211549634"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:31 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 726B182070B
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:30 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2D67318C18A8
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 376C11400AE3
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FC0D1A0073;
	Wed,  3 Sep 2025 17:03:25 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/56] libei: upgrade 1.4.1 -> 1.5.0
Date: Wed,  3 Sep 2025 17:02:34 +0800
Message-ID: <20250903090317.2002-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119206

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/wayland/{libei_1.4.1.bb => libei_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/wayland/{libei_1.4.1.bb => libei_1.5.0.bb} (92%)

diff --git a/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb b/meta-oe/recipes-graphics/wayland/libei_1.5.0.bb
similarity index 92%
rename from meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
rename to meta-oe/recipes-graphics/wayland/libei_1.5.0.bb
index 764616906f..e44709759c 100644
--- a/meta-oe/recipes-graphics/wayland/libei_1.4.1.bb
+++ b/meta-oe/recipes-graphics/wayland/libei_1.5.0.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
 
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libei.git;protocol=https;branch=main"
 
-SRCREV = "9e0413cbc7d3ae6656266890425f152589ddf74d"
+SRCREV = "19b64535408aa47abbc8151bc2c925afd6583851"
 
 inherit meson pkgconfig
 
-- 
2.43.0


