Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB71C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 19:15:59 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.40217.1718565354118144182
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 12:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=k5bZFZAS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20240616191550de20c11b1b88410828-er83pg@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20240616191550de20c11b1b88410828
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 16 Jun 2024 21:15:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=i5DSpNTgCyo+raQebm033jivHw5hnMdAJkNwcbVei28=;
 b=k5bZFZASloiWLj1SAzriGEmmtuQEW94XW/JAQMmo+D0llkjExgCjvWgqyQlmL9i9+WRaUX
 N/MY6WIAP2HzDn0bwOTLBwR+STorjattrDdvFRqhrvuThM7nO2rW/89hFR1tOZO+x93/4OQV
 IP/ikEy2wagA1HOfvDQmloyJne1sg=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] re2: rework solibs handling
Date: Sun, 16 Jun 2024 21:15:02 +0200
Message-Id: <20240616191502.855797-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 19:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110921

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


