Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web08.23550.1615135441114681936
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 08:44:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=SPQTR+FX;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.174, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f174.google.com with SMTP id h4so11945672ljl.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 08:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7phr8FoHQfEXzxpWTZ/sua9QZMigSFkWRErmJwkijPA=;
        b=SPQTR+FXW2pp0MqBgPSPj0NQG3Ku8A8WPkvIHIJD0N9nX5xJOw0yozerev5FbtsXCf
         OUUvweeGwPKVCn34qrYF/mwNHyf8tSh9k25p2yk8mbr4KfCYE9PKmMSrIWMnJ3VzmyfG
         aU1PkNzfIpw0yTqIoCj2eP2RvzLi3vBM3lz+8Bt/sZrbwmdYbintX4UTA08vRtVaDHNd
         rFuM+M+MfBZZcCUk7cz9zTvsVpuchN7Emp7ZHueZdYDMgvLVHiZh2B1IUTGCn7Ao2MLd
         DVqZSZ6fpvs/Bj1li83xM3/q0u4GAbZRH4veV9ximT7tVNz50OECxUeSOAInBH9bN+yI
         iXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7phr8FoHQfEXzxpWTZ/sua9QZMigSFkWRErmJwkijPA=;
        b=UuR2vTjWsOqkXuIkpJAkRzIabq9LWtadjrbY6OsIxF5oH2hrJS/LG5RFQfTUJdPdy6
         GU4cDy9BezDDYgVKnS7Ghc7yTPBUZTkxBjTeeNWRplNlsY6hAJvdO+frH7j9ZTnn8lPq
         QNpUvahLHM5sSXOTt1FAwGTemE1YdzpnBxpscoSeLPLVww2mprTI5ntUY73xlAAyHzAU
         X9JGMLQaNfiXwIHliP+Ac7wWeyTaubB8HlyjJZr36pcGIhQsp+yu0L6KfymEYwy5vF3v
         EObAcKlFe2s704S8b8GJuneCtUgSP4kt9Z3A3moU4jrni4xoTVCxULt61iZuO4bBzX4m
         NvVw==
X-Gm-Message-State: AOAM532qkTLT2He/KB9OClwRMPWFSH8zBMx2y6jBSgupZRTdFlKV8+v7
	PAKE8CmH9zICqsl6RQNmI0bqJH+8h+v5ce0R
X-Google-Smtp-Source: ABdhPJw7qeXYI2C5dyQRVdrzSU1UzDZRcSWVid8OWow39r3HfmO+p3Q8ETuKcXFJzbvqVTeh6Vtp+Q==
X-Received: by 2002:a2e:7619:: with SMTP id r25mr7889440ljc.408.1615135438743;
        Sun, 07 Mar 2021 08:43:58 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id i8sm556527lfc.115.2021.03.07.08.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 08:43:58 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-jsonpatch: update to 1.31
Date: Sun,  7 Mar 2021 17:43:56 +0100
Message-Id: <20210307164356.981140-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...thon3-jsonpatch_1.28.bb => python3-jsonpatch_1.31.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.28.bb => python3-jsonpatch_1.31.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb b/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
index cef20495b..aa3dc8360 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.28.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.31.bb
@@ -5,6 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e930adc932e4d36087dbbf0f22e1ded32185dfb20662f2e3dd848677a5295a14"
+SRC_URI[sha256sum] = "ae6f3686fc71b53a278a9fdeb91afdc0e523e2f8f8a82cb2f04af90413a8eacb"
 
-RDEPENDS_${PN} += "${PYTHON_PN}-json ${PYTHON_PN}-jsonpointer ${PYTHON_PN}-netclient ${PYTHON_PN}-stringold"
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-jsonpointer \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-stringold \
+"
-- 
2.25.1

