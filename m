Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7080.1617280398888613875
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 05:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60188 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRwVg-0001wN-1f; Thu, 01 Apr 2021 15:33:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-cryptography: Upgrade 3.3.1 -> 3.4.6
Date: Thu,  1 Apr 2021 15:33:10 +0300
Message-Id: <20210401123310.566-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 3.4.6:

- Updated Windows, macOS, and manylinux wheels to be compiled
  with OpenSSL 1.1.1j.

New versions of python3-cryptography depend on Rust. Temporary,
the environment variable CRYPTOGRAPHY_DONT_BUILD_RUST has been set
to disable Rust and to avoid dependency on addional layers such
as meta-rust. Hopefully, in long-term with the introduction of
Rust recipes in newer Yocto releases this will be fixed.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-cryptography/h-test.patch  | 23 ++++++++++++++++---
 ...3.3.1.bb => python3-cryptography_3.4.6.bb} |  7 +++++-
 2 files changed, 26 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.3.1.bb => python3-cryptography_3.4.6.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
index 9f07c7380..0f257a5ed 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
+++ b/meta-python/recipes-devtools/python/python3-cryptography/h-test.patch
@@ -1,10 +1,27 @@
+From 0707dc0701ea265cbf979d4a10457b29721bcaf7 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Fri, 26 Feb 2021 12:58:22 +0200
+Subject: [PATCH] tests/hypothesis/__init__.py: Import pytest
+
+Import pytest.
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ tests/hypothesis/__init__.py | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tests/hypothesis/__init__.py b/tests/hypothesis/__init__.py
+index b5093362..d4c9b80b 100644
 --- a/tests/hypothesis/__init__.py
 +++ b/tests/hypothesis/__init__.py
-@@ -3,3 +3,7 @@
+@@ -1,3 +1,7 @@
+ # This file is dual licensed under the terms of the Apache License, Version
+ # 2.0, and the BSD License. See the LICENSE file in the root of this repository
  # for complete details.
- 
- from __future__ import absolute_import, division, print_function
 +
 +import pytest
 +hypothesis = pytest.importorskip("hypothesis")
 +
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
index 79a7ac1bf..3978952ed 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.4.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba"
 
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "7e177e4bea2de937a584b13645cab32f25e3d96fc0bc4a4cf99c27dc77682be6"
+SRC_URI[sha256sum] = "2d32223e5b0ee02943f32b19245b61a62db83a882f0e76cc564e1cec60d48f87"
 
 SRC_URI += " \
     file://run-ptest \
@@ -15,11 +15,16 @@ SRC_URI += " \
 
 inherit pypi setuptools3
 
+# Set the environment variable to disable Rust
+export CRYPTOGRAPHY_DONT_BUILD_RUST="1"
+
 DEPENDS += " \
     ${PYTHON_PN}-cffi \
     ${PYTHON_PN}-cffi-native \
     ${PYTHON_PN}-asn1crypto \
     ${PYTHON_PN}-six \
+    ${PYTHON_PN}-semantic-version-native \
+    ${PYTHON_PN}-setuptools-rust-native \
 "
 
 RDEPENDS_${PN} += " \
-- 
2.17.1

