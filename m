Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31209E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:58:10 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.11081.1735297080185700942
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=XYkbWjLk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241227105758c04f42d445c8937a51-ldeppr@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241227105758c04f42d445c8937a51
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:57:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=V/wkUVrqpPnGo0o9wRAg0KXfLzei1R7+pYahb0uXrpY=;
 b=XYkbWjLkWEokFPpcyx2YLIfdeSQefsg1Pg1cwhrU0mkDUo+0JdfjwgGfvc32H0gulPinAi
 pyoTlglGokbJSmmpnzE4pV3nakFbUob0U+TxDFM3GBajLnt4ju/VeMB3/6ZGcDf4wgolsThh
 PfWardjb7RpfLe+/WXxsmBvfAjtXISio8CL0YOHbkWyXmrJd+6NHzYh1BEp3G43SPZM8VupS
 9v7AsA5wbPKrRSJkzWeNFhsrr5s/YmPelZtNiTFamOA/igFSA65MN/2/qC2u6dI/dZmu72DY
 rTUJg5cIj2thV4p9OHCT4uxqudql1WMEmFcI72UxstxhikjBSL133Bbg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 08/15] imagemagick: mark CVE-2023-5341 as fixed
Date: Fri, 27 Dec 2024 11:56:08 +0100
Message-Id: <20241227105615.3303193-9-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114566

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed by
https://github.com/ImageMagick/ImageMagick/commit/aa673b2e4defc7cad5bec16c4fc8324f71e531f1
It is tracked as 'fixed in next version' - 7.1.2 (which does not exist)
in NVD DB.

.../tmp/work/core2-64-poky-linux/imagemagick/7.1.1-43/git$ git describe aa673b2e4defc7cad5bec16c4fc8324f71e531f1 --tags
7.1.1-18-4-gaa673b2e4d
.../tmp/work/core2-64-poky-linux/imagemagick/7.1.1-43/git$ git tag --contains aa673b2e4defc7cad5bec16c4fc8324f71e531f1 | head -n1
7.1.1-19

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index f692370de0..779bc1fd31 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -170,3 +170,4 @@ CVE_STATUS[CVE-2017-5506] = "cpe-incorrect: The current version (7.1.1) is not a
 CVE_STATUS[CVE-2017-5509] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
 CVE_STATUS[CVE-2017-5510] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-4"
 CVE_STATUS[CVE-2017-5511] = "cpe-incorrect: The current version (7.1.1) is not affected by the CVE which affects versions at least earlier than 7.0.4-3"
+CVE_STATUS[CVE-2023-5341] = "fixed-version: this is fixed in 7.1.1-19"
-- 
2.30.2


