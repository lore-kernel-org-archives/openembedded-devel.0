Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66221C369AE
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 01:03:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.1836.1744419793566965977
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Apr 2025 18:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MzRPhJvE;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225477548e1so26437345ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 18:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744419793; x=1745024593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BGkxzm+k9lIE5mv5kyV3UfAlOQTIz70WanWCUrDc+Eg=;
        b=MzRPhJvEU9qJjs0qEn7Z2q+FWPaSjHg8lvtnXVR/N0QqbrfGPLjoBbbV6KGlpiVr5f
         Gu/6EWrSGFTp/ZiXp3c6MjeivHqhf9apQBmlG5VbXSDDSRtEOHNgcqSMdw/s5LimhrzZ
         ncezoS/6sLfLoJtG/yfrGN8ViV/5hz8HDMjn31L58fS1TTSmUhGCCptEBW701v0sfilo
         PlydZB3sIVcnJzwpQx84Y2txvEyTX4pTxpM/xLbEVoIx9vGnGWkrT2d+nbG0cfZE3udW
         DmsCqImqbECtmvQ81bcORJ8NoNnToh9ns7oob95dcquYllJNOS5zcNvG6JtVuCXY2h2y
         cF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744419793; x=1745024593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BGkxzm+k9lIE5mv5kyV3UfAlOQTIz70WanWCUrDc+Eg=;
        b=dYjolYV5d80Eyrrn6aX4hplkld6Y5gNi+H2/IDqxIuT6+8UTmBSrJm95AvDs2+2aCh
         6U2akXJa6l940zAisn529eixGeevuy0rXkLjWml0A57kdk6J7FjEyK3vMn3UvuYhxSM/
         EfeD6p1ulpRXwabpdcql38KHyL8HNiGgO1t5eRSRsvJKjKPUITZmalYcMtvMhxxcyk8q
         HbPrAlP6cMmQkvvdebdZGDSVmsh+UJTOKmzbDtEoqqpYWwbc2e6BfVqXnpQL69z0g+U9
         L6LKe3/ppGrutE6KuBL04T1AvwwqgTcxl6iwM8ODTITOgxNBaOBMpOUhse9lwlpYrmsV
         jJSQ==
X-Gm-Message-State: AOJu0YzDo60tZb+IjX7N2JTlzj++4NqCmzbcm2BehEwpuLoJKp/l5sBe
	SZQpAxfZf3Ckso6nTq35dyhD5X3TjtpdzTdznHS4yKYd0j/ppLq8JIy876jX
X-Gm-Gg: ASbGncu0gkv1aALix4iBNxhU1h9BziEl3AniQ3aG2LO/d6UILfrerffP8vEPhiodU20
	h9qglcCguKahFlcCCpcbwt+F/j9LaMxz13nEVGglhs7Wsf6nsgJYSm6kgHVaCgngmu30r0ExfOI
	S//MCAoiMLAyD1TT+1TQio8IE2pOiEPvjBH9p91w9YCJEecwnr4QVYWqMWjEGCKARGC8Y1Uhds4
	yAdF61hA1h1PrCuJD2BACFoRdH+CsuUiUcckN0pInjc98W6O3nI+8Cb7hwgKs6aNwi9tl+lAfzz
	8pKkoYLKacYlstQmTM+dTCd4ibROkceG
X-Google-Smtp-Source: AGHT+IFcUny/MrGI2mc0AwF7gRZzuhIxnVPaS98vBQrEeuCJqm8vvDH4NnZvWPbn4xgaarmk4a9vCw==
X-Received: by 2002:a17:902:ebc2:b0:220:e63c:5b13 with SMTP id d9443c01a7336-22bea4fd043mr67943355ad.46.1744419792312;
        Fri, 11 Apr 2025 18:03:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::7ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c9929csm57010645ad.112.2025.04.11.18.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 18:03:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-openembedded][PATCH 1/3] layers: Add whinlatter (5.3) to compatible layer series
Date: Fri, 11 Apr 2025 18:03:08 -0700
Message-ID: <20250412010310.1167351-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Apr 2025 01:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116801

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
index 007be777f4..5083a29476 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "walnascar"
+LAYERSERIES_COMPAT_filesystems-layer = "walnascar whinlatter"
 
 BBFILES_DYNAMIC += " \
     meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 64ecc462a1..d6c59a80d6 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
-LAYERSERIES_COMPAT_gnome-layer = "walnascar"
+LAYERSERIES_COMPAT_gnome-layer = "walnascar whinlatter"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 0ca5c5a369..6d495a6fb3 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "5"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "walnascar"
+LAYERSERIES_COMPAT_meta-initramfs = "walnascar whinlatter"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 9e351673a6..5c9b8fe48b 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "walnascar"
+LAYERSERIES_COMPAT_multimedia-layer = "walnascar whinlatter"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 85a207bc8d..232d9d4480 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core meta-python openembedded-layer"
 
-LAYERSERIES_COMPAT_networking-layer = "walnascar"
+LAYERSERIES_COMPAT_networking-layer = "walnascar whinlatter"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 2f4b9c4027..bc0d68f156 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -48,7 +48,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "walnascar"
+LAYERSERIES_COMPAT_openembedded-layer = "walnascar whinlatter"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 0511263d22..33f0822ec0 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "walnascar"
+LAYERSERIES_COMPAT_perl-layer = "walnascar whinlatter"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 10a1647016..261c38e89c 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "walnascar"
+LAYERSERIES_COMPAT_meta-python = "walnascar whinlatter"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 3a264610f1..16d72a7a56 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "walnascar"
+LAYERSERIES_COMPAT_webserver = "walnascar whinlatter"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 043f290e98..0b7a359175 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "walnascar"
+LAYERSERIES_COMPAT_xfce-layer = "walnascar whinlatter"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \

