Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C538BD116FE
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:29 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4468.1764669124705532498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n4iaxa/n;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669124; x=1796205124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=roBvMolcVtyVl/+UBmpQdy3zwswRmqkcGLtEbpZ/H1I=;
  b=n4iaxa/n5MYCIjnDciZi1DKOxoO9vqC324fSGX5uT3ZEPFKYyb2wizXH
   V362vA4X8T7cBVitaVfS9ij1KxIQDHTC2QuJIFVj41IErXJA6JOIvvs0V
   X171Paqt7cIWbkaF+yvd7i6it26jUpkSAov/NoV/6HMxoK9/f4hDyq8jU
   3kNWZb9xVEApM327nV436YbPl+y5dL/I14nyagxITZ2VmsBs04nUh4+KV
   XZe70DvFwvx7GoxuY0UKKRwB4TPS8EycdCeauFX6iojnn/GS+i+zku8iv
   o7ItSqoFXqd/jSI74zYR/dBom0cT6M4Xlr9l+/Zo6drx9tIASptEC5qBg
   A==;
X-CSE-ConnectionGUID: AmOnKS+UTcWRE7JB3tVKAw==
X-CSE-MsgGUID: q053KN9ZSgKS0URw4HI9zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200027986"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200027986"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:02 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 1D86382040C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:03 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id C58A4C008AD
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 50BA4101A42C;
	Tue,  2 Dec 2025 09:52:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/25] python3-eventlet: upgrade 0.40.3 -> 0.40.4
Date: Tue,  2 Dec 2025 17:51:19 +0800
Message-ID: <20251202095132.652-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122245

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Remove legacy setuptools configuration files
* add 3.14 to supported versions
* Emit warning on startup that eventlet is deprecated
* Fix Python 3.14 on macOS
* Workaround for #1068

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.40.3.bb => python3-eventlet_0.40.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.40.3.bb => python3-eventlet_0.40.4.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.40.3.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.40.3.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
index 057b73013a..21b1e095eb 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.40.3.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.40.4.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "file://d19ad6cc086684ee74db250f5fd35227c98e678a.patch"
-SRC_URI[sha256sum] = "290852db0065d78cec17a821b78c8a51cafb820a792796a354592ae4d5fceeb0"
+SRC_URI[sha256sum] = "69bef712b1be18b4930df6f0c495d2a882bf7b63aa111e7b6eeff461cfcaf26f"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


