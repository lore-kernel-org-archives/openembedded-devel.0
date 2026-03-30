Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1101AFB3D12
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:40 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48208.1774867174933729592
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QeB+bUKg;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d971fbcddso847157a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867174; x=1775471974; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slKFjsnTPihmdFWt7ihvZGsr07uIJUFkEGp9E2738U8=;
        b=QeB+bUKgfAqf7vu1PV+It6DKKZOcf4ToxApGqRcxY/pUV/IIzC+AWMm3HGaIERL2rQ
         D5scGt03IB0iNv+5f73DqSUuyO5JMGpaNntCYTm0P9HmgmwGPLLxtCkk0lJ1pKoV1Y4a
         ts3Yft8IxYjN9UQ2QoSo9lZ25JZrMCGG5+/zww21fnxzDtgEFmbkTlY+cu4fDMzfUZ5y
         EofUm6CjapITB17JKt23Xur0HfrkJSJhqayhFdDugSkCDACuNSMYr+iR1pO2gOo/Dxp/
         xb6tsnLJ8DJqgg6hLqRacnYVJhJa+CCvI4Y8QX2GHteGpvNIfVpOwk1A5obLQHXL9ypC
         6hZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867174; x=1775471974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slKFjsnTPihmdFWt7ihvZGsr07uIJUFkEGp9E2738U8=;
        b=C566B9KfPVzDc9SW9vrie0zTAYxewfmeGg7EkGaEitqgF1qzzqP41BrbU/JZf8m6eQ
         S/BA36rvpQQdeHSrpJaBEhs7zmB60K0hyfl+Tt0nCFVBVW7ypZQ7YRG9LLtcUjMLlkRp
         68cbg7x5ExhHLuWv0kdSsntXlUnRfkJ12tLHyt8AcNuRITBq9VrcawrBLzHaKdNllMN8
         GIo3UQ5dshk/6jKQysI3N6KhxiOjLbNhXMvSNqO0KeqXK1d+wK9V8DKyanCOkAsgUW3M
         FJqxihEfBZUieYsynj6X0yn5+ck/XeKXqF+KM0cGk16IaN5L4zmTs2INLDaP8CzI2Q/U
         D7bw==
X-Gm-Message-State: AOJu0YzzmHmhAdcxBHTa6HRqk6c1fVI1aeKMelA7ogxmfwkJLdbB7W9S
	a6meNU9aAg9oJx85X2mRSGV/lR1qB9YZ7yg8VqQ/AKQGI0YUOMJ9XgHJ4fBh2A==
X-Gm-Gg: ATEYQzxJGEOh5TxBRAWUtwrP/HT5WsetK49Myph/EUHvxIf3pliYdKBAudkyeesIzSl
	3gIwWxfv+70u/z20hjuLmePMc+44eJJgJQXdRZR9PG0F06ez5bVsSN8TDwjxGm5lBoq610esWTu
	ywIbCJq5kUb45eAVr5NI0yReK2gzlpnoYLpwslxVhWPJwPaevgyydOgUn8PGk+TVqtBOn7QK/Jl
	vcd9WxqsiG+6rk4RAPgja2xTwROOiGltUujsPtpsMVYCCRrODRcUrgmzULkFDHujr1xk8Z5eD00
	5Ni/cyMtwcFU0XTpAaaM4QdniBm27dObQNx25p0Bo/aVTxsmz+AtflqW8bKQd4VCMSA2iHVBqTw
	RZiiMHYqKFyOnzYw9dCnlagh6okS9PvEMmoPSzX52cCJrebbB/uCzsKIihnO5xcJHcWRe893F+K
	boVfVUl97BbIx1/uN30vS0VwisQ4gmFUiLDzE=
X-Received: by 2002:a17:90a:d44d:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-35c30bc9833mr8367386a91.5.1774867174091;
        Mon, 30 Mar 2026 03:39:34 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 12/19] python3-apiflash: upgrade 3.0.0 -> 3.0.2
Date: Mon, 30 Mar 2026 23:38:39 +1300
Message-ID: <20260330103846.3381644-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125855

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/apiflask/apiflask/releases/tag/3.0.1
https://github.com/apiflask/apiflask/releases/tag/3.0.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-apiflask_3.0.0.bb => python3-apiflask_3.0.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apiflask_3.0.0.bb => python3-apiflask_3.0.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-apiflask_3.0.0.bb b/meta-python/recipes-devtools/python/python3-apiflask_3.0.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-apiflask_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-apiflask_3.0.2.bb
index 3b9912454d..c818a2054c 100644
--- a/meta-python/recipes-devtools/python/python3-apiflask_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apiflask_3.0.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5f89d1b0dec37448d4f4163dc3c40e64"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2b8420a23b93a78407ef5fe3e1f79cdfc7baa9b3c53977a06d6ab68772a7c2b7"
+SRC_URI[sha256sum] = "106c3011da9f7fff86e33ea47294f84b4d0f7c121d67af6aac387363af997443"
 
 RDEPENDS:${PN} += "\
     python3-apispec \

