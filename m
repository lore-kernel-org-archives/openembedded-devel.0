Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FEFC3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 15:02:44 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.10163.1719500559484191667
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jun 2024 08:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MbuoP/Sv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED7E924000D;
	Thu, 27 Jun 2024 15:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719500557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L+Jh/wWu10tCynzp+/bOobYmR1PTBvXWRmL0Sn0LTkI=;
	b=MbuoP/SvvYkRC8W4TGSJwa2NcReXs4Va52zHus1ItB8pMoiWZC1sLfWNTNYDVdgJKounKD
	yEbdN+tam/J3knoj4JpBoDOAM3o/0MKTcn6FcGc/SsqQrUPj4gpfFmmbSnWnl5YVBh3q0A
	ufMm1Kqei0ilxnbQkst6C17jcITAbVjYQsbehNnqCrnnhA3fQu+u3Vx1kWlN8DM0Scci/N
	0xk8gEeMtpNvbv8np2o2qlmMC7oRXAtl5wnnAx0dS2HDxrc0b/ih83RQLs3K9gu2XSwLwb
	QUPo9uXRKArpjTJlc9rpww6FgaoQx9/aj9Erm/eb88cDdhINiN/+yk6BWVo3wQ==
From: alexandre.belloni@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH][meta-webserver][kirkstone] nginx: remove non existent patch
Date: Thu, 27 Jun 2024 17:02:34 +0200
Message-ID: <20240627150234.467747-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jun 2024 15:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111126

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Commit 8e297cdc841c6cad34097f00a6903ba25edfc153 removed the patch but it
hasn't been removed from SRC_URI.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb | 1 -
 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb | 2 --
 2 files changed, 3 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
index 8bed04d6d826..09a1b455918b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
@@ -2,7 +2,6 @@ require nginx.inc
 
 SRC_URI += "file://CVE-2021-3618.patch \
             file://CVE-2022-41741-CVE-2022-41742.patch \
-            file://0001-HTTP-2-per-iteration-stream-handling-limit.patch \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
index 73b5c93c901f..b69fd7dab0f0 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
@@ -1,7 +1,5 @@
 require nginx.inc
 
-SRC_URI += "file://0001-HTTP-2-per-iteration-stream-handling-limit.patch"
-
 # 1.20.x branch is the current stable branch, the recommended default
 # 1.21.x is the current mainline branches containing all new features
 DEFAULT_PREFERENCE = "-1"
-- 
2.45.2


