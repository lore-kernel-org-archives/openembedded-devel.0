Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E150AD68BFA
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37567.1766048634462873603
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J2Jof0st;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048634; x=1797584634;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xLt2GDADKd9M5saRp7QW+yZmpDbGM+fxL3KpQ/AVZfw=;
  b=J2Jof0stnhG40Ozdz6bB8SgHXh+9Dab+WXsZLYEb83uKMmMlx8hTUKvE
   JqiFEpzury4i4/zvstBjXEoHjvfrSPv8+VFMGjqQNY4c+y2BZ3ex6/A5U
   mKPAbOF5NPqVmcet5P+mBPr51jqsjh0DPAJYWi/o5hiENIBOJCCiX+Tt0
   O//5exAmBfnbIcq4ekd9CzzZKlJ+Z2O7PenhCkU7zHKnDHB1bHhyZW7TE
   a9hIvGXXM56wdJDKTCoYJ6AZcKXzCFSPFndnvYxO9ZwEOc+rkA276HELm
   K6WIsg9CPvNMakSgNAxVA7jXBT4MAWRpfPX6eAR7aJZJixWQNnxKUdpRq
   w==;
X-CSE-ConnectionGUID: C3L7fC3xQsCB1Sk1cYiBCQ==
X-CSE-MsgGUID: o13RpHltT4SJZ1hFsCMBgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="211041327"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="211041327"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:03:52 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 92A9E674B
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:03:52 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 48D6A1C0CAF9
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:03:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D860A101A427;
	Thu, 18 Dec 2025 09:03:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 01/20] babl: upgrade 0.1.116 -> 0.1.118
Date: Thu, 18 Dec 2025 17:03:27 +0800
Message-ID: <20251218090346.735-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122735

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.116.bb => babl_0.1.118.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.116.bb => babl_0.1.118.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.116.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.118.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.116.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.118.bb
index a0c5576e03..b120208fad 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.116.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.118.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "50fae069867c7ade1259888ff1e3db85fec86d708252e5385b5a4f39a78ec483"
+SRC_URI[sha256sum] = "c3febe923e225c2a58f952689a89bb1db956788bfecb18a7eff6fc94da9e2469"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.43.0


