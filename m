Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0BBC55172
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10160.1785820709371168120
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mlEgYNuk;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820710; x=1817356710;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L8Lwthh4BeKyvsNo5T8GRPSr/yhT4RxuOk5eOmJLr2Y=;
  b=mlEgYNuk2cNROuSrPQ5F9hwQeU1iCVctV5RKlo+MXAFtImxSOJCdJ72W
   XOFPWwc+8RV3lIb4YMOHiECeQWZmZ5O/MCD79xadXazM1iZk8AhVKv4V3
   znnotMDXxzCPAnHUjwUrepcsRn17MLaLylJ1ZYPICmoaGr0gM8tOS9P7Q
   Icbkv50O7g1QrRskIziwEK7NwIsXA7VBJ3YTCQio4207Pe7IrN0qAqQd7
   kYqfz5uVAN17wb1YxhM/vKhCcJ9j6iz8laQ6/Wg4RHS+cBFClZcLzXbzQ
   rdKIL0fi7ke1uNNzfjvyi9A1y2w5t4kN502bRRTYiOrvbaZ7hapVT+SKj
   Q==;
X-CSE-ConnectionGUID: qX9yNlwRQH6z6bcl64/tcw==
X-CSE-MsgGUID: PFBnm+2tQau9rKRmfG0tEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="228505288"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="228505288"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:29 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id DC3D48204D6
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:29 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 964EF18000C3
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9468F1800131;
	Tue,  4 Aug 2026 05:18:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/28] python3-fsspec: upgrade 2026.6.0 -> 2026.7.0
Date: Tue,  4 Aug 2026 13:17:14 +0800
Message-ID: <20260804051726.1489-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128721

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fsspec_2026.6.0.bb => python3-fsspec_2026.7.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2026.6.0.bb => python3-fsspec_2026.7.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2026.6.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2026.6.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb
index 94e0e43c09..7b499907a8 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2026.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2026.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "f5bac145310fe30e16e1471bd6840b2d990d609e872251d7e674241822abf01a"
+SRC_URI[sha256sum] = "c803c40f4cf860b49dea58ee3e1c33cb9c790520e233537e1340049f89b82a88"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


