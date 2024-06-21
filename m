Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF949C41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 11:35:09 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.70846.1718969704787476730
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jun 2024 04:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oMhXS7LS;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3651ee582cfso935685f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 04:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718969703; x=1719574503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81LM5bO8/XMZ2Z3wy13+xPBuf/OwJnOqnNBgHVdARfc=;
        b=oMhXS7LSZu4LKTzeymyEbnimED+xbYsYuAEbhmtKG4Lt4eZNPcaB2snpUt3BznroPm
         Daqa7CktDlkq114Q3NWvReuSh29xNPicowmjivzoE2PeaLZ2J7g8Kgz2OD6tC4Oqdp8X
         OWVr6jmRAHaE7U8GNHl4AfRExOgiD0NZL82ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969703; x=1719574503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81LM5bO8/XMZ2Z3wy13+xPBuf/OwJnOqnNBgHVdARfc=;
        b=OkGstWNMmDatUsiNapZu1/el8AucPI7/3z5r8B1uxKIHLq5W3MXJz0/4RVWwe18gmP
         mcIMeFd0aeOz4BAfSWd9m/QL1JSKvYYhrd1KL+S1lK60R1uBubZkPdobmP1eXNPGCb6K
         dmrDu9UkTPAtxKDx36Lrto5K/znv0U56WJFddJIudSLqfvrw2K6NEY/oyU1aCAVrTW1i
         t5BAAjU8JUgXRrAzqP5q0P7mvvqEdyX6aYBI4+oOdY6/tA+Avt6AfVV1QkOU2IB2c+9y
         2g9AyUz1X4/RdVTxLRyh5Bm7Tjhum5yqrexfKq4dBQ2CzsLxdY9jTGW5kHjEMTZkDqLI
         jOcg==
X-Gm-Message-State: AOJu0YyJzIQmspjo8cLq5pszZr5fAoHX9w9yuYmiBSKX+KzJA4CSjE0+
	kQnjPwzcX/jV+gOwWGgkXiSQVyXPjMmCHhlFhMGqF+Neyj0Suy3vy2gdpuXqTf/R8Fryo0n63mw
	3
X-Google-Smtp-Source: AGHT+IFQf2Pwctsv5SPcbc5+u/3xPAaoQ5/LPeXgDCp6LDu0g4nZLFxJhwiwsKrPF/HEIUp8i5BWCw==
X-Received: by 2002:adf:a1c3:0:b0:35f:22e3:1e0c with SMTP id ffacd0b85a97d-36319d686cbmr5536242f8f.69.1718969703058;
        Fri, 21 Jun 2024 04:35:03 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f6d02sm1470662f8f.85.2024.06.21.04.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:35:02 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-whitenoise: Upgrade 6.6.0 -> 6.7.0
Date: Fri, 21 Jun 2024 14:34:56 +0300
Message-Id: <20240621113459.2188274-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621113459.2188274-1-leon.anavi@konsulko.com>
References: <20240621113459.2188274-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jun 2024 11:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110989

Upgrade to version 6.7.0:

- Support Django 5.1.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-whitenoise_6.6.0.bb => python3-whitenoise_6.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-whitenoise_6.6.0.bb => python3-whitenoise_6.7.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb b/meta-python/recipes-devtools/python/python3-whitenoise_6.7.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
rename to meta-python/recipes-devtools/python/python3-whitenoise_6.7.0.bb
index 2dc64af57..48d5a925c 100644
--- a/meta-python/recipes-devtools/python/python3-whitenoise_6.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-whitenoise_6.7.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aba4901cc64e401cea5a267eac2a2e1e"
 
 PYPI_PACKAGE = "whitenoise"
 
-SRC_URI[sha256sum] = "8998f7370973447fac1e8ef6e8ded2c5209a7b1f67c1012866dbcd09681c3251"
+SRC_URI[sha256sum] = "58c7a6cd811e275a6c91af22e96e87da0b1109e9a53bb7464116ef4c963bf636"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.2


