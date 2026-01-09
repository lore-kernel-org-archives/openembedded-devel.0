Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2B9D26D6C
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:59:40 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13174.1767974371818996877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:59:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=T+S5ULIS;
 spf=pass (domain: konsulko.com, ip: 209.85.208.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so6360800a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 07:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767974370; x=1768579170; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nkf2A/1zcg7QHIRYIN0Sr5a8FZTCOJy8OK7gbPiP858=;
        b=T+S5ULISvXZN2kovxb0FemFkKFBhcGSBFuD85EYcNyuDK/IG7rok1oSNwWE6Mka/Ur
         pSAipMhCbMEvn3Rbhs035j8iypT5rpEXmfbxlEXGd+NJzQH8kcQOtS9cPdej4xfaBM5U
         OeHosIUFsI7o1TQUxpH7rudrQ6+anVnKmMa2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974370; x=1768579170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nkf2A/1zcg7QHIRYIN0Sr5a8FZTCOJy8OK7gbPiP858=;
        b=uyssLbntFXPGhaVaqws+jBlo3kOoBjsaJLVIWe2ft4Eeg8pb5lRYqWysfyZ1ty2R5y
         CKq31YuybC0qip//8UDqV5ypvvl4wH3Vf9mzYGVtDumDF5VfhFoNr0BpqE8NgdvKaf8l
         ZDnqoPGsMd4U1T9OnuPq+rAv2sTBnxIqXn0qDYUttWoemopTGXHdg90O/8FXla9oma+M
         48bw4Vj1PxMfpFIJBbcrJkE1lvsdDacD0LOvpGBLyRwAyw91xXQAhQ4EFg0PouXxxlgG
         xOBd6YZqx+YAZlpQZT4F6nSFqg3l/pZuZRuxmxQdZBObpGPU7r8pNz4S+qSw4ktMZNo0
         8ZnA==
X-Gm-Message-State: AOJu0Yx2tpsARV8QrsAoXtgdKHDBgJSPVRSOgKFczEn7LrKj1vN2l1Kh
	gyX5GAhxYpLaYULVOpL2y0blcuwX9hJCCXYZZVtlJ/mUjuknroK1dRccpW6/Q6CCxkWT+pGLyaU
	2pJlP
X-Gm-Gg: AY/fxX6iil2qdwL6nPudkPtEKlnZnsbyIWLGVfeIh8+6eC4T8taeZPmaL6gz3S/CIJZ
	oO3WMXa642XSOULImfTJ7+lG9xjl3pHyKxXFV1W7DL6K4twaQauyyTlthP92nrH7T9mxE+LtvvN
	ku5+O0DrQ2AW27Gck6CaxaSwnDBfXPm2wmhWL6BgZ5MSBiFPS4nipN847jjjV/8sGkzGo7LBpCA
	xXUjFRj4QepoGnV/7riuSHptqL2eyD5FLfZVRC8aQ9IvTA/nWUTMuKYodl+HXRKC6V0lMwZCG4X
	SaZIMXIIZcv+x8D2NyawKq0JFbz6IchpTrzPw/7FBCXX0eC3tbR8GPT7f+f6hR964frJy2fFkNt
	/z7zmawu8BydFj2MEb9Nr3ZorpRHaRIQJp4kpM+fBr4epLOLyFzy2hgp1VIsnoLF+csgoizOSBj
	ZwPv7tG3LHyI8gomqEtj6+X5AT
X-Google-Smtp-Source: AGHT+IH/W0AKUN6oyoCgcwraUlZ0IqOTAWl0aHAhUphi2Lr3rxCUJjt13NYHffIa3T2t8wDvhgSXPw==
X-Received: by 2002:a05:6402:13ce:b0:64d:1a0f:694b with SMTP id 4fb4d7f45d1cf-65097de79a8mr8949789a12.10.1767974369842;
        Fri, 09 Jan 2026 07:59:29 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d4acsm10781444a12.30.2026.01.09.07.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:59:29 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-typer: Upgrade 0.21.0 -> 0.21.1
Date: Fri,  9 Jan 2026 17:59:24 +0200
Message-ID: <20260109155927.3850975-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 15:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123306

Upgrade to release 0.21.1:

- Fix escaping in help text when rich is installed but not used.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-typer_0.21.0.bb => python3-typer_0.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typer_0.21.0.bb => python3-typer_0.21.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.21.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.21.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-typer_0.21.0.bb
rename to meta-python/recipes-devtools/python/python3-typer_0.21.1.bb
index cbd0df4b64..0bf2c0ec4f 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.21.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/fastapi/typer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=173d405eb704b1499218013178722617"
 
-SRC_URI[sha256sum] = "c87c0d2b6eee3b49c5c64649ec92425492c14488096dfbc8a0c2799b2f6f9c53"
+SRC_URI[sha256sum] = "ea835607cd752343b6b2b7ce676893e5a0324082268b48f27aa058bdb7d2145d"
 
 inherit pypi python_pdm ptest
 
-- 
2.47.3


