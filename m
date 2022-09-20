Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BFBC6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:23:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.7377.1663640581870583556
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BrbLAuKh;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663640580; i=@fujitsu.com;
	bh=NTDhXkzFiyTYbEgMz9hz+NcYb2qsdMMDPWpwwfVdQww=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=BrbLAuKh+jt3BZXHueJsPIExs8nL7KdAoxqU9hXdZefCHPlkZ8fb+k6ns7EFh5RMo
	 hOkE0wPWNTB6OGMJQYK6wv5Eoj7YwNR4cfqiuwLsdMZim0TWAtNxtmjEPHV/25mZOo
	 yd0IwZ984WC0SUrVMk951df8jjXodLKy64LT5PqKO7bw5HAWgdK3D1ENVk4ruEobz0
	 zCcOoDBZJ5vKDdgq1mV97EUEpN7gHhZ9DYrJC+T/KXtePRC9kZYJNWVvJ3JQdkW/K2
	 0hPterypp4r+oSfHxaClFyMSqaYlBTAvZJdzFe6QTWvdDgbPl+2+EIn1e7Fllb9CXW
	 g2sM+VQrNluGQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8OxWZdJRTP
  Z4ONyE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP6knOMBefkK/7dnMTYwLhCsouRi0NI4CGj
  xPS3UxkhnCtMEtNf7GCHcPYwSlx/OYG5i5GTg01ATWL6rRusILaIgL7E0tl7wOLMAioSL373s
  IPYwgI+Ep03JgBN4uBgEVCVOPNcHsTkFXCSOHFPGaRCQkBBYsrD92CdvAKCEidnPmGBmCIhcf
  DFC2aIGkWJ2ZebWSDsConG6YeYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxitk4oy0zNKchMzc3Q
  NDQx0DQ1NdY2NdA0tLPUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTyUks2MQKDMqVY
  Ye8Oxssrf+odYpTkYFIS5eWq00gW4kvKT6nMSCzOiC8qzUktPsQow8GhJMFrL6iZLCRYlJqeW
  pGWmQOMEJi0BAePkgjvViWgNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81KlxHmdlIGKBECKMk
  rz4EbAovUSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeTpApPJl5JXCbXgEdwQR0xA0VdZA
  jShIRUlINTJX3D1nd4BLV5Dk5o10r6vGNGQWvcs7sTeidIPz/2Mv+BNV/D6XviV/5dXrOYqWE
  uVcmqi9lWPmwhoFXgE1/38+kY3tMz2wry395vzCs98NmEXfjvRYS066FLLa4eJZ3DZvMXcXFv
  csuPhXvkRCu3C3E65aesuLNhlIFnWVmIvuFCgpXPzw0Z8ePAz8kloQkPy9ta3/kYaa3w6c1ok
  /22dy0p+XBjy4FaMcJr7S2cT5jGzr37PGpcXEP3bUK5z/Rfmi1WFJeT7d5GU9pu2wBq0Eiw7H
  jnk8Ndp3l3zv7bJ2/BGNIhuedJRJaBR6793MYtbgISnbFnF7tJtZuy7zWZ/H3bb5fTztM3n1W
  3/ngeSWW4oxEQy3mouJEAIZMkn1RAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1663640578!50905!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10533 invoked from network); 20 Sep 2022 02:22:58 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:22:58 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8D22B156
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:22:58 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7FE93152
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:22:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:22:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.48.1 -> 1.49.0
Date: Tue, 20 Sep 2022 10:22:45 +0800
Message-ID: <1663640565-27534-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:23:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98884

0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-Do-not-mix-C-and-C-compiler-options.patch | 27 ++++++++++---------
 ...cio_1.48.1.bb => python3-grpcio_1.49.0.bb} |  2 +-
 2 files changed, 16 insertions(+), 13 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.48.1.bb => python3-grpcio_1.49.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
index f416ca2728..1f465dbb6e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
@@ -23,16 +23,17 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
- setup.py                      | 9 ++++++---
- src/python/grpcio/commands.py | 5 ++++-
- 2 files changed, 10 insertions(+), 4 deletions(-)
+ setup.py                      | 11 +++++++----
+ src/python/grpcio/commands.py |  5 ++++-
+ 2 files changed, 11 insertions(+), 5 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index ec27fe4..b2d2d1a 100644
+index 3a50c97..bb2386d 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -206,8 +206,11 @@ def check_linker_need_libatomic():
+@@ -205,8 +205,11 @@ def check_linker_need_libatomic():
      """Test if linker on system needs libatomic."""
      code_test = (b'#include <atomic>\n' +
                   b'int main() { return std::atomic<int64_t>{}; }')
@@ -46,15 +47,17 @@ index ec27fe4..b2d2d1a 100644
                                  stdin=PIPE,
                                  stdout=PIPE,
                                  stderr=PIPE)
-@@ -217,7 +220,7 @@ def check_linker_need_libatomic():
+@@ -215,8 +218,8 @@ def check_linker_need_libatomic():
+         return False
      # Double-check to see if -latomic actually can solve the problem.
      # https://github.com/grpc/grpc/issues/22491
-     cpp_test = subprocess.Popen(
--        [cxx, '-x', 'c++', '-std=c++14', '-', '-latomic'],
-+        [cxx, cxx_args, '-x', 'c++', '-std=c++14', '-', '-latomic'],
-         stdin=PIPE,
-         stdout=PIPE,
-         stderr=PIPE)
+-    cpp_test = subprocess.Popen(cxx +
+-                                ['-x', 'c++', '-std=c++14', '-', '-latomic'],
++    cpp_test = subprocess.Popen(
++                                [cxx, cxx_args, '-x', 'c++', '-std=c++14', '-', '-latomic'],
+                                 stdin=PIPE,
+                                 stdout=PIPE,
+                                 stderr=PIPE)
 diff --git a/src/python/grpcio/commands.py b/src/python/grpcio/commands.py
 index d93b6c7..a8c4a51 100644
 --- a/src/python/grpcio/commands.py
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.48.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.49.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.48.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.49.0.bb
index b2ca35154e..c3266e5d20 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.48.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.49.0.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
 "
-SRC_URI[sha256sum] = "660217eccd2943bf23ea9a36e2a292024305aec04bf747fbcff1f5032b83610e"
+SRC_URI[sha256sum] = "90ec337f36db26fbc70a4c032bcbabb2008f950f4194e99385118a12688fdf92"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1


