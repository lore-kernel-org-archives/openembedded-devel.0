Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94B6C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:40:24 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.73936.1738532417743047086
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Bf/FbCBw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202502022140141d0b37fba51ab41524-ahdnkd@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202502022140141d0b37fba51ab41524
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 02 Feb 2025 22:40:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=T4PdgqG4Xn5kRifDrXqdk6SRR5hSUNiu7ZEZ25WbSHk=;
 b=Bf/FbCBw4f71JjAiSvHFu3oUvw1aqUWYeQ6FWZBugYQBJWtniD8Iji73nqJEtI+CKBRcea
 zD9MlLzhsgBxkVHwHakTDVNZ8LqMe2FXGX+82UIPeh6jdQVm0kOBNY82+RX6f7vJ+jakKXDA
 O+N0F3aX5Xo3G0729UUDuac1lY0Cis4K0R+Lk38lTUGqq7TvZlg6LPugDPReO/hBh6wbGzk2
 mHCLY3jjpEYTUgUHloUEnBXGSx+1RkOen00DsGCD0rmbdvjZazzyb9sMDrbe48hxuLDHxY4O
 UVi3oZ9OLTDTRVNhW1pMww1kYQSczjHHEzQxhfBZbs6NaalLRiD8cXaQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 4/8] protobuf: don't download git submodules
Date: Sun,  2 Feb 2025 22:39:06 +0100
Message-Id: <20250202213910.284312-4-peter.marko@siemens.com>
In-Reply-To: <20250202213910.284312-1-peter.marko@siemens.com>
References: <20250202213910.284312-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 21:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115223

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

