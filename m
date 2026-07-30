Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7700C55162
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:26:34 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8428.1785407187738876276
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 03:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dWuqArak;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202607301026247e354a0d6a00020709-ms4k2i@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202607301026247e354a0d6a00020709
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 30 Jul 2026 12:26:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ISlqM4BsJJxSPgLHuBfu8CTuVMXZvwA2aLRPI0Ptwb4=;
 b=dWuqArakQMfozicFFCZRP5JVkI0WBeOrLmkghxecCdXLLQ3IO59mDDIfl9nkX+XQ9DNEe7
 FvU2R0CTPkMRBoWPiFh1rCl5C8ER4kQcA4EqTbWo8+RgroBFNHWDCkUvqI5AVLHIoswKEo36
 p6HsmYEo9P9Ib4hDhvioSM39dP7Szy1E2Au8eRSc95CUrk5hV2EjSeGGrzKuGdTRZEcGju6q
 pkoyxWzmxG+FHDZ7uVZM6QlFWnHVOTMPJsApS6QXxcvMpcEb59rKBLhLC0KxXm+hQiQpOHgR
 Gu7vUjKPT36iuMKp2e8zbzH72eXaXskzAs1t7RagllreX/ZHRGXf7Htw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] sdbus-c++-libsystemd: add .git to github repository url
Date: Thu, 30 Jul 2026 12:26:15 +0200
Message-ID: <20260730102615.16878-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 10:26:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128568

From: Peter Marko <peter.marko@siemens.com>

This will align it to oe-core systemd recipe.
Download mirror will contain only one repository copy, not two.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.5.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.5.bb
index 63a7bc7c27..bfefcbc4b3 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.5.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_259.5.bb
@@ -12,7 +12,7 @@ DEPENDS += "gperf-native gettext-native util-linux libcap util-linux python3-jin
 
 SRCREV = "b3d8fc43e9cb531d958c17ef2cd93b374bc14e8a"
 SRCBRANCH = "v259-stable"
-SRC_URI = "git://github.com/systemd/systemd;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
+SRC_URI = "git://github.com/systemd/systemd.git;protocol=https;branch=${SRCBRANCH};tag=v${PV} \
            file://static-libsystemd-pkgconfig.patch \
            "
 

