Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B93DFCC9D5
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 07:24:14 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34793.1773127444724126142
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 00:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WjRQJ+r7;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c4bde55cso4575267f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 00:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773127443; x=1773732243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mLDvT+Wx6tljonkfz1nViK0wSvQSXXXpfhff32hnQcI=;
        b=WjRQJ+r7PE7HjqHyGd3zrjls55Nw+Pc9hmwX6Julx203U8moPxnWa0khbsehV5o3sB
         VCdlEuLcqtJWibhcF2a+DndJZq9jM3URxeuwZrlui/s/QMCXSTcvAf1QuUupSFUCS3rC
         hY5ZSFuiTsDWzQvuo/nH97EgO2WfsvDPwVqrZJpFjtshk0U7neqgRSX77vaSDaaVTVAp
         Gs7s9nvMfYGwBaIJewhdi6WdoolIaDLTj13EwI8N+C7fwBG/qN3YYb/EM/bnTSQcDG64
         mzhHwdlyLSwt9U2s66R57k1Vlrt9nUScqk6M3+lLcSO25K5hFrYR74Nj2v8j3OsVeQcz
         WcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773127443; x=1773732243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLDvT+Wx6tljonkfz1nViK0wSvQSXXXpfhff32hnQcI=;
        b=QOWcIDJNeiNyihCEiRKrjNnb6B/aW4ZRCLhqfLjCi6hUACGbxmyf1q/LfUN7hJu74n
         c1o++I3OeJpdJxRSfw2b+qioYbnhGdOft9ERSCjX949QJIPpAhMIXlM6DutpQO3Xb6of
         t3qUpg1K6Z4NFBfkkmHdvneOYf/WQ/P0en9N/IuchRiVA251iGOG7hBwdqFmOg9oCZhT
         2+Vxo9u/ZbhMstnmWKci0a+wmNFK92edeDH0FGquuQD+zgGpj17Vr74uyhsAU81t7MYJ
         VjSoREbbXTr3TiAlvZ+aK/3Ei3QBTZoCL3wSU8fFi8bh3uZ7j08z0tpJJAqACwl05WKl
         Uk0Q==
X-Gm-Message-State: AOJu0YyyGLjZTz2cpX7sP8igdhuJPixk0LIAvdTo/Ia+MhuPGOkVym2x
	skRZ3UhUFPFEePHs2c26W/PpTU3Kf77UJdovelDXsSAkvcIhSuhj7bkUZ1QTMQ==
X-Gm-Gg: ATEYQzyXQHIe/ngFdAJ8/+GVp9OKtc6HZAND7D70cRJhp0wx2PT+vmdqBJ7L6s7SWPQ
	jFMILmUFwlBp5XL21j1OL7GFwbU2Swy5LPd1MFODoyIgzh3isL8QFyNcu3uG9yNXv6WAk3TBkdZ
	dndt5A8BLcuhxrzFHa+6dqA2amEb10+SwgwNdAuDpeurBiJ71FiEYkv2nv4spcSAQbrMKLmqt1V
	jWnnerAjil5WoNtnSMVfJEJJ7s39Hs6cWdWnfuj/i/tomOupEiO/Oz0sl4zfV2ccyDacO/TJMo5
	uUtkjWB35oT855kiGhLqwDW1Up4NzkUopg4Rrv0/zLnuaHSQv00KZbJ6SNdlDZSYkf/foGKIk2c
	92YijSXgOuejpz6ExENXwGwzsML8t/QcKArXasT4SsgPTRbYkTK0xF84Jsm/m5pnGf9oIu8QfPW
	2VLfY9XrCCPB7i0JcVhHR3
X-Received: by 2002:a05:6000:2404:b0:439:85bf:2366 with SMTP id ffacd0b85a97d-439da651e39mr22368201f8f.52.1773127442892;
        Tue, 10 Mar 2026 00:24:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm31447044f8f.26.2026.03.10.00.24.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 00:24:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH] gimp: patch CVE-2025-14422
Date: Tue, 10 Mar 2026 08:24:01 +0100
Message-ID: <20260310072401.969721-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 07:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125017

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14422

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2025-14422.patch            | 66 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb  |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
new file mode 100644
index 0000000000..3ac4e16b6f
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
@@ -0,0 +1,66 @@
+From 03104e43a71f89678ea40c45dfaad6e1f570f0cc Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Sun, 23 Nov 2025 16:43:51 +0000
+Subject: [PATCH] plug-ins: Fix ZDI-CAN-28273
+
+Resolves #15286
+Adds a check to the memory allocation
+in pnm_load_raw () with g_size_checked_mul ()
+to see if the size would go out of bounds.
+If so, we don't try to allocate and load the
+image.
+
+(cherry picked from commit 4ff2d773d58064e6130495de498e440f4a6d5edb)
+
+CVE: CVE-2025-14422
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/1ac19bec2d5938af92e4687ed6721b97514e6644]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/common/file-pnm.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/plug-ins/common/file-pnm.c b/plug-ins/common/file-pnm.c
+index 2132eec..dda44c0 100644
+--- a/plug-ins/common/file-pnm.c
++++ b/plug-ins/common/file-pnm.c
+@@ -554,7 +554,7 @@ load_image (GFile   *file,
+             GError **error)
+ {
+   GInputStream    *input;
+-  GeglBuffer      *buffer;
++  GeglBuffer      *buffer   = NULL;
+   gint32 volatile  image_ID = -1;
+   gint32           layer_ID;
+   char             buf[BUFLEN + 4];  /* buffer for random things like scanning */
+@@ -584,6 +584,9 @@ load_image (GFile   *file,
+       g_object_unref (input);
+       g_free (pnminfo);
+ 
++      if (buffer)
++        g_object_unref (buffer);
++
+       if (image_ID != -1)
+         gimp_image_delete (image_ID);
+ 
+@@ -819,6 +822,7 @@ pnm_load_raw (PNMScanner *scan,
+   GInputStream *input;
+   gint          bpc;
+   guchar       *data, *d;
++  gsize         data_size;
+   gushort      *s;
+   gint          x, y, i;
+   gint          start, end, scanlines;
+@@ -829,7 +833,12 @@ pnm_load_raw (PNMScanner *scan,
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
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index 07c9fcf666..c8db9938e4 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2023-44441.patch \
            file://CVE-2023-44442.patch \
            file://CVE-2023-44443_CVE-2023-44444.patch \
+           file://CVE-2025-14422.patch \
            "
 SRC_URI[sha256sum] = "88815daa76ed7d4277eeb353358bafa116cd2fcd2c861d95b95135c1d52b67dc"
 

