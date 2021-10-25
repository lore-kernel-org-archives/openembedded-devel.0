Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43BFC433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 17:31:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.100.1635183077429636887
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 10:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kk4WOZug;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id s24so4429320plp.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 10:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cjzjdrzf5bbghaQcAXincQFl7oYtjr/QUfvZKlzJJ1w=;
        b=kk4WOZuggkicfkQS3ln3MLSuclxfGW5FBO5JTSSrSIf4LZHiGB5ehCP+VPh9VYsDlK
         yEWsWZ6eNuM0dxyAF6R9hEj4t5cci5sx0GXZ8iEwFC8XYjWAtupzeeeMTqG0Fla8tqIG
         vci9bjS8Qan+rm5xHfiHuyz9VzvHzdYwyo3vybUf2mKWKykXf27IzINcFjv1AEAt8RW6
         Kw6qptksih04gNs5RY9FHWxbNrjeTMsy06mSGpdq2uMWg81l23Xx3qSbmclBTAZhU4MI
         fQq3ztgMdN6RUFr4zroNNy3lyEfWVRTSQ1m70iZYZ4tCjNtqsGsiHKSaQZtyJ9YFHaZ4
         mfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cjzjdrzf5bbghaQcAXincQFl7oYtjr/QUfvZKlzJJ1w=;
        b=h+qB8cxcyc3mBl0ZcV3jDVIZuH7iXyWdOa6jSRrPlBcbF/GapHvIP4CN49/2grBnGV
         FJ11hCYwLVleQPg/siS2+Ij15oigbhocywwN2S6ovDqZUKV//lbSkkqjO66HeMciTmQg
         aDCHkN9BNIzeyRN8WgWZEj5etgG2DZlBgZ/nfOKJru2PJtZU3hjgh5hIhngaK1fWBsiW
         dDX+n9dps+wJRKZ5sc5OmpQtEgkwrxRSOAZ1f+1TFjjINrSbuZzV6oK38mUbkz5o7scV
         YcmUMFO7sN/M4rCiDmABN2Xlh/VlBVRs8TsG50vkympQBc0C/AyHkwFlRBUkToeohlVL
         FJkg==
X-Gm-Message-State: AOAM530ioPd2vhGP8vYD5iGKob9/3S7GIftfW9SnDiRMVLH7EH0JtzEQ
	gRH1wuahw8fYxyHbSud/tBwgrkvoA5c=
X-Google-Smtp-Source: 
 ABdhPJwaoCttv8ltC3+VeO15IB1cYpK7fBl2fXqyDqp4E1ZBAQTmhjZEZw1+yBlHIV6OKFBemQSD3Q==
X-Received: by 2002:a17:902:7ec2:b0:13d:b563:c39 with SMTP id
 p2-20020a1709027ec200b0013db5630c39mr17627106plb.14.1635183076584;
        Mon, 25 Oct 2021 10:31:16 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 p16sm17038291pgd.78.2021.10.25.10.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 10:31:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mozjs: Update to 91.2.0
Date: Mon, 25 Oct 2021 10:31:14 -0700
Message-Id: <20211025173114.1096811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 17:31:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93573

This has bunch of security fixes
https://www.mozilla.org/en-US/security/advisories/mfsa2021-45/

No need to disable jit explicitly for rv32, it works ok without it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mozjs/{mozjs_91.1.0.bb => mozjs_91.2.0.bb}                 | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/{mozjs_91.1.0.bb => mozjs_91.2.0.bb} (95%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.2.0.bb
similarity index 95%
rename from meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.2.0.bb
index ff0d7bd6ab..45f0145313 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_91.2.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.patch \
            file://riscv32.patch \
            "
-SRC_URI[sha256sum] = "3b913d6a52c95a8986123c98543f1273812a2d59f2891b4b1c604e35f4580766"
+SRC_URI[sha256sum] = "3ef3cfd321d0c2c80ee1b41b8baf7a1ea4daf93c29e1377274933440ff5e42c3"
 
 S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 
@@ -37,7 +37,6 @@ export RUSTFLAGS
 JIT ?= ""
 
 JIT:mipsarch = "--disable-jit"
-JIT:riscv32 = "--disable-jit"
 
 do_configure() {
     cd ${B}
-- 
2.33.1


