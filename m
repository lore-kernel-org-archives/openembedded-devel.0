Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC10EFCD80
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:42 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10762.1773050801489160273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=Fe1LL9Ly;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1334352-20260309100639cceaeaccbb00020755-p0pibt@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260309100639cceaeaccbb00020755
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zJh8aS18bnEMrGKhDt6ZiNaKKta+jTZi1mbQ+fuJb30=;
 b=Fe1LL9LyJwHRR/UthTXqqHwRPTKDX1zHLqhKAVvxbteD//pK8XUh46cDWiOUp2ldQJ7v53
 oRtzpl8VqFdqrHwWjk6YL23FANBLXcSWATP6AizWP5RJWt6o6eWDl4wWExYNMiPrBZLEFxCQ
 reytlwCZTtQTUIB8ASmdytQupxnOFEC0SyIXp4S6BBLKF2yndvMOwU4G1RHDF3kZroQ0Hp5W
 FabwY4Jnuw9zHCVSNUaixBZRy3KMvpjFRjVIe0XxF9Cz65Asy8zD6tnbRjC74K4CDXAJ2Azr
 5Rjl77tT4ibuNSYIo/xYoqOjYl9MhXjCPKmhTYRrLu1PaGaZlq4/PcDw==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 11/14] python3-grpcio: upgrade 1.76.0 -> 1.78.0
Date: Mon,  9 Mar 2026 11:06:27 +0100
Message-ID: <20260309100630.404637-11-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124983

Changelog:
  https://github.com/grpc/grpc/releases/tag/v1.78.0

Changes for python:
- aio: fix race condition causing asyncio.run() to hang forever during the shutdown process.
- Migrate to pyproject.toml build system from setup.py builds.
- Log error details when ExecuteBatchError occurs (at DEBUG level).
- Update setuptools min version to 77.0.1.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../{python3-grpcio_1.76.0.bb => python3-grpcio_1.78.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.76.0.bb => python3-grpcio_1.78.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
index 037614da3e..092df4c78f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.76.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
@@ -13,7 +13,7 @@ DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73"
+SRC_URI[sha256sum] = "7382b95189546f375c174f53a5fa873cef91c4b8005faa05cc5b3beea9c4f1c5"
 
 RDEPENDS:${PN} = "python3-protobuf python3-typing-extensions"
 
-- 
2.47.3


