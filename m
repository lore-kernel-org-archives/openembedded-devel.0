Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web12.1222.1590197910646236356
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 May 2020 18:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lvBW7AR9;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id t7so5118054plr.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 May 2020 18:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=1ddeRNtMw9RG+ZqpOb04+3wMMNvC1AGt4ByRPXHThwk=;
        b=lvBW7AR95NdVNTRWISBPIQizcqD8RZH+73HtktTQcgcvuo/vuGuL1cuwUb8Yt7g5K4
         GlHXNzp8LVOHkn2aDSJgwMUJvE1mUgoAlSs/DYfBFIaWTrZ+7xW8pRHLDvRKHN+zYRTF
         brwf8tPt6pkt/Cvv8+3ldZoBUjDor0+dHwBgJFCky8e8LUUEZqDLW9q6OotGKJj8D1Dp
         c3Hcaz15XyQYtPniedfHs3fOBuNfCNQiYiGRTvKmEZoYXETz5rIudCcVGcmfVYydtd3c
         XQypkpVW/EjSNrnpvqshZU4u0d4QcPg33H683Ov+VXK1vNjM52mAsspTLGwZLh9kVJLM
         TIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=1ddeRNtMw9RG+ZqpOb04+3wMMNvC1AGt4ByRPXHThwk=;
        b=rl8/dk8Stqqo8j5Iux0LmrNEG14xmF6G5jytF6ATyySG61UyKzXyUyK7uaVlKUAy+W
         DJGDfdpBYwOADHOYucQ+Z2AebsA5KcJ/0ry2IH1kesP25ycpmwbp9bQI3UpIubGotYqD
         aDGUCanatECCGlqRiTK6eC1oRxKhYTsFlnK/YrjdY4+YUhba6Ca+JGye00u1mSHI2Rcg
         iZI5xAwiw3qRYiA/tt8ntuUGFzjJjKuI8Jb+buf3D17F3Izgsa/sMDt/qJrA5I8WnHV2
         tqo5HZjR1XfCcSBw8XfVOS4DjZ+tGd9xCUIitiyykOby1Ppco6igQiN1W5KqJdXHLT9m
         jQFA==
X-Gm-Message-State: AOAM532bNytxTCrESG/w0LKlzzKa4u7wP40pr6OfkQcZe43kJMApwmO+
	PhmwyrQIeuEMsa196qXUCh2/LMK+
X-Google-Smtp-Source: ABdhPJyAdJdyDc8J7Ay+TY/gbQ6RJsS4qROMDj8MzNNnR/5VPHiFizIRR3EwF1xcX2PV8BWxmyXNog==
X-Received: by 2002:a17:902:b289:: with SMTP id u9mr17801365plr.138.1590197909833;
        Fri, 22 May 2020 18:38:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from localhost.localdomain (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id y5sm8000463pjp.27.2020.05.22.18.38.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 18:38:29 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [master][dunfell][PATCH] tremor: update SRC_URI as project moved to gitlab
Date: Sat, 23 May 2020 01:38:27 +0000
Message-Id: <20200523013827.3218-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

It appears Xiph.Org is not on gitlab
https://gitlab.xiph.org/xiph

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index 28bb5d924..6abf6080b 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db1b7a668b2a6f47b2af88fb008ad555 \
                     file://os.h;beginline=3;endline=14;md5=5c0af5e1bedef3ce8178c89f48cd6f1f"
 DEPENDS = "libogg"
 
-SRC_URI = "git://git.xiph.org/tremor.git;protocol=https \
+SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https \
            file://obsolete_automake_macros.patch;striplevel=0 \
            file://tremor-arm-thumb2.patch \
 "
-- 
2.17.1

