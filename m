Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873DCC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 16:12:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web08.12907.1661357532355795737
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: jlu@pengutronix.de)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oQszC-0004Vt-4h; Wed, 24 Aug 2022 18:12:10 +0200
Received: from jlu by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1oQszB-0004Yq-42; Wed, 24 Aug 2022 18:12:09 +0200
From: Jan Luebbe <jlu@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: [meta-networking][PATCH] chrony: add support for config and source
 snippet includes
Date: Wed, 24 Aug 2022 18:11:54 +0200
Message-Id: <20220824161153.17451-1-jlu@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 16:12:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98420

This makes it simpler to set specific config options or custom sources
by adding snippet files to /etc/chrony/conf.d/ or /etc/chrony/sources.d/
instead of modifying a copy of the full configuration file. As new
snippets can be added from separate recipes, targeted changes can be
done in multiple layers.

These specific directories are also used in Debian's default
configuration. It is not an error if they are missing.

Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
---
 meta-networking/recipes-support/chrony/chrony/chrony.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-support/chrony/chrony/chrony.conf b/meta-networking/recipes-support/chrony/chrony/chrony.conf
index 8d226d31a5e5..d11e2d406925 100644
--- a/meta-networking/recipes-support/chrony/chrony/chrony.conf
+++ b/meta-networking/recipes-support/chrony/chrony/chrony.conf
@@ -1,3 +1,6 @@
+# Load config files matching the /etc/chrony/conf.d/*.conf pattern.
+confdir /etc/chrony/conf.d
+
 # Use public NTP servers from the pool.ntp.org project.
 # Please consider joining the pool project if possible by running your own
 # server(s).
@@ -17,6 +20,10 @@ pool 0.openembedded.pool.ntp.org iburst
 #		gpios = <&ps7_gpio_0 56 0>;
 #	};
 
+# Load source files matching the /etc/chrony/sources.d/*.sources pattern.
+# These can be reloaded using 'chronyc reload sources'.
+sourcedir /etc/chrony/sources.d
+
 # In first three updates step the system clock instead of slew
 # if the adjustment is larger than 1 second.
 makestep 1.0 3
-- 
2.20.1


