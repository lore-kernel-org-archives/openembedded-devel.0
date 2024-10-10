Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71338D24447
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 19:41:44 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.53454.1728589299382208609
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Oct 2024 12:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hHNfjgbU;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c87c7d6ad4so1693045a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728589297; x=1729194097; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JflaVHVJWMO4+mf80g3ENNKelFzOzpDO+ayRN2ro8Xs=;
        b=hHNfjgbUnbhIT4SUipG1+BKO3po4zzIQ7A+Rfq2qZvOAaJIFhUc+PoRnTU9BrwIqXd
         ejXQbwIxnHffvbhGw+izoekx4sf1kCU1OSDpr1N871sNIeawlj+RV/u/6nu15xjzT5fn
         vNIjD94BDyIYTrJ/co8jd5g6kgRx2wU3LCYC2NcKSpml/xnUjFfs75g20TJiMQSTow5s
         tiGaUOxom3uLQRSdRduU1HT8v8ivqbzU34cXbPG8tzmAJFcBm80CeiKpwqZP0uOXFPQg
         CZkbg19vgMsISc45MUZCffvmq1XYDoLiatDRc+gdunx6jGbTE/J86/UZ8sHzbMfqlZ4c
         6PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728589297; x=1729194097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JflaVHVJWMO4+mf80g3ENNKelFzOzpDO+ayRN2ro8Xs=;
        b=w+B/Xzxme6ZL5NU+tEg8SZeA0v/JeDwPW42RNebPyJM13pKdeNZBiHGfxUK/XKIz+1
         zNV748uZeC5sZ+Eyswau1RT42lsbMjaT0q9kH3KgEJwecieanZjzpjhdQb1j2akoSpkw
         QE1JIyIStVTdTd//XkEurfPI1+GQGLkNRSoebDI3NkX9Y7RxOUWmXOYIJWy75zATrvyf
         WvTXF98rMAeJseqHUkRSR/WbLE1yK43tOUCdXHOorti46Y8Ro8iiC49PicSfRBc7+rEG
         koNN3TXpS4ppEJfBEZUsnHeui6mtpHh8xAAA7vVdmoEPHLy+Ogkk8DBBExIqWNgUBLQP
         F++A==
X-Gm-Message-State: AOJu0YxTRsxKP7aXl85g5RHT/tYoAx2oO07Vmwy2bTTW80hAQVGL47zn
	ZbCwc790RkFXn1RS94M290EY8XIVc/T442WrARvYgK99ft0dHE4NSInVVg==
X-Google-Smtp-Source: AGHT+IFwORSw0gMy6s0tQYqV8WOPcpC6vTgWK/o+ljLYwatta2x4XWoVXCffnVxEq2LIv9rkWjrXWw==
X-Received: by 2002:a05:6402:2349:b0:5c5:ba82:c3b1 with SMTP id 4fb4d7f45d1cf-5c91d665944mr6053795a12.29.1728589297108;
        Thu, 10 Oct 2024 12:41:37 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93729675csm1177163a12.83.2024.10.10.12.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 12:41:35 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH v2 2/2] python3-pychromecast: upgrade 14.0.1 -> 14.0.2
Date: Thu, 10 Oct 2024 19:41:16 +0000
Message-ID: <20241010194114.107827-4-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241010194114.107827-2-t.f.g.geelen@gmail.com>
References: <20241010194114.107827-2-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 19:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112778

Changelog:
https://github.com/home-assistant-libs/pychromecast/releases/tag/14.0.2
Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../0001-Allow-newer-version-of-wheel-and-setuptools.patch    | 4 ++--
 ...-pychromecast_14.0.1.bb => python3-pychromecast_14.0.2.bb} | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.1.bb => python3-pychromecast_14.0.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
index 447f67907..3d5d043f1 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
@@ -1,4 +1,4 @@
-From 5ee73f91b7f13dd5c700c69e7fc43cecab5868da Mon Sep 17 00:00:00 2001
+From 41da1605df6d781bdf01c0ecefea88bba7758c21 Mon Sep 17 00:00:00 2001
 From: Tom Geelen <t.f.g.geelen@gmail.com>
 Date: Sun, 7 Apr 2024 22:39:35 +0000
 Subject: [PATCH] Allow newer version of wheel and setuptools
@@ -10,7 +10,7 @@ Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 56df5bd..17ca62d 100644
+index 545297e..84a92c2 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,5 +1,5 @@
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.0.2.bb
index dee4bf6eb..5a51d2e13 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
 SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
-SRC_URI[sha256sum] = "e16e0a7f9488319191b8b4fa21ca0beb4bf12eeda5c9bf640241188f2bea0a3e"
+SRC_URI[sha256sum] = "092c65f421991bca565338bc61a0c14861c47e0f5c0a65919a5e93f02dfd071a"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.43.0


