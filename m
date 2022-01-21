Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA39C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:23 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.586.1642801162806889630
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CwU9CV5Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id e8so242557wrc.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VyDizkhqGM0doSGDOwAnISk4H54CtZgbxhC2NhzWykU=;
        b=CwU9CV5QDyiuscg9UWtmSm4VbFaEKFCivbGe4atFN55KQVlkK1xwNzhASCYYquZWk1
         /IPGE0BJ6JvwWaQuwt3oQeiOJRwnkPld02YAeGuRe53hmcnFh0Nu4eJSJIorKRdDcNci
         t7ssWpnaZmsltQg4xyJTELX4Dg6pvow7lygKfm2PbyudRzHBK/7zjMHyz17zv5u6MOpO
         ysAui+MXmcdrKUCS8vHc/tPl3rAnud9Q9oWivTOmKheGqNOagBqLvaxUV/kanYRYj1bE
         w1XohBgnXIuWIPduFYdaZ5SFuEtDt3AvyrCTGFnM6B+Vi78oeImlMq73cKBYBxGQjnjt
         6vsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VyDizkhqGM0doSGDOwAnISk4H54CtZgbxhC2NhzWykU=;
        b=7ZjPMZ8kV8gWj2nbzojeArnJ8hI64jyVKq4FlK16Ho99BwkeznILsjQWT6A9PS9sC+
         RvkOtcy7H4sQfN1vHt6UUv4igGeVimVO/DdIFFx0/wRP35317OQ4zJZ+yc5wVPYTWhZP
         psYSDv2EqfPYz8EvS/dPDzGuyyH2TYqeTU+sv5P0D0boy2Ocpbb9HBWXkQcjxjIss7Y2
         vpCh6AIdlccdKAmAooUEG6Joq2sBoMYMEkGSdFeE0Vb0iiUkhoaI8KFR/TDhu/+TMNWE
         PHF7o4/fcngpvKAzJsr1CGSHMP16+aGSdGbPIMnI9ftijb+WtznPv9hFX4E0b+VG+DQw
         cG7Q==
X-Gm-Message-State: AOAM533PkzMf27hxUftrhi7Umx1RbA9aCjGIV6KoTNWw24wARGYFFrCU
	vRC8PfeKaKOPZeLjovl/KxmDXD8THYQ=
X-Google-Smtp-Source: 
 ABdhPJzQzU9UfuHswU5+edkBUDa0lWolghtcDqw8p0nXPduPAd568BSjmyZidE9kEfSAQh5Kbr1Ktg==
X-Received: by 2002:a5d:66d0:: with SMTP id k16mr1120626wrw.477.1642801161475;
        Fri, 21 Jan 2022 13:39:21 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/19] dconf-editor: add a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:57 +0100
Message-Id: <20220121213858.762625-18-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94996

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...or-meson.build-fix-meson-0.61-errors.patch | 31 +++++++++++++++++++
 .../dconf/dconf-editor_3.38.3.bb              |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf-editor/0001-editor-meson.build-fix-meson-0.61-errors.patch

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor/0001-editor-meson.build-fix-meson-0.61-errors.patch b/meta-gnome/recipes-gnome/dconf/dconf-editor/0001-editor-meson.build-fix-meson-0.61-errors.patch
new file mode 100644
index 000000000..850d8a9d4
--- /dev/null
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor/0001-editor-meson.build-fix-meson-0.61-errors.patch
@@ -0,0 +1,31 @@
+From 86379a220a4eb00c309f514d2ca57ed6c1c8b35c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 21 Jan 2022 22:22:58 +0100
+Subject: [PATCH] editor/meson.build: fix meson 0.61 errors
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/dconf-editor/-/merge_requests/21]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ editor/meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/editor/meson.build b/editor/meson.build
+index 4c89ab99..0eb3bb1a 100644
+--- a/editor/meson.build
++++ b/editor/meson.build
+@@ -1,7 +1,6 @@
+ desktop = dconf_editor_namespace + '.desktop'
+ 
+ i18n.merge_file (
+-  desktop,
+   type: 'desktop',
+   input: desktop + '.in',
+   output: desktop,
+@@ -26,7 +25,6 @@ configure_file(
+ appdata = dconf_editor_namespace + '.appdata.xml'
+ 
+ i18n.merge_file(
+-  appdata,
+   input: appdata + '.in',
+   output: appdata,
+   po_dir: po_dir,
diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb
index 97e994c1f..55b29139b 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb
@@ -8,6 +8,7 @@ DEPENDS = "dconf gtk+3"
 
 inherit gnomebase vala gettext gsettings bash-completion
 
+SRC_URI += " file://0001-editor-meson.build-fix-meson-0.61-errors.patch"
 SRC_URI[archive.sha256sum] = "571af4c7dad4f049b53e6cd728b79addf08c27ddab6bc57b396d211866ee79e3"
 
 FILES:${PN} += " \
-- 
2.20.1


