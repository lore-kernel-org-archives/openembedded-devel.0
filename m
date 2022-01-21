Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B25C4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.556.1642801149704362526
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PwXiLRo5;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so23548055wms.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k5CLAFITjj66AdlAuR6pnP4T7Cb4labPZht4WvtazZg=;
        b=PwXiLRo5aN4xaVQoEbmWXUG/mBxVckR/6D6CFgoMmeyLUjXuc2KP82aCXYMlU7jgWc
         Sbi+wczL3KNt5v2cSpHe+dM0A00q+k+pl6dMSFFuVo2S0XXsdfHQhS+T77PbT39yM5XJ
         Py0PQb9OiNiIwrgMVzp4eyqxG7tvzb9XZjRGZbITdLJL+NuWB34rE9TnQpD1SDPUoNfs
         woc7ONZah5+XyggRs7GYg9JA5L+HnACW5BPGgOm6Kq4ryBof/LTNqggmbsH3WP27SV+X
         ZAdgtm9u43AJhSLAxdNeK9KJN6agwqi9QVaBv/UoJtfMierwa/FDGlWdiRpfFpcBRmPD
         7UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k5CLAFITjj66AdlAuR6pnP4T7Cb4labPZht4WvtazZg=;
        b=4xO6reGWjWiik128MlijloCkkKhQbIFS6+V1uNAVlDoyd3IiAPQjf9XOm6FdjyoAHK
         NY81am/jzkCA7Ke9LOhpqgs7GgC+cJigr0evX7bLgCOYYlV8qAPTp4ofK25xqYzfOna6
         rM4+jCB6vXvGOGy70Rw9AsmX9vnQYKa+Dr/gxuyYz1obmMqsOX5o9okIES9FZV9/AlXE
         GR3DDAoh91Abrkz0V2pj4A3kUm7yrs/ojhCHXAh/B65mvVK+JDMRjpMZI+aZyBwtr0Bn
         wV7yIvCjiBjMHeJpT3015ug3S9g0Rzq9vpA0WqaCSTEuADcidwydyyGXGwgtamOd521B
         7q1w==
X-Gm-Message-State: AOAM53152/GV1SRxZTjvTGAii/YmAsDJJmKPHs+4W6AvFtfo+N20s16i
	eMtgTwh/4IUInrUbEH19MTMUBS8ue40=
X-Google-Smtp-Source: 
 ABdhPJxThqvee7eQjXgisn48oZb818cZ7Z4bum0EyJOPKjDRULqrQSBIYXm7q0JqlMGAWekziN49/w==
X-Received: by 2002:a05:600c:2f17:: with SMTP id
 r23mr84338wmn.6.1642801148265;
        Fri, 21 Jan 2022 13:39:08 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/19] gnome-terminal: backport a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:42 +0100
Message-Id: <20220121213858.762625-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94981

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-build-Fix-for-newer-meson.patch      | 46 +++++++++++++++++++
 .../gnome-terminal/gnome-terminal_3.42.2.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-build-Fix-for-newer-meson.patch

diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-build-Fix-for-newer-meson.patch b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-build-Fix-for-newer-meson.patch
new file mode 100644
index 000000000..12520b177
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal/0001-build-Fix-for-newer-meson.patch
@@ -0,0 +1,46 @@
+From f88447850e162c8d514be367db574c6fa2fec2a5 Mon Sep 17 00:00:00 2001
+From: Christian Persch <chpe@src.gnome.org>
+Date: Fri, 14 Jan 2022 11:33:32 +0100
+Subject: [PATCH] build: Fix for newer meson
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/meson.build | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index 79d97e5..e0bcbb9 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -18,7 +18,6 @@
+ metainfodir = gt_datadir / 'metainfo'
+ 
+ i18n.merge_file(
+-  gt_dns_name + '.metainfo.xml',
+   input: gt_dns_name + '.metainfo.xml.in',
+   output: '@BASENAME@',
+   po_dir: po_dir,
+@@ -27,7 +26,6 @@ i18n.merge_file(
+ )
+ 
+ i18n.merge_file(
+-  gt_dns_name + '.Nautilus.metainfo.xml',
+   input: gt_dns_name + '.Nautilus.metainfo.xml.in',
+   output: '@BASENAME@',
+   po_dir: po_dir,
+@@ -40,7 +38,6 @@ i18n.merge_file(
+ desktopdatadir = gt_datadir / 'applications'
+ 
+ i18n.merge_file(
+-  gt_dns_name + '.desktop',
+   input: gt_dns_name + '.desktop.in',
+   output: '@BASENAME@',
+   type: 'desktop',
+@@ -57,4 +54,4 @@ meson.add_install_script(
+ 
+ # Subdirs
+ 
+-subdir('icons')
+\ No newline at end of file
++subdir('icons')
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb
index b000fa80f..2b3f3a616 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.42.2.bb
@@ -24,6 +24,7 @@ DEPENDS = " \
 
 SRC_URI[archive.sha256sum] = "8a9c8e5ef7a3a73b246a947e1190bb08ec98935af860cf0b3aa2fbf4606817a0"
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
+SRC_URI += "  file://0001-build-Fix-for-newer-meson.patch"
 
 EXTRA_OEMESON += " \
     -Dsearch_provider=false \
-- 
2.20.1


