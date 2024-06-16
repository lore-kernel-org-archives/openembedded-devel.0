Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9043C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 20:38:49 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.42020.1718570323913772229
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 13:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fSLdegD/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20240616203841b988925aa01ab57768-mxtgbf@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20240616203841b988925aa01ab57768
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 22:38:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=i5DSpNTgCyo+raQebm033jivHw5hnMdAJkNwcbVei28=;
 b=fSLdegD/qYJhfzvTKAWc84pqWzXZoD3PlfOOXz3dD5ksNU7pU+3s3sw9rVDKuuRYmDSw+i
 unaDy9BULr94f2Z7QpXgqzYnBFEsp4rBfulkQEUIwqYbRaWllRCzJbdm8kfD0L5R1o7seVoV
 dVUKxifLZ088OoA46t4wrOB9bHvB8=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][scarthgap][PATCH v2 6/6] re2: rework solibs handling
Date: Sun, 16 Jun 2024 22:36:51 +0200
Message-Id: <20240616203651.856968-7-peter.marko@siemens.com>
In-Reply-To: <20240616203651.856968-1-peter.marko@siemens.com>
References: <20240616203651.856968-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 20:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110937

From: Peter Marko <peter.marko@siemens.com>

This is cleaner way how to package unversioned libraries
which was suggested during review of the last commit.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/re2/re2_2024.03.01.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/re2/re2_2024.03.01.bb b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
index 6e5b32a945..76d6f0c7a9 100644
--- a/meta-oe/recipes-support/re2/re2_2024.03.01.bb
+++ b/meta-oe/recipes-support/re2/re2_2024.03.01.bb
@@ -32,7 +32,8 @@ do_install_ptest () {
 }
 
 # ignore .so in /usr/lib64
-FILES:${PN} = "${libdir}"
+SOLIBS = ".so*"
+FILES_SOLIBSDEV = ""
 INSANE_SKIP:${PN} += "dev-so"
 
 # Don't include so files in dev package
-- 
2.30.2


