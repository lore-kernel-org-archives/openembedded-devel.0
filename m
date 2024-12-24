Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B3CE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 12:45:33 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.32710.1735044327863199482
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 04:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FIGagQOO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202412241245268bf65653cd4d306ed4-olh_0l@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202412241245268bf65653cd4d306ed4
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Dec 2024 13:45:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=mFuzjFrZQ67llU4F2Jmlk+652oI2AAJowZmv2TBGrog=;
 b=FIGagQOOJk/qAXupG37rPNg7uguW8mZIqLdQW4imYyPws/dFNclLlaFhABNHri97BNWLGc
 t36Gq+0stWaVIPLji08ThypXJWQdgse7+DBmzBIOeoFMZSCH/1tLjopSF8jZDaEMMzjfCLte
 rh6r95OgoYFK0JA5KkBlYEE5XXd5rkyu6PeQrOiEZLvjwVGqqx877NWZFZRHSQMb0mWIUTiQ
 6BGGnXb1hlq0yFPZCEWJn6pePs78EW9GuyvlhXcVvZa3Cv0g+J7D0CWHZ64pw5pEk1pjZGPt
 RY+6qAfDRjYAbMBiYl4mPXpzS5FrzcG/KIEnMH55BcYs/n/Hi6F4+wzA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 3/6] rtmpdump: add +git to PV
Date: Tue, 24 Dec 2024 13:44:14 +0100
Message-Id: <20241224124417.2547005-4-peter.marko@siemens.com>
In-Reply-To: <20241224124417.2547005-1-peter.marko@siemens.com>
References: <20241224124417.2547005-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 12:45:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114544

From: Peter Marko <peter.marko@siemens.com>

We fetch newer hash than 2.4 version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
index 47d04af9c1..ba2e5195e9 100644
--- a/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
+++ b/meta-multimedia/recipes-multimedia/rtmpdump/rtmpdump_2.4.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "gnutls zlib"
 
+PV .= "+git"
 SRCREV = "fa8646daeb19dfd12c181f7d19de708d623704c0"
 SRC_URI = " \
     git://git.ffmpeg.org/rtmpdump;branch=master \
-- 
2.30.2


