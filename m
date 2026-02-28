Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4492FEE4E1
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:02:18 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116079.1772269334934435305
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=noNgUH0j;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772269335; x=1803805335;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cpPIHY6RP7QUdb47P2ujR4BtHKzImSDtAAKfKyz2y6g=;
  b=noNgUH0jWNJJZocQNLa3icxhCsVMNDrVk3HXy+QBOtdbWLLD5yI5MgPd
   0nr1eltf2L7kP8hVYAeHh9picGebGGak47AKuWORzdWaj3LmY05m0mbF4
   B+MpcX8zTDD40R5yrnwHTtjrHI5CEmsiZsH6uX566/B4UuAcTRgLMBmtA
   EYmuR0ACLVz9KhXWe7kCYx0laS9JiHyB14Q4X47YXKp0JLAKmcJAZPuwc
   dq3g1lVezuxLrefjjWzHkP2A4wBXC+DCpaahn0qBVFTl+/G8tzv666KjB
   jYqyIHgLg+dG3hUeU+Y0rAMJ4K5Xf/8ujL4slUAr2fz1GGSbwagY/Iu7x
   Q==;
X-CSE-ConnectionGUID: jCEtcs89QJ+VqI6ARCwCEQ==
X-CSE-MsgGUID: kSOh+jLCQYuo47fa2ddH4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="210379039"
X-IronPort-AV: E=Sophos;i="6.21,315,1763391600"; 
   d="scan'208";a="210379039"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.fujitsu.com (Postfix) with ESMTPS id 39FB78200B4
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:13 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E69F58D65C5
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:12 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 9C69D101BB41
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:10 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-send2trash: upgrade 2.0.0 -> 2.1.0
Date: Sat, 28 Feb 2026 17:02:01 +0800
Message-ID: <20260228090204.3587-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
References: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124773

1.Changelog
  https://github.com/arsenetar/send2trash/releases/tag/2.1.0

2.Remove 0001-add-missing-conftest.py.patch as it was merged upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-add-missing-conftest.py.patch        | 52 -------------------
 ...h_2.0.0.bb => python3-send2trash_2.1.0.bb} |  5 +-
 2 files changed, 2 insertions(+), 55 deletions(-)
 delete mode 100644 meta-python/recipes-extended/send2trash/python3-send2trash/0001-add-missing-conftest.py.patch
 rename meta-python/recipes-extended/send2trash/{python3-send2trash_2.0.0.bb => python3-send2trash_2.1.0.bb} (68%)

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash/0001-add-missing-conftest.py.patch b/meta-python/recipes-extended/send2trash/python3-send2trash/0001-add-missing-conftest.py.patch
deleted file mode 100644
index 1592fd661c..0000000000
--- a/meta-python/recipes-extended/send2trash/python3-send2trash/0001-add-missing-conftest.py.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From ed6d20884108fd7e681baf7278e38ac4800fb5c1 Mon Sep 17 00:00:00 2001
-From: Gyorgy Sarvari <skandigraun@gmail.com>
-Date: Fri, 9 Jan 2026 18:04:08 +0100
-Subject: [PATCH] add missing conftest.py
-
-Conftest.py is missing from the source dictribution of v2.0.0,
-making the tests to fail.
-
-The issue is already solved by upstream, but not tagged yet.
-This patch can be removed with the next release.
-
-Upstream-Status: Inappropriate [workaround until https://github.com/arsenetar/send2trash/commit/f8a40143f696da41f81cae87e1c7f9a345cd4003 is tagged]
-
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- tests/conftest.py | 27 +++++++++++++++++++++++++++
- 1 file changed, 27 insertions(+)
- create mode 100644 tests/conftest.py
-
-diff --git a/tests/conftest.py b/tests/conftest.py
-new file mode 100644
-index 0000000..0753384
---- /dev/null
-+++ b/tests/conftest.py
-@@ -0,0 +1,27 @@
-+# encoding: utf-8
-+import sys
-+import os
-+from tempfile import NamedTemporaryFile
-+import pytest
-+
-+# Only import HOMETRASH on supported platforms
-+if sys.platform != "win32":
-+    from send2trash.plat_other import HOMETRASH
-+
-+
-+@pytest.fixture(name="test_file")
-+def fixture_test_file():
-+    file = NamedTemporaryFile(dir=os.path.expanduser("~"), prefix="send2trash_test", delete=False)
-+    file.close()
-+    # Verify file was actually created
-+    assert os.path.exists(file.name) is True
-+    yield file.name
-+    # Cleanup trash files on supported platforms
-+    if sys.platform != "win32":
-+        name = os.path.basename(file.name)
-+        # Remove trash files if they exist
-+        if os.path.exists(os.path.join(HOMETRASH, "files", name)):
-+            os.remove(os.path.join(HOMETRASH, "files", name))
-+            os.remove(os.path.join(HOMETRASH, "info", name + ".trashinfo"))
-+    if os.path.exists(file.name):
-+        os.remove(file.name)
diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
similarity index 68%
rename from meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb
rename to meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
index 48dc8e793f..147603a45b 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_2.0.0.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_2.1.0.bb
@@ -4,9 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a02659c2d5f4cc626e4dcf6504b865eb"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI += "file://0001-add-missing-conftest.py.patch \
-            file://run-ptest"
-SRC_URI[sha256sum] = "1761421da3f9930bfe51ed7c45343948573383ad4c27e3acebc91be324e7770d"
+SRC_URI += "file://run-ptest"
+SRC_URI[sha256sum] = "1c72b39f09457db3c05ce1d19158c2cbef4c32b8bedd02c155e49282b7ea7459"
 
 PYPI_PACKAGE = "send2trash"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


