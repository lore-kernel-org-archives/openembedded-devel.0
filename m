Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8603C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 06:26:15 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.25849.1701843969281207161
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Dec 2023 22:26:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hEbNZEGX;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54c67b0da54so6337365a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 22:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701843967; x=1702448767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vi5UuOhybm0GhUGHKlBU+QH+nWgSlFuZ4dNFJ88dSfU=;
        b=hEbNZEGXeMMuyBSIPP7mDRIJwKaJzaT+RRUxigyORFDZ5qPXerXu2DxMNapSEpmmGk
         kTH80KyFmQuYhdALrRIps+n6zETWw38NaWtBZOBb4V2XA9wwtjo1P67H0worMlMWGmQW
         pmViQwquefrmhTaX7ePVP+MhyrAEx1NGZ1l4b0CTEwEN/nVM456iH+h1eP5fBP7FV4sF
         7yipkZOrCnLViezu1cyUxsGvpxvqs3HpsEs3FKbxCtXVUjHUhuzociu1yAZpU1YXDPZ9
         bXEQIoJavE9mz0GTq9LDR0LJD3stbF2sFFtRS/w4i7TJpeEYL4/0MeY7JwY2tMIub6rM
         89/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701843967; x=1702448767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vi5UuOhybm0GhUGHKlBU+QH+nWgSlFuZ4dNFJ88dSfU=;
        b=Szn4aCLJX7pkZPyeoZs0ixfQMMiGIyZ2UZ5KG3cLUqeZVwQkrm1H4etcmhEaLey+OS
         35BWYxznzUxKNjGixRFbUshRQp5WbOqFTFk8mE4fIjTRThz9sj3beQZmad/RFT/pW+Jw
         BHcMYPnFH1u3bahuw1F/4GIUamaZOBwShmL4/xTykCmOLgoRqSAtFpidYkTxBGA+oSvE
         052vPO3zrPQ79eE9tvvv2LzgOotNDg00R9mvJrj7X+VLyjbZUOj1C9q8xcN1t+GnPytj
         GLE2xi+ajsPbjCU0ZWsheaxjZC3HiKfI1czyZbpPE4hQyO/VFnuObb8lxT+vnxB/HA5z
         huWQ==
X-Gm-Message-State: AOJu0Yw0CCi2AHtD9U6aV5+CrZWirCB8WPRNoS/JhuKZFtCGSi9aD2FV
	ooidsqG1T0Ih9QWdPeTrIhdOuW4oz+w=
X-Google-Smtp-Source: AGHT+IGJqR4iNRgnPra+cw7iFhHsct9cO8IiNavPtyZEuvZu/Xd1iRvdxYaxmeCRoAOoPNRDPlZeuw==
X-Received: by 2002:a17:906:e56:b0:a19:39b3:1639 with SMTP id q22-20020a1709060e5600b00a1939b31639mr206639eji.40.1701843967101;
        Tue, 05 Dec 2023 22:26:07 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id hr38-20020a1709073fa600b00a1ce97f320dsm1404860ejc.31.2023.12.05.22.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 22:26:06 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-gnome][PATCH] zenity: Upgrade to 3.99.91 (4.0 RC2)
Date: Wed,  6 Dec 2023 07:25:58 +0100
Message-ID: <20231206062558.151165-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 06:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107234

zenity 4.0 now uses GTK4 and GTK4-based webkitgtk.

The perl based gdialog is no more, its subpackage would be empty.
Don't try to generate this subpackage.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...to-avoid-pointing-to-build-system-s-.patch | 28 -------------------
 .../{zenity_3.44.2.bb => zenity_3.99.91.bb}   | 15 ++++------
 2 files changed, 6 insertions(+), 37 deletions(-)
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
index 92b9f6655..92ccb8e86 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.99.91.bb
@@ -3,25 +3,22 @@ SECTION = "x11/gnome"
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


