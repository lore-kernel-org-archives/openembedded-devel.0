Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731D4CD3421
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:19 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17222.1777546210272801001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P1UWrIsu;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546210; x=1809082210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z1NNOlJgss1uWFAG/v+kflUuMcp6tomltljdqphHl74=;
  b=P1UWrIsuuy50uVicUpoe27hq74BTzIxGHcJ+/lbMQ3scrIW+SOhtHgcj
   qgDXkWdWBUHz7rvFE3UP6mtUTUTyrump2FD+yovLfkWRVGmKA91UN4b5M
   ReSsVU0lUNN7os0Z7HrxwsTLI7lTaIgFCQS4A1rk4LJPt2DM/RSH62gMg
   xbO3YfPVpGrNqciRr4kvXDBG59v9cF3WG7xfGVtIKJPmPhr0DM9FChn7P
   Lp8LX25pb7S56E+XCJ9p50uxfA0ughUWebpBaBSu75800TAxkjHBQM/Dz
   zQmTGIkmfXE/2qlpp4yrhYu4uB/o/jeqyIwedVAWgiy+3/xV5q3ISsMHe
   g==;
X-CSE-ConnectionGUID: 8yRgJfe7Rbej3Xlah8N5GQ==
X-CSE-MsgGUID: CfxGKgqMTzWcmTp8GN5Zsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="217636940"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="217636940"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:09 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6D2BB42A306
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 22EA1C012BE
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 930C31801544;
	Thu, 30 Apr 2026 10:50:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 23/64] nbdkit: upgrade 1.47.7 -> 1.47.8
Date: Thu, 30 Apr 2026 18:48:42 +0800
Message-ID: <20260430104924.1106-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126692

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.47.7.bb => nbdkit_1.47.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.47.7.bb => nbdkit_1.47.8.bb} (96%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.7.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.8.bb
similarity index 96%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.47.7.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.47.8.bb
index 3b64ccb439..e0fee3fdf0 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.47.7.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.47.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
            file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
            "
-SRCREV = "12ad24489c3de7b3810ae82fcffbdc113e1859ca"
+SRCREV = "83f13d978d9959bd3e92c54af9980a8d3ceed768"
 
 
 DEPENDS = "curl xz e2fsprogs zlib"
-- 
2.43.0


