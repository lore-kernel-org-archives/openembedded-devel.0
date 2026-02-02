Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295EAE73144
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 08:02:26 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48224.1770019336350444727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 00:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Pf//C6bu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260202080213d0d6301567000207c0-bob6ld@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260202080213d0d6301567000207c0
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 02 Feb 2026 09:02:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=PTyLJqyPhVFoDSxFvtBEemhcqN3otWOdX9jD9iimxts=;
 b=Pf//C6buz20ID2ytyj4+9F1RwwMnlXIiGlnE4o/1B37W1lULQNYcyr3mOOH3bqYD+RsjwF
 j/MpytqEy0ebrxQxhx5WSWZvPyhFNphY8N/g4dtFq++6KuwY74GX+bdv6VMbfJ41fvMgafDA
 zM/NN5y+3MKMhJRuzMTd6i5bo0LiwoweEwoZfxfOygKE/bc/yyQrGFSbaqooK2KdWZxpnPLb
 YJAqUIiIG/hG5RMq2MNfcls6/mruSx4UW/zhC0itt7rWCh5i1NrtTVluemt5gJqJp8l+5PAE
 S1s8CmtB1PiwmFU0jH0pjWGXbmiUkzKmLdFUh1s5ohqKroGfjx6Wpmhw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH v3] python3-protobuf: upgrade 6.33.4 -> 6.33.5
Date: Mon,  2 Feb 2026 09:02:09 +0100
Message-Id: <20260202080209.450227-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124054

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-0994.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: fixed "from" version in commit message
v3: rebase on top of newest master

 .../{python3-protobuf_6.33.4.bb => python3-protobuf_6.33.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.4.bb => python3-protobuf_6.33.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
index 371f6c8705..af30165f81 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "dc2e61bca3b10470c1912d166fe0af67bfc20eb55971dcef8dfa48ce14f0ed91"
+SRC_URI[sha256sum] = "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 

