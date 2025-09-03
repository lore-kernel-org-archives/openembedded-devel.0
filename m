Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61F8CAC580
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:03:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8056.1756890213767674791
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZXjn2Mmm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890214; x=1788426214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6v2nzNJwi7IubPahc6IRs+PrN/xzDFy2UFe6PO9Sids=;
  b=ZXjn2Mmma/NJFOUgPcG/yQ0O33SCnGUZul/bo5rQGc2AUZevVrdxPq9y
   w5Ym8VxHe1XoElsGK1F3XRn2UlhgUm2e1mthewxjzXm0A0orJJ5NQM8+a
   LW9buZnThswXLnHCnFq6VI87ZtWrCuw5RBktDqRrBVFmKFyqvqq7U3T/R
   lUZNPH25i5140zgfvmJ9/J8TQ+58OeEH0w6xhM22HeQflQyxQia8YMQ3f
   2xrGqhtKb1uKB8jO1Tzbun6ef8YJGf+n/PG0QM8IgqHRNnxhFQrR22Euj
   UPpb7De4WQwOvt30c4y8Go55dsZJvKk3Dj9haOXSL0Ab2MI1b6icqFQEE
   Q==;
X-CSE-ConnectionGUID: ITWOfPPtTiaAuDyyfMXjUw==
X-CSE-MsgGUID: SvZeq+LQTzCE//Umab8jSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="210834732"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="210834732"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:33 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 456358204FF
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:32 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 037E014687A7
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:32 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 199681400BF2
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 792A51A008D;
	Wed,  3 Sep 2025 17:03:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/56] nano: upgrade 8.5 -> 8.6
Date: Wed,  3 Sep 2025 17:02:37 +0800
Message-ID: <20250903090317.2002-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:03:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119213

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_8.5.bb => nano_8.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.5.bb => nano_8.6.bb} (88%)

diff --git a/meta-oe/recipes-support/nano/nano_8.5.bb b/meta-oe/recipes-support/nano/nano_8.6.bb
similarity index 88%
rename from meta-oe/recipes-support/nano/nano_8.5.bb
rename to meta-oe/recipes-support/nano/nano_8.6.bb
index 8c47289691..8056456a0f 100644
--- a/meta-oe/recipes-support/nano/nano_8.5.bb
+++ b/meta-oe/recipes-support/nano/nano_8.6.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "000b011d339c141af9646d43288f54325ff5c6e8d39d6e482b787bbc6654c26a"
+SRC_URI[sha256sum] = "f7abfbf0eed5f573ab51bd77a458f32d82f9859c55e9689f819d96fe1437a619"
 
 UPSTREAM_CHECK_URI = "https://ftp.gnu.org/gnu/nano"
 
-- 
2.43.0


