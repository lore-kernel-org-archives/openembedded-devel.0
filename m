Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.15905.1621809246740567904
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 May 2021 15:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EazW20WQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id b9so3574932ejc.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 May 2021 15:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ugPwOk/MwEcLlspr6FK8i7hrFl4Xc7lQ18x6ZsbXvyc=;
        b=EazW20WQUgHPkrHNIPkV0+nhSaXII9tZQxf6S2I8Ysc3dNguE/bzg885PCsLTwwoGN
         bz7N1gyXzHeln+Qz+OrHc+VmbbsNKiQE3/eqC17lG4WgZDa8+zsdhyM4rEFlgA9+mW9p
         Yl1ZIVylk2z+yvQhJAHvmngKxB3zIa9BjOSTKl/UImH34NBB3NQGT4I77TzdGsZSYu3U
         CNY7Jdz2C8dmM5Cm2g54zuvmm1EM+AlybXkjuAw0Oip0bMF7LBBmVD065rNxA2XTTHE/
         TX9HHT88xAVWBcMlQPJuu3jftqNxF5NzpEFD0fmBGXbFuQv3FKS1D5xNKffHZ49HNsKY
         7Scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ugPwOk/MwEcLlspr6FK8i7hrFl4Xc7lQ18x6ZsbXvyc=;
        b=hJkcq+fCcWqnv0HSZoGC4Emqy8pBwwJL5tf5p2xZZ3CRaSEu63LYi3k+UJVbLXALai
         NiR/AQiBlMuI6yFKF1opxRuAAqo1effjhfJu0wBbc1ImmoZPxx76T7Al6KsSlWz7hEoU
         RK6G03Pu3V5+gXHNr3W/GzX8QVyoohKoUjzDd/yvseyrrM6qhSAXuDXtsXE/hv+rf+a6
         JNIhZN5K86ExXDODJeB7ASQX/tl2xXW55gTDxLKNHNfsq0KK6tGFC7nkN9JSgbxsHqFG
         rxARyLDWZut7QEcmIOY6bhGz4tHfoqjWB4x/YAO1jMZdDYNaka7vYky6Oz9hEg5Ros8b
         cBlA==
X-Gm-Message-State: AOAM533iZ2kUC7w/UA1IOKWe0N+u9i+nrZ8TVPLVgt/tB6GYNi6gwoXJ
	X7VeJ3sd5tNbYJdOmA3pk7vNnjyap48=
X-Google-Smtp-Source: ABdhPJz/pf5TW6a7N1rtrIVJ331F0fy0kc9eY66FDN5xPiz3wHkIvkldq71C5NsdEFSdG6S2hznhbw==
X-Received: by 2002:a17:906:3da9:: with SMTP id y9mr20120111ejh.303.1621809245408;
        Sun, 23 May 2021 15:34:05 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f1a3b826a24e63b238b2037.dip0.t-ipconnect.de. [2003:f0:7f1a:3b82:6a24:e63b:238b:2037])
        by smtp.gmail.com with ESMTPSA id t19sm8682032eds.4.2021.05.23.15.34.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 May 2021 15:34:04 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/7] flatbuffers: upgrade 1.12.0 -> 2.0.0
Date: Mon, 24 May 2021 00:33:51 +0200
Message-Id: <20210523223353.2576671-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210523223353.2576671-1-schnitzeltony@gmail.com>
References: <20210523223353.2576671-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{flatbuffers_1.12.0.bb => flatbuffers_2.0.0.bb}         | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_1.12.0.bb => flatbuffers_2.0.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
index bbc2a4a1d..f4f08012b 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
@@ -13,9 +13,9 @@ RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "6df40a2471737b27271bdd9b900ab5f3aec746c7"
-
+SRCREV = "a9a295fecf3fbd5a4f571f53b01f63202a3e2113"
 SRC_URI = "git://github.com/google/flatbuffers.git"
+S = "${WORKDIR}/git"
 
 CVE_CHECK_WHITELIST += "CVE-2020-35864"
 
@@ -31,8 +31,6 @@ EXTRA_OECMAKE += "\
 
 inherit cmake
 
-S = "${WORKDIR}/git"
-
 do_install_append() {
     install -d ${D}${PYTHON_SITEPACKAGES_DIR}
     cp -rf ${S}/python/flatbuffers ${D}${PYTHON_SITEPACKAGES_DIR}
-- 
2.31.1

