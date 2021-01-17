Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.21190.1610905615322172144
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AHmWPyTl;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d4so7353270plh.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=w8dZ+jMjpQhkNwtIKvf+pUZ1nDAZkL35GZwieXW+qvQ=;
        b=AHmWPyTl/tsi3PBY9uQAAbnRbQeSG8ePLZydAls5WkjjFAXrK/oy01TMuAxl2ge+Tf
         ZUOAQ4bvNAuT/KdLrDqkPJWMCuOBiSdBztxsiELbheyhgb+FQz96Ten3B+912BjwL5RC
         r8wOo1nGxYpc639KygHE18L4UB8fxmLhuNLZvnv7XzuQLug4I6uMzK+qhog88R+yOeWS
         lVJ1GQ2rLbRg2lO14FzvtRppz+dct70sAhDaPwp2mqhZabJLAK+3epDtCuYkGuLmqBau
         jxGOwuz8HCNYu/1pJ5DLdvhjoENVxpOnyeEkmYYNGgi0kf2HaWAEgwiGEAUeBFqEw9fv
         3p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=w8dZ+jMjpQhkNwtIKvf+pUZ1nDAZkL35GZwieXW+qvQ=;
        b=kWld8+v0016JQ1XZ+ZQALLLPM1gwvv4kQ5cXvlRZpy6tYvNjAku4IbpXssr8e+raTH
         YAFbtlXEMsi9RitJ+BuEUQBCjg2EgC3wnSomZ5RZYFJMskALJnZJ/an4hxTmaqfV9bIF
         N2JskKcb2m7sAUwIWojJbVW4CoK/4qMmDY9q0p0NVwcO6S/bJYLUxnGPnonMl/HpLx46
         lbP20Jwt1kvxst6kQbsfVHcY8aaxVccMYdx9Mt7MHFHSFeCkbmznbrkY4bxsHhjCLAw6
         0MI0bxZqCipwTJUSdoADlSNU8ar45RQIca2ms7HSuGlGvCBht6c9wZezDzgPKPhWd19D
         HJVg==
X-Gm-Message-State: AOAM531N0CqdIJ4ewMSZMoPNt2GwWg5w4bobo6hGb1qG21uURAEdviec
	b6h9rMJXoqd8nibwWAl9L9EmFhO28sxLOA==
X-Google-Smtp-Source: ABdhPJwR75gvCq7rcswO/Dp1byjgsMwi4frH9/Gj3lvIykMdTeM3VcVuDti2tnOswBK/mGNnZCsROw==
X-Received: by 2002:a17:90a:6383:: with SMTP id f3mr21501181pjj.80.1610905614748;
        Sun, 17 Jan 2021 09:46:54 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:54 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 23/28] nodejs: Update to 12.19.0
Date: Sun, 17 Jan 2021 09:46:21 -0800
Message-Id: <1927ae1843677d5578caa6701db5354fef71abb3.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

This perhaps is last release in 12.x LTS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a10f894a8e7f800d2412fff8d47fb37d363fa322)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nodejs/{nodejs_12.18.3.bb => nodejs_12.19.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.18.3.bb => nodejs_12.19.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
index 7d8fd1db94..9d15586238 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.18.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.19.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "71158026579487422fd13cc2553b34cddb76519098aa6030faab52f88c6e0d0e"
+SRC_URI[sha256sum] = "3b671c45c493f96d7e018c15110cdbafa4478e5e5cfc9e6eec83cea9e6b551e1"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1

