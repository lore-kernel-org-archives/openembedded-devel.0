Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F798FD7F80
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:30 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92753.1772187325784266391
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=G2URqTvM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187325; x=1803723325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zFhazPSZiziLEs00jg3Mj4W9JaBa/GlF2jHEe4zpZmU=;
  b=G2URqTvMWP8uih4l4OzCSPgbiAcq4uPVP8fv97s9SiZYeMqsCVKxAa/P
   7n+lXk0NbPg7Qv8WrZ5sZcd9iUE4mNHQz4sZ2P6O4cy3rd5cLezWKDiXk
   K/JO0G64N8F1Wg3Nk+nhLeYoecbY9LHtDkts+gjUnHMOEQzKA6G+Qtscs
   OqmfmB6PKHmXZs2x7++Ea93avwTWCglscmZNELyprZgwTsRUIYUl1IxEJ
   iGjyJsLubqWHmwRDCHyTfG//nL39+Ih0Vef5mP2kQXea2v3sU3ktAiYK5
   usTJOOcXMBcjqwvtFBT3+RL6JX+C3h94zHlaLlKZ5kMPdMo4P6e8VlN2i
   A==;
X-CSE-ConnectionGUID: Mw+ymD+xQ4ekv29GTa48gQ==
X-CSE-MsgGUID: FB9LXqkWQN6AcXhqMbzq6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="219257632"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="219257632"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 3F07042A301
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:24 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id DFF891009E1E
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1A9C418005CE;
	Fri, 27 Feb 2026 10:15:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 40/52] smarty: upgrade 5.7.0 -> 5.8.0
Date: Fri, 27 Feb 2026 18:13:15 +0800
Message-ID: <20260227101327.1432-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124740

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Document missing inline implementation. Fixed #1152
- Fix static analysis warnings for isDot() and remove deprecated APC support
- Support for Laravel Collections style object chaining
- Regex matches operator
- Add support for Backed Enums

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_5.7.0.bb => smarty_5.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_5.7.0.bb => smarty_5.8.0.bb} (95%)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.7.0.bb b/meta-oe/recipes-support/smarty/smarty_5.8.0.bb
similarity index 95%
rename from meta-oe/recipes-support/smarty/smarty_5.7.0.bb
rename to meta-oe/recipes-support/smarty/smarty_5.8.0.bb
index 1d21c7eedf..89fe828ab5 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.7.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2c0f216b2120ffc367e20f2b56df51b3"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "73da7e90f302175a570662fcb0ba41f57b7a92ab"
+SRCREV = "78d259d3b971c59a0cd719c270cc5cbb740c36a7"
 
 
 INHIBIT_DEFAULT_DEPS = "1"
-- 
2.43.0


