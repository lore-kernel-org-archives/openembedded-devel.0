Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE863CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:54 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5582.1759990130016683476
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZsfyTT2w;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990130; x=1791526130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gRtFyR71ktNdsyhvSSbdkUJPSl7H9clGtiz9a2zDn8s=;
  b=ZsfyTT2wTYoXmaERU274ZnoDq63KyHs+gg2MbP3/cvYOjtHVtAOtx6wy
   PeFzOd3ncbLrzoeb5KI+um2Kyc9IwyOFWgphEfteYbofBbGqLoYBd/eAV
   TlnO/rsoBrmBPC6xL9+uP+BdAxt10vvtSMP8fGMajeuBUenij9sgsd9KI
   mAkPMIa3ASgX+wqM6/cYTVUYZ4UIymjb+A9dxqlQjdiO1/Lr5wjpt+XEf
   lmXp991oGwwKHPwTIOtpiebj3aPmW+3CCgdHB7nGfgRTSZb/NlAg5dRSj
   K+Cv9UBpmgAMNKUJ9eZTYUbE2XqttOlv2ofE61weR8XBrilft9lG3ZcqA
   Q==;
X-CSE-ConnectionGUID: aohdO2/JSvS0UC9GcyokrA==
X-CSE-MsgGUID: crEXBqScQ7ig2Cj+c6VAKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="214800392"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="214800392"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:49 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id A0A501C000B1
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:48 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 58A461C00CC3
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E2E071003100;
	Thu,  9 Oct 2025 06:08:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/22] python3-pymodbus: upgrade 3.11.2 -> 3.11.3
Date: Thu,  9 Oct 2025 14:08:05 +0800
Message-ID: <20251009060809.445-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120415

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.11.2.bb => python3-pymodbus_3.11.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.11.2.bb => python3-pymodbus_3.11.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.2.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.11.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.11.2.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.11.3.bb
index 4872f5b088..c7dbcb1ce8 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.11.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.11.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=12a490c6cffa2e76a6df8aa1fa29e183"
 
-SRC_URI[sha256sum] = "132712baf79cae339aac694739b14551bab69b2a078570cb1350b1db0cccdba7"
+SRC_URI[sha256sum] = "10c2902838ad5a233baefb64b1c1fb064fa762b22b221bf35191bf39f01449a8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


