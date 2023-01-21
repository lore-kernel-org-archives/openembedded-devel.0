Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E53EC54ED2
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:37 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.2063.1674324092782604368
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CF/SjNO2;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id d8so8375657pjc.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3B59X6DsOQUq+KhJDwdDZ2zMaEwy4djFqrtlZtFRGU=;
        b=CF/SjNO2tUMh9bx6MfdxQKf7HeOIwWVyhH2nW+F0/xuxjO2mvFBAHSYE73xVn5kubC
         c7qFiRElWzvDvhFN82Hj5K6vtqCuoo8/TjLSarMsLuz97rj1a4jmB5IYNmTZc+gUmfV2
         Wn7mKe0UBsh2W9g8oLnqxOj9x4QOEuMm3xO6vtYNIPmtaNftzzTEVWKA12K1yDT3MsrB
         IEVFVC2iNnKwT9GeBDi/o+Vhs/eQ7v7Vk8Jc3j7zLun490KUKg9MUU9Cn1HucKWrsv94
         fIpxRq0fvIrg/JEcyzavm7RjLGfdPvW0FDpaINaRn4dmjJYYhkKKuBkhu+YkaxmpZvIB
         82Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3B59X6DsOQUq+KhJDwdDZ2zMaEwy4djFqrtlZtFRGU=;
        b=DNAAlLZcIowC476eosyq/dIGBbBDI+wl/BctLwNTSR0wl0luE6Sk7TLPDRJxB/T7yp
         wJIiNLUoNamt2zuCxWoozNGbGMyK0/n8h2wJEg87GF1aa/thp9cqeT1FoRK+x0bOJRaL
         VgCbbY99vMqBpjAaJFpVzpE8RUA72gu527Vm/XYDyE8HavZdCxcy2iaVpDgZ9O1vZOXG
         fAUgfD0Mv1J3mx3cHWRab7oORZg4A9vJpDa1w2xbe9tAlxvexmVkPR1Hs6QdEQBL1nDz
         hgwSymAJisTHakmmBocBXIAFDzSgnoCQj7rFbZXFGDyejaIMNGdF+PRLONvpakldKd15
         ukQw==
X-Gm-Message-State: AFqh2koRnaIRW10ruMfaE2fQ9JXPDTl63iO5VqzB2DNv2VsDK3kdPgjN
	noPXvrup/JEN8UmTO3TwPcMF62DbM0l1CQ==
X-Google-Smtp-Source: AMrXdXsjU8Y3C16Enb4ecPqR7GjE7tRjrQQAnW/e9uyQ82/r24gSkYKEBVJWB487Pzl2gyKPUnfmxQ==
X-Received: by 2002:a17:90a:b798:b0:229:d641:9ef2 with SMTP id m24-20020a17090ab79800b00229d6419ef2mr12874541pjr.40.1674324091958;
        Sat, 21 Jan 2023 10:01:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 10/30] ssiapi: Use c++14 standard
Date: Sat, 21 Jan 2023 10:01:01 -0800
Message-Id: <20230121180121.1229895-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100677

It depends on std::auto_ptr which is gone with c++17 therefore pin to
c++14 until auto_ptr is replaced with something else e.g. unique_ptr

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
index 13ed7570b1..bf9de31f84 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
@@ -29,6 +29,8 @@ S ="${WORKDIR}/${BPN}.${PV}"
 
 inherit autotools
 
+CXXFLAGS += "-std=gnu++14"
+
 do_configure:prepend(){
     ${S}/autogen.sh
 }
-- 
2.39.1


