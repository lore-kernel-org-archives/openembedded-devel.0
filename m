Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D7FC54FD2
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:26:44 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8514.1785407199764142155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 03:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=D2y4WYfZ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026073010263705fc42f8f8000207fe-eoq5h1@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026073010263705fc42f8f8000207fe
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 30 Jul 2026 12:26:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ISlqM4BsJJxSPgLHuBfu8CTuVMXZvwA2aLRPI0Ptwb4=;
 b=D2y4WYfZd2rAuQlrtL3MXJSZoZzCdqN24vhOn8zySmdhMvAjOfDFhCPOloG1kZKHrIpk/J
 b3OAKio713Jzjjn7dVZE+B28TAcBNgD3vYpsFcv84H0uROxIr2+5/LYm9qfTUcBi9G7S3dFg
 CmD+S4aWS+GMwbgmxSUL/iZXD4oT9kkPSaVqM+gRZSPsEtzhSL7nDCBuA5LW3aHZ8E45ZqlU
 RvazgR+0NQ5mxYPTDt1uX0w0irF5R9FwM4RLRzng6LlgNjKjZD03OLW6j0rTfoNTMwKf9nSb
 ct5QYv17RgAL7mmFeSdQVIrcSeMDkvwcSPD6WM+6hoBTAltL/SHZanCw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH] sdbus-c++-libsystemd: add .git to github repository url
Date: Thu, 30 Jul 2026 12:26:28 +0200
Message-ID: <20260730102628.16898-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 10:26:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128569

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
 

