Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE769E7BD92
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 11:19:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17603.1771240740505050410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 03:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G04W+gHa;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so34632755e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771240739; x=1771845539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rasgzkFwdwNcavMmzWBz12g8nxpCjHNkAU6XxXjkSoE=;
        b=G04W+gHasbeH4gkrdQs1I4HF1Uu3vXoyfgejNR5WB1fopgzHP4Z+rBeQ8iRiktlccr
         dRNdK7WEJ6wKhQUdtiSMe5BbCE/g/z0XpGyB58zYay/mCpekGSGVdH6vB0oxBhqMpep6
         HIoJ5+6Ie96nIdmIAI23/7zd0pdgpGXx4I34FFa8nmepeJ6NYsw4SZv0rQo34IdG+Bnq
         DbT969Y/PWxf3w2RG76SnhL1O0WytP/cLGJwxnCn9pHnnqcfH0zLo+Ucpl8M2AouQ1Ch
         aYkfAKczGXl0fO+Xi+B1YRK37Wk3XhYqIyl5cW/BkvZWq5MAW4Z4MOfw50e1BIy20Cch
         4BqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240739; x=1771845539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rasgzkFwdwNcavMmzWBz12g8nxpCjHNkAU6XxXjkSoE=;
        b=Q1me7ehtISXkPhRox+VMNYSzhBO/QoHIGvnhjEVkm53TpsZO7pCumx5sC9JWliExzX
         U2pT9clzrJnFOYCUyjCYKpuo16m7ke5+kEQ7e6i+FAUuAGkxoaTcSx8J6eOuvxyUqGer
         5cynPpftuS71/XK/x6KJxyVu36BgXtL8mZ1EWfyXM0Tfab0sAPCFzVCAius1MubzEtK7
         IwIB/r5XCIPezL+aULemHOzycfOJiG2L/rwazdLkYf3sLGI+oh0EZJGw8t+UIV439Uyd
         ccRpL/C3pkNuZ/boV/iMXryIIzH6bWNPSC8d/6Kr13zIkYoXYdDHNUHyIykN7ZZ4q5B5
         gXuw==
X-Gm-Message-State: AOJu0YxiatsRv2JYGY0r00JV/0wRqwrYOleALriBRtwn/envxo2EiIru
	+xtb8cHg/AjFLazD3wZx/JwuCHtjbdl0yktN71dpl2Xwdw1sMPspKUnZv0sbWQ==
X-Gm-Gg: AZuq6aL1kL3aawjqeRIOmMx48rzwopwHNTG+Xd12sykEKiixCeud3aeaOdxXNk2NnjT
	+M5SRcEyum1sNblOFxqMmIUbeQtjW24Yp84VpgTgLYt/j4IFTjwBMX9xSyIIkzmgNHFqnY2El6U
	rtamlTngSzsnh8UrXKtIHgnc4oBx3ES1FnHe9NpSbstgqd1EES9WRYCvkSANT+qemUuECcXolLx
	Hh+UT2NQ7OOZz3QsRw+Bp2vaZeYBzLH22SVRAgfObzUxrk/gSSQYdlPQLI6CmDOXq43BeblW5Dz
	cYWYiejjUFkCX1sOYSKW97iMqf8fHjJOFx/78ZOApkxr4Q6faEqtFhDoGFHowhyN3lOsTPgxA5G
	E+pQMKkLfJgKQAWTvQES5K+G26lbkMmTcR79W4jek6TlO8CyT3LwQEmR/3gu2wtXYyBWXj2pqPj
	HF7a8iQ6dWBzGJ+Cbr32+5
X-Received: by 2002:a05:600c:c16b:b0:483:43d8:8d68 with SMTP id 5b1f17b1804b1-48373a546b1mr180501795e9.28.1771240738241;
        Mon, 16 Feb 2026 03:18:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99497asm591008885e9.6.2026.02.16.03.18.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:18:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] wxwidgets: enable webkit PACKAGECONFIG only when opengl is available
Date: Mon, 16 Feb 2026 12:18:57 +0100
Message-ID: <20260216111857.2318383-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 11:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124415

The latest version of webkitgtk3 requires opengl DISTRO_FEATURE, so the
webkit PACKAGECONFIG should be enabled only when opengl is available.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
index 815a0b2d0a..a149134f5a 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.8.1.bb
@@ -50,7 +50,13 @@ EXTRA_OECMAKE:append:class-target = ' -DEGREP="/bin/grep -E"'
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk', 'no_gui', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)} \
 "
-PACKAGECONFIG:append:class-target = " mediactrl ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'webkit', '', d)}"
+PACKAGECONFIG:append:class-target = " mediactrl"
+
+# (x11 OR wayland) AND opengl -> webkit
+PACKAGECONFIG:append:class-target = "\
+    ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', \
+    bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webkit', '', d),\
+   '', d)}"
 
 PACKAGECONFIG:class-native ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk', 'no_gui', d)}"
 

