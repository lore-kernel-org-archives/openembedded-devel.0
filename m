Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6C5C87FC5
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 03:13:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.4285.1753153987409603003
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 20:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Emdr0lKB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753153988; x=1784689988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VIhMbYXWHayN4a3tP7Ex/MAs1uEUcNfZtwJ54kHtl6c=;
  b=Emdr0lKBmEy7DFG+imqyK4o0cgdDg/X1p3dSG2x19FUcNoiRdBZMrOZV
   98nx3G2svsogpmRCJpUOt+WyLS3UYgE5weaoXg6539y8ZijEdndTlx40h
   946DfQ4vy3yNeeEfDtAioOp4b3VO5/BRgmDYGm2TR8PybUBjYULjISyM1
   qkWo2kZvQwDtTnuhh01e87SUrTHIh3qIDZuLOptXnYT9TN253qLXRtHrk
   TC13REsUsnGV8csmPV1qxTXM4cIgTQHnT1GAxl8AlG5Myorw9+dM0Ass+
   4BMDwXaG5wEEyT4vGkeTomFXWYJ1hRRZnYjNh6eT7XZm5OBGCofJGKLTz
   g==;
X-CSE-ConnectionGUID: BoHppGGlT8OCFFGaPuGGkw==
X-CSE-MsgGUID: tVKzztJaQYyTUK43BXqydA==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="206268233"
X-IronPort-AV: E=Sophos;i="6.16,330,1744038000"; 
   d="scan'208";a="206268233"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 12:13:07 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 47D06820400
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B647CC00770
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:06 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C170C1A008D;
	Tue, 22 Jul 2025 11:13:03 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [meta-python] [PATCH 13/21] python3-portalocker: upgrade 3.1.1 -> 3.2.0
Date: Tue, 22 Jul 2025 11:12:21 +0800
Message-ID: <20250722031245.884-13-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
References: <20250722031245.884-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Jul 2025 03:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118676

fix the issue that:
| ImportError while importing test module '/usr/lib/python3-portalocker/ptest/tests/test_lock_flags.py'.
| Hint: make sure your test modules/packages have valid Python names.
| Traceback:
| ../../python3.13/importlib/__init__.py:88: in import_module
|     return _bootstrap._gcd_import(name[level:], package, level)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| tests/test_lock_flags.py:7: in <module>
|     from portalocker_tests.conftest import LOCKERS
| E   ModuleNotFoundError: No module named 'portalocker_tests'
| ERROR: tests/test_lock_flags.py:tests/test_lock_flags.py

portalocker_tests is a dir in source, we need to keep it

python3-portalocker/3.2.0/sources/portalocker-3.2.0$ ls -l -t portalocker_tests/
total 60
-rw-r--r-- 1 userland userland 2019 Jun 14 13:20 conftest.py

Changelog:
==========
- Rewrote locking mechanism to allow for custom locking classes so both Windows and
  Posix (Linux/Mac/BSD) systems have configurable locking options for both exclusive and shared locking.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...-portalocker_3.1.1.bb => python3-portalocker_3.2.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_3.1.1.bb => python3-portalocker_3.2.0.bb} (69%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.1.1.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.2.0.bb
similarity index 69%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.1.1.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.2.0.bb
index 7a36ab74e3..1d70b586c7 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.1.1.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "ec20f6dda2ad9ce89fa399a5f31f4f1495f515958f0cb7ca6543cef7bb5a749e"
+SRC_URI[sha256sum] = "1f3002956a54a8c3730586c5c77bf18fae4149e07eaf1c29fc3faf4d5a3f89ac"
 
 DEPENDS += "python3-setuptools-scm-native"
 
@@ -23,9 +23,9 @@ RDEPENDS:${PN}-ptest += " \
 "
 
 do_install_ptest() {
-	install -d ${D}${PTEST_PATH}/tests
-	cp -rf ${S}/portalocker_tests/* ${D}${PTEST_PATH}/tests/
-	rm -rf ${D}${PTEST_PATH}/tests/test_combined.py
+	install -d ${D}${PTEST_PATH}/portalocker_tests
+	cp -rf ${S}/portalocker_tests/* ${D}${PTEST_PATH}/portalocker_tests/
+	rm -rf ${D}${PTEST_PATH}/portalocker_tests/test_combined.py
 }
 
 RDEPENDS:${PN} += " \
-- 
2.43.0


