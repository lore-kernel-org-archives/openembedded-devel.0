Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF706D25035
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 05:35:00 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27575.1768196096642851976
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 21:34:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zep+GA+B;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7c75fc222c3so3108553a34.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 21:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768196096; x=1768800896; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfVj1qGSO+x6EpTtb7OIEBw+TsfAHAqtmL7SM/8epWY=;
        b=Zep+GA+BlZSEO2FbY73spwJldwc2uyA1J9kEuKI+dodZ69uTF7mBqsMx7v43Eu57Zn
         nCPf4rNy4C3v0zbSPCLsiP2DMzasTqzxWGIYG4CJdPIh3gHB0PXmy2IRALRGyDIMng6w
         1FkKFsP3EQqjzusWhh5KpK0zgtEp3mFiMcgPBCtHobE9nojMDa2ra5blqo86NWu76zxW
         dSO+B5Fmd9CjaS6GhGvAILF8qd92uH6+7/h21cnbGXwpKkE/X5tOsA1HBjYrbWCDt0nG
         +pAbNh/cpJedv4KRAnPe8WvS5gk/Ap3bN2sPOONTnSgZ1NAXcvHcdjUz9+qyHtRWIJGp
         x+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768196096; x=1768800896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfVj1qGSO+x6EpTtb7OIEBw+TsfAHAqtmL7SM/8epWY=;
        b=nhUPZwPrZ5S+sl+PHRgwziAUKxCLGd3I7ENv2agd3cr0cqODLGAvixFlkRwSpQ72uc
         QgO391ngvEbbpKwC3uBUG6+t1rzWQnIDuakkGjtC60ak0x4ejYp5FJxOI89Myzq8uT3z
         EuEykI2RjPS2LJa3WVCmSQg9YBbhUuJ9exhF6m1y1su/d7clX9duygAmyX36zCZMsf+5
         u1bjWOGMpBePgUcFn8FHxe2gTbQCxRFpi3vTQHKHsE0Xesf7skEF5U/p5cCPTJbDlejJ
         Io74vREC64Gov+keMJK3zE4swUCvRZCM0oYARTWhrld/0GzoiuqXM/zTSxpPaplGTW9D
         oiNA==
X-Gm-Message-State: AOJu0Yw/dn4QXpnIYyyXpl5AItp1E2aKqXUwlR+Pneq4WDm1GEnj+pjU
	YRA2tyLfbu6DUw8WyCrubZmPuf0WSOp+MJ41DKDL5s66Ipx+zK1S+UiK0iWDQQ==
X-Gm-Gg: AY/fxX4ZAHANF+SO8q7+m1L4bIRxRuPGd+NxHp1kkPTBy57cud2KUWu0Dcn/FiQSzAw
	o1XGSVF4P3e7SFXLZLEEqHQLZFsFbUqxCkdCI/9jERlzD54dAl1QRsUkBwzUWBcmPjRcZJarGS0
	hcqPw8Y+KI5ByP4tsCSqaqy60gJf+a30K/NiIDbuStmDC/marSzNqCXU/3zq55VP2EF6YTw34xb
	ZQhPbdFKyLFZ8iFzlnGAvfUtykimYSO19UYhSrJg5OC4fqUphMkAMZm7PfhvlYWx4oT++yJGfrh
	78fIWrQJT2s1l0l5LMV04R/aTmJDgLd3mAMDW4ajDJ56bEN4JzM/rtOmeoszHfNi0jQ5wIIhfD0
	3pySP9+dfJn4mq6mI+W30Zhdw8Z0wQmcfjxds+eUF1psZLFNWm0t6ZNiN2ZiDWqX8X8iF+Kw9S9
	fLpTEirLhvqsBzcyY6tSqRQMw=
X-Google-Smtp-Source: AGHT+IEry/QzpNjUGUaPF+ROO2NSPC2X7EwWnzJz+a9P3xOj9fpUVY7Ly6L1Axf5waHJfV+mmR8vpA==
X-Received: by 2002:a05:6830:412a:b0:7c5:3798:fa4e with SMTP id 46e09a7af769-7ce509f9ec6mr9463642a34.17.1768196095649;
        Sun, 11 Jan 2026 21:34:55 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm13038512a34.23.2026.01.11.21.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 21:34:55 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][scarthgap][PATCH 4/6] gimp: patch CVE-2025-14425
