Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F68C636D4
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 15:00:24 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.14489.1675177215230562354
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 07:00:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <uol@pengutronix.de>)
	id 1pMs7J-0004FQ-1E; Tue, 31 Jan 2023 16:00:13 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pMs7J-001iEQ-5y; Tue, 31 Jan 2023 16:00:12 +0100
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <uol@pengutronix.de>)
	id 1pMs7G-008ynQ-JK; Tue, 31 Jan 2023 16:00:10 +0100
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [meta-initramfs][PATCH 1/2] initramfs-{debug,kexecboot}-image: fix override syntax in comment
Date: Tue, 31 Jan 2023 16:00:07 +0100
Message-Id: <20230131150008.2140231-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 15:00:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100878

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
---
 meta-initramfs/recipes-core/images/initramfs-debug-image.bb     | 2 +-
 meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-initramfs/recipes-core/images/initramfs-debug-image.bb b/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
index 601056b7e58d..fc9e81e5dea0 100644
--- a/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
+++ b/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
@@ -11,7 +11,7 @@ IMAGE_FEATURES = ""
 export IMAGE_BASENAME = "initramfs-debug-image"
 IMAGE_LINGUAS = ""
 
-# Some BSPs use IMAGE_FSTYPES_<machine override> which would override
+# Some BSPs use IMAGE_FSTYPES:<machine override> which would override
 # an assignment to IMAGE_FSTYPES so we need anon python
 python () {
     d.setVar("IMAGE_FSTYPES", d.getVar("INITRAMFS_FSTYPES"))
diff --git a/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
index dd082ba529fa..7e6e03d8e7da 100644
--- a/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-core/images/initramfs-kexecboot-image.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Initramfs image for kexecboot kernel"
 DESCRIPTION = "This image provides kexecboot (linux as bootloader) and helpers."
 
-# Some BSPs use IMAGE_FSTYPES_<machine override> which would override
+# Some BSPs use IMAGE_FSTYPES:<machine override> which would override
 # an assignment to IMAGE_FSTYPES so we need anon python
 python () {
     d.setVar("IMAGE_FSTYPES", d.getVar("INITRAMFS_FSTYPES"))
-- 
2.30.2


