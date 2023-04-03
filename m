Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB370C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 12:26:24 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.68657.1680524781576993610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 05:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pjJGM-0004Hc-V9; Mon, 03 Apr 2023 14:26:19 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pjJGM-008gJ5-AV; Mon, 03 Apr 2023 14:26:18 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pjJGL-00Aoeo-Dn; Mon, 03 Apr 2023 14:26:17 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-oe][PATCH] jwt-cpp: enable usage in an SDK
Date: Mon,  3 Apr 2023 14:26:15 +0200
Message-Id: <20230403122615.2577996-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 12:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101938

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
index 8929115fd78f..2e06b701cc44 100644
--- a/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
+++ b/meta-oe/recipes-devtools/jwt-cpp/jwt-cpp_0.6.0.bb
@@ -16,3 +16,5 @@ DEPENDS = "openssl"
 inherit cmake
 
 EXTRA_OECMAKE += "-DJWT_BUILD_EXAMPLES=OFF -DJWT_CMAKE_FILES_INSTALL_DIR=${libdir}/cmake"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.39.2


