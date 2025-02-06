Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE81C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:20:07 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.50452.1738869599739066001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:20:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=bgBGIJGP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250206191956268ef4827d2d1bb23f-dkvk8l@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250206191956268ef4827d2d1bb23f
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Feb 2025 20:19:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fcq7tLHD1P9/kz6gFc/xFUUc4z/t5qikF7x/SVTYIsk=;
 b=bgBGIJGPg0QZ5btRqVm9hcv6yL9rId0d5milRxB6XDcsFZqiYvN+QQZGaO7zCVja1qoS3q
 KkTuuGhrYKdrh4NgRFEZCu0OhmJ17J40flXCSAVWU1EcP9RXMoNJxYIC04ZeOUhlJ+VVA5Ih
 NeQtxVm+9eBvNVQYVMHJGMdWEtCYtt9laigqMVGEpebUeoWj+qihsW3dua6z1Y41kG3O84cC
 f6yb37XEPCJSAYoMo+M8X+igfFNDIi3SuOoycSQT7Uenb+pg2QzNhiidTxe0f6bRvRm60pOw
 XQ06s2Z8eogbawX7akjlh18x9mxyy880gaytYViESFLN9q34dYHeacBA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 1/9] python3-grpcio: drop obsolete variable
Date: Thu,  6 Feb 2025 20:18:55 +0100
Message-Id: <20250206191903.2324783-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 19:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115293

From: Peter Marko <peter.marko@siemens.com>

Variable GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY was removed in v1.62.0.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index 617e982382..d657ba824f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -21,8 +21,6 @@ inherit pypi
 
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
-export GRPC_PYTHON_DISABLE_LIBC_COMPATIBILITY = "1"
-
 BORING_SSL_PLATFORM:arm = "linux-arm"
 BORING_SSL_PLATFORM:x86-64 = "linux-x86_64"
 BORING_SSL_PLATFORM:aarch64 = "linux-aarch64"

