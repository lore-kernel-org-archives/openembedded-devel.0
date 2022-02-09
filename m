Return-Path: <thomas.perrot@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2248C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 13:42:45 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.26388.1644414164358659354
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZmM1nnUu;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: thomas.perrot@bootlin.com)
Received: (Authenticated sender: thomas.perrot@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 62B631BF212;
	Wed,  9 Feb 2022 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1644414162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Z4qb3gXUslP4g8aUqln0HnIwmJEjhGrih7LpJ3dYIs=;
	b=ZmM1nnUuZo9bj2oi4mqmbP9oWh2QwZiVAkbimaQSdkTuqW5cJWtza21YzWjHbD8Bwm4xfo
	Qyd1WgIZPNkwSlf1bNHKBGc4O72ME6I+bZeZAogv7DUeMWqxJfgExemD33nikiaxQXxgsS
	t3WYEyT+yP5/Pts1jzAC3PWsOkM2KYZmXl7mE7CyZJsD9fuSwH9nNiCrI6cp5ta6CzVStC
	G4Fqor4EDvdUdX+UrXBTktzLDKDIQsOmmA2/5l3Xiu+3okF1ZS95sYuu2mLs2FpMcsX4SV
	Dw3K4xkTW/gHeHj12Q/IkVAIJQTfQ6qZ8664Typ+9g2R8xpccxxjXWc7MBFsVQ==
From: Thomas Perrot <thomas.perrot@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>
Subject: [oe][meta-oe][honister][PATCH] breakpad: fix branch for gtest in
 SRC_URI
Date: Wed,  9 Feb 2022 14:40:23 +0100
Message-Id: <20220209134023.1102164-1-thomas.perrot@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Feb 2022 13:42:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95277

The commit 4fe018038f87 is in the main branch, so the do_fetch task failed.

Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
---
 meta-oe/recipes-devtools/breakpad/breakpad_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index fabf59d4b29b..c752a100831f 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -29,7 +29,7 @@ SRCREV_lss = "fd00dbbd0c06a309c657d89e9430143b179ff6db"
 SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
-           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=master;protocol=https \
+           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest;branch=main;protocol=https \
            git://github.com/protocolbuffers/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf;branch=master;protocol=https \
            git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=git/src/third_party/lss;name=lss \
            git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp;branch=master \
-- 
2.31.1


