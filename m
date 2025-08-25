Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB2EACA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 13:19:18 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.38847.1756127952644074150
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 06:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NgA3HutY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202508251319107a7e6e89952ad15ceb-hrum_p@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202508251319107a7e6e89952ad15ceb
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 25 Aug 2025 15:19:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0GU/YTMq8+cY0Dq0CfDxp6wFKqN4A24OjjGua++SAvg=;
 b=NgA3HutYy3dUSHeSYuEfoeQLJSXcBI4IvG/jPkdvanIAIOWPABhHQnILC/TauHEMgoKccn
 6Dlc5xSrAWYvunZ1NogYHXX3LD3iYgyW9EqC7i97Yhbh15ypKfdg3KkFE0HgF9Bru06ZQzzQ
 Sha5xxvHKJTpE12559aO/lPjcAohrCxlj3Na3CK4EXjG/C2W4qL9jFz/Hzjh9obJ0NNJyHgW
 LkTHvGmM5fYV7IlOMcoVPn8dXZ1KEFkzoBln3l4fQUWCUAEAIGGZ5y0MO9v6TlDQN5r1AdXV
 L7mBLvZPSk+K0SULladJjrwKzo7CEzbF+7J0eEOl8yZMelS4QV6tuekA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH 2/3] nginx: upgrade mainline 1.27.4 -> 1.29.1
Date: Mon, 25 Aug 2025 15:18:04 +0200
Message-Id: <20250825131805.230223-2-peter.marko@siemens.com>
In-Reply-To: <20250825131805.230223-1-peter.marko@siemens.com>
References: <20250825131805.230223-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 13:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119097

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2025-53859

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.27.4.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.27.4.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.27.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.27.4.bb
deleted file mode 100644
index 6c32ea7315..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.27.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.26.x branch is the current stable branch, the recommended default
-# 1.27.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
-
-SRC_URI[sha256sum] = "294816f879b300e621fa4edd5353dd1ec00badb056399eceb30de7db64b753b2"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb
new file mode 100644
index 0000000000..c08c8539c4
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.28.x branch is the current stable branch, the recommended default
+# 1.29.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
+
+SRC_URI[sha256sum] = "c589f7e7ed801ddbd904afbf3de26ae24eb0cce27c7717a2e94df7fb12d6ad27"
+

