Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068A8C25B78
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 06:58:34 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.6731.1716620308869320352
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 23:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pNGYNMZR;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e95a60dfcdso19458291fa.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716620307; x=1717225107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jP8DQYPrVvuqYb/SaYEVW0moGHpwac4NpRGcqYdOALw=;
        b=pNGYNMZRsv0LnGzASkdqHbuRHir+2ED2ZZzlOlaJ/q0IAHxcwmuB70cJx2KN5SVsRU
         az5feSeeaz1YfR21K0rlOtoHl2A/IdAuk6xGjsFAslWefktJOsH60bhuNfkYPZGulqtt
         /IcC+DSQoq8wnP5cynKkRDLTL6Pf3UnNuWavTYxX/RRW+umHG4d+1HHKTvklTeVlhg5w
         AigFIVZgqIS4h9YXP1giRgjqNKSfkJyP0a/i4nACkle7NSigREGj/5ViP0vIXIH5/GrI
         HYUg2beqYPAD6TThomMCWJYTzhcGhUSFoXwCvOxl43EMr36oN11Fh57BiC8UksXbvwko
         B1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716620307; x=1717225107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jP8DQYPrVvuqYb/SaYEVW0moGHpwac4NpRGcqYdOALw=;
        b=G6aO04KKpd9Dm/c9/rPKAKSnBH3nrGAtZipFVl5936deMPsA3R6Y5bzUcbi7N7XwB9
         qlOow8jVzZiZUeVsqsBCggPou1F1qxigtEhDIu5lILHltrtutKQNTCgtWudz0DkwCn56
         LQf6th08gL1e0QaMPweWR+AU9sRVaGztrecvNFoGdB/mtPBV9PHm0KMztAWGzD7lCN7v
         DqN3EG+do02hFf6feuqwhR4Tle2WnXLv1Zhv2SR+hSh3k9I65StWmCbrFnZGXLhKKF8R
         limmxHOiCpcvlXXt1vAtsAWb51s+ULIYEazWSfKKOZBfZvRgORYh0jB7fEWIJ8QvCKLM
         wsmw==
X-Gm-Message-State: AOJu0YztFD7cw/oB/PW7AxoezDM1gG7M0Rs4xe2wnpIG6xkl6x14CwdZ
	E83fNCSF5HN2n1boTakBP91Wl8JWYVI348NHOOcGl3Lq4vU02Iz2wSf7nqHe3kZICvUeGkYwgjj
	y
X-Google-Smtp-Source: AGHT+IEeFmSqXCl0Uz/MLXeTQqQfAbSMb9/FGF2kfRQTlxsPftdsvMjq2cDESyOxKDC04L+smrx75w==
X-Received: by 2002:a2e:9c8f:0:b0:2e6:f59e:226f with SMTP id 38308e7fff4ca-2e95b0bce90mr26911121fa.5.1716620306410;
        Fri, 24 May 2024 23:58:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdccd22sm5704771fa.98.2024.05.24.23.58.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 23:58:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] layers: stop declaring compatibility with scarthgap
Date: Sat, 25 May 2024 09:58:25 +0300
Message-Id: <20240525065825.1073928-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 May 2024 06:58:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110528

With the UNPACKDIR changes in place the layers are no longer compatible
with the scarthgap release. Drop it from LAYERSERIES_COMPAT and limit
compatibility to styheed only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


