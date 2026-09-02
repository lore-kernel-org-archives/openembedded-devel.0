Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420E2C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9710.1788344953591368606
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cISuT+wl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344957; x=1819880957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FNbwTsz9eOo8vlREBcvO4Rl33OlU6jGywnHGzxOc/+o=;
  b=cISuT+wl3fBhvMAyOEU+zScr9x8/1CO+c/VDVpjwzZUb4fjeIhb9vZ3a
   O/h/JSrA5IiPDQbBZc4dTiMrN48bc2R3jKQTJvQjVIaN+RL+sw5bHjrGY
   FkmoC9JW3U+NhNxJDrOcp0UbUg8CuqdtYcIW7GrxW4Fhs+BzfOQGqA8aH
   IHQn0B1WbJk/d++dp5aWDYc+iWqYT5a7566E04d8qefej68E9xbWOGEVU
   d2W9XCsJ7MgE62kPoBpc43GXXiLzHi9j5DM51KHZaxkOBibXx4Z1woOnW
   iFk3g+2ofvw01VVSV284w+zuR6f8skstTm8Ezpdk7bDwa1iwPPqzbd+E9
   Q==;
X-CSE-ConnectionGUID: gjs/mwO1TjG3ytzMs+4aww==
X-CSE-MsgGUID: AcUF/LMOQJ6V0Jqy7lHa9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="232471192"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="232471192"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:16 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D5D241C000E0
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:11 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 86E6CC0021F
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 9B7302000224;
	Wed,  2 Sep 2026 10:29:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/34] imlib2: upgrade 1.12.6 -> 1.12.7
Date: Wed,  2 Sep 2026 18:28:30 +0800
Message-ID: <20260902102900.1296-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129663

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../imlib2/{imlib2_1.12.6.bb => imlib2_1.12.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/imlib2/{imlib2_1.12.6.bb => imlib2_1.12.7.bb} (96%)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_1.12.6.bb b/meta-oe/recipes-graphics/imlib2/imlib2_1.12.7.bb
similarity index 96%
rename from meta-oe/recipes-graphics/imlib2/imlib2_1.12.6.bb
rename to meta-oe/recipes-graphics/imlib2/imlib2_1.12.7.bb
index faa1eb9006..00ee200d7a 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_1.12.6.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_1.12.7.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
 
 DEPENDS = "freetype "
 PROVIDES = "virtual/imlib2"
-SRCREV = "8c6a7640c91d7815a6318d3641554869c62cc926"
+SRCREV = "6eacff4a366fda6ba02d6d27dead1cda0f600e07"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.43.0


