Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F834C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4922.1783503992462712417
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kUUPv7/a;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503994; x=1815039994;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ps4ScO3LM1PKVFhJlAl1v29/smHOub8Kxdp0BHcZhJ0=;
  b=kUUPv7/aoIPTElcvxGw+c1UECO1dfN9sWUiX1GRZCKWrh5VRTVKJMI0R
   ZkRwFXvbip3im7gXV4KtikzyYI6tK1llvvNmR64lm/KO7L6A4Xc+sEMa2
   +Tl2t9GoXJiaYpPH+Ml/1pgqwagLqOmLc+fOfB6XuNDpTIA9R1/5ajSIF
   fYYqUxT23x896BeDllXNiswEn6KF4QivtJTKQKQKlTSxQcK1XCB6+bqEN
   CpcFbl6IPamNMa2KFqUwxVCLrCZY9Yc2MvgREqH+GayZdQbYQB1bjlXXt
   cbWrMMshfRM9EVyoO/dHE/NcAC40p2xbsCrEbwlPejID0CA1z6AOxl9bK
   Q==;
X-CSE-ConnectionGUID: pFwcaJmFTs+oQRkEvPeF9Q==
X-CSE-MsgGUID: p+wh3FHpRBu/KJ93ou5itw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="224395788"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="224395788"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E11051C000F1
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:30 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9504F18915F2
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A1C5B1800C26;
	Wed,  8 Jul 2026 09:46:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-xfce] [PATCH 37/37] xarchiver: upgrade 0.5.4.26 -> 0.5.4.27
Date: Wed,  8 Jul 2026 17:44:47 +0800
Message-ID: <20260708094508.2060-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128108

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xarchiver/{xarchiver_0.5.4.26.bb => xarchiver_0.5.4.27.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xarchiver/{xarchiver_0.5.4.26.bb => xarchiver_0.5.4.27.bb} (94%)

diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.27.bb
similarity index 94%
rename from meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
rename to meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.27.bb
index 77c6b4c2ca..39fe20b75a 100644
--- a/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.26.bb
+++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_0.5.4.27.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+3 glib-2.0 xfce4-dev-tools-native intltool-native"
 
 SRC_URI = "git://github.com/ib/xarchiver.git;branch=master;protocol=https;tag=${PV}"
-SRCREV = "e14d54e1c85f4dbc78b89042017ebdc0fe5e2f4c"
+SRCREV = "fbc3330ff6b6e4330190ecebd490cfc27941555c"
 
 
 inherit gettext pkgconfig autotools gtk-icon-cache features_check mime-xdg
-- 
2.43.0


