Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0ECAC4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 08:42:43 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.3911.1667378554071207752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 01:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=G8DJTf54;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id f8so11261955qkg.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 01:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+T/OvlauAnnxugGJ/YacN43S/15ubNrC++oWxRX0xcs=;
        b=G8DJTf54QcnQYzKORTpLxaVPVPL8djehs+/UKVSDaaD5KzLM27stjBvgWJlV/YIPNe
         UcA9zOKAuxwr3c71BIdnpfrZioecoZMDP+d0mEw9HhdacgNGcaBYNfLmMMG73ydoBs3m
         Zxzp4oAYlZ0j14ZbVKM+fCmSO7vWsIFmonHP6wMuja9c7NsjQ2VKm7RlKnrGIdxG2OuX
         ISxXTt8GsGsW3a0YoxY3BIwrSmE+5PLJC0/YLIPvK2GuKcu2fn8/6yXbUHArZubRYUHZ
         84CSJsTNSEUEZicIrseen8cVSHY59Lv89Eoi92RKk9ngc5tY+l5HPJ+5Rzbp0R0UugrT
         nV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+T/OvlauAnnxugGJ/YacN43S/15ubNrC++oWxRX0xcs=;
        b=fHZUFJPbv+Ao3cCHpyUHC7w3T+ToDWdvRCUUmsNHmWaXeferIH1dPApemtcG0ZRZ5O
         y0peVSfYUXLipvxjFxOw1kwn3sFho19MC9zQ9vHwyAhmZTzJFtaQrvp9249n6kt/Zcvd
         cPhnMFu9pnQgKXFewbwXdAkqkol+m6AHj8geMGv4ocfqs/NarVyAGDmBZcVwa3DgY9zS
         KD0frMbevM3OGmY6m+J7BLE11Tu09SgQJjYoRJ1CuadpYhq3nAhVZKJEX7m20NPkvqLB
         r8GnsKwErWA1wunJmracPi5TeZJHdflyUv7285WCjafTRaNhrxjsBhC83LkQjKTZF/pU
         m+bw==
X-Gm-Message-State: ACrzQf3jevnVmeDsXfhkkpaFuEOHKXgamPCSOqlh3DU/eJk/YN3k3Esv
	Pk85k7CGYnz6UTnhjNXnj1iuVms7/1l2kA==
X-Google-Smtp-Source: AMsMyM4Z9POeKCB7n1QnPoRqPgFRMOTOjsKFXtvKiPGai6jLpOVwcRgqdERNhluMPPJzvSMk34u/vg==
X-Received: by 2002:ae9:e116:0:b0:6fa:30fc:182f with SMTP id g22-20020ae9e116000000b006fa30fc182fmr9838915qkm.401.1667378552806;
        Wed, 02 Nov 2022 01:42:32 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8259:e903:8d8:7eb0])
        by smtp.gmail.com with ESMTPSA id t11-20020a05620a450b00b006fa2b1c3c1esm5631202qkp.58.2022.11.02.01.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:42:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Carsten=20B=C3=A4cker?= <72093439+cbaecker@users.noreply.github.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 3/5] spdlog: Fix CMake flag
Date: Wed,  2 Nov 2022 04:42:25 -0400
Message-Id: <20221102084227.1210486-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102084227.1210486-1-akuster808@gmail.com>
References: <20221102084227.1210486-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 08:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99412

From: Carsten Bäcker <72093439+cbaecker@users.noreply.github.com>

https://github.com/gabime/spdlog/blob/eb3220622e73a4889eee355ffa37972b3cac3df5/CMakeLists.txt#L72

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b20af98b5ad28e330c97770f7d0db75890784f98)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb b/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
index d377241ad1..6362fc7a4b 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.9.2.bb
@@ -12,7 +12,7 @@ DEPENDS += "fmt"
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
-# no need to build example&text&benchmarks on pure yocto
-EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLES=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
+# no need to build example & tests & benchmarks on pure yocto
+EXTRA_OECMAKE += "-DSPDLOG_INSTALL=on -DSPDLOG_BUILD_SHARED=on -DSPDLOG_BUILD_EXAMPLE=off -DSPDLOG_BUILD_TESTS=off -DSPDLOG_BUILD_BENCH=off -DSPDLOG_FMT_EXTERNAL=on"
 
 inherit cmake
-- 
2.25.1


