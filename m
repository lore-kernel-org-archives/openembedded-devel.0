Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB68C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 06:36:11 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.6612.1713335764009123825
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 23:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HHQrAk80;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2024041706355937fa17d476535830a8-xnfa99@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2024041706355937fa17d476535830a8
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 17 Apr 2024 08:36:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AWibkyohqxe248Aw0sZGoA3dGDJP5x/t4XMX4keHJ0M=;
 b=HHQrAk80tXBX8G+vgmAfnFJSuB787A39WTM9Bit8Bw1jsP5/pSyUtZW0wzkDkyB9y4vx0h
 VQwqNcrWsfMGicJ9caXEHr/4pne/SWom361kkwfZoL0LxIxID4pvY3zroJL6BWl6mn5U5H/T
 174RbUlUDjcKYt0dqOqpXDq0CvnNY=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][master][scarthgap][PATCH] jemalloc: add +git to version
Date: Wed, 17 Apr 2024 08:35:02 +0200
Message-Id: <20240417063502.6985-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 06:36:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110038

From: Peter Marko <peter.marko@siemens.com>

jemalloc was switched from tag to development branch
171 commits ahead.
Adapt PV accordingly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index 7e0272f89..dca8de461 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=dev;protocol=https \
            file://run-ptest \
            "
 SRCREV = "630434bb0ac619f7beec927569782d924c459385"
+PV .= "+git"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


