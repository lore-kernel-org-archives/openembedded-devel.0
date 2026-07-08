Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CABC44503
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4900.1783503922813246760
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qIJDR3GN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503923; x=1815039923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IJccS9MgULPW17DuoeEHQPpSqfRQImknA94m8IM8v6o=;
  b=qIJDR3GNCi1cvsC6o9owjz2ASSlqFpJ/gcCbRz3r6UBZoqEUjMfQuFb9
   S5gdZ2BFUmBKuuare2jaSSf4zgMVYSGP0Ou34nikeR6DpZpTM4tkOEMK6
   Wt8Zlc5QrS2MnR+NFxtLZ2KzVKzOItNMJ6U3BZbKLRycfmwkOYJeP1ykW
   SSwPRxGiIOX08AQFrcoyxswfWx+W5kXgAYYTqxMuF1MqC32K+6ceGeoFR
   wSpu9veqABllj5EZxoEgwr5xHkQLsXhwI2cg8rVcSXk7SKmOsQjdJ8SP7
   /JhNAOCmpKlaR9A+MhSEmTqRuf8scua7Wik5eV/wKyzBP19WM6J11lVXq
   Q==;
X-CSE-ConnectionGUID: DBGThQC1R2iZ6/bY8xCs7Q==
X-CSE-MsgGUID: fxvNug2aRceb1aqHKfV1pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="234112665"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="234112665"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:21 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2E9531C000F1
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:21 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D4BC01C2DF56
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id F0707180112F;
	Wed,  8 Jul 2026 09:45:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/37] graphviz: upgrade 15.0.0 -> 15.1.0
Date: Wed,  8 Jul 2026 17:44:14 +0800
Message-ID: <20260708094508.2060-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128075

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- When using the fdp layout algorithm ('dot -Kfdp …' or 'fdp …'), a new command
  line option '-Lm…' is supported for controlling the "m-limit".
- The vt plugin has a new option for using Unicode octant characters to render
  8-pixels-per-cell output, '-Tvt-8up2'.
- When building from source from a Git checkout, builds with
  '--disable-python'/'--disable-python3' once again work.
- Gvedit no longer leaves temporary files on disk when previewing.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_15.0.0.bb => graphviz_15.1.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_15.0.0.bb => graphviz_15.1.0.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_15.0.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_15.1.0.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_15.0.0.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_15.1.0.bb
index f8fdb47cf5..4cc38f15cb 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_15.0.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_15.1.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "937fe4757687260e46a1c9a171cc677e3d4c89abd1efc8885ccb66467c3616ff"
+SRC_URI[sha256sum] = "4c44f9f6654d39638db7cdb6a088735117469015299298d82087b24dd4042b16"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


