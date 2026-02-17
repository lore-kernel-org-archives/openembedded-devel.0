Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59578E909C1
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 15:01:57 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14053.1771340505336356466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Feb 2026 07:01:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=hMMB9ref;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026021715014657396219f500020781-_jab_m@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026021715014657396219f500020781
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 17 Feb 2026 16:01:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=UzvqykNirwXohRomXUkw+zUfq+SJzCI9vrauII2GD+A=;
 b=hMMB9ref9hAa7Kl9cw6V5CFMZKwXODiV8+vc3ialBq3rrE8FbkExQsc1cqWKc2o6te8+9S
 felCfFHMcXWZWCcZs8uzslwD4tITTyNfh9qECKI6yINILdfqrcmTZtuLSHRzE2wNqQ3pBqKX
 Y0vt4pctRdQw8HvPvFLVp6O9ke9FtEhxxj/ZgKiRZ4avHlffAriyCJ5Qu9BB36NqxlXr2LAe
 BKs6HdzCpf2/ExY9pI8VC2A3b/++k0s6HPQ+vzLgfi9fEXmvxhPs6JGkRcyX57mCk7Mt4GD+
 9bJHUNihXy3epYNjg0NSRWbDdfHrzYcTE1c5snlyZGNvhdOmqZ1X+c+g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 2/3] bridge-utils: update link to homepage
Date: Tue, 17 Feb 2026 16:01:36 +0100
Message-Id: <20260217150137.30232-2-peter.marko@siemens.com>
In-Reply-To: <20260217150137.30232-1-peter.marko@siemens.com>
References: <20260217150137.30232-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Feb 2026 15:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124457

From: Peter Marko <peter.marko@siemens.com>

The old link does not work anymore.
New page found based on other linuxfoundation.org link redirects.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-support/bridge-utils/bridge-utils_1.7.1.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
index 59e3dbae5f..ddb243105a 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.7.1.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Tools for ethernet bridging"
-HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge"
+HOMEPAGE = "https://wiki.linuxfoundation.org/networking/bridge"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
 

