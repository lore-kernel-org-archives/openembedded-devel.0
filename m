Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC04C46467
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 16:06:22 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.67707.1672761978006450011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 08:06:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mdUV3s33;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id m18so74788653eji.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 08:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6RAKaFVKBaC3H3QjNr5U5JUa/VX2UJA8vcOI0UOE2JM=;
        b=mdUV3s33+dfadYoQ9c3i7pTVYbhnNhfpA09UIXPmHCGMrVV2tzFIYmhiN5hqsnMnaD
         bxYocSgmxrK1ggYf+hItXO6XurBl8mSoT6zfSk9Elwh9MOdK5uji63sIyfoMvgu8D2DN
         ziwcQuG8ap8BPm4+ja2G3YH2NmE7vggd/c080jVRMqEqfa/SqCR5Y/bjnmaww90iv9gn
         bRnpBthjdhs1RiYAbKKIvjjTCUUSSgMx3ITbwEgsBJfciv2orVlr74dIeSomsVnQiOlA
         juM5V7zHaFmsK9UtxKW1Cvr6Zv6waS4Tnyrni/m+sUOEmg0pl2EqFVVRo33fzxkD+LS+
         h9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6RAKaFVKBaC3H3QjNr5U5JUa/VX2UJA8vcOI0UOE2JM=;
        b=jevLhoS9+0WnJU29/CHiXi//CRbQRUbvn0FmvynpD9SQJgvX34V1NQPo7y6V9fRsoW
         7CjZizgTUi5oWWY2f9q+4Wqi+JeXZ3KXeXmRQZ//QroKSaZCTo8XkQfpE5Eyb+qPIHvd
         9tv/gEYEV8ws9DFM7gU9Ou/PRZogUBjmGnHfYEft3F6qwrtgckuN51ph4rL1r41sh8zh
         78qlpWs5R2XGRcVmFKUywVkCNBjMnHEiDV9K1+IyM9lraCIAgR//jnEF6DnJrr0Lhpda
         aLkfKJI89fCxtufr1Xd7A+3LvzGPzuUoTJiS6cAG6X3rmH9GynmlAt8F/pHd2OxlD1Xa
         RWhQ==
X-Gm-Message-State: AFqh2kpVs7jAmBF35igm6xGMCD1DnyhU+eG3HERn9flbYqYXOT4VQCQ9
	vqi7tr+DFLcpuo/SqCqCHa3/ApcNC3A=
X-Google-Smtp-Source: AMrXdXtSvURRMoQz/APViZiTWSVOXTCqu+gp5hWSYrr/uWf7utcF4EcTPYITzLt91f3NBN/vkBZBkg==
X-Received: by 2002:a17:906:65a:b0:7c1:7045:1a53 with SMTP id t26-20020a170906065a00b007c170451a53mr35445560ejb.15.1672761976421;
        Tue, 03 Jan 2023 08:06:16 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id si8-20020a170906cec800b007c0bb571da5sm14114373ejb.41.2023.01.03.08.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 08:06:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] layer.conf: update LAYERSERIES_COMPAT for mickledore
Date: Tue,  3 Jan 2023 17:06:09 +0100
Message-Id: <20230103160609.190158-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 16:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100365

* oe-core switched to mickedore in:
  https://git.openembedded.org/openembedded-core/commit/?id=57239d66b933c4313cf331d35d13ec2d0661c38f
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
index 205768e637..9602aa9e1a 100644
--- a/meta-filesystems/conf/layer.conf
+++ b/meta-filesystems/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_filesystems-layer = "1"
 
 LAYERDEPENDS_filesystems-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_filesystems-layer = "kirkstone langdale"
+LAYERSERIES_COMPAT_filesystems-layer = "mickledore"
diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index d4d167d0fe..d7286edab5 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_gnome-layer = "1"
 
 LAYERDEPENDS_gnome-layer = "core openembedded-layer networking-layer meta-python"
 
-LAYERSERIES_COMPAT_gnome-layer = "kirkstone langdale"
+LAYERSERIES_COMPAT_gnome-layer = "mickledore"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   faenza-icon-theme->gdk-pixbuf \
diff --git a/meta-initramfs/conf/layer.conf b/meta-initramfs/conf/layer.conf
index 6aa64f1e18..b4cd74398d 100644
--- a/meta-initramfs/conf/layer.conf
+++ b/meta-initramfs/conf/layer.conf
@@ -16,7 +16,7 @@ BBFILE_PATTERN_meta-initramfs := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-initramfs = "5"
 LAYERDEPENDS_meta-initramfs = "core"
 
-LAYERSERIES_COMPAT_meta-initramfs = "kirkstone langdale"
+LAYERSERIES_COMPAT_meta-initramfs = "mickledore"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   dracut->virtual/kernel \
diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index ee6694cdf8..5f9f471428 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -31,4 +31,4 @@ LAYERVERSION_multimedia-layer = "1"
 
 LAYERDEPENDS_multimedia-layer = "core openembedded-layer meta-python"
 
-LAYERSERIES_COMPAT_multimedia-layer = "kirkstone langdale"
+LAYERSERIES_COMPAT_multimedia-layer = "mickledore"
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index fd28f30033..c643e889c0 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -16,7 +16,7 @@ LAYERVERSION_networking-layer = "1"
 LAYERDEPENDS_networking-layer = "core"
 LAYERDEPENDS_networking-layer += "openembedded-layer"
 
-LAYERSERIES_COMPAT_networking-layer = "kirkstone langdale"
+LAYERSERIES_COMPAT_networking-layer = "mickledore"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 6a0f05d930..a1f50879e8 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -42,7 +42,7 @@ LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
 
-LAYERSERIES_COMPAT_openembedded-layer = "kirkstone langdale"
+LAYERSERIES_COMPAT_openembedded-layer = "mickledore"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-perl/conf/layer.conf b/meta-perl/conf/layer.conf
index 007ae2fbd5..98948fdc8d 100644
--- a/meta-perl/conf/layer.conf
+++ b/meta-perl/conf/layer.conf
@@ -15,4 +15,4 @@ LAYERVERSION_perl-layer = "1"
 
 LAYERDEPENDS_perl-layer = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_perl-layer = "kirkstone langdale"
+LAYERSERIES_COMPAT_perl-layer = "mickledore"
diff --git a/meta-python/conf/layer.conf b/meta-python/conf/layer.conf
index 481e4ea2cc..1d408e8d24 100644
--- a/meta-python/conf/layer.conf
+++ b/meta-python/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python = "1"
 
 LAYERDEPENDS_meta-python = "core (>= 12) openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python = "kirkstone langdale"
+LAYERSERIES_COMPAT_meta-python = "mickledore"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
index bfcd9681c0..938090b0e1 100644
--- a/meta-webserver/conf/layer.conf
+++ b/meta-webserver/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERVERSION_webserver = "1"
 
 LAYERDEPENDS_webserver = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_webserver = "kirkstone langdale"
+LAYERSERIES_COMPAT_webserver = "mickledore"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 5785421aa8..9b797d86f6 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -19,7 +19,7 @@ LAYERDEPENDS_xfce-layer += "multimedia-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
 LAYERDEPENDS_xfce-layer += "networking-layer"
 
-LAYERSERIES_COMPAT_xfce-layer = "kirkstone langdale"
+LAYERSERIES_COMPAT_xfce-layer = "mickledore"
 
 SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += "\
   openzone->gdk-pixbuf \
-- 
2.39.0


