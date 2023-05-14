Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911D2C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 03:57:53 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.61614.1684036670595070320
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 May 2023 20:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BicmGjGY;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1aad5245571so78872695ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 May 2023 20:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684036670; x=1686628670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tkjIq1EcUb+zUPFTWdr+Df/hFPmqN9eNGkXXSQ0jhGk=;
        b=BicmGjGYju7kDf9k+mecE/vFpsqVYtrElv19ZUkWRorYjJfLdcNftN4Xl6+QYu3sAZ
         BnrU2f/3GoYAciL4otHXBFbWyjoaFgn72MTMznLay0mYU8uJoCLLkRX5FDmovlX5MLQM
         oJ5xQRWrIILd65VZD2NJINPSU2WE84A7Z62KnRFm9to5bzqE/dpfcjTfM+/dUqOoCmK2
         cZvpj5rCVxBs7cO7ND66Vg4T0GmhrbLMxWoFotNAem9mzvnHCfMVv6KZH1HWELtKnKHy
         KHnS4YotPc8zwIjClrbK6YZ45U0buxwmQ/STn+cRXLG53O0jiWJ5zF8LEAqoh3tHck9e
         WCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684036670; x=1686628670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkjIq1EcUb+zUPFTWdr+Df/hFPmqN9eNGkXXSQ0jhGk=;
        b=QHZedPy3SHjPWIOrUgOpQHYLWL3mXn78HENRD20Nfd4YMx2gI6ZVRSI8r3VKni35di
         1EmirnXvrDlA5f316RMh7xFF4K4C7LBC6Minh+x25/bs7Lrurc9sE3+D7xSHregKvJ0x
         mCqhM9z0piMwlCI+QhSJ4LF9cmNS0w2RV3gAPGCEYLUGxvSVF848qt4d2KYedoOJ4R7K
         YKzJXH80bUn2xYmJORl3J7DZs3GyuJW/eWiJE2r95brwVKXGZslfcBSFZW648wa4AYup
         1oev+Ksn8kni24+/rveg9LEV/5WFqGYsX/CDRTTJMnnjmfx0WxPU7gVqEoXnKMrIBAz/
         gXmA==
X-Gm-Message-State: AC+VfDwwwehqaWgVpQtYbofApK+fxdqMBqkT8xcti5+wUk70BwqVDgzI
	3ixPwDZbc7pCBKM/1HC62lCwuJ6F+q3Q3w==
X-Google-Smtp-Source: ACHHUZ5/TL5QcXB8UJ6Yp+dYH9qh/Bjd6x/DuBTQ6r0NvC/r/+kwXO56oJQPRfYZpBQ5CO9kwXnamg==
X-Received: by 2002:a17:902:ab8f:b0:1ae:f37:c1a8 with SMTP id f15-20020a170902ab8f00b001ae0f37c1a8mr781522plr.40.1684036669582;
        Sat, 13 May 2023 20:57:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id f2-20020a170902ce8200b0019ef86c2574sm10564395plg.270.2023.05.13.20.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 20:57:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fftw: Remove hardcoded sysroot into binaries
Date: Sat, 13 May 2023 20:57:46 -0700
Message-Id: <20230514035746.1550853-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 03:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102563

FFTW_CC is added to image via version.o and its CC + CFLAGS however CC
in OE containes --syroot compiler option which encodes buildpaths into
binary, therefore remove this option from FFTW_CC in config.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/fftw/fftw_3.3.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
index cb45e2b91f..1fead4d029 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
@@ -55,6 +55,7 @@ do_configure() {
 do_compile() {
     for lib in fftw fftwl fftwf; do
         cd ${WORKDIR}/build-$lib
+        sed -i -e 's|${TOOLCHAIN_OPTIONS}||g' config.h
         autotools_do_compile
     done
 }
-- 
2.40.1


