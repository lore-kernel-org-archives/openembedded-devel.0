Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C17C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 06:39:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.25713.1701844750054829610
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 22:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DEkOg6xO;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c18e9d7c0so4125555e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 22:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701844748; x=1702449548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w8eacSHO0VeEbvHQg7MC1Kylnlnym9ywDSjdvqw5fcA=;
        b=DEkOg6xOrzAuSrnpYPa0wBgCpvSVEmvIpr7w/eeWl6nTTTtMFYOpbGQu4RhH37fH/L
         K4aUJIoLWwogN5RxCKnlmIbN6aO4LVN0ucjr2iylmpnwU3aYIdTZPzK5hRrVlsr8cA6e
         Sl2jW1lz3KBQ34FQ1DviNrjFKgZRUfr/sWrfGe7Ta1S5Qy4xsPL2/melVvg4rFKn9zwD
         sWoJhNXwT//Lajvz5E3hI+WuscO5VLiQ2+dhmm91AxsCuRkStCptmO4HfQcvOKJ3/jdr
         I37IdvBDP8RNEAUp6dRWhvkTa405qRRir5NMPSz4awIvg7pOMOInzR61MvdjRxNvLJYx
         68lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701844748; x=1702449548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8eacSHO0VeEbvHQg7MC1Kylnlnym9ywDSjdvqw5fcA=;
        b=ojw37HEtiZbXACOeH4Y9NUdLUVkSus5vWG8zeeRkhu6QSw3gVZOBtEb6Q2W9bfBAsc
         xsYCQpoFOoED7RC4U788K1cZUm0bqa+pqAsn2EIjfXLKKmIM554I91vOjLSd+jLRdqxK
         lHq37XP7MF1qO+36ySJw6nUoD8ATY2eb+MvtV/a7shu1WFqHUHTaeFid6f7B6W8nA5Il
         SoZtIoFcFD+Cs9ekkAVUR7SCxmYN+PYfKrpnt22s/5mEoEayNQOrWewm6jteeEX/dvYp
         Jdjq/FQC3uc4DABnDh7qosCsEDijY2jPtTEEITTWHqes0szMehO4T/8o3Ji79Ay5H7OJ
         8wZQ==
X-Gm-Message-State: AOJu0YwmE3jDe3K+oskFaFW0n+qDsnCaOBxqdLelH0p9m3cjrvBCWM8H
	OdxXuowbarfSOEzueN7wGJeZkLzw+RE=
X-Google-Smtp-Source: AGHT+IEPQ59wIAjk0eSaDFv5EV+s/d+oor7+bQ6Q2oKuX+0/jPiK5uce4dxnOvhS/5bcr3JPvb0kAA==
X-Received: by 2002:a05:600c:3ba0:b0:40b:5e21:cc25 with SMTP id n32-20020a05600c3ba000b0040b5e21cc25mr245814wms.80.1701844748115;
        Tue, 05 Dec 2023 22:39:08 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id l17-20020a1709062a9100b00a1bec12448csm2416591eje.150.2023.12.05.22.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 22:39:07 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-gnome][PATCH v2] zenity: Upgrade to 3.99.91 (4.0 RC2)
Date: Wed,  6 Dec 2023 07:39:02 +0100
Message-ID: <20231206063902.152089-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 06:39:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107235

zenity 4.0 now uses GTK4 and GTK4-based webkitgtk.

The perl based gdialog is no more, its subpackage would be empty.
Don't try to generate this subpackage.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
v2: Fix GTKIC_VERSION so gtk+3-native is not built and pulled

 ...to-avoid-pointing-to-build-system-s-.patch | 28 -------------------
 .../{zenity_3.44.2.bb => zenity_3.99.91.bb}   | 16 +++++------
 2 files changed, 7 insertions(+), 37 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/zenity/zenity/0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.44.2.bb => zenity_3.99.91.bb} (62%)

diff --git a/meta-gnome/recipes-gnome/zenity/zenity/0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch b/meta-gnome/recipes-gnome/zenity/zenity/0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch
deleted file mode 100644
index e054ff744..000000000
--- a/meta-gnome/recipes-gnome/zenity/zenity/0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c8be0d5e7d17930d819635df6570fa5331a5dedd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 10 Jan 2022 20:18:00 +0100
-Subject: [PATCH] Harcode shebang to avoid pointing to build system's perl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- src/gdialog.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gdialog.in b/src/gdialog.in
-index 2fc4633..f891861 100755
---- a/src/gdialog.in
-+++ b/src/gdialog.in
-@@ -1,4 +1,4 @@
--#!@PERL@
-+#!/usr/bin/env perl
- 
- # gdialog -> zenity conversion wrapper
- #
--- 
-2.31.1
-
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.99.91.bb
similarity index 62%
rename from meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_3.99.91.bb
index 92b9f6655..34d335d28 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.99.91.bb
@@ -3,25 +3,23 @@ SECTION = "x11/gnome"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-
 inherit gnomebase pkgconfig itstool gtk-icon-cache features_check gettext
 
 DEPENDS = " \
     desktop-file-utils-native \
+    help2man-native \
     hicolor-icon-theme \
-    gtk+3 \
-    gtk+3-native \
+    gtk4 \
+    gtk4-native \
+    libadwaita \
 "
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+GTKIC_VERSION = "4"
 
-SRC_URI[archive.sha256sum] = "3fb5b8b1044d3d129262d3c54cf220eb7f76bc21bd5ac6d96ec115cd3518300e"
-SRC_URI += "file://0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch"
+SRC_URI[archive.sha256sum] = "e8c80ae1e2a4d7b2eb39c4fb8c4b14814530f37997b49f4c184bf2f7124d84d2"
 
 PACKAGECONFIG ?= "webkitgtk"
-PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk3"
+PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
 
-PACKAGES =+ "${PN}-gdialog"
-FILES:${PN}-gdialog = "${bindir}/gdialog"
 FILES:${PN}-doc = "${datadir}/man ${datadir}/help"
-RDEPENDS:${PN}-gdialog += "perl"
-- 
2.43.0


