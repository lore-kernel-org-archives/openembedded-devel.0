Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62691C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:42 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3359.1787132196030162802
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=azaK7Bou;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132196; x=1818668196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQxzT1VQUNy7/e745G76wW06XtymqlPByXn7SfndQHs=;
  b=azaK7BouOE7dtGag10OeWtrPAAfFV4uDkUhIHcwrccTtHDaB+blHhpfJ
   +c7l52qSbr1Blzgf5gK17zbqhKndCDd+XxpoA+wSj97TJJXajIbqrjEPk
   HQ9qzaF4TdjCFg0Gls+ZmxyJK8T4aUyVxkQWug+X56my9td6HGiHyzu23
   DxU2RH8pD/5NY0uV19ZJq9nsYrEgYtFELlcMBxoKOUwiT3lXbBRrFwyzE
   BRgM5tE/N4CqkYovo3S4JUfxhRHqD/P//ALG419vEjUYFHyPiE0J8rIzH
   n3HRDhQGlkA1ofStBqP4U7B/2k4NsLmBIXQvwUvU6T7TzHmrCqm+AylX3
   A==;
X-CSE-ConnectionGUID: M19Ba4p2SleacOYJ3f4I4w==
X-CSE-MsgGUID: n3EWm1pCTBOee9FlVqS49A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="238053966"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="238053966"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:34 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5F4C11002B81
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:34 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 1B23A148AD37
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2CCA51801C0F;
	Wed, 19 Aug 2026 09:36:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/70] python3-moteus: upgrade 1.0.0 -> 1.1.1
Date: Wed, 19 Aug 2026 17:34:46 +0800
Message-ID: <20260819093514.1101-42-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129312

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Improve hall effect calibration
  Fine calibration of hall transition point within the electrical cycle
  Sweep through 3 electrical cycles in forward and reverse direction
  If a hall sensor transition happens to be right on a sample point and oscillates, do something reasonable
- Support firmware ABI 1.1.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-moteus_1.0.0.bb => python3-moteus_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_1.0.0.bb => python3-moteus_1.1.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb b/meta-python/recipes-devtools/python/python3-moteus_1.1.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-moteus_1.1.1.bb
index 36348b0311..be35c409d3 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_1.1.1.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-wheel-native"
 
-SRC_URI[sha256sum] = "d66b00328e8cb3f57adfb54f43c6acb6d09c2215808c242725ece530fc7f9fdf"
+SRC_URI[sha256sum] = "a10a097100984ec16dfed7848bae1ee83e29cc00cd0bb3138cb599b697315820"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 
-- 
2.43.0


