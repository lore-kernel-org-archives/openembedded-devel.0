Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 470B4E92733
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:53:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44448.1767019979621335592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihOygoRS;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so55604615e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019978; x=1767624778; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLzK+xCapSs7qouF6WW6JyFO5ZbopaiUInk//MBfGQo=;
        b=ihOygoRS2y80YMcGWPulxYdwb9Fz8USYNAWMia9U1Cr8j4mwwoxiKLnR7BWXtsfW2P
         uDnxHjcNEjydQVm9NbtKhwfqdhlq8w4S7im8h035UfnkJUJeGGVGXl22BerVaa8c3xjq
         lprnGUf0rrOGMAUfFm86qvUX58cRNkIGo+s6e3pulNc8oSVBjxeHt0QqacXjjYW64Ul/
         iSwDOL9XZnF/BK/A2GdevzR1Kzth7ynGE5TTU3m0njFWtqJaasfSRKQ02Kjde7F9jE16
         ZNxEsgGGCI+S+VGfFaFXjiY1JfktLUvz7vGkIE7fQDvABMEYaGhUSNrQ3ow/xgBOoPqH
         OQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019978; x=1767624778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLzK+xCapSs7qouF6WW6JyFO5ZbopaiUInk//MBfGQo=;
        b=NmlX5sxodO6SMBeTmhi/iTaIsJxcOggLflJjCW+NAXU+djDNvb0ZG8UFhZJDdcfgd+
         UMlu31rnzFGstmm3tXrGslZaVXMqoUi++qFFoFQD4fNcbRY3gfmgRgkAfd/+3vDmxWGU
         floJ6hXmd6w9F8E8s8iQoFp3+TVZjYdXoXTB2d25l9OrVfwafanUMI0F04rhvoLC6UiX
         B+T2B23kapz+QUGaq8ifp2vW8YRhRuc+KlWl4rGNvgfrvg0YuF2m5sN0Yc3/+IObjet2
         +uAIQg1GGQRDahbvBJWLs7lQsE98qz74LKOpXuFXEOcbHWl8cHamiJKW+GTPGQoHEEa5
         z4wg==
X-Gm-Message-State: AOJu0YyW0WNA3hPfSU3LJ6A9hf9erCQJPBlvvSALEpnhVpp9T8fpKg2A
	MOUkKS8sUyd8ooqANtcBsJVDa+8DCXyBs5Hh5Y0wTkCJXSqN5GejNagbVlzu2A==
X-Gm-Gg: AY/fxX6EoODvokRo/F7lXg9GUybMiJFhg9K5YqEiZqo0iDeO/NJZxvaIFbYEdyyKCNh
	ZTPCf+eVcUIXovhQlNoDGnkiHiuac86uTgim5SPcIcGAPuNOIwqyInOSONMCNYVCZ8cFasRcRbv
	o2HCTtgpq1857t+fG4BF9kH6g54642wd0f2IE6P4wtO90NRRNbHRgZ3zxs4PLnq2l60XgBIg2V8
	Oh9D4/5nxs+zgBGEJegqgEGK8ut1Hdic0aO1nmCcE0y+Oyunvwmjxw10OzzHcEZV0v4eCSRiscb
	5X6VEEg0OBHrpq3ySLHRrl14SQ2sBpDA+A1V8xJaSa3lfXZ5Sc4wH9uiwHFHf1/RMHd7LsAcr2F
	EZs7yehtBpY8BbuWeOY/ellSPDJIKjTgQN1PjazpEurLdyPt23I7GU+05+akhe6e3MSboSOxwU7
	qBXbCq6t21
X-Google-Smtp-Source: AGHT+IGAViTeS7kd4tMW+oumfkk3HJftb5AefwCzHGViWFYK7BeZNdvvBwutLrLISuSybI1x0zOOHg==
X-Received: by 2002:a05:600c:a31c:b0:47d:264e:b435 with SMTP id 5b1f17b1804b1-47d264eb68dmr239325865e9.22.1767019977868;
        Mon, 29 Dec 2025 06:52:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm601067785e9.6.2025.12.29.06.52.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:52:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/4] gimp: patch CVE-2025-14422
