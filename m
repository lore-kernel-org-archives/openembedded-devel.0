Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A78DE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:58:00 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.10953.1735297075360169928
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:57:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RaErpGsD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202412271057535fe08eb89e37509629-ga61zv@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202412271057535fe08eb89e37509629
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:57:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=roaPX3lXbIM6olN99quXiZVeFuNx4TBdXspT0iyNXUM=;
 b=RaErpGsDbMhmi6TmoLoc1XuVowFFOdbTm2PPxzPFbV1omg25Ah+08UPxmKkv0FH25SNqCH
 nuvjV6rrMlN+j7GnlALGYHZKVi+gkxjNlvdYGZLPatKVwPI7RZnBnFTdzBPiQLo8rXKSHIZZ
 f5v7op2VbD+82sk5LVVuxolEuQIYkHPNi2zSMu+xrnJPmC/dUT+SQ/ybVScvFVGvHr4ITbUC
 CPKUZPCnbTOT9HYN8klV2Bv20QCSMnYORNrwz1TFJ49AqLkiJ5AWcoWT+jXCywCn2j8NVdOp
 Z1kenvS6owE1+JO7ge/i3koLTfUnZVYRKZNHWpVH48JcFiA0E2kBCD3w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 07/15] imagemagick: upgrade 7.1.1-26 -> 7.1.1-43
Date: Fri, 27 Dec 2024 11:56:07 +0100
Message-Id: <20241227105615.3303193-8-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114565

From: Peter Marko <peter.marko@siemens.com>

This fixes at least CVE-2024-41817 (in 7.1.1-36).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{imagemagick_7.1.1-26.bb => imagemagick_7.1.1-43.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.1-26.bb => imagemagick_7.1.1-43.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-26.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-26.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index 78cbb9ddea..f692370de0 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-26.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -13,7 +13,7 @@ BASE_PV = "${@d.getVar('PV').split('-')[0]}"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
 
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
-SRCREV = "570a9a048bb0e3a5c221ca87be9408ae35f711e2"
+SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


