Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4E6D3C55E
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:27:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15334.1765373219150465031
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g9XnsrJH;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297ef378069so64944945ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373218; x=1765978018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6o1Doe4PLYmXRL4Y85eTl4kEWA5qSTY2CE2GuOAjQKk=;
        b=g9XnsrJH7PcDt3ydgfTd+jmuf8CSl6/z007ErI7EemQXpq9BjtZHgum0sNqK0ejOXZ
         jnKqDIFEoIN1XfW/fACc4dKwWOK4wuxrBS2eMZMDHqVJleXBL7Y9Gg7+megpVk9a7QsM
         u+VgNAB0tff179yHXs+RHga4psx8MvL5A9QB1B2PNqfWdAymBNKnxBfAa4gDOYm8X0hy
         o2cHiLQhQQCB6SVXbKnpDM5t0E9ru8YAcn7CrcGncVPI/ojuFd5zGeLzNbU8je0sDnA4
         uGmQU/7D3/Cd0t6ISMRspXYESwh3y4Sfg26xHtjKSJ8YPGP3fDscv5qOjDDPocseLd3K
         gixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373218; x=1765978018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6o1Doe4PLYmXRL4Y85eTl4kEWA5qSTY2CE2GuOAjQKk=;
        b=tx7SdFXw8ASe8lGuoKQeYV1u5QYLyhyDluwm6FMvqAyUL/7oocfuUs2N8i9+yKrhWR
         umQioF2pXxTE9/Bn520B0bOZeeMro2Zfcd0gvJv7ygzWvtnJuOU3yyTxWemvP9L1Mmvs
         ZMVkDjgF+oWLAyTUv6rWarvaWyCiN8/4Th9+ogDVAkUvUMvy2CWW3gp0qqRRnBxlcJcx
         ejOUv7+oJ9O/WqV9KEqRu6ebKsa8Jp8kbvmAfe0xXFyK/3IVMK8qoNdFpN2gronxsz1A
         B5oOVaHAiFrl18kVbw4Sw08XFWNoy+ZPfZ0S+zC7qU4D37acVxhWTqftqOM8Ms/D8POD
         kFvg==
X-Gm-Message-State: AOJu0Yx4mPGrWBMsM2MGYtSqiKrp19IjSfZzOhhBaF9WJBcsjxmGHRxw
	3qynUwkJIKUNSrpnKpdPjFibA72zXA+Xutb1VRNtuOGoY43cz9zKd8vxXFzbvg==
X-Gm-Gg: AY/fxX40RH/3PiLFnDkzl4pI8yQnHkPfgMFTEYmXYouj0A6ZqpMpu+wsBcraaCKdcAY
	cVuoudB2nUK2gjOaY9tj33IfrKumFAgtJA7NeabTtoU5kRfnxtnJr7daDLhY2xdcbfLGLQ/3WRQ
	dPoAOh9JtwrOLAe9x5P3bcGpL6uL0LIYQU6CdL0mxrgvR2pUm78/y9pMse0J52gzt4nyu4MiT3n
	EKhDGax2yQ9nggPmmOuHji/OeUxOlRs1ac9Vkz//ApPy63ki13FZJn8452krv8pVrw6GdS4moG8
	vxNwoHP1W6dDpOmLo4PNrGp6oWgvD5eRG1zK1BlrghyHxsRJEG1W7TPTJTGzz8rQM1w6ZVB3GYE
	efbnYOaFLC2iHN2KYFYFHiayOV4QJgEQTdFY8Y8qTEGjIM8gBU6wxtqbg+olXEWO9RMLvg6uVzP
	NlHY+qB3QgHPE6HwH1EyeSt7M=
X-Google-Smtp-Source: AGHT+IE+1OWtJANIOlrOHAHWHvqowKciEFLPZU0uWp4YbKX6xYxYXoiaHAgW7Nfy2HPff1DmE0Yg7g==
X-Received: by 2002:a17:902:db07:b0:29e:c283:39fb with SMTP id d9443c01a7336-29ec2833a77mr28887115ad.52.1765373218412;
        Wed, 10 Dec 2025 05:26:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f20bsm182972465ad.46.2025.12.10.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:26:58 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 30/43] crash: add zlib-native to depends for crash-cross
Date: Wed, 10 Dec 2025 18:56:36 +0530
Message-ID: <20251210132641.323679-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
References: <20251210132641.323679-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122534

From: Yi Zhao <yi.zhao@windriver.com>

Fix the following error when using buildtools-extended:

va_server.c:20:10: fatal error: zlib.h: No such file or directory
   20 | #include <zlib.h>
      |          ^~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bd745115de76de7242e3e7e69b29f1ae507fea13)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-kernel/crash/crash_8.0.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb b/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
index 1af90978e0..893d4de410 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
+++ b/meta-oe/recipes-kernel/crash/crash_8.0.6.bb
@@ -12,6 +12,8 @@ EXTRA_OEMAKE:class-cross = 'RPMPKG="${PV}" \
 EXTRA_OEMAKE:append:class-native = " LDFLAGS='${BUILD_LDFLAGS}'"
 EXTRA_OEMAKE:append:class-cross = " LDFLAGS='${BUILD_LDFLAGS}'"
 
+DEPENDS:append:class-cross = " zlib-native"
+
 do_install:class-target () {
     oe_runmake DESTDIR=${D} install
 }

