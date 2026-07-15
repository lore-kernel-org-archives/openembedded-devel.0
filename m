Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDC8C44510
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3452.1784112038906279657
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TlcRSAEN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112041; x=1815648041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MldzrUgBtpcY5ZKKYB+4BwFWLE5Av9nkp4FEA1V2sgk=;
  b=TlcRSAENZsa9Csq2xXZuoExddkBxTc26NqJkY03IHuq/wB3vLQspb1EW
   tc/+wrdtTxUtA2NXfXAyClnH4YyxjzzWCoD/5R99u6sEiVpkzTVNS2E6g
   kToZjc/PdBKvAtBSyVFjRJe7MlbGBR9po3miZJrm8MmlyuxcIkxwaO3q7
   mtdv8DPFuD2PsZ5F/p1WTQmgyqiFL4eUDunf9IpAu0mkfiYGRzegBjBgD
   1WXO4B6pruFoxwKFgU7FUyLyIcxCFbifaLDYEyCUI9WBGVCTHlEjWqi+L
   Eg/lnKGyuzwwtcOHCm3OcWbet9zNhDb8KFdLt5XxmJO9fK/5ib5rnUnmH
   g==;
X-CSE-ConnectionGUID: pJamwR++TdSh8XmGt//tNg==
X-CSE-MsgGUID: +PpiZCT4QeaSqDkwe8M87A==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="245662408"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="245662408"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:39 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 578CF1C01699
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:37 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0AA0518578CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 22AB21800B81;
	Wed, 15 Jul 2026 10:40:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 39/44] xrdb: upgrade 1.2.2 -> 1.2.3
Date: Wed, 15 Jul 2026 18:39:09 +0800
Message-ID: <20260715103914.2120-39-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128212

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xrdb_1.2.2.bb => xrdb_1.2.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xrdb_1.2.2.bb => xrdb_1.2.3.bb} (75%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.2.bb b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.3.bb
similarity index 75%
rename from meta-oe/recipes-graphics/xorg-app/xrdb_1.2.2.bb
rename to meta-oe/recipes-graphics/xorg-app/xrdb_1.2.3.bb
index 53214c8fe8..2a83dd4c1a 100644
--- a/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xrdb_1.2.3.bb
@@ -6,6 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1167c4f586bd41f0c62166db4384a69"
 DEPENDS += "libxmu"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "31f5fcab231b38f255b00b066cf7ea3b496df712c9eb2d0d50c670b63e5033f4"
+SRC_URI[sha256sum] = "c88f560243278c896ce4fc92ae5a45a2b505a316ffa427fe55b02e5d5914c4e4"
 
 EXTRA_OECONF += "--with-cpp=${bindir}/cpp"
-- 
2.43.0


