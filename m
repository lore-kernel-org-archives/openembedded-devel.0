Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2754F364C8
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 22:07:15 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.143786.1775772429520547854
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 15:07:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Da3zZWqV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026040922070783710c384500020740-kc8hnx@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026040922070783710c384500020740
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 10 Apr 2026 00:07:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=T21+/PoARXWKV+7poKkpauf9yW5osLn3rP3PNoFB8S0=;
 b=Da3zZWqV4xxdJIKl+peSNEAJ7cfPnQdWlqeKi4QBN4YxwIX81CEEboEGQ58WV4jkEBjL0O
 pEjg2V9qukRLCPjPNqb4ZpO7fJnp8nRStA38uJyZdv3oOzVdMCUYpN+5vnzCMp5DPvnrOXCS
 vtKj4PEpm8S0tGNkLiD5oJQNAd7gIN0M39hfTMqZzYke6y96BOPMSbvulpoPA9f74qILtknK
 rxMmjBGrHmngBqSzRYkTY8LSk44HHx1KhkY/YHwvq8eiMZ0b1FiSmFCJQJZUMjsMsnxHNO+S
 GxighJtAurHu2x4v95LsmLSJmb9SpVDQBr1Q+qdfqUCtJMwe32OHiEBA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 4/4] libvarlink: add new recipe
Date: Fri, 10 Apr 2026 00:06:10 +0200
Message-ID: <20260409220610.1216303-4-peter.marko@siemens.com>
In-Reply-To: <20260409220610.1216303-1-peter.marko@siemens.com>
References: <20260409220610.1216303-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 22:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126206

From: Peter Marko <peter.marko@siemens.com>

Varlink C library and command line tool.

Remove unuseful vim integration.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libvarlink/libvarlink_24.0.1.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/libvarlink/libvarlink_24.0.1.bb

diff --git a/meta-oe/recipes-support/libvarlink/libvarlink_24.0.1.bb b/meta-oe/recipes-support/libvarlink/libvarlink_24.0.1.bb
new file mode 100644
index 0000000000..de2f30c487
--- /dev/null
+++ b/meta-oe/recipes-support/libvarlink/libvarlink_24.0.1.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Varlink C library and command line tool"
+HOMEPAGE = "https://varlink.org/"
+DESCRIPTION = "Varlink is an interface description format and protocol that aims \
+to make services accessible to both humans and machines in the simplest feasible way."
+SECION = "devel"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+SRC_URI = "git://github.com/varlink/libvarlink.git;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "2ad4ec7ca62e148dbf0ad98646ec68c2e7e8a88e"
+
+inherit meson bash-completion lib_package
+
+do_install:append() {
+    # vim integration is not needed
+    rm -rf ${D}${datadir}/vim
+}

