Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5332CFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:29 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4302.1764669145133369381
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tKvGdZ9/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669146; x=1796205146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aFKdXTez1EdVALSqO0uO8WDzNo1iP3GiE8fdK+dQVcw=;
  b=tKvGdZ9/A5Umvd4qAdYTlcE2xPNyf4zEs6iyn8voJvwY4x9LJmjOCUE4
   XJL/EvR5CZbqsLe883e6y9vlCPIzmgf1LBIx5teA6rk11WYzQ5J/LTb7q
   fvTll7iFI0FsUe/S5g9QMA1G2Ge5RTMGAOePKk2OCwewSueNDnAEXyqEj
   Mq5DHu/1krxgmQ/7Nvfb646K0Ht4ZFr2VFBUxZBDx588L7+7yA3oUpMgG
   hHr81NJnb+4XUuanTxYryrmdR0xi6IfUPCfaHyLWscv2Utmtzdw6fN/pZ
   62XDj52qOSFtV6wEoDMyKeiUa8iQcjCz/J4X1NJgLypATrkp+yrfkjnVS
   g==;
X-CSE-ConnectionGUID: yWT00edVS8Wj76t130Ldfw==
X-CSE-MsgGUID: EELLwnH5SA6pi4aDPG1JFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200028025"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200028025"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:26 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id D83881C1C715
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:26 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8FFB31400354
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 14493101A42C;
	Tue,  2 Dec 2025 09:52:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/25] xdotool: upgrade 3.20211022.1 -> 4.20251130.1
Date: Tue,  2 Dec 2025 17:51:32 +0800
Message-ID: <20251202095132.652-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122258

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix bug in typing/keyboard causing xdotool to send extra modifier
  keys in certain cases. When xkeyboard-config 2.46 is installed,
  xdotool would send incorrect key sequences for function keys, for
  example incorrectly sending "Alt + F3" when F3 was requested.
- Add 'windowlower' command
- Fix some crashes in xdo_get_desktop_for_window
- Fix mouse movement under Xwayland when multiple screens are present
- mousemove --sync no only waits if the cursor is expected to actually move
- Remove dependency on libXi that was leftover from Wayland detection code no
  longer used in xdotool
- Bump SONAME to 4 hopefully to resolve ABI issues with previous versions of libxdo.
- Code improvements intended to reduce compiler warnings
- Add support for Cygwin when building
- Test suite works again!

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xdotool_3.20211022.1.bb => xdotool_4.20251130.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xdotool/{xdotool_3.20211022.1.bb => xdotool_4.20251130.1.bb} (90%)

diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb b/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
similarity index 90%
rename from meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
rename to meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
index 45defe82d6..75fa636838 100644
--- a/meta-oe/recipes-graphics/xdotool/xdotool_3.20211022.1.bb
+++ b/meta-oe/recipes-graphics/xdotool/xdotool_4.20251130.1.bb
@@ -10,7 +10,7 @@ inherit features_check pkgconfig perlnative
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "https://github.com/jordansissel/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "96f0facfde6d78eacad35b91b0f46fecd0b35e474c03e00e30da3fdd345f9ada"
+SRC_URI[sha256sum] = "eee789b00d6a13d47b31bbc139727e6408c21b5f6ba5e804fdf6ecfb8c781356"
 
 EXTRA_OEMAKE = "PREFIX=${prefix} INSTALLLIB=${libdir} INSTALLMAN=${mandir} WITHOUT_RPATH_FIX=1"
 
-- 
2.43.0


