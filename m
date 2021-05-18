Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.9116.1621347303239310662
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 May 2021 07:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oQkj3ShX;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id t21so5163731plo.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 May 2021 07:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=tVl3TX5X8STj29Vuls1+ZPL4JGi/sP6b8EVDND7yb9c=;
        b=oQkj3ShXRqpmQdKX8597BAEoeX/Hndv/VFMmMnRd3t7hEmtlh336KFa871V5PlAWSd
         cu5ya/s8el7H+UfweOlCVpuBghYyNxcHqlC+AeZMYOXt3UMiFMHH456zEHguZx+kLvhl
         Cac+tVMXnu8RB4g+T2525Wm4MwaGG+MeZfuR4aiCWWs8gp0fsADWU68q6oeSV/qRpEEa
         Lno1DR3biSZ2gxgePL5mCBUizWRUGONEBLHHfsb8U51sKy+86WDOi4Bj9xNh3SK3dM9Q
         zBDpEOVWX9BFOxX5X5l/wjOFnOR/CbFW/czctxAO8UMZWtYT2xuvU99WFgVeFwSXM43U
         8ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=tVl3TX5X8STj29Vuls1+ZPL4JGi/sP6b8EVDND7yb9c=;
        b=XBzdEG+lOi5n0s83fEp9cZfSi41GxF4z7+PlWeSCOmY/vdB8PKB0SIQ89+qhPa0nru
         phmqVBj8o4W70l+Q9U/cjOzQpOsnAHp+H0ooKLItBphTUelbBGAoyyo6Kh4rkosqHscF
         hRlXjljWt8AAJJz2gqtCG3pjkdBJ7z30H4iS1J13+it/jWC101SUvLXC2eoZUfS1el7x
         t4HI2yDAoCFxb2K2Wy/tYUXN4EjhwkAmC8haH7kJHFQhFMFS3cNLJ9nrhSHAhHZO6A4f
         DU1QCbrd9la2Sa+nXWo1AysXCTomtY+jZDuZbMxT4mm3xn2oUhdFUsb1O06PARIHnn9B
         gucw==
X-Gm-Message-State: AOAM5339L6IWEOXxjoiLRssvD8qwtyJuX246io57ncpcjrQMDmmumPjr
	Goz53acMjODcShsSyvLcCrjQXc4nnXA=
X-Google-Smtp-Source: ABdhPJw9Egwg07HY5u9/MqtxfMo790YaydVo6EuIVv7BaktqvhHRZEPNBFG5rESEZgGue4XN/1iKhQ==
X-Received: by 2002:a17:903:189:b029:f1:d67a:5168 with SMTP id z9-20020a1709030189b02900f1d67a5168mr4848027plg.82.1621347302709;
        Tue, 18 May 2021 07:15:02 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7050:e80a:30c5:274])
        by smtp.gmail.com with ESMTPSA id f5sm2103563pjp.37.2021.05.18.07.15.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:15:02 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 3/6] nodejs: 12.20.1 -> 12.20.2
Date: Tue, 18 May 2021 07:14:54 -0700
Message-Id: <1ea5c51d98793937abde675b3701dfe90ab819d6.1621347202.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621347202.git.akuster808@gmail.com>
References: <cover.1621347202.git.akuster808@gmail.com>

From: Sean Nyekjaer <sean@geanix.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6322c63987b1422d5a8c5e30077780b38011c89d)
[12.x is LTS version]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nodejs/{nodejs_12.20.1.bb => nodejs_12.20.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.1.bb => nodejs_12.20.2.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
index 0673a3202d..6acc36b4fb 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "e00eee325d705b2bfa9929b7d061eb2315402d7e8548945eac9870bf84321853"
+SRC_URI[sha256sum] = "961ad600f0706c396390ebc7767fb01d5e3792a5022dc2e7774796756eec6d3c"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1

