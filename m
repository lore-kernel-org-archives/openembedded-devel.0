Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD3ACFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4292.1764669121450876320
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FRDi6EU2;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669121; x=1796205121;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WdK0SMsB64W0J2UXcKEYG4FMWEWMdOaayy8+5G37yH4=;
  b=FRDi6EU20n0JNVaCM+0PzI2wDuiAbu9rGlFYwusRn+S33WW3anZAMTkO
   QT9SyYYLW5SuN9Bj7BEFn7jAxnmbt8II6+2x99ohP5JMi/3gweglZpcE5
   4tGNpSUtzKvooupz+3/nIGlvfZMmXjFMGzm6he6wJ6ULDSSKxS7DEBDZz
   RwkzCY5lAKoxZah3phQvmWGglTSoHYxBGZ/bHTTiwqxB3TSucBvyfLuCO
   ZLf1VycDtOdvruXo3O+o9VojbKayEyC3QTjWxLRTICumstRvP3v9E33vY
   +T3fWsWT4NdbR/1okIhwiDGH+U0K+k33/4P8Qv6ktZeUd/MMiJewpVqI8
   w==;
X-CSE-ConnectionGUID: ytGBW1mGRuCLOBClfk0Jeg==
X-CSE-MsgGUID: H5takbeoR9io2N+2va/jUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="200140655"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="200140655"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:00 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E21791002BAA
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:59 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 99C668D29FE
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:51:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 1A263101A42C;
	Tue,  2 Dec 2025 09:51:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/25] python3-apispec: upgrade 6.8.4 -> 6.9.0
Date: Tue,  2 Dec 2025 17:51:17 +0800
Message-ID: <20251202095132.652-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122243

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Support examples property from field metadata
- Officially support Python 3.14
- Drop support for Python 3.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-apispec_6.8.4.bb => python3-apispec_6.9.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.8.4.bb => python3-apispec_6.9.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.8.4.bb b/meta-python/recipes-devtools/python/python3-apispec_6.9.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-apispec_6.8.4.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.9.0.bb
index 822af0fbaa..4b6f3b51c6 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.9.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "fd0ed14af71a2949d9aeb96b72ce1517cb4a48a5c55667cd0483b7ed33156a2a"
+SRC_URI[sha256sum] = "7a38ce7c3eedc7771e6e33295afdd8c4b0acdd9865b483f8cf6cc369c93e8d1e"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.43.0


