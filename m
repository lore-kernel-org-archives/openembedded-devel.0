Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EACF10A1E88
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:56:52 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45634.1774526204302254156
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hh5Wr4rM;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526204; x=1806062204;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fI7fQsgpxDEWh60sp8R4w+NLRgB3+Zssr5pKdOlFpKQ=;
  b=hh5Wr4rMmrDXO9FBitp7PCRh6ssuQFWB630ZT0smUSF7826+9MZlrRaf
   rOr8dDw4wdGsPtUWsyDDgElVF7JKZ26QdsuJraYGHx6nuBW/fkFxwMbvk
   zusH9JPdRRzcMQi2wSpTNGOSu+lwYipzKsOTKu/2TA3EQ21S2anu3J+9K
   2LhoTfGIUoRjSSdbQ/xwONsFsloI/JGKCG6CDkdkBZjjfHMnaXijxvNaT
   dsGYiPK4mQYCgoTwK9qzhmdKf2zrkgksajqniP1IQnG2AAsBfHFklsGsi
   Aqja4v4RSKGaz1x+HL8mxxycCRk1LOWDLRQMwzojf92KgOKW9MKUqCbsz
   A==;
X-CSE-ConnectionGUID: P6dy7lF0QDSVHNZtwYbVyg==
X-CSE-MsgGUID: EpKtvhuKToOZI9Towy2DxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="223371813"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="223371813"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:42 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 79C36C0022D
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:42 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 30D5DC00200
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C8F25180714B;
	Thu, 26 Mar 2026 11:56:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 02/63] babl: upgrade 0.1.122 -> 0.1.124
Date: Thu, 26 Mar 2026 19:55:32 +0800
Message-ID: <20260326115634.1199-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125657

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- DisplayP3 pre-defined colorspace, build and sanity improvements for CI and
  windows.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.122.bb => babl_0.1.124.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.122.bb => babl_0.1.124.bb} (84%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.122.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.124.bb
similarity index 84%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.122.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.124.bb
index c623e0d4ac..b1e9d96b79 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.122.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.124.bb
@@ -10,7 +10,7 @@ inherit setuptools3 gnomebase gobject-introspection vala
 DEPENDS += "lcms"
 
 SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
-SRC_URI[sha256sum] = "6851f705cda38f2df08a4ba8618279ce30d0a46f957fe6aa325b7b7de297bed2"
+SRC_URI[sha256sum] = "1b0d544ab6f409f2b1b5f677226272d1e8c6d373f2f453ee870bfc7e5dd4f1b1"
 
 FILES:${PN} += "${libdir}/${BPN}-${@gnome_verdir("${PV}")}"
 
-- 
2.43.0


