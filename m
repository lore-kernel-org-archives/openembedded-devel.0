Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B21BE9273B
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:53:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44450.1767019980367395287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=buObcrat;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47755de027eso54193055e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019979; x=1767624779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fv6qcOEqOl8hcCa9E4GTm+MUsTFA5X+SYHrrN29tig=;
        b=buObcratWvkWB0SN4fHuYiz9vM93gVxEh4GA1v3Q+4Jx+94c/durk1h5dAegfCc1s1
         ESuvXwKqQCQZHPJVPDKbReFS4c/dTzzT27etCODFFTK/gWS9LXD5ziGkyYZFrzTa4Ll1
         p/HYKXiZ/q0EEi0S6SzSU/anbwqeHTD6bJkmdQJ0DLkjfHy8v8g0L1WTFFeMNkr7gt/v
         ZTmxgindNDo5kC8HXu9KP4i2T8xgIaoEBpA3qPbx/tnC4vz8K60P97G5Lwc7/+dipRhP
         kh76872DZaY/9QB7wJO/3MhuL58w4RqcQXsm/oHA9MQ9ZFKzCoURbIftyrjj7+Pz4JQg
         WRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019979; x=1767624779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2fv6qcOEqOl8hcCa9E4GTm+MUsTFA5X+SYHrrN29tig=;
        b=uFRSa+0xd1TFG4Ts9mu51J3juaW6hQCoOo8QiCuJ9k0GKjPG3J/OwLMMDu3b0+rJom
         2j+lwWda6XUQm6fzv0kHtF/nKdNVNeTur1F/2FtJtskYwMMdTzwTag2jjKzX0x+/J7n7
         qhMnzMMAwIV/pUzvSgsPG8XmJ9M+QAFl2pCOmOuQJFjYl4XfkNxMPPIqfLoTnbepKxQj
         WW0c+W58x0XrJqKGbP2mX4YxOegeyfiFf/nt0w2bvgyV/R/CGtNBaLOj/syqzxC2sZ+v
         b+CevZiUAlcJC1b2MHM26dW909loZNa7Orp0qED7T0Uiqrmabl9PrhWFU0foBl0UU9Il
         zGMQ==
X-Gm-Message-State: AOJu0YwQ4k7nkYoNnoSGo0xa7kPOU2hxVrMyPE+F92Ooshp/BpMsneY7
	JgX8C0sLrMnUY5aK2pQGL9Z191/8KCIAWp2JsURZpzft1BwbUO7RQO2kyWQbWQ==
X-Gm-Gg: AY/fxX6QLuAxr/qikAxR8K7IRduvai4Ab0q5ZdTyG6tw6immW/NZsA3xdvZRO+FYyU6
	cUrle6m4fN0ogC8F3WI6/5t0MmPs07VtfmN2iCDyi3QHpnpZ4Wf3IXQOIpwG45b0nvvbGceAqCG
	jQruAsxhjGawqtw2BrJLTFsCzo10dEZNgXzlUCXETqF51WC+cgHZcTAcffDQvxkvSFt2XkrbYCs
	Izw9fBL4LUVaiVs+bod5j+X+NKISm5uURoTXC/hYtXsLpxSv2Bx8/dAZ568NJXsMvS4/eYEKUEf
	VE9NkAp59Q0bDdEflIXYqFNL0n7IP2tK19bsJpPzyeHYNyyyH0HCD1n6FQl6/V1Beuc3v4+ovFc
	4+PKacwYHaWamCKJWvSsnpbmgY0AD0+Tu0DUxMs7HkrJY8pAMExd4RTCd3vo+cwDqDZGzGCm0io
	Oa+DLChihi
X-Google-Smtp-Source: AGHT+IGUNDlPOSE476CsDUQbb8Qhs3W1bpVK7ysZIrO5dEUsV/fztlcO9q/VfFMwiEbDTI4q41cexg==
X-Received: by 2002:a05:600c:8287:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-47d1955578bmr410365475e9.16.1767019978555;
        Mon, 29 Dec 2025 06:52:58 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm601067785e9.6.2025.12.29.06.52.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:52:58 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/4] gimp: patch CVE-2025-14423
Date: Mon, 29 Dec 2025 15:52:54 +0100
Message-ID: <20251229145256.489179-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145256.489179-1-skandigraun@gmail.com>
References: <20251229145256.489179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122992

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14423

Pick the patch references by the NVD report.

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
 

