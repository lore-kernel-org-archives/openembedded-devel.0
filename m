Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4BCC4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 14:29:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.37966.1699885755421888041
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Nov 2023 06:29:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iGkmrG+G;
 spf=pass (domain: konsulko.com, ip: 209.85.221.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32deb2809daso2649251f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 06:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699885753; x=1700490553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1+0XxbZzKlpDbA7GsVEViwAcnmHRpA4Wvri4/y9NqQ=;
        b=iGkmrG+GhUgWZ1V4RhHIj4N4ItziTJid9m1Bf8xBLuSDMR9w4/P4bRU1W2gyqpY8NU
         Y7HSRFsiE9KjyJJrcznbFrNeVAD+nUe0lFtuSNMMTyTCsBXEcDXOrXyYoQmxzzy1XuyG
         YHCHbEfR95RJpaGPBO/YZ8wSYGvsOKvyC05yI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699885753; x=1700490553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1+0XxbZzKlpDbA7GsVEViwAcnmHRpA4Wvri4/y9NqQ=;
        b=l7+g2z+S3m89fG3fTDMEztmmRd14HY4KOMPhYT14v6m2kVDwI+uxIrcEDUS3fz9NMA
         Nx7S90HuNJ0/14NcBqS4YoDFLVV6q9VWn8fi/F77j8eNu6mNsoEEaR0PS/jdLb6HSNR2
         i65nJVKcbWDP6onJ6P7ViEPeEYxA0Cf90hFIu3rFJhZ24DRRUc107XhUj9U7sWXUgdla
         g5Et/9DJmHMeAvRuqLtxXFkp4cB9Jj0/UUv44y8bV7c1rhGbKU+xSKLW+w6cscJAAvrW
         XLJQ8QB3yBYaY/phbVsM9gFEBX9SKxN/nRKEs+X2r7kyT4I4MmdmcolSQeySYnWn6oGF
         SV0w==
X-Gm-Message-State: AOJu0Yy09xVDZv+iRH6EJcap9g/t1rcV3S6JKZhHqlMakDdEYnhqpx0Z
	FaPExlD6rqZY1cFRpIe6FPa98v4atYjaDcCm3N4=
X-Google-Smtp-Source: AGHT+IEDUvRrJdSPEc+v7qprHBcaozczjF2NcvE5UgjQtEn6nUmINnaIQzdAaZmBwiN5OUlgcaHE0w==
X-Received: by 2002:a5d:6d8f:0:b0:32d:806f:d080 with SMTP id l15-20020a5d6d8f000000b0032d806fd080mr5661566wrs.50.1699885753618;
        Mon, 13 Nov 2023 06:29:13 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a15-20020a5d456f000000b0032ddf2804ccsm5535042wrc.83.2023.11.13.06.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:29:13 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-bitarray: Upgrade 2.8.2 -> 2.8.3
Date: Mon, 13 Nov 2023 16:29:09 +0200
Message-Id: <20231113142909.3093632-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231113142909.3093632-1-leon.anavi@konsulko.com>
References: <20231113142909.3093632-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 14:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106644

Upgrade to version 2.8.3:

- Ensure readonly attribute is set correctly when creating new
  objects
- Optimize sparse bitarray compression for raw block type
- Improve hash functions in Bloom filter example

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.8.2.bb => python3-bitarray_2.8.3.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.8.2.bb => python3-bitarray_2.8.3.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.8.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.8.3.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.8.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.8.3.bb
index 39d2b6a71..acacdab6d 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.8.3.bb
@@ -1,9 +1,10 @@
-SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
+SUMMARY = "efficient arrays of booleans -- C extension"
+DESCRIPTION = "A high-level Python efficient arrays of booleans -- C extension"
 HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "f90b2f44b5b23364d5fbade2c34652e15b1fcfe813c46f828e008f68a709160f"
+SRC_URI[sha256sum] = "e15587b2bdf18d32eb3ba25f5f5a51bedd0dc06b3112a4c53dab5e7753bc6588"
 
 inherit setuptools3 pypi
 
-- 
2.39.2


