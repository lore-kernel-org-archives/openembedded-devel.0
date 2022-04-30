Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF58C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 14:36:59 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.23039.1651329415064408871
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 07:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pVLpsMUY;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id i62so8582920pgd.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3kA1W5bLIoAurmTT2O8KTsSM1DOxIdEhLVcIci8GVs0=;
        b=pVLpsMUYlVClaLdf0YD6K5mAd+0tQ2itjEkE0DsMkW7w0POfqiJNpEC22ZTpcfG031
         4/lmVnRqNYIsJLjJbcHVbw6GO5fugg3/aKNV7sca5RpUebgAelBFwyAVVxhhbkTsA121
         bFmM2btVpmvOxwZ9kiFuN/q5AQFhQWWuOtQo0NpbYN3rXAIqEh48wcv4q3+bpmLZ+tAV
         L+Os4Yotmi2nJUeVWEKy5bpthZJ66kUKIJSvBSruUosH4bd1tU1ikw2q/JEPCB9/72HI
         HHDCii/I4Lysq12lSmxAHi5KTCMlpMBYjYUrqnGjaeBkngY+Yv1uEpzLiejpZPV0HZk0
         myDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3kA1W5bLIoAurmTT2O8KTsSM1DOxIdEhLVcIci8GVs0=;
        b=Ffj+52aXGI1i4ezkfAZbiQur+MpBNwLWNiWmPM+2GF4WfImpBKMIZ4ZgRX6ESSMI9i
         Wauz/ww1Y/Dbtcy/G9sd1p9HbRtv7YxAII9LH6ipxsHYNNfpwXdPHudTp5G3Wmm3z05k
         /BE6GrrfpHoBlJjPL6gJNmQ3OXnPkalhuSV+fUEUeAcyoo4thsEE07TyHbLTHlP+5Ms4
         n67u0UTACkpNWjSQiY9RIkfmVOn20V5EVf8+E70PP5HIcZQbKa7KlD/uQjFQFGtRqzBS
         3QG1W5EEH/fRfXiLjpvvZIf/rOlWwtLMNySMHA35C0Snoz0VNfOO3VlahWSIdRrtBp/o
         gTSQ==
X-Gm-Message-State: AOAM5337h/XiTM5ogwLNBgqnuu8OMPeBWnbQUxCIKYM1X8lgqjcV+QNF
	keH2ICTUFWqfR/CkZ6uE6+HX170+HDu0aw==
X-Google-Smtp-Source: 
 ABdhPJxpVe3pHyPgy0KHFwGc4VG8HaXbYPKOVXfcGW7bDrh4uVRZqy11Ks3arzQH4LVonn+PKrI5ZA==
X-Received: by 2002:a63:6c0a:0:b0:3ab:8716:3d04 with SMTP id
 h10-20020a636c0a000000b003ab87163d04mr3258075pgc.507.1651329414146;
        Sat, 30 Apr 2022 07:36:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 h9-20020a62b409000000b0050dc7628180sm1652655pfn.90.2022.04.30.07.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 07:36:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcereal: Enable for ppc64
Date: Sat, 30 Apr 2022 07:36:51 -0700
Message-Id: <20220430143651.1077619-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 14:36:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96865

The error no longer observed with latest clang 14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index fc4fad708a..a9e9bc5a87 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -45,6 +45,5 @@ RDEPENDS:${PN}-dev = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
-#it needs to work with CXXFLAGS += " -mlong-double-64" but ppc64 only supports 128bit long double
-COMPATIBLE_HOST:powerpc64le = "null"
+#it needs to work with CXXFLAGS += " -mlong-double-64" but ppc only supports 128bit long double
 COMPATIBLE_HOST:powerpc = "null"
-- 
2.36.0


