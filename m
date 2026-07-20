Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AC1C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:28:32 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5618.1784575704133040783
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VKzNEaEn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260720192822f4cf8b8ac3000207a9-slfymz@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260720192822f4cf8b8ac3000207a9
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 21:28:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6tQ1QX3jolCeIkruQ6ii0Pu5WvJUF8L3BgKT3ncvJWs=;
 b=VKzNEaEnHlYfSfBZmvuW+K5CTa38ph5RkliwFslMjZABVV1WWBTBTGNAaSNm00pDu3IImi
 SZyZayscQHri536W5e6zxIxMLrH6uAZ/6gSy8DW5bKvNok8GCz53LeLeG+28ReosQa+xuGdx
 25aCCYYmLlEL5NTZRJICMKTF84Rdr3sediKeaifNp99doJKCyys8qXZ5Ha63Jk2osu2fv++S
 3pmaDi7YcoBcIDSb9PiDrTnTyh4R5AC4qVftXwyCCcNLfGewzVFLpZ2UFJWWB1PI67vk2bA9
 AElPJjWvwWlEwFDq2oScynCFIP29xZmQVxPW4PAmWlE35mrErI/v5Bhw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH 3/6] protobuf: set status for CVE-2024-7254
Date: Mon, 20 Jul 2026 21:28:06 +0200
Message-ID: <20260720192809.28277-3-peter.marko@siemens.com>
In-Reply-To: <20260720192809.28277-1-peter.marko@siemens.com>
References: <20260720192809.28277-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128296

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

