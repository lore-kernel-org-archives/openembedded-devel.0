Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.1435.1631345621283503128
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Sep 2021 00:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ecVq4CIi;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id j16so4018222pfc.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Sep 2021 00:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qJoUfD57hd8bGKE1oyLqOvGr/++y4lpBKJtxhA0ceYU=;
        b=ecVq4CIiJcVkli8YRkLXea82/nyCm37Y8TsnJoioMOHK7xVc5UQBG3ujBBIi7gCRAF
         FDEDWMNJEdDluXcByfibWB2JoT+uwvTa5nbNpp5RqM68iVL6PWCazo9glXnqyz5lnq5e
         do/wLP8S8H5lX2I03KLPQ54/DN/P5jFuLpafVXWsSljO6hLpZ9dp9TINf9wzhkJQxAMH
         MmxSZUNgA31jz5H20974CZZES+Gl0tEtt71Ucdxm5lwm3OtGzKVjtAHq+xN+qiuzK/lO
         /P9JR55hS1ktqOsY6JpnuYmR8d6i1wgn3UtO4XDX7hqee5MXtbQ85+LqNMDQqptQtp6D
         3U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qJoUfD57hd8bGKE1oyLqOvGr/++y4lpBKJtxhA0ceYU=;
        b=JS6Bx80y9HgPMUS1q645Ql0FJEafRnq3CcI1I3O5MrbC+8yx1xBxk8pTEQLkFawPk9
         FkJ4DF6AqGJLyvWBT757iOQK/bbpg79Geb3E4YMaYmEUC8/SkBn9psHu1icCMLZC4fVL
         q0YGHwgnlaCQXCDk82m8mBrXHMYi8UqLoMpg3axFrwIp1Rmyof6zlqPgF3GF2gVUNHnK
         Zfu59w28w02DHwcZvvCCqgiULw2+ad7ACr7XxBmTJRKTiwYDUcvt7o2EnuBT1757kIFo
         crSAupoi7P8ZZ/qCdmztysOdRSRBRWPAP9RhSTUEjj2uedTerXS7r9CZP+CQF4kv2qo+
         aVng==
X-Gm-Message-State: AOAM532T2XU03zJLqjm63UkJ0qM83HY87lu62kwEjOGPKr0iWRnGFoFo
	hUg0Y0C/sw5ija+fikLriM9QcDmbKZJl+g==
X-Google-Smtp-Source: ABdhPJwUEhgCMvrNFidIXwEeabMiyB0uEUEl2CIaRV2fy44NnWfbZJISKT+aLfO6o/wYsmmSIl58ig==
X-Received: by 2002:aa7:8746:0:b0:439:146b:ad10 with SMTP id g6-20020aa78746000000b00439146bad10mr1335567pfo.77.1631345620595;
        Sat, 11 Sep 2021 00:33:40 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1d09])
        by smtp.gmail.com with ESMTPSA id l10sm1078101pgn.22.2021.09.11.00.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 00:33:40 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] android-tools: Define SRCREV_FORMAT
Date: Sat, 11 Sep 2021 00:33:36 -0700
Message-Id: <20210911073336.2642654-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911073336.2642654-1-raj.khem@gmail.com>
References: <20210911073336.2642654-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since it uses multiple fetch URIs make it explicit to define SRCREV_FORMAT

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index cabaf0efb9..1195b7d9a3 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -19,6 +19,7 @@ SRCREV_libhardware = "be55eb1f4d840c82ffaf7c47460df17ff5bc4d9b"
 SRCREV_libselinux = "07e9e1339ad1ba608acfba9dce2d0f474b252feb"
 SRCREV_build = "16e987def3d7d8f7d30805eb95cef69e52a87dbc"
 
+SRCREV_FORMAT = "core_extras_libhardware_libselinux_build"
 SRC_URI = " \
     git://${ANDROID_MIRROR}/platform/system/core;name=core;protocol=https;nobranch=1;destsuffix=git/system/core \
     git://${ANDROID_MIRROR}/platform/system/extras;name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras \
-- 
2.33.0

