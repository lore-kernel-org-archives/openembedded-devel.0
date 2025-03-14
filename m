Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A7FC35FF6
	for <webhook@archiver.kernel.org>; Fri, 14 Mar 2025 20:52:14 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.4420.1741985526863023184
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Mar 2025 13:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=f0hyCoy/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202503142052036b733474f745de74d2-_ccsnw@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202503142052036b733474f745de74d2
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 14 Mar 2025 21:52:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Inb76mv4BCtqT6a6l7DEO/frIPy8MNqZg5qh4b7Haqw=;
 b=f0hyCoy/hP+C4gtOw2tIp0CC6l0GRPb+F6FuROOm5w9sDlGXANLXwOXNUcpf0AbnLvWH8G
 Gg5iE6oUpte1qFniIZPYKNOP1YEipb/NPOU5puhdzQMJslDlT0KwZJhEhML5sOMksCZ5w7GC
 BgCUh3vRmNQ7zd3EdrxovZUG+5tcV52VRwLZMnaDcG3FvzCofoNvj34dcP8Cn7cuWk4Ms9N6
 i8CivFDgAYRtFe1MwEyg63p01acFfrPmNp5PtR+pz9XDME6aEfmP2lA8RN6sm4dHmLQY0H2R
 aZODUf/aY17p80HP+Tku5MNkgh9TYILfZ7sPDfC2OoDX7sp9rrrO+esA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/7] fluentbit: set UPSTREAM_CHECK_GITTAGREGEX
Date: Fri, 14 Mar 2025 21:50:29 +0100
Message-Id: <20250314205035.386919-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Mar 2025 20:52:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115988

From: Peter Marko <peter.marko@siemens.com>

"devtool latest-version fluentbit" shows currently:
INFO: Latest version: 20220215
which is something old.

This change switches it to:
INFO: Latest version: 3.2.8
which was released on 2025-02-27.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
index b895c7da0d..30a62dbc12 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
@@ -31,6 +31,9 @@ SRC_URI:append:libc-musl = "\
     file://0005-Use-posix-strerror_r-with-musl.patch \
 "
 
+# prefix tag with "v" to avoid upgrade to random tags like "20220215"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
+
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= "\

