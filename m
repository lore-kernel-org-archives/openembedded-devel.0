Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.10715.1593562047734936960
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lYMiG8G8;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id cm21so871910pjb.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=s/1EC2Bfn9c/3C0MoXNZVwatBP+A3FuuJau0+f5oaxU=;
        b=lYMiG8G88H1Be8XtqmLYR7u1f7x9AypnsmNAdN6nk7N8+sNhVVn5L4u/Z0m5Bwp34v
         sYGh9/VUCB/TQBIu4L06rLh46U5PSBsR+2krvtObVZcaWhm+wIAqY5M8iYTURQcGykN6
         pKU7Nn0yFrow+HX3gy8r7pZOc4402W/Iad3NiVgGu2tosZQAl8lFM4pjz92R/lJcw01H
         EromulQ9NhN3uatIwA0aJUV6n/DB0y04okX+TFBA+HS9rEhaqpvnIA+Wf2JHBEM/KeuO
         5koYmL7GcIxB7jnS2EHQ8i+4dsmv4AeJYMWS9GrTw91eLlYT6YMdsXuPiMC99oGvGV44
         xeiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=s/1EC2Bfn9c/3C0MoXNZVwatBP+A3FuuJau0+f5oaxU=;
        b=PrKhhqvAwRJWMVQo51+dv0kd+SOWaUAAo41oO2juDMB5+cRhf0xYnPovMu/Iqni6/S
         sV1f5jAbXLBPelv9ScoZ88xu/SLg+A2u1pSeW0OrvAbljD6EULXMTa1sxNpJbSu928Vx
         4xWJxCDMtrZ/hOiuXaBt1vA+sFi/imyAEGsXIh6fdEck3iOcU3IfOZ6pe2zBM1ZgdYhI
         cGs1neQ6Ku2pIe9UiczJuT5TiOuRi52YB3FHb9UThgH/5l+e8btZBb5Sy9IdnJlYsumZ
         6yfR8JaSLEJxPYY3FxJxwjys8+JUi1l4dqlkcVfAfGmxQcf/oiBRX40FSPPVdoIzG9iU
         wP7w==
X-Gm-Message-State: AOAM532t6gBFBNutN0dS58Xlm6IaKEXfMTPkKzbSyWSSYFPsvkhyBmuT
	M8sH3BkoG7RJFZIGDm6nH/GyBLD4P2k=
X-Google-Smtp-Source: ABdhPJwqNo7xhwJxN//ntfjDm0SYSnhswmQenueX+8ig4P7JnFtUIHhOtwDKbxVjjrqh+DQH98sJZA==
X-Received: by 2002:a17:90a:5218:: with SMTP id v24mr22504371pjh.223.1593562046949;
        Tue, 30 Jun 2020 17:07:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:26 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 04/32] proj: upgrade 7.0.0 -> 7.0.1
Date: Tue, 30 Jun 2020 17:06:49 -0700
Message-Id: <08f527266df7b8b9e8b6c666d7ef24374ddfee34.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

-Added md5 verification.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit adedd567be1b10f725b5fcd55cb61af856fb3316)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-navigation/proj/{proj_7.0.0.bb => proj_7.0.1.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/proj/{proj_7.0.0.bb => proj_7.0.1.bb} (75%)

diff --git a/meta-oe/recipes-navigation/proj/proj_7.0.0.bb b/meta-oe/recipes-navigation/proj/proj_7.0.1.bb
similarity index 75%
rename from meta-oe/recipes-navigation/proj/proj_7.0.0.bb
rename to meta-oe/recipes-navigation/proj/proj_7.0.1.bb
index 44674244ef..2cfaa7121b 100644
--- a/meta-oe/recipes-navigation/proj/proj_7.0.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_7.0.1.bb
@@ -6,7 +6,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d9aaec5fa0cd734341e8c4dc91b608"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "ee0e14c1bd2f9429b1a28999240304c0342ed739ebaea3d4ff44c585b1097be8"
+
+SRC_URI[md5sum] = "5ba7536b579a6c9e0ad822dbdd455985"
+SRC_URI[sha256sum] = "a7026d39c9c80d51565cfc4b33d22631c11e491004e19020b3ff5a0791e1779f"
 
 DEPENDS = "sqlite3 sqlite3-native tiff"
 
-- 
2.17.1

