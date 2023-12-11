Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A756FC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 13:19:53 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.7998.1702300789005344425
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Dec 2023 05:19:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Do7Wdr6I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C6AFE0003;
	Mon, 11 Dec 2023 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702300787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gmMe6FVvAON85su5eTVx9Ybjx7DBslGvdZEh6hcEgnw=;
	b=Do7Wdr6IHY18fEmoh6/nAPUjO090hIq28IcNkrLjgc5kqZrPzKGEnht3QwXRLfMpL6ixkE
	0sb4PU/B8NlvQrFtz/Itm4L6jVAhjbVDpC04g4NK6xfOCUHc8oEhjvT2aKYrRsDtFdrDrS
	FROYoMp2nq/wAsDDYvmFIf5ppKuebP/sb5Rs+XHE652vPV86qxo+0+Nzy19l+oMe+nozZF
	xJJPslaml5OK2Z2sLm0ZkPB3PEwEAMWUS0lSweY3worY1slfqCwkXHe6HzzxfrRZD6xRUL
	ScjztlTuSirG7HEl5BI075BAWTS1NlVNTd8kHPCUrbYnJZ1e2mxLkIndIjtQXw==
From: alexandre.belloni@bootlin.com
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [meta-oe][PATCH] poco: fix branch
Date: Mon, 11 Dec 2023 14:19:38 +0100
Message-ID: <20231211131938.127747-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 13:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107329

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The current SRCREV is not on any branch anymore, switch to the 1.12.4
branch HEAD which is similar and the only change is irrelevant.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta-oe/recipes-support/poco/poco_1.12.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipes-support/poco/poco_1.12.4.bb
index 12532e4ef1b8..96817c140e76 100644
--- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
+++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
 # These dependencies are required by Foundation
 DEPENDS = "libpcre2 zlib"
 
-SRC_URI = "git://github.com/pocoproject/poco.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/pocoproject/poco.git;branch=1.12.4;protocol=https \
            file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.patch \
            file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.patch \
            file://0001-Fix-data-race-when-create-POSIX-thread.patch \
            file://run-ptest \
            "
-SRCREV = "1211613642269b7d53bea58b02de7fcd25ece3b9"
+SRCREV = "3572a1fb981672e2cd1d2533ffd836da7db0f414"
 
 UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


