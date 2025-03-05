Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA647C28B23
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:34:23 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.13111.1741181656439415301
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:34:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EKBm7gC7;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-390e6ac844fso6058425f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741181654; x=1741786454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uwH3iLcgAFlziMdaYXNd8/gh+PVjjJpL2nokoNtDbnA=;
        b=EKBm7gC72CuEU2rL4w3tsNRdsB13r+7fDqVo6tAin5CS80DjyDJChw2Bqepu+CqPNo
         wjbNvXvrL8u0dz1N0Stieh6eu2QmrtgTt3YF1CncyT2wYmiQfJgEh5pdrdnZ3fdyZu5c
         Wzldfje/hzmUzURMqwLMrTmpRu/6LcEARwUgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181654; x=1741786454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwH3iLcgAFlziMdaYXNd8/gh+PVjjJpL2nokoNtDbnA=;
        b=cf+FFnMJfTTsldblX7WmR07AyT7YN6fH44t2uRD8R78tTFcp6I2Xob71/VkGrRDHDl
         uHl87r2uAyWt3Xo4QN7hjY2U09jvRwbt82JoNdLtXGANoOVnuZZtBww+7AatTxWOfR3X
         Wm1LkAZQZ3Y0/U2t0fVDhBIfCrfFTbAT5wGc+GzgoPgOVWoOTNQ7bgirj895ttWpBbBM
         W9WXAyNwUdVkpMsTP1vNVJsTK7QTvWxT0cVTMuxJphGbCXr3ZWl75mbNfDCRQrNyxwHM
         UDzTZ47cSQm2UwyLXiDKmW/mQ8QIqkgyLo1O8XJaWnSVlscXFp1UpQ1sTyjNrX+0YO7O
         nI+A==
X-Gm-Message-State: AOJu0Yzv+H6tnbJdjJPz01u2+pWoMSXkiJ2gylIOXlKlx6Ho5XpTBfTh
	F/VSWhBIhB8qTeQI4ipo5aFUXA1+OlMoasWuL+OY2DMdf5AqgS356934vC8+PWs/Hbn4ycAhymR
	s
X-Gm-Gg: ASbGncu3QuW8Y+u22R+R+K/sIPWiMiVWYSq0kOCbba7SqMg4l/6C0t5EalCOIoagvYm
	cdyQLeXDi2QRIl0LGibQp3KLD+1CfZtxYDo8Tgdsc6Da+QBbeDIjVdrsWSetIT3czkNl3AsfLTS
	RKxp+yaTvHOCXHV5SvGlRVvHyxo+vLD2h9aorPfqJ7lRoCobBEwQgrMuPpEnhREtvKLVv5mahb+
	BQ/71blkI2RQcQohUFyVGJvAOU80it8HJ+xMrTdXIS41HAj+BsuGvyiZemi7q2FjI0xHjfmaIIh
	oKMFxmu5wWynhC4X2CvJEzy7aui4J0zqA11UHqQ1dKyQoHbyXjw94RDNnTo=
X-Google-Smtp-Source: AGHT+IFgC5KfFSfP7tvkQm9YeXlyGxtNQDXs4Cqhz1C1NHmFY/NPXpYV2s6q9gTfcQ7i490t49KK9Q==
X-Received: by 2002:a5d:64a1:0:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-3911f735a79mr2556775f8f.15.1741181654330;
        Wed, 05 Mar 2025 05:34:14 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485df5asm21266361f8f.96.2025.03.05.05.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:34:13 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-aiohttp: Upgrade 3.11.12 -> 3.11.13
Date: Wed,  5 Mar 2025 15:34:08 +0200
Message-Id: <20250305133412.3463021-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 13:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115750

Upgrade to release 3.11.13:

- Removed a break statement inside the finally block in
  :py:class:~aiohttp.web.RequestHandler
- Changed connection creation to explicitly close sockets if an
  exception is raised in the event loop's create_connection method
- Fixed test test_write_large_payload_deflate_compression_data_in_eof_writelines
  failing with Python 3.12.9+ or 3.13.2+
- Added human-readable error messages to the exceptions for
  WebSocket disconnects due to PONG not being received

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.11.12.bb => python3-aiohttp_3.11.13.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.11.12.bb => python3-aiohttp_3.11.13.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.12.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.13.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.11.12.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.11.13.bb
index 07cffcfb02..ad1275e201 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.12.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.13.bb
@@ -4,9 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "7603ca26d75b1b86160ce1bbe2787a0b706e592af5b2504e12caa88a217767b0"
+SRC_URI[sha256sum] = "8ce789231404ca8fff7f693cdce398abf6d90fd5dae2b1847477196c243b1fbb"
 
-PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
 
 RDEPENDS:${PN} = "\
-- 
2.39.5


