Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B09C83F3A
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:41:24 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.15850.1752648078485723836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P7mERJ9r;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752648079; x=1784184079;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tZJ5uLY1XuzLzHQyP6xOjchGhDLspoAEpx0ODOZTETE=;
  b=P7mERJ9rtY4VP3bn45ZVxta/K7ugQKcmVeyVsSpyIjaFxM0ApFovvy/L
   zfPUM7rrdr/zsodr06YsWCe/D2MYUR1JdjuX7dkaZBCDEIS9juiQ1Xfgd
   wQA64efRB8ypYrdf7cGTbb5ebTlhNK6yA4x0bFa0SeLXlhDw+rUtWorkT
   WT9989/iSTXwbiKyYJZVA3qTaYHqbSpP5e0VzSeDHJAlxxHV1ZKNQrdkp
   k1Z0ZJkUpow/PeBQWk9WEiYoshn9QpHcXcmC1zDuPYUqZYdL/iTJrSEWJ
   Wx/DH1noY8l13TY9+Q0Wjg7KGGxqQO+z2CjimUGLrwwA8JIPjnv0cCYqY
   w==;
X-CSE-ConnectionGUID: 7jrXmoA9Rve2w9gXhjZZ3Q==
X-CSE-MsgGUID: px2MvN5RQTe9RLQUMaanMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="205763100"
X-IronPort-AV: E=Sophos;i="6.16,315,1744038000"; 
   d="scan'208";a="205763100"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 15:41:17 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id F3CB78203C6
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:16 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5D1A214003B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF90F1A008D;
	Wed, 16 Jul 2025 14:41:12 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/14] libsdl3: upgrade 3.2.16 -> 3.2.18
Date: Wed, 16 Jul 2025 14:40:53 +0800
Message-ID: <20250716064102.1813-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250716064102.1813-1-wangmy@fujitsu.com>
References: <20250716064102.1813-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118575

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.2.16.bb => libsdl3_3.2.18.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.16.bb => libsdl3_3.2.18.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.18.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.18.bb
index 9579cb73a1..168230e5d8 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.16.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.18.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "6340e58879b2d15830c8460d2f589a385c444d1faa2a4828a9626c7322562be8"
+SRC_URI[sha256sum] = "1a775bde924397a8e0c08bfda198926c17be859d0288ad0dec1dea1b2ee04f8f"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


