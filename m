Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B555CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 03:36:15 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27493.1778816165040778451
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 May 2026 20:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Vf8igZJN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778816165; x=1810352165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2hH9SQwSS7Vt3XlcTwa1zbEYjGoFyuXbRbMvymJr4BY=;
  b=Vf8igZJNdii7tIySMWYPyWHewpDSjbbxJbma2/ND79GSUJkGJ71VkwuZ
   YmcS2MCi06Otnwno29Y0ESezEy/XpwbXuUqfKtqqUGvizM2cT1oM18sZh
   wK1aCGULfwwrfFZupo6Bd029qgaE014B8YDyBktfYNFP2i2lbBr/v5IaZ
   sOqWoZK4vGzApCEZaKwnSbmqIGoYRigNxkplbjbikdK7F94kJ8/5Oh6cj
   xLQYeS5hpO5XAQTDh+9vFBmwsZC4HGncqtvMJYbUZX6FWt32KST1DJjPy
   /Om8Pl/gpKA1HQer872ltxuiu6BVQ3iMEQI1MM0I2DZePevtCMwmsbovx
   g==;
X-CSE-ConnectionGUID: QDujAISsTi6qPmVS9TCr1A==
X-CSE-MsgGUID: GN6ByIjXTou095TRSV2DIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="240635350"
X-IronPort-AV: E=Sophos;i="6.23,235,1770562800"; 
   d="scan'208";a="240635350"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 12:36:03 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 260C0C00365
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 03:36:03 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id CDD50C0734E
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 03:36:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4076E100019C;
	Fri, 15 May 2026 03:35:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] pgpool2: 4.6.4 -> 4.6.6
Date: Fri, 15 May 2026 11:35:55 +0800
Message-ID: <20260515033556.600-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2026 03:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126998

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pgpool2/{pgpool2_4.6.4.bb => pgpool2_4.6.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.6.4.bb => pgpool2_4.6.6.bb} (92%)

diff --git a/meta-networking/recipes-support/pgpool2/pgpool2_4.6.4.bb b/meta-networking/recipes-support/pgpool2/pgpool2_4.6.6.bb
similarity index 92%
rename from meta-networking/recipes-support/pgpool2/pgpool2_4.6.4.bb
rename to meta-networking/recipes-support/pgpool2/pgpool2_4.6.6.bb
index 0d7f1e0342..668e506831 100644
--- a/meta-networking/recipes-support/pgpool2/pgpool2_4.6.4.bb
+++ b/meta-networking/recipes-support/pgpool2/pgpool2_4.6.6.bb
@@ -10,13 +10,13 @@ HOMEPAGE = "https://pgpool.net"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4b38de086d73e0521de0bbdbaa4a1a9"
 
-SRC_URI = "https://www.pgpool.net/mediawiki/images/pgpool-II-${PV}.tar.gz \
+SRC_URI = "https://www.pgpool.net/source/pgpool-II-${PV}.tar.gz \
 	   file://0001-Fix-build-error-when-build-this-file.patch \
 	   file://define_SIGNAL_ARGS.patch \
 	   file://pgpool.sysconfig \
 	   file://pgpool.service \
            "
-SRC_URI[sha256sum] = "ef0d2e91a9a11d737c6476247219e679f718bec53550646189594ef9aefd298d"
+SRC_URI[sha256sum] = "a4021c06b9fbdca975e62bf15a54d93e1b38854c53b5ad9d53cd082ec185dad0"
 
 S = "${UNPACKDIR}/pgpool-II-${PV}"
 
-- 
2.43.0


