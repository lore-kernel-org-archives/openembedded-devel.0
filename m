Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D533ACAC5AD
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.15424.1758015725877264872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rl4kj6z6;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015726; x=1789551726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z+fQF7r23g7YahPJAxRva+bPsDPRK1RRrg2kJYw2SWg=;
  b=rl4kj6z6UptR6RgJRVNKNXHRt7CuUYBSJLvIXDtSKs8eMszhl5HjP0bi
   4qcWJuKrwxm4RbxDCKehMvM1R96kiYCMfdK5th/mvYF4VnTWPMcsPdKQp
   VyS+nXrvQUj4i5mjhj8k+vHknym92IVjycG+tASQoWWk63riqQTURsjwJ
   f80D2sIVgPIjPQ6kCujwEX1+w84dY2XrykgE7IAevU1J85FPcQKAUrasB
   7LLkMGKQ8CG7rjwTUPPUOBzpekogViSP3JVa0rWTC7I5wjPmfODtXrXd/
   V2A4npmCSxB6h3tvtFj4HMGT14IUkXHNfGP1Fq1JutpibAgcgcPhn+A0A
   Q==;
X-CSE-ConnectionGUID: vwXMv+nxTqCSOWQVAGbQgQ==
X-CSE-MsgGUID: DWP2jMdeQKuqslDy9v9OQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="212320876"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="212320876"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:04 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 39AA2C000B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:04 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id EF64314003B0
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:03 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 64A301003113;
	Tue, 16 Sep 2025 09:42:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 455421A0073;
	Tue, 16 Sep 2025 17:41:58 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/42] libsdl3: upgrade 3.2.20 -> 3.2.22
Date: Tue, 16 Sep 2025 17:41:20 +0800
Message-ID: <20250916094152.1479-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119433

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.2.20.bb => libsdl3_3.2.22.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.20.bb => libsdl3_3.2.22.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.20.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.22.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.20.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.22.bb
index 30e2d42097..d019212a7b 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.20.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.22.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "467600ae090dd28616fa37369faf4e3143198ff1da37729b552137e47f751a67"
+SRC_URI[sha256sum] = "f29d00cbcee273c0a54f3f32f86bf5c595e8823a96b1d92a145aac40571ebfcc"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


