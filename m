Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA05EFCD8B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:06:44 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10759.1773050801426177745
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=SkJ6KrCV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1334352-20260309100639976e7491850002071c-f0akbm@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260309100639976e7491850002071c
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 09 Mar 2026 11:06:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1cG5HaFABY1ln+OnJxmkKZX+RgmSwJEecU+bwBWWpQs=;
 b=SkJ6KrCVUB56p9RficIx0ZpivQDLUt/HYeaOekZvsLWHQ7eF9BomfD+AizqvuQJ07/L46S
 v/7FjIM4oHiJ7H6xEee8usVgXCy2r7M1U2sOb7A4Gj+IdUmIN2Fs1x4EvCNNB1OLB8lvYx3E
 3s0R0u9Ma0AEksPqvK8UkQioIYGfJT/IzWRvPAzhDl3s1RRb5JQrquNdRf6fSLwLhjE8lHUz
 PoWAAtXhAJc9iipQnC+rwg5ePMndvxaDyhUZF4Q4WZsy6ZVdRaLhbFYyhNXXrgcSxPnZbvK7
 428fvT4e4CqCY5ndmBMWYawkOlJ23Art2Dpe5ajWyVLHURsxEhPhb7GQ==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 08/14] paho-mqtt-c: upgrade 1.3.15 -> 1.3.16
Date: Mon,  9 Mar 2026 11:06:24 +0100
Message-ID: <20260309100630.404637-8-andrej.kozemcak@siemens.com>
In-Reply-To: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
References: <20260309100630.404637-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124981

Changelog:
  https://github.com/eclipse-paho/paho.mqtt.c/releases/tag/v1.3.16

Changes:
- Bumped minimum CMake to v3.12
- Consolidated "Event" thread signaling object.
- Reduce latency on connect #1430
- Fixed warning in Window build for TCP_NODELAY
- Added a .clang-format file and bash script to run it

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../{paho-mqtt-c_1.3.15.bb => paho-mqtt-c_1.3.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.15.bb => paho-mqtt-c_1.3.16.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.15.bb b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.16.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.15.bb
rename to meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.16.bb
index 64b9de3848..a3ef667db7 100644
--- a/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.15.bb
+++ b/meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c_1.3.16.bb
@@ -14,7 +14,7 @@ SRC_URI = " \
     git://github.com/eclipse/paho.mqtt.c;protocol=https;branch=master;tag=v${PV} \
 "
 
-SRCREV = "62782406bcf511ee8e22bc34e826f8c6b8254c7c"
+SRCREV = "4a939ddb01eea581a32fd6f0adcfee51b91d2601"
 
 DEPENDS = "openssl"
 
-- 
2.47.3


