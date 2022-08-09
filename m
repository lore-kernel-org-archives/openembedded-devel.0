Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490C9C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:18:08 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.12439.1660054678664909187
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=AJk5uBre;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1660054679;
  x=1691590679;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0kvn2S5BsE6a+O/YFt8bx2MkcOEjbnNHJyK7/NoZ+7Y=;
  b=AJk5uBreu4T/XywyBt9Wm6no4oGuhyn5GSxy9HlfzStUjqjw0Q8ryNfW
   VKVqOWrImvW2BwScMSI2Kab3ScXKkc9jfSYXfozbs78MZzR8BgfQuP/iy
   o0/1+66RQPTH3FRneAwVRGaOL+7TyjSHVSFBlDb34allD6I0FEd2mKwCs
   cuFDu5NInTzx9jUBtMVoU6xxW+uuShzRKVii14q5GmHgem2x8JFIncYvR
   fS01B5pzYBp6FP6hxG+1ASSfD4APcSoWcov9eSCWgkPFz723G1X9snB5b
   R0zQmsai2Qz5yog4Psdn1wvYQtAoTy0jZewvzM92MjOrdu6f5vcnMl7BC
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH 1/2] libwebsockets: Avoid absolute paths
 in *.cmake files in the sysroot
Date: Tue, 9 Aug 2022 16:17:28 +0200
Message-ID: <20220809141729.18587-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Aug 2022 14:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98180

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
index a5fcb8d72..2a3a4ebd0 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
@@ -41,3 +41,6 @@ RDEPENDS:${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libuv', '${PN}-evlib-
 RDEPENDS:${PN} += " ${@bb.utils.contains('PACKAGECONFIG', 'libev', '${PN}-evlib-ev', '', d)}"
 
 RDEPENDS:${PN}-dev += " ${@bb.utils.contains('PACKAGECONFIG', 'static', '${PN}-staticdev', '', d)}"
+
+# Avoid absolute paths to end up in the sysroot.
+SSTATE_SCAN_FILES += "*.cmake"

