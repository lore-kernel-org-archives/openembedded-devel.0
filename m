Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9620DC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 22:07:40 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.2884.1651097259564959558
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 15:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iMXCRZdD;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id z21so2471058pgj.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Apr 2022 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayPyK8V9kTO7T+w1N3bpSs27q7xQ4zo9pbBrJTV98Ig=;
        b=iMXCRZdDWgjzHTKKPwProOt3+Ef9LZTwdKf/PknKVMtaVIMvuuMhlHhBA166dawW9f
         2lhMruKJB/RAHUE2fbuwkH+4ZDEeNZZ/cg2P4tYc9bNdVk/XXVVJUQrCdq5mNfA+MZfU
         5oSKPy6MNFtz9odncqyVWC98Vk9GNVVmy0gE2xpZ8gAu+LHykvYqf71U/0f/Kj9vzBGj
         JZ3QyPjdpL5Rt0QfABxk2eL/eETsD1CHu/gttTNL7VpZXbgKxBhKrahG7MoZ5CKcnf2d
         c0iZ8FXFrBosbhjBauln9wVkOI3sLfCy561HpcuFsQrnkeEMHdKYHGu60y11KwSjHtZO
         EHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ayPyK8V9kTO7T+w1N3bpSs27q7xQ4zo9pbBrJTV98Ig=;
        b=DjvCZ/BJtgVKKig9zvmiVR31CTVM79u+v7+cMc5Zi9Mll2sUboy//tIfDtfADwf2Vo
         IeBD4A5xqAgTYruere3Zj2wnf1ruOuHhcXcPWmrIeVWvwVU/zVONdarnPZ/r8ucc6glD
         0NHFHZmXSUSZKa6W/gn1zRgEdQdLL5djRvUdEMzmi76pPM1hbCHSBOLsPZqr2lgmDzIz
         Prr1/pwMPHdN66oS1Js8K5/9Fe+YwPUx5eaAOikzKblfOms0lVTdT12O8MWI7rRbjovB
         FiIpHSyWFWLyjmJoeQ1xB6s+EpPGLKggTiX56LvZQPjqmqEPURYn61U1Arw6mF3lXDLg
         NVSQ==
X-Gm-Message-State: AOAM530naCJDHNV5DQr0wi/rsmPlZFnGJ+Q2foOkT54ZvUf3+bD6kD3n
	EZ5yjQiIKq/TU8k9PA6docn146IxNgg=
X-Google-Smtp-Source: 
 ABdhPJxRtiVF3/DeNC8v12rBnEz/s9x14nZko6nTfo8V9TOxu24RBa+C6Wo93D6DyqfQX3ouvSoFdA==
X-Received: by 2002:a63:4:0:b0:3ab:17c6:e0ce with SMTP id
 4-20020a630004000000b003ab17c6e0cemr18035973pga.511.1651097258651;
        Wed, 27 Apr 2022 15:07:38 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:b03c:3cc:dc2d:de8e])
        by smtp.gmail.com with ESMTPSA id
 o3-20020a63f143000000b003c14af5062asm289229pgk.66.2022.04.27.15.07.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 15:07:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] layer.conf: Post release codename changes
Date: Wed, 27 Apr 2022 15:07:37 -0700
Message-Id: <20220427220737.3807846-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Apr 2022 22:07:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96813

Post release add langdale to match core

Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 75a27d665..205768e63 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "kirkstone"
+LAYERSERIES_COMPAT_filesystems-layer = "kirkstone langdale"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 2fb348515..bf4834aa2 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "kirkstone"
+LAYERSERIES_COMPAT_gnome-layer = "kirkstone langdale"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index c63383faf..6aa64f1e1 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "5"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "kirkstone"
+LAYERSERIES_COMPAT_meta-initramfs = "kirkstone langdale"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index b5120bb53..ee6694cdf 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "kirkstone"
+LAYERSERIES_COMPAT_multimedia-layer = "kirkstone langdale"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 3f9699ad1..a4f622a8c 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "kirkstone"
+LAYERSERIES_COMPAT_networking-layer = "kirkstone langdale"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 88715d5e8..34aa29561 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "kirkstone"
+LAYERSERIES_COMPAT_openembedded-layer = "kirkstone langdale"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 3cb9571d4..007ae2fbd 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "kirkstone"
+LAYERSERIES_COMPAT_perl-layer = "kirkstone langdale"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index e444498ff..481e4ea2c 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "kirkstone"
+LAYERSERIES_COMPAT_meta-python = "kirkstone langdale"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 5ae5e796a..bfcd9681c 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "kirkstone"
+LAYERSERIES_COMPAT_webserver = "kirkstone langdale"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 28dfc5b34..5785421aa 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "kirkstone"
+LAYERSERIES_COMPAT_xfce-layer = "kirkstone langdale"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.25.1


