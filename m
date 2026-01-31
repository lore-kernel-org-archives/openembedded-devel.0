Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF49E7C6F7
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 22:19:00 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18866.1769897934002243416
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 14:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=EQ+moZpv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202601312218510a4bc21bcb0002072e-asciw1@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202601312218510a4bc21bcb0002072e
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 31 Jan 2026 23:18:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2MPfY1b+GjH5Sf72rJTtFjO5z/xm8sr0Gq+7esZdPaE=;
 b=EQ+moZpvFvC/buRem5xbnf0Qj6PJqA4qrC9WA34j6R0gEp30iOpNwzFsssS6KLQYHpwmpY
 aEmjLzaPsaYc8mHsgXzjDKJRsjjWc0A4qSiu1ziCIZC1FhF39WEgBnIIQQEUymQOLdLImh0T
 PrNd3H+l5Kc5gxDqHeCqCUzIy8Im/3e7rjKUaF8f6vYJZf6dNi0nUw2s6zTUBbA4ONgjxW14
 MXEvRADKBU++wRPJEmE/VLHCJnsayneep/U/yGxWL5zSKeaClOtkXSjCF3FKNtoSW4IZSci7
 bqq7dEFwG/58q4LAwncLppIBdsvdnySdE+islM6r7f/A8nzP5x4XczAA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [meta-python][whinlatter][PATCH 1/2] python3-protobuf: upgrade 6.33.1 -> 6.33.2
Date: Sat, 31 Jan 2026 23:18:42 +0100
Message-Id: <20260131221843.307007-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 22:19:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124027

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Change log:
https://github.com/protocolbuffers/protobuf/releases/tag/v33.2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{python3-protobuf_6.33.1.bb => python3-protobuf_6.33.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.1.bb => python3-protobuf_6.33.2.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
index fcf53cb9a0..d0ef7753b0 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.1.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "97f65757e8d09870de6fd973aeddb92f85435607235d20b2dfed93405d00c85b"
+SRC_URI[sha256sum] = "56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 

