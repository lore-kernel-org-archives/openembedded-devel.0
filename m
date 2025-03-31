Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEE1C36010
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 14:41:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.53912.1743432090906966448
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 07:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HKVamfxS;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2260c91576aso72087455ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743432090; x=1744036890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IkZ168o9wXk4T0AZz0BcIWy02BOoh23xpMSWJonq41s=;
        b=HKVamfxS+iOdL7SpwxeyRKQ4dNkJ3pFIghlqHiRYx3idrx4hg+HvzPPj2NHp0qXX7Z
         F6Z6JoOX2XPXi5DMps7ZvylzQ/kPMlwGt+2TvNr42RMuAwIILFW75QWTI0j5WkBBByBR
         NlsztGB+tKgkPgRhaBoq3FFS0jx/Oj89INb5tYqojDti7Int00cnAjJnxeORnuppTw1N
         RLbHUFoCi26UdLBD6Uz9/PTVp9Z7bXpcjSGFkbygiXb5qr2+BTkofeb/en5fUPHKMXZg
         vf8TtrWiTuV/YTm0gQRwqVa+g6J6CdKb3EaSYYI80UaREBzxQs9m6N8HpiH6zaTkHNT6
         JNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743432090; x=1744036890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkZ168o9wXk4T0AZz0BcIWy02BOoh23xpMSWJonq41s=;
        b=vSDI6Uu0InowVWx36s9tU5ukfJmAiPmRx6AErWCGpZg0aHhb6EWSyTVYxKViocU9dY
         2X3mrWapnNOtpVVwEQ0REC7fXfYmcCfBWxJCTKF2rVrve0YrkXdWY5pnHPGn6ElrEqq2
         79iWHKs8TD9fXk8yOWo9GTe5TpKoQGF+F58g/AZrB9LrjMsY7JDkJDueQdGGYCRlipxM
         oG5yWSrZDS0gn4bCpMzCottJzu7i3V7N7ETiTN57r8bL9mDJPhU/yaYkijZ4SusTp8bw
         mUN9K/KZjUCdB9sm0oQr85qun9pAKKrOeMG42CYcX9x0ZepwwowQqgvRSOwldGVfAlLY
         H3Lw==
X-Gm-Message-State: AOJu0YzY3xIHSEdO8i550xS5i+Vo1kf0c/gBdC+dAht+fTygUG1bjhly
	VPKLZxhnsBzgrSgEL11mbsQSaXEVcgvtEj+B0GqECqBLP2UhNvW53r8mYpMr
X-Gm-Gg: ASbGnculjQ/TzgJgQGEHurYHtPXzsOov2VFY+A1udMAqOcxYePRPepkC4W8hrrxl91C
	vQms8gPVyxpVB/Bh6Q2l88TWT5OAhQ13QxCFIZVhztnADZbjFd9XLO5YvVk/zLittsgE9WNS8D5
	XojjbtdU2PCuEfWpXTyRyzOWnrEm1d7wExIAfJB277hUZhISynaHHICc7OvlKy7QwrC3DRun0NK
	4QcbDLROo5cQFDG/AzUBP/I0+hUbNcIo7BoP+188F7jmNV+ph9Tv/ckigv59OFrPn6HopYTN0gO
	yNi2fH1vXlcyvU7I4ulWfw6/sfm1ziliO2WBi7pXClcD57M=
X-Google-Smtp-Source: AGHT+IF07W5C2gmrZ8pBQxtmMVVMcTSRGhGBlWHbWoNYG785O52Q/CKUr/B3++QTYayj8zPGVxAupg==
X-Received: by 2002:a05:6a00:3ccc:b0:736:3ea8:4805 with SMTP id d2e1a72fcca58-7398037e91emr13460849b3a.7.1743432089596;
        Mon, 31 Mar 2025 07:41:29 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710acd89sm7214175b3a.142.2025.03.31.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 07:41:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-openembedded][PATCH] Drop styhead from LAYERSERIES_COMPAT
Date: Mon, 31 Mar 2025 07:41:26 -0700
Message-ID: <20250331144126.1491066-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116434

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/conf/layer.conf | 2 +-
 meta-gnome/conf/layer.conf       | 2 +-
 meta-initramfs/conf/layer.conf   | 2 +-
 meta-multimedia/conf/layer.conf  | 2 +-
 meta-networking/conf/layer.conf  | 2 +-
 meta-oe/conf/layer.conf          | 2 +-
 meta-perl/conf/layer.conf        | 2 +-
 meta-python/conf/layer.conf      | 2 +-
 meta-webserver/conf/layer.conf   | 2 +-
 meta-xfce/conf/layer.conf        | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-filesystems/conf/layer.conf b/meta-filesystems/conf/layer.conf
index 5323913d58..007be777f4 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "styhead walnascar"
+LAYERSERIES_COMPAT_filesystems-layer = "walnascar"
 
 BBFILES_DYNAMIC += " \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 6adf7a405c..64ecc462a1 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
-LAYERSERIES_COMPAT_gnome-layer = "styhead walnascar"
+LAYERSERIES_COMPAT_gnome-layer = "walnascar"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index e8527495af..0ca5c5a369 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "5"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "styhead walnascar"
+LAYERSERIES_COMPAT_meta-initramfs = "walnascar"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 25e8b044a2..9e351673a6 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "styhead walnascar"
+LAYERSERIES_COMPAT_multimedia-layer = "walnascar"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 19ce3fe902..85a207bc8d 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core meta-python openembedded-layer"
 
-LAYERSERIES_COMPAT_networking-layer = "styhead walnascar"
+LAYERSERIES_COMPAT_networking-layer = "walnascar"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index d3fd49cf6b..2f4b9c4027 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -48,7 +48,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "styhead walnascar"
+LAYERSERIES_COMPAT_openembedded-layer = "walnascar"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 057fb05b26..0511263d22 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "styhead walnascar"
+LAYERSERIES_COMPAT_perl-layer = "walnascar"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index cae3931b86..10a1647016 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "styhead walnascar"
+LAYERSERIES_COMPAT_meta-python = "walnascar"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 90a8792180..3a264610f1 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "styhead walnascar"
+LAYERSERIES_COMPAT_webserver = "walnascar"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index d741d0ba94..043f290e98 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "styhead walnascar"
+LAYERSERIES_COMPAT_xfce-layer = "walnascar"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \

