Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95FBCCD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:52 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19029.1779190790925853936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xfh/z9co;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190791; x=1810726791;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8udTsa6Zoy/W/nsiyaY97NG9Zkty67WlQcm5W7oBmP8=;
  b=Xfh/z9coh1CO1fzY3CaZSdu1Xle0f27Uc4iZFuCc5UBZwrOIt6Mu8noK
   qOUWBt6tZJz0Kn9h20xQpUyM89I4WwE3htdLhnQGjyCc+WxHU08yDu6mJ
   Erp0WQ5xp1vLSIBiVk3FdfSiujcPYyIN0RAmt847bTv29ldF+Se9MoBlw
   4ob1lBTxGYD+1CyCthU8XKKL6JVAH87Ga7qo+ltiByLnFhDbGqE+NfnWq
   yn3NHmNgQ2dYH2Ios0hbm9rK63TMNOajEqBQFh3LiQE7pkejrcsc3qp7x
   tfufKNNjW6YCnN2m4d3gTwjSgWQmU6YsMMIVPC1ew5QdP1CVHkiVWZx34
   w==;
X-CSE-ConnectionGUID: ujzE4B+dQ1mcMTON5CzuOA==
X-CSE-MsgGUID: E9uXPRc0R8+zdOIv/93FFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="219995166"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="219995166"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:49 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5D57E1002B9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:49 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 14BD614042E3
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id AB8B3405ECF;
	Tue, 19 May 2026 11:39:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/38] libsdl3-mixer: upgrade 3.2.0 -> 3.2.2
Date: Tue, 19 May 2026 19:38:54 +0800
Message-ID: <20260519113921.655-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127073

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- MIX_DestroyTrack may now be called from a mixer callback
- Fixed WAV decoding on big-endian systems

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3-mixer_3.2.0.bb => libsdl3-mixer_3.2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-mixer_3.2.0.bb => libsdl3-mixer_3.2.2.bb} (96%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.2.bb
similarity index 96%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.2.bb
index 27a02fcc32..138536c628 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.0.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-mixer_3.2.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=df8f4d887d3997f6e9cf81bb7f43dbf7"
 DEPENDS = "libsdl3"
 
 SRC_URI = "git://github.com/libsdl-org/SDL_mixer.git;protocol=https;branch=release-3.2.x;tag=release-${PV}"
-SRCREV = "cedfeef30e93db35eee6b25759117da63f8e5a4f"
+SRCREV = "a5e1890afc5115ffd16cefdbb4d50f74bf4970ce"
 
 inherit cmake pkgconfig
 
-- 
2.43.0


