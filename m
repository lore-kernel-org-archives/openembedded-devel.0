Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 905A2F30939
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 11:07:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41962.1772708836468065582
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 03:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YSXKxIzb;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso72203585e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772708835; x=1773313635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mu4Iq2G7KwmzAMuRRuuKVQgwEHuVJJ9bHtQzkvOfjXQ=;
        b=YSXKxIzbqb9HTMJvzRd7zE8GO7CY/2kw/DuF8uO2TLMSje1EIy6m+ghHZvGyGUZ3b7
         1CwAXFECLIyJcoijy7Nls/UfRC4UsdOIHEmOwSLGKuswlfuD0CWLcjTJD7yuah5BCROz
         OfUbxU6hv51zDFyf3VlmbLT+JvNBLwxmxCqmyyda9/QnRgQl4sgxXBTd/kWVs2iGODTb
         TLtZMTqa9aWIShJoyctj52XWel5HAJbIlf3/BwbfJ7eMWI2tvVMG2khEgnzP6LCWuxBi
         hLEtYKpHSWIvXP8T2nGkI6l7yUXy8Ll6YtN9nIxZXKL+zgES/NG2ho7DuIaYIUt76Rs5
         Oaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772708835; x=1773313635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mu4Iq2G7KwmzAMuRRuuKVQgwEHuVJJ9bHtQzkvOfjXQ=;
        b=e4sPwRrvRyglc7utmZ7u/CJIeLlEEZjPkoaKkpPJ51ttKxK5VN0KVKLWTVh6+6zGou
         a4FdsGU4tiED5PnYvABvlWBUQ8aKvrhnKfOuTiZSfyuaEjWP3KXwpsEwpdKRSggvQ0p3
         xj48jzNw/6yQ3mYqrp8RGQOVrcSKibfgr37wAQNI3nAn8WyPTYCmpj509sy3dw1dv+Wt
         JU0vjljJMYP9RBy3pfwxTIQxPQkoYfI2Ddjx/U77AoqL1EqCPKNkXpT68DIrE9mRdVDz
         +qTEop547E2qKp+RLlmUozrNew/G6u0Dwb09k5G9qXEfWv3NmNjz5x4PR6HXL7lAHTs5
         E1QQ==
X-Gm-Message-State: AOJu0YyubxJzLd/xCdHDYVtkayUy8IyiOGDVlH3VpMD9v6ey+DU/ndiq
	bLKbxpU97tLFa61KUm2j0fHPsK8huBh13hLl80RtQOLdVcZgjvf48EC7j6tF1g==
X-Gm-Gg: ATEYQzwILUGjkzbPyGQSaFNp/3Da1C6qOg8/g9m3Shd+5HjjGeVZj7pKpTLc8SJWUFE
	rVCTnGHBoYy2CuzqWA8CxY9bsyHluWxx/6w5Yo016U4B9376IplNa5uvh0BwQMDZQqlsFs7/YGl
	V3YrATIMoMUECKGcPfynQfB0RnFw/+/fnqsu89JJ1+3l/uKvbjS9cAl4H8cRmJrNWCjczoWS5+C
	rXMcTLkSHEkgWN4ou1B/voW5LqgFsSNHJp2+Wbbm+cKQzpMfJaIjlpl7VXnpLYVo5thNmkKZqIQ
	m5dRfVgnp6SMVRJVDnmfiQc7rf6Dkl2rpa7ID5QXY5YI8/xautkFEcb/8hEO4raYehAra2z8odK
	zVuuKOtDJra93WSdkq5hp7vSa68SupuJoxQ3PnWG99qNTYdvVDkbTFwHTagl/KdMpvPW3YqaPnW
	I0y4Y4ltmn2jpWry0/pWB+
X-Received: by 2002:a05:600c:4e8b:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-48519896e5fmr97423035e9.23.1772708834395;
        Thu, 05 Mar 2026 03:07:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851faeaec0sm32269505e9.11.2026.03.05.03.07.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 03:07:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 1/7] gimp: patch CVE-2025-2760
Date: Thu,  5 Mar 2026 12:07:07 +0100
Message-ID: <20260305110713.2893128-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124866

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2760

Use the fixes from Debian.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2025-2760-1.patch           | 38 +++++++++
 .../gimp/gimp/CVE-2025-2760-2.patch           | 84 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  2 +
 3 files changed, 124 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-1.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-2.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-1.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-1.patch
