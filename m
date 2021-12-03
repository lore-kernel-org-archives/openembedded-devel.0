Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31D2C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 20:39:22 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.17044.1638563961487299856
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 12:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=P+6CoFhf;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1638563961;
  x=1670099961;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PO4TXVHh6rbKSj5Ldya+ELa4d6j0jz05gm23MT/PU3I=;
  b=P+6CoFhfSqAiRO1Po+CbZeGVC0/D2mERYS65E1pwCm9MrlaO2e+q8JvB
   LSNNrUdZZvehtxrfvuP8HS5CRsqA/a7ayp/fUzvJg0xiNtTGsmv7MDdf2
   fgHwWdL7i56/DJwoJpfzBSYj4Wh6QPeSDsNbDQyerJ4j0o9DiFC+DHMqa
   DDI01eYMEJXyQn3JHB/2/wME/qfK8T/v+gBGi/aduwSJXaNFTlW4mJU1Q
   AAK5NA64sMErzXdJOhNvpv9Lvj3tOupYo09Di0eNB8XugtmWieamui6Gk
   GWkEFu6LQQgtZ1j7NzVO5qbVxNhw7AlW6Z/VQtxIgBA7VMFIRAsrkjALU
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][master][honister][PATCH] gattlib: Explicitly disable Python
 support
Date: Fri, 3 Dec 2021 21:39:14 +0100
Message-ID: <20211203203914.13575-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 20:39:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94204

Under some configuration, CMake may pick up the existence of python
from the native recipe sysroot and use that when linking for target,
resulting in the following error:

  ld: .../recipe-sysroot-native/usr/lib/libpython3.10.so: error adding
  symbols: file in wrong format

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-connectivity/gattlib/gattlib_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
index ecff79be4..3fe4c9404 100644
--- a/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
+++ b/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb
@@ -23,6 +23,7 @@ PACKAGECONFIG[examples] = "-DGATTLIB_BUILD_EXAMPLES=ON,-DGATTLIB_BUILD_EXAMPLES=
 # Set this to force use of DBus API if Bluez version is older than 5.42
 PACKAGECONFIG[force-dbus] = "-DGATTLIB_FORCE_DBUS=TRUE,-DGATTLIB_FORCE_DBUS=FALSE"
 
+EXTRA_OECMAKE += "-DGATTLIB_PYTHON_INTERFACE=OFF"
 EXTRA_OECMAKE += "-DGATTLIB_BUILD_DOCS=OFF"
 
 inherit pkgconfig cmake

