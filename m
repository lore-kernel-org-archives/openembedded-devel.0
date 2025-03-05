Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EC3C28B24
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 13:34:23 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.13113.1741181659713640037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Mar 2025 05:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=N7TtkX9+;
 spf=pass (domain: konsulko.com, ip: 209.85.221.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-390f5f48eafso2447629f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741181658; x=1741786458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqP+fcjj2FcRRjeDLyzS4pfT79Ir9ibj79SVIq7hJJc=;
        b=N7TtkX9+Tc17ovu4Ov9spLojB/vIL4gRwLWbeSoAbmgZz/k6b2vcwazyP9aUGQhnQm
         XOWyoR1ZaJB++xtmn3mPZlcAG4H5hXPsF995LsjHizmjQRg+Ls+N8w63mKjND9ycQENL
         pKTFLyES8+a69GsfzOzF9kfct3r6TT2ECOZbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181658; x=1741786458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqP+fcjj2FcRRjeDLyzS4pfT79Ir9ibj79SVIq7hJJc=;
        b=bmdLuezx8sh2ZGKdJKi9yrTaggnnkV1jy+/5dbEdV6o1HMhRtZjV+xdlxpz5MId9Wl
         +uHnuGJx6OfIuMYOCQYimHM2urfvDtbPVpJsJYGvEMfKd58gczP3UATKhoYKItKPfdvc
         +4EihwR9gYuh2GL2USSIGoZx0fKeMczBdUqSgFomfBZPN9buA6J6Te84eTarLnWR7hSG
         DdN5s0dIxJY/5HGQCIn3A08glL6nFZoUmZLyJMgbuPSH4zAZDPI3RqeC1Hzws5wjlU+r
         JVD57q58HDkFuedrFX3v42CqnesbkM0C0nEhmtmpAvDDVuiIrZa4hfJcPlqSYzJH73wi
         rHkA==
X-Gm-Message-State: AOJu0YwOm4ceE/+LsUnx0ELmu5YQKcON7j+g+9/pDqwZwzn5sHLTujYR
	iEWKr8akK7OR46hIPlEqvCdAvpgS0ynFPR2BhOTC9c1BXIvVvUT0MiplTVewSw10VYFhuF/oInL
	9
X-Gm-Gg: ASbGncshCZnF1vELmj//3ZD0WPmUisEtH/mQkWyt67BZu+w+c0AecjXKJ+tKQ5vBqWA
	+LYUwi94aT3LlfhoM8rVMP22bkPDNJh2ov+tNIZ9TxOzvdrEQfvioWj24Ye/Xs531ImGrrKnHvQ
	WEwYCnc0/9GYQFwCzZlJik8TS/O6YkHEzY7nH6Oz7LLnSFDOIu2KjUJDjjcEJT1+//DsP52CpQk
	/y33kr3I6W45DsZGl0bjiXh7leycGXhWdH7F1lzh+i/uERCphycULhmmXdOIScgCKmM1lmVHCXp
	8M9k2mQwyiLAKi68n9FYzZpoVqVKg75y8Zg52BzVWydJXmjPUnvhERwCP0Q=
X-Google-Smtp-Source: AGHT+IHgTRUalkT7/UG8PGWurpjKEvoqRVaPT0Ph+/uPuAbnEE1vACt7HqwirQSmuML1nk8/P1J8Bg==
X-Received: by 2002:a05:6000:2b09:b0:390:dfe0:1320 with SMTP id ffacd0b85a97d-3911f78696emr1503172f8f.33.1741181657687;
        Wed, 05 Mar 2025 05:34:17 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485df5asm21266361f8f.96.2025.03.05.05.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:34:17 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pyperf: Upgrade 2.8.1 -> 2.9.0
Date: Wed,  5 Mar 2025 15:34:12 +0200
Message-Id: <20250305133412.3463021-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250305133412.3463021-1-leon.anavi@konsulko.com>
References: <20250305133412.3463021-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Mar 2025 13:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115754

Upgrade to release 2.9.0:

- Add warnings about too few or too many samples
- .github: Add ARM64 CI for pyperf
- Add support for profiling benchmarks using perf-record
- Prepare 2.9.0 release

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pyperf_2.8.1.bb => python3-pyperf_2.9.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperf_2.8.1.bb => python3-pyperf_2.9.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperf_2.8.1.bb b/meta-python/recipes-devtools/python/python3-pyperf_2.9.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyperf_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-pyperf_2.9.0.bb
index a9f30745bf..810e65674a 100644
--- a/meta-python/recipes-devtools/python/python3-pyperf_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperf_2.9.0.bb
@@ -13,11 +13,10 @@ Features: \
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
 
-SRC_URI[sha256sum] = "ef103e21a4d04999315003026a2d659c48a7cfce5e1440f03d6e72591400713a"
+SRC_URI[sha256sum] = "dbe0feef8ec1a465df191bba2576149762d15a8c9985c9fea93ab625d875c362"
 
 DEPENDS += "python3-six-native"
 
-PYPI_PACKAGE = "pyperf"
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-misc python3-statistics"
-- 
2.39.5


