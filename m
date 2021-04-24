Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.4807.1619259115439212949
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 03:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vZEvxJcJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id y62so3042319pfg.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 03:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bUPqEQZS2fJMhm/x4Vy0IasUDG5n3Ng6j4ILiBQ3H9U=;
        b=vZEvxJcJn59Cf3jzd88A1trzpMNLIC8ewT3t1QLlykg/SlmfPF51VtlquN47cWvLtE
         OTOSCBRO2WSE1YLkCRgRseOpLlPxXTdsx3OIanybbFSCmEwI2vHBJJs7knUo5KNgpo0k
         +TvGJKzOJ26GsBpaPlFOh2Av+/VQmp1GTgQA9BP3Ev/t8sWHD4hhIBHUHfZ3jkcfMgZ7
         SL7s27AqukRmOjmYUZ7HGRjetsu0v5JeKLot9Ow7XX3w6kEVWZvogtBb0gYFpTXjhpm+
         Sik+fQ/aW3OSpXisTgx/XmwNW1k+r132onV4gmu9noyZqPbmyirUHpiIToftTPuepIQE
         Ggag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bUPqEQZS2fJMhm/x4Vy0IasUDG5n3Ng6j4ILiBQ3H9U=;
        b=FafnGXiJy/PwkXM8giv5SEO7auzKNUlRrqLgJRs/H+0rwgmqeNl2U14t9cLdz+qMLR
         m+Gu5IPagy9x9+aPlK+wTPjOC1RE3FaKo+PG5+DI8Sr+pTEcDWhhd2SdYtRPGCFTf2eB
         d4V88xdXVs+zTXMJJZGWEq6amLm9/1P95rYwpc/Cs5iQaJdv8wnsMDlgjSmbx+uqYpkd
         fmjENqhQ043ZO9IirJClmPoQ8qAgOWIPJmZyfvFxHJBM4vusqR/pwUQs2Wzedcm1ICjP
         mus9BU4NSih5jF0VCMGSLkF8/Z9v3U53nJfINuCWbA4pU6If0vxDg9px5gwzSDGf0s+h
         WdfQ==
X-Gm-Message-State: AOAM533QqM4BT/FZzyFI/TeNI/XaLcBw4Rdz3VqRHF7Yc8GEjmkNwp/p
	h/GjcH0IpjBEA0qc4n8Gie1pNKWKz3NLNA==
X-Google-Smtp-Source: ABdhPJwPW4L1gVaL+y8Nv6qd/KL058ELOqyCTBKHmTphcM/5f5ogvtWVEfiL5HikCL0FYk2Xix7cDA==
X-Received: by 2002:a62:5ec7:0:b029:227:3253:3f62 with SMTP id s190-20020a625ec70000b029022732533f62mr7908950pfb.54.1619259114822;
        Sat, 24 Apr 2021 03:11:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9c11:697b:fdac:256e])
        by smtp.gmail.com with ESMTPSA id h17sm1033173pfr.97.2021.04.24.03.11.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 03:11:54 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 6/6] python3-cryptography: Upgrade to 3.3.2
Date: Sat, 24 Apr 2021 03:11:47 -0700
Message-Id: <71b546ed8595b14d29efc1e8b951f8c845ad10c4.1619258978.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619258978.git.akuster808@gmail.com>
References: <cover.1619258978.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Fix a security issue CVE-2020-36242 where certain sequences of
``update()`` calls when symmetrically encrypting very large
payloads (>2GB) could result in an integer overflow, leading to
buffer overflows.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...hon3-cryptography_3.3.1.bb => python3-cryptography_3.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cryptography_3.3.1.bb => python3-cryptography_3.3.2.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
index 79a7ac1bf9..0a36ffe1bd 100644
--- a/meta-python/recipes-devtools/python/python3-cryptography_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cryptography_3.3.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba"
 
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "7e177e4bea2de937a584b13645cab32f25e3d96fc0bc4a4cf99c27dc77682be6"
+SRC_URI[sha256sum] = "5a60d3780149e13b7a6ff7ad6526b38846354d11a15e21068e57073e29e19bed"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

