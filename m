Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8708BC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:27:52 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5614.1784575669768151152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XvQIkA3B;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260720192747db74e5dee90002070b-cdrhui@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260720192747db74e5dee90002070b
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 21:27:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6tQ1QX3jolCeIkruQ6ii0Pu5WvJUF8L3BgKT3ncvJWs=;
 b=XvQIkA3BjLkxxLKGBOjWDibMNe+hWv5tnNEFEFyEmVI0xeZU/MLzknHQl15rN2p71UMw7U
 X0AhbQIYJ7eiGt7i7WkxAGAGPxJ9533UzlE961rgv1c0X3XToN/i2MbNp+7FyUGUnILG1LPO
 BSKTZ+En7m2CvfEt/hxJvWoHSgqaem3yfYjsIt6zdH12NLSP25xMBYYT2nDIyzjIXDMUOOmV
 Hpp1wp589x7YUT4PYNb+wtNahIZDjrlviQQ94+RFaPFllmttxaX/GrBstBEqFU7QHSHzo0Mc
 quuj2d07Re31QItSd7DJPTPzf7xqZ+QQzlqZDWv0OESEpbTRRwGGIvfg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 3/6] protobuf: set status for CVE-2024-7254
Date: Mon, 20 Jul 2026 21:27:29 +0200
Message-ID: <20260720192732.28245-3-peter.marko@siemens.com>
In-Reply-To: <20260720192732.28245-1-peter.marko@siemens.com>
References: <20260720192732.28245-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128290

From: Peter Marko <peter.marko@siemens.com>

Version 4.28.2 is correctly set in [1].
Unfortunately also protoc version 28.2 with the same CPE is mentioned
which creates a false positive which needs to be handled.

[1] https://github.com/CVEProject/cvelistV5/blob/main/cves/2024/7xxx/CVE-2024-7254.json

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
index 880dd82b1d..6aa858f2fc 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
@@ -129,3 +129,5 @@ RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'py
 MIPS_INSTRUCTION_SET = "mips"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2024-7254] = "fixed-version: Fixed since 4.28.2"

