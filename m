Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B30C83F14
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.55568.1751879234028344688
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kJ5FIQ8B;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879233; x=1783415233;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uQHBtaYfdwKxWkb+1NJd3/DVfaEs1AS66VY/bsnc9A8=;
  b=kJ5FIQ8B/pNSVRuh0IGSl7m90ZTA+LggdDT7wm6M1T1dzHiydCrE123S
   p2N6Hk849bwfza/aC/Uq6eGVnLlb+esYbYIjAL5uk9PsNFch6eLhQu5p+
   4cRJdQnLgBjzExToK98yRGwJDM4ZN66Xg8rbshF2iK21c3M6/Tmt4/87I
   ufuAUiuSOpvxc/wNEwVZ2j//SdXWyPVgae6tB9vmrKeR77szjl36ZIeE8
   sGvM95qBLz8ydyMxbO10ytn6TT1WDlDWS1sB0XDO454L/EvgEa4OeEKan
   yVr+1FVJdcZJXaE9zAuEI/aB1ryamq+/aENsyGY0678vB3E7viacf5NWP
   w==;
X-CSE-ConnectionGUID: vi3q2ph7S6iA1SB4E2UdXw==
X-CSE-MsgGUID: 2rQqnU8oRf2hh4JYyFsnvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="193452736"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="193452736"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:11 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 1FCF71C1C700
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:12 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTP id 92A588D65F0
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E3725261519
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:09 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 250701A000B;
	Mon,  7 Jul 2025 17:07:09 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/35] lvm2: upgrade 2.03.32 -> 2.03.33
Date: Mon,  7 Jul 2025 17:06:30 +0800
Message-ID: <20250707090656.1216-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118257

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Use 'lvconvert --repair' to repair raid arrays with transiently lost devices.
* Override 'LC_NUMERIC' locale if unsuitable for 'json_std' report format.
* Fail 'dm_report_group_create' if radix char from locale unsuitable for 'json_std'.
* Escape the escape character itself on JSON report format output.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 0ff17aed5c..4038e83d46 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "8817523c5682a7fd83770d3f58a99c436f7e73f7"
-PV = "2.03.32"
+SRCREV = "0e01a5d3ae1100a6641772ab295e0185d8d6a6b0"
+PV = "2.03.33"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.43.0


