Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.2664.1624825348342510221
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NJVMw8Oi;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id t9so13477296pgn.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=WDYSYyXUPxsSn3U7ZHzjBoxzOHpSnsVtTUTVMobhnI4=;
        b=NJVMw8Oi+TeOGr1hTFssfRCu4nX6w9s2GTtX6+E8aoVJeMR6uHOJXaEHtj5PEDEJsX
         jKvY9zaxMU+eMgbsxFFI4AmXWOADwGC1X4YF5KcvYhZseQooLBAC3J/XvdJKvCflQnIk
         s7BdQXFye2xwKAgBz0CT+M/W7CI0NjlRMUcYLEbwxAfV3+2Lo10aSLmbIGi6x7B3S0rt
         LRKTG7nABo16umTkQ9v9m85XHJDPYn72bm/zi30Wq2ZtyKSFJ1sX4q4kFxemkiBuOAEm
         d7M1POGIwcDBpZbiq99ro0B4DTMeh1FivvDVNgWBHNJOxdDbLeN+ixb8XippOe+l/LlA
         K/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=WDYSYyXUPxsSn3U7ZHzjBoxzOHpSnsVtTUTVMobhnI4=;
        b=NXNqdIJIcpTSClPp6MPYSHo04heRa6BAc15qn8D2hdAMXwlkbYfbI51vYZIBlSblbm
         gUcPmL+rgCleC0Bt4S3cT9PpYgqy5Rr6jn0mdtd85l5PeFuNfqP5qdkhlJQq+oTzk/wV
         w4jvUpjw5naWezzN5JSreEpgvDNKpxiBWBhs9MhQsxX/nBVs4wWQ4b9xkh/9ua1j7S+R
         OulQuVRVX/A7UTdDcn25Ov9NOziNlSnMiIIinc4ajzguN1A9sGr7Z4pdUQejknQQtL82
         ATBVpifWKUg8iCWbf9E9AsxgiCIS/blEp7lIK98Pn0Qpxzz8DBOXamLx/aGuJdQuavJB
         cBAA==
X-Gm-Message-State: AOAM533sNELXQ/fp4VGLk27PX6aRB34wj6d5XGURDeH/DKSuNy3uhg6C
	K0sh+VbN2dDyf2mQYWX8rcfxRRe2z9Nyvw==
X-Google-Smtp-Source: ABdhPJzqZrIwCY5jMlNBQYga+1Ch8WjkNeMzh3h56kXdnvzSeIAAo1nTLiMoa3YbdUq13tL5E1W43g==
X-Received: by 2002:a65:4985:: with SMTP id r5mr19667137pgs.122.1624825347828;
        Sun, 27 Jun 2021 13:22:27 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:27 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 10/20] rapidjson: remove stale LIB_INSTALL_DIR
Date: Sun, 27 Jun 2021 13:22:05 -0700
Message-Id: <1ab32574eb88823308d68a402ce1baaab09b19af.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Andrea Adami <andrea.adami@gmail.com>

This was introduced with commit:
 2e0fd78
 rapidjson: fix cmake artifacts installation for non-default BASELIB case

and should have been removed with commit:
 5aa127a
 rapidjson: Remove unwanted patches

NOTE: such multilib fixes are not needed after this commit in oe-core:
 24f630c cmake.bbclass: Define LIB_SUFFIX

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0ceacaa68e212cc06ea7371a206bdbe21033cc05)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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

