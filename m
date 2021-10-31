Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1459CC433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 22:53:09 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.37123.1635720779979415544
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 15:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=UtSqekQa;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635720780;
  x=1667256780;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f5VLCzpsUGzDNoAG7pi10MXARvaIierB6jdr8RLJEIQ=;
  b=UtSqekQapC6QjHlahApk0pyOAgxCkPQg5rvIGSFjSB0/nXNb2puDHgFO
   sSmBrtucUZzQoKbKjQ2yoga1KtmMEuBKwwKqo90Idbyko58/8KqnFt7Ab
   7jEU1GRcjj/TZjCUTppp7zco5JR36TudHxd1Zx8PHwAqFT8U+Bgyq/NPV
   CPcVo6CpbThJCXj4vgACo8ZGDuml+vS66jTIfKUbZzf3d7WGYu2+tpowZ
   RTXD8gI5NwOayaZIpV/Mw96uCGBUQwcNcPvrVbqOuYLO0xrNUf7Fm3w9U
   1pPKom1wqoushfLMI7nRBWmh+WhmnM+GVheQyCIb0Zhb2hBVEGe4jLvTQ
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libssh: Support building for native and nativesdk
Date: Sun, 31 Oct 2021 23:52:53 +0100
Message-ID: <20211031225253.7146-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Oct 2021 22:53:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93684

Since libssh is now a dependency of cryptsetup, it needs to be buildable
for the same cases as cryptsetup.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/libssh/libssh_0.8.9.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
index cbda8b7be..8f9e61da7 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
@@ -33,3 +33,5 @@ do_configure:prepend () {
 }
 
 TOOLCHAIN = "gcc"
+
+BBCLASSEXTEND = "native nativesdk"

