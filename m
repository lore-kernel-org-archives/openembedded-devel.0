Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A33B7C2A091
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61166.1767607364034521670
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dYqBNiRc;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47bdbc90dcaso88530205e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607362; x=1768212162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PX4gSgsekBaHBNFvimDGL/NvtL868CYbd8c28HIE97k=;
        b=dYqBNiRcP5c/8Rsd5ZL+XKkst9XkXWOM0t5L5eTmbCv05hNO4W7mDd0mGsr+9WjmbZ
         2jrgJW7NfN3qXEQ2Orp3a+AFA5Byf3kQxcyQ1F9DXAH+0Tn2wKnH20uz4ANLWxgccAeF
         ANzV4y0c2p1+2wx/BVqsuaf6b+BKlQ1XV7lB5YyLtcOiS2oJdlqY5MmBUJaOoOYdCSPM
         mb5wbpavJg/dn1WKaemv6v/k4iXarz/jhH4Z0EoaLDZIAJIoBejSr6VXuQV/+1Gvz8gq
         hcomAvLj/xaLJ/zmeWCL5bluFhG53D0QVivdEfh2sGoWxRYO7bxzZyYsbqhHwkXMLupA
         XF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607362; x=1768212162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PX4gSgsekBaHBNFvimDGL/NvtL868CYbd8c28HIE97k=;
        b=xVDjo/Goe67jcncWexKZ2DkMZaPJKRYO6BqJviz9RM8mU+rPy3xdiwDSiWnIPuDNBm
         YHe2TEbe1VrvK/MLGtP5dfUQFAWqI+2d4CX83vdCVji9CcXBcLw4OuZEjIguIScPtgNY
         fTmgqSAlEXFjIXHT+E7HrvKXaxsv4Jyf6m6T84gUaub6zPgqggNdztghfW4PyqunySJm
         TD2ppcN9eo5qm0PL20cIFnLqe780++fI8XLyqt7US1BH2jH8HhZla1ZzcXXvthMMtKY7
         kWBuzbUyg1X+I1rLMcmbRNbmzDHLZBYtVbsfFdG95BJqV3nNVvecYGVhkI/W+FuUrqks
         +NSg==
X-Gm-Message-State: AOJu0YxtOXgyQWhWTty5+LCMIC1yHfZz3P8FUomsRnF9FinJRq3j/kSd
	x4R7DIwikW3/wblnGcKI1m8Q6A3AZzhi+5kC8/ZvxHa8fNW94xAvh9wpKXJ5oQ==
X-Gm-Gg: AY/fxX4RP/fWLcyMHBbeWPrRhQ58ep82qgxenFnuNJ1/97thu2q1hq5QYjS3NGrm0m6
	z0xZEMLP4THw5BTYvayZtn5E1kB9oL7+dAPjvLAUUPdZbcM0Zxuhe13Wsl2zX85ssynPqDt2577
	igZjsj47Y0lmAmVlkhFMPV/aWkQIulPKLBclj2nLxvvkgNQc20i0ODit4pAqPPPTnl07KDXLynp
	qqdd/M22Hmp6PLIQB5gjTO9FByFxLRPBp2uM2FzjaCVyqkpP5BxcAOAekCVMgAIO9AEgPzGe606
	yebtEM+DUXZ5u/mRjDT+SCIOp6un37AeiEr8mo6ul81nyIxWSmkSC1Q4WLxx2FQJvr3/qWlrvzh
	MPLe5QhNIlCAjLe/XXxo/+H/JeGSetMqGEZjNOkXLfiXyR614Qt5S4aBqnfiLPovtwQCrxj0zii
	GhpIQ093f6r70uzQ2cS2A=
X-Google-Smtp-Source: AGHT+IG7rKfQqpIClXk2vMrgwwQ8xwpVeD9944DAOB6ZpbnSfHhLm0LFycnb4aik4to34AyTkA/3aA==
X-Received: by 2002:a05:600c:628c:b0:47a:7fbf:d5c8 with SMTP id 5b1f17b1804b1-47d1958296bmr543921285e9.26.1767607362287;
        Mon, 05 Jan 2026 02:02:42 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH 05/17] gimp: patch CVE-2025-14423
Date: Mon,  5 Jan 2026 11:02:25 +0100
Message-ID: <20260105100237.3081345-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123136

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14423

