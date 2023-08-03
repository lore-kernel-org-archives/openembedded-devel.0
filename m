Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5CDC0015E
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:49:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.9671.1691052537428321841
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=MK4f5UPV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69091240010;
	Thu,  3 Aug 2023 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691052535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k47t7Dwd9Iwi9/avzvDXFRQvyRo9nEEjA/IFVTs8ais=;
	b=MK4f5UPVopzFvKvQS6dej++rl0ExFzm+oyKAvu4eVzDLQincXRUkI8cJx5aXbJvJ3SiknR
	GgyemXMsLMh4n8l3T+VdPSh+le3inmvlFaGzckBfjiyVH/PsuB8J9kqho3wsXtBsyMJM9c
	ZBuDL1hafjWPTtqMOo2UWOXd0QOh0T7jSizF1MYTXJ6Huvgg5RNDgqUOKpBuuZDKCWjRwJ
	TwGjMHvtA+XuHb2928m8bRkZWy5EofSxMTDx8Wia3IiV1U0ZFtiOYCeuxmObyg/yxK5MAS
	nW3JIEXBn/jMZeqALCnJK5U3+OiUn67IsA3PBVW+ZaRVCFI9vSOijIN9euUsDA==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 5/7] [meta-filesystems] remove unused AUTHOR variable
Date: Thu,  3 Aug 2023 10:48:37 +0200
Message-Id: <20230803084839.3012610-5-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
References: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 08:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104215

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

No longer used in generating packages
Also creates a possible confusion with the recipe maintainer
name.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 .../recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb           | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
index f91e682d2..1d07061ff 100644
--- a/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
+++ b/meta-filesystems/recipes-filesystems/sshfs-fuse/sshfs-fuse_3.7.3.bb
@@ -1,5 +1,4 @@
 SUMMARY = "This is a filesystem client based on the SSH File Transfer Protocol using FUSE"
-AUTHOR = "Miklos Szeredi <miklos@szeredi.hu>"
 HOMEPAGE = "https://github.com/libfuse/sshfs"
 SECTION = "console/network"
 LICENSE = "GPL-2.0-only"
-- 
2.34.1


