Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DC9C0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:20:07 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.50822.1738869601201301394
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=YfWDGVvy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025020619195952a6784fb6ccb4c729-tdf0bn@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025020619195952a6784fb6ccb4c729
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Feb 2025 20:19:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3JKPtz0GB+/yDHgNxzliM0z3RBbIy3Xpn7YK/NNo4ys=;
 b=YfWDGVvyzwyy1aOeeA/Sf6YPb1YhuufjBc9Z907k3iNUUxvvVgD2aHkZh2pTwdSShKO3SR
 LZAxeeFc3CA8GtA870OzKeV/pTYE0jFYDKNsNjtfFIDSrU0l7VQzWvlNaCRbLcuSfC2HSGMb
 g2tfZghzeTTDyHIbiDD4wFIXH8BfNZbW/XbwBxWwngQUUADc+e5BcLGK5fF/UrmzVYrcEMZw
 koxJaqqONvuy4i/bolis4uAu57Eq6mv/nPWkocHiI59GuuMb9eoPbQcMemTp2xqs+W0Cu12X
 468pnT51EvKo/5YochMNTpHPo+9s0OjK+Sn+/uDhVo5KhE7HGWrPh/8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 2/9] python3-grpcio: add patch to allow unbundled build
Date: Thu,  6 Feb 2025 20:18:56 +0100
Message-Id: <20250206191903.2324783-2-peter.marko@siemens.com>
In-Reply-To: <20250206191903.2324783-1-peter.marko@siemens.com>
References: <20250206191903.2324783-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 19:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115294

From: Peter Marko <peter.marko@siemens.com>

This is preparation for next commits which to use system libraries
instead of bundled third_party components.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...n-enable-unbundled-cross-compilation.patch | 49 +++++++++++++++++++
 .../python/python3-grpcio_1.69.0.bb           |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
new file mode 100644
index 0000000000..8e45ee584c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-python-enable-unbundled-cross-compilation.patch
@@ -0,0 +1,49 @@
+From ff01ac8908a7267503ffbb85efd24755da0502d8 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Wed, 5 Feb 2025 21:06:50 +0100
+Subject: [PATCH] python: enable unbundled cross compilation
+
+System headers are on a sysroot path provided by the toolchain
+options.
+
+Upstream-Status: Pending
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ setup.py | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 3b6edbe..d3a0d04 100644
+--- a/setup.py
++++ b/setup.py
+@@ -317,25 +317,25 @@ if BUILD_WITH_SYSTEM_OPENSSL:
+         lambda x: "third_party/boringssl" not in x, CORE_C_FILES
+     )
+     CORE_C_FILES = filter(lambda x: "src/boringssl" not in x, CORE_C_FILES)
+-    SSL_INCLUDE = (os.path.join("/usr", "include", "openssl"),)
++    SSL_INCLUDE = ()
+ 
+ if BUILD_WITH_SYSTEM_ZLIB:
+     CORE_C_FILES = filter(lambda x: "third_party/zlib" not in x, CORE_C_FILES)
+-    ZLIB_INCLUDE = (os.path.join("/usr", "include"),)
++    ZLIB_INCLUDE = ()
+ 
+ if BUILD_WITH_SYSTEM_CARES:
+     CORE_C_FILES = filter(lambda x: "third_party/cares" not in x, CORE_C_FILES)
+-    CARES_INCLUDE = (os.path.join("/usr", "include"),)
++    CARES_INCLUDE = ()
+ 
+ if BUILD_WITH_SYSTEM_RE2:
+     CORE_C_FILES = filter(lambda x: "third_party/re2" not in x, CORE_C_FILES)
+-    RE2_INCLUDE = (os.path.join("/usr", "include", "re2"),)
++    RE2_INCLUDE = ()
+ 
+ if BUILD_WITH_SYSTEM_ABSL:
+     CORE_C_FILES = filter(
+         lambda x: "third_party/abseil-cpp" not in x, CORE_C_FILES
+     )
+-    ABSL_INCLUDE = (os.path.join("/usr", "include"),)
++    ABSL_INCLUDE = ()
+ 
+ EXTENSION_INCLUDE_DIRECTORIES = (
+     (PYTHON_STEM,)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index d657ba824f..0265fc0adc 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
 DEPENDS += "python3-protobuf"
 
-SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
+SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
+           file://0001-Include-missing-cstdint-header.patch \
            file://abseil-ppc-fixes.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            file://0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch;patchdir=third_party/boringssl-with-bazel/src/ \

