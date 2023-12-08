Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0765CC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 09:50:22 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.16761.1702029015245164820
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 01:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eFhhcLpQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54c9116d05fso2577871a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 01:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702029013; x=1702633813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8VzRY0ReHro0dSXnbchXbtJjgYYAvYsv5YpsWUjbgc=;
        b=eFhhcLpQs3fhNWDBziHmzjvN4L2xvkFO+DS1eFVsWQwYzdnoGzMP/LLqnC/UsL6tGG
         y4mgY+Z3Qg2I8fG0g0diZdPJL3YuKeEK99CU26IYNHFBC8x9h+wnVtjuStgngh5LA3c3
         RT4S3syCgFZdH4vnS1Pfok4y7Ak9c2xDGXhAagWVcg3oeNFuaqoeDn8JItYLnL9ibwDB
         BsN68URvAyPfnAGkxwXqEYSa7QKswKr5/pRhF37hwcaGJfB/zRcccDOknaNXjj4RbTsx
         lrp8JElYroHd/fo6wgTPveD0QK7eOfT4jyNpBSsUuOpWrqEm6+SmszobEzzX567cEy9u
         Vk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702029013; x=1702633813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8VzRY0ReHro0dSXnbchXbtJjgYYAvYsv5YpsWUjbgc=;
        b=nSBoZi60csUkt7rjx93QWjiZDJ/++gICSU4Wge1TLX40zOI94WmOFVBOW4Zl+LSXrx
         gF9z+as2iKfV11gt7sfKQ+91lp1Igk0aiCGszwR30koLdygD5/oQ98CoFnIiEDGQhT1W
         Yjo6V+miO2NPl6gwb8W8EAo/Nw2pm4+8sjsqDthCtSdR8WEPJ5laY5wVMHSU/E9p5FUV
         axjK0sMR2tYYsAoWPhJkJOk8IIhSshPVVBFVk2n5Gg83oN/u3ix+lgfVYho9In5xZREc
         BpHRVitCfs3hnZUHON676Y7J5FfDdwB3CG/w+n4WlXu8JnzFGWqq+Kfkj2Zg7RJc8fxm
         PpkQ==
X-Gm-Message-State: AOJu0Yx0YMwuB5LfoCHPXa6JE+hJrfXvqntgS/0p+a/bReI5Faqx6YOK
	IxBrHNHaNyvlXpcZvvwfqDE4395JdMA=
X-Google-Smtp-Source: AGHT+IEHBKZDTUl97NhwnZ0eq4LQZez6lu0NQptYlH/cgggBdUYo+wnjhPfAMZoYt1CMSy1nYIG5ag==
X-Received: by 2002:a17:906:2c57:b0:a1b:619e:53f9 with SMTP id f23-20020a1709062c5700b00a1b619e53f9mr1075258ejh.221.1702029012487;
        Fri, 08 Dec 2023 01:50:12 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id vk2-20020a170907cbc200b00a1d3e9e888bsm788948ejc.55.2023.12.08.01.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 01:50:12 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-gnome][PATCH] zenity: Upgrade to 4.0.0
Date: Fri,  8 Dec 2023 10:50:09 +0100
Message-ID: <20231208095009.319210-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 09:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107305

zenity 4.x now uses GTK4 and GTK4-based webkitgtk.

The perl based gdialog is no more, its subpackage would be empty.
Don't try to generate this subpackage.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...to-avoid-pointing-to-build-system-s-.patch | 28 -------------------
 .../{zenity_3.44.2.bb => zenity_4.0.0.bb}     | 16 +++++------
 2 files changed, 7 insertions(+), 37 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/zenity/zenity/0001-Harcode-shebang-to-avoid-pointing-to-build-system-s-.patch
 rename meta-gnome/recipes-gnome/zenity/{zenity_3.44.2.bb => zenity_4.0.0.bb} (62%)

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
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb b/meta-gnome/recipes-gnome/zenity/zenity_4.0.0.bb
similarity index 62%
rename from meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
rename to meta-gnome/recipes-gnome/zenity/zenity_4.0.0.bb
index 92b9f6655..a151f3ca4 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_4.0.0.bb
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
+SRC_URI[archive.sha256sum] = "0b8c8def18dab05cc49bd464b90ca7f945ae52ff5e09242da702a15d94d3e8dd"
 
 PACKAGECONFIG ?= "webkitgtk"
-PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk3"
+PACKAGECONFIG[webkitgtk] = "-Dwebkitgtk=true,-Dwebkitgtk=false,webkitgtk"
 
-PACKAGES =+ "${PN}-gdialog"
-FILES:${PN}-gdialog = "${bindir}/gdialog"
 FILES:${PN}-doc = "${datadir}/man ${datadir}/help"
-RDEPENDS:${PN}-gdialog += "perl"
-- 
2.43.0


