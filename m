Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F98F30946
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:07:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41721.1772708837589081637
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EDtLeDEY;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483bd7354efso104509965e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772708836; x=1773313636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XUHbAVOImGCT02EnjZ/XAspnL+AugD9I8jBCH9xnO0=;
        b=EDtLeDEY5ftYmoOPNXAyuXZG9MdaZJNdRIq8cL0gB76an6UQZlA9B5N3xRRkzHVF70
         uGrtc9+lx/bAEABsqQkN2trwZds4nn8sj1qrnspnuHCtfpWDN/OKZo2kWJTCVm5hN2jD
         eeqzf/wAl3D3BjJnPSkoHGlaQkR26gbCo5VozzbYJLrmzYgXzM1JsUsGCwtOmR9NSiXH
         q0jMb+uzyojZ6NW8Vb/sgeX+eKoJTSb4zM0owob8z8ZIVyZcuJnQWmLVudQNZJc9QXYm
         FVxNViT5nYZ2vE04IBTiRcsQCaRS6+fKRK9phxbF3hgiHFmmrlm7VPiL3WLvvAg1HBdY
         smBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708836; x=1773313636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4XUHbAVOImGCT02EnjZ/XAspnL+AugD9I8jBCH9xnO0=;
        b=cjTWUlO0BJrmXbSAXh9TuNaMen6+2W+ic1wnljfgajIv8VPOQo9ZxZ35EtQfw5ZJvA
         8t+v8afghXaecoHKJ11dpwt4PwDb8Hvg6koJYR5Z3efHsobVG6qGcxeHl3HY0VUDEycH
         IkL060PofKdZ1X6PR/fCQ14EQD9fSIXVecenf6fglM3LZvf2UUfhqE+2NKOnUi8HcgZY
         4b3duQeL/n/8+jzgOWvxL9Tu1z8FBk0d4PQwCYuDh44X0ndpDRNUk/4Sp8ID/ieXv/kS
         fmYsnqR+ON0TB3HIwMMTZDqttL8tsoAWSDLDGRRxxAxGfHXqDP5wVtZfTstzashX5T1j
         6YaA==
X-Gm-Message-State: AOJu0YxM2qvG0HuCMdAGN/dUw0E/Pg4CIur3K4rl3JmaHQyZbhkegPVk
	K9Pl1pfuFTw/rBOkZJCrngZcOemrt/c3FJNYIQjPXW7Aj9BXtOmMZKw2gAr9zA==
X-Gm-Gg: ATEYQzxLqSXDa6j7UVJHKMHIQspmMZrBla0cz1oqrunxIgY6CV6YNuQy7lrEwySIBct
	dfQRkC9Fmv15fS908J8FQ+tYmPCsgX14CzYFR2Egn4s/CsGjmQpyCPvyba6BcPOCvdRxaJGHomr
	aGRSlo/QQMhdlrQihcrnUeE9+xTY7LV3uhqUy+DmEcNuwGrMRZuS+BKBpEbQ+b0pTXTCWQvYLCl
	0QtTpv3tDtbP89G4tyS8Ds6BNwiuXN3UKxyN64Q3oChbhQESjd4QGdPm+9PpcimYjpUC0GZtfJg
	y7CLutMvhVtMeyYR8YIKVLJy9WW1UO9B0OBENqPgm5yOGZs3TY257HCWObLoeyZe46qIzgmrFI7
	AzzgpsfPkaZMFt83tNpte20IQ2FLDXa+NAWhpvLrpHNrElZLFNCvb/4Qa++M5aJ2WNUdo8dfUni
	avTQlhZ8JgRwgt4JPYox/J
X-Received: by 2002:a05:600c:4503:b0:480:1b65:b744 with SMTP id 5b1f17b1804b1-485198992cdmr93777105e9.28.1772708835864;
        Thu, 05 Mar 2026 03:07:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851faeaec0sm32269505e9.11.2026.03.05.03.07.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:07:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 3/7] gimp: patch CVE-2026-0797
Date: Thu,  5 Mar 2026 12:07:09 +0100
Message-ID: <20260305110713.2893128-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305110713.2893128-1-skandigraun@gmail.com>
References: <20260305110713.2893128-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124868

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0797

