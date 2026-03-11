Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71775112586B
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:04:32 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4363.1773255862174588242
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 12:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gSHj3rJP;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so1773715e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773255860; x=1773860660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QGOjvm0SPa7ZNKbHfjmskN2rECK/PII+mZ0cUyPKi0M=;
        b=gSHj3rJP1cDxj/emR/IM5naUDTM0a0L6zvuFOwvhWHwsdqOagp5FricxCzvvegrB5f
         qqKN7DZbWPkYQvNH82gi3PlfsM95GFWVOwS6GjuQjsLvW4uf/lT1OUGczMRp+VJgFxCy
         dol4fcja42ZXQFFZk+oqGttmYvkIijTQO9e+c6H6HWpUrtbAXgEYWXrnfOS3gcqFCsaN
         VUEZhRQignIyw7RZCEEjz+SE2ZyLmByzuLpLmF6CwAXluWt6Hx0uIRbG14A55PR2bBA9
         n5OVI4C5S16Vou34rzRz2s5+1BJzOtY747hkbsGjvEi9We95F6iUFDEMiUMjOHcr5IpL
         G6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773255860; x=1773860660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QGOjvm0SPa7ZNKbHfjmskN2rECK/PII+mZ0cUyPKi0M=;
        b=i98J2f6wZt3+WdrSIEfW7iDgrAXUXBSSx/bwZ9yrl5hsth/vOI9MS8z/5fYj/yxIya
         TVcvkRHLSF1ojrevWUo9l06K0dBQFSelNe2u7WCQGv1MXl9KNRGMrPSN0GfpH8uepZfj
         SPfIdH0LVCFKAkfJtTA8IFSrkh0DhcFHrHue0gnIXfd0p/Lw0br0HB02zAAcwdZ16Tac
         AA5Y4tO1TjfEqcFzVUK43KItuPCuxppMAFLICyg+Reomsn33jh6gnVTQ87NpTitmdnUw
         eTgZ9ZGo8ae+xhuBwbcW8TUD1N/cOwdVpCTouU8/V2ffnpAF/E93qFwl+4N+xcIp1KWu
         tWog==
X-Gm-Message-State: AOJu0YwP62FUGvsctd15XxugU+U6fzTn1xpcQhSspG4Hx0usMHUJK9vt
	I7tqVLwVOfXO6u2tSO2GNp5s38MrIXQkIAwjqpe+S62IfX5tZS7e4LPeZ/5LYA==
X-Gm-Gg: ATEYQzw3y83zLr/w2YWcRVNCBpf7tvZ9klSWjqYwYxJEp74NAD4HHVIg5QDrqyqTPmW
	1lReRwMHGPU94LqOgi8SalPC0Q3j87aX3XRqGEGJ+olWdoxy6HBLmLhxombLnkVUQZnUNhR31pG
	6HLwyKGQjqjaEoQWs7/cIXdMLTrb6hF87+Ptgxukn7ovK+AEXlD2+iRJpfnBk6mmOcIF1wcoQZN
	KgCAy1PLfRTXHLTdheuB7BESL9IBPFWG2vK6FINN2MYEJqW3VtjZgiNxJd32UPsPU/M4w8ZN2m3
	H/rF5FcPAO2x3l48ZHlkEhxkQreu8StW5cMoTapXHDNsQ4pVXtFjwJ6YnoBv35C25j/aW80jxnX
	wKQT7YNouFPj22xps3TNhW8QBb5gbb4cC7EgbmNuiSmhhloBfRD6fSTpctRomuQeJH4vSEFwhT7
	XwTR0Dvp79PCFAbVf74W7Y
X-Received: by 2002:a05:600c:1d0e:b0:483:7020:864 with SMTP id 5b1f17b1804b1-4854b109ebbmr64897225e9.25.1773255860404;
        Wed, 11 Mar 2026 12:04:20 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854e2537c3sm43135015e9.15.2026.03.11.12.04.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:04:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/3] imagemagick: patch CVE-2025-68950
Date: Wed, 11 Mar 2026 20:04:17 +0100
Message-ID: <20260311190418.1962798-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311190418.1962798-1-skandigraun@gmail.com>
References: <20260311190418.1962798-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 19:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125089

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-68950

Backport the patch that is referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-68950.patch          | 25 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68950.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68950.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68950.patch
new file mode 100644
index 0000000000..c0b49379a5
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68950.patch
@@ -0,0 +1,25 @@
+From 0948d1ee1eb5c86d257e03c7bcdb738a3bbac549 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Fri, 26 Dec 2025 11:22:12 -0500
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-7rvh-xqp3-pr8j
+
+CVE: CVE-2025-68950
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/204718c2211903949dcfc0df8e65ed066b008dec]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/draw.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/MagickCore/draw.c b/MagickCore/draw.c
+index db555f654..7fe9675f5 100644
+--- a/MagickCore/draw.c
++++ b/MagickCore/draw.c
+@@ -5697,6 +5697,7 @@ MagickExport MagickBooleanType DrawPrimitive(Image *image,
+               if ((LocaleCompare(clone_info->magick,"ftp") != 0) &&
+                   (LocaleCompare(clone_info->magick,"http") != 0) &&
+                   (LocaleCompare(clone_info->magick,"https") != 0) &&
++                  (LocaleCompare(clone_info->magick,"mvg") != 0) &&
+                   (LocaleCompare(clone_info->magick,"vid") != 0))
+                 composite_images=ReadImage(clone_info,exception);
+               else
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index 0e52519558..60e206e8f1 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-65955.patch \
            file://CVE-2025-66628.patch \
            file://CVE-2025-68618.patch \
+           file://CVE-2025-68950.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

