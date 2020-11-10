Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.32625.1605035478745562305
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2020 11:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QbGfGM2T;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id 62so11045923pgg.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2020 11:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnEHuUK8wHbRRO/yl87mnXz+WQhQIqqFLUfcpg+1tSc=;
        b=QbGfGM2TVzQGhJUYVOjLeaNNR7xtEBYv9eIkmghP4NpeypZWcMv0HNuartdRIgVuMb
         BapfGmywMYZnpAhA+k7uK4+c0XnoImePNgBTZMAH5r+VVFRon6otaPykkuJQKXmR/OTZ
         kzX9vpBo6J4Bq2FEeLKl7f+Zvrz3X+qeMKmskYFCNyuAeff+XK6itdIyqmCHILitTKuc
         g34jLmooKn5R1KJuiM2JVNLXGm1dQKOltmHeKZ/BHWtGWCgCaX4X/O2SDo+I6cCSfWFj
         ERtcoA6ywU1wLKaqtlaGAtBVpVlIqGuZJT2thBgqnE6cD4sHlydCh/gR86sUvtSkFNub
         TvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnEHuUK8wHbRRO/yl87mnXz+WQhQIqqFLUfcpg+1tSc=;
        b=nGEltTglVIX8NkvcpAyyZZ55MmOQd5YSi6fn543JACwYFWFIIM7Pg6q162BsYUOztm
         LGG1FoyrfNUrSVvQOxnofNxETO+5iWAigXrk7cTgT6+UT6hm+epjA5OAfvsF5SqVhUu0
         +rAYTcOSl0DSkqPMrTvj17vvW9IPWE1cyqVHEzkZ134sdrU0a1wTcVY2r9mRoQu4XPRC
         //u55kew/H7H3WIVD2tQUC/ri4FmS+1qwwn6QWg6LUgY6MiZtYZmXWJOGErv5493tPjE
         JAVATSRkckVPnrEXHuy86crbiayMlIaI/PrfbvnXIKrkPI5lfI51+v3XKaT0us34EzrB
         nCsQ==
X-Gm-Message-State: AOAM532au0eMUAdzMcanS7gWMyqPwMv5+sUUFWyIkXrWtpszOD/KDExP
	XSu4mo+BQDYMVI/roowzQiDQoFfjDxvOzA==
X-Google-Smtp-Source: ABdhPJxwqDVUx4MlvbrQGkadvSz1S3IuZE+wUNruAczeTAswEhB6gPzJ6UKwy6u5iqm0fcGUdKOt7A==
X-Received: by 2002:a63:2060:: with SMTP id r32mr2155950pgm.129.1605035477815;
        Tue, 10 Nov 2020 11:11:17 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id y16sm6646879pfl.144.2020.11.10.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 11:11:17 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-icu: Update to 2.6
Date: Tue, 10 Nov 2020 11:11:14 -0800
Message-Id: <20201110191114.2682229-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Among others, it supports latest ICU 68.x release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-icu_2.5.bb => python3-icu_2.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.5.bb => python3-icu_2.6.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.5.bb b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-icu_2.5.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.6.bb
index 5e8c8a3a02..58f5e563bf 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
 DEPENDS += "pkgconfig icu"
 
 PYPI_PACKAGE = "PyICU"
-SRC_URI[sha256sum] = "a120b68c53f769f37bfb70b7e84ca12c3f4ab1e4df43e87a02dff05ae472cdbc"
+SRC_URI[sha256sum] = "a9a5bf6833360f8f69e9375b91c1a7dd6e0c9157a42aee5bb7d6891804d96371"
 
 SRC_URI += "file://fix_host_include.patch"
 
-- 
2.29.2

