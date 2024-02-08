Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5BAC48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 07:54:54 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.13008.1707378884560442799
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 23:54:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KkoxPvp1;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bd72353d9fso1090104b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 23:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707378883; x=1707983683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbcpM4gNqeutGk0jGxqsuVgEKN4viGbq8cR29J7yHmA=;
        b=KkoxPvp1lX3YuwRKD3OyEjvzSGlFv6wtK9rMI8PVGNSkC+bhUlLCt4OaPjY9kNCWri
         m70KNx9eVxXNKgFq8XASVqFygMEAtE38yMxdSQi7DN5WmaRiHnffvTpj/OGEE46DqGeZ
         InG9O2VD1GHqRn4UhvPY1XExuqEUyWMpOO4OnrDSgCMpTK1oRkxv57wr3v2HUTI3no99
         pFo3/L1ogAWDIoKcrWFUOgXhggCBCulYEAVneKZ8GgiOziMt/JYSDY5bGxH6pwWqPxO/
         yNZ6AewOir5YzUQRUtmUMYRGf8sUDWxM2SUHToscPvThSzFrRhw+E5qCzxrBFX1k1k82
         NYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707378883; x=1707983683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbcpM4gNqeutGk0jGxqsuVgEKN4viGbq8cR29J7yHmA=;
        b=Q3RsLDWtAvycsmd88DD/H0Ic09QpqrXuL8/Bi9hkG8gZo49Ae2SZxXIBxp7gWIjAy4
         a2A/TcOBcidm2rQX7aDLtmf/JirR1eoJi9DrHa/uJAquiFQlwlBvvhz3bZmvFATyRiqG
         7EdnQTITznF2q90X0TTjs+S9ELbq8O0Z99GVnVz0ufirDmdyzqzlz7lK5BWudI1FxrQo
         5C7ZIegUk+QKjo43jtYEJ0RpdNAxZeptwCTljL/Lroy7mjjOMfkI4wT8K52XuCLu0pGM
         94pkhCisoVm0LmDri/BdtaAg2vioD/7Py0jPkFJskQ9b8Q8dNCW8BghHCLV3m+qpZwCJ
         jWgw==
X-Gm-Message-State: AOJu0YwUWAHJmV8q0gGhTVZwwFFhnXRurN0duTB7ThKVKfKC0UHzq3eh
	o30+5EtCO+MPhpMzFz1/oAIAOSm/MVILTRzQVAPF5Of16c1udBbhUMEUsgZRkL4=
X-Google-Smtp-Source: AGHT+IEv79sVXGIUx9aAhRrbr6RTz5iRi5Mzq/QBBMtLL/hq8YPaN9vFPyX85gmP1g0DEEur4G4uvA==
X-Received: by 2002:a05:6808:1508:b0:3bf:f3cd:5cb2 with SMTP id u8-20020a056808150800b003bff3cd5cb2mr1492123oiw.25.1707378883513;
        Wed, 07 Feb 2024 23:54:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id p17-20020a056a0026d100b006dde1781800sm2390539pfw.94.2024.02.07.23.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 23:54:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] libcereal: Disable c++11-narrowing-const-reference warning as error
Date: Wed,  7 Feb 2024 23:54:38 -0800
Message-ID: <20240208075438.1045660-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208075438.1045660-1-raj.khem@gmail.com>
References: <20240208075438.1045660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 07:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108660

Clang 18 is fussy about it

Fixes

unittests/map.hpp:65:25: error: non-constant-expression cannot be narrowed from type 'typename std::enable_if<std::is_integral<char>::value && sizeof(char) == sizeof(char), char>::type' (aka 'char') to 'const signed char' in initializer list [-Wc++11-narrowing-const-reference]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index e100265f7d..6ad20d6370 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -29,6 +29,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig ptest
 
+CXXFLAGS:append:toolchain-clang = " -Wno-error=c++11-narrowing-const-reference"
+
 LIBATOMIC:mips = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
 LIBATOMIC:riscv32 = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
 LIBATOMIC:powerpc = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
-- 
2.43.0


