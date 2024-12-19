Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8E3E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 11:34:33 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.127446.1734608064171930301
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 03:34:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jnaqRCfA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241219113421ed844299dc6dd88af8-wklcim@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241219113421ed844299dc6dd88af8
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 12:34:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2BEW2v1TyH1KQplkSICZhmnLcC5glK37lzK4RCHwRKA=;
 b=jnaqRCfAnie3lPAT0ow6uDKBxkbU7R1Zjgxi5izuSofA6n2YM8hirCi0fnDpIe8szC75Wn
 TiAAwo9aVxKaxivLH1HUFD+QKICKbchbH6cVnWdPnYT/dni15EgfKvWp5HKko9aXC6BbwJSH
 S+VQcUQwmM8x2ew8jM7hIWSupfFjhmHm4MhFxfvm+j357N177i5B1hK3XYniQh7PDNpN76rp
 ByDTmg4wVHF4XECJkWsPuQCXiMWTwua7BSTzMSeAAb1/fe0rYa59d5D39C+QiAIy1rYInXlR
 bzUe6CL4vybVeoGlH6SeIyke7e8UZx+93AzBxHeeX44TVkv9OJhoIgIg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH 2/2] mosquitto: upgrade 2.0.19 -> 2.0.20
Date: Thu, 19 Dec 2024 12:31:47 +0100
Message-Id: <20241219113147.336484-2-peter.marko@siemens.com>
In-Reply-To: <20241219113147.336484-1-peter.marko@siemens.com>
References: <20241219113147.336484-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 11:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114396

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Broker:
- Fix QoS 1 / QoS 2 publish incorrectly returning "no subscribers".
  Closes #3128.
- Open files with appropriate access on Windows.
- Don't allow invalid response topic values.
- Fix some strict protocol compliance issues.

Client library:
- Fix cmake build on OS X.

Build:
- Fix build on NetBSD

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../mosquitto/{mosquitto_2.0.19.bb => mosquitto_2.0.20.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.19.bb => mosquitto_2.0.20.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
index c6ce2e095e..2bc1303185 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.19.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.20.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://2895.patch \
 "
 
-SRC_URI[sha256sum] = "33af3637f119a61c509c01d2f8f6cc3d8be76f49e850132f2860af142abf82a9"
+SRC_URI[sha256sum] = "ebd07d89d2a446a7f74100ad51272e4a8bf300b61634a7812e19f068f2759de8"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
-- 
2.30.2


