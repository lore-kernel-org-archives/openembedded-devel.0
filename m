Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64A2C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 20:14:40 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.33746.1706127270762951355
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jan 2024 12:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GOmswoPF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2024012420142707ca9d68b8c64a9a97-e3ykua@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2024012420142707ca9d68b8c64a9a97
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 24 Jan 2024 21:14:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rUKulvYXekta9rA7/xpee/7+b0y/HSn1PDjEB69todk=;
 b=GOmswoPFH4HyZ7vL1SJry2DhoOhtiqxLI+YbtYUI+dfbO0pXMvR9hpXGoO0gFw2HN2rgyJ
 /HCWrIV5R2ZuQOl3drRvoO1wNoYd9GsJNQrG/gW+OAHYxiGQXPtb1gKB+jxVAeUUFBOFokGz
 t3uYJiPtGu4W+dnFCaT2pHPGYXJyo=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] libqmi: correct PV
Date: Wed, 24 Jan 2024 21:13:38 +0100
Message-Id: <20240124201338.19123-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 20:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108451

From: Peter Marko <peter.marko@siemens.com>

Real tag is 1.35.1-dev with description "Unstable release 1.35.1-dev".
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/tags/1.35.1-dev

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libqmi/{libqmi_1.35.1.bb => libqmi_1.35.1-dev.bb}             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.35.1.bb => libqmi_1.35.1-dev.bb} (100%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1-dev.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.35.1-dev.bb
-- 
2.30.2


