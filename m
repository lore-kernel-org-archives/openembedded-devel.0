Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.18133.1590941807429057073
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cJpLa9gH;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id h185so1297581pfg.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yuRaInD89LNEEIZ5tdYvpJ8NOkmv8JJn49PzdeF60WY=;
        b=cJpLa9gHuPE48eKyoVJ3PFsCcjUEc+U8zWh6Hscm5lrIdcmIxe7lOBvpIotM9dvlbM
         M00gqsUYHVeeKHhSTfg+/tW+njf1TBtk38cHWAP3FYSNoAqgi9xq1BMUBj3AW6TMhdA+
         2S/Bm508dZEHHpVWBrym/kh3jR22an23co0JW0z3ywxDzmXqyPCQPJQBFPdNoT0dT5Mg
         HiaL254LipP9FZmqySETglEIfWkVmoeplY/ObB11wxo9GKMfom9+WscxrpfErLKcHkQ3
         tC6wuFwynVk2u6o4AfqaU6Yt9DZiC2YzqId6XCRgFIglGZROabPImLfo0VtUsYlY90rC
         kbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yuRaInD89LNEEIZ5tdYvpJ8NOkmv8JJn49PzdeF60WY=;
        b=YcsCIPnFEUK9hEQCdeVr1twk0UMysBT7WTdPnW0ZggnCXg+2aC62pCzuG0KKR/ylEN
         2657OfVCmGo3SARcQXJI79gt5Zm9in4JGp7ByYT0pBtgnd1rvGwGlDavWlgTGuAtU6JP
         bo4Bt6GXkVohDD93267sXdThxe7VxnoMoRkTfnFYjZ5TWNWnPmnMsMOgJWUIp4ZZN0vi
         lslIV0svwVDLVaKQVAHYwdc6a3cpTniwSoZjW0NvsTo4ov1T3RkwpmGn2IosGo6NGJDq
         PCyGgFjNCoXD+dNIcxs5yh706JN+8areGF0E7jtxwhPLF3Bu449j2lCU/jmXXm5j0Dmf
         N+jg==
X-Gm-Message-State: AOAM531VuO0Q3JAg9r1iCxYkWUDEUoxEQHC5o+yLbmIB9hStPP/IjBc2
	ITpAKj+DG4N8hfJqzERWwVdbWZdP
X-Google-Smtp-Source: ABdhPJzFSzrtXAPVu7ic+5yZd+lFPTHAVDfHcmIxqSdisBikDrhR25zGXIM3xOX1iw+3m3qOVcBdJQ==
X-Received: by 2002:a63:ae44:: with SMTP id e4mr16130185pgp.428.1590941806787;
        Sun, 31 May 2020 09:16:46 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:46 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 18/35] python3-pycparser: upgrade 2.19 -> 2.20
Date: Sun, 31 May 2020 09:16:05 -0700
Message-Id: <95c120173e720cb968e197330d85b551648eef6c.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a99312d03a4ac8785a7770309664d2eb05ae08d3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-pycparser_2.19.bb => python3-pycparser_2.20.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycparser_2.19.bb => python3-pycparser_2.20.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
rename to meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
index 35ed93e09b..2a5f414b2f 100644
--- a/meta-python/recipes-devtools/python/python3-pycparser_2.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pycparser_2.20.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/eliben/pycparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86f1cedb4e6410a88ce8e30b91079169"
 
-SRC_URI[md5sum] = "76396762adc3fa769c83d8e202d36b6f"
-SRC_URI[sha256sum] = "a988718abfad80b6b157acce7bf130a30876d27603738ac39f140993246b25b3"
+SRC_URI[md5sum] = "b8f88de737db8c346ee8d31c07c7a25a"
+SRC_URI[sha256sum] = "2d475327684562c3a96cc71adf7dc8c4f0565175cf86b6d7a404ff4c771f15f0"
 
 inherit pypi setuptools3
 
-- 
2.17.1

