Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7860CCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:22 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.27255.1761696977986529118
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mqrLmC4k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696977; x=1793232977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cofORjjXChWS1pHOvfZxZYvjBNsx5Kv47VXbvhw2afk=;
  b=mqrLmC4kY3Uezt7QxvZOwEFLdkIu7xz13z+bZR9V0qfMn3PobmxmOmsj
   F0uqJCA1TeotlJoym7eh4k0Ad7psOaUH1Dtx9BE9uzpj6oMS0ixj4eNdd
   mUb5vkXWrDW2LnXJkaqx5p/W+6Jwj2DcurcGmgla6VFwwYplQyNebgpHg
   euOaJzsYfGYnjT6oKgZ+MGIP/ARtyVfB/2WQg9ILlGnsao0YutdSVet6j
   QJlL3MpSkFbvoNEv5e4swcV1kzDmICiNCTcABxNiAS3e/H2tkNkUZM1Ea
   I310ZEhjjr56VP1YKAaoMnuRKW2qePX29ZujFDcR+OQk2TnsfjA7Dz2HQ
   g==;
X-CSE-ConnectionGUID: xCy7+NJPT1COX4ai9iug7A==
X-CSE-MsgGUID: yGS1fEZtST+DSBgB81SmDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="217999697"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="217999697"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:16:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 8C18A46E
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:16 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 3E1F11C0016B
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 75A8682C0F2;
	Wed, 29 Oct 2025 00:16:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/32] python3-yappi: upgrade 1.6.10 -> 1.7.3
Date: Wed, 29 Oct 2025 08:15:03 +0800
Message-ID: <20251029001505.528-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121136

From: Wang Mingyu <wangmy@fujitsu.com>

0002-Fix-import-of-tests.utils-to-enable-pytest.patch
refreshed for 1.7.3

Changelog:
============
- Better wheel support
- Python 3.14 support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...2-Fix-import-of-tests.utils-to-enable-pytest.patch | 11 ++++-------
 ...python3-yappi_1.6.10.bb => python3-yappi_1.7.3.bb} |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yappi_1.6.10.bb => python3-yappi_1.7.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-tests.utils-to-enable-pytest.patch b/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-tests.utils-to-enable-pytest.patch
index 96dd024125..93a4fd980f 100644
--- a/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-tests.utils-to-enable-pytest.patch
+++ b/meta-python/recipes-devtools/python/python3-yappi/0002-Fix-import-of-tests.utils-to-enable-pytest.patch
@@ -1,7 +1,7 @@
-From 28eac38566327091221aabbc164ea8e433c66e7e Mon Sep 17 00:00:00 2001
+From 7c7ceea53138eefbe522f8881f1c4281083a2d68 Mon Sep 17 00:00:00 2001
 From: Tim Orling <tim.orling@konsulko.com>
 Date: Sun, 24 Dec 2023 09:27:50 -0800
-Subject: [PATCH 2/2] Fix import of tests.utils to enable pytest
+Subject: [PATCH] Fix import of tests.utils to enable pytest
 
 Running the test cases with pytest leads to importlib errors
 because the "utils" module cannot be found.
@@ -19,7 +19,7 @@ Signed-off-by: Tim Orling <tim.orling@konsulko.com>
  6 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/tests/test_asyncio.py b/tests/test_asyncio.py
-index 8e9e631..bb36f4a 100644
+index a48b6ca..76e99a7 100644
 --- a/tests/test_asyncio.py
 +++ b/tests/test_asyncio.py
 @@ -2,7 +2,7 @@ import unittest
@@ -30,7 +30,7 @@ index 8e9e631..bb36f4a 100644
 +from tests.utils import YappiUnitTestCase, find_stat_by_name, burn_cpu, burn_io
  
  
- async def async_sleep(sec):
+ try:
 diff --git a/tests/test_asyncio_context_vars.py b/tests/test_asyncio_context_vars.py
 index 5bd750c..9a253c0 100644
 --- a/tests/test_asyncio_context_vars.py
@@ -96,6 +96,3 @@ index b0b531d..b5a4016 100644
  
  
  class MultiThreadTests(YappiUnitTestCase):
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb b/meta-python/recipes-devtools/python/python3-yappi_1.7.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb
rename to meta-python/recipes-devtools/python/python3-yappi_1.7.3.bb
index bced340b94..3e735f7124 100644
--- a/meta-python/recipes-devtools/python/python3-yappi_1.6.10.bb
+++ b/meta-python/recipes-devtools/python/python3-yappi_1.7.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/sumerc/yappi"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71c208c9a4fd864385eb69ad4caa3bee"
 
-SRC_URI[sha256sum] = "463b822727658937bd95a7d80ca9758605b8cd0014e004e9e520ec9cb4db0c92"
+SRC_URI[sha256sum] = "bef71ad0595b600261668dcb1e18b935a7117a724c04d7be60d9d246e32d0928"
 
 SRC_URI += " \
            file://0001-test_functionality-convert-line-endings-to-Unix.patch \
-- 
2.43.0


