Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB670F506D5
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 13:54:23 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51137.1773669255416879377
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 06:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=ZZ2db6WT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1334352-2026031613541325e4ea298b0002076c-xozc2o@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026031613541325e4ea298b0002076c
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 16 Mar 2026 14:54:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=b6t1BELrAwHlSOGGoyzkrtndrfmANOZdkFpFYcrUKTg=;
 b=ZZ2db6WT5wTioMXCZ2uNBGtVeDWA5xnjXdGmV4/PBanX5gGjEb7nqksPOBQKme96i2A669
 pfjlaYeZk+NwZ03Yu+lXzsPXJLmhs05gFZHuKVZLeIPYIboN5DOvvCxtDDPzbQG2IxjHEVZC
 yyXOdShrEmEZXeNU/eJ82nXW2UR3mhSJ+Tb+91JtT4zRvWPi30cBxEsf+kjLCPDN5FXJgidE
 aUURZUbYKawPKvY/2HvQve9Dur/nSndkvvYZmKX7fp3aThMiHorO61IdwbvIr0FFvlonpMjO
 61gHlfuxohm6EtLgdDflKx2kQq/Ro4tZfWhuXdEAwkmXcs11mCoKwakg==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH v2 11/14] python3-grpcio: upgrade 1.76.0 -> 1.78.0
Date: Mon, 16 Mar 2026 14:53:47 +0100
Message-ID: <20260316135347.265147-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 13:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125279

Change build tools from setuptools3 to python_setuptools_build_meta

Add cython depends and change cython requirement from cython==3.1.1 to
cython>=3.1.1. Currently we use cython version 3.2.4

Changelog:
  https://github.com/grpc/grpc/releases/tag/v1.78.0

Changes for python:
- aio: fix race condition causing asyncio.run() to hang forever during the shutdown process.
- Migrate to pyproject.toml build system from setup.py builds.
- Log error details when ExecuteBatchError occurs (at DEBUG level).
- Update setuptools min version to 77.0.1.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 ...thon3-grpcio_1.76.0.bb => python3-grpcio_1.78.0.bb} | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.76.0.bb => python3-grpcio_1.78.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
index 037614da3e..6ac6a72d25 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
@@ -13,11 +13,11 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73"
+SRC_URI[sha256sum] = "7382b95189546f375c174f53a5fa873cef91c4b8005faa05cc5b3beea9c4f1c5"
 
 RDEPENDS:${PN} = "python3-protobuf python3-typing-extensions"
 
-inherit setuptools3
+inherit python_setuptools_build_meta cython
 inherit pypi
 
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
@@ -29,6 +29,12 @@ export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_RE2 = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_ZLIB = "1"
 
+do_configure:append() {
+    # Relax strict cython version pin so that the available cython satisfies the requirement.
+    # The C files are pre-generated so cython is not actually used during compilation.
+    sed -i 's/\"cython==/\"cython>=/' ${S}/pyproject.toml
+}
+
 do_compile:prepend() {
     export GRPC_PYTHON_BUILD_EXT_COMPILER_JOBS="${@oe.utils.parallel_make(d, False)}"
 }
-- 
2.47.3


