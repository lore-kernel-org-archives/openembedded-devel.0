Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D1CCCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12599.1762847730925690796
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z40uaC5O;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847731; x=1794383731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p5qNYu+zJzG5QvkHpHGfN5vZkJduKZgs7v5pk24Ha9c=;
  b=Z40uaC5ODqM5C07h/Cf0zFIOAlxHPHImQtYH6RKvYVnHlF/U4CtmQO85
   i8+p+9W741KDbYLKUcItwWHDIxl5pEqtlkMzFntIvS2PnoytPKRLrTiRj
   pm3bURR1E7QZHjaKpE+1PMslVYdDOgtBz/bo7V6Z7FF1LawNIO5mbh4F5
   VyADpKNruo68MqBjT1BTptX/Q4MAiydqQkSgELdzfiJKKF1Fie3dBD3bX
   DHxZxD3AezyIafjKGwtZLokFrRuGFxhGuS7A0ebyQxnigXu9YaYuzc9Sk
   r0JwumGcVp/p++vqxUhBgW60zF6ruW6ztHZTHHvlNVphxT0cLWUupDKIa
   A==;
X-CSE-ConnectionGUID: kg+XZC6dRSqYOR2x87Tm3Q==
X-CSE-MsgGUID: URv4D9jSRSOHPYUhddVg7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218806817"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218806817"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:29 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 0A2D41C1C707
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:29 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id BD7DE140121C
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 441531800D75;
	Tue, 11 Nov 2025 07:55:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/23] ctags: upgrade 6.2.20251026.0 -> 6.2.20251109.0
Date: Tue, 11 Nov 2025 15:54:57 +0800
Message-ID: <20251111075517.1650-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121482

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20251026.0.bb => ctags_6.2.20251109.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20251026.0.bb => ctags_6.2.20251109.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251026.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251109.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20251026.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20251109.0.bb
index f63498bb17..bd6f5bbfc0 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251026.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251109.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "3ce289e1fb58d51098acaade2327807ede3eaace"
+SRCREV = "d8622b79321eee26e91ea8db12d97e0f1a406670"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


