Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E09ED6407E
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 06:55:44 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9006.1765954538295735588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 22:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RntTSeEg;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765954538; x=1797490538;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=x8JEUd6c/ncbhFLZbFIj9YdWuKjLan0YdhUGMUeMGgA=;
  b=RntTSeEgy5jygINlbkFicD5QB4xrB3zQEJrMGE137L7o+JFQ1xf7Y4zo
   YPpWG4CfBI6ltK0YXNX3RR51gVAnNJhet/3hAWjrkUV6cwkRbLzSVRMMX
   Sn7jZ/mpgWBcNvJCtl2NEtwqXXvfoCShl0NMrbKqdFE97s+fW1mZ+DVTD
   W6rtQgxb2m1MOg2qZvK+PCdhIdu03LgESrUQ4gmVYFwUnIXwcTiTLDasp
   yebpBtUhpAPMoy+Tpe7wZIBvSMyDVG5zik8ylRjyyXqtKGWT37GrrKij+
   glZV8aiX3MDhZJkZtVVZT+98N7djXEcOq4wGS7Z+JG9AMonaP3t28qRj4
   Q==;
X-CSE-ConnectionGUID: BS+r7fFeTA+V3+rcIMQEyg==
X-CSE-MsgGUID: unveW8JRQ1KJpSjqKVvEkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="201884844"
X-IronPort-AV: E=Sophos;i="6.21,155,1763391600"; 
   d="scan'208";a="201884844"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:55:36 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id AFB261000348
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:55:36 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 60218100414F
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:55:36 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 0F9591802E3D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:55:33 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/5] libopusenc: upgrade 0.2.1 -> 0.3
Date: Wed, 17 Dec 2025 14:55:30 +0800
Message-ID: <20251217065530.33433-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122714

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../libopusenc/{libopusenc_0.2.1.bb => libopusenc_0.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libopusenc/{libopusenc_0.2.1.bb => libopusenc_0.3.bb} (76%)

diff --git a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.3.bb
similarity index 76%
rename from meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
rename to meta-oe/recipes-multimedia/libopusenc/libopusenc_0.3.bb
index fb822d7a0e..29e7f00066 100644
--- a/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.2.1.bb
+++ b/meta-oe/recipes-multimedia/libopusenc/libopusenc_0.3.bb
@@ -11,8 +11,8 @@ DEPENDS = "libopus"
 UPSTREAM_CHECK_URI = "https://github.com/xiph/libopusenc/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 
-SRC_URI = "https://ftp.osuosl.org/pub/xiph/releases/opus/libopusenc-${PV}.tar.gz"
-SRC_URI[sha256sum] = "8298db61a8d3d63e41c1a80705baa8ce9ff3f50452ea7ec1c19a564fe106cbb9"
+SRC_URI = "git://github.com/xiph/libopusenc.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "0dba1bea736ab8bb811409dce80c994a00a2ced9"
 
 S = "${UNPACKDIR}/libopusenc-${PV}"
 
-- 
2.43.0


