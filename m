Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBA7C61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 17:27:37 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.65660.1749490049750923544
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 10:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mZ9YUKQi;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so28346955e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1749490048; x=1750094848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmv2oIk92EDn+xi9IxxhPLaFoh25aMGff3E/8+W0nFM=;
        b=mZ9YUKQi5Tug7Nbh+CJ/hWSOrGktPbUrvaHdcq4t0RWGepqjiFYVPxuXo007oaIZ6H
         HNWbxrtzrT8+NbsVmwyTPBivc4NJkFlqoZhEHBO8Bzb1ZNKl9p0YKA3SkqMEBh9rfFUX
         zZJPk/wgt0+wrpXZJfHpF44UIlQZOfz4Qa9bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490048; x=1750094848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmv2oIk92EDn+xi9IxxhPLaFoh25aMGff3E/8+W0nFM=;
        b=gTGrRx215pxRxzK6PntNWV+ciOZnfV9W0xX0/K400vI/ycTrJebRnbHmczF0CnHLzb
         X5fx3YWj7B3JV2wL4JmaYUSGgWHtlJn+nnwuizsyaHnAI/PBi7jXrwxutOErcUJi+OP6
         /UmCZ571sLmRh8sW8YR2pjLV96wVhY6XHno2FjMvwKhmwt177dRXemmwKvQaDFBmhbiI
         0JXXlA/ZGBoGK9cEg+8xe/BoTZxEVXEOSwcYfW2WWaQLN87mn3qUPYmcWWnU2O/5b+PU
         ges29yAp+iDTbGVJF5ZDGdHxaofYLqzw0NsWhga226wm69iQgZWZmrAKOIhh4VV0X6UR
         h65w==
X-Gm-Message-State: AOJu0YwMvEfDM9cRrj9Wtus6e1RtOhXA+PsE7P7NXv3VBE8ORoIu11ej
	m3LKhVMGI+3BK5XNvJr5LgCr/OHZqqWZB8nzhUKAqLNjksxPSPoJJcuJv0CTH4nrHpGAY7leUeI
	NA6TU
X-Gm-Gg: ASbGncsdU59fHh9scrPM0NgQmpoSpQKihg1vUj3MegkdRtsGVX1NItl9roq3mypRYEi
	W5urme7ODXoAq0MdxzrV53AzHFZrPOyLM+4WRF00Qer4A5HiGoKC+7if8mNoTZaT2TTf11XJokk
	n7AfHPUJM1x3rjL3DC2Fo7pcOPbyQ15l/6HPPPE8WWSCAE+hTwbfYh+I3e3C1+ZMK5e6zl8fva3
	+UniFoT2W47kvPlYpBVyiG1qW8cPVFNhOu+dSbyAAVuReKu+o4XFVKOaBOleXTue4P5TGKAzXuM
	EZpeoj6Thtd2sX2Tmqzp9T2w+nwlib/dqLpnl86aJ5bXu1gA91sdFRghb7wg4wcYBF5AogHvrzS
	m
X-Google-Smtp-Source: AGHT+IHRVx4F62cmhVD/I0b07HH8H6vH9TtnX20H+fP3sXgSn8ULDBg28NvoEVWlb+dXZe7qjvA3jA==
X-Received: by 2002:a05:600c:8508:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-45201336ff5mr124840155e9.7.1749490047377;
        Mon, 09 Jun 2025 10:27:27 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307678020sm68014835e9.15.2025.06.09.10.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:27:27 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-starlette: Upgrade 0.46.2 -> 0.47.0
Date: Mon,  9 Jun 2025 20:27:21 +0300
Message-Id: <20250609172722.2923788-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250609172722.2923788-1-leon.anavi@konsulko.com>
References: <20250609172722.2923788-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 17:27:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117789

Upgrade to release 0.47.0:

- Add support for ASGI pathsend extension
- Add partitioned attribute to Response.set_cookie
- Change methods parameter type from list[str] to Collection[str]
- Replace import typing by from typing import ... in the whole
  codebase
- Mark ExceptionMiddleware.http_exception as async to prevent
  thread creation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-starlette_0.46.2.bb => python3-starlette_0.47.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.46.2.bb => python3-starlette_0.47.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.46.2.bb b/meta-python/recipes-devtools/python/python3-starlette_0.47.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.46.2.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.47.0.bb
index cdbb951647..182b6d60d5 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.46.2.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.47.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "7f7361f34eed179294600af672f565727419830b54b7b084efe44bb82d2fccd5"
+SRC_URI[sha256sum] = "1f64887e94a447fed5f23309fb6890ef23349b7e478faa7b24a851cd4eb844af"
 
 inherit pypi python_hatchling ptest
 
-- 
2.39.5


