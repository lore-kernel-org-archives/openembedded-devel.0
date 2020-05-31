Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.18017.1590941795567787465
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 09:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Okc9P7SU;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id w68so1503177pfb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3BVA2RaKRUnRycsj2vXyL6wXYKMQsqw1EsbdjVV33go=;
        b=Okc9P7SUEd7Q0fVsmJziW8tF9EoqclIA5/P+bZD7en11Cc1xTRczKSo1+2oVMYdwjL
         KefJ12R1cK3F8C+zECV0C1Jz7lf61Ygq96pzMOE4IPHidMIzFTO8wN28UoEZxFMsjHJW
         P0AG07UslYw9fK+dl4tnb5OhKMiIf4cBznVVPUpEQBn0X7P1dmWuAGrQ6LF0u/mcDzzw
         Vi/TGpEzvZxU3wc8TuGRabEePyqQRI/f0695IFgWBo3UIOF1Ehh4iXmeRVDdTvsheQRF
         cl7adR2CLXJRSnSUy3e9TiZHR7iAxGD3tDXHdN8chgO7UqEJIk5ib6x8XdPIVkr5xw5S
         asDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3BVA2RaKRUnRycsj2vXyL6wXYKMQsqw1EsbdjVV33go=;
        b=pLxPxzq+5+fmM5k6XTLliyZHataQLtmW1u32mBiCtM9S+iituUv2WR8iy2sf4K8Ayq
         xHmnS7hCuub6CWwwaGru2j6pp92oxr2LFu2hE9f1PeGqUQWDsPxYIYn/3iEldPvBMlsh
         9FfKY5x2SCy6BMM7vD1SgBDIqEgm4K9xxPkFlvsBJaJM0OzkyDuWVzS2Lz0WptxMOOtH
         d433yGRJ0iL/Ln6+2wcPXpnZxkdAGRa1mJIzWQUsFiwGSelQw82bdYRhUI/HkFxUEvR8
         tkNCxDx9s5piBw/cMXkJML6Iv4deuB5k1oIeR8zmlaCEhg6BhDMtU9faL1r/uXSYjFBo
         DSXw==
X-Gm-Message-State: AOAM532/JLieXcrxhdyfqxdQbQmBYH0kDTUq/TKllDxwBg1PdjAo4/qS
	KJLJ97oriLQFSWiiOIn6Wo3+MsPX
X-Google-Smtp-Source: ABdhPJxXsBzvp/QxWfd9dWFB+Oyl8I6DI9NIeuSTA0tuQFi12gco6ZT5ImElIWo6uB0qfKL7OIU0GA==
X-Received: by 2002:a62:fc52:: with SMTP id e79mr4719522pfh.5.1590941794944;
        Sun, 31 May 2020 09:16:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:936:376a:3aad:6139])
        by smtp.gmail.com with ESMTPSA id b16sm9188871pfd.111.2020.05.31.09.16.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 09:16:34 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 07/35] librsync: upgrade 2.3.0 -> 2.3.1
Date: Sun, 31 May 2020 09:15:54 -0700
Message-Id: <65cd3aa82ef673258ac4760ec860d3cb9bc1f6f8.1590941674.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590941673.git.akuster808@gmail.com>
References: <cover.1590941673.git.akuster808@gmail.com>

From: Pierre-Jean Texier <pjtexier@koncepto.io>

This is a patch release that adds peformance improvements, updates and
tidies documentation, and fixes two build/test bugs.

See full changelog https://github.com/librsync/librsync/releases/tag/v2.3.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c8d1042a9892c38cefab8c6f4a9cce6dcad19db4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../librsync/{librsync_2.3.0.bb => librsync_2.3.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/librsync/{librsync_2.3.0.bb => librsync_2.3.1.bb} (88%)

diff --git a/meta-oe/recipes-support/librsync/librsync_2.3.0.bb b/meta-oe/recipes-support/librsync/librsync_2.3.1.bb
similarity index 88%
rename from meta-oe/recipes-support/librsync/librsync_2.3.0.bb
rename to meta-oe/recipes-support/librsync/librsync_2.3.1.bb
index e9d34ee66a..004c93d0f9 100644
--- a/meta-oe/recipes-support/librsync/librsync_2.3.0.bb
+++ b/meta-oe/recipes-support/librsync/librsync_2.3.1.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "git://github.com/librsync/librsync.git"
-SRCREV = "028d9432d05ba4b75239e0ba35bcb36fbfc17e35"
+SRCREV = "27f738650c20fef1285f11d85a34e5094a71c06f"
 S = "${WORKDIR}/git"
 
 DEPENDS = "popt"
-- 
2.17.1

