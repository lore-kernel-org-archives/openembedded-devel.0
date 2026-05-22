Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0141FCD5BB1
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 09:07:44 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13044.1779440859024515350
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2026 02:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZcWnZqlp;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779440859; x=1810976859;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z0k/wIrKUOqFJR5Xa/qbunz33KODEXW9EWUwwyysRFA=;
  b=ZcWnZqlp7ihAMt9uxKavwv219fJX37C3skPWBJW/S9bDNznsttKkHNaB
   Yz62NJboPNxc/NTIpyA2vFW99CpR3tsyCIvL616BXG6VRi/8UlwXi37lU
   rHJpq8TiPM1hB/kBaiiWsoQI09JUy68d0Zol2KR+TGVa1Oj+6YuHrwiTr
   5RQvnutuplhlpfFnLQIq2L+oYtJJ2h5bJ8SVi73wfoAIigpOpWQzdDmZv
   JQUzyvASIlYOxA1YiC2ylA9WqGZmm7OHHKY7dD/f0rnovGvRR6PDLr3KI
   e9wbSHKDgN9cm+P4E5RBfbczB2UH1VpY7OtTmlKiXC1DA8qJVZa8znarC
   g==;
X-CSE-ConnectionGUID: 4nayEPk3SWmPeGE42HsRng==
X-CSE-MsgGUID: bHKh65I6Tpq2QUuaLEMhrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="228860172"
X-IronPort-AV: E=Sophos;i="6.24,162,1774278000"; 
   d="scan'208";a="228860172"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 18:07:37 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A50641C00189
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 09:07:37 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 529681C5272B
	for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 09:07:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id CEC1B10071B0;
	Fri, 22 May 2026 09:07:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] procmail: Add -std=gnu17 to fix error of do_compile
Date: Fri, 22 May 2026 17:07:32 +0800
Message-ID: <20260522090732.486-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2026 09:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127147

From: Wang Mingyu <wangmy@fujitsu.com>

Without the option , the command  procmail|lockfile|formail will not be installed to target.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/procmail/procmail_3.24.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/procmail/procmail_3.24.bb b/meta-oe/recipes-support/procmail/procmail_3.24.bb
index cb3775ebf6..6767f87db6 100644
--- a/meta-oe/recipes-support/procmail/procmail_3.24.bb
+++ b/meta-oe/recipes-support/procmail/procmail_3.24.bb
@@ -32,7 +32,7 @@ do_configure() {
 }
 
 do_compile() {
-    oe_runmake -i CFLAGS="$TARGET_CFLAGS -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 LOCKINGTEST=/tmp" LDFLAGS0="${LDFLAGS}" LOCKINGTEST=100
+    oe_runmake -i CFLAGS="$TARGET_CFLAGS -std=gnu17 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 LOCKINGTEST=/tmp" LDFLAGS0="${LDFLAGS}" LOCKINGTEST=100
 }
 
 do_install() {
-- 
2.43.0


