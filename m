Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E32C4708D
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.21957.1649623482059173682
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Mbf0OoFE;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.176, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f176.google.com with SMTP id r18so2176926ljp.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKufLjvFNWLwX0Tm7bp49dZ8MFl8qYrlmcMPkt1fvog=;
        b=Mbf0OoFEQjovQfEJr8fZt2VteVjYZddnJ2yf4lOmIfGc6WxxTWcyFBhRVlXrLgpCuL
         AY8196MExzai1SY9ucWhcIVXno3m76F4i0R+1AAaaXvZJRYNjhyiO5X4qb/xJixfXI6V
         OlVvpR7wdGz19FBUwOe6NUrePI+Ad8tX/rZP5AHZ8fDv1/oO1ziKaFOj7MlJvQwlW9NY
         PmxHtiX8QJxm8Oxe5W0Dml4H9aMqgNiWVvFszMSBfngD7BKj5Ho3s2YJBMBVH4RGk7a0
         lojPQVML5mN9yW1NLIHjei/JaDFnSwoY4ir7w64bYDUKsypEcBb9WvFUanbL7/jWDaLa
         3ESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tKufLjvFNWLwX0Tm7bp49dZ8MFl8qYrlmcMPkt1fvog=;
        b=8HqHdRsWtRzzH9hEVRc4KtlMOH07iV6l5D2gtjEOHQFR003DvELxNuobow+M2kKOLo
         s+T4QMUzl5TRi0DF5Onu3QG5Efr+PubgdkabZGFeVhu4xxokyUyVkkEzn/WobWX46XqK
         rQPgcvn+MSF/gQw+rulighZA0NnZN0s7f7cnZw3N4YBDF2WdNjbzX0Zztj0s5c7G9LIy
         MFzlaL3m7RYN1YiwceW8ssOB0yFk/mTnrFLtzbL2XtmHvQyNWxpUrGpK4nq/BGpV9Hn1
         V64w5aVC+byIZaTCdkjxN0gPsItyATTQnkVCIP3RFGLHUiQMq8+Up3zJYH5wP0YB8Prz
         zPog==
X-Gm-Message-State: AOAM531KcSS3Tp/MNIOnxFx2x3QEvsUpi1j5sYPRU9suYZHda0U8HiMX
	Ew/zEJcizN+cVCvvf2yskM4x+w+toE28/LxM
X-Google-Smtp-Source: 
 ABdhPJz0B6zeqfg8Az6t7gAf1vKS5eMgKrN7QoTJAgghX6dj41SDkNLseJBDey8kyxDSV4SuZIsyhQ==
X-Received: by 2002:a05:651c:1046:b0:24a:edc2:d107 with SMTP id
 x6-20020a05651c104600b0024aedc2d107mr18333197ljm.285.1649623479950;
        Sun, 10 Apr 2022 13:44:39 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 k9-20020a2ea289000000b0024afe447bc1sm2959246lja.128.2022.04.10.13.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:44:39 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-gcovr: update to 5.1
Date: Sun, 10 Apr 2022 22:44:38 +0200
Message-Id: <20220410204438.4047393-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96528

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python/{python3-gcovr_5.0.bb => python3-gcovr_5.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_5.0.bb => python3-gcovr_5.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb b/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-gcovr_5.0.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
index 27ae19813..995f3b779 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=08208c66520e8d69d5367483186d94ed"
 
 SRC_URI = "git://github.com/gcovr/gcovr.git;branch=master;protocol=https"
-SRCREV = "2b50284e8a6792b4ddcba14e2050c5c05f15deb6"
+SRCREV = "e71e883521b78122c49016eb4e510e6da06c6916"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


