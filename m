Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC29EE57F5
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:55:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81817.1767167703375255261
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JJH298FP;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so7209415e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167702; x=1767772502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6LeuWyD5uG7m89jFnFyq4q5xPKOJdEPt7pvnF4jAsg=;
        b=JJH298FPk1YmaPT7282wG6/FIqenaxOgjadG9PQ4CczRJXwGtqw+f4LJibikZtEmZY
         vxF8OAKDCVkqN0hkZUkvynlG6gUWUF+Wa4xvBhOHh00PtGU/pK+6s8KmP4zSxiedSSvB
         +IWQU64cmI4B2hedISKL0JW1cTEXvZGhxavk0HXhZBjsrGLQraQVqZLZTaTNeGdbrat9
         tzuOVRh5f+K1e3ZaKP9j6h02wVQyYNB27jgsNROFrML0YsKPaqqF1rDbHiNVuihrt+Ye
         KIULyt1JwM4HRuXuJPK6lmcGsnwuOH6IEO8gMNrIRxQgcGGmTkGKrgNukdUHEYntIVg8
         Tqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167702; x=1767772502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X6LeuWyD5uG7m89jFnFyq4q5xPKOJdEPt7pvnF4jAsg=;
        b=Kr0ahwTT2hh2cG6BFfCX0ruYAfDCF1YXW2zCHYGIhPa27tEe+j1io3FSQ+ln8tQIBF
         RC9ldCFy+CCWKD278zsO2wbMjAqP5e4OG9BXMgtIxzvpLbRIMJyKhGXN1aAQQtuxJ4Ea
         nWuIocCdVzuQf4VMecAcBBEL/7gIppm1Xb3KC1EFmH3QSAcZgIAJJZn+STb4Fzfx3ko3
         uGKYIfv+CvD4Y5hVi31i3nsvSDoa4efGf5gdWkUfsFH1qRxIJzTyY4i6pTazoGPEQHdL
         Kl1rpqzs3r4GDHy6WaW3Q7uxzyeKDyM2vTI/SZec8ZAVVPWi8QLeBfAcrv/yHUAGdjPK
         mN2g==
X-Gm-Message-State: AOJu0YzOP3Cz5kE3AB/ELrL0CLCwsUk/jz2jDKlNXLQtX6EB8ULGoC4g
	tiVDnaloZHpaqsB3xPmVXUHr56kx02S9t2ymnJs622aEERpeiJEyxYT86iyHxQ==
X-Gm-Gg: AY/fxX5IO4lxjjYMVBIAoU3jUnF8pLBJbmEpFWnl+CASJX5T+I+pHIo5Vy9UDXWK5G9
	KO0ynD+yRK38Kbjyrn3L1VCbLdWqOgbypCsIdwI+CZHJuFW70ojaN98atHp8TJdru3r9NXu8Dap
	NR+pLXvj1Fr0uCoQrzYO5UZEeIWNJymp8e3TIy819tDA9A2ULNTrB7f89rvBYOPWCu1VqPCSRqO
	rIpreothlbZQUapeEX5XCxlOEjoiTvhVZmO8LvwHRz6lGjg89lD3gCMN3nO1N1aJGxa6ZjAq5B4
	GT2qukUNZLUXbHxhz0MSuntg6dHYkQJzAIlGFWKDtPKGe+xS3Rk8rAilxuiBmuIkp6A5torbuQb
	OVRQQq1afKZlQXfsTRzHf5HVJnTKGkAutE+zd2grKFa7Tu+E+b6/gvIcRlAy6ezmAIpcE2yPKiQ
	anj8RQn0Af
X-Google-Smtp-Source: AGHT+IGznXgegbEic68vKM8jRZnOdDCZR6CzosqixGscPVwT09sv1PBry4MJns3blJvhlhC0gPggdQ==
X-Received: by 2002:a05:600c:4506:b0:477:9392:8557 with SMTP id 5b1f17b1804b1-47d1957711fmr399437185e9.18.1767167701696;
        Tue, 30 Dec 2025 23:55:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.55.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:55:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 32/34] python3-orjson: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:34 +0100
Message-ID: <20251231075436.771395-32-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123072

The default python:orjson CPE fails to match related CVEs, because NVD
tracks them using ijl:orjson CPE. Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like '%orjson%';
CVE-2024-27454|ijl|orjson|||3.9.15|<

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb b/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
index 7db76c9415..2209569aca 100644
--- a/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
+++ b/meta-python/recipes-devtools/python/python3-orjson_3.10.17.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"
 
 SRC_URI[sha256sum] = "28eeae6a15243966962b658dfcf7bae9e7bb1f3260dfcf0370dbd41f5ff6058b"
 
+CVE_PRODUCT = "orjson"
+
 require ${BPN}-crates.inc
 
 inherit pypi python_maturin cargo-update-recipe-crates

