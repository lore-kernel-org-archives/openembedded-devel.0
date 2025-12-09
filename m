Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4EAD3B9AD
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 22:54:58 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.858.1765320894014174967
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 14:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iQDw7Lap;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-298456bb53aso77996835ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 14:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765320893; x=1765925693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyBOCvm4YFH+8QOoL8eseHbD4Ea9XKDtSAa3KHXrthc=;
        b=iQDw7LapGZLHskVvF35IYZrk6LwWlUa9XuNub7ZErPdAu1oMjkOJ2UqasI2E5pbEVq
         P6/6ViSTGn1JuDS/UAXrrLsiwgZwvW1dM077v8vcO2yJxuvXbndOUbMrqOnALr57JKW4
         HuX74YoB9geqbcv3GbnSaANCUgi/jQjYENxvCm6uwp7Wj0yciBQ6Y9Q/UqO5oPAP4wiT
         tR2imskXzCIYDUotdac/8FyjNVkccrMtVPSHufU530gojbPgf5JXtIagT0L9Rh5HaSTs
         Vga4+0Gba8ka6zTvA5dcaj2aAS2gUcuAPYzguk+t/f5jswH8/OC0tjDwQ66lPyvJfu7c
         KbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765320893; x=1765925693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EyBOCvm4YFH+8QOoL8eseHbD4Ea9XKDtSAa3KHXrthc=;
        b=La/2k+svYWPBszWGrpDxrN6miCNM81IqTDmi11DnUCb+DFI+bipY941VeE5vKNkOgX
         o7/TvxySVbqL7vyWRatcC4ssdbUDm5VA1M1JGJom6gqoAVKW/gO4P9VnHjSSlB+xGWbe
         CJ9Murz3yvpKqsE68+BAApcF7NwWC4nuXHyD+0Il9n4bj3ItkqZUzz4JfS2jRzZ+IYpE
         fIyTl/gebdsQBhBjTpWtVpvAsjwRNAaBs5NLT1NOkuUK+746t+hN45gqzAYKQ64qdtV3
         cty4ek/hIaeCSOLjzqLEZlpIoQiq5nSYZZkNijgkflfVvHGvGZA/FQnYjOTilBcIy96P
         2xUw==
X-Gm-Message-State: AOJu0YzjJMQ/LljZKFEeNFZOFKo4xMrLF1TADoH6OExzp/HYuxLlk8ME
	zIz/uXQilLVSrFqZBAdE+pRsX90/9wkdt2ldTPIlhdxN/j+wwlJKxxRsZ87A3Bg6Egw=
X-Gm-Gg: ASbGncuCnj2DeB79C9QrmdKX32OXt4soJCzM1lvImlzLzhBleKj7/P5bqebe5rmH31T
	aLTMA0MLDwN+pmN7kME0UrrdELvBfIUY7okoaA/f4aPgGxiZACfpP/di/wTgyUXA8+hl6ooeV7Q
	N14hQIcjs4ml0zQj4+gXlwvvT4C0NBdHk4JGsKJUBv7DSluLs7/YyZ7A2r4vkvpZzS+4+9b2SOv
	e0AaBzOU6Swd3XQ7d9F2Mp40DOFS1dfzAFupied7ZiEYMcrff+c7Edy5AKManIhsOHPTgN+Uw3R
	nkKgfgyaAgfOkUQkLpw9sGJPUaROa82ZGIUFVudbt6c/oM8grnxHaChJh60QS/i2RImuTHvaoQw
	PGVg7/wDIbMygkfJJ0W9zi2BxiKcuD1hy/dn3tA3oac/eDdysRH/VUdz4MOmXHnv3jvsWjW/a4o
	G3ho/MPr5X8+wx45Zfm++dssqA9bV57sgY1WpIdIjtaTLNqbCoT5IiiFe6K3mN+JZ/vQLzCR8Fj
	ytzZE7NaBH2lmTpF4nVXv0GUd7so5mG
X-Google-Smtp-Source: AGHT+IHb0MeQYXM38M/HX3M3lzNnkw4zUUyqonAcciqCRs5Q1KAA345PWw9qc4rKapbA5UMhDnBiOQ==
X-Received: by 2002:a05:7022:3c09:b0:11b:9386:8269 with SMTP id a92af1059eb24-11f296add41mr198100c88.46.1765320893051;
        Tue, 09 Dec 2025 14:54:53 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2f3csm70404942c88.5.2025.12.09.14.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:54:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pyzstd: Add ptest dependency on backports.zstd
Date: Tue,  9 Dec 2025 14:54:49 -0800
Message-ID: <20251209225449.846352-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209225449.846352-1-raj.khem@gmail.com>
References: <20251209225449.846352-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 22:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122478

This module is needed by ptests in 0.19+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
index b41746dbae..31d3db3f00 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
@@ -18,3 +18,5 @@ DEPENDS += "python3-hatch-vcs-native"
 do_configure:append:arm:toolchain-clang() {
     sed -i -e "s|'-flto'|''|" ${S}/setup.py
 }
+
+RDEPENDS:${PN}-ptest += "python3-backports-zstd"

