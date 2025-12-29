Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338F5E92725
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 09:29:51 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40574.1767000590282734388
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 01:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AlfJqYUw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767000590; x=1798536590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k6b06YdYn9VVGMGzTfmPEPsQHyoFl67EY+DW9/XFX5s=;
  b=AlfJqYUwaouI0h8I0rppaPtqIZF1jU6DPJiwJN4g6tTK4m8rftfnOZ14
   kx/r+DMR+FM8oabNYPFe6D6HFVAPCqllvbl5mhRhDRRXYFB19Yt5f6p90
   1xjRBqibO5rd2+NDuHNVa8lYThGI/RrUczwIPPh1zfx2EJXlX9bOQZz6y
   GYC8iMbtv61UysqZ01crYMrm5mDJPSl2mzlibO0aeFBQihRJE8jbE+w6w
   ixjrZ22PFXehVtXFvl8UEP4QxtyBO8YDMWlzpM3ahp+sBAwU8uC9uydQn
   9KHfKAEWwHkPU24LC/AqJcfyfJ0lpzT+Anfd0V4o66eoSoRo21Vml6RST
   Q==;
X-CSE-ConnectionGUID: QlJQ3xXATb2pYx9qmv/TjQ==
X-CSE-MsgGUID: VHyc27ShS8OEAE+xNrcfTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="203210076"
X-IronPort-AV: E=Sophos;i="6.21,185,1763391600"; 
   d="scan'208";a="203210076"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 18:29:48 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 5F5BE1002B9C
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:48 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 13115C0030B
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9BA12100035A;
	Mon, 29 Dec 2025 09:29:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/10] gpsd: upgrade 3.27.1 -> 3.27.2
Date: Mon, 29 Dec 2025 17:29:29 +0800
Message-ID: <20251229092936.1483-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251229092936.1483-1-wangmy@fujitsu.com>
References: <20251229092936.1483-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 09:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122967

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix a gpsd.rules warning.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-navigation/gpsd/{gpsd_3.27.1.bb => gpsd_3.27.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_3.27.1.bb => gpsd_3.27.2.bb} (98%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.2.bb
similarity index 98%
rename from meta-oe/recipes-navigation/gpsd/gpsd_3.27.1.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.27.2.bb
index 22e4d2f0ea..f8fa47ad54 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.27.1.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.27.2.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://gpsd.io/"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://gpsd.init \
            "
-SRC_URI[sha256sum] = "3baa03b8fd922982950593665fa4d86fe9ecde8b3d2ed5c2d0320c7dcecc2937"
+SRC_URI[sha256sum] = "ebb66ed92018b79cec88efb60e35a596925eef46502cf03d6ff0aea636ee7461"
 
 inherit scons update-rc.d python3-dir python3native systemd update-alternatives pkgconfig
 
-- 
2.43.0


