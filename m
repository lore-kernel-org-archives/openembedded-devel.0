Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E9AEA7974
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:37 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14215.1770268523151503549
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LNeoye7c;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268528; x=1801804528;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YOemetOQWCeY80oaST1iB++SidiL6h6YR5mgfWmfAFw=;
  b=LNeoye7cgTYBvtfsNcifxSo/8KsAPGNbGIUUIPRRIG4HW2EuNK5+m9mX
   25b0smPcpecxssTYp10TGiWlVlABTq8pRnf9HAV0QUim7eqmgjodetYpM
   AzjGTiAUw7wq2dxCBIxKrWx/wZnP5DpSHsbB3oKhtt4LmtRuU1m/msgRW
   oOSDk9Ho6/Q8iUZWkKotGBh8+cm5X5iZ07VfENRgCRRrdnnlFKYn+HXOL
   iL9Zx/s5JXwY8yJHF4ImEGdxEGF5NlLzL4/SLyn6IfY9dYH32Ip34Wo7T
   w+svYnG+smCxhbaW97ry0wb3xuXbaBNEq7bMBOnxtF7CaAxU7ZX6cA+X3
   w==;
X-CSE-ConnectionGUID: Jeapm1zyTk2/tw7k+uUONw==
X-CSE-MsgGUID: HM98nE9wS0is8HB3zx87OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228591677"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228591677"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:27 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 06D311C00094
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:27 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 9F25B100594E
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 12C0120000C2;
	Thu,  5 Feb 2026 05:15:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/24] libvpx: upgrade 1.15.2 -> 1.16.0
Date: Thu,  5 Feb 2026 13:14:21 +0800
Message-ID: <20260205051435.1366-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124163

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../webm/{libvpx_1.15.2.bb => libvpx_1.16.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/webm/{libvpx_1.15.2.bb => libvpx_1.16.0.bb} (96%)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.16.0.bb
similarity index 96%
rename from meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
rename to meta-oe/recipes-multimedia/webm/libvpx_1.16.0.bb
index a7cd76e0c7..c81dde000c 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.15.2.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.16.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 
-SRCREV = "d168454ecd099805c675d4a98c66f4891373302a"
+SRCREV = "1024874c5919305883187e2953de8fcb4c3d7fa6"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main;tag=v${PV} \
            file://libvpx-configure-support-blank-prefix.patch \
            "
-- 
2.43.0