Date: Mon, 12 Jan 2026 18:34:38 +1300
Message-ID: <20260112053440.3694238-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
References: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 05:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123353

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14425

Patch referenced by the nvd report is for the file "file-jp2.c" which was
renamed from "file-jp2-load.c" by commit[1] in the later versions.
[1] https://gitlab.gnome.org/GNOME/gimp/-/commit/19c57a9765ac3451c9cde94ccb06bec5ae06fbd8

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gimp/gimp/CVE-2025-14425.patch            | 70 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
new file mode 100644
index 0000000000..459516ec9e
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
@@ -0,0 +1,70 @@
+From 012406d60ca09239403ce989cf9e793b82e47e74 Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Wed, 12 Nov 2025 13:25:44 +0000
+Subject: [PATCH] plug-ins: Mitigate ZDI-CAN-28248 for JP2 images
+
+Resolves #15285
+Per the report, it's possible to exceed the size of the pixel buffer
+with a high precision_scaled value, as we size it to the width * bpp.
+This patch includes precision_scaled in the allocation calculation.
+It also adds a g_size_checked_mul () check to ensure there's no
+overflow, and moves the pixel and buffer memory freeing to occur
+in the out section so that it always runs even on failure.
+
+CVE: CVE-2025-14425
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/cd1c88a0364ad1444c06536731972a99bd8643fd]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ plug-ins/common/file-jp2-load.c | 21 +++++++++++++++------
+ 1 file changed, 15 insertions(+), 6 deletions(-)
+
+diff --git a/plug-ins/common/file-jp2-load.c b/plug-ins/common/file-jp2-load.c
+index 9ab43b5349..d29278a4d2 100644
+--- a/plug-ins/common/file-jp2-load.c
++++ b/plug-ins/common/file-jp2-load.c
+@@ -1055,9 +1055,10 @@ load_image (const gchar       *filename,
+   gint               width;
+   gint               height;
+   gint               num_components;
+-  GeglBuffer        *buffer;
++  GeglBuffer        *buffer = NULL;
+   gint               i, j, k, it;
+-  guchar            *pixels;
++  guchar            *pixels = NULL;
++  gsize              pixels_size;
+   const Babl        *file_format;
+   gint               bpp;
+   GimpPrecision      image_precision;
+@@ -1298,7 +1299,14 @@ load_image (const gchar       *filename,
+   bpp = babl_format_get_bytes_per_pixel (file_format);
+ 
+   buffer = gimp_drawable_get_buffer (layer_ID);
+-  pixels = g_new0 (guchar, width * bpp);
++  if (! g_size_checked_mul (&pixels_size, width, (bpp * (precision_scaled / 8))))
++    {
++      g_set_error (error, GIMP_PLUG_IN_ERROR, 0,
++                   _("Defined row size is too large in JP2 image '%s'."),
++                   gimp_file_get_utf8_name (filename));
++      goto out;
++    }
++  pixels = g_new0 (guchar, pixels_size);
+ 
+   for (i = 0; i < height; i++)
+     {
+@@ -1325,12 +1333,13 @@ load_image (const gchar       *filename,
+                          file_format, pixels, GEGL_AUTO_ROWSTRIDE);
+     }
+ 
+-  g_free (pixels);
+-
+-  g_object_unref (buffer);
+   gimp_progress_update (1.0);
+ 
+  out:
++  if (pixels)
++    g_free (pixels);
++  if (buffer)
++    g_object_unref (buffer);
+   if (profile)
+     g_object_unref (profile);
+   if (image)
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 096f40f79d..68daac776d 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -48,6 +48,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://0001-configure-Keep-first-line-of-compiler-version-string.patch \
            file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch \
            file://CVE-2025-14422.patch \
+           file://CVE-2025-14425.patch \
 "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 

