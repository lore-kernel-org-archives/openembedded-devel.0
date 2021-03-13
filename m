Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.411.1615618176013478810
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 22:49:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zokd78b7;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id l2so17289966pgb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 22:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B9lc3D0oPGLhFVRhMv/s6fJTZZ3SI/ky01GsfyBJSNw=;
        b=Zokd78b7WnphnDQxUJlyeb8x5d5y3k8wDZfI60hWAnYQuYLq5oJAlmMtyjFyTE/Y64
         bxciVNUtG5/Oze8mmCHvGeghrKiiY2AjeFFEwxvnifREZQZz93RFR8po+3VSVMqkpJNK
         ptLi/MFavezRAP8yPtfnEhf1v24EYDLHnqrS2SK7Pj2bYTSeqn0PxynDio+ypaGtNsrA
         dRvBgcAgvrqF7Se0Sd7KFPysU2Bes/8eO1YTtt1TGTPZBq/KLqhJTEYIUwIPu2FG+zTi
         F/anMvQL4C85w8et1+JBAxBDs+seKww1+3fGPuTzhrRoZArssv7FkjHkS4gbHYRaLpmj
         uhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B9lc3D0oPGLhFVRhMv/s6fJTZZ3SI/ky01GsfyBJSNw=;
        b=QovQYb1M9bb4uMClzRoAyUwY0mI5S2ejXZlPKMtOMjcrZYfvEY8RA09wzHTrC5y4lJ
         2lLZJJJddKzt5I1Qr1ziZXkc3e7kk48KDUP1Kzh9KyYwf+3E+L1oqPDG1A8HN3EI8g1T
         r99M0tajZEN0HNfYEm27Unkv4t8shMO5tB8T5pDqqbl/mH1H2CbB5cFYRP29jpG4oIXo
         qMfbNgo2ihuYtTfeNI4iN0WrbyCqCCcdw0CGAWFa2i8Z0tL6zYHVfrTnN52l0MY9azDW
         pJI+EYW97YcmHaIt8LMbRXskRY8aZ1vAxDATiVMBqrPg+QoPes7HpuW9AAjx01PWicEA
         rNXQ==
X-Gm-Message-State: AOAM5314IHRuMfhIUoGkSUOO3vULz4KSrDrkwl/ij2OCzBlH7M0A/T3e
	sUXU3TVZ5oPOdCHO7FgUKyuRGOoOQpJsew==
X-Google-Smtp-Source: ABdhPJwxpoesjsqG4JivuRDOj2adBtWR5/PZKFdJabEl1LryaZrY3KECGSa/J0FmsXvvIWiGUupBIA==
X-Received: by 2002:a63:e42:: with SMTP id 2mr15110545pgo.100.1615618175217;
        Fri, 12 Mar 2021 22:49:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id g21sm7627012pfk.30.2021.03.12.22.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 22:49:34 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] opencv: Disable build time CPU detection
Date: Fri, 12 Mar 2021 22:49:31 -0800
Message-Id: <20210313064931.2636826-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This will be wrong for cross compilation, instead pass it via -DCMAKE_SYSTEM_PROCESSOR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_4.5.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.5.1.bb b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
index d87e140ba7..5ffd53cacd 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.5.1.bb
@@ -87,6 +87,8 @@ EXTRA_OECMAKE = "-DOPENCV_EXTRA_MODULES_PATH=${WORKDIR}/contrib/modules \
     -DWITH_1394=OFF \
     -DENABLE_PRECOMPILED_HEADERS=OFF \
     -DCMAKE_SKIP_RPATH=ON \
+    -DCMAKE_SYSTEM_PROCESSOR=${TARGET_ARCH} \
+    -DOPENCV_SKIP_SYSTEM_PROCESSOR_DETECTION=ON \
     -DOPENCV_ICV_HASH=${IPP_MD5} \
     -DIPPROOT=${WORKDIR}/ippicv_lnx \
     -DOPENCV_GENERATE_PKGCONFIG=ON \
-- 
2.30.2

