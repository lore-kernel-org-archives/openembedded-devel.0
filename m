Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58603C54798
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 01:24:34 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.10718.1709861072240614263
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 17:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c+bCPLB+;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-22002fbbd6bso725897fac.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 17:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709861071; x=1710465871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUcrMXOkSHDD7BchTmEEqoqprDtsVmWjPGUMrrNRF1o=;
        b=c+bCPLB+3zVYtoKMF6VqEvw08Y/9XbEgHiDH1eFzpGNJq7WgirRVMlhKTxQDQQ1ENZ
         lUeDnrUzjJTUK/RpT4GpXUDK/kdO7Z743w5s0Mkg3+4xl0/st4w120DBJhik7475+GH/
         Q5LhJlbDez6ICB/NNH353wkYMElSknnwr0Z/OFseURnJvVvDxMvBCoApET+hr7NHkLIb
         w/aeujZU91E0RuFlOtCGaCsqSXsviDsl9E0o042DJ4XmgIvCBwu8oZNGw/2Yiq4gyyJv
         hh1Ctk67JmQn7Fvp7EXnEzXqLkxuljEY0PNa4m+ZOxhKOTMMIvpeIrB2pp/a1lMCs1e4
         cSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709861071; x=1710465871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUcrMXOkSHDD7BchTmEEqoqprDtsVmWjPGUMrrNRF1o=;
        b=h3rK16AW3Y110ToNYYgYwtUCT1OAWxHmypfhqvLyTCE2J7s7oc+pfTPNEHk4OiGkvG
         4boWZJCGMyvEG4P6BPM0A51xOxelSFcDyasZQHNAjlGHcmO61fkbl6I02Nhu7/OEGD74
         yUry4DWSippSmf6WWDUCRYI1cPM6Rozw3oFeLpcmX8/df2oFxd8jAIJBlH+D+yxmj6mt
         Z2QkeKpq5GQhaLeksszGPlngL6IqSrVYHGCymKR63VVoGJKT2VHlHPnlWatvrdHRK9KH
         pZAUgdH6c2OAAy/yrz7PW/TGm8kryGAwgPK7RCSZf8ZDTp5xkDxDOOiNXJy44RR42YQr
         FE8w==
X-Gm-Message-State: AOJu0YxAKosTZLADB5a6cC2p+a9uNaYdzbsze9tFQQ8mRZfokWMhFK4E
	tLt/aO86//96RklsWVzYDV7DEwpjjlDXqw1TZtUZeww4YfQRMHYK0sXMY7u6
X-Google-Smtp-Source: AGHT+IGeybXEcTsX6fP9iqT+C4IRtwz4V6JRs1Q1RfOrYqKnMIMD+tq8ZCqV9mrn+4nS4aRb0n5nfA==
X-Received: by 2002:a05:6870:4c13:b0:221:491b:28dc with SMTP id pk19-20020a0568704c1300b00221491b28dcmr1907154oab.41.1709861071150;
        Thu, 07 Mar 2024 17:24:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id k4-20020aa79984000000b006e559bc3250sm10649731pfh.68.2024.03.07.17.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 17:24:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/5] layer.conf: Update for the scarthgap release series
Date: Thu,  7 Mar 2024 17:24:23 -0800
Message-ID: <20240308012429.577792-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 01:24:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109212

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
index 4f13bd911c..c2263c899b 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "nanbield"
+LAYERSERIES_COMPAT_filesystems-layer = "scarthgap"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 1674283d51..75764e64c7 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
-LAYERSERIES_COMPAT_gnome-layer = "nanbield"
+LAYERSERIES_COMPAT_gnome-layer = "scarthgap"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index ef12daf53f..25023cfc64 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "5"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "nanbield"
+LAYERSERIES_COMPAT_meta-initramfs = "scarthgap"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 99f4987179..82e6f3629f 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "nanbield"
+LAYERSERIES_COMPAT_multimedia-layer = "scarthgap"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index a9088eece4..ac5d15a0c0 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core meta-python openembedded-layer"
 
-LAYERSERIES_COMPAT_networking-layer = "nanbield"
+LAYERSERIES_COMPAT_networking-layer = "scarthgap"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 732a7e5d01..4d9acb8cc8 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -44,7 +44,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "nanbield"
+LAYERSERIES_COMPAT_openembedded-layer = "scarthgap"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 1b130b9e60..20a6a4239f 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "nanbield"
+LAYERSERIES_COMPAT_perl-layer = "scarthgap"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index add78013b9..f48b28b958 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "nanbield"
+LAYERSERIES_COMPAT_meta-python = "scarthgap"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 066165b5d4..c0896f1a2d 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "nanbield"
+LAYERSERIES_COMPAT_webserver = "scarthgap"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index aeaf9617ee..944bd57d1f 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "nanbield"
+LAYERSERIES_COMPAT_xfce-layer = "scarthgap"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.44.0


