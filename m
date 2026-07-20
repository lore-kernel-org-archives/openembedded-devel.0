Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A284C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:28:22 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5629.1784575698168253051
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MdBDpFOb;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-202607201928163882df6da30002070d-xi7jwn@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202607201928163882df6da30002070d
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 21:28:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VZOGQuL1mBqYHIUglMt9SWnNGpIaaW02b48xjOQX2vM=;
 b=MdBDpFObUoi3vBDK1F3c+tymWyz0cvRYFXtXkUCXaj5wp3WU0lG5LE4328kNd72x7QxUw2
 StR+V3CKqs3R9KBDsg7c+HxHVTguTSFa9t4a25EcP8MFpC+2YEONBDchM1I4narGGqJJzFxn
 1GVO8ND4OuKHHKJLBK9wZ0sthJMnbh1TcigRNrYPiU8Fxp83Fb/X6v7bAOolSHp9wEXVLg0p
 g1Rp3HvnAp3EXiT4L3jsNhHEGSmYmoHTgmu22dnKQ9AZK+1iBlnISH9R1xukwXum3TLHsX8o
 XtWYIWhHa9nfxYhkys6st0gtbt6YRn6StGUfGJAQtdwSG+2MOkJs/dkg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH 1/6] grpc: set status for CVE-2023-33953 and CVE-2024-37168
Date: Mon, 20 Jul 2026 21:28:04 +0200
Message-ID: <20260720192809.28277-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128294

From: Peter Marko <peter.marko@siemens.com>

CVE-2023-33953 is fixed since 1.56.2 per [1].
FKIE sets "defaultStatus": "unknown" so it needs to be set explicitly.

CVE-2024-37168 description in [2] says grpc-js.
Even if (like FKIE added) grpc core would be affected, it would be in
old versions (also listed in [2]).

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-33953
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-37168

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
index 14ead4ccf9..2213331a3e 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
@@ -66,3 +66,6 @@ FILES:${PN}-compiler += " \
     ${bindir} \
     ${libdir}/libgrpc_plugin_support${SOLIBS} \
     "
+
+CVE_STATUS[CVE-2023-33953] = "fixed-version: Fixed since 1.56.2"
+CVE_STATUS[CVE-2024-37168] = "cpe-incorrect: This CVE is for grps-js"

