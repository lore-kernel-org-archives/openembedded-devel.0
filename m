Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99D38C47077
	for <webhook@archiver.kernel.org>; Sun, 14 Jan 2024 17:30:29 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.43016.1705253420800227628
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jan 2024 09:30:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WmOspGko;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2024011417301611761080df07456864-ztwmms@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2024011417301611761080df07456864
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 14 Jan 2024 18:30:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=EZMMK2fjC211SICZb7N0zrro4OdJlg2tSOIosDyooew=;
 b=WmOspGkoXj3X6GFkTpH5zIim83lpI0UBp4/seDOY/668vFNsLStPVFaCJqvnWzTDcuBXl8
 jOEarBRpvMAemEPzBT7gaDLaUng3b28TScpewurFqr3MqHUxHVJsClMUIeSqDmPTsXotbeuz
 J6zFFEWoRAnDaW4LIcw+vyIw4u63Q=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] protobuf-c: change branch to master
Date: Sun, 14 Jan 2024 18:29:25 +0100
Message-Id: <20240114172925.2494706-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Jan 2024 17:30:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108276

From: Peter Marko <peter.marko@siemens.com>

This was forgotten during update to tagged version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
index 545618a4ec..24de6b8119 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.5.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d11077c6a2b5d2e64b9f32b61a9b78ba"
 
 DEPENDS = "protobuf-native protobuf"
 
-SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=next;protocol=https"
+SRC_URI = "git://github.com/protobuf-c/protobuf-c.git;branch=master;protocol=https"
 SRC_URI:append:class-native = " file://0001-Makefile.am-do-not-compile-the-code-which-was-genera.patch"
 
 SRCREV = "8c201f6e47a53feaab773922a743091eb6c8972a"
-- 
2.30.2


