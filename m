Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA42FC36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 23:15:05 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.8825.1742512502959136824
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 16:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=N1HeblOA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250320231501a204b952a891663f6b-bx3vjj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250320231501a204b952a891663f6b
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 21 Mar 2025 00:15:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4TJ0TajV2OY4OBkPqGmuB1GsPtoooOYKp3UlX3Cyvv4=;
 b=N1HeblOAJ1qeWiSQs4St6ZCIu4qRMIWphCbDZUg/ELGx/y5aEQZO3j2pjOJvxxdH9EALKV
 ZTCPqowzANRyt0/lq1tawVRYlz7+mw0Be8G0uvEIqZ7NxaPJaj3waNQPBAASGSb7qEgM/Ryx
 wWpCqBlVjEZXxVpGebm0vM15Eop9OlaFwediJ22gRScazr2iKsLsLmW98sGhXhc6dGiSML9U
 SByrjK41pntucV90ef2/he4S49evhO2aHvvLG3kp2TwvJi4Z+AJy4yTLyExRKYqDwJPovPn+
 aeLCN2iC6ZRAFdgu95UXdR0vlzDjUmBEhkPb0EjW8szDCjyrpwuTaYzg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/4] libmad: ignore CVE-2017-11552 and CVE-2018-7263
Date: Fri, 21 Mar 2025 00:14:03 +0100
Message-Id: <20250320231405.1693060-2-peter.marko@siemens.com>
In-Reply-To: <20250320231405.1693060-1-peter.marko@siemens.com>
References: <20250320231405.1693060-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 23:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116151

From: Peter Marko <peter.marko@siemens.com>

These CVEs are for mpg321, not libmad.
See Debian assessment:
* https://security-tracker.debian.org/tracker/CVE-2017-11552
* https://security-tracker.debian.org/tracker/CVE-2018-7263

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index d7cd38fcbc..2d63f9a804 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -36,3 +36,6 @@ do_configure:prepend () {
 }
 
 ARM_INSTRUCTION_SET = "arm"
+
+CVE_STATUS[CVE-2017-11552] = "cpe-incorrect: this CVE is for mpg321, not libmad"
+CVE_STATUS[CVE-2018-7263] = "cpe-incorrect: this CVE is for mpg321, not libmad"

