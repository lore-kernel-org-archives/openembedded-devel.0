Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D49D3B7F4
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:57:10 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4146.1765274220642638531
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MNoZ35eY;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274221; x=1796810221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EUwUPn8yLTGMe+/8kMi9tZykZEQNDfVXoNVVwfnubks=;
  b=MNoZ35eYJBBk+zS0PFEgvU8YrB52IUPEbKmf6azTlXXKdxsq1L+Bmek+
   vRB4xwxps0RgFQCQ9Z9pwlJjXA0LGKMiJ2AJpBzIBpuCnhtPEFxdBygZw
   jFOp8537tN9jAEV74jbZm0o146DN4zeS+6PPRinKWRFbWjdaXXfw+d2M5
   I6LovI+//EuutrI0NvtT1/49izDNBhjY0e+Pz12VtJaRPMQrCNj1f/uEF
   YlHO6W4SMXIulhwWqVqCsHNjgI3hvv4X00xOPHvDPcwcZinwIbc58Nso1
   UhnXY2yrNMJw6JBm5St3BNULzXycx8ZWQCs/AAfKCERKfMbL4odzSfJtD
   g==;
X-CSE-ConnectionGUID: zRFgyHpVQvmDwdPF4yU52w==
X-CSE-MsgGUID: N3bKlGb1QAquUCH8AYUh3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="209421572"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="209421572"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:59 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 2E6771C1C736
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:59 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DC9908D2056
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 6646D20002B8;
	Tue,  9 Dec 2025 09:56:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 29/38] python3-pytest-httpx: upgrade 0.35.0 -> 0.36.0
Date: Tue,  9 Dec 2025 17:55:43 +0800
Message-ID: <20251209095552.690-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122433

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Changelog:
===========
- pytest required version is now 9.
- Explicit support for python 3.14.
- match_params parameter is now available on responses and callbacks
  registration, as well as request(s) retrieval. Allowing to provide query
  parameters as a dict instead of being part of the matched URL.
- This parameter allows to perform partial query params matching (refer to
  documentation for more information).
- URL with more than one value for the same parameter were not matched properly
  (matching was performed on the first value).
- httpx_mock.add_exception is now properly documented (accepts BaseException
  instead of Exception).
- pytest 8 is not supported anymore.
- python 3.9 is not supported anymore.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pytest-httpx_0.35.0.bb => python3-pytest-httpx_0.36.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-httpx_0.35.0.bb => python3-pytest-httpx_0.36.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.0.bb
index a419f8841e..1cdf3d3d23 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-httpx_0.35.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpx_0.36.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Send responses to httpx."
 HOMEPAGE = "https://github.com/Colin-b/pytest_httpx"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=80d06bde9296c367ea063b11e9518842"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8dcb0d82b1d402b6be745fc78dde254b"
 RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
 
-SRC_URI[sha256sum] = "d619ad5d2e67734abfbb224c3d9025d64795d4b8711116b1a13f72a251ae511f"
+SRC_URI[sha256sum] = "9edb66a5fd4388ce3c343189bc67e7e1cb50b07c2e3fc83b97d511975e8a831b"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


