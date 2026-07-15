Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99EFC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 21:53:08 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2036.1784152380693721225
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 14:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=i2yARgwF;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260715215257c5fce3eb920002070d-siy3hs@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260715215257c5fce3eb920002070d
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 15 Jul 2026 23:52:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Qy0xwZo1D5C1hxkjE1ShU9/y2BCgNRL/YqZJZtI2fQ4=;
 b=i2yARgwFak68n4Nz1KS4z6F+D8fVj4UQkZeVgEzs3LY+CWktYneii7lHaUdDCRVd6U9qSS
 cKsH7R6VLet8BvPKLuXVIHE7XwMQKCBuN5VPzila+/oka4j/9JphZWRnkqjw05S4yl2I/gGn
 2H97mM57leZR1ib4XY+yTB/AKb7lFYkqaCS+7ZGGA2ZQveEnRoJf/AaUqPKIptJQlUuUfO60
 KEqklozLr/fmfZeDMzSklY/0un2PLklhjnn1tTgtEATZfY+URmTk0muICU5fiaBwVqg7x/GR
 GuQGEoeB1On1cQ/Ge7SmB+FNHvGJSWUuSpbFmnhDuCfE5ydXl7n082mQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] bdftopcf: remove dependency on libxfont
Date: Wed, 15 Jul 2026 23:52:21 +0200
Message-ID: <20260715215221.366879-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 21:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128227

From: Peter Marko <peter.marko@siemens.com>

The recipe builds fine without it.
Commits [1] and [2] imported some of its headers in v1.1 so the
dependency became obsolete.

[1] https://cgit.freedesktop.org/xorg/app/bdftopcf/commit/?id=102696da8737fcb324034f673cd5815f28923311
[2] https://cgit.freedesktop.org/xorg/app/bdftopcf/commit/?id=140f7f6e071a239329d700aa24191a664be2bea2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
index 53e09fd868..2e6defe467 100644
--- a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
+++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.1.bb
@@ -5,7 +5,6 @@ HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/bdftopcf/"
 SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f9a35333adf75edd1eaef84bca65a490"
-DEPENDS = "libxfont"
 
 SRC_URI[sha256sum] = "4b4df05fc53f1e98993638d6f7e178d95b31745c4568cee407e167491fd311a2"
 