Date: Mon, 29 Dec 2025 15:52:53 +0100
Message-ID: <20251229145256.489179-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122991

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14422

Pick the patch referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2025-14422.patch            | 66 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb    | 12 ++--
 2 files changed, 73 insertions(+), 5 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
new file mode 100644
index 0000000000..420e013916
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
@@ -0,0 +1,66 @@
+From 0a941cab81396d65a8ab547847f8c542039e214f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 23 Nov 2025 16:43:51 +0000
+Subject: [PATCH] plug-ins: Fix ZDI-CAN-28273
+
+From: Alx Sa <cmyk.student@gmail.com>
+
+Resolves #15286
+Adds a check to the memory allocation
+in pnm_load_raw () with g_size_checked_mul ()
+to see if the size would go out of bounds.
+If so, we don't try to allocate and load the
+image.
+
+CVE: CVE-2025-14422
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/4ff2d773d58064e6130495de498e440f4a6d5edb]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/common/file-pnm.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/plug-ins/common/file-pnm.c b/plug-ins/common/file-pnm.c
+index 32a33a4..9d349e9 100644
+--- a/plug-ins/common/file-pnm.c
++++ b/plug-ins/common/file-pnm.c
+@@ -674,7 +674,7 @@ load_image (GFile   *file,
+             GError **error)
+ {
+   GInputStream    *input;
+-  GeglBuffer      *buffer;
++  GeglBuffer      *buffer    = NULL;
+   GimpImage * volatile image = NULL;
+   GimpLayer       *layer;
+   char             buf[BUFLEN + 4];  /* buffer for random things like scanning */
+@@ -708,6 +708,9 @@ load_image (GFile   *file,
+       g_object_unref (input);
+       g_free (pnminfo);
+ 
++      if (buffer)
++        g_object_unref (buffer);
++
+       if (image)
+         gimp_image_delete (image);
+ 
+@@ -1060,6 +1063,7 @@ pnm_load_raw (PNMScanner *scan,
+   const Babl   *format = NULL;
+   gint          bpc;
+   guchar       *data, *d;
++  gsize         data_size;
+   gushort      *s;
+   gint          x, y, i;
+   gint          start, end, scanlines;
+@@ -1070,7 +1074,12 @@ pnm_load_raw (PNMScanner *scan,
+     bpc = 1;
+ 
+   /* No overflow as long as gimp_tile_height() < 1365 = 2^(31 - 18) / 6 */
+-  data = g_new (guchar, gimp_tile_height () * info->xres * info->np * bpc);
++  if (! g_size_checked_mul (&data_size, gimp_tile_height (), info->xres) ||
++      ! g_size_checked_mul (&data_size, data_size, info->np)             ||
++      ! g_size_checked_mul (&data_size, data_size, bpc))
++    CHECK_FOR_ERROR (FALSE, info->jmpbuf, _("Unsupported maximum value."));
++
++  data = g_new (guchar, data_size);
+ 
+   input = pnmscanner_input (scan);
+ 
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
index 9f38cdcd03..f529930dff 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.6.bb
@@ -56,11 +56,13 @@ GIDOCGEN_MESON_OPTION = "gi-docgen"
 GIDOCGEN_MESON_ENABLE_FLAG = "enabled"
 GIDOCGEN_MESON_DISABLE_FLAG = "disabled"
 
-SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz"
-SRC_URI += "file://0001-gimp-cross-compile-fix-for-bz2.patch"
-SRC_URI += "file://0002-meson.build-reproducibility-fix.patch"
-SRC_URI += "file://0001-meson.build-dont-check-for-lgi.patch"
-SRC_URI += "file://0001-meson.build-require-iso-codes-native.patch"
+SRC_URI = "https://download.gimp.org/gimp/v3.0/${BP}.tar.xz \
+           file://0001-gimp-cross-compile-fix-for-bz2.patch \
+           file://0002-meson.build-reproducibility-fix.patch \
+           file://0001-meson.build-dont-check-for-lgi.patch \
+           file://0001-meson.build-require-iso-codes-native.patch \
+           file://CVE-2025-14422.patch \
+           "
 SRC_URI[sha256sum] = "246c225383c72ef9f0dc7703b7d707084bbf177bd2900e94ce466a62862e296b"
 
 PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"

