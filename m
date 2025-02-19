Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDECC021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 17:50:15 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.29111.1739987407358159011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Feb 2025 09:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=KZs5RcNO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025021917500476063cbe7f32298c57-wfypid@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025021917500476063cbe7f32298c57
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 19 Feb 2025 18:50:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xQtzmD6Z74A1pkx7zQk3X3LP3JCZi0rwO71+39GOerw=;
 b=KZs5RcNOhuYSCOGweQiIg0ujO33orFs9P/2dxqcMIDbDXBMfIkNB4nYfs6dGtDbwdwlNBu
 62dIrmcgqpbgg2pjmp6PoyKLlqoSteztbb78j3ZH3VQ6qvx54khO8/L7zTpPuMyL/WZey+Nb
 LptCuEYXNSscqYwh7V1iMfPYnufxBdQMq2UzcwhbBYCSvTwDPYowGTnjjbLpN9qTbgORTCaA
 rC2lnqEMGD350qY/vZJKuasgogqktPwfp3X5wWALx5boegcQAGAUrjMbbXHuwyWiNCVa32TC
 IMjAHAm5In1g/3Ll/uCmShBqxjLUrpK0QTHvjMaGVLpYSlCNknto3rtw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] sassc,libsass: move recipes to oe-core
Date: Wed, 19 Feb 2025 18:49:17 +0100
Message-Id: <20250219174917.3487720-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Feb 2025 17:50:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115526

From: Peter Marko <peter.marko@siemens.com>

These recipes are now part of oe-core:
https://git.openembedded.org/openembedded-core/commit/?id=0a1d3607da7bb7c586c69cefadf8ade52c7b1987

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/sass/libsass_git.bb | 14 --------------
 meta-oe/recipes-support/sass/sassc_git.bb   | 16 ----------------
 2 files changed, 30 deletions(-)
 delete mode 100644 meta-oe/recipes-support/sass/libsass_git.bb
 delete mode 100644 meta-oe/recipes-support/sass/sassc_git.bb

diff --git a/meta-oe/recipes-support/sass/libsass_git.bb b/meta-oe/recipes-support/sass/libsass_git.bb
deleted file mode 100644
index f0824944b9..0000000000
--- a/meta-oe/recipes-support/sass/libsass_git.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "C/C++ port of the Sass CSS precompiler"
-HOMEPAGE = "http://sass-lang.com/libsass"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8f34396ca205f5e119ee77aae91fa27d"
-
-inherit autotools
-
-SRC_URI = "git://github.com/sass/libsass.git;branch=master;protocol=https"
-SRCREV = "7037f03fabeb2b18b5efa84403f5a6d7a990f460"
-PV = "3.6.6"
-
-S = "${WORKDIR}/git"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/sass/sassc_git.bb b/meta-oe/recipes-support/sass/sassc_git.bb
deleted file mode 100644
index 94d69642a7..0000000000
--- a/meta-oe/recipes-support/sass/sassc_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "libsass command line driver "
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2f8a76980411a3f1f1480b141ce06744"
-
-DEPENDS = "libsass"
-
-inherit autotools pkgconfig
-
-SRC_URI = "git://github.com/sass/sassc.git;branch=master;protocol=https"
-SRCREV = "66f0ef37e7f0ad3a65d2f481eff09d09408f42d0"
-S = "${WORKDIR}/git"
-PV = "3.6.2"
-
-CVE_STATUS[CVE-2022-43357] = "cpe-incorrect: this is CVE for libsass, not sassc wrapper"
-
-BBCLASSEXTEND = "native"

