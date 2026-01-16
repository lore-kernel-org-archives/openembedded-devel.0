Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33930C98301
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 19:56:17 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5949.1768593371613543884
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Jan 2026 11:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Urbjk5Np;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202601161956097eb803e37a00020701-vkj8aw@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202601161956097eb803e37a00020701
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 16 Jan 2026 20:56:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=CqJ/8AX5AF4zWs6icT59VCnqqOGbeefy5wyg+6sW004=;
 b=Urbjk5NpLKUitv++n+edsF/0vH2grOWVftaUDL4Uatvdbs4B3/IXbzxS7MEBkTQylFSfgj
 uyWnEInNwjRcwlCMnCtT3AotLNxUZTb4+xxAP1qjhPlOOQwsSAZFCgOJoZBt/sUvW0Mdx+sR
 1oRGTH47G0xQB4mjLyjzE4bw3vxBChLcHR2w1xxPGY8j0vkxhxNXMNzRWkdLn3ZheCIZdYFj
 V9sYHdBJDatL87i/lTrKtHooCFwG7KLeeqyVswXm81C54FLrzeJqDStBXQjuL0q4dthP4Tez
 5G3vz5dmn03uOU+Ym/lU7oVofyGkB9MWbnfrXAoFid37LPTc8n+eVwjg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][whinlatter][PATCH] libcoap: set CVE version suffix
Date: Fri, 16 Jan 2026 20:56:07 +0100
Message-Id: <20260116195607.1017595-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 19:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123541

From: Peter Marko <peter.marko@siemens.com>

CVE metrics currently report CVE-2025-34468 as open.
CPE is <=4.3.5, while recipe version is 4.3.5a which is a higher
version, however by default cve-check only compares numbers.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
index 1a8d7ed725..611795e17d 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/obgm/libcoap.git;branch=release-4.3.5-patches;protoc
            "
 SRCREV = "e3fdcdcfbd1588754fe9dd4b754ac9397260f0f9"
 
+# patch releases often use alphabetical suffixes
+CVE_VERSION_SUFFIX = "alphabetical"
 
 inherit autotools manpages pkgconfig ptest
 

