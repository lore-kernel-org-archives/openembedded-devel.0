Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.10420.1617328737800117482
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p1jDUF+Z;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id ha17so2064151pjb.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=X/OF4ofaglFwpIuSCzjfh5eTYgO7A7xLHnbtQfUcqzY=;
        b=p1jDUF+Z5XUvi65JjGhLg3IOSztWS22q2+ZwLhoe7cdTkUgQdcufqYeL53o2a+ogQ/
         2i03oY55pYt67wzI3hwEoVPXKJLf9wPoLeKAUKPr0mbDm61Hm+JVaK9fOw/0b2z1JwXi
         fDuKItl764qwWQAgYi9LbEdtkg0qstkiFsn/38B7reWRMXzLTMo5v+fFuB9Rqpewned/
         5Sqw2d3P/ymcZZCYDgYA4N5HgFsEVk/LCYK1vm3jAZztp6SuY8AmXeE1DXRygvT1a5/F
         Cf0uqNbhJfIdIpSq2XEdrmFJjXfrt1qgcuWjOW9Tsn/V/eIgAf0WB0ZJMOE9O8ZGNWaU
         u69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=X/OF4ofaglFwpIuSCzjfh5eTYgO7A7xLHnbtQfUcqzY=;
        b=Q9QetfGnSxZ/Ju3EPdEVQNUbc5F82y62Up3uITyYYBYT3drPcb4s+OmxGDpBPaFMAi
         MSf4VY1uYrM9Tr0ELnvihyHDm0FA2UXZcZZmgmtjJtyyWB2czZnPkuj3YF5MRCDhPgTi
         F9YF+ESpgUvQZKNC+teVSdnFNxBavU0Wsgz0fHXAj/2v/gqN4kdVxr0DXLuuR8jBVvA+
         FD0zTDZWx+bwOAMESUiNpMA8aNjWuMs3c+6l9f5KtlxY/ityoM83A/N9gT0KwV5KnTub
         NPBor3REoHdAQ5xQfAnRjc2rlHbMtkIvFvrb4+J+S3MPC7JUeIYnHC32KFDDClF1OEvU
         Tctg==
X-Gm-Message-State: AOAM530GOd4H4vKyg1CXEAFsnl/GrIX6SWe3tM6WRTS5DhUcc4ftHOsi
	cyKvqUg93mMt+jXh795Z/mHLzmV7AzU=
X-Google-Smtp-Source: ABdhPJwYo3pLDqAdQhQnb/ZEVHBM+VAzt0QsgpsN22joxrwl6sJYrXI9E8K1HNoiSGJZI/22l8u78g==
X-Received: by 2002:a17:90b:4b08:: with SMTP id lx8mr11408382pjb.135.1617328737214;
        Thu, 01 Apr 2021 18:58:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 12/14] packagegroup-meta-oe: include nodejs without meta-python2 conditional
Date: Thu,  1 Apr 2021 18:58:40 -0700
Message-Id: <353578d304d847fb90d148d8d1fe2b555a76327e.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

* it doesn't depend on meta-python2 since:
  commit eaf9cfb01864a7a64c6ba4142283a8cf76cadd9a
  Author: Martin Jansa <martin.jansa@gmail.com>
  Date:   Thu Jan 23 17:44:06 2020 +0100

    nodejs: use python3native

    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
    Signed-off-by: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 4d86ef97750..e252c0850ba 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -258,7 +258,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     mpich \
     msgpack-c \
     mercurial \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "nodejs", "", d)} \
+    nodejs \
     openocd \
     pax-utils \
     ipc-run \
-- 
2.17.1

