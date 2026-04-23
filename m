Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314D0F589BC
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:49:35 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18541.1776948565488081114
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MI8H/M3y;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2aae146b604so44174045ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948565; x=1777553365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjtWXtG0V77yiKvrnkAZgapG0YgfgXFMKzn1xHh3ZBE=;
        b=MI8H/M3yy4FgqCEE+/bWyaZWuDFLBAC1s5omj6I8RPPj6PQpT9L06X3o04tSKVo5B6
         bU45k3dKeeu0PC7YGIl3nPTS2QPSBluBvO4HWnCkKrTHYGwcYm2zZNg38c/McEag0xnt
         2ZGN6J1urZAjn1o8e0TiP7HGwdPbAnENx/p/XWWMirUg5e05DTL+5av+EPeHKUOiZqg4
         fhxM/DHOSEIxBVJZjw8+zFNg5G7DJcSWKPQ0+fo5WBK5oMMe69VFU6/qGx2ZGwxqAruy
         Xx0/2p1CmKFfjMMddjtKHSTG40aOIL04fQ4lO86YskQb5/HuEkYncrhpjxAnrIdYrxHQ
         vhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948565; x=1777553365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PjtWXtG0V77yiKvrnkAZgapG0YgfgXFMKzn1xHh3ZBE=;
        b=nemo/dhgrF9S029rJq8fbZCi+RVaYllFwRao+Ldelb5WKK3XqydMxzhFfRcyLIcQXh
         NhmroLVyAUuWaH+BR+urOxT9Iuk6yjbHnxfZOxPk/KZ8/yCHMDPOpTJz/nOdHOhLGvxx
         HJw0fmRUPWrCiPyrI6jTnsQ2sTrje1d8+Q+5RTGl/AuNojx0pVNyayUHXxGtQ42dr+Sg
         5kKoCRRivRvppqAdqC0X9trtKLKRZKMOhXXzMSWaeOdQiu470gD55tniPqgU4zi9wCKm
         eQY3LnpnFe1uXcCzEjT0Zt9Y1mWOicgPG5zhinXWzyjnFtU8teZcgaYByIiaDr7llhcE
         ekqg==
X-Gm-Message-State: AOJu0YzYQysS5mPtwHxjl15Qy6Z8SSPNhxNKu38W0ceduY++E8B6ycp7
	Pdp3UJPtSPkRGv1q7+CUZJAosdssN2KhQdzhHB9zfxkGqNIJ0pSSfNM/p2t62By1
X-Gm-Gg: AeBDietHWqCK082Fnh12cadfoxfk1haAp/ywQRgBRQEhgPTLGGWEH0FSpdp2ro9QR39
	GkSZP6pM/uitKXQi05yCyyKxB9RNs1yLs53N0iUDVC6R8dr2O9r4sw6w04q7VjDZnsVkA5272g5
	2GkFCoA/5UFvcDGtLmidXoS734xN4ZEWdsY8SxeFmAcAarmfobXbheD/uzB0auEynMPuwkyZIan
	mfxCaQmUTJYvPa/Q11KuoUHfRk2lQxZrSg+mzVwvj6euJMPaklzi16QklEc6PrOaPNl1kiqAOz7
	fyE3s5AIM/3hWyf84Ic/uSwwc+llTYfJWuwHKlIclA7VOTB9NTQvi5cQ3yVDEMF2cHwL2wHFYKn
	UtL5MWEvj0lyOojtOrRF/RDDOT+o7pS30t5PYQ32yvO8Lr0qzPXpYhkWHQYsdWaL6UyHM1kDfk/
	vJVScrKpQT+fOlCXvEi/fo9zSZKex831/Jmlj1FHLLSkDe2FOuP00OaTBZ+w==
X-Received: by 2002:a17:902:cec8:b0:2b0:5b4e:370c with SMTP id d9443c01a7336-2b5f9f8b3ccmr300492915ad.32.1776948564648;
        Thu, 23 Apr 2026 05:49:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa14487sm204043415ad.18.2026.04.23.05.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:49:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 8/19] libgphoto2: patch CVE-2026-40333
