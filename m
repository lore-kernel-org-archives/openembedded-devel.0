Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.2121.1632360310549392755
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 18:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TETv+ALc;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id w14so4273435pfu.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 18:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q5lmcq568BfKw8/VveR+vpKG5TilQH7faE/VZE3g03c=;
        b=TETv+ALcInVGL8UWzFil403q1BUoi+8cdgzuGyvBPypG/fXwwKXqD7/D9roIZI133a
         2/n1cwa4wEhZo5jOiS/V1Vnyhqo6xlRfn1Ph/S+omC24GKRp4/bO7a2q81p214doUzyL
         kA6BKmgNlq4OuB3BAVaLrVaUjiVKTdnui0n0a71zkG0qzV54f8HES+v3JROZGDFUMcwi
         1S0sYg1P9+8muIXODRngrNfOlF4Hy3THU6XLKTLkgeuUO+ib/NzwZsB7xw1gXPNKyohr
         /Mzs8mvOln/7zkPUA1jkXg3NxjEgewVr9SikQll/VSmIBj3GW4LcZDEHWF6OTiNkcVvj
         Lbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q5lmcq568BfKw8/VveR+vpKG5TilQH7faE/VZE3g03c=;
        b=FAw9WgWfy220BgX8aL4uu30qVysfR3zLeO+QaP8SsybluYb+Td3C2fEjH6PFXIyK6D
         tOoRKt6Q3CYVJWOZz6/iaK5kdEDHyg3wdGJ7QCEspuLGZF3nDM/mDkymw6cUTJfGA45W
         x2NTgxEWoV5RCCnHz+JijhTOKV66fDA0FSNFnhUJjIqZOIWf9JiPXZOxNQzGkw99JCMc
         gLDKLRCwKSNLU8PSHQeqC0QtQXDaGofyHV1D1CC1hJXI4qcPvS01DqPlyPeC3QTEIZK5
         TUZ9/to/csGiFoa3PnB2/EnP3tBifh7Rj7K9wOPMI0EFWNL/gD4IWhgau9nbd4Zoekj4
         kpyw==
X-Gm-Message-State: AOAM530+9xCxFT4p0YwJBpu2x5m0XFXGXfST1LCaMytIrbeNkjClRMzI
	MsHwHSzevttHzXtCe3UFopYegQBduw5S3Q==
X-Google-Smtp-Source: ABdhPJzgh4+xtLyczZTu1u25t3M36yPrTtiru8PmNPeHICz9QRNoBBtvQLHs/purDn6UjNuwfSqCpA==
X-Received: by 2002:aa7:8609:0:b0:44b:346a:7404 with SMTP id p9-20020aa78609000000b0044b346a7404mr1725169pfn.86.1632360309807;
        Wed, 22 Sep 2021 18:25:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id e8sm628747pfc.153.2021.09.22.18.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 18:25:09 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] libblockdev: Inherit pkgconfig
Date: Wed, 22 Sep 2021 18:25:04 -0700
Message-Id: <20210923012506.1693632-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
| checking for gobject-introspection... ../git/configure: line 13943: syntax error near unexpected token `gobject-introspection-1.0,,'
| ../git/configure: line 13943: `            PKG_CHECK_EXISTS(gobject-introspection-1.0,,'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
index 14168e6bb1..7325b26e35 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.26.bb
@@ -8,7 +8,7 @@ SECTION = "devel/lib"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c07cb499d259452f324bb90c3067d85c"
 
-inherit autotools gobject-introspection
+inherit autotools gobject-introspection pkgconfig
 
 SRC_URI = "git://github.com/storaged-project/libblockdev;branch=2.x-branch"
 SRCREV = "47ff12242c89e36a33259d18b7068b26c3bb1c64"
-- 
2.33.0

