Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612A2CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:37:19 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.6679.1760474234774784656
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Bge2gQZ8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251014203708a50b6b326700020784-k2kjih@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251014203708a50b6b326700020784
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 14 Oct 2025 22:37:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=iel03zKcHDCui+u90aUBvlxWzOffEwqkmO/qSGaeF24=;
 b=Bge2gQZ8yacfQmVq0nHUyUMo7dqy1ll32nd6CwEpQPsjUHjkkRasQxF9GlbBfhhPWZ1Uuy
 zsu6Ml8lqzAn56tyI9AZfQAPMf1CD7OC7R/SBHYhT+MGgz0BFjZit7iJ9VCG9ptjE8RsfFYC
 yrtZ4bylYDy/V6E98VmnQlEiwnoa+VsndCQSHBvcWllrxFh+vC9dWoN2MN0m3v/6vxmtd+Th
 JCRhplFKLJngBy5coQPIqyVUsW9Wqx38JK2WaqXxJGLMcsnPgqEQ2Y4WP8tCC7p5rfciqqxT
 IG12Ka93QBmqhI5cBKFB9But3LJYa+8V0dMs8Wv7SDSGADfnkP+zYjdw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][kirkstone][PATCH] squid: mark CVE-2025-59362 as patched
Date: Tue, 14 Oct 2025 22:37:04 +0200
Message-Id: <20251014203704.585165-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120625

From: Peter Marko <peter.marko@siemens.com>

Per [1] CVE-2025-59362 is fixed in patch for CVE-2023-5824.
That was a composite patch from more commits.
When checking it, it really contains also commit [2] which is mentioned
as fix for CVE-2025-59362.

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

