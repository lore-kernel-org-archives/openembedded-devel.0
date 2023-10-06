Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A84E94116
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:06:59 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.5568.1696626409166781659
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=kZYcJ+Wn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202310062106469580150a3b0a751ceb-1lbbep@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202310062106469580150a3b0a751ceb
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Oct 2023 23:06:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=txyBouSLU5JFKF0y68/yaJxqpUkzhZgEZwD4tcsH604=;
 b=kZYcJ+Wnoda0v7kHWvZ6K4fTlgQnVsF7VSS8HR2LaAJ96XM3t69DdsZwfhZ+0fJwfFHEC/
 SBscvs3bgHzqaeXUXt3a089c+h9+535Fwsz5LEz7Cu10fomEmFya9mQ36zGX82frZv+q5f3c
 BC7D+dIMXKl8UeGtdigRCcesoob3w=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH 1/5] mosquitto: upgrade 2.0.14 -> 2.0.15
Date: Fri,  6 Oct 2023 23:05:03 +0200
Message-Id: <20231006210507.556767-2-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105374

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../mosquitto/{mosquitto_2.0.14.bb => mosquitto_2.0.15.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.14.bb => mosquitto_2.0.15.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.14.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.14.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
index 739b7de625..d06dd2d9ca 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.14.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.15.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://1571.patch \
 "
 
-SRC_URI[sha256sum] = "d0dde8fdb12caf6e2426b4f28081919a2fce3448773bdb8af0d3cd5fe5776925"
+SRC_URI[sha256sum] = "4735b1d32e3f91c7a8896741d88a3022e89730a1ee897946decfa0df27039ac6"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.30.2


