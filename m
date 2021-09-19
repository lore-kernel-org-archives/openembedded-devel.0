Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.278.1632068923720433373
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Sep 2021 09:28:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JG1h5wa7;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: texier.pj2@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id b21-20020a1c8015000000b003049690d882so13761063wmd.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Sep 2021 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=bLGdbhGqEaHBkCrCy/s7Ph7dziyJj1Ot26BHSlidSC4=;
        b=JG1h5wa7wVYBYifhW2oY718ubRt5sRklE03KjlgZVBWcu3k2G1zTwc1Lg8JTPnEUux
         W/gQfsbACFryn/U1vI5c0bNe1yNOT51upRhCD2DXQahNhngliunfqQU4ey5UqpTbIf5G
         GNR+7x2MUY/Mk0/SrpkPTc+Ux41bA2R4D62rMM1JiXV/pn92rdUICaSivxJFmFrK0uBP
         3lhpnIO1wcUf51/Sv/EsN0qK2/r+OzgzR4KPCkX6/0pmEEtEfg3K16LhEpnX4W+M6FQo
         nNGfWbOl48zcq29lNm072Gp6LZUsmyHsr+du55076cPfBYPJby8xqu7wk847vXlF6TMT
         /YXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=bLGdbhGqEaHBkCrCy/s7Ph7dziyJj1Ot26BHSlidSC4=;
        b=raTK/ZHkt9MmrJ5bCIXr2+bBEP0dejOsyQ8FeTNN8SN63rfKzof7xGJbxaWhj6Vmqe
         Yn+r34/Xk+WFR08+yThjs3Nv/4pUaa8CAI3cONQYRCZfbaIWj1oh5moq773J289fweEP
         gUA63lWHEGFNL5p/Sfm+OjqH695EyOTpAPCrHlv6tkOV5FzZUnQoBBhVUfIqFLMzuRTZ
         j5nhvSdxl5nMi0bWxX4YfXLbSEcJ9TDxRiGO+t8HiYpUl3kVzwnsWY0Qi5un0t3y38X+
         tjkxpDVfysrO8xulO9M9WfkKzQaquxBGGzoU2oFNLAWwZ/+YEEcUu+7hPSks1pTZg1MW
         EMxw==
X-Gm-Message-State: AOAM532eXGT/M0H8/Dmh4iNZ5RN4RS4WqxwlzrHq82rnQr/i8Z9E1dzr
	WZYNjnLcsH748jxaLPPhuM4WEn1OTe0=
X-Google-Smtp-Source: ABdhPJw0vzS2vqV/xkSLt2O8iiVX3JxLSXi8r+zD80oEFIBcJc8vuPNIS3toQg9Fo/qVoxIUhReU9g==
X-Received: by 2002:a1c:7c0f:: with SMTP id x15mr19769469wmc.149.1632068921965;
        Sun, 19 Sep 2021 09:28:41 -0700 (PDT)
Return-Path: <texier.pj2@gmail.com>
Received: from menoah.home ([2a01:cb19:190:c500:eddc:38a4:9810:7b14])
        by smtp.gmail.com with ESMTPSA id c17sm16071288wrn.54.2021.09.19.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 09:28:41 -0700 (PDT)
From: "Pierre-Jean Texier" <texier.pj2@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Subject: [meta-oe][PATCH] cppzmq: upgrade 4.8.0 -> 4.8.1
Date: Sun, 19 Sep 2021 18:28:31 +0200
Message-Id: <20210919162831.2690-1-texier.pj2@gmail.com>
X-Mailer: git-send-email 2.17.1

See changelog https://github.com/zeromq/cppzmq/releases/tag/v4.8.1

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
---
 meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
index 270df6f0e..d234d0185 100644
--- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
+++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
 DEPENDS = "zeromq"
 
-SRCREV = "267d300d1c99381a0fbc7e060ae2899e51f5e425"
-PV = "4.8.0"
+SRCREV = "dd663fafd830466d34cba278c2cfd0f92eb67614"
+PV = "4.8.1"
 
 SRC_URI = "git://github.com/zeromq/cppzmq.git;branch=master"
 
-- 
2.17.1

