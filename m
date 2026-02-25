Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA4CEFD21F
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:01 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41951.1772012278012919336
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:37:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pw0b2yhO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012279; x=1803548279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ss0zv8kdOap611JcBh1/rTfS3OiDUFHlOPV2kIm+NwI=;
  b=Pw0b2yhOiplWiRUu8vjMENUd5LTrj88NKJBcL0ZRrGxgPFsk4fsOpgkm
   k/xaQhGo2vgnR/qpoYMcaEjpbnJRnDf4s4bIx2Zw3si2b37C3hliKiSuF
   LcHIPSbWByYeDuPL5g4efjymbPHukqtHcssQUpRjpPyZDoHWsTtiRWMNO
   NjwDcpymxBJMp8jUCFgGCyS+O+mq+kL+OUVqWGWA0xYJrLEN1dTadkQqa
   hcdZJr8H001NV9XAeQ5Pkoh8giFB1i8rvaDgpH/sfOaGgp99C9l3/0u75
   WTv2hG5vwedgLO/TylzjB4hP5w+RIUrGCPBLyJc4h4YIwY9Uf9AWzeGFD
   w==;
X-CSE-ConnectionGUID: DgqLu2WQTHOZO4oKX3LLNw==
X-CSE-MsgGUID: /YdBfBUqQyS9Wrnn+pIgQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230981947"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230981947"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 6E3BE40757B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:56 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0F8FF1400607
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:37:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 137D6101BB6B;
	Wed, 25 Feb 2026 09:37:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 11/33] gtksourceview5: upgrade 5.18.0 -> 5.19.0
Date: Wed, 25 Feb 2026 17:37:05 +0800
Message-ID: <20260225093727.1284-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124623

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
 * Annotations: draw a background behind annotations; align to the right
   when they fit (e.g. for diagnostics)
 * GObject Introspection: fix nullable and callback destroy annotations
   (get_location, get_match_style, scheduler, callbacks)
 * Fix gutter text renderer text layout snapshot deprecation
 * PHP language: highlight PHP 8.0 attributes and add new keywords
 * New language: Cornish
 * Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gtksourceview5_5.18.0.bb => gtksourceview5_5.19.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.18.0.bb => gtksourceview5_5.19.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.19.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb
rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.19.0.bb
index 75010a67b8..075fb754ec 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.18.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.19.0.bb
@@ -20,7 +20,7 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 
 GNOMEBN = "gtksourceview"
 
-SRC_URI[archive.sha256sum] = "051a78fe38f793328047e5bcd6d855c6425c0b480c20d9432179e356742c6ac0"
+SRC_URI[archive.sha256sum] = "242bf2c3dc51c44402294b584141399afe7cf87bfacf2b958685cece964301c5"
 S = "${UNPACKDIR}/gtksourceview-${PV}"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.43.0


