Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51DDC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 14:18:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.7021.1704721854983494085
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jonqw3lB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5826D24000A;
	Mon,  8 Jan 2024 13:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704721852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8bFCnrqWETv00IntrZGDy56VItbmNOw2RB5NSRPrUTg=;
	b=Jonqw3lBWZICeHUakSTOYBI5XO0fnuAkA5siRszzk8ima0u3fwr2ZlLrZCElMZA+SxW9st
	NqDyT66t2PClEJsljPzlgC39dTvH28VenIOFoy0eJ/6zAIsLBDV3SYJx6hAxMQ1bBa+4eD
	Qxc4HGxioVuuKWfirKNd/jbEJdlOKtIIA/OZK5IpaAZ2wzWh0BKXRyAV3OY9nswJE906t6
	gVhMZENVOGYHP/sqUjqOz45V1AakK6e6tZNaS8/bSTfrEOCCc5bFqGA5vPCmOgVTvznyss
	nEEfW/t/xfYQELAbYqAY8XkNwWZacrPTW1ICaks7PxlxINHP/Z3bV+DmRtGaMg==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	thomas.petazzoni@bootlin.com,
	alexandre.belloni@bootlin.com,
	Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Subject: [meta-oe][PATCH v1] iwd: upgrade 2.8 -> 2.9
Date: Mon,  8 Jan 2024 14:50:18 +0100
Message-ID: <20240108135018.2967504-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-GND-Sasl: joaomarcos.costa@bootlin.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 14:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108168

Tested in station and access point modes, running on a iMX93 evaluation
kit with U-Blox's Jody-W3 wireless module.

ver 2.9:
	Fix issue with handling certain FT failures.
	Fix issue with handling user-disabled bands.
	Fix issue with handling roam on beacon loss event.
	Add support for PKEX configurator.
	Add support for PKEX enrollee.

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta-oe/recipes-connectivity/iwd/{iwd_2.8.bb => iwd_2.9.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/iwd/{iwd_2.8.bb => iwd_2.9.bb} (88%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb b/meta-oe/recipes-connectivity/iwd/iwd_2.9.bb
similarity index 88%
rename from meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_2.9.bb
index ee310d295..82a294909 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_2.8.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_2.9.bb
@@ -5,10 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
 DEPENDS = "ell"
 
-SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz \
-           file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-e.patch \
-           "
-SRC_URI[sha256sum] = "a90e621f45b9c2f9021beea0fa6477ee0334fcd2ee34beaab42e31ea0fd3be29"
+SRC_URI = "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.xz"
+SRC_URI[sha256sum] = "ec02ae5750e47204f4b91791cbab7cde670e3035f884f4143f6d00f400089d4c"
 
 inherit autotools manpages pkgconfig python3native systemd
 
-- 
2.43.0


