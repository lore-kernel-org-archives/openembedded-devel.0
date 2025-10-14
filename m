Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD7ECCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:21:08 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.10950.1760433664063941228
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DwDDqHjf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433664; x=1791969664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WKjKsP7rSi6Ne2yPIeNyXNzmmhbPP1CwWD/cLmCHZ38=;
  b=DwDDqHjfSaKK1MSodMAgjJfM5wWj5TWhiO24x1Pp8B39c87HwtmGZf38
   RUG8S+uwFiLhUhSD7/yNnG3xE1tEfBp4WaZL+/UxaUvlKDhKxz9Fm/4VU
   EeKr2FXcsmdMXCp839dlbXatleGQ1gF3tMaCGQNTUX8+2NrSGqh6qxPqt
   WBkz+Vf+06vsWqtwtHv/jvjRLPSc8daYL/K96BwqpAXh+Q6Ld1PzrHU4P
   ecGv8UTD+BOBDCzyavzimAWr4iBS6XD4PYmPBCgOVF8UlsXhU6B1pFZg3
   l6mEPKZMPcVHairyDDKMRhE5MTMB4QxpSctWBW9IbwxCB5BkMoRJICVwx
   g==;
X-CSE-ConnectionGUID: HEQfI7SgTCuPbTe67gW6/w==
X-CSE-MsgGUID: skHF1pAESQSSzeb11XaeZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="194722693"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="194722693"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:21:02 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 85C9A100034A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:02 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 42DDA1800BD1
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id CD906101C3C0;
	Tue, 14 Oct 2025 09:20:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/44] python3-pyunormalize: upgrade 16.0.0 -> 17.0.0
Date: Tue, 14 Oct 2025 17:19:17 +0800
Message-ID: <20251014091927.493-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120591

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Upgrade to Unicode 17.0.0.
- Drop support for Python versions earlier than 3.8.

License-Update: Copyright year uptedto 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-pyunormalize_16.0.0.bb => python3-pyunormalize_17.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyunormalize_16.0.0.bb => python3-pyunormalize_17.0.0.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-pyunormalize_16.0.0.bb b/meta-python/recipes-devtools/python/python3-pyunormalize_17.0.0.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-pyunormalize_16.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyunormalize_17.0.0.bb
index 19463bc224..fe367aa112 100644
--- a/meta-python/recipes-devtools/python/python3-pyunormalize_16.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyunormalize_17.0.0.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Unicode normalization forms (NFC, NFKC, NFD, NFKD). A library independent from the Python core Unicode database."
 HOMEPAGE = "https://github.com/mlodewijck/pyunormalize"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e2c2ee871081d4e4c24f32e37c413c73"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d882216fa7fde0aec58695aa05ef72f"
 
-SRC_URI[sha256sum] = "2e1dfbb4a118154ae26f70710426a52a364b926c9191f764601f5a8cb12761f7"
+SRC_URI[sha256sum] = "0949a3e56817e287febcaf1b0cc4b5adf0bb107628d379335938040947eec792"
 
 inherit pypi setuptools3
-- 
2.43.0


