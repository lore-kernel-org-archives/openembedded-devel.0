Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD96DC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 17:03:05 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17995.1784221384941054860
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 10:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GtmToIqh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202607161703022c4981916a000207b3-zy9d_i@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202607161703022c4981916a000207b3
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 16 Jul 2026 19:03:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=D8Phs+7j69olzdb6VG+gvugXkgdnhNiAhrw2fQixRsk=;
 b=GtmToIqhafps1JvU8BLcid+3yzb/Jj/z+4hPkXCl4EFLUPzk2piV3+lHsGMDJeY7XYwrjW
 WR1aSBF5VI/idqHg7YQ4vSZFZKL+gYGhtgj6N429JGMuYWALfrPLLqSsFq6DeBOqy0RkAEaq
 kWsK4njmPQ3yvkQ9Garuq6BvR3qQu0ft/cXYfN6X/rSj7r92kmqKcWQWDGU3kuhKh+Yz/5nJ
 hMh+nMnGkq7uEKabUr38MpR3gFJj8b+cNv0mzPAcjoOjy3hW0t+Nlpm6y13DwYSH2H0DuuBU
 CGFaafQhoNHNJJPVxOB84NlEiJtAaQnT+JHrKposXqwnj7rKeGmC6D4g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/2] libwebsockets: patch CVE-2026-10650
Date: Thu, 16 Jul 2026 19:02:32 +0200
Message-ID: <20260716170232.818077-2-peter.marko@siemens.com>
In-Reply-To: <20260716170232.818077-1-peter.marko@siemens.com>
References: <20260716170232.818077-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 17:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128236

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libwebsockets/CVE-2026-10650.patch        | 46 +++++++++++++++++++
 .../libwebsockets/libwebsockets_4.5.8.bb      |  5 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch
new file mode 100644
index 0000000000..5846b3616d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch
@@ -0,0 +1,46 @@
+From 3f9f0c6ecaf0e6f3f219d30632c5d1f2479d7498 Mon Sep 17 00:00:00 2001
+From: Biniam F Demissie <biniamfd@gmail.com>
+Date: Wed, 13 May 2026 04:25:55 +0100
+Subject: [PATCH] ssh: plugin: add limit to resource exhaustion
+
+CVE: CVE-2026-10650
+Upstream-Status: Backport [https://github.com/warmcat/libwebsockets/commit/3f9f0c6ecaf0e6f3f219d30632c5d1f2479d7498]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ plugins/ssh-base/sshd.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/plugins/ssh-base/sshd.c b/plugins/ssh-base/sshd.c
+index ea35cb8b7..c849644d4 100644
+--- a/plugins/ssh-base/sshd.c
++++ b/plugins/ssh-base/sshd.c
+@@ -1,7 +1,7 @@
+ /*
+  * libwebsockets - small server side websockets and web server implementation
+  *
+- * Copyright (C) 2010 - 2019 Andy Green <andy@warmcat.com>
++ * Copyright (C) 2010 - 2026 Andy Green <andy@warmcat.com>
+  *
+  * Permission is hereby granted, free of charge, to any person obtaining a copy
+  * of this software and associated documentation files (the "Software"), to
+@@ -28,6 +28,8 @@
+ #include <string.h>
+ #include <stdlib.h>
+ 
++#define LWS_SSH_MAX_PACKET_SIZE  (256 * 1024)
++
+ void *sshd_zalloc(size_t s)
+ {
+ 	void *p = malloc(s);
+@@ -592,6 +594,11 @@ again:
+ 			pss->parser_state = SSHS_MSG_PADDING;
+ 			pss->ctr = 0;
+ 			pss->pos = 4;
++
++			if (pss->msg_len > LWS_SSH_MAX_PACKET_SIZE) {
++				lwsl_notice("msg size %u exceeds maximum\n", pss->msg_len);
++				goto bail;
++			}
+ 			if (pss->msg_len < 2 + 4) {
+ 				lwsl_notice("illegal msg size\n");
+ 				goto bail;
diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index f6d20c1d95..3015b7d165 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -7,7 +7,10 @@ DEPENDS = "zlib"
 DEPENDS:append:class-native = " libcap-native"
 
 SRCREV = "fbb0baf6af9c4324f0f1591734c78b0089b599d4"
-SRC_URI = "git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV}"
+SRC_URI = " \
+    git://github.com/warmcat/libwebsockets.git;protocol=https;branch=v4.5-stable;tag=v${PV} \
+    file://CVE-2026-10650.patch \
+"
 
 UPSTREAM_CHECK_URI = "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"

