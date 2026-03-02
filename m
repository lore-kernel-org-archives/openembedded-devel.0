Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41576D58E60
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 05:57:22 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154417.1772431019350551724
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 21:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WQxLZnPs;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772431019; x=1803967019;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+Km33LgYIC2EzjFaDDnZWgYbKfCohFvxi+pwJCu0qnQ=;
  b=WQxLZnPsvYwpHrsg5jRGPs426wpBn+dZfNyJ1hGXfhQGbrfNTilCiQg3
   p0GX9WRVZnNZ5vxMLrxW4n+ksdyyey7VuSi+w8Bq8Eo4m6dhUc575Q4Mx
   A9qZfIoc6+BRrZmUUjZPxchtozkRvzvZaxZT6sMVdkUmvuqgDIbjHjVWX
   dSOYh5L2ZUMyQkZB3z8p44E99z82cbLvRpTseBCjw4UaK3ncBJJMLvGTA
   A9aniERKIHHdyWy5z28yE9N0Xy2GrWjZ6RuWaWqFoUsbZWGweLCdQF0F1
   IKhFL1Nc28No8o4Kjkn4SylgJM5dPdchKW7Qfieg6n0jg2OxMDXvaAksi
   A==;
X-CSE-ConnectionGUID: BQ8zmK61RL+qyhPk88aEeQ==
X-CSE-MsgGUID: GZiaVnyERwumV/i1BeF4bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="220175880"
X-IronPort-AV: E=Sophos;i="6.21,319,1763391600"; 
   d="scan'208";a="220175880"
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.fujitsu.com (Postfix) with ESMTPS id 7D88B1002B91
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Mar 2026 05:56:57 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 31EDF8D29CF
	for <openembedded-devel@lists.openembedded.org>; Mon,  2 Mar 2026 05:56:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 5EE2F101AA1C;
	Mon,  2 Mar 2026 05:56:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH v2] python3-m2crypto: upgrade 0.46.2 -> 0.47.0
Date: Mon,  2 Mar 2026 13:56:49 +0800
Message-ID: <20260302055650.1478-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 05:57:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124799

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch
0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch
removed since they're included in 0.47.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-time_t-on-32-bit-systems-in-test_is.patch | 40 -----------
 ...ct-packing-on-32-bit-with-_TIME_BITS.patch | 72 -------------------
 ...o_0.46.2.bb => python3-m2crypto_0.47.0.bb} |  8 +--
 3 files changed, 2 insertions(+), 118 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.46.2.bb => python3-m2crypto_0.47.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch
