Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C6A0C433EF
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 09:20:56 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.7298.1651828849045845681
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 May 2022 02:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=USbYhVD7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 37CE01BF20F;
	Fri,  6 May 2022 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651828847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WpGzVBGoR3dUEiuXn4gxtr5/z+1bPASXoLc9E6NL2+Y=;
	b=USbYhVD7uC1n/Xtyx9kyi18mLRwTHYXgOuvnP24gEXLvUsTbGSCroX2N04VNR062rv3N/6
	K7lxfjlgrQDawhOL5+xIBUgnU2whfUESTHEekB7Jl27y4bt1JIi4sDZ7rZVTb7PAJR2fak
	xFzRP4Bn4aJBzAbM4aAGBywtb5pr4Phv3a5aC5d62DcPz69h+tV+HAqYpiahNd8cpWtgQn
	x73Se/6Yz9/2g2BBbJbJnUCioHURXT0ayuSLMOCvQFmENYRgr6xGqvs1JejRlrMZeUnGOn
	z7qBUgsYaRNOoO0rmXsHe7iSc1WnWAU3M9bz8a6QlrhIHDR/6xCQ14zh3i9HWg==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] [meta-oe] devmem2: update SRC_URI according to redirect
Date: Fri,  6 May 2022 11:20:41 +0200
Message-Id: <20220506092041.798457-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 May 2022 09:20:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96972

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

http://www.free-electrons.com now redirects to https://bootlin.com

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index 92c05fe06..fd98a3831 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
 PR = "r7"
 
-SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
+SRC_URI = "https://bootlin.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
           " 
 
 S = "${WORKDIR}"
-- 
2.25.1


