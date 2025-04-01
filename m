Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34949C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 19:24:25 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.2483.1743535462097267149
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 12:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ErF/phX7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2025040119241899ee9130bf525d911a-pcgd7o@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025040119241899ee9130bf525d911a
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 01 Apr 2025 21:24:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UFEH5U6mvYU048+52TAEeXDMcw0eqo3VHwrbjecdvSo=;
 b=ErF/phX7LZN112t7+bhmIxpI49X6A29l+bWuixCdpeRt94uZJBSztd8g9GPjRmeB5MU5l8
 jUWDYCHVisAILrp/sfW0pBT1VTDU+a9PWL3k6/gUG9MbQLDHChnFKtGT+SgkMbLQYED/Pl20
 STewXWTknu1bJp5UfuXUJz1B38xW6KI54QhlmtokQCD5rAheYkx/s/XiPi/QRGkDdIWRDwuU
 qs3nFCaVbjYtdVIoXk51a4WLFo+IGc9HgDKyG8JnjDnz7E2qK+upBGHALBH4dsasygQp38GY
 wAG34SkyGL3DzUcGCbehC0zEstJds5jHrLnfMgBbQUEyOslKI0Ampuww==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-gnome][PATCH] gimp: ignore CVE-2007-3741
Date: Tue,  1 Apr 2025 21:23:25 +0200
Message-Id: <20250401192325.11656-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 19:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116488

From: Peter Marko <peter.marko@siemens.com>

Restore CVE_STATUS statement from recipe version 2.10.38.
This was dropped on upgrade to 3.0.2, however NVD still tracks this CVE
as version-less, so explicit ignore is needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
index f56c12c89b..3c83b2ee3a 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
@@ -132,3 +132,5 @@ do_install:prepend() {
 FILES:${PN} += "${datadir}/metainfo"
 
 RDEPENDS:${PN} = "mypaint-brushes-1.0 glib-networking python3-pygobject"
+
+CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"

