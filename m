Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B041C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 03:25:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.8215.1683689108243076839
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 20:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=i5VRMVLd;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1aaff9c93a5so46496095ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 20:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683689107; x=1686281107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyGPDjK7pDARIiOuUcePry7H9i29gUdST8yxvzOBT94=;
        b=i5VRMVLdwCeDljfmzrElSjn44d1lKyQzuj+ijSJg4akmItWUGCfkcdGkjsgIjfrcrU
         D0kH89Ib03TyB+l6mGCPNeveUKUMVOm9ITYpwSP1wAoHVYY8L9J8qz8xRDQ1jzJRjx4L
         BK63zyD5b+SzBwcSJFk0kO1qiIayqX2FqNLjVMk/lJayul3R4ZaJUaL5dHwSYDwblC8f
         5cUyMG82At+xC//aUKSUMsXk6liD6M5XFfrN1BUeCoCAqX2zwSE9mPJoMvsd6G1+qjBt
         ppQATjfAP1Wl/hOJyWDEh8SMtleFSYKZUlH0QplLRFYPaWifwwsO+M72I2armMoBC1J1
         gn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683689107; x=1686281107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyGPDjK7pDARIiOuUcePry7H9i29gUdST8yxvzOBT94=;
        b=FKFmhbJ4D04BoB1FIpvS1PODgn1ObDMuOPoA/bIPrRRiULkYq054NhtiENt1JnnlWv
         zLYL+EyNxhzVY/6t7rADpptVdwZVAbVXQPtUqdTLOrxEPfmCSQDTytEE7lbOKsbhbVYQ
         2AUnHdXKAag8d8t7yrOlE0bsEU62RBM/H5RH9b3cJFOTbClkzQfxs+shbiBNg69J/jD9
         q9kXATHl1rP2lpI/GtyI5qfGHSe28DN2OBWECO2A5Gfws2OnSLLl3HYN2qF9QZYuMWWT
         clFJjiEqnN+SNKJFlZl7HGYABjb+HYB6MFKV4fTTJmxkfzvMwJFJ4FTcfRtLsUKaNe3Z
         70nw==
X-Gm-Message-State: AC+VfDx9ZLjHpUnLCkexYOjSwiIidjtaYxvxRd8Q/O5xr0JNAeNC8Zii
	3BfWDngrvMSSfVWonz2DhJppfTzGX4X7iw==
X-Google-Smtp-Source: ACHHUZ7LyDSBupIbfoLiAXY/+yYIlP06cIkLkenbjDWHe/DluPYYGgUKb6Kjb0UIXO00Fh4zxnRsWQ==
X-Received: by 2002:a17:902:e845:b0:1ac:63ac:109d with SMTP id t5-20020a170902e84500b001ac63ac109dmr15190424plg.15.1683689107354;
        Tue, 09 May 2023 20:25:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id t24-20020a170902b21800b001a505f04a06sm2446100plr.190.2023.05.09.20.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 20:25:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] packagegroup-meta-oe: Remove minicoredumper-ptest for musl
Date: Tue,  9 May 2023 20:25:01 -0700
Message-Id: <20230510032504.457574-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510032504.457574-1-raj.khem@gmail.com>
References: <20230510032504.457574-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 03:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102523

They do not yet work on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 92b15137ba..21d07a1a26 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -989,6 +989,7 @@ RDEPENDS:packagegroup-meta-oe-ptest-packages:append:x86-64 = " mcelog-ptest"
 RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:riscv64 = "oprofile-ptest"
 RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:riscv32 = "oprofile-ptest"
 RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:arm = "numactl-ptest"
+RDEPENDS:packagegroup-meta-oe-ptest-packages:remove:libc-musl = "minicoredumper-ptest"
 
 
 RDEPENDS:packagegroup-meta-oe-fortran-packages = "\
-- 
2.40.1


