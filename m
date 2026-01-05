Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8BDC2A08F
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61165.1767607363339860032
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XSNE/Ufc;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47a8195e515so83415445e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607362; x=1768212162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrixbsNbnNJmj6xsKotmWAUWMwXK8gP2m0G3fD9qyZo=;
        b=XSNE/UfcmnpXRhshQXKUKz7CmlR8VRsTwLuUdRF4QkqULtOrIoI8/KbLDgzxRN4GFA
         wi8OBL9/SUJYfiDP+dJniSr7STJDuCi8/qyTtZ320myvdvaiTtybP/wCPbg42nT3zXxZ
         UWZKWXMBERTiNJrPisXC3MSH9c3jhgNaeysJgFOGO3hSYD/OTtBGxR24BR8arl6hVNbc
         VVfeLAsnXrVp/2pUbVZUeIY0IDRCNXL1EU5d0iuhPtX+T8rg+dx63eBLfskfpom2iSze
         yZNc1/lwNK0dY+yokqbUegEbEC8eRH7JyTifeNUUQ7UAhQj2627GrcSoIysxmwEbEvQh
         xyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607362; x=1768212162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jrixbsNbnNJmj6xsKotmWAUWMwXK8gP2m0G3fD9qyZo=;
        b=DQaYz4VCKpQyVmJwTz7HsIVfCnPpvmZLKbZuqe51YFZ9T9C9Ry08hl1wVkSKjSuuSj
         eXhh+eYC49JmkCkBrMkFMJTZhhRjJ6ToQZ4zVOb/rLP/KCZu05LHNXsc7UDFo+Uo80Bs
         1ZH7oidZVnoLyQIjzMhe0ZkNZRStxy5A+5FR+au/0G5FNqI0ePD4sC69HEYR5LqH4Y5Z
         GsPi6BL1xlhoVIXKFwoo0sK8PzHS3qRNyeLS/IQAVL5SbLHX7E33mWwxIJkCibjn8iFI
         kf/6CDkTMxigZmTKu3eBLlZMiIPNgquGSJVQ8A01aCwjwVnj3IT1/83FWaxKfOCxP3J+
         eqSw==
X-Gm-Message-State: AOJu0Yxi1QafI/uaQFVmvOkDkkz0FDjnPtDkSUx9Oe35HOzHElxLtNAd
	bMN5QAnRxPgels6e+KKnZC1s6IWGJMs7ouu+EOpUaMcNRxEAuyLTMyD8lGM+Jw==
X-Gm-Gg: AY/fxX5YWOBWOlFJGOsKn/gMz81XT9zkMY2CmJT5qIe1LHXqJIXOievTl0YoRRE97RB
	Fl1NnaHjNPyeQ6ZQ2EniI6WBAGni02FE/HJb0CV4K3XB0UtNltJIpaTfIrhmYWlXQKtRI89Ac2S
	7UGwTeaT/rhS4o10PN9lR2aaZHKsU70S2M2vdx8jQAwgiE/i79xCPoa8Xw7IuXh+G1+9C+moEJ5
	1J57w2MZekyHZKB+8hE3I5IM2rk+sez97ErE1MUyvTy9zxIGtqExfhcKj0ltZKw+I50h5tXLITT
	Gb2DJlFm6a19SmDoYVpCgY0qOOq+rzW7bS2Ulg/uuc2RcRbCCg51ecP3G/uDmn3D+9RYwlt9pDh
	NhbdGEaNyEHqFPpagZwZ6kQskDQ5i0f7jc95U8yTs4cGEAPsdHsIgb1W1Ijm/+nd8zL3wsnB53W
	cAI4h/fnJs
X-Google-Smtp-Source: AGHT+IHn7mP0AlfARQYUJm5nhAA+lQ2iF6OofKuKQfw6AU/P+m/XFTaAPHARCSilvZ5IhKiG8xkB2A==
X-Received: by 2002:a05:600c:3486:b0:477:54cd:200a with SMTP id 5b1f17b1804b1-47d19549631mr595833755e9.6.1767607361607;
        Mon, 05 Jan 2026 02:02:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][whinlatter][PATCH 04/17] gimp: patch CVE-2025-14422
Date: Mon,  5 Jan 2026 11:02:24 +0100
Message-ID: <20260105100237.3081345-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123135

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14422

Pick the patch referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a0b41204afe57f9b2b3f2e8ff496be72d04e0eb7)
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

