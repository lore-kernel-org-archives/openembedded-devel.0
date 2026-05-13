Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F3DCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:07:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78.1778645251610615400
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LnDBoC5i;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645251; x=1810181251;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=krUrRJmxDbo1HNlfNuC3uFJHpsxQYbc23a4+9GslzTU=;
  b=LnDBoC5i8geR+mOXpF7O+YPVxRbECu+tJjMVfWfWsZpLZiHkSfJVPxGy
   LaBEJvON19RUuifDjSaI1P0YLj3TGws/xtUboCfInJP9aQtMERWZecaj7
   sOF97g7zblW2MsIOKzakf4P1DRU6LXVQ8r8DFwXurhyx5Dzzeftu+YLKE
   HHp107Mrtk7SBsDSCal25V3M3zu8y4+s9mw1eE1jeVo3DYRY4Y+npKFkT
   3bJC+QSygYwg45l9i0d2JoasvR2pcxIgRVx/nZIGlQHIuFs1iA/Tze2bh
   593zCAu9cc63SJhC0b0+t7eTQHFY5RbXPjJCktoNSUhe32DnDMd7uwNec
   g==;
X-CSE-ConnectionGUID: IgMEXfUlRMyPCRnKONgflw==
X-CSE-MsgGUID: fKgyqkcrTmaJUcdbTwesfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240205883"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240205883"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:07:30 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1A5A91C000B1
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:00 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BF7261004147
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:06:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3FFE91400247;
	Wed, 13 May 2026 04:06:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/56] feh: upgrade 3.12.1 -> 3.12.2
Date: Wed, 13 May 2026 12:05:04 +0800
Message-ID: <20260513040555.377-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126890

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Treat audio/mpeg files as images and display their cover image,
  if present
* Fix menu-related focusing issues under Xwayland
* Support reproducible builds for feh(1) manual

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/feh/{feh_3.12.1.bb => feh_3.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/feh/{feh_3.12.1.bb => feh_3.12.2.bb} (88%)

diff --git a/meta-oe/recipes-graphics/feh/feh_3.12.1.bb b/meta-oe/recipes-graphics/feh/feh_3.12.2.bb
similarity index 88%
rename from meta-oe/recipes-graphics/feh/feh_3.12.1.bb
rename to meta-oe/recipes-graphics/feh/feh_3.12.2.bb
index 2ac504a551..a330c733d5 100644
--- a/meta-oe/recipes-graphics/feh/feh_3.12.1.bb
+++ b/meta-oe/recipes-graphics/feh/feh_3.12.2.bb
@@ -9,7 +9,7 @@ DEPENDS = "\
 "
 
 SRC_URI = "https://feh.finalrewind.org/feh-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6772f48e7956a16736e4c165a8367f357efc413b895f5b04133366e01438f95d"
+SRC_URI[sha256sum] = "7ce358b18a7f37bcc97a09b4efd89fdadd54cd8e7032db345f61e66dd04b1c3f"
 
 inherit mime-xdg features_check
 # depends on virtual/libx11
-- 
2.43.0


