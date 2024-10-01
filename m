Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0ADCEACE8
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 16:23:00 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.86132.1727799778514127363
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 09:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QnTOJu79;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e06acff261so4221333a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727799778; x=1728404578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4Lu5RjRPFzM1no30FOmv7mg69o/B7UjaODoWMzUfs0=;
        b=QnTOJu79dIoenc3sXEZrH3e6fGBSFACO3kLO8MXZWZbrblqfy85sY/JJwbcO+sJhpD
         /WjDTI4g/zNHsku7Fj4JVaWd3axWkdlQls6kJXcUdgp6ZEvDg2zkrhEiEYTOz5d8EyYI
         z6I+lhU8k3/mPGNLdfS7ukEFg2AA/EVyNOxzrjgi3fp5tkIzHpwp/OEQMjZtYDKp9P8F
         FOtsLRao+9lJ8skxEWL0F9VhQJi5ycJvtSSxOavyeGW4Xi5X1PllfAWbcGpXr2wTY81Z
         HpmFhEr8WnWZ+RbXgE3q4s3Zo0h2a/84N8joGCMGHIxrr8LhSBryTMp7siuKcL53KnQI
         A1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727799778; x=1728404578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4Lu5RjRPFzM1no30FOmv7mg69o/B7UjaODoWMzUfs0=;
        b=TE1pqhvO9uFwr9TCn/8YIiwOAE+XOp2qX1+2AJVW88AcPZubsGl0BjK+3XgPsVOFif
         +VQFlu82AcGoTe//nn36/xZkU4jlUWk70OsDWG6qOFllQretiPWAOD1eChx+lHz3i9OI
         9bQhe8EYq1H9+lfRx7RkmGiCxXZ+5pNDtshxN2z/eME3DXsk1vfXfKqYqbX0xJuVI6KU
         hcjL5sqhSS5IDSKpP3N6RwO6+b49BHFaDR57LvAvYWfsJ5rxzt40xYWyeXyFXyLZfNS4
         jhsRkmeOL/CpoxRjSkVVk1Y/38nyBidxij41xtNmtDLZj9LxFl/kBuME13MQs1xR1TyX
         Lm0w==
X-Gm-Message-State: AOJu0YzmenG7E4H6p4pmDmdfoIMUeMjiYlLFUpgU3ZGcR84axQ/hKyOG
	TUjn+ilHozfCO9LkbNEt5GqeehlwT65s9e79AdZYOwHUut2xLiBsRw7eqN3e
X-Google-Smtp-Source: AGHT+IGZ6ngFEcbFXzsMvwKgbXFfKdI267MZXB7RqTMOYG8ayZ/4AzgOxveXSVXK2jrgUZ/XRuE6sw==
X-Received: by 2002:a17:90a:ae0c:b0:2db:89f0:99a3 with SMTP id 98e67ed59e1d1-2e1848f9e49mr272029a91.26.1727799777643;
        Tue, 01 Oct 2024 09:22:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::caca])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e2d6955sm13965880a91.36.2024.10.01.09.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:22:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] layer.conf: Update to walnascar (5.2) layer/release series
Date: Tue,  1 Oct 2024 09:22:55 -0700
Message-ID: <20241001162255.2725371-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 16:23:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112634

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
index 52ca5a4c0b..8a0c831e2b 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "styhead"
+LAYERSERIES_COMPAT_filesystems-layer = "styhead walnascar"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index f831de78c4..6adf7a405c 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
-LAYERSERIES_COMPAT_gnome-layer = "styhead"
+LAYERSERIES_COMPAT_gnome-layer = "styhead walnascar"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index c844085b09..e8527495af 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "5"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "styhead"
+LAYERSERIES_COMPAT_meta-initramfs = "styhead walnascar"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 0442a57a96..25e8b044a2 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "styhead"
+LAYERSERIES_COMPAT_multimedia-layer = "styhead walnascar"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index a9ba4abade..19ce3fe902 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core meta-python openembedded-layer"
 
-LAYERSERIES_COMPAT_networking-layer = "styhead"
+LAYERSERIES_COMPAT_networking-layer = "styhead walnascar"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index a254990ec5..d05f26588c 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -44,7 +44,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "styhead"
+LAYERSERIES_COMPAT_openembedded-layer = "styhead walnascar"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index fb1fe88453..057fb05b26 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "styhead"
+LAYERSERIES_COMPAT_perl-layer = "styhead walnascar"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index aaf620a433..cae3931b86 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "styhead"
+LAYERSERIES_COMPAT_meta-python = "styhead walnascar"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 08e9df505b..90a8792180 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "styhead"
+LAYERSERIES_COMPAT_webserver = "styhead walnascar"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index f131eb2704..d741d0ba94 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "styhead"
+LAYERSERIES_COMPAT_xfce-layer = "styhead walnascar"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \

