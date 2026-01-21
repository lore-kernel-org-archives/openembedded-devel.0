Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C549C44519
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:33:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9489.1768995176377041280
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dDVinm0s;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995176; x=1800531176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZhEtENZWvkzjeShMIfami0w1dW9AG9Byp77z28qAoao=;
  b=dDVinm0s27FxBZ5CY2X5xtLBeOk9S4eWogChU78UlfieQVyj2pxLBReJ
   Di4vmSJAlYO4YkjtL3co+Z5+FpDks+dSWD6dQIr0JEh/KBlmThVwT5ypy
   A8LirdtZe4cPMUAdvGLGCxDMhptN/gZQjyUKitTbMfmDs+d+QI+frAHyO
   dSuIUw5w1OwzOAMP8QUGwK9Svtx8ySZochjaXLg2e0DIOX2i60ORQrzKa
   jw6itMH3XK10xPRdnMi+6ZDnakQ4QCihlrnNQNVInB7+pJaG/PLeNiW0a
   GO0uG5xOJmRsqASZ1o0SHX67FKWPTWxE3weysyAKJq5caq0XR/NbRrRQp
   w==;
X-CSE-ConnectionGUID: rPEIaMbyRdKpAb+EGJ1KRw==
X-CSE-MsgGUID: oCy6nlzKQra7a1+Q2oNK5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="227204155"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="227204155"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:32:54 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E73771000343
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:54 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9AD291802AEB
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:32:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0C2FE1401D61;
	Wed, 21 Jan 2026 11:32:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 25/30] evince: upgrade 48.0 -> 48.1
Date: Wed, 21 Jan 2026 19:29:16 +0800
Message-ID: <20260121112921.857-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:33:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123716

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gnome/evince/{evince_48.0.bb => evince_48.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/evince/{evince_48.0.bb => evince_48.1.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_48.0.bb b/meta-gnome/recipes-gnome/evince/evince_48.1.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/evince/evince_48.0.bb
rename to meta-gnome/recipes-gnome/evince/evince_48.1.bb
index 31345542f2..9cf048f14b 100644
--- a/meta-gnome/recipes-gnome/evince/evince_48.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_48.1.bb
@@ -33,7 +33,7 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'open
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI[archive.sha256sum] = "cd2f658355fa9075fdf9e5b44aa0af3a7e0928c55614eb1042b36176cf451126"
+SRC_URI[archive.sha256sum] = "7d8b9a6fa3a05d3f5b9048859027688c73a788ff6e923bc3945126884943fa10"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.43.0


