Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44B6AF36C2C
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:05 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13768.1776666479906221611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:28:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fvUk08eU;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b150559bso19872445e9.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666478; x=1777271278; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xp7J3G5SP2J9RSyEitHxEKvw5YHRjbcgqszFPRGpSeQ=;
        b=fvUk08eULvwfbzTdDMkKh8Sz1g5nF8cdGK0bjAV24qpd6rhjJuHUd7zLZpB8aKD+HY
         3F51ZTJkjXoFVIs4n5eFrKSKPt96ZGT5zXX466mCZ/Q29cZPbxDNAY5rK5l873dSNfVk
         6OENh8AJDB4ZFwT+V0hLgjkZaIBa+tIaJNVGzWEqbrhzv6zFY/hNlF/XMgowVIp9ieDu
         Uut06sU8rL3mzGWM5XogsfHsNZL6P6b17pwpZjHZke7s7Pk5NmbVF+VVJcdOuCQXWOxQ
         BwVnxe4cJHQFk2OmkfNPDIH9nqUY1YDibbwAaXCpZTCaT6pZ3j0K1j2qUukFp/AdCZ34
         0jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666478; x=1777271278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xp7J3G5SP2J9RSyEitHxEKvw5YHRjbcgqszFPRGpSeQ=;
        b=l1JcJhreuN/ULCv6GEqrOx3OpIVuzb+yDyiBia7GI9sJx6Fy8B4hn2khBXMgJ+1MgN
         USDmN0yUuZINVXFEciV4WaA67P4ybEfTLg1UW+Zk/AV2VsYGK3eoPS0sJKgD9IwvaieT
         iLFgV0JKVES7ibZ2Q6B6206t+8rgYq/EM0IFexedAptf/zY8tDidNmxyX9OuWYxLipaM
         b8VRrRmJsGzPuSEW59iAqdL/L4XQqKRAL91iyWbHjfAuJDRW6RlR1ICkOnR6xlGU4722
         9rGBUjissKRCxcq2z2gMlgKysv4EEugbMnrSrl9ztuWoGl70LiKUIVVzVcbsaz+TZHUw
         AKqQ==
X-Gm-Message-State: AOJu0YyUGlhNKdCvbU0idoAqZzVasKHzDV5bv/PqC2fjePGfn5N6gACL
	CloGAO2SMPqWUI/8lhLqvKgZ1J+NoDps6Zq06NURRznYuepIlqg8KpDYrzxqyQ==
X-Gm-Gg: AeBDieuma99mcTpB+GsnSm9ViCRmYUmyFiMFJg9sWJI/5hloSpfvL0St5+3GrMMtLWM
	czn1RCEP1zPDSqvS/9bCnGGJMqI2fEahQvycdpjI/jPWTvP8OjELN1f+xay14U2WxND1QiXzDZy
	z0ILb46JhEv9DUDc5vpdEWBH03kciPUN6FGuYGXKDmTrhPvRsNUYlKDDGKDzFMSJ5RnDk7lk3kq
	gPO5nbsapg6jcwcCx5JVCVBRBNKFGkeYEMF5XkzVulRFejvYlOclZwcK2w8XQ+xpDCJGaizLhgG
	yrJl6EWzjfB8OgE7XLF8FvKQAPbXXTermh0A7T5g53AwCiyEIRHGBwfyNWrFA5AZ9QO/+9L3oT7
	Lp/XuAvp2QSelsZY87P1+uv8z/zKyViwfoD6NTZxYWD4IGMIduIQmaY7XU3vRvQFpsVUNXwJwXO
	bRDz5TLmTXpLsXj1pJrMrlycnwPCdTLgU1XzQHENNuFA==
X-Received: by 2002:a05:600c:4818:b0:489:1c5f:3a9e with SMTP id 5b1f17b1804b1-4891c5f3cc1mr19779315e9.13.1776666478064;
        Sun, 19 Apr 2026 23:27:58 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 09/17] libgphoto2: patch CVE-2026-40333
Date: Mon, 20 Apr 2026 08:27:41 +0200
Message-ID: <20260420062750.3795917-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126473

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-40333

Backport the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gphoto2/libgphoto2/CVE-2026-40333.patch   | 150 ++++++++++++++++++
 .../gphoto2/libgphoto2_2.5.33.bb              |   5 +-
 2 files changed, 153 insertions(+), 2 deletions(-)
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
index 3644bd9bf4..ac7892151f 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
@@ -12,8 +12,9 @@ DEPENDS = "libtool jpeg virtual/libusb0 libexif zlib libxml2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
-		   file://0001-libgphoto2-fix-const-correctness-for-c23-builds.patch \
-"
+           file://0001-libgphoto2-fix-const-correctness-for-c23-builds.patch \
+           file://CVE-2026-40333.patch \
+           "
 SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gphoto/files/libgphoto/"