new file mode 100644
index 0000000000..d5871958b4
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-1.patch
@@ -0,0 +1,38 @@
+From e4e21387f773598915a2399b348d019fd9c26ad6 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 5 Mar 2026 09:06:34 +0100
+Subject: [PATCH] CVE-2025-2760
+
+https://gitlab.gnome.org/GNOME/gimp/-/issues/12790#note_2328950
+
+Gimp stopped supporting 2.10.x series (in favor of 3.x), and they do not
+plan to fix this in the old version. This patch is taken from Debian,
+and is a backport of the fix from 3.x series.
+
+CVE: CVE-2025-2760
+Upstream-Status: Inappropriate [unsupported version. Debian ref: https://sources.debian.org/patches/gimp/2.10.34-1+deb12u8/CVE-2025-2760.patch/]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/file-dds/ddsread.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/plug-ins/file-dds/ddsread.c b/plug-ins/file-dds/ddsread.c
+index dcb4449..da35a0b 100644
+--- a/plug-ins/file-dds/ddsread.c
++++ b/plug-ins/file-dds/ddsread.c
+@@ -934,6 +934,14 @@ load_layer (FILE            *fp,
+   if (width < 1) width = 1;
+   if (height < 1) height = 1;
+ 
++  if (width <= 0 ||height <= 0 || d->gimp_bpp <= 0 ||
++      (gsize) width > G_MAXSIZE / height           ||
++      (gsize) width * height > G_MAXSIZE / d->gimp_bpp)
++    { 
++      g_message ("Invalid dimensions in header.");
++      return 0;
++    }
++  
+   switch (d->bpp)
+     {
+     case 1:
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-2.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-2.patch
new file mode 100644
index 0000000000..196ae11376
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-2.patch
@@ -0,0 +1,84 @@
+From f7a458d072c266a4b2ae48de9ecec1706faad170 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 5 Mar 2026 09:07:19 +0100
+Subject: [PATCH] plug-ins/dds: fix #12790 for 32-bit
+
+with 2.10 backport bits by Sylvain Beucler <beuc@debian.org>
+
+Gimp stopped supporting 2.10.x series (in favor of 3.x), and they do not
+plan to fix this in the old version. This patch is taken from Debian,
+and is a backport of the fix from 3.x series.
+
+CVE: CVE-2025-2760
+Upstream-Status: Inappropriate [unsupported version. Debian ref: https://sources.debian.org/patches/gimp/2.10.34-1+deb12u8/CVE-2025-2760-32bit-followup.patch/]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/file-dds/ddsread.c | 28 ++++++++++++++++++++--------
+ 1 file changed, 20 insertions(+), 8 deletions(-)
+
+diff --git a/plug-ins/file-dds/ddsread.c b/plug-ins/file-dds/ddsread.c
+index da35a0b..e0b53f6 100644
+--- a/plug-ins/file-dds/ddsread.c
++++ b/plug-ins/file-dds/ddsread.c
+@@ -169,26 +169,33 @@ read_dds (gchar    *filename,
+   /* a lot of DDS images out there don't have this for some reason -_- */
+   if (hdr.pitch_or_linsize == 0)
+     {
++      gboolean valid = TRUE;
+       if (hdr.pixelfmt.flags & DDPF_FOURCC) /* assume linear size */
+         {
+-          hdr.pitch_or_linsize = ((hdr.width + 3) >> 2) * ((hdr.height + 3) >> 2);
++          valid &= g_uint_checked_mul(&hdr.pitch_or_linsize, (hdr.width + 3) >> 2, (hdr.height + 3) >> 2);
+           switch (GETL32(hdr.pixelfmt.fourcc))
+             {
+             case FOURCC ('D','X','T','1'):
+             case FOURCC ('A','T','I','1'):
+             case FOURCC ('B','C','4','U'):
+             case FOURCC ('B','C','4','S'):
+-              hdr.pitch_or_linsize *= 8;
++              valid &= g_uint_checked_mul(&hdr.pitch_or_linsize, hdr.pitch_or_linsize, 8);
+               break;
+             default:
+-              hdr.pitch_or_linsize *= 16;
++              valid &= g_uint_checked_mul(&hdr.pitch_or_linsize, hdr.pitch_or_linsize, 16);
+               break;
+             }
+         }
+       else /* assume pitch */
+         {
+-          hdr.pitch_or_linsize = hdr.height * hdr.width * (hdr.pixelfmt.bpp >> 3);
++          valid &= g_uint_checked_mul(&hdr.pitch_or_linsize, hdr.height, hdr.width);
++          valid &= g_uint_checked_mul(&hdr.pitch_or_linsize, hdr.pitch_or_linsize, hdr.pixelfmt.bpp >> 3);
+         }
++      if (!valid) {
++        fclose (fp);
++        g_message ("Image size is too big to handle.\n");
++        return GIMP_PDB_EXECUTION_ERROR;
++      }
+     }
+ 
+   if (hdr.pixelfmt.flags & DDPF_FOURCC)
+@@ -1217,14 +1224,19 @@ load_layer (FILE            *fp,
+     {
+       unsigned char *dst;
+ 
+-      dst = g_malloc (width * height * d->gimp_bpp);
+-      memset (dst, 0, width * height * d->gimp_bpp);
++      dst = g_malloc ((gsize) width * height * d->gimp_bpp);
++      memset (dst, 0, (gsize) width * height * d->gimp_bpp);
+ 
+       if (d->gimp_bpp == 4)
+         {
+-          for (y = 0; y < height; ++y)
++          guchar *dst_line;
++
++          dst_line = dst;
++          for (y = 0; y < height; ++y) {
+             for (x = 0; x < width; ++x)
+-              dst[y * (width * 4) + (x * 4) + 3] = 255;
++              dst_line[(x * 4) + 3] = 255;
++            dst_line += width * 4;
++          }
+         }
+ 
+       dxt_decompress (dst, buf, format, size, width, height, d->gimp_bpp,
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 95a6dfd7c8..afb1cd69e5 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -51,6 +51,8 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2025-14425.patch \
            file://CVE-2025-5473.patch \
            file://CVE-2025-15059.patch \
+           file://CVE-2025-2760-1.patch \
+           file://CVE-2025-2760-2.patch \
            "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 

