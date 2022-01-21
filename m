Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD789C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.582.1642801154493712202
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a9qmZNWC;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id k18so1977775wrg.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+eHPYImAcHvjzI5WdFj6vbJcChkugdnIJ+2h/atb54E=;
        b=a9qmZNWCuho8UQKspwVAnT6+snjOeeqr+GalAiVqpgTHocX3iiGf3aM+lEBAoDw8Cy
         gvMH+I+iFWyfki3ZvHn+aNRiHRfojmBuPAP/vosyxcAv64qYmMJmtaNJryuNiXsqp4L3
         8BL95XmYDjevAFXZQppaOXCLa8MFVpvLNUcgQeuEZNnJw5x5HSz4V8lIsxSKhIyqV8rV
         YE7UhOUBF1TNMjejECvP504RqxN35G7UaMFkH47lgeMI1bl/XCohxfFP8xHmIjP7NExs
         OgB0iIIH+Pnnj0N0rEqQkcMTIzp5BhhsuLxQNVkQoeWEalpArC6BmW7R7Bza+lAzdcAE
         4IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+eHPYImAcHvjzI5WdFj6vbJcChkugdnIJ+2h/atb54E=;
        b=H5O18QP8PRrZbQ5SCsdw472wWMEhzAYBnp1PVuMJmXQsaLZjVcGy8IFFrm+IrQLoiu
         rxPybdzYdccAEttnowZkG23hquErpOvEs0D8qExrZcPcUEV9Ok9exw1T30nmPEkmCVaE
         48G1yOioQPVm/GkjSsDfd2pOBBjF5jVjUY4OF729CucDS2U0laG35t4WtVMZTPAnMxxq
         KuRrgQwnWT2QqRrVodJdzdbhEDejoJLssl7/XgzDfUH2mvekZnQADfMFoK3mrziZ7IDv
         HbTu1IsvNyoKDyiN/BqMBSaQHhazPkZLALZXXacsgw+1L94DN5FBOZNLlvRmjRS3Mj6i
         eMPg==
X-Gm-Message-State: AOAM53163zyeQIVDSXMAVqaBZpfdpvsvu+II8Vj7DJOBbQC8AyoLOeL/
	JhCYLX3dmcfjsKhHvHl+Rtj0ykW/5cc=
X-Google-Smtp-Source: 
 ABdhPJy3AzHipnUGJmcLEDsdRQ7wQ18qcHOr9Svhb4u5cTnR1bnpvdWIqRciwWhi3ne8NKj7mCaPyg==
X-Received: by 2002:a5d:47c2:: with SMTP id o2mr5347785wrc.73.1642801153099;
        Fri, 21 Jan 2022 13:39:13 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/19] gnome-shell: backport a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:47 +0100
Message-Id: <20220121213858.762625-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94986

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-build-Drop-incorrect-positional-arg.patch | 81 +++++++++++++++++++
 .../gnome-shell/gnome-shell_41.2.bb           |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-build-Drop-incorrect-positional-arg.patch

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-build-Drop-incorrect-positional-arg.patch b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-build-Drop-incorrect-positional-arg.patch
new file mode 100644
index 000000000..edc32dee6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-build-Drop-incorrect-positional-arg.patch
@@ -0,0 +1,81 @@
+From 6f797c21703ce9e996da17c49879e2a16dfbc256 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Florian=20M=C3=BCllner?= <fmuellner@gnome.org>
+Date: Thu, 23 Dec 2021 17:18:16 +0100
+Subject: [PATCH] build: Drop incorrect positional arg
+
+Unlike other targets that take a name, i18n.merge_file() does not.
+
+Part-of: <https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/2078>
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/meson.build                                      | 2 +-
+ src/calendar-server/meson.build                       | 2 +-
+ subprojects/extensions-app/data/meson.build           | 2 +-
+ subprojects/extensions-app/data/metainfo/meson.build  | 2 +-
+ subprojects/extensions-tool/src/templates/meson.build | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index f924fdf..76ae45c 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -16,7 +16,7 @@ desktopconf.set('bindir', bindir)
+ desktopconf.set('systemd_hidden', have_systemd ? 'true' : 'false')
+ 
+ foreach desktop_file : desktop_files
+-  i18n.merge_file('desktop',
++  i18n.merge_file(
+     input: configure_file(
+       input: desktop_file + '.in.in',
+       output: desktop_file + '.in',
+diff --git a/src/calendar-server/meson.build b/src/calendar-server/meson.build
+index 7363282..8b4ef41 100644
+--- a/src/calendar-server/meson.build
++++ b/src/calendar-server/meson.build
+@@ -27,7 +27,7 @@ configure_file(
+   install_dir: servicedir
+ )
+ 
+-i18n.merge_file('evolution-calendar.desktop',
++i18n.merge_file(
+   input: 'evolution-calendar.desktop.in',
+   output: 'evolution-calendar.desktop',
+   po_dir: po_dir,
+diff --git a/subprojects/extensions-app/data/meson.build b/subprojects/extensions-app/data/meson.build
+index d7e7d40..4b601e8 100644
+--- a/subprojects/extensions-app/data/meson.build
++++ b/subprojects/extensions-app/data/meson.build
+@@ -14,7 +14,7 @@ desktopconf.set('bindir', bindir)
+ desktopconf.set('app_id', app_id)
+ desktopconf.set('prgname', prgname)
+ 
+-i18n.merge_file('desktop',
++i18n.merge_file(
+   input: configure_file(
+     input: base_id + '.desktop.in.in',
+     output: desktop_file + '.in',
+diff --git a/subprojects/extensions-app/data/metainfo/meson.build b/subprojects/extensions-app/data/metainfo/meson.build
+index c4962c0..a19bfa8 100644
+--- a/subprojects/extensions-app/data/metainfo/meson.build
++++ b/subprojects/extensions-app/data/metainfo/meson.build
+@@ -1,5 +1,5 @@
+ metainfo = app_id + '.metainfo.xml'
+-i18n.merge_file(metainfo,
++i18n.merge_file(
+   input: base_id + '.metainfo.xml.in',
+   output: metainfo,
+   po_dir: po_dir,
+diff --git a/subprojects/extensions-tool/src/templates/meson.build b/subprojects/extensions-tool/src/templates/meson.build
+index 670e2bf..d693bfa 100644
+--- a/subprojects/extensions-tool/src/templates/meson.build
++++ b/subprojects/extensions-tool/src/templates/meson.build
+@@ -4,7 +4,7 @@ template_metas = [
+ ]
+ template_deps = []
+ foreach template : template_metas
+-  template_deps += i18n.merge_file(template,
++  template_deps += i18n.merge_file(
+     input: template + '.in',
+     output: template,
+     po_dir: po_dir,
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb
index 7a438e4c6..d1b19895a 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_41.2.bb
@@ -32,6 +32,7 @@ REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 
 SRC_URI[archive.sha256sum] = "384651eb051393dbabe006d1ad057bf29d5cd73ebb87bc779ff5e1c31e80a827"
 SRC_URI += "file://0001-Introduce-options-gjs_path-to-optionally-set-path-to.patch"
+SRC_URI += "  file://0001-build-Drop-incorrect-positional-arg.patch"
 
 PACKAGECONFIG ??= "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
-- 
2.20.1


