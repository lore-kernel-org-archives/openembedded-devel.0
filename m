Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.1333.1591500288073246267
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j5KhB86p;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id g12so5277948pll.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Nvrxo+2B3PDM8ZduBIUpLaV5wc6UPaY5e9aZQrgNl1g=;
        b=j5KhB86p/EbsKWm1KL0GiXwORO1QCSz38J0A4JkSj1Y6PjCxsxMmyB4CxK9m7op8hI
         Inmq7FxSFF98iU4wxrHYHwdKeMlwwx6acKcw7fcuUR/3fJHc1ygdSXFg/FiusPuWrU6Z
         /4LRw/Eptu223ZYSitZXMJa95NXP243eeFv7s5UNMlhUdLaYLOZ58hr2Go6V9UYkNJU7
         cRc2c1YHe2Wys/HbsEp4pDn2ig2Q3GAQfC2m8XKw523cQeqpDjiEKZ0l3UeyE/ya2c3v
         HCVnCY6Ey8voluz4QtP16Wy9eAlwEb3PnJ1G+SQVYA4E8sQaW5FRffujF6fpVE/XgbqG
         L6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Nvrxo+2B3PDM8ZduBIUpLaV5wc6UPaY5e9aZQrgNl1g=;
        b=hAv+G0472fBmAxOMmIfi4wQA+pMJlQEiZd5aL+xxQCGRUwZOELdZdMJijO/bdBcBxV
         OLDkqXonWUc75TxeE3RWJzxtCJKBYpkwc0ed2IOWUHnUw9W7ogOkAgd7lIFEWL/Ltn2/
         bAPtgIlbZvGLh3d7LL/enGe0/MrgmMH9dSvXGbYIMtzWoJ3wA5qiTvwqVVFFENuGHUJz
         koO8guTik6A0xmzR3Q7fbNx3x0L3eJ0xVZc0eJ2d05mPtNpy155DEe1D+uhW1u2/PaUB
         UtBbuMzdFx/advlFQiiVlfUWxDBefftdMEwemHo/RsSLUIcOwCfB025ZYPtne5bxov0K
         Ghdg==
X-Gm-Message-State: AOAM530eHS+Q5Hkqi2QDIj7ZXR26VVIGCp8JlBveY+BglQaYp6jRNtoF
	5SHOKw2JCje3UFJjsvQmxEBkW5d8
X-Google-Smtp-Source: ABdhPJxjQqyu3S4OywXL4tQwfcLNpzmtIsWS2fyJEYBVJo8GfFta14pFoQpVWiXA6N5tpxBjQWvWFw==
X-Received: by 2002:a17:902:b706:: with SMTP id d6mr16200663pls.304.1591500287474;
        Sat, 06 Jun 2020 20:24:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.24.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:24:47 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 06/26] libgphoto2: upgrade 2.5.24 -> 2.5.25
Date: Sat,  6 Jun 2020 20:24:16 -0700
Message-Id: <91b3b6943b95c2a77c406eb87a1a5d8734af84a6.1591500139.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cf47180e012fe6738e2a00057961a23a2810a0a0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../gphoto2/{libgphoto2_2.5.24.bb => libgphoto2_2.5.25.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.24.bb => libgphoto2_2.5.25.bb} (91%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.24.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
similarity index 91%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.24.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
index 9d9b0c78c8..8daf737a5e 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.24.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.25.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
 "
 
-SRC_URI[libgphoto2.md5sum] = "063632d839b71698e99da0ccd19bc9f6"
-SRC_URI[libgphoto2.sha256sum] = "fd3c578769f0fa389c1e68120f224bd98477aa3d82d16b82746c1266c0d4fb31"
+SRC_URI[libgphoto2.md5sum] = "39999aa4bdd3bf849b5716153c659405"
+SRC_URI[libgphoto2.sha256sum] = "7c0e98f438c2b128186afe16ce7833a12fa36f87d01467e837b9d27e7a167f3a"
 
 inherit autotools pkgconfig gettext lib_package
 
-- 
2.17.1

