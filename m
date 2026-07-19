Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38CDC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 19:36:00 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1960.1784489750587085694
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 12:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=giMcYMOc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202607191935467bdc4899a700020769-yvaztv@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202607191935467bdc4899a700020769
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 19 Jul 2026 21:35:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=j54sbDGkWlxZ5GGoFdH2OlvwvkCQ+1ktAIAp/Wfvcak=;
 b=giMcYMOczUCzqK4S52t9HSDIqiq8xaLhCtbYmZN/OsTDgsJpGfmyqe5Eocfy7Pe4ebFADX
 rl9GkNyC4UEMmQHx7IHunXlhl3LPo0CEisKDhAZz7tCWZ2XszC4zRolaPk/ykoQiTun9qMd8
 Q38iG7V5we+cZ7IAO0zxDHICwyvIMHTwKkYFeaiiXvHkBKEpEoO7/3dV2HM+z6+B5FaSsQlW
 UvmHIzq6sQVP8j6T36+rxJimJ2+/IBHJfx3od7F351xo5RXVdzV6vC0lMQzDpuzC3nVQ/ln2
 bdL+yuKew7+aUM0PQ9VPvhCoCl1YZGIwpS0C5k+42kxDSY8hYuTPhxmw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] 7zip: set status for CVE-2026-58052
Date: Sun, 19 Jul 2026 21:35:23 +0200
Message-ID: <20260719193523.440478-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 19:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128262

From: Peter Marko <peter.marko@siemens.com>

Per Debian team investogations, this can only occur on Windows.
See main CVE page [1] which links to detailed explanation [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-58052
[2] https://lists.debian.org/debian-lts/2026/07/msg00038.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/7zip/7zip_26.02.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.02.bb b/meta-oe/recipes-extended/7zip/7zip_26.02.bb
index 8037bfe039..e3674d8410 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.02.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.02.bb
@@ -68,3 +68,5 @@ RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so"
 RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-58052] = "not-applicable-platform: Issue only applies on Windows"

