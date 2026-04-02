Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4480A1112270
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:16:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7123.1775096165688477148
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=afZ9xn5R;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096165; x=1806632165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5sKAlYQxoa/ettJ/tPOkWKNvEmItee2uD1he2kVPwSM=;
  b=afZ9xn5RjszdZQ6aDTToGmCukL1aDtXtJp5erqCMHtM6UFXZtUqPeOTx
   ru1X/LHdaN1nrqDnr4fLQAGYVSjZs95vTlY/X63p/oUFOwFOkRHnMRSC5
   5KjzxdCUxPmn/0dVB7TKr4qRFHBsWbMGfHjAgKXZF5Jws6Uy6rP6I6zgy
   IjwvoEdL9pi0tq3kHrgtbKuLzwnb5UFL42GUkknLRpYGovK5md7CPgoze
   MfzGHamJwTQOVJtxHffrCCcaY3PbmgRoEUwQD0K5nNVWwLgJrBkerp0dj
   K7el10ZhGoBGN6RIU34sXfWN493FIJrxb9F8X4UqTVU05RpAKStboGtw4
   w==;
X-CSE-ConnectionGUID: GytzcNoCSDWe5irsKee5gg==
X-CSE-MsgGUID: uZxTOs2TTRGij2oXzhIpjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="222970488"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="222970488"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:16:04 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4CAA73050
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:04 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id ED46C1C2DF4A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:16:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 0BF24100249C;
	Thu,  2 Apr 2026 02:16:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 36/39] setxkbmap: upgrade 1.3.4 -> 1.3.5
Date: Thu,  2 Apr 2026 10:13:51 +0800
Message-ID: <20260402021355.1324-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125950

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{setxkbmap_1.3.4.bb => setxkbmap_1.3.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{setxkbmap_1.3.4.bb => setxkbmap_1.3.5.bb} (86%)

diff --git a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.4.bb b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.5.bb
similarity index 86%
rename from meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.4.bb
rename to meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.5.bb
index 9c522d6ae1..3b0fdf6077 100644
--- a/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.4.bb
+++ b/meta-oe/recipes-graphics/xorg-app/setxkbmap_1.3.5.bb
@@ -16,4 +16,4 @@ DEPENDS += "libxkbfile xrandr"
 BBCLASSEXTEND = "native"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "be8d8554d40e981d1b93b5ff82497c9ad2259f59f675b38f1b5e84624c07fade"
+SRC_URI[sha256sum] = "360193cecc93f906d8383a8fb5c1f3a7eed35e6ced0e118a64ee56ae13c88cac"
-- 
2.43.0


