Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1256FF8875
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17235.1777546227760122532
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cHyLcyC8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546228; x=1809082228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KR/90UZFIU984P1bCqqEWbwu/m3KmqqmTBKcufT76cg=;
  b=cHyLcyC8zXZF6gl624n9FzhQvPJDsTew+ROJoP4Ns0I3Ckot7FXcVG9l
   R0DsHsKkwc8W0MP8eL+07TUUDlDrbR6IrMYT6KmcpDDo6TyQI7zdZgXW2
   4c70f31+dIoqlzeIOrutCatEpn/+jz0kFUZQs0uMBulm6awrn5mLVmr8A
   LLf+2DV2kkAOG1OrTccusG5xGGyOQ+1w3mErA0BwjC8A6VuKbmsWZ5t/N
   HJ/L7lrXBnNL6+3HpcbxCtSp4dwu0M6s2BLxgQtovgppm0S/k+CtHk4oL
   PtUmVJF/s8YUXrs9q581F8z6hXroWsCY/eIxJnii9gTG1x2D3CN30FD7h
   Q==;
X-CSE-ConnectionGUID: oVDUe2AgTFSqN3Z4NIToDA==
X-CSE-MsgGUID: iIlXrRf2SxKQ04pQyljaSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226101001"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226101001"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 54C7D1C00093
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:26 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 00807C0023B
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:26 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 7B2D31801137;
	Thu, 30 Apr 2026 10:50:23 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/64] python3-flask-wtf: upgrade 1.2.2 -> 1.3.0
Date: Thu, 30 Apr 2026 18:48:55 +0800
Message-ID: <20260430104924.1106-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126706

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- pre-commit autoupdate
- remove slsa provenance
- Support for Python 3.14
- Try not to read uploaded files into memory
- Migrate the project to uv
- ReCaptcha field testing mode documentation
- Allow nonce in reCaptcha
- CSRF meta tag helper
- widget support the kwargs to add custom html attributes
- Respect exempts in CSRFProtect.protect()
- Adding RECAPTCHA_ENABLE to disable recaptcha
- Improve CSRF Documentation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-flask-wtf_1.2.2.bb => python3-flask-wtf_1.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-wtf_1.2.2.bb => python3-flask-wtf_1.3.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb b/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
index 0ce3de0856..2c1f8af8e8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-wtf_1.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-wtf_1.3.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Simple integration of Flask and WTForms."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=d98d089889e14b227732d45dac3aacc4"
 
-SRC_URI[sha256sum] = "79d2ee1e436cf570bccb7d916533fa18757a2f18c290accffab1b9a0b684666b"
+SRC_URI[sha256sum] = "61d5dabc50c3df885c297dcbd80810443a5d632106c8a69cab8ce740f0cdd7cc"
 
 PYPI_PACKAGE = "flask_wtf"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


