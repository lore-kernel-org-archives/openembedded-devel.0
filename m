Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472D9C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:31:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.14625.1707492673462161651
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=HX6aM0xn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02A66FF802;
	Fri,  9 Feb 2024 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707492672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s1ZRGol7YCsARqASBgz+seU2HWil8ho0515+echslAY=;
	b=HX6aM0xntnImhxtkDeU28pkNlTyitC4QgBrEzMAWkLyeFAT8yjwv5wyaYBJEQXb5aDKig8
	giQ9Gy0ENbMX+VAdKv+h45PWtzapM8zISuv3Bzy0m97/p+HQFlBFgsJOyYtsHecLq7md+r
	/F9oCpRQBWXdvEdkEU7D8V0MggRY89GTjuOvAXVodXBujpyA43WwR6pZ+KymcNDQLQ0PTp
	yOQUslce4YDVCD73F/WMT/NYPyh9Fe5gyKYESaC8ICbXS7Eio1ydBTEv6G9ke7nJ2xoVXE
	WROhfisCRZuOm0M30gvBREh8Fjm8OwLvcGs222gm8fmo/CTa6u38OXo8sDBhug==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-multimedia][PATCH] dvb-apps: no longer skip ldflags QA
Date: Fri,  9 Feb 2024 16:30:54 +0100
Message-ID: <20240209153054.2750490-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 15:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108685

From: Thomas Perrot <thomas.perrot@bootlin.com>

Because there is no longer the error.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 .../recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb     | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
index 90a69e5e239a..542ad3487b35 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.20140321.bb
@@ -96,7 +96,4 @@ python populate_packages:prepend () {
     do_split_packages(d, dvb_libdir, r'^lib(.*)\.so\.*', 'lib%s', 'DVB %s library', extra_depends='', allow_links=True)
 }
 
-INSANE_SKIP:${PN} = "ldflags"
-INSANE_SKIP:${PN}-dev = "ldflags"
-
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.43.0


