Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADFECFD376
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4292.1764669121450876320
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Dy0IGL3l;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669127; x=1796205127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ptO7/KI5PwSUCJkRVp7WWL7XdkG6mmlKweVWPEfFH4A=;
  b=Dy0IGL3luO0aQFcCTAlNIu9UeSlgXKt+rMw5vvCswOJj2M4ZZppsEuru
   KYspv4Jc3H45vIRMF1Fq1LRSzSytu3ROAJhZax5Z0rr0IrPwd4mECnrWc
   ozU3THhMgi49tyrn4mx7u+b1sFamEfCxwtX+uwyHqNXalCNz5OtBWI1ln
   WMX0Xia6klIARkuDD/Lc8RYckB1DYxPN8H1q9UmahL8bB0MAXbOFvhI7Z
   +bs8M0l3zQLAmqqGRApAyjd21wMoFSTodkFYbjHVMplkNrNcxm9GSmMMq
   7hxzUXZeYArF6ycMuUFYBirh361mtta9ZoUjIB7ZvWmExe5gI0ppK1wfX
   g==;
X-CSE-ConnectionGUID: aFDKJAL8S0ajpBqgSWHfAQ==
X-CSE-MsgGUID: arexs0qjRbGSpgKaOvKH4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200140664"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200140664"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:06 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id B46DA3D8
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:06 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 6BFF7100046F
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 037B5101A432;
	Tue,  2 Dec 2025 09:52:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/25] python3-inflate64: upgrade 1.0.3 -> 1.0.4
Date: Tue,  2 Dec 2025 17:51:21 +0800
Message-ID: <20251202095132.652-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122247

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-inflate64_1.0.3.bb => python3-inflate64_1.0.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inflate64_1.0.3.bb => python3-inflate64_1.0.4.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-inflate64_1.0.3.bb b/meta-python/recipes-devtools/python/python3-inflate64_1.0.4.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-inflate64_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-inflate64_1.0.4.bb
index a6f0c67ab8..2e7d81b495 100644
--- a/meta-python/recipes-devtools/python/python3-inflate64_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-inflate64_1.0.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit python_setuptools_build_meta pypi
 
-SRC_URI[sha256sum] = "a89edd416c36eda0c3a5d32f31ff1555db2c5a3884aa8df95e8679f8203e12ee"
+SRC_URI[sha256sum] = "b398c686960c029777afc0ed281a86f66adb956cfc3fbf6667cc6453f7b407ce"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


