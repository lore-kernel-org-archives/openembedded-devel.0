Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6F7C761AF
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:27:38 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.23801.1679426849097443416
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Mar 2023 12:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ECl16/ki;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id d13so16549237pjh.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 12:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679426848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqZKgw3/+ti6nGyCz5FIz92Nj0OiqvemV21gukXGzp0=;
        b=ECl16/ki9kjdOXBodLAVjosep+m/kDCYwbRSD9kIv6lgQ8LrnWX4v2wtRdD3kZapvl
         Lne6a+ScbudwXxq6pvBlC5Ky7Wp/yHGrgFdS1KSn+T/IwnJ34YXHR+J1urRzfk/FY4Bh
         aHcaz8QDtYyGFvA7Fjndm4N/eY74Z/g254UkcyklpUTzoCS+g8ggoeesz5u5vvZxtm4U
         NwsVx3lMsZsDz9N1fP4FM0xpLGjGRphi527fD1mIBKG0rKStVH6bqGqc0z7ss9V7ClAN
         oVdi/dHMXxdTZ281FgttvyQYLTlbavCIllpQA8e2pX5mfvEqv4MI+qR3H5CkTZZ+a0rl
         zHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679426848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqZKgw3/+ti6nGyCz5FIz92Nj0OiqvemV21gukXGzp0=;
        b=f6ShnB2m330JIzMPODlZm8U02+gmt0JdvGKNEpBMd86ladVG4w+t4BGVFFWLbOTQa1
         f0DRVawGet1tN8Wm2HvVD9cIiBuxToiuZtEdr1cvw6V6h7sIKnEqVGSF1/ACQgNhqOXa
         fQbiDYKRESk7dZ8cKuMzVvr0SxFX98MkagR7FpbI9l2CqTfsZUP040UPtbUoBPNsyZTd
         +7XFjiNC1ZsbHBbVxT/mkgbRvESlBnm1Ewt+GYkpevXUdUW8w9FfKCG3ig8bRpJWYXnG
         ynJlQJ4p5yvm/JOReTEcagxr3ZJczWeBBuR0L5kQnW7yOAbIZAT6FvuyNrkoW3z4rI3O
         yW5A==
X-Gm-Message-State: AO0yUKU37QpFK6ZSA0QQt3OiLc89XjSR2YXRhi7Mac+aoJef2jvd0m/+
	8IXf1EcT3DVz+S/keQKvSAoYHVh6eIC7VQ==
X-Google-Smtp-Source: AK7set8GzxFZpbMsLCW6hzLeuwZgPXb2pWgUK8R9M4EoYp8zqumRavUc0TNTaASoTqzG+Pwq3RX6eA==
X-Received: by 2002:a17:902:d2cc:b0:19d:2542:96a4 with SMTP id n12-20020a170902d2cc00b0019d254296a4mr340615plc.4.1679426847645;
        Tue, 21 Mar 2023 12:27:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::86bb])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902b58700b001992e74d058sm9114924pls.7.2023.03.21.12.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:27:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] packagegroup-meta-oe: Remove mongodb from rdep list of packagegroup
Date: Tue, 21 Mar 2023 12:27:20 -0700
Message-Id: <20230321192721.2290695-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Mar 2023 19:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101623

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bbappend           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
index 51197c27f3..c3d4cbc500 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ b/meta-oe/dynamic-layers/meta-python/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -3,10 +3,10 @@ RDEPENDS:packagegroup-meta-oe-devtools += "\
     rwmem \
     mongodb \
 "
-packagegroup-meta-oe-devtools:remove:riscv64 = "mongodb"
-packagegroup-meta-oe-devtools:remove:riscv32 = "mongodb"
-packagegroup-meta-oe-devtools:remove:mipsarch = "mongodb"
-packagegroup-meta-oe-devtools:remove:powerpc = "mongodb"
+RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv64 = "mongodb"
+RDEPENDS:packagegroup-meta-oe-devtools:remove:riscv32 = "mongodb"
+RDEPENDS:packagegroup-meta-oe-devtools:remove:mipsarch = "mongodb"
+RDEPENDS:packagegroup-meta-oe-devtools:remove:powerpc = "mongodb"
 
 RDEPENDS:packagegroup-meta-oe-connectivity += "\
     lirc \
-- 
2.40.0


