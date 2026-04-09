Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 659A9EA3C2D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:32:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129107.1775730766300024818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nIpgN3T/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730766; x=1807266766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bta8OdaPNgtKzifnzzIfKVbbj6dUEHtjRbBoGsRnt3A=;
  b=nIpgN3T/SjZ99HGhhJOa12ICTlHE0H3BT+UpBZWs5lJcmtdtctGyZd8H
   a/hjWpVd0cwSNuY2bbUru0aqXQFcf0ykS4yP85izlwSaEpnVE7VXqJiIZ
   nsvLCsXwzTrka9ST2dJr2w+ioFoE1mQa7m97PZmQdgjjo0wWCWwJ0PEeB
   gykoLK6//kepGv6YsoHFSFFx2n/hm3zcVPW8j5eDA2nJ/VA70Udo82Qu2
   JnSO/D2rhwsv7PZdDEbZoddoRQi2579Hzr7iWFH6Mr9U0RZEtIwIKYaE6
   D6FxnulHrslYm0qNDYXjZqBz6ut1f7IyX8WPoT4RBUtCjJhGlTAsoxUSK
   Q==;
X-CSE-ConnectionGUID: ctv5GAiART2wsQP8AVGIWw==
X-CSE-MsgGUID: cV1Ty0B7Sw+dJ51r35GcoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="215190580"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="215190580"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:32:44 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9385F820400
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:44 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4E4E21800260
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:32:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id D1578405EC0;
	Thu,  9 Apr 2026 10:32:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/37] gtk-layer-shell: upgrade 0.10.0 -> 0.10.1
Date: Thu,  9 Apr 2026 18:31:52 +0800
Message-ID: <20260409103223.1574-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126155

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix: unmap when surface is immediately requested to close after opening
- Fix: time out after 1 second of waiting for configure
- Fix: edge cases around montiros changing while being mapped
- gtk-priv: rename ast.py -> c_ast.py to avoid name collision with std lib
- Compat: bump supported GTK to v3.24.52

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gtk-layer-shell_0.10.0.bb => gtk-layer-shell_0.10.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/gtk-layer-shell/{gtk-layer-shell_0.10.0.bb => gtk-layer-shell_0.10.1.bb} (92%)

diff --git a/meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.0.bb b/meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.1.bb
similarity index 92%
rename from meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.0.bb
rename to meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.1.bb
index 2bfe9b0e77..46a0562d2c 100644
--- a/meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.0.bb
+++ b/meta-oe/recipes-support/gtk-layer-shell/gtk-layer-shell_0.10.1.bb
@@ -18,7 +18,7 @@ DEPENDS += " \
 SRC_URI = " \
 	git://github.com/wmww/gtk-layer-shell.git;protocol=https;branch=master;tag=v${PV} \
 "
-SRCREV = "3964966d72ea3359f4ff748081493e979c080b7e"
+SRCREV = "fd88ba666c18ff65ea786bf7b2e270d840030817"
 
 inherit meson pkgconfig features_check gobject-introspection vala
 
-- 
2.43.0


