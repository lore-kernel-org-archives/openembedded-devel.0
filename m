Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED3DEA3C37
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128832.1775730834423487256
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tg81j6Pb;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730834; x=1807266834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vRk88HRjgJt6OAr2pVnnqF9NrVsQPA552crckWEP5ho=;
  b=Tg81j6Pbbp/dkNAvfVhm8jlU49NiW15EO9Ouj/5Pk10vjxrQ6Q1mtWfH
   dufIvqUQgjZbAiTVjXx5y9gcBQhrRKuGYcjsMdzFmrYEUX7BJhfHGARHq
   icfOwgbas+L1GQZsm7J5uC5kseQ6QFtdJz80sWN8rUUSSfvQ+SL5Dzmft
   qJfXmiAM54zhrp10zNv+FcL67JUhctuSqobmrrGL2qkHr1vm5Sb23LTYm
   WtdGHFgEleNY77atxbgvgYvAD6fHyLxgVUAJAdr9ASyfYc0nV8oi8RSG+
   BCkEEeHhHNZXeBN2n4rSMrtyUXTTrq0SFHHyLoH17vDDyma1o490gAyDg
   w==;
X-CSE-ConnectionGUID: Ci889SXbQTmE77kf1VasnQ==
X-CSE-MsgGUID: HiBbAwMMRnak5lJp+HLkmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="215190638"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="215190638"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ECE381C00546
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:52 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 99830180414F
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 055EC403B5E;
	Thu,  9 Apr 2026 10:33:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/37] python3-cmake: upgrade 4.3.0 -> 4.3.1
Date: Thu,  9 Apr 2026 18:32:03 +0800
Message-ID: <20260409103223.1574-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126166

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.3.0.bb => python3-cmake_4.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.3.0.bb => python3-cmake_4.3.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.3.0.bb b/meta-python/recipes-devtools/python/python3-cmake_4.3.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.3.0.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.3.1.bb
index b9eb56891d..5787b73d98 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.3.1.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "b25ef14e4ebc16219eeb199da2199fc526c011f9973e02e7c21c69bfd46ed752"
+SRC_URI[sha256sum] = "6fe523413cdd2568a19a6ec297b8f869a95a3f8edaf0dd73731b81412216e00e"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


