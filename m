Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D669BE94124
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:06:59 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.5567.1696626408967656169
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lWwx5PmW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20231006210646dd67aa93fe5e5a61e1-wlxqxv@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20231006210646dd67aa93fe5e5a61e1
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Oct 2023 23:06:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mMC2BgXx0DZCYVqmgMXb5OzuKo64ZEtdPFqihwnSAhw=;
 b=lWwx5PmW+Z6aYlFwSelTjE1xyOy0QSPZ1Ae3BtutSg0fjS+6W2FLwfcp25oOdJVLQaRR5N
 y4OTBiUQpK6fX+qebaaeTFkj6DDP76WcitKftQVihPRm+fsBP9scTr3T+HBf9V8CodSKINEv
 0uW8XlTmjGKmZQIFcE3iIBFf3vnvE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH 3/5] mosquitto: upgrade 2.0.15 -> 2.0.17
Date: Fri,  6 Oct 2023 23:05:05 +0200
Message-Id: <20231006210507.556767-4-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105376

From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>

Fix for CVE-2023-28366, CVE-2023-0809, CVE-2023-3592

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../mosquitto/files/mosquitto.init            | 20 +++++++++----------
 ...osquitto_2.0.15.bb => mosquitto_2.0.17.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.15.bb => mosquitto_2.0.17.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
index 9d5963c418..d0da219d6d 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
+++ b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
@@ -1,18 +1,18 @@
-#! /bin/sh
+#!/bin/sh
 
 # Based on the Debian initscript for mosquitto
 
 ### BEGIN INIT INFO
-# Provides:         mosquitto
-# Required-Start:   $remote_fs $syslog
-# Required-Stop:    $remote_fs $syslog
-# Default-Start:    2 3 4 5
-# Default-Stop:     0 1 6
-# Short-Description:    mosquitto MQTT message broker
-# Description: 
-#  This is a message broker that supports version 3.1/3.1.1 of the MQ Telemetry
+# Provides:       mosquitto
+# Required-Start: $remote_fs $syslog
+# Required-Stop:  $remote_fs $syslog
+# Default-Start:  2 3 4 5
+# Default-Stop:   0 1 6
+# Short-Description: mosquitto MQTT 3.1/3.1.1 message broker
+# Description:
+#  This is a message broker that supports version 3.1 of the MQ Telemetry
 #  Transport (MQTT) protocol.
-#  
+#
 #  MQTT provides a method of carrying out messaging using a publish/subscribe
 #  model. It is lightweight, both in terms of bandwidth usage and ease of
 #  implementation. This makes it particularly useful at the edge of the network
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb
index eea672a706..690b6bc126 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.17.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[sha256sum] = "4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27039ac6"
+SRC_URI[sha256sum] = "3be7a911236567c1a9fbe25baf3e3167004ba4a0c151a448ef1f7fc077dba52f"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.30.2


