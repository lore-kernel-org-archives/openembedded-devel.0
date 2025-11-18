Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A27CED279
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:31:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9417.1763461893740601976
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gq0jB647;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47774d3536dso43854185e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763461892; x=1764066692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0b0m7vueIxMY/qUlZQPRKSE6qmA9ulEChNdfw0Oa04=;
        b=Gq0jB647SMHKt9nJW/yUO0zomnIjeG57TmjNetJhhCC20GT4dfELEYksAc15qIE5Al
         5k//CidRpyJ4OqWZo1THx09JqSV3RF0yyOrpj48QujmkVSJTFKBT59t03I1K3OIx2goE
         k0G9Tqesj2WRzA3WOt5aoA+wur7Gd765Q3MY50no0rNcgYM3stqjfxEbgA41zFLuFci/
         XKrR+FRYZ9AdEq/U9vZ6Rb0Osv2pYVUbJ1IAjlELoF3ik6hVPTFOpQevFeJPo3uMUGLP
         +H+65O6g2tVT1Umf18pMRVV+vwXdviDUfOk4Q21d9KtpdpFlbS6JBwQH4xQOcxoKZQNZ
         2mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461892; x=1764066692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n0b0m7vueIxMY/qUlZQPRKSE6qmA9ulEChNdfw0Oa04=;
        b=sCZU/JB64AIw0YtVEPh0rGvWE3bqTFQAxYHoMZitirI3TphSyHEsSboZAmjWAeRM1X
         jCLjv7sV75keH34Lhlb2QNdwVFIIOPR7gaupc9nKypbdJpli4GjxVw4aNJ3fx2qhz2gV
         aFEYvhhtNbSZecKaSBdVZrpmuNqEqfHKu51QG18aj410ns2oSDKxoHIgPqdu0NtiiSMS
         IvALdefrDcmbtgwHc1+jHC0NO6PNesY1UMP/zzfYaxM/lB/HNFhMyJWltXJAJfMbZxJa
         5R1iZJTediE+9LJwbeYrG2EHuvXaH/bDd2k8E0JjRYAbk6/QLYj7Me40Y8Gpv4sQtj7z
         yn0g==
X-Gm-Message-State: AOJu0Yygh08lMuS4k+coKqBa7MrwetjL3KBmhQsHZZXOdyCynawiH5Jk
	0Cb2FrlbkovfYcPe8gEWsFHanYQL6lY7AbxBLGDd/chvyFscZXIh/V18d9fcr5Kr
X-Gm-Gg: ASbGncv3VgbUHpmWLY07J7qKFCu4pIyJshRrnnF1tVcP0/aGtQA29R38H2VJ2xitZSC
	PUJq9qy6vVLIF5GTcz+Hj17plVUE9ca8vmn+9pCtmfePQ1Kz8BXawI9+u9Ty0HGPpLunq0wmNdT
	4KaYinM/M4UfxWYMlJG8Kfunx0PQB5cueGmHVTfeo1SKtRIT9GFsUBgQLKTHD+DQmlFDDkSMRSC
	Y+63s+ws3X+Rc2jlRyABm3MS6WK6naSThgz4j8yO36ImvWCBW3nZW6+uWV4NVKrAxiT+/hxcl2n
	1m5GZ3QBeC5B/54AnZ9PKygdBNw/aNLIPMD+KhG/E81stLPhiysnC5ac40OoJgY4gLAHGiWmKzX
	u7BFWW6Y+2IYJLXTlauwVo2Y1ZG7QKP3q2LLsjhJb7D747X37vff8RNOGn37rs0ZBU2cyFMrIyT
	DlbA/DZ+VD
X-Google-Smtp-Source: AGHT+IEbvZe3AosdMOBpKGsKQ5kY6bhdUmXKkcvc/9aclXJsZ+94cidXbe/B7GX7i43hbON0RMRYBg==
X-Received: by 2002:a05:600c:c1c8:20b0:477:a2f7:74de with SMTP id 5b1f17b1804b1-477a94acee9mr18436965e9.3.1763461891888;
        Tue, 18 Nov 2025 02:31:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a81c567bsm55743925e9.9.2025.11.18.02.31.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:31:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/6] libwmf: patch CVE-2015-0848 and CVE-2015-4588
