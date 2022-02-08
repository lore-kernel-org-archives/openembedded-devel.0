Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A462C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 06:11:04 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.7920.1644300663140170290
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 22:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X6TAe8sk;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id om7so2052561pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Feb 2022 22:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R/NBBtmKQQ/J4GwkPjQmjbaf5FupGh31U4AnnqmNc9I=;
        b=X6TAe8skQOLRwHAjHlFcyUt7SUsvMcFC9HaKr7MR+ynQmSj1Ju+eoAhvERiNKwv1ue
         8m+G4z5eCRRuJKvPGuedad0bM/ZybW2cj2XVgd/YDWb450U0F4m1yhX1PH8W5h5SZz1u
         f0T5ZyjIzMTYdY0CjeJXaksa9j/1SHQK6j4X57WBSlH5nyrKCV11+67jYWQAhOJh1Ow7
         hV24a0zjQt73l+VDmXTu2lQBM/MCdNUKbRCVVkn/742kTbohhM2t802dT+Yyi4e3pgSW
         H8nhk5WM5sBmk5VnGcrmFck4XEFMibdJo/dwoA7pCx2XLCj8NQDp09jL7LzR0xPqRXgU
         Bq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R/NBBtmKQQ/J4GwkPjQmjbaf5FupGh31U4AnnqmNc9I=;
        b=LtfCmO9A6XagiKneZfgwqpG/GCQf7VP92Xme9NspR/KBeDiAerf46AUA7A6tUuUXZB
         m08nGTUg7dmS8Sez9eapBTNAWWWs9JQIvSt7aptOsoHRGbwn40m9U/YOXFgi98mprmy4
         pkNNheMpQYGmoDuJxNqO4TVjeW1ZG/hmlmwdSAIb77ipzvc3H19bbTCsCAPpLbW4G3Vx
         SQsb5/lepmCcHlmJTl8CI8u0lu/Z/MVQ8gctJxGaZii/UexEd8EpjrKIGDCkv9z8Ue9q
         MzgKMZCy3VdXslkDxECv58AiOZdDcgvs6xY4lf3+RVgGTxB/aXvjjWEYmbZx7lX1/uHF
         m6NA==
X-Gm-Message-State: AOAM530iYrswG/itk73zlyMGTRMvi2eM8ERYqG4YuRBfLOVBA+9tmUi8
	z1GVbsRSne9OK0QEgxjM9PC5DfxU3QwQzw==
X-Google-Smtp-Source: 
 ABdhPJyi8A1miojlyD2ooLfLZc0WB4Zg9GurGxB929UriHZWMS2n5Fm86cOy9F8G1qKZZ7jD2+4KrA==
X-Received: by 2002:a17:903:234c:: with SMTP id
 c12mr3143911plh.55.1644300662253;
        Mon, 07 Feb 2022 22:11:02 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::fb6e])
        by smtp.gmail.com with ESMTPSA id
 p6sm1272137pfo.73.2022.02.07.22.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 22:11:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] gimp: Disable vector icons on x86 with clang
Date: Mon,  7 Feb 2022 22:10:59 -0800
Message-Id: <20220208061059.762064-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Feb 2022 06:11:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95259

It workarounds qemu crashes seen when building with clang

e.g.
| make[3]: *** [Makefile:2397: 24/gimp-controller.svg] Segmentation fault
| make[3]: *** Waiting for unfinished jobs....
| make[3]: *** [Makefile:2397: 24/gimp-color-space-perceptual.svg] Segmentation fault
| make[3]: *** [Makefile:2397: 24/gimp-controller-keyboard.svg] Segmentation fault
| make[3]: *** [Makefile:2397: 24/gimp-colormap.svg] Segmentation fault

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index a74e240ff6..68a7a923e2 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -53,6 +53,7 @@ EXTRA_OECONF = "--disable-python \
 
 EXTRA_OECONF:append:toolchain-clang:riscv32 = " --disable-vector-icons"
 EXTRA_OECONF:append:toolchain-clang:mips = " --disable-vector-icons"
+EXTRA_OECONF:append:toolchain-clang:x86 = " --disable-vector-icons"
 
 do_configure:append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-- 
2.35.1


