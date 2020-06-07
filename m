Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.1351.1591500307249233458
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L1EAfQTd;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id t16so5277520plo.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=85va3vwGPaIA5ejl2bzM9V/8zzZzGKPUMv7AIjCOtBw=;
        b=L1EAfQTdIJPVDjPjS8hpkadKq3cI0PzOe/QsxO1tDNul3JuaUObDZS7nOaZOfDxg3D
         7BCC4BOPdsQzVNnZSfQyrHkN6Y5VxDogjPSHgY6++/ZRV9LpUluFx+axWKJqhH28/bXA
         N636d97urI5DFAD/6+NBa1+EcenDPpQDwUhH5goJ5V18w+/nErMiO6LKy0esObgfCJ3O
         sIrSUCv4UQJgK5kdjC3VdygbOIYYz3L77xTypt4z78OC/KNOcuXhPtFCWs9jQjCdNUKh
         XMNqx3TfEzfzswS7Dyya0ajKsMnTMm4KHq/0AR/46Ru67DPpcJsR/X1IheD1GsAEIRJg
         68fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=85va3vwGPaIA5ejl2bzM9V/8zzZzGKPUMv7AIjCOtBw=;
        b=FkVOKvoqut9i54KCSf4BdZnIb2+3COgoZGfSHXwHJW4t3uWbFryDutRsJM972cM61b
         oF3J+CUCuRXtGSf3txY31iHkFX2XO8H+Ps1vlib898ht4kehiz58SCFNAe2mrme5cS2C
         mKcUhNIPgY1PZZkHANnaQ779XSEoJPBOkRLdxv/pWhE+nvh0uH8LoDbLZ4eYklBAbbGg
         MAnOmnKJU7vxc0i1EjHWFWFF+mP4vd1JY7w1wYWZGHx+hD2cDftgEAXE2SrxedcKM6mj
         TsIKC5xKMq/gWrB2SBLKqp9sPnPQVzKQk9cjWfvH04gIBxKABJvQi49ytlIzWuFt/toS
         I9lQ==
X-Gm-Message-State: AOAM530w/OvhtFfLhLp2C85YoKp/5nJYEPQ05vUUXcntNJUc5Tnn5Vl4
	6+L6UOum5vEZjTTSbuVzvD3NhrcQ
X-Google-Smtp-Source: ABdhPJwJSmVcnLJWAcbrGVMBHPZS1b87SoP6YnCBstfrn/BsKmAveupAPfWslveTiJaukNorOTSIYQ==
X-Received: by 2002:a17:902:b686:: with SMTP id c6mr14176017pls.303.1591500306618;
        Sat, 06 Jun 2020 20:25:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.25.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:25:05 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 23/26] proftpd: Fix typo for SRC_URI[md5sum]
Date: Sat,  6 Jun 2020 20:24:33 -0700
Message-Id: <13c2bd53bb952da06bf920f4a6580fdc639f9dd5.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5caca0f7bdefd28b9ecc446aea4177e2e297aa20)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
index d5bbdd3745..1e4697a633 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.6.bb
@@ -13,7 +13,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://build_fixup.patch \
            file://proftpd.service \
            "
-iSRC_URI[md5sum] = "13270911c42aac842435f18205546a1b"
+SRC_URI[md5sum] = "13270911c42aac842435f18205546a1b"
 SRC_URI[sha256sum] = "91ef74b143495d5ff97c4d4770c6804072a8c8eb1ad1ecc8cc541b40e152ecaf"
 
 inherit autotools-brokensep useradd update-rc.d systemd multilib_script
-- 
2.17.1

