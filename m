Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DA0E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:37:43 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.154471.1734709053953222383
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:37:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Xrca0Hn3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241220153731b33e22069866c12544-gdnutd@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241220153731b33e22069866c12544
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=DaYr260gBpH1W5npnM6ggGtJZz4gCmnmctvqxHhS/KY=;
 b=Xrca0Hn3i4PH457xYOvs9aDnhNjSXEYm2FUNA4v3cJQAyyWCusDj8CjnWbJnKrR2OwyA7H
 gEtmqnXqy1FHo8u/Eq5dL/Sd1t0B67Ouyx7RpPuB18YHgz3so4cR3iHdhIWYSdm7vKyw2CHX
 JFPg/YTrYDKzafdSRDY4lTlG/qKKrkHwDLm8VfoV/SSfTQMe+es8fEGqwWExRpEzIIX2zEGK
 x+6N3Tp8ll97TOEP+Db4WIdYvzOGOG72yJwEFvTTC7NkxOUawhAduvyREimKSVToJUuSxTgu
 e1oDszFsimYOdiO9JsoloBu70qvJH37q5SkD4gu2Kwzc9+on+r6MOTiQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 02/11] opensc: mark CVE-2024-8443 as fixed
Date: Fri, 20 Dec 2024 16:36:20 +0100
Message-Id: <20241220153629.2499631-3-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114438

From: Peter Marko <peter.marko@siemens.com>

NVD tracks this CVE as version-less.
Per [1] this is fixed by following commits:

$ git tag --contains b28a3cef416fcfb92fbb9ea7fd3c71df52c6c9fc
0.26.0
0.26.0-rc1
$ git tag --contains 02e847458369c08421fd2d5e9a16a5f272c2de9e
0.26.0
0.26.0-rc1

[1] https://github.com/OpenSC/OpenSC/wiki/CVE-2024-8443

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/opensc/opensc_0.26.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.26.0.bb b/meta-oe/recipes-support/opensc/opensc_0.26.0.bb
index 3e4d476ff4..bd44e24aeb 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.26.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.26.0.bb
@@ -14,6 +14,8 @@ DEPENDS = "openssl"
 SRCREV = "fe857cc4c68da4873071f168c9aaf9860040ff4e"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https"
 
+CVE_STATUS[CVE-2024-8443] = "fixed-version: this is fixed since 0.26.0"
+
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig bash-completion
-- 
2.30.2


