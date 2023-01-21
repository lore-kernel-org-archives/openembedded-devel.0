Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35406C38159
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.2064.1674324094311231906
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UgVnpze5;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id m3-20020a17090a414300b00229ef93c5b0so7072178pjg.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv5+bGV27t5TwgoCgdzMm1nu7G0yRcBSgLh/yDBWPhU=;
        b=UgVnpze5cHP3aMTY8B9GioW8Dbb3hYp3onamfloSNB4fKt0EuQv6tIcEXBE3e4Ibjy
         2RCN08bC5pGeTLRLlUWBEXBiQuJcf7vGxRkxPFVQnxgGnLp5LGo+a1Z16qpBfFiEjxlV
         q05wOoC1YTtP8juyAPA1SMAYWHcBy9T2zdDFozye/BkicYxxGNX3DUnND1wBSB5l4Qu0
         SP27AcB/sH8t9Nuf8Im+g9Qi+FPzhGjpa1Iyow+HqSocWV9yjfarcFGnEIc3+mzJwW52
         5VzO4N+auI3ahhljhlC+XjR0OKGrLxpliyabsdCUv4+3abDGc/rSUTHRWbOLBBSMlUnb
         mTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv5+bGV27t5TwgoCgdzMm1nu7G0yRcBSgLh/yDBWPhU=;
        b=DJEwJlKQ+Cl0yHU5X6MBYkNsa9pbq35Z9mGgzBs24i3z6cu3CXQQWmWqRu6a7MAXrB
         sI1ZPjkP7T5VPLA56MD7H4b+0Ym5reBYFcNZv5B05DadFZ7DsxWBicFX2DwTrknTLHfp
         5VAiIkEGfhdqA2DGbg1FDlQ/BuCV/TGMpzPXhJLkvUaIYN4+detim8uQiScPfunyVntx
         FRy77gVbj9JoEsoYGm1d6aWg8cd7dpT2ZXhp8YWjWy54vDHVU3DKNzId99iEOCu1QT6i
         mw37V55z+yZACCt7hyqvW1XuOOpGqWwnfaCAOGENBRyb3PXZ4NhCHax0N78HAYh8Rd3M
         UNAg==
X-Gm-Message-State: AFqh2kr/nmk8UvlBMlY9CnWGETNY7OBagEKNJ8TDohhXs6qXgrocx2e3
	tZz+edT2e9aQof6rsWnL2mUG3uIf9FtdSw==
X-Google-Smtp-Source: AMrXdXsWjHHw4LKPkV31JVh/Hq532aTcusAKya+mXaHmYvsHO0yB+LD7mEA51YXIm3AeR07PJqtUJw==
X-Received: by 2002:a17:90a:7309:b0:228:e521:3430 with SMTP id m9-20020a17090a730900b00228e5213430mr20143392pjk.21.1674324093527;
        Sat, 21 Jan 2023 10:01:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/30] gengetopt: Use std=c++14
Date: Sat, 21 Jan 2023 10:01:03 -0800
Message-Id: <20230121180121.1229895-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100679

It needs std::unary_operator which is gone in c++17, until it is forward
ported to work with c++17, pin to c++14

 ../../gengetopt-2.23/src/gm_utils.h:132:35: error: no template named 'unary_function' in namespace 'std'; did you mean '__unary_function'?
| struct pair_print_f : public std::unary_function<T, void>
|                              ~~~~~^~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
index 52c1016335..4d97b1a419 100644
--- a/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
+++ b/meta-oe/recipes-support/gengetopt/gengetopt_2.23.bb
@@ -13,4 +13,6 @@ SRC_URI[sha256sum] = "b941aec9011864978dd7fdeb052b1943535824169d2aa2b0e7eae9ab80
 
 inherit autotools texinfo
 
+CXXFLAGS += "-std=c++14"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.1


