Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7937.1793057214791660077
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JGW2hdKv;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-19305bcb72cso2665360c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057214; x=1793662014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSe6XOtE7oslYwo2ryCCqLx8X5ghcVGtDE7/GMfE5uo=;
        b=JGW2hdKv14WH7eGS+P0eZI+nDLlKY7hO0Px79SwYmkUKQHyNJN1th5D0UMxMJrhjWb
         PE2TDovYcR+7pbLPxjk10Ik41ogjGweEEzfAvB/nt939xWQv0wr3WRX/8WTmfNs1LWSL
         QgJIRUKmBOSxfb4wOH8cyJk4AmOfEkRJf4JUKWZbJPPwIkN78ijG2CAPGyBSbEJGHiWp
         6Q6EMQLYU3Ag97EyT0DSgmE9qoGpQYJaoV8tLzJFNloQdKbX0B82HtCrD+8Bcwwm2JZs
         XdhAELp8T4inLxz+KHLFn/kMiN4Ce7G4H9X+2a8HhgoQCw8lkykXQd03Sx91RBzPrwZC
         iRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057214; x=1793662014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MSe6XOtE7oslYwo2ryCCqLx8X5ghcVGtDE7/GMfE5uo=;
        b=iQ2iDGM+jm6zLlY4f+R7tns1l55QTnT9t9bsZeSZa3Rz9NbMIAaHMYI+KOB+U2PReq
         QJbtfj19Qr1oOSavXUkgjh61/dq8Bmj2ySuu0W2iVHIAbJkKw6J+TFN60PUtEj7Q0ycx
         2W5LvdLpz0nA+KPFf8Aji0FmzV8Il8EzBAgrG+uIwUMXl7to5PZG3LAV0yNJPiN+3+Fj
         ZAfsNSqFmyGcFHFfKgalCopBjY63rzm82Ks2p9D4tuWUMG7I6giqLRRq9LjAXFTuOf97
         nPIdcglMnXHTYQEm1S55FuQT9GYXBp5R2ddURAlOlXpYtbDiZWwOeVddVjAiQYo7yWCz
         tL+w==
X-Gm-Message-State: AFq9FYLKTyhHzoN87QVK7zQLu01RXR28hevOuhnx/nwhdX6UZ2rCumFi
	2VAJMiDWJOnkSW7XX2FHsmGNTwqbg0JqtKdkyYznJeYPft+kJEqJ/FNzkPnZ3A==
X-Gm-Gg: AYBFou0x/UCfSEkI8GmyXrJJwvFQSt1Elf0xVNWxY78EZiaDBB1rvypfjpnn+1UZsvt
	M0o0/+x/tC42nmkiusKx8AuXRLMf12NAMogUyUb7VH1uz4B9Lh7DOO3nZYEN91DZbmxkfg2DpDO
	0WxhkG/LWK+gY6W3Bwo+P4k4Jbg6TYO1PVb0teyOCLGvOBR4z6kFkl+srcS8Uum4eysYJfxoiCQ
	JNjJzp0v1l/WXiuJebiLEfEUHHjFliiEdIhY6B3akdT7RAaiFGKj4TgUBblyY6YB81Ih75WaHQV
	hxXXJpwCXyWl1MBQxb2X2n+U8wnb9GptGIcqgZW2ihJY3WquWgWeo2UtfWgbHaZ/5fCoK6FkZUE
	f4Sq93BP33+51XJIwU8Z/yaV6ggeEpSJVZFFjcDkv+cCVG3uNzx4ZJWbHS0ruWgxZCGTugSaHv8
	4EGKTL8Yp7Xp9ZHM/6c8z7PB/s5+QNAbQrHbJXhIN8ot4ysgCBgbqvFEOxge5adjZ1BkFCqKv5A
	oI2jSKkhw6IEnZ/CV2bCQdjjjKAKOeLJlOgmAQSNnS5LUjdv8PxtZCkBSOlfRcI9pWrn+AuKfcJ
	vbTCHaZm+Dfd0Zg=
X-Received: by 2002:a05:701b:418a:10b0:183:3c2a:ae8 with SMTP id a92af1059eb24-1993658d4eamr11832865c88.41.1793057213936;
        Mon, 26 Oct 2026 16:26:53 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/13] libraw: upgrade 0.22.2 -> 0.22.3
Date: Tue, 27 Oct 2026 12:26:23 +1300
Message-ID: <20261026232625.1275411-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:27:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131451
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/LibRaw/LibRaw/releases/tag/0.22.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libraw/{libraw_0.22.2.bb => libraw_0.22.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libraw/{libraw_0.22.2.bb => libraw_0.22.3.bb} (92%)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.22.2.bb b/meta-oe/recipes-support/libraw/libraw_0.22.3.bb
similarity index 92%
rename from meta-oe/recipes-support/libraw/libraw_0.22.2.bb
rename to meta-oe/recipes-support/libraw/libraw_0.22.3.bb
index 2db0c14a61..c0601f71a8 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.22.2.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.22.3.bb
@@ -3,7 +3,7 @@ LICENSE = "CDDL-1.0 OR LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=1d66195044cfbe4327c055d1c9c1a229"
 
 SRC_URI = "git://github.com/LibRaw/LibRaw.git;branch=0.22-stable;protocol=https;tag=${PV}"
-SRCREV = "b93f6e45c194f5df9b02a43b1af9a54b4f41f33f"
+SRCREV = "cf02d66eb5c19d4e46df7aee0582e47a4918509a"
 
 inherit autotools pkgconfig
 
