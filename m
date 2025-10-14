Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D9BCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 21:12:56 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.714.1760476369332312789
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 14:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NuYrIUU0;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202510142112463319d60fbb0002073b-tqpgyg@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202510142112463319d60fbb0002073b
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 14 Oct 2025 23:12:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=s1r1SJ7wQr4DAcIgp37+vXaUh+EKfA5+Yv2iP38pw8s=;
 b=NuYrIUU0Ut+8pcjI+DbfGCYfPhwRB7l3Z207V8z7GW7Gu5E5e+lPPrlUzOMWPARIPx/cR4
 uuFSRAd7gNm51s6wPFk8VymbBJJkodTTk1yJYu8lfcO17viT0P7eT3X8H4yzoumEiu0rRh+1
 P2PydQWyFg53YXiMOmTm/QDPRysrKsFoxuQjm7fjBAP1Zr6qh6K7hSkpeVJY4a2ozfv9qfxu
 F2URpzephE9DU2MF3clRoJ7ZedmZYzOP8jxHj5hXwpUGDRdhJmK7Obz4L7YP9omUI45rUXV3
 lZEueE3ynWLqUfjrv2PtECP/j5Lf0ql5fcHoy3NznXJRm7S3W4RgYYKQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH] squid: mark CVE-2025-54574 as patched
Date: Tue, 14 Oct 2025 23:12:37 +0200
Message-Id: <20251014211237.585486-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120653

From: Peter Marko <peter.marko@siemens.com>

Per [1] CVE-2025-54574 is fixed in patch for CVE-2023-5824.
That was a composite patch from more commits.
When checking it, it really contains also commit [2] which is mentioned
as fix for CVE-2025-54574.

[1] https://security-tracker.debian.org/tracker/CVE-2025-54574
[2] https://github.com/squid-cache/squid/commit/a27bf4b84da23594150c7a86a23435df0b35b988

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch b/meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch
index 4946060313..6a58b56a9e 100644
--- a/meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch
+++ b/meta-networking/recipes-daemons/squid/files/CVE-2023-5824.patch
@@ -8,7 +8,7 @@ Date:   Tue Nov 21 13:21:43 2023 +0100
     backport
 
 Upstream-Status: Backport [RedHat RHEL8 squid-4.15-7.module+el8.9.0+20806+014d88aa.3.src.rpm]
-CVE: CVE-2023-5824
+CVE: CVE-2023-5824 CVE-2025-54574
 Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 
 diff --git a/src/AccessLogEntry.cc b/src/AccessLogEntry.cc

