Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0453ECCA471
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:09:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.5580.1759990139924751069
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:09:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IWTKaEhR;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990140; x=1791526140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OCoBr/j2bQPiM1bVjLvs2/HL2m8C8UcSvg0jDWlKW1g=;
  b=IWTKaEhRKEGfuzBHuXwMA4S1M+NfTWuHHoJuRLF9R2HFrCG44Fy45Q+W
   SXMV8YgWarmpjQBSXO4CFVZ82B3UoB/Yc9pLFbViLttAECT1hlfPY3om/
   8wjzM2rvAs60Ff9pvE0KZBdJn3aH0cfa6Vzl+kqScEukahMqQSJ2QN54o
   7YxuyruYFJXZcY+CxLgC0BC+5BtOu/2yA/KobgmV1KA11ie5b3A284UlF
   I2nhL6YkKf2TsgeOA33FN9iZCUhkLhSyWGa0hIY00TY/ssAiIJhTdWdYr
   INKHbjtP3HVksj+k8WxjwZWtSHMliL1klhr5tCiJYk6PA0KNsqzAk5n0m
   g==;
X-CSE-ConnectionGUID: ZryAXUXjSFyFaBfsY12wNQ==
X-CSE-MsgGUID: AwfLkDrwQhmoWM9l+FXZ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="219034533"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="219034533"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:59 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 783B31888
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:58 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3292F1000451
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C1C281001CFB;
	Thu,  9 Oct 2025 06:08:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 22/22] spice-guest-vdagent: upgrade 0.22.1 -> 0.23.0
Date: Thu,  9 Oct 2025 14:08:09 +0800
Message-ID: <20251009060809.445-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120418

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ce-guest-vdagent_0.22.1.bb => spice-guest-vdagent_0.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/spice/{spice-guest-vdagent_0.22.1.bb => spice-guest-vdagent_0.23.0.bb} (91%)

diff --git a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.23.0.bb
similarity index 91%
rename from meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
rename to meta-networking/recipes-support/spice/spice-guest-vdagent_0.23.0.bb
index b13dd5d148..ae43624320 100644
--- a/meta-networking/recipes-support/spice/spice-guest-vdagent_0.22.1.bb
+++ b/meta-networking/recipes-support/spice/spice-guest-vdagent_0.23.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://spice-space.org"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRCREV = "aa08162f036840d3e33502dc0a836b03b9cec97c"
+SRCREV = "761770bf10455563375a022315039779bf8aac36"
 
 SRC_URI = "git://gitlab.freedesktop.org/spice/linux/vd_agent.git;protocol=https;branch=master"
 
-- 
2.43.0


