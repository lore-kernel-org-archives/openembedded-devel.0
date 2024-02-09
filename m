Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F95C4828F
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 15:34:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.15041.1707492875363333441
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Feb 2024 07:34:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Z0RdCeDl;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: thomas.perrot@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15CB440008;
	Fri,  9 Feb 2024 15:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707492873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jSZTIouGxMLOp+dIE5J8rl8zlcpLFTUOqREKPmNjXMY=;
	b=Z0RdCeDleDoeNW6rtindHZA1NkGTcHsanX1BiZdxt75IycDlRuiLwQnfLT3NT74iIKk2X4
	yYlvbluUpnxMyCD7i4U48bzNCzIgmP0XokpkFqG1WmuSr5gQD6/ER2WoBg0gqjXRr3vI5h
	swDHpOVZunO3UzE/H9XbI2DZ+OiH160v0XHv+yOYvVaXrlRL+3tuZa3Q+aWDHLUQNyf6Fw
	c9lWpZYviNQwmYxsnoqU7WOPrUg1FQATEW+8AuyXgFB9YGxxo0scfvQQhWglvXMmKP+Sdg
	jCFuTGjKEOUcrne9QU4it1pHiXyqLHtbJojAfjYbnF8uhXt5w7sPaiBSFwigvw==
From: thomas.perrot@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-oe][PATCH] etcd-cpp-apiv3: no longer skip ldflags QA
Date: Fri,  9 Feb 2024 16:34:30 +0100
Message-ID: <20240209153430.2756697-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.perrot@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Feb 2024 15:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108686

From: Thomas Perrot <thomas.perrot@bootlin.com>

Because there is no longer the error.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
index e8299bab5fdf..401d53c79c1d 100644
--- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
+++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3_0.15.3.bb
@@ -19,6 +19,5 @@ S = "${WORKDIR}/git"
 
 EXTRA_OECONF += "-DCPPREST_EXCLUDE_WEBSOCKETS=ON"
 
-INSANE_SKIP:${PN}:append = " ldflags"
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-- 
2.43.0


