Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FB5D29DD5
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 06:29:59 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53693.1768285789982801637
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 22:29:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mZzNZCex;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768285790; x=1799821790;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Imgl7P/FxnzThDQIEXgfcrBQOCiKPI6UYDFWo9F0an4=;
  b=mZzNZCexEWcBFQM7izY6jiQ/rjk7vW4wIWEsMdXrk8mFYKoL8hORbWEs
   QrVjy22dL8Xhk7SkVlnntGqR5Vyu44YWa/+/fK5ViCmoNNvH7cxVOhO+0
   i2DnXB5uw/glmtlsC6crDzcPcAmXZoy1pseD0w/deELAb+XzvH8fRtDqI
   idFDzhd/Y9v4TQmBFEM1HK0WRS/ZFRR0ZRtvodSMYQdEyGa/TInrvwCc3
   BafhGDYw5W7iarztA5XcpSFlekUN5oK/gYuOgDXDtUvIVd9i0uEu+tdOn
   dA118rQ2HzMRKGxhIc9rgfKRIKlFir/3TuXwvhESXrdmi2JmfTVqPKxdC
   A==;
X-CSE-ConnectionGUID: rsklI8SqQxqJEoiq81bMPQ==
X-CSE-MsgGUID: wt2ckPEESPGXJ2SscPUODQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213031927"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213031927"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 15:29:48 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3B57EC0182C
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:29:48 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EA6D58D72FC
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:29:47 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id B75A4100058E
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:29:45 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-google-auth: upgrade 2.45.0 -> 2.47.0
Date: Tue, 13 Jan 2026 14:29:37 +0800
Message-ID: <20260113062937.7987-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123395

1. Changelog
https://github.com/googleapis/google-auth-library-python/blob/main/CHANGELOG.md

2. Drop 0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch as it was merged upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ts-skip-when-pyopenssl-isn-t-availab.patch | 34 -------------------
 ....45.0.bb => python3-google-auth_2.47.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-google-auth/0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.45.0.bb => python3-google-auth_2.47.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth/0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch b/meta-python/recipes-devtools/python/python3-google-auth/0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch
deleted file mode 100644
index 5ee13f3d63..0000000000
--- a/meta-python/recipes-devtools/python/python3-google-auth/0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 35eea881e1aeb27fc12cfb301e497e72e59e720f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Nov 2025 17:23:09 -0800
-Subject: [PATCH] make the TLS tests skip when pyopenssl isn't available
-
-In some distributions e.g. yocto
-pyOpenSSL is a packageconfig and disabled by default,
-and it means pyopenssl.py module is not installed as a result.
-
-This test fails plainly when it can not find urllib3.contrib.pyopenssl
-instead skip the test if it does not find the module.
-
-Upstream-Status: Submitted [https://github.com/googleapis/google-auth-library-python/pull/1873]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/transport/test__custom_tls_signer.py | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/transport/test__custom_tls_signer.py b/tests/transport/test__custom_tls_signer.py
-index 3a33c2c..6f88ddf 100644
---- a/tests/transport/test__custom_tls_signer.py
-+++ b/tests/transport/test__custom_tls_signer.py
-@@ -18,7 +18,10 @@ import os
- import mock
- import pytest  # type: ignore
- from requests.packages.urllib3.util.ssl_ import create_urllib3_context  # type: ignore
--import urllib3.contrib.pyopenssl  # type: ignore
-+urllib3_pyopenssl = pytest.importorskip(
-+    "urllib3.contrib.pyopenssl",
-+    reason="urllib3.contrib.pyopenssl not available in this environment",
-+)
- 
- from google.auth import exceptions
- from google.auth.transport import _custom_tls_signer
diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.45.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.47.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.45.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.47.0.bb
index 17a9d7051e..3b141006a5 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.45.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.47.0.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 inherit pypi setuptools3 ptest
 
 SRC_URI += " \
-        file://0001-make-the-TLS-tests-skip-when-pyopenssl-isn-t-availab.patch \
         file://0001-python3-google-auth-Skip-mTLS-tests-in-ptest-environ.patch \
         file://run-ptest \
 "
-SRC_URI[sha256sum] = "90d3f41b6b72ea72dd9811e765699ee491ab24139f34ebf1ca2b9cc0c38708f3"
+SRC_URI[sha256sum] = "833229070a9dfee1a353ae9877dcd2dec069a8281a4e72e72f77d4a70ff945da"
 
 PYPI_PACKAGE = "google_auth"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


