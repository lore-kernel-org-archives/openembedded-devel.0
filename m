Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.15173.1623574073577885295
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jun 2021 01:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PWbM8UHv;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id w21so42321193edv.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jun 2021 01:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cKb+7yY8AAtnKsnDhbrJQ+GCyMFPBf4IZInu6V1fjgY=;
        b=PWbM8UHv2+hzEOCbSXH+FRzpr9mFawUeTZEXiOKuJXsRFwj4w0JsUF5eljLCyADHiT
         Z8murVOv0Nz6hnMXk6Cwc44jltXCFaHqs9+NUzQRbN+hBpstMYurHN2EHdsmZoJTKQCo
         oZCimnLt7dS86xYyJusN+ZuE1XgRPziPqWIF7yizMFgrGlLxSl6PotJ6T4kfGldnEx8J
         FETeFZNleLt//HK82TdXGZ5naix9HWG6KbZjsimcUDr3sV4bYF2yIO9YccN+KdNokvDp
         YvIz4puBOiOiYsnyoN6i8sPua5gUoHnP3tThEeJvoZOeCgGgzW2cRIkob7wyvxTktoDH
         19/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cKb+7yY8AAtnKsnDhbrJQ+GCyMFPBf4IZInu6V1fjgY=;
        b=V6RGTJ8umfUlwggiEk3vBs8HdUiGEZTS5oNCDggdeT2XbW8qdQ8uaXPCw1Pwq8GeTC
         Q8s13gQuRA0SPIbyx1SENVchB6idecw6fT+BHljb/xOg2B/tAYPXiHLOvq5+YtiLpwwl
         QM776ma6kpX7355J1LEFlfeHnIHsgp6FuPQXou/GQwGhMKz+yYP3vfRh81VUAGAWtzTq
         6weC/bHT8UXTMiBlmZwAUnKbNkAk/8N55366lDU+lGQC1vhJ64Ew50UQT4Yu93nI1Izc
         S1D2ypW4tox8YlLEfUKkTb03OqjVssJrZnJ2y0780PWIlhWdaG6IDhwTVTSTtx+FODR7
         M9zA==
X-Gm-Message-State: AOAM533thz1L41xJVpYo+K8NFPwD7vyHshfqoc1X+y9NNLf9PmWv2+OH
	/fCPcje3DJG7QgOhh8AhuXEU1eVv3kb3vM4T
X-Google-Smtp-Source: ABdhPJz/1caI5Jfc07viPzh9m5RpH87WSOOT+dlL18kNr8w3GUcp54JiW2FBpBcKfh6PhfaZW/0jtw==
X-Received: by 2002:a05:6402:4395:: with SMTP id o21mr11943334edc.163.1623574071939;
        Sun, 13 Jun 2021 01:47:51 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.gmail.com with ESMTPSA id cw10sm4332079ejb.62.2021.06.13.01.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 01:47:51 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-oe][PATCH 1/1] rapidjson: remove stale LIB_INSTALL_DIR
Date: Sun, 13 Jun 2021 10:47:48 +0200
Message-Id: <20210613084748.31493-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

This was introduced with commit:
 2e0fd78
 rapidjson: fix cmake artifacts installation for non-default BASELIB case

and should have been removed with commit:
 5aa127a
 rapidjson: Remove unwanted patches


NOTE: such multilib fixes are not needed after this commit in oe-core:
 24f630c cmake.bbclass: Define LIB_SUFFIX

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index 5b5c8b2570..ac803294e0 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
-EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF -DLIB_INSTALL_DIR:STRING=${libdir}"
+EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
 
 # RapidJSON is a header-only C++ library, so the main package will be empty.
 
-- 
2.17.1

