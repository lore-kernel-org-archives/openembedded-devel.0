Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7670AC25B76
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 13:15:57 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.37134.1717247749992134505
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Jun 2024 06:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YTkKUFcm;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a635a74e031so375883066b.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Jun 2024 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717247748; x=1717852548; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4MNOPFxWiT3jJESDqIJi5iSgDf8vz4X7AnJyhNSSO8=;
        b=YTkKUFcmi7/zCfxd7lilAgJF4vpsluykP+djIzc7vaK2g2w9R886fjMiYkdtsNb0b8
         r4gi5at+HhYgjqj3HAA577bIDOEeqCadp0VnVLrXRBhL0kAn3CKJs8eVf6udBkenCJs4
         F5bzXvX864gpyPJS+GMmqD4ziQ9aT/sn7yx+a2knPFfXXMzko2WUcN4XWy9C1dv8WlhH
         LDnz6rv8HeNEFP/YPQWSDiBGJK8rAxj7HUrK/ovA5QqEJUoEL/pZv/ozTZSew+g2Edk5
         rM2NTp1mrAdmm4PYfZ7uuzVEoHZyZbyRD9PR5RMpW24M1xcuDP7f0A0Zv1L+MBHoxiCl
         3WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717247748; x=1717852548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4MNOPFxWiT3jJESDqIJi5iSgDf8vz4X7AnJyhNSSO8=;
        b=rpjNKYxcRreeoG9vHtGWagWGOJk1iKT9whA4RU5KhnwRm9WLCgZlGX3YcEZRR6sWI2
         GnddwpNK7KlErLqB2p7liHXRVKCoz7JfhIkRRyz0JZGG2qpLfBuOS+1ImsILzZPb7Uuw
         3/hUInLuz5ud0OcXKTjBQhPRxI+7TCSU/skqZelpcnygnwKhii5EEClCYkX9G3kxYajL
         JqqIpWiwBuHa/ZyjBxoZOhlXoS9bpohBgsriIFViJcyW0zOIFzncu2rs7IPLzBbsV8JC
         FX8+Uq45jXJFOmMVc3JIo+Xp6RJQx80p/mlYcaUHbjFHdHA1qux0UyQT2xtO0NcvVwFe
         GR3w==
X-Gm-Message-State: AOJu0YyMHPFEva53ZL5bx3o5EK5wcs4FJEHblrrjzb4EjtxTGvHdZy+W
	40360BxFGKdtfl6Dbswhx9n0NqrSoY1+SYZ4ntV9ro2C3q0MP8njz2o8nA==
X-Google-Smtp-Source: AGHT+IFPNH5GBwdcfFzZR1hdvjUeCl1znq7palryv8pnwbwox0NeaqvuIouxpgqLl9QNzd6f6KeH+w==
X-Received: by 2002:a17:907:9708:b0:a62:ddc2:8493 with SMTP id a640c23a62f3a-a682022f5cbmr481820566b.20.1717247748219;
        Sat, 01 Jun 2024 06:15:48 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68b2ed4294sm71582366b.21.2024.06.01.06.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 06:15:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libgphoto2: fix build with gcc-14
Date: Sat,  1 Jun 2024 15:15:31 +0200
Message-ID: <20240601131531.2655190-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Jun 2024 13:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110657

Fixes:
libgphoto2-2.5.31/camlibs/ptp2/chdk.c:1187:41: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]

https://github.com/gphoto/libgphoto2/issues/959
https://github.com/gphoto/libgphoto2/issues/941

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../libgphoto2/fix-build-with-gcc-14.patch    | 36 +++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.31.bb              |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/fix-build-with-gcc-14.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/fix-build-with-gcc-14.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/fix-build-with-gcc-14.patch
new file mode 100644
index 0000000000..0c2a8d4bd0
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/fix-build-with-gcc-14.patch
@@ -0,0 +1,36 @@
+From 721f7f8c3ec8058d504607873e4c317aac0c99c5 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Mon, 4 Dec 2023 13:26:08 +0100
+Subject: [PATCH] align outlen length with jpeg jeaders. fixes
+ https://github.com/gphoto/libgphoto2/issues/941
+
+---
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/721f7f8c3ec8058d504607873e4c317aac0c99c5]
+
+ camlibs/ptp2/chdk.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
+index e1d898f378..e775ea1d4b 100644
+--- a/camlibs/ptp2/chdk.c
++++ b/camlibs/ptp2/chdk.c
+@@ -1150,7 +1150,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 	struct		jpeg_error_mgr jerr;
+ 	JSAMPROW	row_ptr[1];
+ 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
+-	uint64_t	outlen = 0;
++	unsigned long	outlen = 0;
+ 	unsigned int	row_inc;
+ 	int		sshift, dshift, xshift, skip;
+ 
+@@ -1161,8 +1161,8 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
+ 		sshift = 6;
+ 		dshift = (width/height > 2) ? 6 : 12;
+ 		xshift = 4;
+-	/* Digic 6 cameras: 8 bit per element UYVY,
+-	 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
++		/* Digic 6 cameras: 8 bit per element UYVY,
++		 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
+ 	} else {
+ 		row_inc = buf_width*2;
+ 		sshift = 4;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
index 1d0b37826d..57c9d199eb 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://40-libgphoto2.rules \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
+           file://fix-build-with-gcc-14.patch \
 "
 SRC_URI[libgphoto2.sha256sum] = "4f81c34c0b812bee67afd5f144940fbcbe01a2055586a6a1fa2d0626024a545b"
 
-- 
2.45.2