The patch referenced in the NVD report looks incorrect.
This change in this patch was taken from the related upstream issue[1].

[1]: https://gitlab.gnome.org/GNOME/gimp/-/issues/15555

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2026-0797.patch             | 91 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  1 +
 2 files changed, 92 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797.patch
new file mode 100644
index 0000000000..46e83ac30c
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797.patch
@@ -0,0 +1,91 @@
+From b00dbb729ef8218ffadc3ddeee6841b8ffb1b7ea Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Fri, 26 Dec 2025 15:49:45 +0000
+Subject: [PATCH] plug-ins: Add more fread () checks in ICO loading
+
+Resolves #15555
+
+This patch adds some guards for ico_read_int8 (),
+which was used for loading palettes and maps
+without verifying that it returned the same number
+of bytes as what it tried to read in.
+
+CVE: CVE-2026-0797
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/09e72ef32bf47dea047b044dba789557f334b7d5]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/file-ico/ico-load.c | 33 ++++++++++++++++++++++++++-------
+ 1 file changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/plug-ins/file-ico/ico-load.c b/plug-ins/file-ico/ico-load.c
+index c144b6e..7eb9cb7 100644
+--- a/plug-ins/file-ico/ico-load.c
++++ b/plug-ins/file-ico/ico-load.c
+@@ -69,7 +69,9 @@ ico_read_int32 (FILE    *fp,
+   total = count;
+   if (count > 0)
+     {
+-      ico_read_int8 (fp, (guint8 *) data, count * 4);
++      if (ico_read_int8 (fp, (guint8 *) data, count * 4) != (count * 4))
++        return FALSE;
++
+       for (i = 0; i < count; i++)
+         data[i] = GUINT32_FROM_LE (data[i]);
+     }
+@@ -88,7 +90,9 @@ ico_read_int16 (FILE    *fp,
+   total = count;
+   if (count > 0)
+     {
+-      ico_read_int8 (fp, (guint8 *) data, count * 2);
++      if (ico_read_int8 (fp, (guint8 *) data, count * 2) != (count * 2))
++        return FALSE;
++
+       for (i = 0; i < count; i++)
+         data[i] = GUINT16_FROM_LE (data[i]);
+     }
+@@ -109,8 +113,8 @@ ico_read_int8 (FILE   *fp,
+   while (count > 0)
+     {
+       bytes = fread ((gchar *) data, sizeof (gchar), count, fp);
+-      if (bytes <= 0) /* something bad happened */
+-        break;
++      if (bytes != count) /* something bad happened */
++        return -1;
+ 
+       count -= bytes;
+       data += bytes;
+@@ -485,16 +489,31 @@ ico_read_icon (FILE    *fp,
+          data.used_clrs, data.bpp));
+ 
+       palette = g_new0 (guint32, data.used_clrs);
+-      ico_read_int8 (fp, (guint8 *) palette, data.used_clrs * 4);
++      if (ico_read_int8 (fp,
++                         (guint8 *) palette,
++                         data.used_clrs * 4) != (data.used_clrs * 4))
++        {
++          D(("skipping image: too large\n"));
++          return FALSE;
++        }
++
+     }
+ 
+   xor_map = ico_alloc_map (w, h, data.bpp, &length);
+-  ico_read_int8 (fp, xor_map, length);
++  if (ico_read_int8 (fp, xor_map, length) != length)
++    {
++      D(("skipping image: too large\n"));
++      return FALSE;
++    }
+   D(("  length of xor_map: %i\n", length));
+ 
+   /* Read in and_map. It's padded out to 32 bits per line: */
+   and_map = ico_alloc_map (w, h, 1, &length);
+-  ico_read_int8 (fp, and_map, length);
++  if (! ico_read_int8 (fp, and_map, length) != length)
++    {
++      D(("skipping image: too large\n"));
++      return FALSE;
++    }
+   D(("  length of and_map: %i\n", length));
+ 
+   dest_vec = (guint32 *) buf;
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index a04b3d0e4c..9a969bde7c 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -54,6 +54,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2025-2760-1.patch \
            file://CVE-2025-2760-2.patch \
            file://CVE-2025-2761.patch \
+           file://CVE-2026-0797.patch \
            "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 

