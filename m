Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EDCC25B74
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:18 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.12847.1716860957159001933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tWPHVz1u;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860957; x=1748396957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=j/JMtirXxj7E/C5Tx/A3HoyHrxxCFOsj0fB0al+Ydxs=;
  b=tWPHVz1uz13+tAHF+TMDIKdb4/tb535kwWT24I689w6Npo3QL8JNj5ul
   DcTbbVlGXDPytSfxN0e4fPRdVxoy9ZsxvcqN844FaaSeA4heQNFseVRvO
   tuHiSo/Y1XUu0IfWGjXzrV28aGElerg/V9SR0PsmZC2LlIUo3GOPV0B3v
   ZY8bh36kwiO/DUA4INBs4vMvxP2GimNpuhdMmZlF38Ay02Ln6fQpkJEfF
   Ze2gvCsceTIQCToAyR9dBRDJglAlFeQNxRoCd88dqBQf9SRGI32Z7H/vg
   WYjKlu5ktXP2bYM90iPzWDQBqXuWdZReHOkphg9y0IVT4kw3LraYzHebR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="148784725"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="148784725"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:14 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FFF8CA1E3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BEE3CBF3C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BDF6411AA
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EE60B1A000A;
	Tue, 28 May 2024 09:49:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/40] libass: upgrade 0.17.1 -> 0.17.2
Date: Tue, 28 May 2024 09:47:49 +0800
Message-Id: <1716860901-863-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--1.320500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyu6FTbg6ndROZsD
	R/UAI5TzdohyS4pucoxfMrorr76P9u1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qHvyg1ZsxTfW2EXohiB6dqeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNQJK8mZDiJD61mWbo3r155bvKqT5LY94UScczfEfe+JCUyKOptZhh3WLVRRvJ6Iw8AYAn
	UR31jm9IAZVfi/OtLhitL9WiZik84ByMfv2BEtbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110542

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 * Fix rendering of \h in certain cases
 * Fix a minor memory leak in the CoreText and DirectWrite font provider
 * Fix wrong ASS_Image dimensions for huge BorderStyle=4 backgrounds
   potentially leading to out of bound reads by API users

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libass/{libass_0.17.1.bb => libass_0.17.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libass/{libass_0.17.1.bb => libass_0.17.2.bb} (92%)

diff --git a/meta-oe/recipes-multimedia/libass/libass_0.17.1.bb b/meta-oe/recipes-multimedia/libass/libass_0.17.2.bb
similarity index 92%
rename from meta-oe/recipes-multimedia/libass/libass_0.17.1.bb
rename to meta-oe/recipes-multimedia/libass/libass_0.17.2.bb
index 800ad1b15..e239d028e 100644
--- a/meta-oe/recipes-multimedia/libass/libass_0.17.1.bb
+++ b/meta-oe/recipes-multimedia/libass/libass_0.17.2.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a42532a0684420bdb15556c3cdd49a75"
 
 DEPENDS = "fontconfig freetype fribidi harfbuzz"
 
-SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=0.17.1-branch"
-SRCREV = "e8ad72accd3a84268275a9385beb701c9284e5b3"
+SRC_URI = "git://github.com/libass/libass.git;protocol=https;branch=master"
+SRCREV = "cbb48cc4f2f076300004b8b06a86bec55281d0c2"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-- 
2.34.1


