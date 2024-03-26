Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E61FC6FD1F
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 20:19:21 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.20684.1711484354813477686
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Mar 2024 13:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=cLKxuV5s;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202403262019105c9cd788355a65aee7-__qewn@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202403262019105c9cd788355a65aee7
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 26 Mar 2024 21:19:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RSznwQhxsb9PWpQUPts09t2PS1IhAuYMFJnFLs6RWk0=;
 b=cLKxuV5sbViQS2By4NXcPUBPS5FrU9swdqil2Y3wJ+Wm48ABTvzauXbWIWOAiSSE/2tdZU
 jE7fjqFyd2jZrCFWMwhiWh6ic97mbP0K9SseNlwzFDPRIpsTU1IYczK5lOXi/kLwhSP4KLwd
 prNTlL/F+S5SV2M4ASaTI+FJIyB4s=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] soci: fix buildpaths warning
Date: Tue, 26 Mar 2024 21:18:22 +0100
Message-Id: <20240326201822.530736-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Mar 2024 20:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109627

From: Peter Marko <peter.marko@siemens.com>

WARNING: soci-4.0.3-r0 do_package_qa: QA Issue: File /usr/lib/cmake/SOCI/SOCITargets-noconfig.cmake in package soci-dev contains reference to TMPDIR [buildpaths]

This is causing build failures in components depending on soci
when building with rm_work or from sstate-cache.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-dbs/soci/soci_4.0.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-dbs/soci/soci_4.0.3.bb b/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
index 71ab80c48..25d67ff8b 100644
--- a/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
+++ b/meta-oe/recipes-dbs/soci/soci_4.0.3.bb
@@ -43,3 +43,7 @@ FILES:${PN}-mysql = "${libdir}/lib${BPN}_mysql.so.*"
 FILES:${PN}-postgresql = "${libdir}/lib${BPN}_postgresql.so.*"
 FILES:${PN}-odbc = "${libdir}/lib${BPN}_odbc.so.*"
 FILES:${PN}-oracle = "${libdir}/lib${BPN}_oracle.so.*"
+
+do_install:append() {
+    sed -i 's|${RECIPE_SYSROOT}${prefix}|${_IMPORT_PREFIX}|g' ${D}${libdir}/cmake/SOCI/SOCITargets*.cmake
+}
-- 
2.30.2


