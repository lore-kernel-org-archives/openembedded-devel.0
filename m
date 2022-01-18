Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C192C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 18:53:31 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.1296.1642532010987573312
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ky9jsXPo;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 m8-20020a17090a4d8800b001b4f361964fso168622pjh.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wy4tqcmoIE6GwHMKnqgorafBh/63hz9LGWELCE6il8A=;
        b=ky9jsXPojm7l2a6uCwA2OAkIVAyQiYdkABsvYkIFcJpgJ7HFplmZGH8Bhhkh0+EG49
         8hPNs+66TZD3NaK/4fsMx4MXAdp4TRFxO0JzO6gqY+2/YUD67U0oEZMoi35w21VdNCMB
         lXvwj/yHk2pFHtxQkB07rjwGJHKFAUmPZQD/5MR8hFUDZaoWIM0hNXPIQUhtRj/dxI7Y
         q7XC84Q/gPFNloq3XAX6Lvo55GxTUIFT1qAXuDTR8bT266C0YWc27XDz5DyFKyFw6stw
         lXYwxXjSyAwZLgxIVwK0aasxIr3HFPyw1y+hfvLZJVKW1q7r6E0XdPPG+KnYtwdijkX/
         32hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wy4tqcmoIE6GwHMKnqgorafBh/63hz9LGWELCE6il8A=;
        b=j23tmX5S3ockZwYCqr5VwdvXkIvcXovhax5/L8k31qmZRBaiitbt2uAr3j7LQCXtNw
         VMt69S6zkMVC2TKmlWsRQV8ajU/W5kg4HBJgyehEqtAXqildmKAuBlTLBKbtw92ABrmL
         psNGJjJDctpr33KKD/FbNV1fHPQ+TmGNKmJuv5dWRjeToTFnHu0LXEPAO1af/zGnfvPR
         /P3h74ovHFyA1dOZSYcZwC1mvfHqQT4ilgaFmUdd02kuN1AqAnk8ac6t/GgH56LWCK0+
         7XfuXoAwbNHre60rPBupzLnuiupgzXnqhPiX/HiPhN6EcUedoLeqBBQKUeJTnKxl3sT+
         B9ig==
X-Gm-Message-State: AOAM532/ye41YOA7BPpeGgS6d+JwX+w/BomBsbeEGc4NYxJaQ1cLRTnm
	ufvEZuvmJBJ9SmMz1b1nSUtSf9bDA6ABsQ==
X-Google-Smtp-Source: 
 ABdhPJwCybMr/FOlc9vdq+ls1UNpK9HnkwO0qYAhqhf9XNQoWj2mxSums0xWggNKG5HCowsuH/6ovA==
X-Received: by 2002:a17:902:8ec7:b0:149:8d21:3e49 with SMTP id
 x7-20020a1709028ec700b001498d213e49mr28791792plo.111.1642532010099;
        Tue, 18 Jan 2022 10:53:30 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:53de:4e73:9ed8:2550])
        by smtp.gmail.com with ESMTPSA id
 v6sm15325718pgj.82.2022.01.18.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 10:53:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-pyruvate: disable 64 bit atomics for mips
Date: Tue, 18 Jan 2022 10:53:12 -0800
Message-Id: <20220118185312.579389-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 18:53:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94919

Use the same approach as librsvg to disable 64-bit atomics on platforms
which have 32-bit pointers or are otherwise not supported.

https://github.com/crossbeam-rs/crossbeam/blob/master/no_atomic.rs

https://doc.rust-lang.org/std/sync/atomic/#portability
"PowerPC and MIPS platforms with 32-bit pointers do not have AtomicU64
or AtomicI64 types."

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-pyruvate_1.1.2.bb       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
index 835cf9a93d..25e1e68a56 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -14,6 +14,12 @@ S = "${WORKDIR}/pyruvate-${PV}"
 
 inherit pypi setuptools3_rust
 
+# crossbeam-util -> std::sync::atomic AtomicI64, AtomicU64
+# not supported on mips/powerpc with 32-bit pointers
+# https://doc.rust-lang.org/std/sync/atomic/#portability
+RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
+RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
+
 SRC_URI += " \
     crate://crates.io/aho-corasick/0.7.18 \
     crate://crates.io/atty/0.2.14 \
-- 
2.30.2


