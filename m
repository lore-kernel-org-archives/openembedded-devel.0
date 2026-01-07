Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E925CD583B
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:54 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3068.1767781784448807152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XmnUvIHh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781783; x=1799317783;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OstBQ1XoB5gZTA5R7GlsN/YmuHR9O1uvdnNlzbfcY8k=;
  b=XmnUvIHhhegYGkCbaSeSmmYgUuRLXwEoytznu8JULLbi+zslA9IvN6x4
   l8Tm1XaIXieHTf54CJv3JbjIlK5zkAd5J1kySCdcNma3AqRLg7u3IEPQy
   qNjeij058R4r2VvDZalK+6vYqrJOpe+VvRjHHds6+I4ASp4TvNffhyiaj
   RnRdQ6MTpDCxMoHc5MW95Adu7BE7qsvQQPQhWUZYlO6NR44p6nju0e7jj
   58kanHhJN27MO2Yvh19AhZOh1D4JQKTfOU1BGYx5RlxSKQ0HUB94uDEdN
   dk6k/l00AwmowO8BJaI1Rd3OBJqsMKUTOX5YVCp8Zt+KV7Bi+Z1ZDwmbd
   A==;
X-CSE-ConnectionGUID: Kzr/D184TDO1YACJioNy3w==
X-CSE-MsgGUID: 6v0JAqdJTT+Zh7fWO754xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="212496142"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="212496142"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:41 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 04C491C00094
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:43 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AA2C2C026C4
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DD8EF829F3C;
	Wed,  7 Jan 2026 10:29:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/24] python3-termcolor: upgrade 3.2.0 -> 3.3.0
Date: Wed,  7 Jan 2026 18:28:51 +0800
Message-ID: <20260107102855.228-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123218

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add support for italic
- can_colorize: Expect fileno() to raise OSError, as documented

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-termcolor_3.2.0.bb => python3-termcolor_3.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-termcolor_3.2.0.bb => python3-termcolor_3.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-termcolor_3.2.0.bb b/meta-python/recipes-devtools/python/python3-termcolor_3.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-termcolor_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-termcolor_3.3.0.bb
index 100292858f..2d0f4bf630 100644
--- a/meta-python/recipes-devtools/python/python3-termcolor_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-termcolor_3.3.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=e5f5f7c9b280511f124dba5dda3d180e"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "610e6456feec42c4bcd28934a8c87a06c3fa28b01561d46aa09a9881b8622c58"
+SRC_URI[sha256sum] = "348871ca648ec6a9a983a13ab626c0acce02f515b9e1983332b17af7979521c5"
 
 DEPENDS += " \
 	python3-toml-native \
-- 
2.43.0


