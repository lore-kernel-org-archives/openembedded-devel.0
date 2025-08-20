Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 090BFCA0FEB
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:40:10 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.15247.1755679196640782156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UgqI6iFN;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679200; x=1787215200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=19ol/PyI5UEBNLFhqifETUs68B6W/GWD7Bc91IuK7oo=;
  b=UgqI6iFNKJqKJFajZodPY7oaYw+f8ikhekibXe/iipjJ1lbyoYLWoItd
   IRrOEFkA5FWEoj+CtsdS0l1atFvkQ7JJivaIYFnhpyUW7SWxiv03+Gt6Z
   0gWZK1bDnXbMQUX8rEg4t8LT+rSQ4mFghHNedcwTJtxMqOO2R1phkCCsg
   8EJjZ+zLKtkNFB/3v/iEWt6zU1Be2H0/5NcNZMb10EyIPw+DIMqjBLbC9
   pWe4iaFJP9QzRu8lSICmLuQj3q8BPKbonEpCCBI32Mf2cO0pCuHznqdIl
   REDkbm9faOju2PGTbWYMeW9FZd95M3hfya9cPxP53dvzQP48S2BZZFFWf
   Q==;
X-CSE-ConnectionGUID: lueZUSmiS1Wp26k/rrS/Ow==
X-CSE-MsgGUID: /W8Z1Mh/TsGR07J6nPzWUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="213396780"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="213396780"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:39:59 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 6FD6D1000347
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:59 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 238D4C0384A
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 053EF180226C
	for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:39:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1276E1A0073;
	Wed, 20 Aug 2025 16:39:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/26] graphviz: upgrade 13.1.1 -> 13.1.2
Date: Wed, 20 Aug 2025 16:39:23 +0800
Message-ID: <20250820083945.802-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250820083945.802-1-wangmy@fujitsu.com>
References: <20250820083945.802-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 08:40:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119017

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
### Changed

- 'DFLT_GVPRPATH', a '$PATH'-like variable that gvpr uses to locate
  user-referenced files, is now computed at runtime instead of build time. This
  removes a barrier to relocating a Graphviz installation from one directory to
  another.
- In the CMake build system, whether GDK-dependent components are built or not
  can now be controlled by the '-DWITH_GDK={AUTO|ON|OFF}' option. #2714

### Fixed

- Gvedit and Smyrna on MinGW can now correctly locate their supporting runtime
  data directories.
- The gvpr options '-v' for printing verbose messages is documented. This has
  been supported since Graphviz 2.30 but undocumented.
- When using the CMake build system, 'DFLT_GVPRPATH' is no longer incorrectly
  missing a ".:" prefix.
- On macOS, processing graphs involving URLs with the Quartz plugin is once
  again possible. Previously this would crash. This was a regression in Graphviz
  13.0.1. #2712
- In gvpr, updating a map or deleting items from the map no longer triggers a
  use-after-free.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../graphviz/{graphviz_13.1.1.bb => graphviz_13.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_13.1.1.bb => graphviz_13.1.2.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_13.1.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_13.1.2.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_13.1.1.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_13.1.2.bb
index f385280f6d..8dc869d56b 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_13.1.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_13.1.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "6c49d7dda4329f5a35ce70035d1ec6602dadae7a7077cd7efe43cb57f4bc8f22"
+SRC_URI[sha256sum] = "2229ae9265eb51967841fb43c150dd253f26f51ab5c854ce103f665aaf948b1e"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


