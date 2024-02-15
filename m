Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E26C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 19:32:22 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.1647.1708025531713863607
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Feb 2024 11:32:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gztRWHx2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20240215193207438017bd026e0ff2de-udmewl@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20240215193207438017bd026e0ff2de
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 15 Feb 2024 20:32:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=schoDBMA9D6H1HFvyLArKCJGRRLy3EdHr2S3Tzb0ihY=;
 b=gztRWHx2bQYXbwN6TcQ/22w/TSKnASWy3yEsz5nk+bVjJ3EnlFEi9c6gpa6TRE++z1K7YL
 2kfG0EhQFK2jy4VrU1wVFwMRUjfpX/J0x7e/BMkIrz9ptzqjKHX1hvEL3W3CQE6aVFB2z5Zq
 6ACdkDnEKm7xLpqqalQIqRGQyVCRw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2] libqmi: correct PV
Date: Thu, 15 Feb 2024 20:31:20 +0100
Message-Id: <20240215193120.10591-1-peter.marko@siemens.com>
In-Reply-To: <20240124201338.19123-1-peter.marko@siemens.com>
References: <20240124201338.19123-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Feb 2024 19:32:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108760

From: Peter Marko <peter.marko@siemens.com>

Real tag is 1.35.2-dev with description "Unstable release 1.35.2-dev".
https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/tags/1.35.2-dev

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libqmi/{libqmi_1.35.2.bb => libqmi_1.35.2-dev.bb}             | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.35.2.bb => libqmi_1.35.2-dev.bb} (100%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2-dev.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.35.2-dev.bb
-- 
2.30.2


