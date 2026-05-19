Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2342CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:13 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19051.1779190866413884337
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dV+lWuUL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190866; x=1810726866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LllV8MbfgCSoyU+EI4HrOmHWNxPlMVDn0LniIXisgC8=;
  b=dV+lWuULF6PdvxO0JlWPfr692GzLiOsrk7vt1Nnfurh3+02YB50cy0q5
   gmcuylCuiUL6gDuF1HOtc1ZMl6MTxikJOjRXSiBXC5p0LMX8FVme4oQHq
   83AE9tTPdh20Ia3IfshYiz7hJ4uAJxNgCgKIwYv6vghOBZr+4yZUSRi5+
   C5UGBHmKnhAFj2HXDvm4JTRuHBeUZ8zv7Twti0/DzO+Zh1uaOUEBipW53
   zYx9xFTb8ccp88R96Kpig/vZI6PGVmsOOpU4C/rCYCMP5Y8fFSZHLDRWO
   StPLuo+VofcHsBntMswvMjFLgDXhB34536ncX8iHnY/xaM6nRe97o3vhb
   w==;
X-CSE-ConnectionGUID: vTAtDrNAStixJljL3OWFOg==
X-CSE-MsgGUID: SgHkVDuLSP6OcQ/wC2SfGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="241117061"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="241117061"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:41:05 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DA878C00552
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:04 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 8D047C06086
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 30665405ECF;
	Tue, 19 May 2026 11:41:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/38] python3-tomlkit: upgrade 0.14.0 -> 0.15.0
Date: Tue, 19 May 2026 19:39:14 +0800
Message-ID: <20260519113921.655-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127093

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Update parser to support TOML spec v1.1.0.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tomlkit_0.14.0.bb => python3-tomlkit_0.15.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomlkit_0.14.0.bb => python3-tomlkit_0.15.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-tomlkit_0.14.0.bb b/meta-python/recipes-devtools/python/python3-tomlkit_0.15.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-tomlkit_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-tomlkit_0.15.0.bb
index b1d05ae9a5..1cca29af60 100644
--- a/meta-python/recipes-devtools/python/python3-tomlkit_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomlkit_0.15.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "cf00efca415dbd57575befb1f6634c4f42d2d87dbba376128adb42c121b87064"
+SRC_URI[sha256sum] = "7d1a9ecba3086638211b13814ea79c90dd54dd11993564376f3aa92271f5c7a3"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.43.0


