Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126F4CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:08:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89.1778645289106115199
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MHE2IhCi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645289; x=1810181289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ka/SoX/x//I1u+xTnw3lyNa28yz3lYEhccQecTiiLdM=;
  b=MHE2IhCi21JM5GLTc4NbPQ3k1VGkCBs+6fmW2Efnpif934MyvsS+ejdQ
   F1iA7/XGhzA08fihNbeT/YkS0xQAGnPBYUybDlK+T2AUc38b5Vgme+s3v
   mHwaHOVYFUBZ3KcnPHeAKIdK/Juzl9LOfcMUDzNNmq+rzOTMkgshswcwC
   QH+fTaAe7UQEo8dkzuu1PedTUfFNXtBUdplRmgbBzNISRo0ZFwM3ecuBS
   Y8JEzhV6CjSBLqD+OTstsLsKMyaC6gz1uJ0SiwNTfDzGHgQgh3bgoXEWF
   fe67EcvbhsKsznPFwnc9e8MgvBMdpx1T8vkh3ATMW7+EZZX/H/I+ny3E5
   g==;
X-CSE-ConnectionGUID: 1MJL8iJpSBez4bWGzFZ+oA==
X-CSE-MsgGUID: 0jk3PlIrRqqZBr5N9LWA6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="228213421"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="228213421"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:07:59 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 045261C000CB
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:59 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A98A71007103
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1EE60140008D;
	Wed, 13 May 2026 04:07:55 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/56] libdevmapper,lvm2: upgrade 2.03.39 -> 2.03.40,2.03.39 -> 2.03.40
Date: Wed, 13 May 2026 12:05:11 +0800
Message-ID: <20260513040555.377-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126895

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index c2a88a2917..e0319d77be 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,8 +18,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main;tag=${PV_TAG} \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "6c5b6cee9f21908bdaff830c210222cc7e08f1ab"
-PV = "2.03.39"
+SRCREV = "c48a3842714858d2de16c341b249be4a073f3325"
+PV = "2.03.40"
 PV_TAG = "v${@d.getVar('PV').replace('.', '_')}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


