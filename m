Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0331FD531D
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:23:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.91516.1772184199252012162
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Oi5iwQVV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772184199; x=1803720199;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=X3R/z+GsNltfiAMBlOq00Lw3itCSv5VJNQbWa8cTKNE=;
  b=Oi5iwQVVojBfKga5miEPvRNty2XMKglsXeZB5EU5xUh3LwrBS3/LSfct
   J25/AbFLhtUjQZxlnzxWIXnIxSBgxgkE15wXHTICIPlwC5PPMyddrJ0oV
   LMWN3SFB8ACmYkhy3oeKlskYBQ+tfi5Yqt1WsHkm+eo0E7NnIZG4a6ldT
   DF3Wg4lqduA2D61ZLUj9F2fCeByReryzDK3en7YrytzmMaXmg3DizYATk
   08AIr9ioND2VJk0l1y0zpk5XaEC6opsUar+Zpy6YkUKTm+JtDcL5xvT/E
   fmqx813AwKoJ92XILFOAgCP63hWRZCbCpgaFPweYyRs1/h+ip+18ACxje
   g==;
X-CSE-ConnectionGUID: UGuoCl+kSK2J3g1jfKluZA==
X-CSE-MsgGUID: j8iCvgS+QJS9px5XERmgeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="218735449"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="218735449"
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id 7A52E8203DE
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:17 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 33056C06D62
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:17 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id F1383100719F
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:14 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-fastapi-cli: upgrade 0.0.20 -> 0.0.24
Date: Fri, 27 Feb 2026 17:23:08 +0800
Message-ID: <20260227092309.1381-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260227092309.1381-1-liuyd.fnst@fujitsu.com>
References: <20260227092309.1381-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 09:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124697

Changelog
  https://github.com/fastapi/fastapi-cli/releases/tag/0.0.24

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...hon3-fastapi-cli_0.0.20.bb => python3-fastapi-cli_0.0.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi-cli_0.0.20.bb => python3-fastapi-cli_0.0.24.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.bb b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.bb
rename to meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb
index 76ddb409bc..90624b86a5 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.24.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e0cf8d811ea2046529403707b266fb5a"
 
-SRC_URI[sha256sum] = "d17c2634f7b96b6b560bc16b0035ed047d523c912011395f49f00a421692bc3a"
+SRC_URI[sha256sum] = "1afc9c9e21d7ebc8a3ca5e31790cd8d837742be7e4f8b9236e99cb3451f0de00"
 
 inherit pypi python_pdm
 
-- 
2.43.0


