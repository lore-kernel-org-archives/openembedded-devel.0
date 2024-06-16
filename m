Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803D3C2BA1A
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 19:24:19 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.40409.1718565853515436181
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 12:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ehNXWNAY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20240616192411f522424ac8d147da06-zgt2z9@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20240616192411f522424ac8d147da06
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 21:24:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=i5DSpNTgCyo+raQebm033jivHw5hnMdAJkNwcbVei28=;
 b=ehNXWNAYasvD0FLYWU7HN1JHMGrRxiv5L1QsgXib+QlJYDIQ4MT152ZUZk/PWgTKPEILQB
 kbog4najmrXM9vmOMWtN1gRV/5gUL+PlKkIMlnLRW3Z40ZIJ1DIECC0x6b2hVl5o3ZI9tepS
 b6tj8Hvzy6va3gwchm5LasIFcUSR8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH 6/6] re2: rework solibs handling
Date: Sun, 16 Jun 2024 21:23:10 +0200
Message-Id: <20240616192310.856262-7-peter.marko@siemens.com>
In-Reply-To: <20240616192310.856262-1-peter.marko@siemens.com>
References: <20240616192310.856262-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 19:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110924

From: Peter Marko <peter.marko@siemens.com>

This is cleaner way how to package unversioned libraries
which was suggested during review of the last commit.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/re2/re2_2024.03.01.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
index 6e5b32a945..76d6f0c7a9 100644
--- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
@@ -32,7 +32,8 @@ do_install_ptest () {
 }
 
 # ignore .so in /usr/lib64
-FILES:${PN} = "${libdir}"
+SOLIBS = ".so*"
+FILES_SOLIBSDEV = ""
 INSANE_SKIP:${PN} += "dev-so"
 
 # Don't include so files in dev package
-- 
2.30.2