deleted file mode 100644
index d49950074f..0000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From d123b4ddce99c44f2c290fb3d6cc887de98778e6 Mon Sep 17 00:00:00 2001
-From: Haixiao Yan <haixiao.yan.cn@windriver.com>
-Date: Wed, 22 Oct 2025 15:23:56 +0800
-Subject: [PATCH 1/2] fix: allow 64-bit time_t on 32-bit systems in
- test_is32bit
-
-Some modern 32-bit Linux systems (e.g. with glibc >= 2.34 or musl time64 ABI)
-use 64-bit time_t by default when _TIME_BITS=64 is enabled. The original test
-assumed time_t was always 32-bit on 32-bit architectures, which is no longer
-true.
-
-Relax the check to accept both 32-bit and 64-bit time_t values:
-
-    self.assertIn(bit32, (32, 64))
-
-This makes the test compatible with both legacy and time64 ABIs.
-
-Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/818c3dfda6ea]
-
-Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
----
- tests/test_util.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test_util.py b/tests/test_util.py
-index e925d03b090c..233fb7a099d9 100644
---- a/tests/test_util.py
-+++ b/tests/test_util.py
-@@ -26,7 +26,7 @@ class UtilTestCase(unittest.TestCase):
-                 not in ["true", "1", "yes"]
-             )
-         ):
--            self.assertEqual(bit32, 32)
-+            self.assertIn(bit32, (32, 64))
-         else:
-             self.assertNotEqual(bit32, 32)
-         self.assertIsInstance(bit32, int)
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch
deleted file mode 100644
index c36afa5cc0..0000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From b5dbfca23986429853ccb15a38cc526d9df0dd40 Mon Sep 17 00:00:00 2001
-From: Haixiao Yan <haixiao.yan.cn@windriver.com>
-Date: Wed, 22 Oct 2025 15:23:57 +0800
-Subject: [PATCH 2/2] fix: correct struct packing on 32-bit with _TIME_BITS=64
-
-On 32-bit platforms with glibc time64 ABI, time_t is 64-bit wide while
-`long` remains 32-bit. This causes struct timeval to use two 64-bit fields
-(tv_sec, tv_usec). The previous code incorrectly packed timeout as "ll",
-leading to EINVAL in setsockopt(SO_RCVTIMEO).
-
-Use "qq" instead when m2.time_t_bits() == 64 to match the actual ABI.
-
-Fixes: https://todo.sr.ht/~mcepl/m2crypto/374
-
-Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/473de659f78e]
-
-Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
----
- src/M2Crypto/SSL/timeout.py | 24 ++++++++++++++++++++----
- 1 file changed, 20 insertions(+), 4 deletions(-)
-
-diff --git a/src/M2Crypto/SSL/timeout.py b/src/M2Crypto/SSL/timeout.py
-index b45f38b1cbdb..5ba52283b6f8 100644
---- a/src/M2Crypto/SSL/timeout.py
-+++ b/src/M2Crypto/SSL/timeout.py
-@@ -33,10 +33,14 @@ class timeout(object):
-             millisec = int(self.sec * 1000 + round(float(self.microsec) / 1000))
-             binstr = struct.pack("l", millisec)
-         else:
--            if m2.time_t_bits() == 32:
-+            bits = m2.time_t_bits()
-+            if bits == 32:
-                 binstr = struct.pack("ii", self.sec, self.microsec)
-+            elif bits == 64:
-+                # handle both 64-bit and 32-bit+TIME_BITS=64
-+                binstr = struct.pack("qq", self.sec, self.microsec)
-             else:
--                binstr = struct.pack("ll", self.sec, self.microsec)
-+                raise ValueError(f"Unsupported time_t_bits: {bits}")
-         return binstr
- 
- 
-@@ -48,7 +52,13 @@ def struct_to_timeout(binstr: bytes) -> timeout:
-         sec = int(millisec / 1000)
-         microsec = (millisec % 1000) * 1000
-     else:
--        (sec, microsec) = struct.unpack("ll", binstr)
-+        bits = m2.time_t_bits()
-+        if bits == 32:
-+            (sec, microsec) = struct.unpack("ii", binstr)
-+        elif bits == 64:
-+            (sec, microsec) = struct.unpack("qq", binstr)
-+        else:
-+            raise ValueError(f"Unsupported time_t_bits: {bits}")
-     return timeout(sec, microsec)
- 
- 
-@@ -56,4 +66,10 @@ def struct_size() -> int:
-     if sys.platform == "win32":
-         return struct.calcsize("l")
-     else:
--        return struct.calcsize("ll")
-+        bits = m2.time_t_bits()
-+        if bits == 32:
-+            return struct.calcsize("ii")
-+        elif bits == 64:
-+            return struct.calcsize("qq")
-+        else:
-+            raise ValueError(f"Unsupported time_t_bits: {bits}")
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
index abe79671d2..ba7bd9b8e3 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
@@ -4,13 +4,9 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=8099b0e569f862ece05740aef06c82a2"
 
-SRC_URI[sha256sum] = "13c2fa89562f7b8af40cc74b55f490be5e2ab8ccfb739f11c16d3ce6221a61ba"
+SRC_URI[sha256sum] = "9256300be1e0412be802aa1f827e0ce7f94deb1099b8ccdcfd9867a7f0f975bf"
 
-SRC_URI += " \
-          file://0001-setup.py-Make-the-cmd-available.patch \
-          file://0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch \
-          file://0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch \
-"
+SRC_URI += "file://0001-setup.py-Make-the-cmd-available.patch"
 
 CVE_STATUS[CVE-2009-0127] = "disputed: upstream claims there is no bug"
 CVE_STATUS[CVE-2020-25657] = "fixed-version: the used version (0.46.2) contains the fix already"
-- 
2.43.0


