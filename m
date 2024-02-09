Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CC9C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 23:20:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.2290.1707520832816868771
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 15:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WBsiMHeV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A01F760003;
	Fri,  9 Feb 2024 23:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707520830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AO24jBEbUgixz0PRcXqj6C6GVleAmA1kthfzwXqyZss=;
	b=WBsiMHeVh2TeeGBX4a9YWNkbTLRlQq+eyf8HoNXxs1Zg7/sAF7kA7uhbhejrcufisKFBym
	wr+TSLM19ZUJcOE8+U4CZSW+mjaQjcOxvkjnaorKfO+nndTqc0PlBy8xu7LQBUMcr4Uoqu
	DUAg0SpmM5qzARrvN6KtLJk+WrRoAiVyhwpdr7OzPy92VUUHk9fsDMl4T+bpeM6LNVEFRh
	wxthlKXsg4PxBY/5n7b1xWxcfYuELNG8ncvK7ZPB0C+/43amzGRU45PhxBO/rRQ8SnuhZr
	1EjKNz5BI5GxoiZBs4x8MOIuyAb9MpyIOvs0Q3cjQk5gGiHgtObZbvuLDHsJ/A==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-oe][PATCH v2] kernel-selftest: no longer skip ldflags QA
Date: Sat, 10 Feb 2024 00:20:27 +0100
Message-ID: <20240209232027.206723-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 23:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108695

From: Thomas Perrot <thomas.perrot@bootlin.com>

Because there is no longer the error.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 6868f175bcf1..01f185adbae4 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -155,8 +155,8 @@ INHIBIT_PACKAGE_DEBUG_SPLIT="1"
 FILES:${PN} += "/usr/kernel-selftest"
 
 RDEPENDS:${PN} += "python3 perl perl-module-io-handle"
-# tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
-INSANE_SKIP:${PN} += "ldflags libdir"
+
+INSANE_SKIP:${PN} += "libdir"
 
 SECURITY_CFLAGS = ""
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.43.0


