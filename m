Return-Path: <nora.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A285FCD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:49:52 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74177.1780991386853208518
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 00:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=DR/qvG9K;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: nora.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=/TPSvS8rLKLvJOs8JaIWeoFgQQLDMEe0ry8A/CzPcsk=; b=DR/qvG9KPVQ+63xogsTfJN2XBU
	NH5aWn5YbIGfCJ5/bI0YOzTQK3k/bHGTgv3+TeBQq62izNQvFcCtItE62dn8DYVbq5r+l12NqTLCH
	WCIVQ8e+lP7SmV+eapMjcAqyDJ18NDEacwdtXskhf/GubJ3jtDaGApmqxW+WdlvmADmYZTAmhqTwj
	KHRhxT6LreNKKksyEn8Dy3vWj68F8ObCKjM+77xbnCwLZk7E4R1wTzEOrExsPeFh0cCoqzs39XlXf
	kcgqkfiCQ+GHr282RKMpgRhwx/++NEpQYrxqG5J5b5SahdZk8be86quJYZ+7kutw0AljF+TBd/kNF
	KCXj6Wng==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wWrDV-000NOe-0e;
	Tue, 09 Jun 2026 09:49:45 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1wWrDV-000Iau-1q;
	Tue, 09 Jun 2026 09:49:44 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [meta-oe][master/wrynose][PATCH] kernel-selftest: do not run 'make clean'
Date: Tue,  9 Jun 2026 09:49:14 +0200
Message-ID: <20260609074914.33559-1-nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28026/Tue Jun  9 08:25:31 2026)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127436

Due to the way the kernel-selftest sources are set up, the toplevel
Makefile does not work and `make clean` will always result in a "The
source tree is not clean, please run 'make ARCH=... mrproper'" error.

Avoid running it by setting CLEANBROKEN = "1", so rebuilding the recipe
without a clean (which often happens when the kernel has changed) does
not fail.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 7850ddb6c9..06919c8bba 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -129,6 +129,8 @@ EXTRA_OEMAKE:append:toolchain-clang = "\
     HOSTLD="clang ${BUILD_LDFLAGS} -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++" \
 "
 
+CLEANBROKEN = "1"
+
 KERNEL_SELFTEST_SRC ?= "Makefile \
                         include \
                         kernel \
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


