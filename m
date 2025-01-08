Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A865E77199
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 09:39:10 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.15220.1736329140987849736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jan 2025 01:39:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YwGm2XT5;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d96944401dso2373938a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 01:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736329139; x=1736933939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyA21dXGKYmV6ruewxB8xF1oDwudsl4Ugv8dsxFzqs8=;
        b=YwGm2XT5j2IwTk6lHNlCJxg4b6HLxtp82L37Z8G/yhBqNZQ2hNaHkmN3JUCPrO94kd
         H4VY2jAlSId6udOUwCcPKDABqTm5QOQj021xHL1Olw6ZaDIwW8oDh4eS/LoF13E9zU64
         QlBrfcXMPiIO/wizzf81iwS6xqIpXBZo8Vlrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736329139; x=1736933939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyA21dXGKYmV6ruewxB8xF1oDwudsl4Ugv8dsxFzqs8=;
        b=ayvaDndYHTjHayYP55wTk/2WJauc1+k9t8t7ZZaCgUw+yQRfPVVV+KUwful1cSQnvy
         w/+YEk10XkfecK0eCa57FDTv2rA5o/5+Rwi8Jdyc6eBviA7AMXgZ0efnaJuFwXuIUzQr
         0u/Nne3istYyRWSJq22ZgDuzRrT8rsFswPkkMrVoEbIyrX/2yYUqniHO2bPkN97FkxY0
         kXzkorHv7HZuukkNoU3T8jwvaySuEbkj1opQgenYZs4x3PzNdCT79LDJslu9Xh9Zzrz1
         CSdd+ap/r6vqeYkpX6qaHhh7kDd8vqQxv/f61X2hM/d2AAn2h5COaIe1F5c/jr7y+J9r
         /8tw==
X-Gm-Message-State: AOJu0YyGeYHzRikPwB14zOOSJUSUGmyPvsnklz8pvqJUCIdFdwJ4rr58
	wvf7W8xBT/mLvqendmd2UHhy+30BsqlMBeg3euylTM0nRHu2R2u0s07xMr618mMV8BfscQHcUfw
	j
X-Gm-Gg: ASbGncuYbsebhu0/p8pZavenUQSLiEroMiu5RUJ482rKZI+pbZzoX+3kxxGfkecE2ti
	qiMIMYTA3ZeBUk9vVvAo178JAkoI3iYm4MmlNU6hY5Et2HAQXZ03vTKXz7f7+CMBkR/qpuQUGdh
	/TghhyB/SWhCHF01LzSZXf8e1fcRk2feqBpJ2ecthi7EeoW95mm2HWgJvDMTd+mfsO2GDx1mdNw
	XSZGGY6YW9XOpJz2BHw7EyqCGukD9rkhnYIT1ib3fkkh9vL/ZJcIMwJdJg5Var00SlslnU=
X-Google-Smtp-Source: AGHT+IHmxSbAUMMweX+KLCjNSXB3V9Lp8bVOmDSynRIZA/4zStyByTeLS50TFHEYtvNpSYQ7QI/pqg==
X-Received: by 2002:a05:6402:518b:b0:5d3:baa3:29f with SMTP id 4fb4d7f45d1cf-5d972e06740mr1521191a12.9.1736329139074;
        Wed, 08 Jan 2025 01:38:59 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f496sm25179772a12.34.2025.01.08.01.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:38:58 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-cerberus: Upgrade 1.3.5 -> 1.3.7
Date: Wed,  8 Jan 2025 11:38:50 +0200
Message-Id: <20250108093851.1560110-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108093851.1560110-1-leon.anavi@konsulko.com>
References: <20250108093851.1560110-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jan 2025 09:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114740

Upgrade to release 1.3.7:

- Amends missing changelog
- Support for Python 3.12 & 3.13

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cerberus_1.3.5.bb => python3-cerberus_1.3.7.bb}  | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.5.bb => python3-cerberus_1.3.7.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb
rename to meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb
index 7d985fa7ac..83a06c6f57 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.7.bb
@@ -4,10 +4,8 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
 
-# The PyPI package uses a capital letter so we have to specify this explicitly
-PYPI_PACKAGE = "Cerberus"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 inherit pypi python_poetry_core
 
-SRC_URI[sha256sum] = "81011e10266ef71b6ec6d50e60171258a5b134d69f8fb387d16e4936d0d47642"
+SRC_URI[sha256sum] = "ecf249665400a0b7a9d5e4ee1ffc234fd5d003186d3e1904f70bc14038642c13"
-- 
2.39.5


