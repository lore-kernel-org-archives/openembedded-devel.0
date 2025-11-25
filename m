Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A81BCFD315
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:16:48 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13253.1764062202781144905
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:16:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M09g1u58;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764062203; x=1795598203;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aDzmm+rvAzsYThTEjMGUan9pPVLQ2XePj5MC6t/avAM=;
  b=M09g1u58qi1NgTbI0FpcYVBW8DupTKOEhqeSq30U6PIVEqbrQdiUuFSa
   ikCfS4n6bL3Xc5JQC5bheTObXnYKpCOHtZMWe8QNdLBy62tT2HV85c+n5
   2r9UFm+JDqLUt2RAPWaUtmdeqHtR3e4CimHtrVMWFP6C3blgwmQUIclLd
   A0nuzL/BfOrXdM+tlyuaNv02COdJ3Tvck1BraiPSGTZ7cLhiRABV0D6d9
   L6uuMeTN0PX7D3yaXj0fdhhalaeKWNSlJPXz5MBvjZwtba8RSn4X4Olhk
   PAr5fvA2kFk5ZBT9Qd1+mjPFzJidyaTq0JeBXbH2v3fdjegjDp0ynS+3q
   Q==;
X-CSE-ConnectionGUID: 0jxdr2sWS1e8KoOiNQsjdw==
X-CSE-MsgGUID: zg3YPlfCSu+0HAuWmqD3UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="219719788"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="219719788"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:16:42 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 43C9B1C1C711
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:16:41 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F3013C0181C
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:16:40 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id BED89101A41E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:16:38 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] [oe][meta-python][PATCH] python3-pytest-mock: upgrade 3.14.1 -> 3.15.1
Date: Tue, 25 Nov 2025 17:16:31 +0800
Message-ID: <20251125091631.3381-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122042

1. Changelog:
   https://github.com/pytest-dev/pytest-mock/releases/tag/v3.15.1

2. Remove 0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch as it has been mergerd upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ure-to-test_instance_async_method_sp.patch | 32 -------------------
 ....14.1.bb => python3-pytest-mock_3.15.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-mock/0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch
 rename meta-python/recipes-devtools/python/{python3-pytest-mock_3.14.1.bb => python3-pytest-mock_3.15.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock/0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch b/meta-python/recipes-devtools/python/python3-pytest-mock/0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch
deleted file mode 100644
index d57c51f880..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-mock/0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 17850cde66d52a851a8a15a61f5c97311d30a296 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Jul 2025 16:03:03 -0700
-Subject: [PATCH] Add asyncio fixture to test_instance_async_method_spy
-
-This ensures that this test executes and passes
-with pytest-8.4+
-
-pytest now throws errors for such functions [1]
-which were skipped in older versions
-
-[1] https://github.com/pytest-dev/pytest/issues/11372
-
-Upstream-Status: Submitted [https://github.com/pytest-dev/pytest-mock/pull/516]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test_pytest_mock.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test_pytest_mock.py b/tests/test_pytest_mock.py
-index 1a51636..b158d97 100644
---- a/tests/test_pytest_mock.py
-+++ b/tests/test_pytest_mock.py
-@@ -523,7 +523,7 @@ def test_callable_like_spy(testdir: Any, mocker: MockerFixture) -> None:
-     assert spy.spy_return == 20
-     assert spy.spy_return_list == [20]
- 
--
-+@pytest.mark.asyncio
- async def test_instance_async_method_spy(mocker: MockerFixture) -> None:
-     class Foo:
-         async def bar(self, arg):
diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
index 07e2c60f54..835ff0ab3a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.15.1.bb
@@ -6,10 +6,9 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI += " \
-    file://0001-Add-asyncio-fixture-to-test_instance_async_method_sp.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "159e9edac4c451ce77a5cdb9fc5d1100708d2dd4ba3c3df572f14097351af80e"
+SRC_URI[sha256sum] = "1849a238f6f396da19762269de72cb1814ab44416fa73a8686deac10b0d87a0f"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.43.0


