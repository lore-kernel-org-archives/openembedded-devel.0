Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE0ECCA471
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:24 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.5572.1759990101467339824
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jd7T56tp;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990101; x=1791526101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jPvU/Kd2B8jLj2gTDv+QOqpkEA9OKoTwtscDNmgPewo=;
  b=jd7T56tpeLvNWuXhLJm2+ZCcE1TNIjklR+1nsqaiGScfcr8WOHRrnNvo
   tB6XMyeIHgcXV1nWdE2gxd9WlgllhqA9oWtgoWaLqkq4wE/U9XNDVTFYF
   Xc5VaOk61ruzvrbEoHLz1QCJAf3EQNLKDByuovDbMOxe6T6gMIOck978f
   lu3sPBTIb2CzI/KQpUTgUEdZ14K0+JZSjhLgFn6HCWsNX9ovahkuvJ9bt
   2SRVFKL895TFyif/IuD4PAi/u89Jxe5+d7/cWeB/kzAq4vyxX6Mfmp/oC
   2hoIai56nApjxtm0ExuJ49sxlcO5r2eqHsG5qdknXp/a3trwWHpbUAehb
   Q==;
X-CSE-ConnectionGUID: m7VMVeiETxOXH+zDETD+5w==
X-CSE-MsgGUID: CGovCIo1TP60/bMhRP9zZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="194386497"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="194386497"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:19 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id C2AD4304E
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:19 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 75A5B18009DD
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 15F981001CE2;
	Thu,  9 Oct 2025 06:08:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/22] graphviz: upgrade 13.1.2 -> 14.0.0
Date: Thu,  9 Oct 2025 14:07:50 +0800
Message-ID: <20251009060809.445-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120400

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_13.1.2.bb => graphviz_14.0.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_13.1.2.bb => graphviz_14.0.0.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_13.1.2.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.0.0.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_13.1.2.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_14.0.0.bb
index 8dc869d56b..c9e7618312 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_13.1.2.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.0.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "2229ae9265eb51967841fb43c150dd253f26f51ab5c854ce103f665aaf948b1e"
+SRC_URI[sha256sum] = "2e3531733cb584668c09bebd319d42b7284278e7702581b1ffdb279f2acd2fce"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


