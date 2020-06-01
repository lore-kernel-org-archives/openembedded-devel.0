Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web12.26901.1590971276577232337
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 May 2020 17:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ONO+RrSV;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id f21so2680811pgg.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 May 2020 17:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXZL6waMELSyFptWJ+IO4UCtHPuu+k04Xq1QgvIhwKQ=;
        b=ONO+RrSVIHc20O3sesGiIrervzM1quESuTC8zTFs54BbLbhsqQtXeLdqr1wFbdzsZl
         Nha+U8zFdCpH34JOjcN9sEhhp5nO9miMj+vhLzlVCADnz+bspJx1kh3boXTyJUlqZmdA
         OHgx213rY/JGvr3Jdj8n0aWdONRxGz5dCmKbBb5tzZuh+FEC+GscPFMhyGdmdhV/Jqo1
         /I22hYhFnqFRgdJrC/lOYHdlEt9DoQHuH1EeNGHC2JZSTVPZseMc65HJ2YQ3oIslscFQ
         3DIUxZssrwBvYO81M1GlvWkeHryhkCb0cGgf3BxM13kCMPhlb9zWqedd2zd1mYqJ6KtO
         QVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXZL6waMELSyFptWJ+IO4UCtHPuu+k04Xq1QgvIhwKQ=;
        b=Bvfs4MJ4n7Blve1RPCuDASJr2Zn4t4leuGeBCi5ncjEF9GuMrUXVN/wWIXhE4XC2YP
         zA/j1IBynFu/+/VhvhYLtVTclC5gNEK6pVB3g2lpL/C+XOTP/1eIWPC9VRxXOHsL1o35
         iBNlKM6ef8Wyisf+OhfCTMj0pEwkvwGApOufQvwZOzBvn7gUf4W7JVYCE4OzbY+mwfnG
         F8DPJ70Wbgg25PPrjNu8c7u0ka53M0aZJtBxdG5WzbYkVxPxWK47BC+wh22eNxSH3CDP
         QgKY/e9odqviRz7Q1/KW0OFggyeH2CgaZ4wHulXmSBgoJxRnw3ivQoDIdOqyG+0ev2Bz
         O4EQ==
X-Gm-Message-State: AOAM533zw9DD46GqeHdZ5FdpDdM1ceZSew2srJfxVl7aGXYWT+9QxSj9
	U3gqS2rR3ePovev/+HYauYcvtOJUMc0=
X-Google-Smtp-Source: ABdhPJzumQnarxgkOY0rUkgTWvTjXFM4UQ5OSLxhrXpQ/rxCetUxLJXindsRUOULN9rHKKdM0elXQA==
X-Received: by 2002:a63:3f8a:: with SMTP id m132mr17091004pga.225.1590971275683;
        Sun, 31 May 2020 17:27:55 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::86f0])
        by smtp.gmail.com with ESMTPSA id s11sm2034950pfh.204.2020.05.31.17.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 17:27:55 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-zopeinterface: Upgrade to 5.1.0
Date: Sun, 31 May 2020 17:27:52 -0700
Message-Id: <20200601002752.927933-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-zopeinterface_4.7.1.bb => python3-zopeinterface_5.1.0.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_4.7.1.bb => python3-zopeinterface_5.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_4.7.1.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_4.7.1.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb
index 6b65924c21..a66735b8a7 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_4.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_5.1.0.bb
@@ -2,12 +2,10 @@ SUMMARY = "Interface definitions for Zope products"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423ec128974bd9d46"
 
-SRC_URI[md5sum] = "1bc66758275c5eb66d169acba3c8e50e"
-SRC_URI[sha256sum] = "4bb937e998be9d5e345f486693e477ba79e4344674484001a0b646be1d530487"
-
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
+SRC_URI[sha256sum] = "40e4c42bd27ed3c11b2c983fecfb03356fae1209de10686d03c02c8696a1d90e"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.26.2

