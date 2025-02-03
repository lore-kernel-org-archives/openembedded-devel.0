Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F1AC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 18:23:22 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.95229.1738606999190339235
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 10:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=TfN9m3Gw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250203182320c247d6c43c94f1a0a5-mslx9a@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250203182320c247d6c43c94f1a0a5
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 03 Feb 2025 19:23:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=T4PdgqG4Xn5kRifDrXqdk6SRR5hSUNiu7ZEZ25WbSHk=;
 b=TfN9m3Gwv7YC8K82RPTnWZn6sojZz/aiVSqcNmH1ZIXayRzitmt6mY01ws0Z5JaOx1M94d
 4cCacCNx4KGsh7klR6TXHVwVFu/9E7IK876HQEdtptlnvuiKo3P4VGJJxfnfnZ9o64r8QE47
 sfG9LK8lPb/VxUNEdf5qVgU5m3ciVXaY8sPq4tUj29wD7FQ3i443EaBhr/fcEGPEPvaS9YxR
 5HbYv142DrYyY/FktQMEu5q9svqa8eBq+ldBRvSp15PIGW6cjYeqT2/cQbi+cLGUpr5gd/y0
 HLFJY2S33Xk21g4ehCpVYYVe1pGXYsi5+D6mINqEVFhIw4Ydwkh6VkDg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 5/9] protobuf: don't download git submodules
Date: Mon,  3 Feb 2025 19:22:06 +0100
Message-Id: <20250203182210.574300-5-peter.marko@siemens.com>
In-Reply-To: <20250203182210.574300-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
 <20250203182210.574300-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 18:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115249

From: Peter Marko <peter.marko@siemens.com>

All dependencies are used from recipe sysroot now.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
index 470c368cf3..ded2c9b11b 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -12,7 +12,7 @@ DEPENDS:append:class-target = " protobuf-native"
 
 SRCREV = "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
 
-SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            "

