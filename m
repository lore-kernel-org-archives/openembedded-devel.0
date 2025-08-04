Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CF3C87FDB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:33:53 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13435.1754296427871557363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fSrdg7DL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296428; x=1785832428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E4y+USHJlJMyuuBuyGhMEreNXkXzK+Hk6U79UFsptnw=;
  b=fSrdg7DLLYJtBnjcdg235fTLoeR9Pmoenlhd/TZM3BNsVI0V3SYQvetV
   5MT7vL5zQLUIejCsktis6rrFXhla9I2ND8Nv9LxnV2fiI8K+9adA6Bk4f
   6sVg9m2vyLYPXlmeiP5AK3eIyEmrvykw0+AZF7Ua32tlq+AFNv5JpVsRg
   6rDpGVw7HiuUhYNsaYO/EV7/V/+56sH+EQuYx5BXZGmX8rNHKZO8XjUSh
   fvvLsja6T4/p1yr1aYNj3O+UqnkvP9sMU0mCvUJNO01WZ9UxzY82SzQVV
   BihN/nv2+CGOa3/UepkrxX5r4IWuZzLASTzewhKS1o0FJYOGj5pfV6PpQ
   g==;
X-CSE-ConnectionGUID: TC0yv+onT0ikZa1b30WE8g==
X-CSE-MsgGUID: uHndhTrCSTqCPoegpyy9bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="207643576"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="207643576"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:46 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 36FF8820411
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:46 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A26F88606C6
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C37FA1A0073;
	Mon,  4 Aug 2025 16:33:42 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/18] ctags: upgrade 6.2.20250713.0 -> 6.2.20250727.0
Date: Mon,  4 Aug 2025 16:33:24 +0800
Message-ID: <20250804083340.1649-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250804083340.1649-1-wangmy@fujitsu.com>
References: <20250804083340.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118835

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20250713.0.bb => ctags_6.2.20250727.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20250713.0.bb => ctags_6.2.20250727.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250713.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250727.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20250713.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20250727.0.bb
index e830d3ded7..204778b3b2 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20250713.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20250727.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "6ade39359729b121661ed985f5b0b1f86faaf122"
+SRCREV = "2fd182cffd09614f9e23db9403e78d2884f42818"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


