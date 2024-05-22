Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F830C25B79
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 19:47:06 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.8.1716407214889322703
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 May 2024 12:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AUq+sf8V;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20240522194651fc8253b993554b91f3-dju80z@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20240522194651fc8253b993554b91f3
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 22 May 2024 21:46:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=bfDiQzgy0MRgNKbD9cIhWz5DjN9AtbK84E3k6nVxkk4=;
 b=AUq+sf8Vpem6z6JITgAVKxkJOMtWuCz+/VrBSssTJ5Jje/n1350Vq5BddpcOKcqrRo3jW4
 y4zqH578bNoLUWzba55r71bJN6P/WM8zheII8lNXp/CCaYgy1oEAHlhqpFY1dizspzBSvdJ3
 grPd468Mz5MNYoB7zb3Nqc7lGysjA=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][master][scarthgap][PATCH v2] jemalloc: add +git to version
Date: Wed, 22 May 2024 21:46:03 +0200
Message-Id: <20240522194603.26231-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 May 2024 19:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110489

From: Peter Marko <peter.marko@siemens.com>

jemalloc was switched from tag to development branch
171 commit ahead.
Adapt PV accordingly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index 7e0272f89..cc21c8bea 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -17,6 +17,8 @@ SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=dev;protocol=https \
            file://run-ptest \
            "
 SRCREV = "630434bb0ac619f7beec927569782d924c459385"
+PV_LONG := "${PV}-171-g${SRCREV}"
+PV .= "+git"
 
 S = "${WORKDIR}/git"
 
@@ -27,7 +29,7 @@ EXTRA_AUTORECONF += "--exclude=autoheader"
 EXTRA_OECONF:append:libc-musl = " --with-jemalloc-prefix=je_"
 # For some reason VERSION file populated only in tarball distribution.
 # Adding jemalloc version since this recipe is using source code from git tag
-EXTRA_OECONF:append = " --with-version=${PV}-0-g${SRCREV} --enable-xmalloc"
+EXTRA_OECONF:append = " --with-version=${PV_LONG} --enable-xmalloc"
 
 do_install:append() {
 	sed -i -e 's@${STAGING_DIR_HOST}@@g' \
-- 
2.30.2


