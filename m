Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E3D1C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 08:10:49 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.8317.1678349440853459621
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 00:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYuxnzp2;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id k10so3552032edk.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 00:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678349439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RvFd6Bnqnqcecbn0MXXpCIHi/v3y9f05riMXYALF/cg=;
        b=UYuxnzp2UdBs2o0oolPV3FMhv8mpfASM7qLD1toWlNvGRU0nkcCfFVLBUcV2htKDz3
         s6Th5vY11BhxvNhhx1TC2QN5ELHCM3D2x0/fap+bIJWcVfjI1OG34Y1J9DBNMjhTJZT+
         J1opSqTKTZmqw20Ji7RKRqba2MJKri46dytYuFuY8VhBRk4Ht2pk/OXoQj81gJPXs/tY
         l7q/yhpiu9XNatjVJnOfm43bEgP8iHZRjUJldtef7L2+kItJveWV8XMmhhT5ta7FNrQ0
         cPTukT7oUSepQtz8BCj8IbALuiFTUVUQiE5cR/8EHjC338eti1EwBVhTCZePZq+3gaXR
         hsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678349439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvFd6Bnqnqcecbn0MXXpCIHi/v3y9f05riMXYALF/cg=;
        b=1J4qBOxKmZUiJKdlc6PSZ9WV3sHE5kknkB1yrlGthjonBG4U9wxUeH1YlDd2KV75+G
         zUTB4Tw0cRcLxaG3hguKvIGoMJ/Gw7J1soEf1433pc+rF4G5kGJt7Y00QiHWN/SekeH9
         Vzi4gps0YcjjsBb3vEXRB6Ul/cy2vZ1iY5czqCm6rx/jmnsrXAREd56qgo9mnD/WL1O4
         MfR0kylWDbjJ2gIckKH4qB+1a3XNtschQJeeKT6XfcOzlTjLeFSDUDran98ESZMrzbJT
         tiz5nAyKRIZWwOvNpj33xPizc1SY6sCuRwItKXq8g3vkrMR7+Q3XKGbY+EqiOI6cOgT6
         LFvA==
X-Gm-Message-State: AO0yUKUGJkEMj7+bcW5sp6PM5gSVMYFyczPD2Yse82NPYaZNH5AcvdWK
	0w1Jr2cR5MS0HOA3WTfjXMjFd96r5lYMBw==
X-Google-Smtp-Source: AK7set+eBqW04U8PcDlTdNh+LvKLQt5TednjWsEvKdJ/NEqz0BArXK3pGuCfCKB4w/zYl86Uf5psWQ==
X-Received: by 2002:a17:906:4953:b0:877:a2d1:7560 with SMTP id f19-20020a170906495300b00877a2d17560mr20349062ejt.27.1678349439072;
        Thu, 09 Mar 2023 00:10:39 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id gw20-20020a170906f15400b008b7a9ff7dfdsm8435710ejb.162.2023.03.09.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 00:10:38 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 1/3] opencl-icd-loader: Add RPROVIDES:${PN} = "virtual/opencl-icd"
Date: Thu,  9 Mar 2023 09:10:34 +0100
Message-Id: <20230309081036.3179583-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 08:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101435

Some programs dlopen libOpenCL.so.1, they use RDEPENDS.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
index 67437732d..fc04cb55f 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_git.bb
@@ -9,6 +9,7 @@ inherit pkgconfig cmake
 DEPENDS += "opencl-headers"
 
 PROVIDES = "virtual/opencl-icd"
+RPROVIDES:${PN} = "virtual/opencl-icd"
 
 S = "${WORKDIR}/git"
 PV = "v2022.01.04+git${SRCPV}"
-- 
2.39.2


