Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707D4EE57E5
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81881.1767167696231236262
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EcLD4047;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so69211915e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167694; x=1767772494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bk3vsYDJf/kyH/ydmzGr9FkkuIcC/A9sNgJrk7A+h4I=;
        b=EcLD4047oA5/Kes1hKzqsDIINOkaWKClKVgj8MVS2q7KD3naS9Xxzvd3qkZAzzBCKm
         t5QpVnkOgQ9+1tDiZzgGmbGB1ttfhpF5sXTbCqpRdnUOXI2wUrNxumW1IV0N+llvrsTl
         E+/UiOErrQB6vdeZAwOu9E9oSkbkn7/lJPXfOqLZcyEmUCumiVyrQIB395NWnIEkSV/4
         WJ/CX6mNudiKVv20EmxmuYsqurMB6FsTyYW3L4y+kVv6Ch9g3yNAnGOB64hL5HOCMFJa
         CruowPmJoMAVMcUrQUVNkWe8DI04m89Al6gT4ecy3EzCQEEGZ2GRTD8PlSeT3IieJO0B
         /MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167694; x=1767772494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bk3vsYDJf/kyH/ydmzGr9FkkuIcC/A9sNgJrk7A+h4I=;
        b=smXHSX3JJt6X5NRn64q/SSmpFRREpsDGG5AWrpJZ18QDPsw5dzm+iX1qnghddKMomI
         zFWvewNpAPkxQ/lwxLHT29t1poA1nK/I7hzQE/oRq5LZGX1WHDVb3sfJukhMI8nk7fLS
         APBZLT9iu3v4QYV/HwzulHwu77Z/hIbxdYIaiaOjHEGzQ4Q/TNi3lN1IHl461C0Ux4sZ
         7iOWewn6fejjboyFSamcN1q6W3LdFbtGXOfgT4/me5R+P2HtyNI6m9x7jS+TQdDPYbFY
         NWRH/095C5d6E2cOx98w2BwPpheZBPNQ2PH8T5IufEcsWsV+wNdtwU2TUz+fpMNS0efb
         z5lw==
X-Gm-Message-State: AOJu0YwtaK1SayYxJp3zCB5owezXPT92I0UHHMonodP67azdNpKs7i5m
	MeBQz7EHKPcqFLCNRz0m+RAbHrszPizgt3DNOtm84tpK+dQdABQwxGPHW86wqg==
X-Gm-Gg: AY/fxX4aAVDwTCZYhi8/NT3c7pM3hD8HCZK9KvHnJXfAzbz7I0lwOBF/P2wws8P7+rS
	OK/ZNqiXBWc78U7mgaJZE3X7ymskfL9O2j8p7CvzYBrnqCRJUgXb4icUO1QpFIMMIPAFo6oeD45
	5i3ruCMk8YUn/sFyo9OOgthoUD5zb6iHvqhvIVhHxx2YeXV3mHvNDse2PqlkZ39RmTYXILYLBrI
	F726Mo+yGDL6e4w74kIjhsuGVX64Rb4JVCmQIouymlY1YqcXrS9/EpJBrr3OFNTUZJtqr0WoErJ
	b6oksV01KKQNJcm6Mxrt7FK/8N9atkhfrogseW5+nBwHZ7NpuKjeKRgYgRY77+u9qqNB/rzlnnP
	yJ/JWaxQckTDMBY1faY87nWT9plt7XBlCl6L5aSKVjMBVrnbNqGsAZ+gvtlvYoncgfBMSQryMbP
	P8hwm1ggcK
X-Google-Smtp-Source: AGHT+IFd43rDtIS0sPDgkccCCA0x0jP1II/HiQ+RE34hLt381tZT5m9jdfxMRyjdrKVeBfLx6+V5yQ==
X-Received: by 2002:a05:600c:1d1d:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47d1958f9c5mr403172275e9.26.1767167694519;
        Tue, 30 Dec 2025 23:54:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 24/34] python3-py7zr: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:26 +0100
Message-ID: <20251231075436.771395-24-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123064

The related CVEs are tracked with py7zr_project:py7zr CPE in the database,
and the default python:py7zr CPE doesn't match relevant entries.

Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%py7zr%';
CVE-2022-44900|py7zr_project|py7zr|||0.20.1|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb b/meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb
index 61a9a5569b..83482a9466 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI[sha256sum] = "f6bfee81637c9032f6a9f0eb045a4bfc7a7ff4138becfc42d7cb89b54ffbfef1"
 
+CVE_PRODUCT = "py7zr"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += " \

