Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58C2CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 22:32:33 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.2719.1726612343965877615
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 15:32:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=VQLEWHSw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202409172232214d8abeb8d3314a9feb-4geuat@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202409172232214d8abeb8d3314a9feb
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 18 Sep 2024 00:32:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=26gDBpJUvIICak4ezOGdjzEatTSdNuzoAkUxw0gGN0Y=;
 b=VQLEWHSwbBXH+VyTHCgV4oUsXqf8UEnWa42EzQecv2huWk25RtshSjKikPA12WMMy2HdCS
 Zuc6Nh5dlG1dPrhHhTIoEJdc0as8MK2ZVfDn0Eyqz6zD1gpzy4YiDTgi9nM9hgUaANx79HXG
 faM/xr91nQUVs0+JvG05in07GraUwIxVMbKxrt0RikCGzCLvOxycksoarP4433EtE3c4HS8J
 F3F0YaWWnSSSagDZKl8VjdejGsOpSiOH4cO37l5W9AZ5QCrrRyBsq0WDoIL6whpg0GVlQ/kQ
 qtwYlTbmsLOcdOUniKRSQp0rbWo2FU2+9fH0Mb8rEDRmzjZ2bNCmxIEQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 2/2] nginx: Upgrade mainline 1.25.3 -> 1.27.1
Date: Wed, 18 Sep 2024 00:30:59 +0200
Message-Id: <20240917223059.1570530-2-peter.marko@siemens.com>
In-Reply-To: <20240917223059.1570530-1-peter.marko@siemens.com>
References: <20240917223059.1570530-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 22:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112354

From: Peter Marko <peter.marko@siemens.com>

Solves:
* CVE-2024-7347
* CVE-2024-24989
* CVE-2024-24990
* CVE-2024-31079
* CVE-2024-32760
* CVE-2024-34161
* CVE-2024-35200

License-Update: copyright year refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
deleted file mode 100644
index d0371dd3cc..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.24.x branch is the current stable branch, the recommended default
-# 1.25.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=79ad2eb837299421c4435dedc8897b3d"
-
-SRC_URI[sha256sum] = "64c5b975ca287939e828303fa857d22f142b251f17808dfe41733512d9cded86"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb
new file mode 100644
index 0000000000..5927ecab02
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.27.1.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.26.x branch is the current stable branch, the recommended default
+# 1.27.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
+
+SRC_URI[sha256sum] = "bd7ba68a6ce1ea3768b771c7e2ab4955a59fb1b1ae8d554fedb6c2304104bdfc"
+
-- 
2.30.2


