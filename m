Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.1276.1591500304099299345
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jun 2020 20:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EdO7JUDN;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id x11so5281417plv.9
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Jun 2020 20:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QzGzuXi/ju+AkDYUrzD+OHPj58KwpOH/b2pMZ4Wnjb8=;
        b=EdO7JUDNRTO0P2jY5AL/uBPPScel9hIJXP6hCWzOswKJpfiW+BSVaVvE9J7PxmK58Q
         n8SWVc0dLYVBEsMW4avfNbvoES4Pv5QUTeC0jcI5y94Jh1kDFjXN1neXkmpPUV9UZ5gq
         FFTAxoGgKe/m3OSHQQcwkeminJYxClk3+okD2PizCwFzyHLMEBiYlom9Bs3rVOBISr62
         scUryj3Lv7KaQLnokRpIKv0+JODmIbJ8VM6mC1TtzuJj/y6ESnkUIUULg3yl4zbMHKqE
         oU/zE3cTmVOsiVTFe9PVt95+2qkPtJsGt+FsNodrbZweAf0dyjDwMqyyuu2GAUc2ExAA
         89fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QzGzuXi/ju+AkDYUrzD+OHPj58KwpOH/b2pMZ4Wnjb8=;
        b=ZpdhD0jcYgQgei8l9riqRQVVF4x+BBB/NJmT/TZYP6ohwSxMwsJzkOhYlh6t7/KvJu
         8u/4e6/FK6FuYTQuln3E5hj3dOGhFnv8S//08iYTwdABgtnd/4wgPDqBy76//Garniu7
         /KzjPVJIHxqGDuXal5pyCAprckZ+ooQqaX0mzK51AZZC4SU7i7WtLSpBsEHTJVgyCzUO
         GgJkGdgrHVtrhhnA7YVHqS87+Ino4jTt72JgAJR5nQnSWBcPywGj9AjI5sy+v2DQ8cau
         yqzDFH4gjkaze2wVQpM96+ABPpqGq8f8/ZIdqSXDAkbNBwt+8JF5J+VbOSwnttj6/KYO
         wIUQ==
X-Gm-Message-State: AOAM532JFHVOBVBxhYldRZzSngL3VxEW/SdoJiD2Doj/9h7GgUvuWdTI
	X6ESdCJGWKGLVW/uYoDBHmuHNvBy
X-Google-Smtp-Source: ABdhPJxW5xaNc+7FE/nBeYdWzeRxgeqeF1JVwdeL7mB3+3nAPzOnUGvVSKQ9gCWbwSAo7QZwUBE74w==
X-Received: by 2002:a17:90a:714c:: with SMTP id g12mr11166871pjs.31.1591500303384;
        Sat, 06 Jun 2020 20:25:03 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:590a:7b35:9222:2f9])
        by smtp.gmail.com with ESMTPSA id m7sm3372463pfb.1.2020.06.06.20.25.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 20:25:02 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 20/26] python3-cmd2: remove double colorama in RDEPENDS
Date: Sat,  6 Jun 2020 20:24:30 -0700
Message-Id: <c3a0e0a17ff4a59491c57d7d2d8d19f5ecb78f2c.1591500140.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591500139.git.akuster808@gmail.com>
References: <cover.1591500139.git.akuster808@gmail.com>

From: Konrad Weihmann <kweihmann@outlook.com>

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fbd0d77acbe358c5dc3fe131c969af4b2cb8afa5)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb b/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
index a2bf0c45e2..803ca4a404 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_0.9.23.bb
@@ -14,7 +14,6 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-colorama \
     ${PYTHON_PN}-pyperclip \
-    ${PYTHON_PN}-colorama \
     ${PYTHON_PN}-wcwidth \
 "
 
-- 
2.17.1