Date: Tue, 18 Nov 2025 11:31:25 +0100
Message-ID: <20251118103128.1471091-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118103128.1471091-1-skandigraun@gmail.com>
References: <20251118103128.1471091-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121845

Details:
https://nvd.nist.gov/vuln/detail/CVE-2015-0848
https://nvd.nist.gov/vuln/detail/CVE-2015-4588

Pick the commit that mentions the CVE IDs explicitly.
The same patch fixes both vulnerabilities.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/CVE-2015-0848-CVE-2015-4588.patch  | 135 ++++++++++++++++++
 .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |   3 +-
 2 files changed, 137 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-0848-CVE-2015-4588.patch

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-0848-CVE-2015-4588.patch b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-0848-CVE-2015-4588.patch
new file mode 100644
index 0000000000..b65610aa88
--- /dev/null
+++ b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-0848-CVE-2015-4588.patch
@@ -0,0 +1,135 @@
+From f42e4f4505b07278f4baccddfc1f47059ae4f931 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Caol=C3=A1n=20McNamara?= <caolanm@redhat.com>
+Date: Wed, 8 Aug 2018 13:59:18 +0100
+Subject: [PATCH] CVE-2015-0848+CVE-2015-4588
+
+CVE: CVE-2015-0848 CVE-2015-4588
+Upstream-Status: Backport [https://github.com/caolanm/libwmf/commit/879d6bffa6dd21b8c0e9ec3b5aa31b6ae090ef83]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/ipa/ipa.h     |  2 +-
+ src/ipa/ipa/bmp.h | 38 +++++++++++++++++++++++++++++++-------
+ 2 files changed, 32 insertions(+), 8 deletions(-)
+
+diff --git a/src/ipa/ipa.h b/src/ipa/ipa.h
+index d050a7e..3003540 100644
+--- a/src/ipa/ipa.h
++++ b/src/ipa/ipa.h
+@@ -48,7 +48,7 @@ static int            ReadBlobByte (BMPSource*);
+ static unsigned short ReadBlobLSBShort (BMPSource*);
+ static unsigned long  ReadBlobLSBLong (BMPSource*);
+ static long           TellBlob (BMPSource*);
+-static void           DecodeImage (wmfAPI*,wmfBMP*,BMPSource*,unsigned int,unsigned char*);
++static int            DecodeImage (wmfAPI*,wmfBMP*,BMPSource*,unsigned int,unsigned char*);
+ static void           ReadBMPImage (wmfAPI*,wmfBMP*,BMPSource*);
+ static int            ExtractColor (wmfAPI*,wmfBMP*,wmfRGB*,unsigned int,unsigned int);
+ static void           SetColor (wmfAPI*,wmfBMP*,wmfRGB*,unsigned char,unsigned int,unsigned int);
+diff --git a/src/ipa/ipa/bmp.h b/src/ipa/ipa/bmp.h
+index 29eee34..7751a36 100644
+--- a/src/ipa/ipa/bmp.h
++++ b/src/ipa/ipa/bmp.h
+@@ -859,7 +859,7 @@ static long TellBlob (BMPSource* src)
+ %
+ %
+ */
+-static void DecodeImage (wmfAPI* API,wmfBMP* bmp,BMPSource* src,unsigned int compression,unsigned char* pixels)
++static int DecodeImage (wmfAPI* API,wmfBMP* bmp,BMPSource* src,unsigned int compression,unsigned char* pixels)
+ {	int byte;
+ 	int count;
+ 	int i;
+@@ -870,12 +870,14 @@ static void DecodeImage (wmfAPI* API,wmfBMP* bmp,BMPSource* src,unsigned int com
+ 	U32 u;
+ 
+ 	unsigned char* q;
++	unsigned char* end;
+ 
+ 	for (u = 0; u < ((U32) bmp->width * (U32) bmp->height); u++) pixels[u] = 0;
+ 
+ 	byte = 0;
+ 	x = 0;
+ 	q = pixels;
++	end = pixels + bmp->width * bmp->height;
+ 
+ 	for (y = 0; y < bmp->height; )
+ 	{	count = ReadBlobByte (src);
+@@ -884,7 +886,10 @@ static void DecodeImage (wmfAPI* API,wmfBMP* bmp,BMPSource* src,unsigned int com
+ 		{	/* Encoded mode. */
+ 			byte = ReadBlobByte (src);
+ 			for (i = 0; i < count; i++)
+-			{	if (compression == 1)
++			{	
++				if (q == end)
++					return 0;
++			 	if (compression == 1)
+ 				{	(*(q++)) = (unsigned char) byte;
+ 				}
+ 				else
+@@ -896,13 +901,15 @@ static void DecodeImage (wmfAPI* API,wmfBMP* bmp,BMPSource* src,unsigned int com
+ 		else
+ 		{	/* Escape mode. */
+ 			count = ReadBlobByte (src);
+-			if (count == 0x01) return;
++			if (count == 0x01) return 1;
+ 			switch (count)
+ 			{
+ 			case 0x00:
+ 			 {	/* End of line. */
+ 				x = 0;
+ 				y++;
++				if (y >= bmp->height)
++					return 0;
+ 				q = pixels + y * bmp->width;
+ 				break;
+ 			 }
+@@ -910,13 +917,20 @@ static void DecodeImage (wmfAPI* API,wmfBMP* bmp,BMPSource* src,unsigned int com
+ 			 {	/* Delta mode. */
+ 				x += ReadBlobByte (src);
+ 				y += ReadBlobByte (src);
++				if (y >= bmp->height)
++					return 0;
++				if (x >= bmp->width)
++					return 0;
+ 				q = pixels + y * bmp->width + x;
+ 				break;
+ 			 }
+ 			default:
+ 			 {	/* Absolute mode. */
+ 				for (i = 0; i < count; i++)
+-				{	if (compression == 1)
++				{
++					if (q == end)
++						return 0;
++					if (compression == 1)
+ 					{	(*(q++)) = ReadBlobByte (src);
+ 					}
+ 					else
+@@ -943,7 +957,7 @@ static void DecodeImage (wmfAPI* API,wmfBMP* bmp,BMPSource* src,unsigned int com
+ 	byte = ReadBlobByte (src);  /* end of line */
+ 	byte = ReadBlobByte (src);
+ 
+-	return;
++	return 1;
+ }
+ 
+ /*
+@@ -1143,8 +1157,18 @@ static void ReadBMPImage (wmfAPI* API,wmfBMP* bmp,BMPSource* src)
+ 		}
+ 	}
+ 	else
+-	{	/* Convert run-length encoded raster pixels. */
+-		DecodeImage (API,bmp,src,(unsigned int) bmp_info.compression,data->image);
++	{
++		if (bmp_info.bits_per_pixel == 8)	/* Convert run-length encoded raster pixels. */
++		{
++			if (!DecodeImage (API,bmp,src,(unsigned int) bmp_info.compression,data->image))
++			{	WMF_ERROR (API,"corrupt bmp");
++				API->err = wmf_E_BadFormat;
++			}
++		}
++		else
++		{	WMF_ERROR (API,"Unexpected pixel depth");
++			API->err = wmf_E_BadFormat;
++		}
+ 	}
+ 
+ 	if (ERR (API))
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 93b58057ce..bea9ed6dc8 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -19,7 +19,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=ta
            file://libwmf-0.2.8.4-intoverflow.patch \
            file://libwmf-0.2.8.4-useafterfree.patch \
            file://0001-configure-use-pkg-config-for-freetype.patch \
-          "
+           file://CVE-2015-0848-CVE-2015-4588.patch \
+           "
 
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"
 SRC_URI[tarball.sha256sum] = "5b345c69220545d003ad52bfd035d5d6f4f075e65204114a9e875e84895a7cf8"

