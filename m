Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B8EEA3C3C
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:34:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128836.1775730852434915882
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OAsjqGtX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730850; x=1807266850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BpNHpbdSHSfDCSsCScogGTEbAqtaLIrSx2UTvhu9UtU=;
  b=OAsjqGtXa5M9CzSPqUcbck7QX+CaQI//1OW/VKA626Dp+UDHzRIMjvCd
   Za/BQyRPAKQOktLMcmVdhNa3XCU6/lPK4/SdzITFNYaVqOAUIANHuTbsp
   Vdeuh0Ma1y3So5nbKWhFaTQ4LmcNJVRq67lWIy/Jgros1BykGWpwJ282L
   VFtGliTRRhqfKH+ZaY9oZWiVNKT/apZP09yYCmlZqxrpW5zv2c0VbINsr
   kxZSQwnHyu/GQ2e7Ieko6klKdbJjgShGb3Fp0rN9JetA4EFPOi/9TjeEi
   Aifn9NSw7BSRDBUetsOkSR2kslLk3xJicrhzDWT9JXtCRgyfshjWAeulV
   w==;
X-CSE-ConnectionGUID: noR2e2NEQoWEw4y7u7jmMg==
X-CSE-MsgGUID: NyuzruazTnK6qAuxhycdhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="237107696"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="237107696"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:34:09 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0EDD55C2A
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:11 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B93F3180414F
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:34:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 27981404333;
	Thu,  9 Apr 2026 10:34:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/37] python3-pandas: upgrade 3.0.1 -> 3.0.2
Date: Thu,  9 Apr 2026 18:32:11 +0800
Message-ID: <20260409103223.1574-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126174

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pandas_3.0.1.bb => python3-pandas_3.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_3.0.1.bb => python3-pandas_3.0.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_3.0.1.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-pandas_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_3.0.2.bb
index a25b367130..62affc5f45 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e98642e1210ade884e5254ab18d55b7d"
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
 
-SRC_URI[sha256sum] = "4186a699674af418f655dbd420ed87f50d56b4cd6603784279d9eef6627823c8"
+SRC_URI[sha256sum] = "f4753e73e34c8d83221ba58f232433fca2748be8b18dbca02d242ed153945043"
 
 CVE_PRODUCT = "pandas"
 
-- 
2.43.0


