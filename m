Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5F3CFA749
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 08:25:54 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7377.1763713545405439669
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 00:25:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LSpheBSp;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b31c610fcso1479748f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 00:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763713544; x=1764318344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6M1xbnkZ2Ho4thBQDHlA3WdHMKh5PCrWUOKkUeR4Bmg=;
        b=LSpheBSpLaRo3audFNzbYPIfrprSq2A0nLvMjLvXwRwng1KjhiWWtB6A+ssxYftf1r
         yHml5QYdpIrRguaxwtlUjZyMVMoVuHHV0Yed21PF80tkJTrnTfJ46bNKiIDyuunRDnWk
         kfoDq1K5f8YLITbqx/5aU58FIVna+hTJzo4N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713544; x=1764318344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6M1xbnkZ2Ho4thBQDHlA3WdHMKh5PCrWUOKkUeR4Bmg=;
        b=EBfVtXYfBo08Y047kxgKO10ehJgP7i52t3QD4iEUejIJUFkLoFhKzgpdp3dp8sZoUh
         zSZbHwzh8rjYUmAMoZks3jj0E7zJxTcsJ7Ws82FPPlAJBEZxq/quLmb4FFZHh2O88qqX
         y35nJv/2/l6XP6IWQBunIr1YcGC6T/iV2Hk2YtkQ/HgZ/TPWAisEdgrH/kE/py3zrMXP
         TyDlmbj7DGOXAbgCRMpPbyRJSSmSUwJkzwpqU4WJ42npDsbvEHptM+Jn8UDIP9GHURwi
         5u8srsjUX6KT7MCyPoICEDVLPmU9mcyvdquVk5pyeUeYegPpESqxlJZqgzAyD8Awk01p
         xplA==
X-Gm-Message-State: AOJu0YyrYoXHILG8MeN6aTkgHNVrHABD5yTrK7yMRp8Ynryyps6p8nxh
	XGM2ReO/1qynYPmiQ7k5r4Kr7b50Z6sx3bUifloJg88ZiBlmOJWMCbPzCGejJswiPgTGxyvh5AJ
	8Bn7D
X-Gm-Gg: ASbGnct/9pZPxO4z6NR+HSiftoilvBoXF8hxYh7dDFGnP3zL1+LBCmpe+4aClFReewb
	0RH5xRMUZXiJUOqkoA9bQHT5HRUkl8DBX86Zm67DA+zlzESl+3MNuhsVHA++fknF8/Is9xWbhpn
	LvTi1d3xSDH0p5U1fwDRvSRbxDgvuiRVdr6ePeB9q87isF+4i1+g/DIbRGyadsOpT6J9zinuf4y
	+3bv9YlTZcD+6L8alC+ZGbkZf3IjEK9fz6P7yyDFAecF2q7ZP4rk6806qTLSVNLivkKFZLymW96
	/sLhrBkAJhIJtT9ptmZiuiFNOBR/ZNqd9uagb9UZd7KWOPz8Mpi11ff4h10FSqeoddHJaSFfEJG
	yIYmdH1OxkN0dXdCK0+HVL2hnSr9u/aSUpZ/vnniMZrDdn5x6YEIKj/MaBwIAeiV+IkH3OXG1RV
	iqd2XpZYriWiVPFloS0XtT2GTw
X-Google-Smtp-Source: AGHT+IFbhq5+tSha8bfYJCTXlqrK3AzUMKAvUo/FJocG4QlkTzYVTZmmC7EKbLcFO+/jmJKZw74TgA==
X-Received: by 2002:a05:6000:2c10:b0:42b:3302:f7d4 with SMTP id ffacd0b85a97d-42cc1cc024fmr1346007f8f.22.1763713543037;
        Fri, 21 Nov 2025 00:25:43 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363b0sm9817641f8f.13.2025.11.21.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:25:42 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH 1/2] python3-pillow-heif: Upgrade 0.22.0 -> 1.1.1
Date: Fri, 21 Nov 2025 10:25:38 +0200
Message-ID: <20251121082539.2929084-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 08:25:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121958

Upgrade to release 1.1.1:

- libheif was updated from the 1.20.1 to 1.20.2 version.
- macOS: Wheels now support older macOS versions like Catalina
  (x86_64 CPU) or Ventura (ARM CPU)

1.0.0 changelog:

- Support for YCbCr AUX images.
- AVIF support was dropped, as the new upcoming Pillow has
  native AVIF support.
- libde265 was updated from the 1.0.15 to 1.0.16 version.
- Removed deprecated PyPy 3.9 wheels & added PyPy 3.11 wheels.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-pillow-heif_0.22.0.bb => python3-pillow-heif_1.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-devtools/python/{python3-pillow-heif_0.22.0.bb => python3-pillow-heif_1.1.1.bb} (85%)

diff --git a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.1.1.bb
similarity index 85%
rename from meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
rename to meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.1.1.bb
index 4b5d5f30dd..c4dce72085 100644
--- a/meta-multimedia/recipes-devtools/python/python3-pillow-heif_0.22.0.bb
+++ b/meta-multimedia/recipes-devtools/python/python3-pillow-heif_1.1.1.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "pillow_heif"
 inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://0001-setup.py-support-cross-compiling.patch"
-SRC_URI[sha256sum] = "61d473929340d3073722f6316b7fbbdb11132faa6bac0242328e8436cc55b39a"
+SRC_URI[sha256sum] = "f60e8c8a8928556104cec4fff39d43caa1da105625bdb53b11ce3c89d09b6bde"
 
 DEPENDS += "libheif"
 
-- 
2.47.3


