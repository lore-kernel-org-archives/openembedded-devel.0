Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0290DCCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 15:03:05 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.1051.1759935779644912223
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 08:02:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DHq29puM;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd68bso15851161a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759935778; x=1760540578; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzs4GP6GdsX3Rz4crvDuTqPh3LUB4YBjUOBQcT9Vm/U=;
        b=DHq29puMfpCW/mgQy1OPlxgM/y73+7i9CWdOu5mvKuJCQM+deboR3S+/jWC8Ge2dKx
         HTKI+E1mbXYMYuwAiGg3XpZ5c5UAFKeijSuEXNjKasA3ofNDsDYrq4gzuEx9O3lCI+ba
         gue5fRxWpAT7/lfkfj/N5Pt79a0sSa601dtQuAAdNEtfDQvZcR2guzLrZy5Zt3+qtKg2
         nTANngpEFHqfz3ahQ9nPyHyfpJYPomVP3lxMdy0vn3XNqkSeGjDX3g918sW43T32oLeX
         pUmO9QEUYDuuqNb/FPB8RFFtOVTw/rGUag02hHdL0bdZ5okcui7F6xWadNv6D8dFoc27
         3veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759935778; x=1760540578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzs4GP6GdsX3Rz4crvDuTqPh3LUB4YBjUOBQcT9Vm/U=;
        b=DnYRtD21roCXFu7ft1dqrzg9cwDzF1PPTP7yZTbAv7dZ6PNDKm1fj9eL4PXK/k1jG9
         qt5xyC8RVkQmDbA/tX7e5ZOnsHXZcfd8mB5kIurT+NISydxHa9VlpS5vpmp2LQAIp3Zi
         ks8jMRc1JZJC+SBHtqKe/zJQYDqAk6DUQ4+c1GsPZHbMNHWSipfWDUFbaznUJNopZZDc
         uCb1zrXK+wQA1Zc8Tj0cgDRSj7XcFLh9ByJ1wYxp04yOWw1AmpgRQfPvwhDxUUrX61Jr
         Rucnk9ZhZnbIDckwvipVSgo9SwFJEWP64om/Jr8Yc1+n5iDKl8WgOOEsqcby76WglU5H
         YWgg==
X-Gm-Message-State: AOJu0YzEE75oVio8YfmMJLABv8tu9qfUbzlfgID4vV00Bi/gy9UbITnB
	xTvhyrxicpvbAddho8bl+V9Pk2wP3NZvppHAS/Y//8O1nWNfHQdJmXG0mX8iNbNh
X-Gm-Gg: ASbGncugiUKS2jldj92TsoislUKkRazwqFNujHce+UQcgOe+yDiLfsahfSAtsiucZu3
	CYFWU2q8p6tlqn1K23ZlkBIXIsqc0CfcYl45CPjQl01pVzeLfceYbA1J/uX3l1aAc/PO31ZC3ZC
	IbUSicMuJI6WNULquC4TulkU6hUme0HMXHyGzwKmPSgjsWau9Nl1RMfhXOVRTzKtFyiQT5yx5i8
	ZTI/6Ris2qiYgACo9l4OuW0alsSyq49hU0q6EYPUeWd+8FFnpc0ixgyTAuwsCDy7ahA7Me1iuKf
	RTA6Y96a4Fywa1r/p+QZVAqoHBUbz44Ly+DurxEJLAwql3cvKGGX9YJ0XaYgh+/IeHj/zp4MSTT
	WDj+XybSfJacCzKRRV77aaBP4QjDfYbdtagVBb4UDlj5Z
X-Google-Smtp-Source: AGHT+IFLofCx+eiaeDvuiLZ3l4TM6/8lBrg1dPiZXdAsZ34Pnc9pQXQpCnxk/lvGdDMbhBc2UVjCjg==
X-Received: by 2002:a17:907:7b9d:b0:b42:f820:b7c with SMTP id a640c23a62f3a-b50abab5c0bmr446432766b.41.1759935776049;
        Wed, 08 Oct 2025 08:02:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f3cdbf1fsm193256a12.23.2025.10.08.08.02.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 08:02:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][walnascar][PATCH] gimp: patch CVE-2025-5473
Date: Wed,  8 Oct 2025 17:02:54 +0200
Message-ID: <20251008150254.442766-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 15:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120370

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-5473

Pick the patch that resolved the relevant upstream bugreport:
https://gitlab.gnome.org/GNOME/gimp/-/issues/13910

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...01-plug-ins-ZDI-CAN-26752-mitigation.patch | 38 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-plug-ins-ZDI-CAN-26752-mitigation.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-plug-ins-ZDI-CAN-26752-mitigation.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-plug-ins-ZDI-CAN-26752-mitigation.patch
new file mode 100644
index 0000000000..6cc35a88dd
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-plug-ins-ZDI-CAN-26752-mitigation.patch
@@ -0,0 +1,38 @@
+From 9df9326e291876d4447558f710976d4830d19d2f Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Sat, 3 May 2025 14:13:46 +0000
+Subject: [PATCH] plug-ins: ZDI-CAN-26752 mitigation
+
+Resolves #13910
+Since ICO can store PNGs, it's possible to create an
+icon that's much larger than the stated image size and
+cause a buffer overflow.
+This patch adds a check to make sure the width * height * 4
+calculation does not overflow in addition to making sure it
+doesn't exceed the maximum allowed size for that icon.
+
+CVE: CVE-2025-5473
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/c855d1df60ebaf5ef8d02807d448eb088f147a2b]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/file-ico/ico-load.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/plug-ins/file-ico/ico-load.c b/plug-ins/file-ico/ico-load.c
+index 9a22299..818cf23 100644
+--- a/plug-ins/file-ico/ico-load.c
++++ b/plug-ins/file-ico/ico-load.c
+@@ -299,7 +299,11 @@ ico_read_png (FILE    *fp,
+   png_read_info (png_ptr, info);
+   png_get_IHDR (png_ptr, info, &w, &h, &bit_depth, &color_type,
+                 NULL, NULL, NULL);
+-  if (w*h*4 > maxsize)
++  /* Check for overflow */
++  if ((w * h * 4) < w       ||
++      (w * h * 4) < h       ||
++      (w * h * 4) < (w * h) ||
++      (w * h * 4) > maxsize)
+     {
+       png_destroy_read_struct (&png_ptr, &info, NULL);
+       return FALSE;
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
index b1e61bf4ec..4b2733aa37 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
@@ -61,6 +61,7 @@ SRC_URI += "file://0001-gimp-cross-compile-fix-for-bz2.patch"
 SRC_URI += "file://0002-meson.build-reproducibility-fix.patch"
 SRC_URI += "file://0001-meson.build-dont-check-for-lgi.patch"
 SRC_URI += "file://0001-meson.build-require-iso-codes-native.patch"
+SRC_URI += "file://0001-plug-ins-ZDI-CAN-26752-mitigation.patch"
 SRC_URI[sha256sum] = "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0ad8cbcbf6ea571a2"
 
 PACKAGECONFIG[aa] = "-Daa=enabled,-Daa=disabled,aalib"