Date: Fri, 24 Apr 2026 00:48:06 +1200
Message-ID: <20260423124823.1983261-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
References: <20260423124823.1983261-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 12:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126584

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40333

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40333.patch   | 150 ++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |   3 +-
 2 files changed, 152 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40333.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40333.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40333.patch
new file mode 100644
index 0000000000..77c307e88d
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40333.patch
@@ -0,0 +1,150 @@
+From 8fefd2da7b9e2c7c448086cd251b108c0ebf1262 Mon Sep 17 00:00:00 2001
+From: Marcus Meissner <marcus@jet.franken.de>
+Date: Wed, 8 Apr 2026 15:18:42 +0200
+Subject: [PATCH] Fixed EOS ImageFormat/CustomFuncEx Parsers Lack Length
+ Parameter
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ptp_unpack_EOS_ImageFormat() and ptp_unpack_EOS_CustomFuncEx() accept
+const unsigned char** data but no length/size parameter. They perform
+unbounded reads via dtoh32o calls (up to 36 bytes for ImageFormat,
+up to 1024 bytes for CustomFuncEx). Callers in ptp_unpack_EOS_events()
+have xsize available but never pass it.
+
+ CVE-2026-40333
+
+Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
+
+CVE: CVE-2026-40333
+Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/1817ecead20c2aafa7549dac9619fe38f47b2f53]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ camlibs/ptp2/ptp-pack.c | 53 ++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 44 insertions(+), 9 deletions(-)
+
+diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
+index 09421b7..09dcc24 100644
+--- a/camlibs/ptp2/ptp-pack.c
++++ b/camlibs/ptp2/ptp-pack.c
+@@ -1448,7 +1448,7 @@ ptp_unpack_Canon_EOS_FE (PTPParams *params, const unsigned char* data, unsigned
+ 
+ 
+ static inline uint16_t
+-ptp_unpack_EOS_ImageFormat (PTPParams* params, const unsigned char** data )
++ptp_unpack_EOS_ImageFormat (PTPParams* params, const unsigned char** data, unsigned int *size )
+ {
+ 	/*
+ 	  EOS ImageFormat entries look are a sequence of u32 values:
+@@ -1492,30 +1492,57 @@ ptp_unpack_EOS_ImageFormat (PTPParams* params, const unsigned char** data )
+ 
+ 	const uint8_t* d = *data;
+ 	uint32_t offset = 0;
+-	uint32_t n = dtoh32o (d, offset);
++	uint32_t n;
+ 	uint32_t l, t1, s1, c1, t2 = 0, s2 = 0, c2 = 0;
+ 
++	if (*size < sizeof(uint32_t)) {
++		ptp_debug (params, "parsing EOS ImageFormat property failed 1 (size %d)", *size);
++		return 0;
++	}
++	n = dtoh32o (d, offset);
++	*size -= sizeof(uint32_t);
++
+ 	if (n != 1 && n !=2) {
+ 		ptp_debug (params, "parsing EOS ImageFormat property failed (n != 1 && n != 2: %d)", n);
+ 		return 0;
+ 	}
+-
++	if (*size < sizeof(uint32_t)) {
++		ptp_debug (params, "parsing EOS ImageFormat property failed 2 (size %d)", *size);
++		return 0;
++	}
+ 	l = dtoh32o (d, offset);
++	*size -= sizeof(uint32_t);
++
+ 	if (l != 0x10) {
+ 		ptp_debug (params, "parsing EOS ImageFormat property failed (l != 0x10: 0x%x)", l);
+ 		return 0;
+ 	}
+ 
++	if (*size < 3*sizeof(uint32_t)) {
++		ptp_debug (params, "parsing EOS ImageFormat property failed 3 (size %d)", *size);
++		return 0;
++	}
+ 	t1 = dtoh32o (d, offset);
+ 	s1 = dtoh32o (d, offset);
+ 	c1 = dtoh32o (d, offset);
++	*size -= 3*sizeof(uint32_t);
+ 
+ 	if (n == 2) {
++		if (*size < sizeof(uint32_t)) {
++			ptp_debug (params, "parsing EOS ImageFormat property failed 4 (size %d)", *size);
++			return 0;
++		}
+ 		l = dtoh32o (d, offset);
++		*size -= sizeof(uint32_t);
++
+ 		if (l != 0x10) {
+ 			ptp_debug (params, "parsing EOS ImageFormat property failed (l != 0x10: 0x%x)", l);
+ 			return 0;
+ 		}
++		if (*size < 3*sizeof(uint32_t)) {
++			ptp_debug (params, "parsing EOS ImageFormat property failed 5 (size %d)", *size);
++			return 0;
++		}
+ 		t2 = dtoh32o (d, offset);
+ 		s2 = dtoh32o (d, offset);
+ 		c2 = dtoh32o (d, offset);
+@@ -1668,12 +1695,20 @@ ptp_unpack_EOS_FocusInfoEx (PTPParams* params, const unsigned char** data, uint3
+ 
+ 
+ static inline char*
+-ptp_unpack_EOS_CustomFuncEx (PTPParams* params, const unsigned char** data )
++ptp_unpack_EOS_CustomFuncEx (PTPParams* params, const unsigned char** data, unsigned int *size )
+ {
+-	uint32_t s = dtoh32a( *data );
+-	uint32_t n = s/4, i;
++	uint32_t s, n, i;
+ 	char	*str, *p;
+ 
++	if (*size < sizeof(uint32_t))
++		return strdup("bad length");
++
++	s = dtoh32a( *data );
++	n = s/4;
++
++	if (*size < 4+s)
++		return strdup("bad length");
++
+ 	if (s > 1024) {
+ 		ptp_debug (params, "customfuncex data is larger than 1k / %d... unexpected?", s);
+ 		return strdup("bad length");
+@@ -1962,7 +1997,7 @@ ptp_unpack_EOS_events (PTPParams *params, const unsigned char* data, unsigned in
+ 			case PTP_DPC_CANON_EOS_ImageFormatExtHD:
+ 				/* special handling of ImageFormat properties */
+ 				for (j=0;j<dpd_count;j++) {
+-					dpd->FORM.Enum.SupportedValue[j].u16 = ptp_unpack_EOS_ImageFormat( params, &xdata );
++					dpd->FORM.Enum.SupportedValue[j].u16 = ptp_unpack_EOS_ImageFormat( params, &xdata, &xsize );
+ 					ptp_debug (params, INDENT "prop %x option[%2d] == 0x%04x", dpc, j, dpd->FORM.Enum.SupportedValue[j].u16);
+ 				}
+ 				break;
+@@ -2267,7 +2302,7 @@ ptp_unpack_EOS_events (PTPParams *params, const unsigned char* data, unsigned in
+ 			case PTP_DPC_CANON_EOS_ImageFormatSD:
+ 			case PTP_DPC_CANON_EOS_ImageFormatExtHD:
+ 				dpd->DataType = PTP_DTC_UINT16;
+-				dpd->DefaultValue.u16 = ptp_unpack_EOS_ImageFormat( params, &xdata );
++				dpd->DefaultValue.u16 = ptp_unpack_EOS_ImageFormat( params, &xdata, &xsize );
+ 				dpd->CurrentValue.u16 = dpd->DefaultValue.u16;
+ 				ptp_debug (params, INDENT "prop %x value == 0x%04x (u16)", dpc, dpd->CurrentValue.u16);
+ 				break;
+@@ -2275,7 +2310,7 @@ ptp_unpack_EOS_events (PTPParams *params, const unsigned char* data, unsigned in
+ 				dpd->DataType = PTP_DTC_STR;
+ 				free (dpd->DefaultValue.str);
+ 				free (dpd->CurrentValue.str);
+-				dpd->DefaultValue.str = ptp_unpack_EOS_CustomFuncEx( params, &xdata );
++				dpd->DefaultValue.str = ptp_unpack_EOS_CustomFuncEx( params, &xdata, &xsize );
+ 				dpd->CurrentValue.str = strdup( (char*)dpd->DefaultValue.str );
+ 				ptp_debug (params, INDENT "prop %x value == %s", dpc, dpd->CurrentValue.str);
+ 				break;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
index 6b5e6c21b9..e5a64c504a 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -12,7 +12,8 @@ DEPENDS = "libtool jpeg virtual/libusb0 libexif zlib libxml2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
-"
+           file://CVE-2026-40333.patch \
+           "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gphoto/files/libgphoto/"

