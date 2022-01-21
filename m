Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A37AC433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:23 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.562.1642801162195639701
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=njIN6nwl;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id l25so1982456wrb.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yjVZsK1b3ArUVtRwTiQ9By3n0c/iYgzeWwjtVbknrG4=;
        b=njIN6nwlviejzu4eeF2y92C9OywHIlqOqYQIbYVHMyur+rohHctPa3KqKSZDRICeyV
         BHVbpzim0BFH8FxfixU+KuSXIXwJ21b88tlekjjDZu4jCDY+9qQIKajhRT3zZKomLa+s
         MTPlzp6BN+zIpxCgkKSfMNK3ZudhfVOETFMB1za45MYKsu33MyRvCH/Q+bzC1Oh+S7Yb
         8qG0BHXpqnUD8ox7TI45RVYdtPOZxWTSHcN4G6ryJRo/Ri7IhQ/LSEL6YXIwLgGEEW7a
         kSiGH4CFwprLcwf4uqmXQ7nUao0/fPA7DL2Hh+TtvllKhLYeOWoTza3+a7HPetHG06Hh
         Os6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yjVZsK1b3ArUVtRwTiQ9By3n0c/iYgzeWwjtVbknrG4=;
        b=oE2JQq0SuzZhq9YgBXG+1B51G0ja64Mc6hBKsAsnwaZT0vwtdQoaXagEyvkVnrcs+w
         bSRp+GIf8CuYjwZblhr8BK/EtMKxi73ui8YSUS6V/tSE6Y+EMwnMLNQBdz1l4bOVj8M6
         yMNjtaGupUyPrxE7JAvsmWLBpIzlIE0JRXCQAUKdX/5gxNDIHPdO2HDNOfZlMl2QKrlr
         ajspHpaz2kifAo7XRP6PTQI+43roq2K38S17DkEA48UqmvfYZJo/wUL9RYPgFEml527g
         EVVQE4dv3Kqi3KtyWKDS1fb3GDjiv3kO67kCE1YiTWuvPL6I+AMY2eEw2wfIHxLMOr1P
         yphQ==
X-Gm-Message-State: AOAM531EQGFqr6Blc++0x8yYcy29JN9E4J994dqUqoYRnRGZbL6r/eXl
	CM1Q63HRLLY3upie00RBqTejW7ohW3M=
X-Google-Smtp-Source: 
 ABdhPJxPkSDCcgzBGfGjlh/jyDGDxc6VDhXtkL4DAF8VHp9EDGzp7MRdr/xuSCKR+qs5GrUOoKIDGw==
X-Received: by 2002:a05:6000:170d:: with SMTP id
 n13mr5425281wrc.4.1642801160836;
        Fri, 21 Jan 2022 13:39:20 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/19] gnome-photos: add a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:56 +0100
Message-Id: <20220121213858.762625-17-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-devel/message/94995

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...e-incorrect-args-for-i18n.merge_file.patch | 31 +++++++++++++++++++
 .../gnome-photos/gnome-photos_40.0.bb         |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-photos/gnome-photos/0001-meson-remove-incorrect-args-for-i18n.merge_file.patch

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos/0001-meson-remove-incorrect-args-for-i18n.merge_file.patch b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos/0001-meson-remove-incorrect-args-for-i18n.merge_file.patch
new file mode 100644
index 000000000..9fb7a5b9e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos/0001-meson-remove-incorrect-args-for-i18n.merge_file.patch
@@ -0,0 +1,31 @@
+From a112e8a089851035945b6848849149bb36787906 Mon Sep 17 00:00:00 2001
+From: rvalue <i@rvalue.moe>
+Date: Fri, 21 Jan 2022 12:36:02 +0000
+Subject: [PATCH] meson: remove incorrect args for i18n.merge_file
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index 6e7192e..94271de 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -3,7 +3,6 @@ subdir('icons')
+ appdata = photos_namespace + '.appdata.xml'
+ 
+ i18n.merge_file(
+-  appdata,
+   input: appdata + '.in',
+   output: appdata,
+   po_dir: po_dir,
+@@ -23,7 +22,6 @@ desktop_in = configure_file(
+ )
+ 
+ i18n.merge_file(
+-  desktop,
+   type: 'desktop',
+   input: desktop_in,
+   output: desktop,
diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
index fb1b7d30b..ae8ab31f6 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_40.0.bb
@@ -30,6 +30,7 @@ def gnome_verdir(v):
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += " file://0001-meson-remove-incorrect-args-for-i18n.merge_file.patch"
 SRC_URI[archive.sha256sum] = "e02d73e138af8b2868b5cad7faa1bdd278aeade3b6c3c92836511a4e6f3af1af"
 
 do_install:append() {
-- 
2.20.1


