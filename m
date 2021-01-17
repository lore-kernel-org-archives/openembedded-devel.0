Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.21053.1610905013334188296
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QFwd54YN;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id u11so3051985plg.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9PbREksz2s2RYPYhtQxNFWuIUQw0N43NtObw1qFvjlo=;
        b=QFwd54YN2PlmOYs/7Y32y9YvoTAqo8Eld6uUTHzC9Tdb0i7RrgL4cQZYhu/iKL43xq
         DiDaaLJbMHXZlzWlVt5oOTuPMfFer9PJnXHbbOCwpSgMz2imhgHzP56/dr3rL19mxq9W
         ogAMg6GxnjqGJEz8lQ7crM9bBtV04u7xAw6enkTVtC4GcOb5cZcthPyW8DWAXf4kqevS
         TdwTixCXOyOxeSg/3iy0k4X9hx1BwYqfX7LfCewokdUIgX1Whs/5EeGkSlJQshUiR0Y6
         qoym4RXXhhJkGIBXx9OqCGZeG+flUiVDPnVXZri9hrKTup2OX31Y4zbkWWNzgetJ0A7l
         uwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9PbREksz2s2RYPYhtQxNFWuIUQw0N43NtObw1qFvjlo=;
        b=mIIohHBvsJgmrQMjF7BAdiClY1q8nMHDfp3Z3HLpgnttWIHAFBqPRaVi8H6Nkje1U4
         MSMgIxAL5JeYWI0qYvhh7OZQHNLEjVzAfsLCSbzF4JY9IOoxo/AQX3T2IEJDc3fRwC/6
         Ki2WLCiFiZOXCzb0ti1t2Kgn5xOAriuZnpLFJ4qTF0+h5N2B+ZRhtHha1nQjyimNCZHo
         6iJIiTrHiBW6FpDWX4RcksSbmvsyhO7HrjDiv/qdzjdAzHPTFpCBXPCGq0katK54PtC/
         tgmN4CSnMsi+cscvS6E8Ek20TIOMMgqcm0s2WQqe3QtP/EatHwqFh8eJxcK3uw9ROWwt
         8fnA==
X-Gm-Message-State: AOAM533f9lc3jGOqVvENEfxK4Lv/XTIykhppnseOCW8K+LqxTNMLLEkk
	xmsOvWXKO0auU35TogDUAKeGCVWxbUvqCg==
X-Google-Smtp-Source: ABdhPJxU2zqO1CUd6et5PCKtTwYk+ATXcztBuAFbpNLvjcOX7lHxWPFlt+aAapmULm3qgnFTDFrfdw==
X-Received: by 2002:a17:902:e8c9:b029:de:a2c7:e661 with SMTP id v9-20020a170902e8c9b02900dea2c7e661mr3582497plg.76.1610905012817;
        Sun, 17 Jan 2021 09:36:52 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:52 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 13/31] fbset: use DEBIAN_MIRROR in SRC_URI
Date: Sun, 17 Jan 2021 09:36:18 -0800
Message-Id: <197b47c450af88358bf82235efdc7ed8c51ab4b5.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Roland Hieber <rhi@pengutronix.de>

Signed-off-by: Roland Hieber <rhi@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 155e7d6b3d5a43594006aff2050fd23a110b9cdb)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/fbset/fbset_2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index fbf834da18..e3e406ff53 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -14,7 +14,7 @@ DEPENDS = "bison-native flex-native"
 
 PR = "r4"
 
-SRC_URI = "http://ftp.debian.org/debian/pool/main/f/fbset/fbset_2.1.orig.tar.gz \
+SRC_URI = "${DEBIAN_MIRROR}/main/f/fbset/fbset_2.1.orig.tar.gz \
            file://makefile.patch \
            file://fbset-2.1-fix-makefile-dep.patch \
            file://0001-fbset-including-asm-types.h-is-needed-on-all-linux-s.patch \
-- 
2.17.1

