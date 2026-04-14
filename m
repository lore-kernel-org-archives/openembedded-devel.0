Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C66ED7BBC
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:41:00 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15995.1776163250627939653
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jTW6YPZh;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163250; x=1807699250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qgCV26c+F/I5VcHQozrJsiO5fDz9cgA9/BzS0KspCaE=;
  b=jTW6YPZh9wouyxM8cccByIInBml8yHio05dtBNJOPQlsDOncr4ewqLgP
   Ga8F/3Ym8+xqoa1sJrKqnyEiH8rw7nlmRVPKHkGe+JdaIDYJJ8EMEeAvo
   adW6870koHVZ7lhf5O6MDSjf3ZndKhogL+fuhqF8atmd5tvwxiZYhqLlo
   r15C9XVo1tgkJs2aAM4CyZW8RHIDNFwriqNOofHkVOEIZyU7JQZgqN5He
   rT7qBgaedZG91g8RChotJnM6e6cHhG78lVDU0pfN1U/npH6x76jEmLOkd
   whXyoZ9Bt58MmeKkUEAE+4xhe6d++i7rqufreNB1hD0xWwDmUhQsRYB1y
   Q==;
X-CSE-ConnectionGUID: pz0Fv+ewRqabOdsMvfr9wg==
X-CSE-MsgGUID: S0LyhR5lSfGwmUT0Xz199Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="215917454"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="215917454"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:49 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 44F3542A325
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:49 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id EA82C1800E9A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 50A4114000E2;
	Tue, 14 Apr 2026 10:40:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 32/32] xterm: upgrade 407 -> 408
Date: Tue, 14 Apr 2026 18:38:45 +0800
Message-ID: <20260414103845.1728-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126336

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_407.bb => xterm_408.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_407.bb => xterm_408.bb} (95%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_407.bb b/meta-oe/recipes-graphics/xorg-app/xterm_408.bb
similarity index 95%
rename from meta-oe/recipes-graphics/xorg-app/xterm_407.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_408.bb
index 4aecd77f98..0f76bc1209 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_407.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_408.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=413ff95100710d7a81
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "2136eba530068a1b7565abbf17823274f5cefb7fe3618355cbc89dc55c8b7b6a"
+SRC_URI[sha256sum] = "27dc9e770885f98fbd0b5b40bcda959dc11ec9ba21f0a33b12aafffcc7f9b813"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.43.0


