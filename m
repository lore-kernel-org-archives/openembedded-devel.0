Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8980EC4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:18 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.536.1642801157266423307
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LoeIEJ+K;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id k18so1977920wrg.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=72ijL2zfe2NDZzBU/6M+fUiuPh+j/GL6wEleG//Jl+8=;
        b=LoeIEJ+KaQYwwLnxPzE73BTb5zWuCN5b2kLN7eSOETyNGU5JBDw9MDzCXIYLiiE02q
         uHAU+ufw+5i1/41sthYTFuuAXdU+Ql11juC65K3kWZqIzm+9uTgL1BohgeVGXsMBFGOQ
         eAKmOsqCnNdfMWXGK4XpWJvoj6bbwfrEj/UEhGvwrldBi1EUK8hyt8mteJnQ9h6xHfAI
         5eIHO5sOK8NxOhOWNHLdmJRxY4NxgZ7V7MOXVHkmgdkgXoTHHne6F4b58iMmH/mbwIsp
         d4/ospMddEHGgJQYmn4V1MEuZBrf/AzxoqrQSxUk7qzoUKVDLXVfImdU8lSDJej/sty2
         vPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=72ijL2zfe2NDZzBU/6M+fUiuPh+j/GL6wEleG//Jl+8=;
        b=TQ8jO29qIEC17WpstdDzaqg82NOYVSC+OyU35Ow5MIzHPfzxKjR4wI2QG3wLEUUUQN
         FLfBLRZWmT4T6MtU3uhsmO46hP5IZrzSlFUyCl2ksMO1u8vf6Dy865YpjWXqCuaB5Ep4
         k/mf8RkCTw75IykyZaUlQeUQLOhVnbWBog8F2M/mLnO5lqYFt9jqE6jWgy4ITMSNaEHk
         oHn4hMIURYRSnc1rhbwSou6OK3JSdWt1VFa8Gkcd3JfKyqauX9Q4DeyFllNz72xahR7t
         u448GJYItUnf2QYqFFD2IqHO8cTRSmKjI6NMuivfD9z8kdl64CAzNxDb82X6gFFgP3ac
         g8mw==
X-Gm-Message-State: AOAM531DkjC6KvJEZgheHL7wK1amKYM1d7ATR6E+TAolv09W/H+9C48g
	1U4CKGT8GHOz5D847GgjYF8bqTJnoNY=
X-Google-Smtp-Source: 
 ABdhPJwJp6q7/ewqrgXtdYwnmIfIWOhVi8M3dN0Nua7g2O5OqpRoNIbKbck4SJDDxJQX8ZZ+4zISWw==
X-Received: by 2002:a5d:60cd:: with SMTP id x13mr754154wrt.588.1642801155919;
        Fri, 21 Jan 2022 13:39:15 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/19] evince: fix meson 0.61 builds
Date: Fri, 21 Jan 2022 22:38:50 +0100
Message-Id: <20220121213858.762625-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94989

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-incorrect-args-for-i18n.merge_file.patch | 52 +++++++++++++++++++
 .../recipes-gnome/evince/evince_41.3.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-Remove-incorrect-args-for-i18n.merge_file.patch

diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-Remove-incorrect-args-for-i18n.merge_file.patch b/meta-gnome/recipes-gnome/evince/evince/0001-Remove-incorrect-args-for-i18n.merge_file.patch
new file mode 100644
index 000000000..68447bec8
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince/0001-Remove-incorrect-args-for-i18n.merge_file.patch
@@ -0,0 +1,52 @@
+From b525a64d26bcba4e3a74f09c580429625d8a2104 Mon Sep 17 00:00:00 2001
+From: r-value <i@rvalue.moe>
+Date: Wed, 17 Nov 2021 18:22:45 +0800
+Subject: [PATCH] Remove incorrect args for i18n.merge_file
+
+`i18n.merge_file` has been ignoring positional arguments for
+a time and explicitly rejects with error since meson 0.60.0
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ backend/meson.build | 1 -
+ data/meson.build    | 1 -
+ meson.build         | 1 -
+ 3 files changed, 3 deletions(-)
+
+diff --git a/backend/meson.build b/backend/meson.build
+index 14629f2..2f972a8 100644
+--- a/backend/meson.build
++++ b/backend/meson.build
+@@ -53,7 +53,6 @@ foreach backend, backend_mime_types: backends
+   )
+ 
+   i18n.merge_file(
+-    appstream,
+     input: appstream_in,
+     output: appstream,
+     po_dir: po_dir,
+diff --git a/data/meson.build b/data/meson.build
+index 8a308b8..afc3020 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -15,7 +15,6 @@ foreach desktop: desktops
+   )
+ 
+   i18n.merge_file(
+-    desktop,
+     type: 'desktop',
+     input: desktop_in,
+     output: desktop,
+diff --git a/meson.build b/meson.build
+index 07fb8ec..0bb5d0f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -498,7 +498,6 @@ install_headers(
+ appdata = ev_namespace + '.appdata.xml'
+ 
+ i18n.merge_file(
+-  appdata,
+   input: appdata + '.in',
+   output: appdata,
+   po_dir: po_dir,
diff --git a/meta-gnome/recipes-gnome/evince/evince_41.3.bb b/meta-gnome/recipes-gnome/evince/evince_41.3.bb
index 3464bd11e..ec3dca209 100644
--- a/meta-gnome/recipes-gnome/evince/evince_41.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_41.3.bb
@@ -24,6 +24,7 @@ inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection g
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
+SRC_URI += " file://0001-Remove-incorrect-args-for-i18n.merge_file.patch"
 SRC_URI[archive.sha256sum] = "3346b01f9bdc8f2d5ffea92f110a090c64a3624942b5b543aad4592a9de33bb0"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-- 
2.20.1


