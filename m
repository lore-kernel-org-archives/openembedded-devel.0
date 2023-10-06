Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7212E94120
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 21:06:59 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.5551.1696626409155486620
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Oct 2023 14:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=U7C6+ep5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202310062106463a5b9aa72e857af3a6-o4aqpn@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202310062106463a5b9aa72e857af3a6
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 06 Oct 2023 23:06:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2gR7RYePcTnU6lJ0J4qhZeLWWxhS4vzbGGbalttH3aw=;
 b=U7C6+ep5DX1dsZtcyIDMXGdHVdM/X7GWc2/EsgkAf1MNlqAmWAzCWZWwULR4Q4EJX2f6u6
 yUGqG5INzZml/Qhpxwi3Yn+wSdi6ndSh1F3dHf757tQbPXg2lDT3OIN6yjYftdEtjN8HWYdy
 Fdl1KYRwASDxVlrTJS/cVNpK+EOno=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH 5/5] mosquitto: add missing Upstream-Status
Date: Fri,  6 Oct 2023 23:05:07 +0200
Message-Id: <20231006210507.556767-6-peter.marko@siemens.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105375

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 2 ++
 meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
index 3275e57e38..7374cbd26f 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websockets library if needed see:
 
 Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and  Daniel Engberg <daniel.engberg.lists@pyret.net>
 ---
+Upstream-Status: Pending
+
  src/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
index a9e9c97b83..853f881754 100644
--- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
+++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-online when starting
 
 See: https://github.com/eclipse/mosquitto/issues/2878
 ---
+Upstream-Status: Pending
+
  service/systemd/mosquitto.service.simple | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-- 
2.30.2


