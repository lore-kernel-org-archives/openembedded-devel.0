Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEE5F47CC5
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 19:46:17 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53008.1772739967783011149
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 11:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lbyr7HtA;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439a90f194bso4456132f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 11:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772739966; x=1773344766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KytFSMHqzrmsl8MJCNlOieKgpOSasyJUGEM6u43sx6w=;
        b=Lbyr7HtAGGQ6hufYQN/QnhsM6e6BcAKtjWiDOJyoBBHRutOu/y+gGiLXGyo92niFSk
         AxdjSzU/Q41oyjbqCJgwo/sFw3Trc5iMEwGD48Qumvp794F3jVQgZCZGBlac4gYa4kw8
         N9iv17WZcjz+IOw1mtAhVdYgZl1WEaGkJCW9Cb+gC+VMbDOcJG+EnKo0JWPOxAGzst8j
         fP/ybqsm0f3fHEbb2MRhxJCJH8eBusws3ysM10gCGbhMr5uISgATEp8Up8hgfnPpxf88
         dhlIWfr5KO1AMyMLusiChaDhAbhpBJfdWhH463U/PWxIWkbGAtK/8gLjJFt3PXmiV2Uw
         gaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772739966; x=1773344766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KytFSMHqzrmsl8MJCNlOieKgpOSasyJUGEM6u43sx6w=;
        b=oscYTiIVvit7dhHKR3evOR+eulMmdBO9EzL6P31MUBE/uojwS94bAuf5AlDDh1gflF
         kw1DxLj+2FT/yEKiCSxUV6uV/GtZ3R0ey2TUZHxpZ+A6RXiZ5BG70vI3PcikEpHmSTXV
         cNGM9VIQmL7ClxU4EZZuln5JOD5TbdBoK5KKmSxO3YcYPvcjcLo/43w/+vXIcIhaHwE4
         dbFnbmfNKLbryF1ROovGJ32e78NiUT5Zv3JJjDuvRtKIr53CBgAiBkc3dYGgy7Blzv7I
         fyZMbmu3QNnQY0gK+sGjdU+U/q41NO+AWRfot0Hx0fVhG0mfemI1YMfKpm0PeGsXITH/
         2WHA==
X-Gm-Message-State: AOJu0YxmdZwFmaKSKjvmHhQMibevYm9fv8B5g74ZSNVH5+8JIucjTSSy
	Kz9jrL0Dqur1hwLXAZDfkR0XbTAH69eV6z7YhBzyhXftlV5oGHitA62lfSGDTQ==
X-Gm-Gg: ATEYQzy/d5gH24GslrW8C/jEZkIewQl9+YYLgvGV5zOm9Yz3i4QzGEP2BLK5AZNJ6tr
	9vBCwAutESsfS/NPvg4ETbxTNFIPypU5yMftTcx8UjWvAK5WAJc5Xkn5bGzC8vVBTjtFI7Ic+Ws
	9jTbUzEj6Vmn3N6pxf26jAV8G8O2hovsmd7uzKhMbbahMbA9bgvJNH8fjojrlPN5UVWrlSo8KeJ
	MJpjlBv9YztMMP0CQBeokSXjD96okGmEOWFOi8X9/220MO2qoQZXwuZGbnrcP5z1HgKcIgK/+Ix
	wn4iP5tFd7xq+lIkEus7gQI0BdKbITbFDC+JDf3b9uLnvwBOAm82592rsmHoKrM8RIVZh896P/n
	euAFCWDuj91iI83IXI3mNR0Wvtm3rKEt9FusfBHdd6j7XXL1hvLBOrRw838tlcjX6EYIWEqYyIx
	17LwTtV49mEiHYavwCfIZ/Hmt41KFGjKA=
X-Received: by 2002:a05:6000:2901:b0:439:c008:d81 with SMTP id ffacd0b85a97d-439c7f78d39mr13247119f8f.15.1772739965798;
        Thu, 05 Mar 2026 11:46:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm41751399f8f.5.2026.03.05.11.46.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 11:46:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH] gimp: add additional patch for CVE-2026-0797
Date: Thu,  5 Mar 2026 20:46:04 +0100
Message-ID: <20260305194604.13648-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 19:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124893

