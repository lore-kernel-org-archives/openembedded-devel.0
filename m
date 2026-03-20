Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172891099B49
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 22:31:33 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.882.1774044575425158819
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 15:09:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T+uAIva1;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: colinmca242@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d750eeaec3so501445a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 15:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774044574; x=1774649374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L0R93WffvGAPM0tk+xzzjDlDl4GmIA2Zi9SdjvoZ8AY=;
        b=T+uAIva1YNpBfYRA+jmCPag3VnA5pQPnHKoOOhdPuJWMQuvDT6+wJIteLVXXVP/SMt
         hFMMPvd/1rOPNsw3Wo0gw7zihp9NKi3+67wBS2L5lkVXQkGRr9yslVREIAF6FbLnWez4
         i5G3Y2jUksc7S4r72DyMugZeZRekhDQNmSxtGAK3Lug68H4beI1zuP8IbaeX7scc7TPf
         +I+1go9EYcLZ6dt7QWcsLIxPmBVi1oWfizC54ody2aPjvj1Fvrh5kHvdvVExvH6BVACJ
         CpDI/T9hPX9zt20BMldWbwVEp5WQLMkerVsJpisl6tWLHGcDVFb0KHTpt1Mkb8QTiGS6
         fvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774044574; x=1774649374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0R93WffvGAPM0tk+xzzjDlDl4GmIA2Zi9SdjvoZ8AY=;
        b=bLHipCA6pMSHXaJNvXQaFlGvivFdLY9UbVVRoQNPFS1v4nvcTrcuv6zqW6U7XTbddB
         DqC7nKRPZ5LQ0TtxsnQ8/TC8ELje5XkgfzUcsT9g3SbKr9DGBXrJjXrqYAcXiTP6Wd4c
         D5WCgRhJyihLN1xYAMjkPWgyjqIlaanbbcwnLAIVRc0fZEEb8xjwVEAwhJAdr75l7xfo
         FPrZ+fIQbSQk/VDUroHXJJihqYsJ7Qq6dHEwxJW2YaTxNFJv7M3I70PJxvvifGVYrSrc
         zGS9eXD5JhlKipLJaGW75MMLMUI4TkTDxoUkGC48l/DjTw9xjQhUqFaASf9ITbaYsR+Z
         VEbg==
X-Gm-Message-State: AOJu0Yz8xRHxIqgw5ps0qy3tboTPpocQ6V7AGXDixzMZyntLv1gEdtC+
	sbJwGh6twVIC3q5o1ThkT9bAEf4gEXahPX55lCCNhWtlkUwemZsPoMjLpDTWjw==
X-Gm-Gg: ATEYQzxerSWETHRxrWpXpTfsgwotLtD0He8zWZhywf8kR8llvWBclhQn3q562UceHmc
	HpLCS6lowyQkW5+2P6zgKWgFeAyddDSCy77Ie2zUl6WxKRV1qk11S0TKuUxV1HGiTdcIlAjgsOc
	GKsjaD5VYc+nZgWyX+7ulOSCI47hrq/ybUNMgNX2V5WcKU90WBmgkaGzZrXwmkwxJKfBqLqIN1o
	nqkjAlnqH6zGqrd5ODvs9tX6pN76l04zNuSXwIjAOHrnmqV3W6kTB29n7NEg3W8Q9hg42+rw/uL
	kicrjlWYjNGgCt9t/h+e9T7GhAH2QgQ6+f8It3dln2CPBLrSBsuo7RYZE2p7vOqJsrfbbuY8J61
	nRfgV23a2CsWxXMrOXsKrc8Mh51HEtZPwPQ2FvjP4zWvAPjvuz98tw9sPOGOMgvv04XGnkIwrGF
	9dPWccm037GzdOTDhdtRQ=
X-Received: by 2002:a05:6830:205:b0:7d7:faad:e35d with SMTP id 46e09a7af769-7d7faade563mr819632a34.14.1774044574237;
        Fri, 20 Mar 2026 15:09:34 -0700 (PDT)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7f8ec22casm1106296a34.21.2026.03.20.15.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 15:09:33 -0700 (PDT)
From: "Colin McAllister" <colinmca242@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [meta-oe][PATCH] xdg-dbus-proxy: add ptests
Date: Fri, 20 Mar 2026 17:09:10 -0500
Message-ID: <20260320220910.3129299-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 22:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125454

Adds ptest support for xdg-dbus-proxy.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
 .../xdg-dbus-proxy/xdg-dbus-proxy/run-ptest          |  2 ++
 .../xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb           | 12 ++++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)
 create mode 100755 meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/run-ptest

diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/run-ptest b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/run-ptest
new file mode 100755
index 0000000000..ff4b0b49ad
--- /dev/null
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy/run-ptest
@@ -0,0 +1,2 @@
+#!/bin/sh
+gnome-desktop-testing-runner xdg-dbus-proxy
diff --git a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
index 43536f5d7b..28773163c5 100644
--- a/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
+++ b/meta-oe/recipes-support/xdg-dbus-proxy/xdg-dbus-proxy_0.1.6.bb
@@ -9,10 +9,18 @@ DEPENDS = " \
     docbook-xsl-stylesheets-native \
 "
 
-inherit meson pkgconfig
+inherit meson pkgconfig ptest-gnome
 
-SRC_URI = "git://github.com/flatpak/xdg-dbus-proxy.git;protocol=https;branch=main"
+SRC_URI = " \
+    git://github.com/flatpak/xdg-dbus-proxy.git;protocol=https;branch=main \
+    file://run-ptest \
+    "
 
 SRCREV = "1c1989e56f94b9eb3b7567f8a6e8a0aa16cba496"
 
+PACKAGECONFIG = "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinstalled_tests=false"
+
+RDEPENDS:${PN}-ptest += "dbus"
+
 BBCLASSEXTEND = "native"
-- 
2.53.0


