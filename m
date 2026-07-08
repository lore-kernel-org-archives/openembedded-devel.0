Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E76BC44509
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4731.1783503968500992396
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xo9vYjrk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503973; x=1815039973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HigpxDZ/P8szF0n0hgyIxBeqXp31ZLllZ2mHCsH7Ws4=;
  b=Xo9vYjrkKDyj/DPa2fd7NDAMSfdsM+Ypna3Pm8ARTOZTi7CQOgVSWXAU
   N5Mtf+RR1hXuq2pwXL6QhnLYrzC9g31t5pMf8X7WMQ5kn4c//Rr6ouelt
   ropEl1m9skAUHZzZUVBZH7WY2HVERoB4aHbImCmwSk+OQF5XoHwUxoyg7
   U+MzEj02AtmT2/Tm0otxUyVh/fenkfq0bxdX8ddW85sSNmpl3SAi/ycip
   S4ihGHmL143xG0y0SiFO7Ox1tWbgj5UM+xaseUhFFy1luWBGNR44J5Oex
   XgJgf/w2H12NW1SfmohZFZOEUiNz6wZNQGV7EpzYA2WbGpkjPzqgvQ7yx
   g==;
X-CSE-ConnectionGUID: QV+/DJbKQhSdTWh9wC2CNw==
X-CSE-MsgGUID: cLEi7ExzSrSXcgjdV2Mlhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246626119"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246626119"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:12 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9EE531000347
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:11 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4CACA1C2DF7E
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 63B711800C26;
	Wed,  8 Jul 2026 09:46:09 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 36/37] weechat: upgrade 4.9.2 -> 4.9.3
Date: Wed,  8 Jul 2026 17:44:46 +0800
Message-ID: <20260708094508.2060-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128107

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-irc/weechat/{weechat_4.9.2.bb => weechat_4.9.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/weechat/{weechat_4.9.2.bb => weechat_4.9.3.bb} (95%)

diff --git a/meta-networking/recipes-irc/weechat/weechat_4.9.2.bb b/meta-networking/recipes-irc/weechat/weechat_4.9.3.bb
similarity index 95%
rename from meta-networking/recipes-irc/weechat/weechat_4.9.2.bb
rename to meta-networking/recipes-irc/weechat/weechat_4.9.3.bb
index 9f9962455e..7c797ed5ce 100644
--- a/meta-networking/recipes-irc/weechat/weechat_4.9.2.bb
+++ b/meta-networking/recipes-irc/weechat/weechat_4.9.3.bb
@@ -8,7 +8,7 @@ DEPENDS = "zlib libgcrypt gnutls curl aspell zstd cjson gettext-native"
 
 SRC_URI = "https://weechat.org/files/src/weechat-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d1389a9e521bda0c4ebfa108e2abf885ee6c5150c385299f5dca0181a43a0914"
+SRC_URI[sha256sum] = "5c7d9539fa86c99ea76a551a889a92bac21eab7bb2790dbd346452d00b10c37c"
 
 inherit cmake pkgconfig python3targetconfig
 
-- 
2.43.0


