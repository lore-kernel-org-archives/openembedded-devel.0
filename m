Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7923D4920D
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:58:04 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11032.1765540678122134473
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:57:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SioIdKmi;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so1168528b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540677; x=1766145477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=figrCEfKyVNofJ+HPWGi89YZWOOKNk1wfO56RPYSVSQ=;
        b=SioIdKmi3Io5ZLkRmV6R8vRkHXOmT9zpM2Sxm7Jkl4lBfy8u4ssStF2lmKxGiYve3e
         BF7ZfUnVLhKoWLMxeTPDuHFMd21V17DiNlOAsJ7CW2A6NcMSU8R1EG3RsoW3sP5DoVLO
         jh/000WdFrbFuiH4w89TWqzabjpLQ5G5voJOn1Wv8VED1bjU+Fzam3//8uKjGZJGc4E1
         JIm0I1CKxZAUIl2t4XflbCZfV9HlC92eXEIcaoQDXR54pPlSb5ZNndzJAY6myEteWIgD
         T46vTPjNpRnc7xAwngJMr6eNHl3PorXCaXogtrw5tfRv38yRp3Y+1L+O67CUOXU08RVy
         hgtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540677; x=1766145477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=figrCEfKyVNofJ+HPWGi89YZWOOKNk1wfO56RPYSVSQ=;
        b=IGGmcUk1RbZbT+/B8bg5MJdDSVMajMNwJ7rxjcTsA2yF0YHjtQM5LX7mRoC6pJEQwd
         aP29Kx5m+CTGEUKDAnkODMtdmjlcoyD3PgyjGGhlw6Y9ajnBVDg8gqOpiBHLbOksNjIQ
         ViYaNNf/jPHI09pnTnIwvzq5rvHz0vs6khQmxSHJhzg7CsHdM9QZhXG6qjov459qTcYR
         q3jG+K99SX41R5QNkItk8I0jklMPJE0sh7CN2XchJOGTZfVb2+s3/vxdH5gjE5TbHJaX
         u5/rLiD+YPObHJAVnELT/9Kh9TBAOuMMoGQhanCyr4GsiHoXadDnOQ7ZURS25bOAUwz5
         fPnA==
X-Gm-Message-State: AOJu0YxAmBuviZhaLobbIz7tx9pSinMmKVfD6Ou4tuyNRETKSpzgEPdW
	0TkuphibFAjt62/CQTry3QUxn7NS/NlwNwFW9TLMtW2C3E8RlkuKWaK6tcWPUQ==
X-Gm-Gg: AY/fxX6JHf6sow9So/cld9vEnasiHfAjTf7izvyMS6TXjMYg3Z8L8/AQz/iFkVoHhx7
	0pquKA19vtLUK1cOXh9b49E7wpSS9NU6r6fSmd1FXR9z+2QhafIyhvcpX6UKme+QZJ3YqC1lsR1
	+c3VRS6VRZ4t6MtigKhZSOAfh5nYTOrZmmm4U/9P8q0Q3LQOM+vhiD4RAeQ93x9/thP++p4y42x
	1rIAYwJ6wHG8VwWpJ8POBpANuT3em7K3UMWZZzjtS94NFz4Bc2AMWh5wl1HBcIgX+tlaOn+fXgF
	71jPgtNAirDsqEnbp13SounsLVWuCpQzPwGLeZEXGit3osEKgn+9XM6mgW/PS5R1D+5fbCg/d+S
	R2PO7vsMQMbcNGObYjMWP8x8VAwozMXI4e+4ju1/qxE9Z1J9Yx9AF+FOW3zNDuIsteSyX0wCWES
	0ygPzqItTt6o1wZ7sNGKrYzteLqjp1J1goJw==
X-Google-Smtp-Source: AGHT+IExjZKhjj4rnd6RB6HoLvA4Ro9ffuobZ35G5CTZ0KstK+JSpqSOE2DvGlK95reTSI1z9FPbJA==
X-Received: by 2002:a05:6a00:6c83:b0:7a2:84df:23dc with SMTP id d2e1a72fcca58-7f6682f98d6mr1656046b3a.28.1765540677385;
        Fri, 12 Dec 2025 03:57:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:57:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 04/15] python3-django: upgrade 5.2.7 -> 5.2.8
Date: Fri, 12 Dec 2025 17:27:33 +0530
Message-ID: <20251212115744.569676-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122604

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/5.2.8/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8247a68d540ed9154cecf92f4e4612f1c0ba0490)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-django_5.2.7.bb => python3-django_5.2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.7.bb => python3-django_5.2.8.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.7.bb b/meta-python/recipes-devtools/python/python3-django_5.2.8.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_5.2.7.bb
rename to meta-python/recipes-devtools/python/python3-django_5.2.8.bb
index a0589d9916..f205b5b247 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.8.bb
@@ -1,7 +1,7 @@
 require python3-django.inc
 inherit python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e0f6f12e2551b1716a95a63a1366ca91bbcd7be059862c1b18f989b1da356cdd"
+SRC_URI[sha256sum] = "23254866a5bb9a2cfa6004e8b809ec6246eba4b58a7589bc2772f1bcc8456c7f"
 
 RDEPENDS:${PN} += "\
     python3-sqlparse \

