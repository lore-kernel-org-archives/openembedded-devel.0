Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.21168.1610905011731189295
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jvp8vsOn;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id m5so8208420pjv.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SkHUnk91AGXpeUwnb/l9ssdsfbkhsmJcr3hCM63fRY8=;
        b=Jvp8vsOnyfb5M0pkVeKOZwhFNXDmIZuIp41YZoJQNU2FmHYLDOIRZchiVsBJyEmwnj
         vYvBkDEsDxdEQWY/INfnfOpzsWZlt7hpK+4QzNWMFFJXk8QsuUseG1XzK+Mt8L8aUlCT
         CXVFCGW4ceZ+9NbDX2EhECCOqc3bgwUg9LvWu8jdArrCaPwpX8HUFdd0OR5pp0kqtx89
         NB5sNqwVFxp5IVYVp6SSLF+pm/DyE6+Pbuy8RsoM02jF2gMXz17d/PwuPQpp9+1d6JcT
         mjqjpBHGihSunlvT/olZGGub1SGt5v2IqfE23xsELnlIntFwA8uvySJsRCc9JcToX2ql
         hWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SkHUnk91AGXpeUwnb/l9ssdsfbkhsmJcr3hCM63fRY8=;
        b=jLwkXGSRVPv5VM/pZL1W6mlvzj06HCXYZ3IjpHm/a0+NgnM8ddf8Wuvs0Z+xDfplMK
         +Ka0M5D0YHTYml+JOxiEWwtzsz01gxbkMWJWlr3Pc8T++qFPCXPRJ2G8YzOlC8pz+kH/
         jEWlNMSNZ6B7axzG6Tg3Hyogfkutkh1BIHVrb0/ixE968g91cy1gvFVz8eDpmYJ3WHdG
         5uVHmbZ8lwYdHZ2+COsvE5k9Gc/Qo5/3ncTcuQXIe1PR7NLtD0bPMA6ONdMcDzVZNyB6
         rnlbB2fGJI3nkAdHMiixYxPYRghOvNbqGLd2OhghqFEHgCsosO9aB4BUhHuIyucEAhAT
         +mxA==
X-Gm-Message-State: AOAM530GqDzdkkSf6dOpYCuz/6Ai+Lf9fF6fIxdkb6JNFqBOK8Z2BVuS
	mmOHx7Bp26aN+D2h+L4URv0rqvAQNRbsQg==
X-Google-Smtp-Source: ABdhPJwYcunw9cS0wUtOVWS78GhEY1I/4VyB5+rjiPG0f1DciJSFPwcqvHGzUjwS1DKzah37jqDgqQ==
X-Received: by 2002:a17:90a:be0a:: with SMTP id a10mr22450357pjs.139.1610905011164;
        Sun, 17 Jan 2021 09:36:51 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:50 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 11/31] python3-aiohttp: added missing RDEPENDs
Date: Sun, 17 Jan 2021 09:36:16 -0800
Message-Id: <89d0acd967133208298326d8e76a8ac2c1638d67.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

aiohttp implicitly RDEPENDs on html, json, and socketserver modules,
which are part of python3 recipe. They can't be properly imported if
they are missing from RDEPENDS

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8e7c57bd8f8250251e54fcbe149dc81743c0e30a)
[Fixup for Gatesgarth context]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
index 178e68bd97..c98e3aee7a 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
@@ -13,9 +13,11 @@ RDEPENDS_${PN} = "\
     ${PYTHON_PN}-async-timeout \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-chardet \
+    ${PYTHON_PN}-html \
     ${PYTHON_PN}-idna-ssl \
+    ${PYTHON_PN}-json \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-multidict \
-    ${PYTHON_PN}-typing \
+    ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-yarl \
 "
-- 
2.17.1

