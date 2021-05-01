Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.14461.1619911849112070872
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 May 2021 16:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nMJspljo;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id u14-20020a17090a1f0eb029014e38011b09so1252702pja.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 May 2021 16:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=clRsfBmLVbAZyq5GnRniNrI8tkmVjBSgh5l4LCGiD7I=;
        b=nMJspljo8Ge7cMk5aD70SnnOr6geGjEhtcoad9wuOH7u9DtYAY45tBsd9RLL+rVdUW
         M1WCrs7CdZ6dnjT1cypgx7Cxw/G+ibDdJzwy9JpfbNSItgOC4nyeGSmcTUrqv9SXb/lx
         WqYaED5rotBXvoIS5Q9Rf+ErozAMCnbQRX9/ymQEJ3SNZCnKMb0dz8Gta/aUeWiSZMdf
         5wqDwEB84OqI8UHl3zNgM89xbC7Is3/yRxcajvpOoEPYGkhCj8fQPi3ZmnAS7YxxrDYB
         db2AcE7PfpVUFSpg7npA6C371zO50f1P3/CjGxV0zhfwk1INj95Qkf6LIYpAVUJDeG5M
         woSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=clRsfBmLVbAZyq5GnRniNrI8tkmVjBSgh5l4LCGiD7I=;
        b=BGcTaZLOb1XCgPxVBUbQnY3p7RVMAiE4H+kXfx30U3U+DOaPCXHHIs2JeawIy8lJgy
         TKJa9kIWuzP2B/TlddPowAbWySY8W/W2D12QWAn3kdkv0jWAvTppAxaXOTVwNacIh9pD
         GB1M+XfswFqNBvnXFPNmA2wQqkqkU1xpT5xa9MtInocv1qTtcDj5Is0x16ojBzrMrlUo
         ld9JI0knzPm3b7JdCaUl9Nf92uuQJOWan7pJOWlFeTl+zi4WdyHAfQM5X7zRvGI+0zqX
         rU60aKhNjGtAnztJfCkExFF+IZI7fV3achA+T4N/iG5lGxMefaPkEqfH8p+GsO+xxSBl
         anRg==
X-Gm-Message-State: AOAM532Vp2iPaRsXoIoxmcl+REtJx9dx0Aj0615QCVjsfkhcZzTnVKhJ
	K60AhPk0BCSHiqKeRL31BbvTJ+CaT1jSjw==
X-Google-Smtp-Source: ABdhPJyZ8/I7m+z/8boJDyomzhJvenkwnK1D87jJBazZ9fRx1rl7KnwQdgFx41u/+2pc5f0BwZL6MA==
X-Received: by 2002:a17:90a:2dcf:: with SMTP id q15mr22681706pjm.12.1619911848429;
        Sat, 01 May 2021 16:30:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8589:f92a:54a1:6475])
        by smtp.gmail.com with ESMTPSA id in16sm5665574pjb.14.2021.05.01.16.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 16:30:48 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] nodejs: 12.20.2 -> 12.21.0
Date: Sat,  1 May 2021 16:30:36 -0700
Message-Id: <20210501233036.11611-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501233036.11611-1-akuster808@gmail.com>
References: <20210501233036.11611-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Clément Péron <peron.clem@gmail.com>

Fixes :
 - CVE-2021-22883
 - CVE-2021-22884
 - CVE-2021-23840

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 02feb1d9324fba08c5d3055fa34bb6200ee91520)
[12.x LTS version]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../nodejs/{nodejs_12.20.2.bb => nodejs_12.21.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_12.20.2.bb => nodejs_12.21.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
index 6acc36b4fb..b9e3821776 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.21.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
 SRC_URI_append_class-target = " \
            file://0002-Using-native-binaries.patch \
            "
-SRC_URI[sha256sum] = "961ad600f0706c396390ebc7767fb01d5e3792a5022dc2e7774796756eec6d3c"
+SRC_URI[sha256sum] = "052f37ace6f569b513b5a1154b2a45d3c4d8b07d7d7c807b79f1566db61e979d"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.17.1