There is an additional patch for CVE-2026-0797, which is not mentioned
in the CVE advisory, nor in the related issue nor in the related PR, however
both the change, and the commit message shows that this is a continuation
of the original fix, which was incomplete.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-2026-0797.patch => CVE-2026-0797-1.patch} |  0
 .../gimp/gimp/CVE-2026-0797-2.patch           | 62 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  3 +-
 3 files changed, 64 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gimp/gimp/gimp/{CVE-2026-0797.patch => CVE-2026-0797-1.patch} (100%)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-2.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-1.patch
similarity index 100%
rename from meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797.patch
rename to meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-1.patch
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-2.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-2.patch
new file mode 100644
index 0000000000..e3766240ef
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-2.patch
@@ -0,0 +1,62 @@
+From 48cf2ffa1630af389fe12653f7e57529c2744664 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sat, 27 Dec 2025 05:24:03 +0000
+Subject: [PATCH] plug-ins: Additional fread () checks in ICO plug-in
+
+From: Alx Sa <cmyk.student@gmail.com>
+
+A continuation of c54bf22a that adds checks to the
+initial header loading as well, to prevent reading
+beyond the file size.
+
+CVE: CVE-2026-0797
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/905ce4b48782c5e71c79714b7ba7f6ebe4d0329d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/file-ico/ico-load.c | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/plug-ins/file-ico/ico-load.c b/plug-ins/file-ico/ico-load.c
+index 7eb9cb7..5068b10 100644
+--- a/plug-ins/file-ico/ico-load.c
++++ b/plug-ins/file-ico/ico-load.c
+@@ -437,16 +437,20 @@ ico_read_icon (FILE    *fp,
+   palette = NULL;
+ 
+   data.header_size = header_size;
+-  ico_read_int32 (fp, &data.width, 1);
+-  ico_read_int32 (fp, &data.height, 1);
+-  ico_read_int16 (fp, &data.planes, 1);
+-  ico_read_int16 (fp, &data.bpp, 1);
+-  ico_read_int32 (fp, &data.compression, 1);
+-  ico_read_int32 (fp, &data.image_size, 1);
+-  ico_read_int32 (fp, &data.x_res, 1);
+-  ico_read_int32 (fp, &data.y_res, 1);
+-  ico_read_int32 (fp, &data.used_clrs, 1);
+-  ico_read_int32 (fp, &data.important_clrs, 1);
++  if (ico_read_int32 (fp, &data.width, 1)   != 4     ||
++      ico_read_int32 (fp, &data.height, 1)  != 4     ||
++      ico_read_int16 (fp, &data.planes, 1)  != 2     ||
++      ico_read_int16 (fp, &data.bpp, 1) != 2         ||
++      ico_read_int32 (fp, &data.compression, 1) != 4 ||
++      ico_read_int32 (fp, &data.image_size, 1) != 4  ||
++      ico_read_int32 (fp, &data.x_res, 1) != 4       ||
++      ico_read_int32 (fp, &data.y_res, 1) != 4       ||
++      ico_read_int32 (fp, &data.used_clrs, 1) != 4   ||
++      ico_read_int32 (fp, &data.important_clrs, 1) != 4)
++    {
++      D(("skipping image: invalid header\n"));
++      return FALSE;
++    }
+ 
+   D(("  header size %i, "
+      "w %i, h %i, planes %i, size %i, bpp %i, used %i, imp %i.\n",
+@@ -509,7 +513,7 @@ ico_read_icon (FILE    *fp,
+ 
+   /* Read in and_map. It's padded out to 32 bits per line: */
+   and_map = ico_alloc_map (w, h, 1, &length);
+-  if (! ico_read_int8 (fp, and_map, length) != length)
++  if (ico_read_int8 (fp, and_map, length) != length)
+     {
+       D(("skipping image: too large\n"));
+       return FALSE;
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 4e0dd76744..c9bbc128c6 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -54,7 +54,8 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2025-2760-1.patch \
            file://CVE-2025-2760-2.patch \
            file://CVE-2025-2761.patch \
-           file://CVE-2026-0797.patch \
+           file://CVE-2026-0797-1.patch \
+           file://CVE-2026-0797-2.patch \
            file://CVE-2026-2044.patch \
            file://CVE-2026-2045.patch \
            file://CVE-2026-2048.patch \

