Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5066ED7BB1
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:40:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15858.1776163226490446219
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:40:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HNG870hE;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163226; x=1807699226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oEBw4dOSAELZPg0zjI+AV83X4O9+gewALHETMCRG+SY=;
  b=HNG870hE7fzFxxV6olX4mFwLnA404w7qME92zlRZSwgq+Ov0NA8aKkR0
   7MQdsjqoydYQRRukqTkdNzRQrcTLLxDoY3vt0qTjuI2LoIoCyap7qpm4k
   m7rBekWd/SF6M/mJ0/KyeCgfJsOqailXOf8GRFSke7ZyrRfu3/YCwGEL/
   HQITB/qpGntb9kKt9dDjWiIlwNhOzR30R0djKO5lr1bnR7m8SZ8ytwVGJ
   y1rH2QfZV0i9hPwhmY5EKIyFNpCogU/PZ1Ll+RbyQRh2C5/KAzd36wag4
   izUB9j0y8D5xtyOUsXowGfZ9H2rfd4tjHRwL0iiW//dS4f1SWn79mkbB+
   g==;
X-CSE-ConnectionGUID: mw7AGGGfS1GABmBMP7mZqQ==
X-CSE-MsgGUID: XC8RUloIQ92qgsBXC/dmGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="215917414"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="215917414"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:40:25 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 229741C00091
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:25 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id C2A4E18009E6
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 310CB1400109;
	Tue, 14 Apr 2026 10:40:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/32] python3-platformdirs: upgrade 4.9.4 -> 4.9.6
Date: Tue, 14 Apr 2026 18:38:33 +0800
Message-ID: <20260414103845.1728-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260414103845.1728-1-wangmy@fujitsu.com>
References: <20260414103845.1728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2026 10:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126324

From: Wang Mingyu <wangmy@fujitsu.com>

fix:
 use double quotes for tag variable expansion

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-platformdirs_4.9.4.bb => python3-platformdirs_4.9.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-platformdirs_4.9.4.bb => python3-platformdirs_4.9.6.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.9.4.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.9.6.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-platformdirs_4.9.4.bb
rename to meta-python/recipes-devtools/python/python3-platformdirs_4.9.6.bb
index df0e3597b7..6ca4a09bde 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.9.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/platformdirs/platformdirs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a"
 
-SRC_URI[sha256sum] = "1ec356301b7dc906d83f371c8f487070e99d3ccf9e501686456394622a01a934"
+SRC_URI[sha256sum] = "3bfa75b0ad0db84096ae777218481852c0ebc6c727b3168c1b9e0118e458cf0a"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.43.0


