Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB093C02194
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:40:04 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.73880.1738532402571950227
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HUk29Ama;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202502022139584d2db2b786e2ed7750-yfjev4@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202502022139584d2db2b786e2ed7750
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 02 Feb 2025 22:39:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JCrVw0+ym+NSC8Kjos8aMYRy0pES4/mbh7KASFW/hac=;
 b=HUk29Ama5Vc3N6ToDdd6INGHaY5fdLM0XwnFtC+aSNKtCop1x2UpI7Sbhau78rAdGaThvZ
 ZvYwoCQ2K7DdgeccCCojkGSrQpy4hU/rtjpEcoMQMu9O6sIkAIxyWK2G2FcVYkVzaVNxIC/h
 KnNxpJkc0Jm0ECWSPyb3g0e/X42Qx2nLEl5nhfZ9E5l0WRgUhb6GjjQkW1afuySS0MfMfIOk
 kJIWxaBLPtdgOC+xa7BU4t5octxg1U2/oDIgDTPBJ9NPKubGB59ZY8q+6XX+yHX5Nz+3SVTy
 YBdQ6mCwJh/B62U+ed8vGdwTOBzP96uOJVwd4Q2QCwMdQ9ORRrmmOddA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/8] protobuf: remove unneeded atomic linker flag
Date: Sun,  2 Feb 2025 22:39:03 +0100
Message-Id: <20250202213910.284312-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 21:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115220

From: Peter Marko <peter.marko@siemens.com>

This is handled in protofuf cmake since 3.15:
https://github.com/protocolbuffers/protobuf/commit/55ed1d427ccc0d200927746329ac9b811dee77b9

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
index 89e1071b59..efd70d6474 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -115,9 +115,3 @@ RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'py
 MIPS_INSTRUCTION_SET = "mips"
 
 BBCLASSEXTEND = "native nativesdk"
-
-LDFLAGS:append:arm = " -latomic"
-LDFLAGS:append:mips = " -latomic"
-LDFLAGS:append:powerpc = " -latomic"
-LDFLAGS:append:mipsel = " -latomic"
-LDFLAGS:append:riscv32 = " -latomic"

