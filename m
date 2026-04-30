Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60FBFF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17475.1777546266332523961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:51:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bJ6uDHfw;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546271; x=1809082271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=unxbNSAYbA/xg1eYqSSdZvArMmAGBC0biwB7aqyH8kI=;
  b=bJ6uDHfwITZTn1XFjGzQeWj70ImrhXqYqT4AbQZeYmbUSRrnWdMlx/vt
   +8XoMeyTWS88zVFOt2Wl3ddCenOxNwrxXNV+m7oZMXZa5gteyWEhGmHsQ
   tWPpMTIOywjHI7rkx883grj6/D0weFJ4ieRztd2/jALbXBiHSKCZ37JIa
   iJ2RcMjWfkkhP8hxaFmJJFk8xNR+f5mI1TQ5hZFGFG6szbx+3mpZWIx78
   xp8Jh7zETzBXg4r7pI0HfQXS8wfKEscS1nwulF4FT4UopvrK1DZIBXl9A
   Xz4ZcQlKuqotAbBM8V9nhLy8RZPmXXwdwgz/Las+fll6kpAftLiO2Etl/
   A==;
X-CSE-ConnectionGUID: MRCqL2DRRnal6fvjgwGI5w==
X-CSE-MsgGUID: QzDxc6+YSSGtMeKNHKJWOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552772"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552772"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:51:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0A596C01836
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:11 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id B4B788D65E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 55F21180113E;
	Thu, 30 Apr 2026 10:51:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 64/64] xterm: upgrade 408 -> 409
Date: Thu, 30 Apr 2026 18:49:23 +0800
Message-ID: <20260430104924.1106-64-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126734

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_408.bb => xterm_409.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_408.bb => xterm_409.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_408.bb b/meta-oe/recipes-graphics/xorg-app/xterm_409.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_408.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_409.bb
index 0f76bc1209..d013a73ab4 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_408.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_409.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=413ff95100710d7a81
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "27dc9e770885f98fbd0b5b40bcda959dc11ec9ba21f0a33b12aafffcc7f9b813"
+SRC_URI[sha256sum] = "349dc755c49299ca4b8e3a90f7201dff41877a1e6ac16129e439d76493246c40"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.43.0


