Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD74C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 02:15:00 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.2690.1645582499396228147
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:14:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f5EiKfus;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 12so15024742pgd.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 18:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ap9ilAsr1kaBx/xy6wwVPtFOaiDbV3+JQavbpSLNlqA=;
        b=f5EiKfuslSqslRAaGoedcLdYbLuK0WObEXRtuF9CYM7eMiI2hqRRDqri7klCoBjNAC
         JsnM6K0Lj5TTLLynueOZYSd2o/jEAIKpuBTvGwGlHOIQXYnoIzTJ7fXvcYLILgjRskUE
         1f3FS8gKXXpmtESwDn/QEqqwg+9tzyh4V1Pw0OR/xgBhy8p+31mIinP7C5uL9tdiRPTk
         iQlVivAFpgFT9VVmd7CDoKrr1J3px9FfhcnPdUdeO2sPTOjgm3OygNU6ei5k32+e0tPd
         gkfLuT37C0HJYoNrHPuqsWWhO0jkADpw66ggYTa0jV2FkHCbnaACj5i9Hqc9rhS/OS2K
         r9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ap9ilAsr1kaBx/xy6wwVPtFOaiDbV3+JQavbpSLNlqA=;
        b=0cvbtbwHYxTQBjJ6/zYjzzQ6tr8xXRK4Cuc1jQ/gMRpGfhfJhnva0jokeCK/hoEhEI
         rEWN2zzQSU19xqr8HjFVYV+YCJ1ju4lyYR/4Hy1IfWWF63L8Y7Q//t+TsQi94z8hRP1L
         ZnszS+jhv/aj7j+ZNTzA/oZMm3/M34pHk0pF6WK0A/+jtY7ooWaz/xUBlqIxQLAjD6+W
         gwiCtoCYduTRC1cd9ENweQ5+c8K5guYeb2v2fL/LvNOwQwoiq+2dZeeVOPsLLcBJXG8m
         gmH89ifKP6DP1brb0vCuvvW2QrB9LxUQkPzqGd7aeDmPkOSDIHILEgqK1nflmUYGu/oR
         j1qg==
X-Gm-Message-State: AOAM531WdKpq7MyaJ1Ok8EY3rTldOxJPrk/6CIpYObjXpZyjvOYP7Mac
	5Gtm91YazUXjXbVv38oF6J1ugLxFhVjDng==
X-Google-Smtp-Source: 
 ABdhPJzJ3f/Pwem0s2VrHkz4Vaw20H2Mc/THEQtIxh8tgtJ8eNPud7DxwwFhVmbKVlVIiJ2RghGDng==
X-Received: by 2002:a63:2b4d:0:b0:36c:7c39:b66c with SMTP id
 r74-20020a632b4d000000b0036c7c39b66cmr21899780pgr.583.1645582498363;
        Tue, 22 Feb 2022 18:14:58 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 e15sm19004159pfv.104.2022.02.22.18.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 18:14:57 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] all layers: LAYERSERIES_COMPAT => kirkstone
Date: Tue, 22 Feb 2022 18:14:48 -0800
Message-Id: <20220223021448.2395926-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 02:15:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95459

Upstream oe-core is now testing for 'kirkstone' compatibility which
breaks any CI for meta-openembedded layers,

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
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
index 6a9357d2a9..b5f59d9bac 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "honister"
+LAYERSERIES_COMPAT_filesystems-layer = "kirkstone"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index d2ee3e0692..3f6b4f7b76 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer"
 
-LAYERSERIES_COMPAT_gnome-layer = "honister"
+LAYERSERIES_COMPAT_gnome-layer = "kirkstone"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 11dd43178e..33e61d333f 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "8"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "honister"
+LAYERSERIES_COMPAT_meta-initramfs = "kirkstone"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index 56c3569d00..1fe9c80330 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "honister"
+LAYERSERIES_COMPAT_multimedia-layer = "kirkstone"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 67fcda3d99..3f9699ad18 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
-LAYERSERIES_COMPAT_networking-layer = "honister"
+LAYERSERIES_COMPAT_networking-layer = "kirkstone"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index d25db911ce..93f3dc5807 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "honister"
+LAYERSERIES_COMPAT_openembedded-layer = "kirkstone"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 6a2dd7ff95..4f075e9a92 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "honister"
+LAYERSERIES_COMPAT_perl-layer = "kirkstone"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index ffad953f93..98f734152f 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "honister"
+LAYERSERIES_COMPAT_meta-python = "kirkstone"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index 46d5a872a1..312c39b3b3 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "honister"
+LAYERSERIES_COMPAT_webserver = "kirkstone"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 81e7dc5ad3..be58708679 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "honister"
+LAYERSERIES_COMPAT_xfce-layer = "kirkstone"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.30.2


