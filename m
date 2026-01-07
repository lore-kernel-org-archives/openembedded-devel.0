Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53791CD583F
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3097.1767781782835768905
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BpW054Ez;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781781; x=1799317781;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Yad+ZsjQhyfYReWvChUZOJShFnmaEuGxLbWOpc8C64=;
  b=BpW054EzRDtaYigPM97KaIDbczQTAzzTWL3vajCHwN96+hENw8nsGAqe
   DTK9GVmPq+65OKlXLuBDH0jhMW5sefPp5gQfw3yrhykH+XFk4rLzzvG3r
   Psfcf7Skipn5QvSseI8gMoqslV+dnBIxW2yfnvzeAyUhxH2C4OHFvqDYv
   gxDJWboCzfvRUkQhh69wih3pa2fu1ERQskuWYZKSsSOe7IYx8R1+C9ySR
   EAL9SujtH/XLoaMNtiJhHberWD0667q4adl1oWGL2AII+zK/CGGqQyuWz
   zy9VzsWVQPgeQCnT3NXkwQvGM8hwzorfm1ggOKjQrtcS6PS2WK1OVG+y+
   g==;
X-CSE-ConnectionGUID: 7i710fazTsGiQZpRrKioCQ==
X-CSE-MsgGUID: SUiYgzzvQqalwVzKPaj/iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="203905566"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="203905566"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:39 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id E8C9A1C1C722
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:40 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9A43B180ABC8
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id BC2BC82173A;
	Wed,  7 Jan 2026 10:29:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/24] python3-pillow: upgrade 12.0.0 -> 12.1.0
Date: Wed,  7 Jan 2026 18:28:50 +0800
Message-ID: <20260107102855.228-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123217

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pillow_12.0.0.bb => python3-pillow_12.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_12.0.0.bb => python3-pillow_12.1.0.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb b/meta-python/recipes-devtools/python/python3-pillow_12.1.0.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_12.1.0.bb
index 0730ac7d32..83231cad06 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_12.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_12.1.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a1b708da743e3fc0e5c35e92daac0bf8"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https;tag=${PV} \
            file://0001-support-cross-compiling.patch \
            "
-SRCREV = "693df7b42c666f88c719f9973be0ad71607328e0"
+SRCREV = "46f45f674d47b5d8bc54230dda8fe9e214598b87"
 
 inherit python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


