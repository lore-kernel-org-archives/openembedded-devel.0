Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.1626.1632357677958098564
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Sep 2021 17:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gRGW8o3u;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id t11so2884576plq.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Sep 2021 17:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2n/esLInTGSph9ZLqTj2Pnc7STWhUimEejfDmOZXwSI=;
        b=gRGW8o3uumi8VFDu012iYl1fPdG3Xjvc5FH5ExL8CPfeOcFDAvrYGUdAiOxVTPtD0K
         iZnMosnh7mOH3LdRydEPhVcQZRLVpE5LDex5SZhdhlwt+ujETWTv2iGwiTk4ImdN0zAR
         E2gwuQuoXv44h0jYjGT3HvIsVsYgoXLO8x26Fu55nTvpym+n5G3ySNvzgWRSVu7i/vi/
         eVRbNzNqL4tlKfbooCfwLu2pXfjSAd+FpRYdes9I59+Z6Zt2/7FtuXoSdrb6gj4kuHvT
         FdfPPpn9ByncpJzpfiAuyBSF7vkrh6vjOtA7WV8MiRTPdYuxmE5LB77+oyaiu/N9wEhM
         BUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2n/esLInTGSph9ZLqTj2Pnc7STWhUimEejfDmOZXwSI=;
        b=gTSlPCuimKLUN8JQFiJMCjJNcMinFyrKV3oMhLt+FUe3nCTYsQ3LFPP8VPtlcQf1kd
         lLGvIBv1vHpyM3sAaACnrM/yBY09cN5B51+XL3oTOiR0kLf41S4Ylh1WN2vRuWq7ycbF
         u0pAh6yxh4ZZ4P5Am/CLQCe96wq4koPhEkoOttT/etCwZ+SPoWocTm4Dzgwh5jZqh3w9
         Ggwgw3nqTwB07rCYZWpFGta312DdhV3vSBWyrTn6gkeb+82Q77Yc6BJWKInGCtZCK4r5
         MkTKQpLJMRu3pOGPLppgbgd+8L0QvMtYu3mev0gCI4AMa2BkOgHcnIdp6J4HrYwWrO28
         rQIw==
X-Gm-Message-State: AOAM531aJkxKOKP4MgNthWW4L4BQpqceDsjk02ZjZVIZDsfzI/uBIVBT
	IzxxoMuSI2ZG0zi9EKqF4F63oboEC1Bk2A==
X-Google-Smtp-Source: ABdhPJyUqNpqXoVP/BLYcojaj6xKQhs9I6qj7t5LyiihpRJMF4QNf3csypIsnvwCAvWiX1Y++sYIbA==
X-Received: by 2002:a17:90a:588f:: with SMTP id j15mr14670211pji.177.1632357677280;
        Wed, 22 Sep 2021 17:41:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::728f])
        by smtp.gmail.com with ESMTPSA id k14sm4307237pgp.27.2021.09.22.17.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 17:41:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-systemd: Inherit pkgconfig
Date: Wed, 22 Sep 2021 17:41:14 -0700
Message-Id: <20210923004114.644166-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
FileNotFoundError: [Errno 2] No such file or directory: 'pkg-config'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-systemd_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
index 499fb37049..cbc9f44bc7 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "systemd-python"
 DEPENDS += "systemd (<=234)"
 RDEPENDS:${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging python3-syslog"
 REQUIRED_DISTRO_FEATURES = "systemd"
-inherit pypi features_check setuptools3
+inherit pypi features_check pkgconfig setuptools3
 
 SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
 SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
-- 
2.33.0

