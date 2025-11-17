Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21AFCCE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 07:51:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4645.1763365886489992259
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Nov 2025 23:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RJ/eFj0B;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1763365887; x=1794901887;
  h=from:to:subject:date:message-id;
  bh=dBXP6kK+0zhYWaUGBfcY4wZEHXpwZPSQwzxll74nXls=;
  b=RJ/eFj0BEG9HdiveIJq4b/EIpEpIlwbLv+urUEc39AtgeMOmdLtw/U3A
   LdoglQ8HASe460lEIG3BKXNXbwOz0nICk2Ktl4X4yrHyfSVU1wlp+mslh
   hQSsvHSa94qYHgYNAxMMHpsmz3rjObbWxvspHvfD0fTxMcGEjVdD7nPhC
   cJLbei5CGhib4sIurds9ryLlpRhSRBOvzDWHySJJDTSkeLrGpiO4lgUfS
   rA30hK0cxDy5FrWtOumUvftVflKbPlcMAufaj3NaxrliePBIuSMleIJAN
   bqLvZW/Fsp/7HyoEPz9Vo5T9t8B2ylTnQYXN2sZmBjvl29NvPRMa7kBeJ
   A==;
X-CSE-ConnectionGUID: U84d96n9RD2wTSJiYZcLTQ==
X-CSE-MsgGUID: joMmVhTTSmu+YERVXvDSQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="219465941"
X-IronPort-AV: E=Sophos;i="6.19,311,1754924400"; 
   d="scan'208";a="219465941"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 16:51:25 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6F5D4C000AF
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:24 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 2469CC008AB
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:24 +0000 (UTC)
Received: from zhengrq-VirtualBox.fnst-internet.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 6B30940F8D0
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:22 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] poppler: upgrade 25.10.0 -> 25.11.0
Date: Mon, 17 Nov 2025 15:51:17 +0800
Message-Id: <20251117075117.2705-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 07:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121759

Changelog:
 core:
  * NSS Signatures: Tweak the logic that decides which firefox profile to use
  * NSS Signatures: call PORT_GetError() only if the preceding CERT_PKIXVerifyCert() fails
  * Splash: Performance improvements
  * Fix crashes in malformed documents

 glib:
  * Fix ocsp check for signatures validation
  * Fix warning when running glib-mkenums

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../poppler/{poppler_25.10.0.bb => poppler_25.11.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_25.10.0.bb => poppler_25.11.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_25.10.0.bb b/meta-oe/recipes-support/poppler/poppler_25.11.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_25.10.0.bb
rename to meta-oe/recipes-support/poppler/poppler_25.11.0.bb
index cce5e5f7ae..7f079ec641 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.10.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.11.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
            "
-SRC_URI[sha256sum] = "6b5e9bb64dabb15787a14db1675291c7afaf9387438cc93a4fb7f6aec4ee6fe0"
+SRC_URI[sha256sum] = "63f155142b77349e2bccaef148e754e7506ab1641e713b83af4f54a8f8b15369"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
-- 
2.43.0


