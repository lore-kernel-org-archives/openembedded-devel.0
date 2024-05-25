Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30DD5C25B78
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 07:06:25 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.7012.1716620772525862346
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 May 2024 00:06:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p4Db0ZXv;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e9684e0288so2171551fa.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 May 2024 00:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716620770; x=1717225570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6zcl/1F/mVO07HxrN1dS6e0y1iijstVyCYUhCqG4vd0=;
        b=p4Db0ZXvVayRsUXQwycd2ItITTWUTr6KqsVqTBWhG8mrz74n015PCOYpmmYS3S5pWb
         WoI4VvLx48JLPzJqj8PsoltfXjrn+/aNBeGDRDX3ITza7XXc9l5UJXF0BonQOvUvIIoG
         hJ+Reab0yDG9kHVZucIDnSV5sinLEJ3nwLosLBGb6xT6N9UuZCaWKcRtTmPuOPmaKWuk
         EA+vlM68q+1Pra5cZ4p3y7Dnq3fwXnVeG88h5BKx20oeMDnrNKFeD3fmiiBRJSmoX5mE
         7rAIVjkI4x+WfajxPcs+SIhJGrVCxntLUx47gCikKPUlIqmWm++py26KJoKlB1DaqbR9
         L1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716620770; x=1717225570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zcl/1F/mVO07HxrN1dS6e0y1iijstVyCYUhCqG4vd0=;
        b=QUVNMIu+/IfB6Y10r4sp6Ud/Ufo5CPryHRHc23r9ziM55EYEpqn/yqOiQ1kCIeYv/N
         gxl46WtYv5KDu7LcSVWgG14MUlqr+tVSaN+7bcxwY6pyX3/9hU1VISSkZXxFbplWXX+1
         DicCFBJWuHk66heurfJVVVKNhajRD8K88j+FhBJDws33eirXLiJ/UapVK2NxavKB3D/z
         n0ox5bovqTtX8Sh9Yk6m0a6iraGF33t9qzMHTrAS84sIwnzlrTRycgiSz8OBConVeqy7
         +JFbOFwRJxe4UsQJO0dZaQhB8QZ08ojsm8cCuEQGTW2mTRFoTE7ADwW4deMRQXGgtCzl
         qLBQ==
X-Gm-Message-State: AOJu0Yz/yOL0SVQh97K88fBdtKygX6M6UksfYR7fwHgJShPriPzNlN0K
	OtjfqQ686dgV6scCMBesVc20YGu6gHMFuaC4AZZEoBKdjTlxJQ5+0Zd7E5kNARFVqr4haLzy17t
	s
X-Google-Smtp-Source: AGHT+IEBT2cUml0/ASEQXXwQx5nSScAQr965aqYbGqhZ9MA/wNwD2Z8qXpNwWrCewvnzgJBWN0uSVA==
X-Received: by 2002:a2e:b00a:0:b0:2e5:4007:16e with SMTP id 38308e7fff4ca-2e95b255599mr39294681fa.32.1716620770220;
        Sat, 25 May 2024 00:06:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcc4a6fsm5860591fa.6.2024.05.25.00.06.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 00:06:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] layers: stop declaring compatibility with scarthgap
Date: Sat, 25 May 2024 10:06:09 +0300
Message-Id: <20240525070609.1600488-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 May 2024 07:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110530

With the UNPACKDIR changes in place the layers are no longer compatible
with the scarthgap release. Drop it from LAYERSERIES_COMPAT and limit
compatibility to styhead only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Fixed typo in the commit message (thanks, Martin)

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
index 2e220bfe2468..52ca5a4c0b36 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "scarthgap styhead"
+LAYERSERIES_COMPAT_filesystems-layer = "styhead"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 89659592ee6b..f831de78c433 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
-LAYERSERIES_COMPAT_gnome-layer = "scarthgap styhead"
+LAYERSERIES_COMPAT_gnome-layer = "styhead"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 93ae527d4214..c844085b09bf 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "5"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "scarthgap styhead"
+LAYERSERIES_COMPAT_meta-initramfs = "styhead"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index b7866cbe8cd6..0442a57a968a 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "scarthgap styhead"
+LAYERSERIES_COMPAT_multimedia-layer = "styhead"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 0e09d8f2ad9f..a9ba4abadeed 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -15,7 +15,7 @@ LAYERVERSION_networking-layer = "1"
 
 LAYERDEPENDS_networking-layer = "core meta-python openembedded-layer"
 
-LAYERSERIES_COMPAT_networking-layer = "scarthgap styhead"
+LAYERSERIES_COMPAT_networking-layer = "styhead"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index d8f0f5339aed..77855dc659e8 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -44,7 +44,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "scarthgap styhead"
+LAYERSERIES_COMPAT_openembedded-layer = "styhead"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index e20c8471e051..fb1fe88453c6 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "scarthgap styhead"
+LAYERSERIES_COMPAT_perl-layer = "styhead"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 998f492a49cb..aaf620a433ee 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "scarthgap styhead"
+LAYERSERIES_COMPAT_meta-python = "styhead"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 717bfda471d9..08e9df505b60 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "scarthgap styhead"
+LAYERSERIES_COMPAT_webserver = "styhead"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 0c7990e8e094..f131eb270406 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "scarthgap styhead"
+LAYERSERIES_COMPAT_xfce-layer = "styhead"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.39.2