Pick the patch references by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6aa5720e76d632f62f53ed7be7fe649138fbd55c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2025-14423.patch            | 106 ++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch
new file mode 100644
index 0000000000..50a0adfe89
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch
@@ -0,0 +1,106 @@
+From a83e8c4ad8ffbce40aa9f9a0f49880e802ef7da1 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 23 Nov 2025 04:22:49 +0000
+Subject: [PATCH] plug-ins: Fix ZDI-CAN-28311
+
+From: Alx Sa <cmyk.student@gmail.com>
+
+Resolves #15292
+The IFF specification states that EHB format images
+have exactly 32 colors in their palette. However, it
+is possible for images in the wild to place an incorrect
+palette size. This patch checks for this, and either limits
+the palette size or breaks accordingly.
+
+CVE: CVE-2025-14423
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/481cdbbb97746be1145ec3a633c567a68633c521]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/common/file-iff.c | 32 ++++++++++++++++++++++----------
+ 1 file changed, 22 insertions(+), 10 deletions(-)
+
+diff --git a/plug-ins/common/file-iff.c b/plug-ins/common/file-iff.c
+index d144a96..f087947 100644
+--- a/plug-ins/common/file-iff.c
++++ b/plug-ins/common/file-iff.c
+@@ -337,7 +337,7 @@ load_image (GFile        *file,
+       width      = bitMapHeader->w;
+       height     = bitMapHeader->h;
+       nPlanes    = bitMapHeader->nPlanes;
+-      row_length = (width + 15) / 16;
++      row_length = ((width + 15) / 16) * 2;
+       pixel_size = nPlanes / 8;
+       aspect_x   = bitMapHeader->xAspect;
+       aspect_y   = bitMapHeader->yAspect;
+@@ -375,6 +375,18 @@ load_image (GFile        *file,
+             {
+               /* EHB mode adds 32 more colors. Each are half the RGB values
+                * of the first 32 colors */
++              if (palette_size < 32)
++                {
++                  g_set_error (error, G_FILE_ERROR,
++                               g_file_error_from_errno (errno),
++                               _("Invalid ILBM colormap size"));
++                  return NULL;
++                }
++              else if (palette_size > 32)
++                {
++                  palette_size = 32;
++                }
++
+               for (gint j = 0; j < palette_size * 2; j++)
+                 {
+                   gint offset_index = j + 32;
+@@ -386,7 +398,7 @@ load_image (GFile        *file,
+                   gimp_cmap[offset_index * 3 + 2] =
+                     colorMap->colorRegister[j].blue / 2;
+                 }
+-              /* EHB mode always has 64 colors */
++              /* EHB mode always has 64 colors in total */
+               palette_size = 64;
+             }
+         }
+@@ -447,7 +459,7 @@ load_image (GFile        *file,
+         {
+           guchar *pixel_row;
+ 
+-          pixel_row = g_malloc (width * pixel_size * sizeof (guchar));
++          pixel_row = g_malloc0 (width * pixel_size);
+ 
+           /* PBM uses one byte per pixel index */
+           if (ILBM_imageIsPBM (true_image))
+@@ -459,7 +471,7 @@ load_image (GFile        *file,
+           else
+             deleave_rgb_row (bitplanes, pixel_row, width, nPlanes, pixel_size);
+ 
+-          bitplanes += (row_length * 2 * nPlanes);
++          bitplanes += (row_length * nPlanes);
+ 
+           gegl_buffer_set (buffer, GEGL_RECTANGLE (0, y_height, width, 1), 0,
+                            NULL, pixel_row, GEGL_AUTO_ROWSTRIDE);
+@@ -528,7 +540,7 @@ deleave_ham_row (const guchar *gimp_cmap,
+   /* Deleave rows */
+   for (gint i = 0; i < row_length; i++)
+     {
+-      for (gint j = 0; j < 8; j++)
++      for (gint j = 0; j < nPlanes; j++)
+         {
+           guint8 bitmask = (1 << (8 - j)) - (1 << (7 - j));
+           guint8 control = 0;
+@@ -590,11 +602,11 @@ deleave_ham_row (const guchar *gimp_cmap,
+ }
+ 
+ static void
+-deleave_rgb_row (IFF_UByte  *bitplanes,
+-                     guchar *pixel_row,
+-                     gint    width,
+-                     gint    nPlanes,
+-                     gint    pixel_size)
++deleave_rgb_row (IFF_UByte *bitplanes,
++                 guchar    *pixel_row,
++                 gint       width,
++                 gint       nPlanes,
++                 gint       pixel_size)
+ {
+   gint row_length    = ((width + 15) / 16) * 2;
+   gint current_pixel = 0;
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
index f529930dff..24281e5dfd 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
@@ -62,6 +62,7 @@ SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
            file://0001-meson.build-dont-check-for-lgi.patch \
            file://0001-meson.build-require-iso-codes-native.patch \
            file://CVE-2025-14422.patch \
+           file://CVE-2025-14423.patch \
            "
 SRC_URI[sha256sum] = "246c225383c72ef9f0dc7703b7d707084bbf177bd2900e94ce466a62862e296b"
 

