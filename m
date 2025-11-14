Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CB1CEACCE
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 20:26:37 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7587.1763151992835983883
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 12:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jx7XKDk7;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477442b1de0so16666545e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 12:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763151991; x=1763756791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RijG/uBn77GVIQcQwpzMbFwGpV1IcgmV77nCuYIjYjo=;
        b=jx7XKDk7J/0YIq83HePeydYrFKIdQLm5P7jkUxNFYqAu48IQvitNBUIzgnQRfEmCGh
         MBxod0r+l0uSNXW6Rvve6vZH2GhVT8/7jTwx3nxVuVu6ecs6VDLIZOPFDcsJoGA0yHzB
         a8QqES7khGN4H4acbYJfyGHm/0q+DJNBddjyfMbbX2s/rLKWjE/756PapGRUdRuIhrRD
         vjampGM03q6ohYQaY93zZ5Fa9yK/LuCZgev5519zFdkPP6KeWaMkVFiS/c4CPwsbTjUc
         A2V23jsMtM0S29yE49dUX10LWioggGJB/LXcUuIdB1a0p2JO2iyovZI9L+kxI80Rck6E
         0yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763151991; x=1763756791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RijG/uBn77GVIQcQwpzMbFwGpV1IcgmV77nCuYIjYjo=;
        b=p4G22izCbW26wxiv5i5rbXcIzzn5Kxr+s8Ty0gM/dsSVLyDKcUV90l7F5TbjFuuCul
         eMn1LY9da56EadrUDuz3803xU6/f0XGKsOroxiiCU5i4IRVYNYd1qdN13wXwPE1DnyBP
         2zKzdNnmk+6mvzZWAA/Ov3ojv6r+WFSyxi7ViPUZ6XQtYfksp/C05MxCBddkKA0nhEtv
         lZpoKnUBFQPSS2Y6XU1GKcT5JE8PbYUr1Sbx+0vuAXnYfNCZMg1pPqT9GWntgIqfg2tE
         2c4eu0x5RhEuUP44cv+vWGnE2qGQKxv4+DNzyd8OJl2p3MVHKcCPMekfo8dEYxWrNpKa
         T4BA==
X-Gm-Message-State: AOJu0Yy6oreWx3vH7zDjHSNRvx4b+5/C6LS1jX26zbu+/ELjyZoj0EyJ
	yqPLqRxIiupbxXnanu+Q4MY8B49bnCf8gUJLdv4SCmMggIxWGXveCkZrA3rOzZyJ
X-Gm-Gg: ASbGnctPUKGCzTDpn/Vd/8Zqi4C4AlNXpkzDcDUmFn0+pxhu8uX5ZaD7TUxn0T+BXN5
	glh6/+FdBWkjfyEI8NwfkXXanvAjdw5PD0Y0yMwg6129a++orl0NhiFxhnVSuh63/hpvqoSephf
	2zbliNoELxC5NOMLkPRWMgDzQEz+L2HNf8+NFXYUgg7JXR4Z0jC/akaQxt2Ptbwkwqo0WWmUxSi
	DO6oCnf2n5weAuJ2FaxrAriL2jMIAVs+3HtXw/c9XqYvVdoiEhGPq/O0tYb0LKoay3UnE241vHz
	N1+rNKipnql3GEvEgLlwy2ku1BT5G5MvsAHYiTxaNPyqj/mr2Hhgaa7m4rEI9doK4fBRbJNv/nl
	rM2qUUj+APKr/DRGHP57YZEiYgmBLazmWflX2+oDAg8KlfuF05rvvva2sGVvYf3uD/hOt3HBGNB
	/KRKGznun4
X-Google-Smtp-Source: AGHT+IFlAPN5ZtVHz9yCQOwTJaC5j5OSR7+OPYHjnE5yA3xjUyiAr/JyFJgWt44fb9gNetLR7xCJJw==
X-Received: by 2002:a05:600c:3ba3:b0:477:6363:d3f0 with SMTP id 5b1f17b1804b1-4778fe41c45mr44809735e9.3.1763151991091;
        Fri, 14 Nov 2025 12:26:31 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4779527a656sm23617845e9.10.2025.11.14.12.26.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 12:26:29 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/6] libwmf: patch CVE-2015-0848 and CVE-2015-4588
Date: Fri, 14 Nov 2025 21:26:24 +0100
Message-ID: <20251114202627.656631-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114202627.656631-1-skandigraun@gmail.com>
References: <20251114202627.656631-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 20:26:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121718

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
index 955dd5154b..56fd0b9eba 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -20,7 +20,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=ta
            file://libwmf-0.2.8.4-intoverflow.patch \
            file://libwmf-0.2.8.4-useafterfree.patch \
            file://0001-configure-use-pkg-config-for-freetype.patch \
-          "
+           file://CVE-2015-0848-CVE-2015-4588.patch \
+           "
 
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"
 SRC_URI[tarball.sha256sum] = "5b345c69220545d003ad52bfd035d5d6f4f075e65204114a9e875e84895a7cf8"

