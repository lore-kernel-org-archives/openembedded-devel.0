Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458EED185D5
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4005.1767869642680421367
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:54:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y2EaKpDV;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47a8195e515so21914025e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869641; x=1768474441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZdn1xgU4bgpzzvwnflAwDvUFo4f5+twS2f/w7Hg/1I=;
        b=Y2EaKpDVQRph1nGl2QIzAi9XaB+7qE5TsA51xR8UNQprV5X/DkaGHkL9uzWzlzfLZR
         M6TeCo1qoVC8BnEZLBeU8uOzwOcQQz/B7YEfaIM6MleEX1Es881ZTaOkLLNo2fH8DIIz
         G/c3iRePBL+VDlotyz2YmbAVbA3YI9dhbwvnabHBdcnESdoAb2jhNzQ0UN0ysGrFdkkd
         vAmnqJJWTZcOrcPq24Z7D28nzCTJAQHg3+6605eeEgVOhC9NIe5kQm8yHa9YJo1HoXiw
         ziv9wyG/s/5a4Pcl690bqXACZqcQ7mRu3U5rteYIe+2XVJQGvkVJuDBZIGgaikgV/lB7
         l8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869641; x=1768474441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZdn1xgU4bgpzzvwnflAwDvUFo4f5+twS2f/w7Hg/1I=;
        b=mE/vxjFtug9DqLjDVHT5i+g0t7bX8L7YACeJxbeJWRsJNI7uEJRB+mBahs+7SEb6zI
         CQ1Bfnrtlyu7TdGFUVWDM0AAO+FA722bTDMlY4yu5m27mXzgwZzfqsqsnARLpd7CGkdz
         YZP3ZGA5ujWb0SFQSV2eo1TwA7qPD54yn1KhLsjRae39QYW8zH/H6aFEKIRG0KZCj1WH
         VapEz+dZuO8QmmDxQsdKz7sJ4BKuIcSSSBKcEsMYQ1RkzIw3650UaICJUdXLieUQVp6G
         vBZbzmQYIJCimvvN0fLRXq7Uw/ShaZG4nn41aZHRE7AJLUyM00w5MZX/QvxCTM+c07xs
         sTRA==
X-Gm-Message-State: AOJu0YzEN92whknTD/JP3mEB5tvCbz51HbTB1E/gQqbYDp536H7L1JNm
	MOBjF91rYaIoUPjFFTxeI751+RFVF00qqBQ8FaO7Ua2IiljX+ZLLGVquEtssiA==
X-Gm-Gg: AY/fxX6QRHZ3ne2mVgDtu0KAQdXejtZ5MVnuubn6ohfiJPizA0mwxet2DbAZ23o+2jX
	LH418gaS+YeelwRSqxtpSbHyYB249xwJru4IRmM7HSM3TBaLouo0vAGxz84MPbS4A6AzWV5/BEP
	zRObw7B9kqD+Fd73cmFhNoTWm7seDkFppDwwD0EWqnQ6pYS2QBYtunNwt8fmKyHUcdQj8mUeg7R
	W8+U1oO5xasqkYDriBaXUp8UktchTFR99r6CGGnYW5TL0KGFr2AHYl8GlQrrRRQYYEFCwu0W6Fk
	y8CWKkSyqL/r21FEBpm7XtZPNoQiO3qi4a+7xflfQxP4PotPLVnVMH6Kh0t6DstVTFNQpumtQr5
	syc6g8fu/fJE76rFUpRiAJd7ZYA366ZqrK+64pHTqJBRcssG3d/xBwsAg4gHFMIDxmxthcRUvEn
	LA9sy7Vxwg
X-Google-Smtp-Source: AGHT+IHdRLopGDtNn6riB78R0EYUUyNWbGzTFEKUzduoslTzR23v01U2jXC96lbvrB+Frh/ehvfM3Q==
X-Received: by 2002:a05:600c:820f:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47d84b32f09mr63255525e9.22.1767869640986;
        Thu, 08 Jan 2026 02:54:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.53.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:53:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 09/15] imagemagick: patch CVE-2025-55154
Date: Thu,  8 Jan 2026 11:53:11 +0100
Message-ID: <20260108105317.460246-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123263

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-55154

Pick the patch that mentions the related github advisory[1]
in its commit message.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qp29-wxp5-wh82

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-55154.patch          | 79 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch
new file mode 100644
index 0000000000..52f4ac1525
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-55154.patch
@@ -0,0 +1,79 @@
+From 963d61bbea3facd347262316201f3b8b7e3dc470 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 9 Aug 2025 08:28:23 -0400
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-qp29-wxp5-wh82
+
+CVE: CVE-2025-55154
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/db986e4782e9f6cc42a0e50151dc4fe43641b337]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/png.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/coders/png.c b/coders/png.c
+index c6fae6283..0191c6f1f 100644
+--- a/coders/png.c
++++ b/coders/png.c
+@@ -6398,19 +6398,19 @@ static Image *ReadOneMNGImage(MngReadInfo* mng_info,
+               mng_info->magn_methy = 1;
+             if (mng_info->magn_methx == 1)
+               {
+-                magnified_width=mng_info->magn_ml;
++                magnified_width=(size_t) mng_info->magn_ml;
+ 
+                 if (image->columns > 1)
+                    magnified_width += mng_info->magn_mr;
+ 
+                 if (image->columns > 2)
+-                   magnified_width += (png_uint_32)
++                   magnified_width += (size_t)
+                       ((image->columns-2)*(mng_info->magn_mx));
+               }
+ 
+             else
+               {
+-                magnified_width=(png_uint_32) image->columns;
++                magnified_width=(size_t) image->columns;
+ 
+                 if (image->columns > 1)
+                    magnified_width += mng_info->magn_ml-1;
+@@ -6419,25 +6419,25 @@ static Image *ReadOneMNGImage(MngReadInfo* mng_info,
+                    magnified_width += mng_info->magn_mr-1;
+ 
+                 if (image->columns > 3)
+-                   magnified_width += (png_uint_32)
++                   magnified_width += (size_t)
+                       ((image->columns-3)*(mng_info->magn_mx-1));
+               }
+ 
+             if (mng_info->magn_methy == 1)
+               {
+-                magnified_height=mng_info->magn_mt;
++                magnified_height=(size_t) mng_info->magn_mt;
+ 
+                 if (image->rows > 1)
+                    magnified_height += mng_info->magn_mb;
+ 
+                 if (image->rows > 2)
+-                   magnified_height += (png_uint_32)
++                   magnified_height += (size_t)
+                       ((image->rows-2)*(mng_info->magn_my));
+               }
+ 
+             else
+               {
+-                magnified_height=(png_uint_32) image->rows;
++                magnified_height=(size_t) image->rows;
+ 
+                 if (image->rows > 1)
+                    magnified_height += mng_info->magn_mt-1;
+@@ -6446,7 +6446,7 @@ static Image *ReadOneMNGImage(MngReadInfo* mng_info,
+                    magnified_height += mng_info->magn_mb-1;
+ 
+                 if (image->rows > 3)
+-                   magnified_height += (png_uint_32)
++                   magnified_height += (size_t)
+                       ((image->rows-3)*(mng_info->magn_my-1));
+               }
+ 
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index baf0230590..dc18169b34 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-53101.patch \
            file://CVE-2025-55004.patch \
            file://CVE-2025-55005.patch \
+           file://CVE-2025-55154.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

