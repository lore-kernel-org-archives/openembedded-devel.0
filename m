Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F92CCD1BE
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:22:49 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.4763.1761099766456487404
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ftp30l+/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099767; x=1792635767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H0lZOQrjlFCRs+Y/zpjfIz6dTH859Qq8CvTUGhhKxRs=;
  b=ftp30l+/Cj8dioR8aHMRNn8VUQilXLbjnryof5CJGCcWBSwxbebOrX0D
   ojra6suKs2VdQuOm0PB2/06vUyNW8WojSmpeVo3NcSruN0D9uhWVBzSXe
   GKikj2dSvI7vrg/aGlgAlXqn6iqidVnGya3xbCOSbzEmH1mrDifeQnE6P
   In+vL0scPQ94WKW4dGfSy922FpEKbxFLIVYC7vJbr+xO3cb35uLkQRlmc
   VuEZc4iD68Dbl8jMzwv0xmiLkLVF5Wq2srsD64UDejyqCHRfbLl3XpjGa
   zGZxPYYzBcO9Vwvg4ncGmw9T3XC8KC+uC2Iqp5NaVcstUucz3Rh0d2S19
   g==;
X-CSE-ConnectionGUID: vyhcwyrMTOCwjvyJ8jlviA==
X-CSE-MsgGUID: qL6rmAK3TpuojwxtVvcVGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216654647"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216654647"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:22:46 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9AF2A1C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:46 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5438DC01298
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B4E5982C0DC;
	Wed, 22 Oct 2025 02:22:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/29] libirecovery: upgrade 1.3.0 -> 1.3.1
Date: Wed, 22 Oct 2025 10:22:03 +0800
Message-ID: <20251022022227.226-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120854

From: Wang Mingyu <wangmy@fujitsu.com>

* Device database changes:
  - Support iPad Pro M5 family devices
  - Support Apple Vision Pro M5
  - Support MacBook Pro 14-inch M5

* Bug Fixes:
    Fix: array initialization compatibility with MSVC

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libirecovery_1.3.0.bb => libirecovery_1.3.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libirecovery/{libirecovery_1.3.0.bb => libirecovery_1.3.1.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.0.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.1.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.0.bb
rename to meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.1.bb
index 4bbacbfa06..e7a2ece779 100644
--- a/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.0.bb
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_1.3.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 
 DEPENDS = "libimobiledevice-glue libusb1 readline"
 
-SRCREV = "23f201d13f2fad05f5096e254e104bcaf35fd607"
-SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
+SRCREV = "b59ef4814525f487287da1609864f432cd79e3ed"
+SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master;tag=${PV}"
 
 inherit autotools pkgconfig
-- 
2.43.0


