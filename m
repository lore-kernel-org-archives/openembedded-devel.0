Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F18BCFD37C
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13205.1764061989115575435
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mOAAg/6e;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061989; x=1795597989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kvBq6/nRETNabimg2yQh1KXelh5oZd4eA5n6kbd0+eo=;
  b=mOAAg/6eyvf8ndiWZX+HwOq5Ub3Ast0Z34ZAMl0yB7Sq+jjKCBnSyxBX
   KzllMpCAZBY4si5tGVzdGOfTHK/eoV+qO74T7Ou+FuJalv2O41KzYS2DG
   xJEge+WfF9lS7rDHfcKK2LRQMh9IhOKDRW4nZmmVlsyTFe9l/d2WCChDl
   L8s58Whvba33JiDKXsRU6K0GTlEA6dqlfxHCFjEGF7k3bzlAL72NnPihh
   heiuMY6GmD5u3rap8LoIzrq7lApyEA8u3geQZAhu+B6A2LWT7M9qFkp24
   hxe03PwYkfCgKvXaZdPJ59Ix7nXw3JPzpAy8mLZ7SXZh9riDKuOGGBVai
   w==;
X-CSE-ConnectionGUID: h4B8X2VsQLueeHOC/LoVZA==
X-CSE-MsgGUID: op7CKxeiQruGkv+33Pzamg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="199164445"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="199164445"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:03 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id AFFBC1549
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:03 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 674DB1800EB9
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8B53814001D4;
	Tue, 25 Nov 2025 09:13:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/26] lvm2: upgrade 2.03.36 -> 2.03.37
Date: Tue, 25 Nov 2025 17:11:36 +0800
Message-ID: <20251125091156.1376-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122033

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 09ee410614..ccefa206b6 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "c8b7a765cbd731af32964adaf921f9e19d56a048"
-PV = "2.03.36"
+SRCREV = "d34fc799fd86538756ba56b37e1ab56ab1b75d13"
+PV = "2.03.37"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0


