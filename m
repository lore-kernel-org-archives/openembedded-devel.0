Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAF6F33807
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 07:04:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70635.1773731056566230136
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 00:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UzFZpQsv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773731056; x=1805267056;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/B1XTfivTaz51sVJhHLsPasOpaud+913YPlRzStnPcM=;
  b=UzFZpQsvjtqa5z5Z/ktEpMRibL9wXZLRuLRYV0BYKbwe8Vde3ZvS09S6
   ZrCeU6noK4r2CiyZpqmhrmH+p5Ftl1JrsbtrwWwHgIbRtUpSEuUFm0+AA
   7B/PIe+9sV4TRBLTOL2I1wyarVRuQ6qmh8/11m8s+0XqloFaPyjX6JUYk
   FcyvRkL94tksB/W1Deoe8g0dSIx/50+FvNhDPiwSn1yRymBE/hk1Dt+eA
   /IrabtRcbKrSTZ98WuMJhkLAN1je9bkNLwzRf9EKODRWKvTJFCKsd5Ahh
   WRKKHiLDebC6ORS4qfZcGfMkTVvDv8k+ery+UHhH7V5+N3oVlm2h52AG3
   A==;
X-CSE-ConnectionGUID: tLpwEOJ2QE2UFm7kVNjElA==
X-CSE-MsgGUID: T60U6DxjTvqZumKi4I3+SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="237862245"
X-IronPort-AV: E=Sophos;i="6.23,124,1770562800"; 
   d="scan'208";a="237862245"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 16:04:15 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C346442A339
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 07:04:14 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6DFDD18026ED
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 07:04:14 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 21E23140010E
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 07:04:11 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH] kronosnet: upgrade 1.31 -> 1.33
Date: Tue, 17 Mar 2026 15:04:06 +0800
Message-ID: <20260317070406.10609-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 07:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125304

Changelog
  https://github.com/kronosnet/kronosnet/releases/tag/v1.33

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../kronosnet/{kronosnet_1.31.bb => kronosnet_1.33.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-extended/kronosnet/{kronosnet_1.31.bb => kronosnet_1.33.bb} (96%)

diff --git a/meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb b/meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb
similarity index 96%
rename from meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb
rename to meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb
index d95bb81278..fa802d02bd 100644
--- a/meta-networking/recipes-extended/kronosnet/kronosnet_1.31.bb
+++ b/meta-networking/recipes-extended/kronosnet/kronosnet_1.33.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.applications;md5=751419260aa954499f7abaabaa88
 SECTION = "libs"
 DEPENDS = "doxygen-native libqb-native libxml2-native bzip2 libqb libxml2 libnl lksctp-tools lz4 lzo openssl nss xz zlib zstd"
 
-SRCREV = "da73f2a1e0ffe2aee15d4f705edf90ee8445e2d4"
+SRCREV = "176bc1064a8e85f95eda2cb1e53b1ce5d471d857"
 SRC_URI = "git://github.com/kronosnet/kronosnet;protocol=https;branch=stable1;tag=v${PV}"
 
 BB_GIT_SHALLOW_EXTRA_REFS = "refs/tags/v${PV}"
-- 
2.43.0


