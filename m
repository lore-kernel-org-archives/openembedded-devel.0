Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75963E7314A
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 09:04:26 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48972.1770023058140486602
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 01:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k28QNz7m;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770023058; x=1801559058;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/dumfUPagYsXnjMu6RCGEgzZd/YMNb4bT1DwY9eyvBE=;
  b=k28QNz7mxbH7b5kKIeXTxoEX/yoGVwd77sZg6w5yfbOVIgcpEStd8C5i
   PJhlWnUa/+tM8SwC7KQhSJDAHlFQ2T7n37sKDFHOjYJpdKhs7+mmwgGNr
   JpfXzpRh+H3BGuJUt+vUino0eChPByBLdl1OxB2uFNfq/VNIzv6l/thtc
   IbDmy4Zknk/3sIHeSDtsBqLTdn+wcvgfbVGBd4XyVLCy6k+FP3iaXTVgp
   z3GMzgpxbnXMqUomKLOhjHQHuNjdYlWsVkvXG26uYcSZlIF40OeqAdHbq
   rhqa4CXKcRu4zXVCIkgkhKKPHFcH8U2jppGkC/BqDUvRi9Yz+Ewi+i0Vb
   Q==;
X-CSE-ConnectionGUID: RytaGtv8ScWDdZOyR1NV+A==
X-CSE-MsgGUID: TEZAi/QBS7W+DJeapFaJ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="216121465"
X-IronPort-AV: E=Sophos;i="6.21,268,1763391600"; 
   d="scan'208";a="216121465"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 18:04:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 4B2CE1462
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Feb 2026 09:04:16 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 018B91C002FC
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Feb 2026 09:04:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 67C171401867;
	Mon,  2 Feb 2026 09:04:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 1/3] babl: upgrade 0.1.120 -> 0.1.122
Date: Mon,  2 Feb 2026 17:04:07 +0800
Message-ID: <20260202090409.1251-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 09:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124055

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.120.bb => babl_0.1.122.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.120.bb => babl_0.1.122.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.120.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.122.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.120.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.122.bb
index 0c3b54cfd4..c623e0d4ac 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.120.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.122.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f476ad15201fb4ed0c90c174c524b1e4271ccd69a377242d6a69fcdf87ceacc2"
+SRC_URI[sha256sum] = "6851f705cda38f2df08a4ba8618279ce30d0a46f957fe6aa325b7b7de297bed2"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.43.0


