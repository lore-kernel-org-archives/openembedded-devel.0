Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BDDC87FDA
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 03:49:39 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.17159.1754452171026067762
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Aug 2025 20:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Njen9fCa;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-742f983e313so1406593a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Aug 2025 20:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754452170; x=1755056970; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOXabrpQ8n/CnZdBFqwt0hQl5ljNSTgH6L/oYghUMJA=;
        b=Njen9fCauTxcgGMn4Z/Ly7JxeMA+T1pcEXMMBaKbg2Q5gaL/976wyW8SqrcnFA759d
         naOC69OWraaBHLyOIx7fmWomuxmfkdTGF728/OF/aHYA+j+zNJVdIhOPXm5VD8rN9xXM
         koU7vvmc9RRHCLPNNhUpZy20Ov9BFztryXsRywVR16tfsZxeYyY/TPH+OTGYRK9P0bp5
         CKqntRuD3PiEQpYqH3LOjoHhgwP9LoSdKiTgnPu4PAEgPvMK9qEre0031+pOx9az783W
         AILuF83iiAFfOU2zKbIutm418dNKZ14BdCOm2TIgj2ct5W6QfeXYUtCYbx87GnE1DMxD
         tTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754452170; x=1755056970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOXabrpQ8n/CnZdBFqwt0hQl5ljNSTgH6L/oYghUMJA=;
        b=GjY0cfJJWuG/FoVAUbiJJmcn50mf+fqq7RR3yBA2mm2l/QYcBnAAFaSfOv3JQwwsrc
         KkCfJ2awT/CAb3PMdK6qAzI4UHrwHXfm+rTICR25KX3k2mKlEyDUCuoi5kHPbpQLvFyd
         X9SsxliqpXOyDh4PSl18sKOECredJoK7P8UxWBQ0YCT7qIFhRG/lkzUr6caXICgiXWSe
         Pc0ezAEQrC/CS0MtwGRufwECoDO30OLrGbjuH3nk6b32BzpcNJjKUp5uDPW6pq6ozCIv
         8Oa2tDgfobvh6Zd0s4R3Zt9caFspMbOjlh+IuA+YxUEZkeaO6mXTGYkI8LfRA3eDv/OD
         g0fQ==
X-Gm-Message-State: AOJu0Ywczk2J49cgsc7opNgelR0vQv/MWXOdMoFCZdHV8+KmnwRWgwd/
	3+soJYLBwSl6QMkyWufXJYTdKzesf6+7HFH6LKwuoL6DHkp65PJE/iOQZwoFk5PJE/Y=
X-Gm-Gg: ASbGncs7rkqGoATwfEiiqoC6H7dot7T+T3PV64r/dYow1O1vPHKkSJxUbn3fmIeY6Qc
	MfbDpvCiBCFIOHf7fbM0g55kWt+U5GAScwEjw6J8Yn4VbuZJYc+c6sQSMrt2+IAMFmlzCxYu2+o
	U+xgnROE21/+RjzvBNu4yjMAibQwyC7g1OHuGhlKPioOvi5kmpRWTOU4SK1yRz9dhh/xp70F8UE
	p1eTCjim8FAm/6b3DiSIF6EeqEXGvpGHEvJOb/ZtTjT171vSF2yBHMdoV5Qeki3GGpuL468lLtw
	Iuegxc7FRAvzBDX+fYYHp9lTAWK61sIL6QHXQ4+vcdatXsUUUtKUzpEH9Z9+sUsO2bJcEzcBuyo
	o0pSqSmVsezwKjKloWOkNfvmQGH0K1ejv
X-Google-Smtp-Source: AGHT+IEMhL63NHF670reUvfOyVlVYYKUCjErpqyQ66Gw/MVPyCAyirr+JWnuYncmEq89HuUpdnkzOg==
X-Received: by 2002:a05:6830:4109:b0:73c:bb23:3d38 with SMTP id 46e09a7af769-74308e8b857mr1153324a34.20.1754452169576;
        Tue, 05 Aug 2025 20:49:29 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::ccc5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7b2700sm12361848a12.15.2025.08.05.20.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 20:49:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libgphoto2: Upgrade to 2.5.32
Date: Tue,  5 Aug 2025 20:49:25 -0700
Message-ID: <20250806034926.3195325-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 03:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118884

Use xz for archive and drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libgphoto2/fix-build-with-gcc-14.patch    | 36 -------------------
 ...gphoto2_2.5.31.bb => libgphoto2_2.5.32.bb} |  5 ++-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/fix-build-with-gcc-14.patch
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.31.bb => libgphoto2_2.5.32.bb} (85%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/fix-build-with-gcc-14.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/fix-build-with-gcc-14.patch
deleted file mode 100644
index 0c2a8d4bd0..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/fix-build-with-gcc-14.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 721f7f8c3ec8058d504607873e4c317aac0c99c5 Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Mon, 4 Dec 2023 13:26:08 +0100
-Subject: [PATCH] align outlen length with jpeg jeaders. fixes
- https://github.com/gphoto/libgphoto2/issues/941
-
----
-Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/721f7f8c3ec8058d504607873e4c317aac0c99c5]
-
- camlibs/ptp2/chdk.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/camlibs/ptp2/chdk.c b/camlibs/ptp2/chdk.c
-index e1d898f378..e775ea1d4b 100644
---- a/camlibs/ptp2/chdk.c
-+++ b/camlibs/ptp2/chdk.c
-@@ -1150,7 +1150,7 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
- 	struct		jpeg_error_mgr jerr;
- 	JSAMPROW	row_ptr[1];
- 	uint8_t		*outbuf = NULL, *tmprowbuf = NULL;
--	uint64_t	outlen = 0;
-+	unsigned long	outlen = 0;
- 	unsigned int	row_inc;
- 	int		sshift, dshift, xshift, skip;
- 
-@@ -1161,8 +1161,8 @@ static void yuv_live_to_jpeg(unsigned char *p_yuv,
- 		sshift = 6;
- 		dshift = (width/height > 2) ? 6 : 12;
- 		xshift = 4;
--	/* Digic 6 cameras: 8 bit per element UYVY,
--	 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
-+		/* Digic 6 cameras: 8 bit per element UYVY,
-+		 * 4 bytes used to encode 2 pixels, need 6 bytes raw YUV data for jpeg encoding */
- 	} else {
- 		row_inc = buf_width*2;
- 		sshift = 4;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
similarity index 85%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
index 0b58e8e75f..0fe2feca6e 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.31.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.32.bb
@@ -9,12 +9,11 @@ DEPENDS = "libtool jpeg virtual/libusb0 libexif zlib libxml2"
 #  libgphoto2-2.5.8/packaging/generic$ qemu-arm -s 1048576 -r 2.6.24 -L /OE/angstrom-dev/staging/armv5te-angstrom-linux-gnueabi/ .libs/print-camera-list
 # They are release specific, so please regen when adding new releases
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
-           file://fix-build-with-gcc-14.patch \
 "
-SRC_URI[libgphoto2.sha256sum] = "4f81c34c0b812bee67afd5f144940fbcbe01a2055586a6a1fa2d0626024a545b"
+SRC_URI[libgphoto2.sha256sum] = "495a347be21b8f970607a81e739aa91513a8479cbd73b79454a339c73e2b860e"
 
 inherit autotools pkgconfig gettext lib_package
 

