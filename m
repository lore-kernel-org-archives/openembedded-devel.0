Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47554CD583B
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:44 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3096.1767781778105423384
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FR8NZkYj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781779; x=1799317779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UQHa2CY/el8Msh5XtFVVnKQ42ugU/hsISFTsNai5kkw=;
  b=FR8NZkYjVdXIOMVqDBnkhecsCP0ifSt+rQ4FVyiZg6qonIDt9x/6EJWF
   jesc57PpF3LCxHAbPqcL8bHWlvpDsLY+zurzVmRmodYDzsGM5WsyTYMbb
   iEwvz6XAi21B3v1luGi+kTzcv/hxb7A9iczf+Dxhg995ROniPH4Jr3e9G
   PMgzKkSH6Wrab2/6Zcl2l0KYo4RpxH2i6wNAmZp6f0YO+sH4njkBVXsk5
   3aR8z9d8Kr7IGMgxbiOarvp/yShXYIugnWum/btW0n4GlvQv65z8f9C30
   zaHAIz+pZT5WaWFfPsfrq+c50ByNewD2O5498/bYa8e26FEum6jfc5zUi
   g==;
X-CSE-ConnectionGUID: QiZRdrgHTM+5dfo65ynqdQ==
X-CSE-MsgGUID: +lQRl4IjRBGW6rKwQv4i/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="224467735"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="224467735"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:37 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A147B820711
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:36 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 5BB201809C1F
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8B4E6829F3C;
	Wed,  7 Jan 2026 10:29:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/24] python3-nocasedict: upgrade 2.1.0 -> 2.2.0
Date: Wed,  7 Jan 2026 18:28:48 +0800
Message-ID: <20260107102855.228-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123215

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://nocasedict.readthedocs.io/en/2.2.0/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-nocasedict_2.1.0.bb => python3-nocasedict_2.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nocasedict_2.1.0.bb => python3-nocasedict_2.2.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-nocasedict_2.1.0.bb b/meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-nocasedict_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb
index a7c3f55702..4580fff727 100644
--- a/meta-python/recipes-devtools/python/python3-nocasedict_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nocasedict_2.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pywbem/nocasedict"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 
-SRC_URI[sha256sum] = "b563d5851cbb0e0b10fbb6189ba87e0612d22e5a6f3a004a4573ab5b38aaaa7d"
+SRC_URI[sha256sum] = "6f2b608602b0568cd06ff46e2a0f231d2a0c247d6dc120672c381cb29169e1e7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


