Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C2A4C47BD7
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 09:43:17 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86609.1767692587697458364
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jan 2026 01:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cbM8vLn/;
 spf=pass (domain: konsulko.com, ip: 209.85.218.48, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b83122f9d78so131594466b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767692586; x=1768297386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z2F4MhEGZmwakQsqLeoSX6MeErok8lZh/SxRNVnKLo=;
        b=cbM8vLn/DsDumyuW983ntXot+80qTm1rgbFcaElU0TzSknRvvdHREpJUzMuTiORtL1
         AYyz4a4g9pJ9nvdtJWZm+VroEcW3XOi8bq4TLUsGpNKbgLGYu8RU8+W37ZKXGBn2h+O0
         mSyrZxecJh/qit6VxR7CIdCNLa88UyFS/OQrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692586; x=1768297386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9z2F4MhEGZmwakQsqLeoSX6MeErok8lZh/SxRNVnKLo=;
        b=fbL5Y2os+44aRUyKGeJ+Ybn1jLeVF0wEHxk8wR6JeyRgLdgz5fQeDrStpMBR+qxJ4c
         PlUSJuMY0/1b1F+jjtPCvY5lJX/lRXAaz5m6LAjGLX7jp2Cv76aUREaHJHEvCu5Gur9f
         AMFSZcGZbn8RDEM4Ve7klzhvzAHdqJ+lRZqgk4RdHYWwRIgII+J1bt2F2yJ+zC5DRZ60
         lP+JDi3ziy+HS+gzz+w582XD4bp6LIVZeYY03a59moDAny1xezyMRIKVFVZTXj47neJ0
         IrzOZdwXi8xo1tnHZm5RLnE971FAX8TDC16JGv2wVeoJwhCHlIDbBB4hVf7OYRp6D7on
         UPZw==
X-Gm-Message-State: AOJu0YzBS/VH4rfBjs/3ur6iXi0qbQl0+HpAEN5+fi11KWs0JN7Unf6T
	8MXrB75KrzkBQEwkK9SHCJ8ZjSH8W8fjrKLmtYVOvR4d00Z/FPF98kcdrTN/MhQfHwF/im+TM3Y
	4nGFK
X-Gm-Gg: AY/fxX7OgHRCt6uam/JrIk0CMdUTeiI8uOUvgd6euBDPS7XoKXpHx/GsGD1CbSQAqsG
	wkHPXx+CWIiePFLGs0hv4AXuxDJOsnDVKWQkDzMsYuHdsTmzTGp65le+P+qAM71HF8+2AaR9zIx
	LilCneZHuxioMwsEHfV03Bq59vjh0V5UNlkCtvWNpo73+JEMWhI+U8ozH4VsOcdukonh3T0iR2G
	sC243lvZtsIOWpqvlN3Oie+tvKcLutjEWoZ0x3/R8uEgnCHr+uMNmP2+djYQqV3GdqazcTKowoc
	J4e3SCW2xRxbuaUiQQMxO2W73tBV41LZpQ0qdOtfvJWeh2fYJCG2xnJOxt+SYbmiZPKUCSw170d
	tWquPhiUtB4LEQNMKqgUk7M3JSb6CnHytin/r3JTpEISY47umqOv7FTKkW+NAUhxTZWNpguRY6n
	27UL8MVycPEKq/cI8OE4MUBDh9
X-Google-Smtp-Source: AGHT+IF8H0dq25zEsI43p9S1sc0j0S5tpIuyCSE/yvhE7LDqsAdB4G0FEkgG8SCM3X25OB5PUN3a0Q==
X-Received: by 2002:a17:907:6ea8:b0:b75:7b39:90c9 with SMTP id a640c23a62f3a-b8426c0d8c5mr274608766b.51.1767692585835;
        Tue, 06 Jan 2026 01:43:05 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5118e1sm176006966b.54.2026.01.06.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:43:05 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-fastapi: Upgrade 0.124.4 -> 0.128.0
Date: Tue,  6 Jan 2026 11:42:59 +0200
Message-ID: <20260106094259.36870-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106094259.36870-1-leon.anavi@konsulko.com>
References: <20260106094259.36870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Jan 2026 09:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123174

Upgrade to release 0.128.0:

- Drop support for pydantic.v1
- Run performance tests only on Pydantic v2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-fastapi_0.124.4.bb => python3-fastapi_0.128.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.124.4.bb => python3-fastapi_0.128.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.128.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.128.0.bb
index 63f762f220..f047f5321a 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.124.4.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.128.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "0e9422e8d6b797515f33f500309f6e1c98ee4e85563ba0f2debb282df6343763"
+SRC_URI[sha256sum] = "1cc179e1cef10a6be60ffe429f79b829dce99d8de32d7acb7e6c8dfdf7f2645a"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.3


