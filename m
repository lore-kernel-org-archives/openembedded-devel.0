Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F31103E2E4
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 20:43:51 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6594.1773261820369970488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 13:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Vz0QlXlI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2026031120433600d93eb8630002072a-qawb7c@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2026031120433600d93eb8630002072a
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 11 Mar 2026 21:43:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OII09FUtIQq2EMarH5OY2k6J1YAlD++OETQDDrjHi0U=;
 b=Vz0QlXlIGwiwoDvCdFGy2n7rvofJ6qrKYSf20NpmLK+TzzlepveaR5so3N4eet1bA/Vj6L
 YXhA7iW3rVER+H7M3w2Y+rksTqXTifEGfoLaE2Gh+gg0F+e2T9mVCgobflYwCJcLaAuzCTGN
 rD30161hjQfF+vmWBY+xv29B3g8S9qrJSuKj3myc0V6qc2WmWA9VxzC3nzjeOHDcwmDUq9yc
 JWnVovI6wreeYHNAn/UBSjtoFQzE3Vm1Juq8odBlWkLsTRmTwARa5WspSxlkiOo5ZVmahJ7k
 O7ty0v6aTalOzWYijXUKS8yjO0b4+FJ/HJmNLwqra4QE8653N/mY5vqg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] libwebsockets: upgrade 4.5.2 -> 4.5.4
Date: Wed, 11 Mar 2026 21:43:35 +0100
Message-Id: <20260311204335.718416-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 20:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125091

From: Peter Marko <peter.marko@siemens.com>

Update to latest v4.5-stable patch level.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{libwebsockets_4.5.2.bb => libwebsockets_4.5.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.5.2.bb => libwebsockets_4.5.4.bb} (98%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.4.bb
similarity index 98%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.4.bb
index 35545aacee..416d0c11bc 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b5d391cc7929bcba238f9ba6805f7574"
 DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
-SRCREV = "85c6f7959fd40d8aaf7a50be3c9b75f08389a01c"
+SRCREV = "93adad56deb5d027eeb890ea86268d1d07fe204a"
 SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV}"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"

