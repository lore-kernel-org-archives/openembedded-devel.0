Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web09.872.1631984269668747580
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Sep 2021 09:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QLURjBbJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so12230029pjr.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Sep 2021 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=lMDlr1570k78MokSSBSbpBuG+7TyVMVjq4qVtUvy2Aw=;
        b=QLURjBbJN653gwBmm1rcHkQt+l18rwNIQXgncPYBs9Cqikzg5mTiQl/LsVZdlkQ1v7
         exiKw+23G73asCiRr9cUf04j6EI2tWpQpe21vy/gxs2rA72uDwlXCN2/BH1dRMtAdVgm
         X0gqt29EukiLzMS8GhubpcQg5mz52NbjbU0G8NDW/OIlyg4aMa1CxTjFzcdfwkDK99fH
         EPOZz3Pe7ojdO9dgMSzS6x0NEEEqYdyTF8ghJvUTu5JginrW9Jrc0WeoSHqanflRnwXT
         diTa/TsBwObr7OqzF60necGsphI45u0iK8KpoKcsS3JqinAUxZ8xp+4o5PSYHrq2G39b
         MpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lMDlr1570k78MokSSBSbpBuG+7TyVMVjq4qVtUvy2Aw=;
        b=GZbAeZxM5wTwFei3NUphci4WBNlPesXyuZuiaP3vNDqKBviIEY+LZmSLRlaDO2J+lA
         ZVcURruxzB/qLvpHlSwp85glzxlQW2WCKu1QPQACuDBT6QMr31HRVC3vuMEtrJao9Ldk
         Nu3v6s9zcnkuxp5djOqEMODJi+ueIQMlzEjiZHQW1s4X00EWMdoHITMCvcYcZZX3Hd+a
         UoAf1PiMJMwVHSLHuOoNDjvDYRynCv0ZZ1jnhP42kotQS7RjeUcDSTpHLp+/JuaH3ua5
         DTtwcx47lz1i/moqg9TfpozHx8NeinxYtIbjgm3n0P0Pb/iQFyDpr5oCa4iF4JnMpMfL
         nDUQ==
X-Gm-Message-State: AOAM532wPSzWXpMhUI/M8TOO2zCHcDrBmFiCmDpg613QcTYWOXYQFnqD
	SmPrDQ87GqquPU1MM6KHYbteVPJrHc8=
X-Google-Smtp-Source: ABdhPJzh3msBRHA1MaZQTGzWyT+AVimrEiRPUXBIDZBmjBfA9WZnz+RjveZIeI0VWEQIri9I0HsYyA==
X-Received: by 2002:a17:902:b694:b0:138:a031:610d with SMTP id c20-20020a170902b69400b00138a031610dmr15263405pls.36.1631984268907;
        Sat, 18 Sep 2021 09:57:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:f923:d379:e6c9:abf7])
        by smtp.gmail.com with ESMTPSA id ga24sm13485274pjb.41.2021.09.18.09.57.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 09:57:48 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 12/18] python3-geojson: set precise BSD license
Date: Sat, 18 Sep 2021 09:57:32 -0700
Message-Id: <20210918165738.2581429-12-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210918165738.2581429-1-akuster808@gmail.com>
References: <20210918165738.2581429-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"BSD" is ambiguous, use the precise licenses BSD-3-Clause

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
index 1a21230113..5c60673af4 100644
--- a/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geojson_2.5.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Python bindings and utilities for GeoJSON"
 HOMEPAGE = "https://pypi.org/project/geojson/"
-LICENSE = "BSD"
+LICENSE = "BSD-3-clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=f48972abe5cddee79e301574742ed745"
 
 SRC_URI[md5sum] = "14753ed28678828b1de73f68b04e2324"
-- 
2.25.1

