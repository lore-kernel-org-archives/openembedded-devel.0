Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75216C44501
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16860.1782811358760602208
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZRa085kL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811361; x=1814347361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DFb/AWjvvgZxWioKS3GJd6jLKhIcClxkETLGbANnfOQ=;
  b=ZRa085kLbUECIdh5XmUwSsycDlQEgb6H8/pWIdSF77SsKxzL2zplaSg+
   TTCGGhJMxZl/yGQ1z62cSITW1ksnEOvIUGTcZDVclPL2QZeS4vy6+jv8w
   Ndut4IXLYq04CHisNLhjBrj5RkJD1io8bYa1vMzcyLNo9saKre7uQCAeb
   y05aoEu0hEiaHhUmfK++1tCZJUpAHPOwGRiYRLxjTx+6BZtacQbD/wNiX
   3UPcVjovQbnxE4iIrAk60p9juBTxiI7V302neziyKX6LysOo1E1ltCgoU
   zHOWYM499hRRyEkexnBGZESUjs6hGzbdxyJ+M1i8BsVujD5eKyX+SZOaO
   g==;
X-CSE-ConnectionGUID: bPzwmifVSY+3XzpUrfEDBw==
X-CSE-MsgGUID: XE+L4aZvRTqUN0D2PJRArw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245821247"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245821247"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:39 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 18E0A1C000A8
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:37 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C34BCC00D6D
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:36 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id EDBD4826FEE;
	Tue, 30 Jun 2026 09:22:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/37] python3-fastnumbers: upgrade 5.1.1 -> 5.2.0
Date: Tue, 30 Jun 2026 17:21:45 +0800
Message-ID: <20260630092206.322-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127959

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added support for Python 3.14
- Fixed invalid license classifier
- Explicitly set language="c++" and add -lstdc++ to solve linker problem on OpenSUSE
- Fix bug where compilation warnings for MSVC were not turned into errors for CI testing
- Eliminate various static analysis warnings
- Removed support for Python 3.8

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-fastnumbers_5.1.1.bb => python3-fastnumbers_5.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastnumbers_5.1.1.bb => python3-fastnumbers_5.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb b/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb
index 3a92fe0ab4..4ef9361d41 100644
--- a/meta-python/recipes-devtools/python/python3-fastnumbers_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastnumbers_5.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d32431d1b650010945da4e078011c8fa"
 
 PYPI_PACKAGE = "fastnumbers"
 
-SRC_URI[sha256sum] = "183fa021cdc052edaeede5c23e3086461deb7562b567614edf71b29515f5fa4b"
+SRC_URI[sha256sum] = "07266a2fca9e08eeb5a6c70be4c8db3637db9b930ea5198facbbb9b0b31d4d03"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


