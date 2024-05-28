Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F8CC41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:51:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.12893.1716861062962528061
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lUuMRDyc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716861064; x=1748397064;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1EL3STIdmNJIm16C4J9R8la2+t0/PgAvGN4s1C8uc5g=;
  b=lUuMRDycuxl6bfGUPmXf6PuYOJUKOEVvzuFE45V+Fza5h37bFV0Jl0Bo
   PzbHfAN19c5wtATYSdpR/HYaJzDum3gfqPllMRNuUveGKGL4YkSfVlNyL
   gf2mGiqIwGINzOZ70cR9K7sdE+MokYfhTxEu3LZotQLQwsfiwq0ljYAXD
   UJXI5oaoLcZ4Dvef64DmaZlcGOpaIqcZjfV8bpJXJBm8ynNBWn7SzKrQk
   qOFaCYWhE/QMk2KtFKQASTAre/Pmq1MKNG5mdEBdKmv02mXLOFSLfRRzc
   Nl5KjF+dTJBdLpsVc3GMc3U5yn637PZD9r2TEEhisCPYvZv2bPeX1JH9H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="160525467"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="160525467"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:51:01 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C0834C68E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AAA4D5469
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8FF3B2007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:50:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3EDCF1A000A;
	Tue, 28 May 2024 09:50:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 40/40] xterm: upgrade 391 -> 392
Date: Tue, 28 May 2024 09:48:21 +0800
Message-Id: <1716860901-863-40-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-1.182300-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yQPZZctd3P4BRzUPAqhCjtiBVYn8vqmiFtMj
	jwb9QfV2lHVH/UHDB9Hmn3xyPJAJopGZilTi8ctSOwpfLMeBwRtr9+Kgn2XgeNzONa1Rspx3G0q
	oOc1rQcqUTVij24f8Ray8ojY+JYM9L1vtt3X2p0WeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SGOB0tx9OI3w28m2S4q57axMabigjMNwnC9GyPT993Kl8Lh1LTYLYTC8wN
	bT9x8zD3Ci2ECDuTwKws+m+ZPYMXb9X5zkr+SvqS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110575

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xterm_391.bb => xterm_392.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xterm_391.bb => xterm_392.bb} (94%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_391.bb b/meta-oe/recipes-graphics/xorg-app/xterm_392.bb
similarity index 94%
rename from meta-oe/recipes-graphics/xorg-app/xterm_391.bb
rename to meta-oe/recipes-graphics/xorg-app/xterm_392.bb
index 633d025ee..677f5c999 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_391.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_392.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=1a3032aa728f8fda9d
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-include-missing-pty.h-header-for-openpty.patch \
           "
-SRC_URI[sha256sum] = "6091371e94de867ce186cc1bc306947b0482d71631847fdeab7982acb20ae6b8"
+SRC_URI[sha256sum] = "4d57372ef08eafa9fb7682db8d07be0fe0513e58e8478c2ec8e9b62486e7fe5e"
 
 PACKAGECONFIG ?= ""
 PACKAGECONFIG[xft] = "--enable-freetype,--disable-freetype,libxft fontconfig freetype-native"
-- 
2.34.1


