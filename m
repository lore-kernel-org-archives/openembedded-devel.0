Return-Path: <jefdriesen@telenet.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7501CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 12:35:21 +0000 (UTC)
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
 by mx.groups.io with SMTP id smtpd.web10.18561.1755693321153341806
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 05:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@telenet.be header.s=r25 header.b=o74v9PRu;
 spf=pass (domain: telenet.be, ip: 195.130.137.90, mailfrom: jefdriesen@telenet.be)
Received: from barracuda.home.lan ([81.82.41.169])
	by albert.telenet-ops.be with cmsmtp
	id UCbK2F0023ez9KD06CbK5n; Wed, 20 Aug 2025 14:35:19 +0200
Received: from precision.atlascopco.group (precision.home.lan [192.168.20.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by barracuda.home.lan (Postfix) with ESMTPSA id 463B79F6D1;
	Wed, 20 Aug 2025 14:35:18 +0200 (CEST)
From: jefdriesen@telenet.be
To: openembedded-devel@lists.openembedded.org
Cc: Jef Driesen <jefdriesen@telenet.be>
Subject: [meta-oe][walnascar][PATCH] lcov: Add missing RDEPENDS for nativesdk
Date: Wed, 20 Aug 2025 14:34:27 +0200
Message-ID: <20250820123427.3245441-1-jefdriesen@telenet.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telenet.be; s=r25;
	t=1755693319; bh=QQrqC60b6nKKuotvNoumrN5AYtetlHwMK1PgdErf6wM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=o74v9PRu/owII3gpxh2EatQ4rQ5B77GqSA7ZWsmmWsL7dUVR73QIJx4K2cuTg1fFl
	 y1ISbqfp3OBSzAbSRPr9HcYY9IWnXvzB7/yXJ61FO02KCGiklm+i8w9V62f5/Mc0HD
	 Sexfaenw12d20plI78eN9Ix6JJgYlakaH6jnxvS0TlxOP+R/PcjJG05IdwnPY4LhXb
	 Sg1rJ57P+IjSYOD+59xzhGFfkDEAxB6uSkvrg6O401LIHpv5xXVVSYWUh4i/jeu/1L
	 QRn3xAd9uRmcjctCa4AP9teXDylbW4bJZ+8CBhpenzEnFhumXwxQYgb112CtKgcnKo
	 HzTDlknjRg1zg==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 12:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119044

From: Jef Driesen <jefdriesen@telenet.be>

When building an SDK with lcov included, gcov isn't included in the SDK
by default. Running lcov to generate coverage fails, because it tries to
use the gcov binary from the host system instead and that cause problems
if the gcc versions do not match.

Signed-off-by: Jef Driesen <jefdriesen@telenet.be>
---
 meta-oe/recipes-support/lcov/lcov_1.16.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.16.bb b/meta-oe/recipes-support/lcov/lcov_1.16.bb
index a889b3fa82..0d19d50077 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.16.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
@@ -50,6 +50,12 @@ RDEPENDS:${PN}:append:class-target = " \
     gcov \
     gcov-symlinks \
 "
+
+RDEPENDS:${PN}:append:class-nativesdk = " \
+    nativesdk-gcov \
+    nativesdk-gcov-symlinks \
+"
+
 SRC_URI = "https://github.com/linux-test-project/lcov/releases/download/v${PV}/lcov-${PV}.tar.gz"
 SRC_URI[sha256sum] = "987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c2ba5224995668e3240b"
 
-- 
2.43.0


