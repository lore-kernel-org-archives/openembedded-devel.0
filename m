Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A0ECFD37A
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:13:28 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13211.1764061999032240413
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:13:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ebVOXwTZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061999; x=1795597999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sDgi2FsseFQ5IVTvip6EpWho+FeUGgHJXfhtd8lypMU=;
  b=ebVOXwTZzcT8Vu/mwdiIt4mKFAsmswGFKU6amEjkPBkgRnsRjgqnWwV+
   EVN36f2ILGj7TSbZ7DsyYaoiaD1Hf6GsKywuRh9QP86vToV+CYsn57zAs
   R3TfKRauJEa9UAbzThEerV6LUS9yx0u6d1pnbya9NQcONO9oeQjeLqwnc
   +Xlj9ueS+Kbb7YR1d65Z9ToOZXqE6lnoip0MZhXi2B4OjNblzgj0xlnCB
   3aZKv3x/9uM3mdyDeqljvojeVFtzRI/LGk54q9/z/y6ueDAmX04AjxPSN
   M8d/KD4z5pRLPODrrXvy6QhNDxj53Afrl4WCiTUCgS55tLs7JnWg0ef6G
   w==;
X-CSE-ConnectionGUID: v37eh+yxTdS1lB2Q0Z7SXQ==
X-CSE-MsgGUID: mR7EUboBTKC6VyCLG/xf0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="208891608"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="208891608"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:13:17 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 93764367
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:17 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 4CF9F1800EB8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6BB2D14001D4;
	Tue, 25 Nov 2025 09:13:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/26] python3-cfgv: upgrade 3.4.0 -> 3.5.0
Date: Tue, 25 Nov 2025 17:11:44 +0800
Message-ID: <20251125091156.1376-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:13:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122039

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cfgv_3.4.0.bb => python3-cfgv_3.5.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cfgv_3.4.0.bb => python3-cfgv_3.5.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-cfgv_3.4.0.bb b/meta-python/recipes-devtools/python/python3-cfgv_3.5.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-cfgv_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-cfgv_3.5.0.bb
index 73d5d2567a..5f27cee388 100644
--- a/meta-python/recipes-devtools/python/python3-cfgv_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cfgv_3.5.0.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=92844452d544a48a78abc3a862fbd8a4"
 PYPI_PACKAGE = "cfgv"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "e52591d4c5f5dead8e0f673fb16db7949d2cfb3f7da4582893288f0ded8fe560"
+SRC_URI[sha256sum] = "d5b1034354820651caa73ede66a6294d6e95c1b00acc5e9b098e917404669132"
-- 
2.43.0


