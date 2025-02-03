Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB37C02193
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:23:12 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.95516.1738606986192776837
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 10:23:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=dXVo9twm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250203182303ea1602fcd9d2b47825-86enik@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250203182303ea1602fcd9d2b47825
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 03 Feb 2025 19:23:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=JCrVw0+ym+NSC8Kjos8aMYRy0pES4/mbh7KASFW/hac=;
 b=dXVo9twmSMrpyczH6Dwohinp4Qzl6lTtj2V2Tpp00djZ3bB9JiqtieUr1FQm2lBHNC1BB6
 LbJW4tCmS6nVyMbYGzY25NfVt575153l+l34cxOMyFTLeEMEzVMl7tgOvTQuy6TgEL8XzGjh
 40A38IczvRzdQhVeFPHaUO3rByQntJiWq+zLxNeDrRHuqVt4hl/IxQ3WCd2uHxlVX9vsAt8y
 KjNTfbQpnGahmKMFYF4F8uWpz3cnftPoAaMENxiOicdHJqUNl5T1CLXTY+ht8pA2DQNoJw9Y
 Y0xbnV0bzS7moDhDPee9bJVjxNwVHKO5lOVo/uQdHNzgn+sUrVli8uFg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 1/9] protobuf: remove unneeded atomic linker flag
Date: Mon,  3 Feb 2025 19:22:02 +0100
Message-Id: <20250203182210.574300-1-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 18:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115245

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

