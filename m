Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5071EC8748
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 09:58:16 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.33395.1694339886293617199
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 02:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=jJjNiraX;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-502b1bbe5c3so847519e87.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694339884; x=1694944684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wOx02awlfqdI8jNLUOdvelolojKq4ssnZxXcGc1LueU=;
        b=jJjNiraXkwN+kYT6iZb1moJCn90fdIPFGOPOQK6e/fD/SQIoiK+KUNfd+rr5aBD6Wg
         L5PaUpmjTNTz8VQvIKC4f+zCsVSbvc+jYfCrKQmCVgMh2/qTP7JPHD31imCOnMC2yeyj
         qxATcOmwGcBCXbsDAfR6TTXpbruPOcE7Z9nPx+DbBPwqpnHEAk/7yqmOn9flCXjtIxqG
         8nqYrmf7o22g0BroGRxSddbbq94KKD4+cXE0bf/999QjKplNxrwzXUPOz4v24cH2PBAT
         /zpwkivNb6IgrXPSwFxN8OfU8XRsaWfM9qrzMFLLBL6MWdzWEfsfYjyAJeGTNaD3VyaM
         hLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694339884; x=1694944684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOx02awlfqdI8jNLUOdvelolojKq4ssnZxXcGc1LueU=;
        b=kBD7iG27AAisbqYUNA3Glxca/G6KYRHckq0kcITSMAoi1HGSSXwR1zskBUedF4SF/j
         hyJMhDir1IqKAISM0+1BE0M0pNUFBUj4pVOrhA41ksUirzBxUyTrK3HTHtVuHEvnAZ0S
         5PE4FaIRNm31LNAAS5qxrXycuWq6uT3zRtMosFTM5kitf1XeOIDEpnRWgV4qtVt9M+VE
         cmhG21mxgi+5m7ItR2+VIcmK6NKnaFWpVq1vjXnDWF6fmYIkN3pLiloYphkZpYtoRbgC
         TBzKuFamsXCyfANawm1rEj+U8f8Ce+I1Fo3cEYz39w+r0Njn0mQ2qkavJSYsXzGulokA
         RE/w==
X-Gm-Message-State: AOJu0Ywf/dsBLbPJHFzavaC+/Gh9yZmp3EHhf6VpgvIGJI6ob9JrMGfb
	IAAoOK4qHHdPWy7S9thEl9udGIB8je4=
X-Google-Smtp-Source: AGHT+IFtcJbuM9SFWHyaGVjU8L9YjHV5Z0hqPbf0CkkR+JBLCuxI5VC9aLiOwJjI6YqrsSaX475GfQ==
X-Received: by 2002:ac2:4f06:0:b0:4fe:7e7f:1328 with SMTP id k6-20020ac24f06000000b004fe7e7f1328mr5577586lfr.16.1694339884087;
        Sun, 10 Sep 2023 02:58:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id se22-20020a170906ce5600b009920e9a3a73sm3621758ejb.115.2023.09.10.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 02:58:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] layer.conf: update LAYERSERIES_COMPAT for nanbield
Date: Sun, 10 Sep 2023 11:58:01 +0200
Message-ID: <20230910095801.1880904-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 09:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104821

* oe-core switched to nanbield in:
  https://git.openembedded.org/openembedded-core/commit/?id=f212cb12a0db9c9de5afd3cc89b1331d386e55f6

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
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
index 9602aa9e1a..318e992628 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "mickledore"
+LAYERSERIES_COMPAT_filesystems-layer = "nanbield"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 324d8b8c6e..acebb12892 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
-LAYERSERIES_COMPAT_gnome-layer = "mickledore"
+LAYERSERIES_COMPAT_gnome-layer = "nanbield"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index b4cd74398d..ef12daf53f 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "5"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "mickledore"
+LAYERSERIES_COMPAT_meta-initramfs = "nanbield"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 5f9f471428..99f4987179 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "mickledore"
+LAYERSERIES_COMPAT_multimedia-layer = "nanbield"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 5716eb3f22..12ce08c8a1 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -16,7 +16,7 @@ LAYERVERSION_networking-layer = "1"
 LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 
-LAYERSERIES_COMPAT_networking-layer = "mickledore"
+LAYERSERIES_COMPAT_networking-layer = "nanbield"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 923b722b3c..e5970cf251 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -44,7 +44,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "mickledore"
+LAYERSERIES_COMPAT_openembedded-layer = "nanbield"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 98948fdc8d..1b130b9e60 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "mickledore"
+LAYERSERIES_COMPAT_perl-layer = "nanbield"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 1d408e8d24..add78013b9 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "mickledore"
+LAYERSERIES_COMPAT_meta-python = "nanbield"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 938090b0e1..066165b5d4 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "mickledore"
+LAYERSERIES_COMPAT_webserver = "nanbield"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 9b797d86f6..aeaf9617ee 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "mickledore"
+LAYERSERIES_COMPAT_xfce-layer = "nanbield"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.42.0


