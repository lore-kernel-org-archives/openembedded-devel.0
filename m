Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACA5C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 20:01:20 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.46399.1707076877251781224
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Feb 2024 12:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Eru6Uc50;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20240204200112837284c20b15f087d1-lbapna@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20240204200112837284c20b15f087d1
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 04 Feb 2024 21:01:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ogVtooxqS3mjZjASvLN71VrUJ2L2f7jh1lS0O5hMTrE=;
 b=Eru6Uc50p3sZUDJiinYQAJdMnSMqp+Z4ywvkwSRa/NEHFaKz0I58wQF5IMg6TgER4AKrga
 Yid35hEuD9ZiRhqG4kDU463+Ka0hcDE7j75e+vj7GGtd1v7SrWRIN2MLr+1s1lkjLuV47lSD
 e7e9RCzGX8o2YENXB8qLwnzQPRpAw=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] syslog-ng: ignore CVE-2022-38725
Date: Sun,  4 Feb 2024 21:00:25 +0100
Message-Id: <20240204200025.451435-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 20:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108563

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed in 3.38.1, however cve-check indicates it as
not fixed because there is also cpe for premium version.
There is currently no method to filter this away in cve-check.

Relevant CPEs:
cpe:2.3:a:oneidentity:syslog-ng:*:*:*:*:-:*:*:*       < 3.38.1
cpe:2.3:a:oneidentity:syslog-ng:*:*:*:*:premium:*:*:* < 7.0.32

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
index 650c7bd5f3..77a5e67a42 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
@@ -30,6 +30,8 @@ SRC_URI[sha256sum] = "c16eafe447191c079f471846182876b7919d3d789af8c1f9fe55ab1452
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 
+CVE_STATUS[CVE-2022-38725] = "cpe-incorrect: cve-check wrongly matches cpe:2.3:a:oneidentity:syslog-ng:*:*:*:*:premium:*:*:* < 7.0.32"
+
 inherit autotools gettext systemd pkgconfig update-rc.d multilib_header
 
 EXTRA_OECONF = " \
-- 
2.30.2


