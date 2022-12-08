Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128D8C4708E
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 02:25:11 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.3377.1670466301344219245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 18:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rc79FAN3;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 140so170291pfz.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 18:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TbpAGKW+US1Lx/Fd+eGtarzKnE5RvdjyI19kr2I2Jfg=;
        b=Rc79FAN3rTnQGZoTg/YM9/nYIZ8Y02zWkvibNGG3jidIr3oPqfb/Ih2LZym+On3Aud
         YH3QMyETXnIJgCvzp9tjlEV34SZECy9A7mG1HYGmec0uujXCNxwWUCAut42dZ6kA0Ia1
         ziQz17YxW9ds7exAC2+cw6A4zenCHy0BrZMqioPu1WuXyc9wMtDE1yFerndCXpiJ683a
         qZ1hFqOikoFvzJpdEWVSroNZR4gnJ/6p+u07egpBZMU7wOrVzojtQf1DYkaT71ZIvZug
         XdsiNk3F6620b7j2lrmw61kzMXMhrkIj3Lew/yFgqnK/yfk0HVZe1C3FOKXarN3VDsXr
         AQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbpAGKW+US1Lx/Fd+eGtarzKnE5RvdjyI19kr2I2Jfg=;
        b=KJst7/tfnr3FPdnPwtQmPwkynp1oTdgyCqzvVKH1/1wV2bEIsVDVSz9vbh3AKPhRiH
         Fv/CaGyJijp+7CuFLu77yjq3uJh6oLSjvITYPB4N/JYeRYo4rFlyDGuyIRDRZIVyHy7i
         lk4QKV1+n8ueuoK3DW8VYyEv5X0Ran5howw+fNGjKWlRohWfQgc77PFGcTtPv3ftIvTg
         RtTjoylGznN/aBRNqsrKq4Ai5/ZOs03FVzlZncjOQYqQVBhOggC4vgEANKuCjZB1RbGQ
         rwe+FFRzAVw9Dc0H+ziXqUvDwxSGhhhQDIxm22RJCdfUTsTou6WeTpQJ1WIMueoyCJRl
         wTHg==
X-Gm-Message-State: ANoB5pnV0fCT0AamyohqDxg4llEH4F1pdfvyjBKQB6QSRdE4RoAzEJtG
	3xN7qRBwxRinQY2BmxTEZf9iuS/UO+U=
X-Google-Smtp-Source: AA0mqf6Ik38t9nwx2anIXupmupbfA8erg4XkTZF9TAXal1LiNB7glpWcA7sQelPrkzcL1clOOsI+Mg==
X-Received: by 2002:a62:18c8:0:b0:577:994c:d7ea with SMTP id 191-20020a6218c8000000b00577994cd7eamr920098pfy.3.1670466300502;
        Wed, 07 Dec 2022 18:25:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id a14-20020aa794ae000000b005774f19b41csm3501627pfl.88.2022.12.07.18.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 18:25:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] stressapptest: Upgrade to latest tip
Date: Wed,  7 Dec 2022 18:24:58 -0800
Message-Id: <20221208022458.2419447-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 02:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99984

Brings in support for mips along with other fixes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-benchmark/stressapptest/stressapptest_1.0.9.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
index d30ea5a01b..c8b9ca7cb9 100644
--- a/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
+++ b/meta-oe/recipes-benchmark/stressapptest/stressapptest_1.0.9.bb
@@ -9,7 +9,9 @@ SECTION = "benchmark"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ea9d559f985fb4834317d8ed6b9e58"
 
-SRCREV = "fb72e5e5f0879231f38e0e826a98a6ca2d1ca38e"
+SRCREV = "9146a8bfe3e3daefa95f7a61b75183e5fc64af2c"
+
+PV .= "+1.0.10git${SRCPV}"
 
 SRC_URI = "git://github.com/stressapptest/stressapptest;branch=master;protocol=https \
            file://libcplusplus-compat.patch \
-- 
2.38.1


