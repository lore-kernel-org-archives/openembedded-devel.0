Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A59C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:36:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.14756.1707492986778820367
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VG+n1nRv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E58C61C0002;
	Fri,  9 Feb 2024 15:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707492985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ptzc8h5M8E9fQuBckBvFyQmNSoDK3pZZoL0gg9xThBk=;
	b=VG+n1nRv3MrpxFne3Hbj2jzZqryPm9VE1ZZGj5hWaxL5xa/bi4zC8ZRJ9HUNkjOXQhenaM
	156A3iQipLUD6MFBDaYusCkfHGBsO9qKVjDuvqNBlCxcGsTeiavclTwQsk5V002J3AEHLf
	esb4S/A+VFpoumz5/bKkUEGQ4o6ZY6SAT6AeQeQguRCq5krk4nN/XInjNa1bjZADuSOBdc
	vmhABsR9gIy4B8Qiux64lh7QNUqO1iWazYNOa8Wc20Qc9kjWrmKTRsTkI+j7tSFGDvgqlW
	G3igVEAgua1oWMeAJkHumEFyLTIbm0Kp8FNL3xftHdf5j5t1BQldzvVQVIZmTg==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-oe][PATCH] kernel-selftest: no longer skip ldflags QA
Date: Fri,  9 Feb 2024 16:36:23 +0100
Message-ID: <20240209153623.2759946-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 15:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108687

From: Thomas Perrot <thomas.perrot@bootlin.com>

Because there is no longer the error.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 6868f175bcf1..7d21dac7d573 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -156,7 +156,7 @@ FILES:${PN} += "/usr/kernel-selftest"
 
 RDEPENDS:${PN} += "python3 perl perl-module-io-handle"
 # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
-INSANE_SKIP:${PN} += "ldflags libdir"
+INSANE_SKIP:${PN} += "libdir"
 
 SECURITY_CFLAGS = ""
 COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.43.0


