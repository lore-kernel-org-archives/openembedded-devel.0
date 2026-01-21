Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D4B5C44520
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:33:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9495.1768995196021823973
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HyFN2fQD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995198; x=1800531198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qppppL64E4au2HXADgxmJ+xjySwwgZL/aHrxNyUs0gw=;
  b=HyFN2fQDmYTe9sWctwFAhyCUw1RckP2IyA9LHCtwFOf5FZEhiLwA9ePX
   +NlQwp7wA7uvwPKCBnzSm0wXznRXO8PASEJEWXIeTqRlYGoX5avaw4SX5
   qbnA0puAuOaSP6AmSp/s+Lm7bgz5k5k0Ak4V9582AUdumlUFRb4mZqVes
   fOMjk4w69d4dcBDiF1FKzZkZ9rxkTsU50FlC8CrZMm79HaoQphmCq2Aqk
   6FfS5VVfWIC52SMovDPh1VtbP777xKsp80XkWDuclSOBiIe8pFw5kfm6v
   VnyH8w2aZ7fDq4OgEHc9o9l90M6mPL3sKdp1olabWD7v0pju6y8eD6Jjb
   g==;
X-CSE-ConnectionGUID: SgAABRgcQcW0uXN/vqvtOw==
X-CSE-MsgGUID: BR8FpviBTXGvbxIIyNWW9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="225969540"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="225969540"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:33:18 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 47E8A1C000A2
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:19 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EC32E180323F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5EFE31404867;
	Wed, 21 Jan 2026 11:33:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 30/30] grilo: upgrade 0.3.16 -> 0.3.19
Date: Wed, 21 Jan 2026 19:29:21 +0800
Message-ID: <20260121112921.857-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123721

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/grilo/{grilo_0.3.16.bb => grilo_0.3.19.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/grilo/{grilo_0.3.16.bb => grilo_0.3.19.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.19.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
rename to meta-gnome/recipes-gnome/grilo/grilo_0.3.19.bb
index 7862748184..c3d6294d06 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.19.bb
@@ -9,7 +9,7 @@ DEPENDS = " \
 
 inherit gnomebase gobject-introspection gtk-doc gettext vala
 
-SRC_URI[archive.sha256sum] = "884580e8c5ece280df23aa63ff5234b7d48988a404df7d6bfccd1e77b473bd96"
+SRC_URI[archive.sha256sum] = "0869c81d19ab139c667d79567c14ddcb6cb5cbfc0108d04cade287eb29536706"
 
 GIR_MESON_OPTION = "enable-introspection"
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
-- 
2.43.0


