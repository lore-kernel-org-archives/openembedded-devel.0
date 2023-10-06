Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ED8E94127
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:06:59 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.5550.1696626409155319475
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=poXOY4p1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20231006210646c09c6ccacf00975d64-s5ku9i@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20231006210646c09c6ccacf00975d64
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Oct 2023 23:06:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=llqaKOYLhvlPo5FvwhBHJs3dE8V98XARj9SDUicDc7E=;
 b=poXOY4p1YQrCTtMDr44R335IsgkuatOnERE+oqqUkoX1I3LrYpFHPoT5jiIXp1YkHir4Aw
 Ai+KM9JD1XwufBYt3shz8MmZX7/hTWe5cFz9+wVENgWlV+MU2vwBdckHU+2A4iCw0JUYRty8
 7hiASikNwAkTHHMUmxrxMNHV/rrgU=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH 2/5] mosquitto: do not automatically depend on dlt-daemon, it's a non-mandatory logging system
Date: Fri,  6 Oct 2023 23:05:04 +0200
Message-Id: <20231006210507.556767-3-peter.marko@siemens.com>
In-Reply-To: <20231006210507.556767-1-peter.marko@siemens.com>
References: <20231006210507.556767-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 21:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105378

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-connectivity/mosquitto/mosquitto_2.0.15.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
index d06dd2d9ca..eea672a706 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
@@ -23,7 +23,7 @@ SRC_URI[sha256sum] = "4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-PACKAGECONFIG ??= "ssl dlt websockets \
+PACKAGECONFIG ??= "ssl websockets \
                   ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
                   "
 
-- 
2.30.2


