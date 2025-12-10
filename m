Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14F9D3C52B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 08:16:20 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10810.1765354572210338782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 00:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lZMUlL/0;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so1470360a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 00:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765354571; x=1765959371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErPeb4d/pVX8oeJjRaHeQy5jyoLZVlA3a6ihyeF/RCc=;
        b=lZMUlL/03Rm320eowX9c4w+KJPP4TBk7MwJZaRO0wtsCSEa4UNvGvkMkMTnCUvllUh
         Y8S35Y/CPp/cSndzVnIF0G3Fj0tntMqNm6G4mFxUaBW61R4t+KbPxLqiquU6qnwhFa44
         D+ouUmECGMLA53C7sJ3VSH85kl03ZwhLx5dBHgpC6dDZJJE6VtnAwjBKVmeLMx0bEl5b
         iY/cA1U7afZIZ5Pf8QISbqbiY3xLt+PPzg/p89xC9+lf8i/E8g1c0tWLvE9FCFwggBSi
         MQtp58/dTiHBhi/0PCTjuW0RCkV9a8g4nbLyUfhAvz4hBByszANtB1b4rzW5Zgc1ULlT
         pXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765354571; x=1765959371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ErPeb4d/pVX8oeJjRaHeQy5jyoLZVlA3a6ihyeF/RCc=;
        b=MWxc1OADg6DFYW8Nl5YxhH2fq8UlhH/mIHLKTn70fZudvIZq8EHw4tBFjVXc56GN/f
         bcvGmNL6oM3LRzpvmBO6iFBW/TEPeXV4ogtSFkGo2tFGgYxNcNArhlOXYnAGfTK9H0UB
         V2bdNkYNUL9aZSzoxa3fSCcCGJpquTJ7jK25HXk+9eMkG2xZNLLwi+8iV1lTm8bV4ML1
         j2z2DdrVSh+oOtcOhGh3xWXk9PLkztVx/WwuvQ6wev5Nc6CRkIlTpgs2HG6rN/eR+c5x
         D7jo1LrgczOxQeRVyalNvdRv0vMUFXN+GkNHwHe9ll9stSjyGVt3CcCxGM79f64xqTlC
         3jMA==
X-Gm-Message-State: AOJu0Yw1kTI+UHhP4AslvbiWWDgpQen8n3RitxrLSOGvN3qUKC4Js1Dm
	iTa5pUEDAIZWN2JkoXCSeq4e6Qs7p8Ak8cSYaQhPpkOAKRHEBttjHMVKiSG1jTod
X-Gm-Gg: ASbGncsnCUmD/jltp3k8HUUfAaL7noa6LSpGw0hJHWNSixv87qlWnzbYZ1gbJ+GGYlr
	jMeCbucMsEK64vpBUFvqRQKWbg4U3E9GIZHR5fcw8j1xRP0RV6yCjs/L7eO1Wo8NJbKLFws0nS9
	zbSMCy0ERHVr0SOAItTHKOY6pxx4TicOLgMhErGuztApa3zNCCUyg6PxQDn4kkPpxKCbrTSIKa3
	sLEYhrRSYiWdr/5NMj+eaJFwOfNXqDmw2qu4DRIHCW9Yr1s5qVzdbrnC1z8yM5vtdhIG3X0VAJQ
	prdaKsJxj72PYPAzo0sj8QTrDBupF5WChFijwk336VLIPjjI5ZqTbMCYJrUBtqG1k8vpKXuSctG
	p2zyMGH7CHtX+Gsj0E6LDKFcynuIgOVGxQPeiUK+brbjeAKqOaA4rUKwF90NDEYUgH12DNJ8Lpa
	Uy5mdH4iugKXrXfPHZSDL4TKLio/Kd8hjM+DZa4LTwv3z/NjtiRFbPb2VGcUBHpi8B8u4eTgCcR
	odmz6y9zBWSpP6nmyTbGBRSfe9Ra/Wo
X-Google-Smtp-Source: AGHT+IEOJeWwQ5BLNgbVana7JL1aQw4JmTLyQpPZY19xRt+ZfN+xDlXiUES7dEGc/APUJA9JxtSBtQ==
X-Received: by 2002:a05:7022:2384:b0:11b:8278:9f3a with SMTP id a92af1059eb24-11f2966a6afmr1413486c88.8.1765354571215;
        Wed, 10 Dec 2025 00:16:11 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df7703bd7sm80613086c88.10.2025.12.10.00.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:16:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/7] python3-pyzstd: Remove setup.py tweak for lto/clang
Date: Wed, 10 Dec 2025 00:16:03 -0800
Message-ID: <20251210081607.3196421-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210081607.3196421-1-raj.khem@gmail.com>
References: <20251210081607.3196421-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122490

This tweak was specific to clang-16, its no longer needed
moreover, setup.py is no longer there in latest 0.19.x
release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb b/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
index 31d3db3f00..baaab182d5 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzstd_0.19.0.bb
@@ -14,9 +14,4 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest python_hatchling

 DEPENDS += "python3-hatch-vcs-native"

-# clang-16 with -flto segfaults on arm, therefore ignore flto for now
-do_configure:append:arm:toolchain-clang() {
-    sed -i -e "s|'-flto'|''|" ${S}/setup.py
-}
-
 RDEPENDS:${PN}-ptest += "python3-backports-zstd"

