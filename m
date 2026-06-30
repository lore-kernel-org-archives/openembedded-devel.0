Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADA3C44501
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17266.1782811390157815532
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c+kpp/md;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811390; x=1814347390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5+yUonDL0W7Z2xv48cOk4C8a31NQLoRh25rkoTBUIg0=;
  b=c+kpp/md1OtGD6HjMVfx7jKp+xczRZPnrqFqFXllktsNYDXOmDiQQBCD
   2PXKUsdb7pfFpquQTLSfIg8wuuSICOBkhnsA+H+VA6pEEjNbr06GkT06x
   Df8Qd8MdSLfRom3ou6d8WgodEUoPZzfVjjYVu4QiP1mdaLw78sCqx1nzu
   /r696sxE3z+nPoCvsoQ6V6rwy2lPuA0j7l6bRwGcWPd8d3vmWxcjCkBRc
   3gQdUU2wh0NRI/QPV1FPvp94/r1CLArTtFkYwQYjcg2M2u26xPL5OLgqa
   DusGtawXmVf4Rt24k3LM5D1rl3d2gJOmLiu7+7S+fubF96TYLRYoKTMEZ
   A==;
X-CSE-ConnectionGUID: eS/1VW5PTPSy/6FX2/nQtA==
X-CSE-MsgGUID: h9wTtGQnShmtTm0ZG/XQ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="233222296"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="233222296"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:23:08 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 97DD0C006C0
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:08 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 50F7F1800263
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 60A2482DDC3;
	Tue, 30 Jun 2026 09:23:06 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/37] xclock: upgrade 1.1.1 -> 1.2.0
Date: Tue, 30 Jun 2026 17:22:05 +0800
Message-ID: <20260630092206.322-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127979

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Removed the words "All rights reserved"

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xclock_1.1.1.bb => xclock_1.2.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xclock_1.1.1.bb => xclock_1.2.0.bb} (54%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xclock_1.1.1.bb b/meta-oe/recipes-graphics/xorg-app/xclock_1.2.0.bb
similarity index 54%
rename from meta-oe/recipes-graphics/xorg-app/xclock_1.1.1.bb
rename to meta-oe/recipes-graphics/xorg-app/xclock_1.2.0.bb
index a7360b6496..4a63a85edb 100644
--- a/meta-oe/recipes-graphics/xorg-app/xclock_1.1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xclock_1.2.0.bb
@@ -2,9 +2,9 @@ require recipes-graphics/xorg-app/xorg-app-common.inc
 
 SUMMARY = "analog / digital clock for X"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=857759ade8f2ddde5c7b32ef7356ea36"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2356ccad6224ad00334a72040730eb4b"
 
 DEPENDS += " libxaw libxrender libxft libxkbfile libxt"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "df7ceabf8f07044a2fde4924d794554996811640a45de40cb12c2cf1f90f742c"
+SRC_URI[sha256sum] = "410f0372f8381efd9a8282d8227122bab882d7cffe2f7f8f886dd9876d5fc875"
-- 
2.43.0


