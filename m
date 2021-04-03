Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.35208.1617484031400961433
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Apr 2021 14:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rs9BLmt7;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a7so11812350ejs.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 03 Apr 2021 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfZvONYVsPi41Q21ci1yhsKGb3s93yswN+bisIFLDwQ=;
        b=Rs9BLmt7EcBmantc5ZyLZ2AgC7+1prMyF2qZNXfoCe4aPYne7Ucw0OuCSHs2eMPk4z
         7AlmxZH4XO/WCiq7YTJK3LAAZJL2uBJYvl9QR7h5fWWnNC2IFKDA11xcZxC1YyKFpZLI
         lh4unIKQiuxh5aYO9Ylt8k4EdLpQxC1XbO6tZgtG5OJc0FmDIU8INhtYpRuN9FXbApu9
         wxUoskYKmQwNgEVKO7eFaIlCKaxalB1SIzq9e1S5ydV3QNXJQ+I7yig9AztVnclkBoFQ
         QhLDBWPxJm537j4sRI3tZnEfYBcC4JmqPulcJ9HyIQ9t6Co2nu4c/Qk1rlg7pyNBSiCu
         oIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TfZvONYVsPi41Q21ci1yhsKGb3s93yswN+bisIFLDwQ=;
        b=Ostqg/JDhhIPFe8dtqKQlpiLgxA4FoTMhE8ETX6HVViojGLbAteLjlWa6wH1jJdkv2
         g5oMtlRlilkrGQBQxU3ZfAAo6gUjimkZDLC6Jg/Tq7mCRKRcvs7qsHtpqWy3D2AQKwtn
         UcFUNBOgLoBpY0+4Yd51tH04ryaVtdoeBe3SDWDxwQIlQbl/TE0NXnm447WFMFBFomRl
         mWQyQSVuUHAyR+qtv/04RhTWH+uM63A8zC6CeMDaeHxYt0U7l60htIY60nZH4PX0hdaS
         hbvGtLc+gz0y9iXnLKLsZuO2nBYh6DT112gXXl7jeZ90rPFC7RZBygfXh6Nkt9Sz4bT/
         EoMg==
X-Gm-Message-State: AOAM533vi1oTYAvz/rRWFPekQMZNMSlYjdD1YBp+CiWvt6rmJqCX4Gag
	xqeBLrQwHJcAAKm4y6UgL43R/gXom3k=
X-Google-Smtp-Source: ABdhPJwuysbMBafaFhJo1178zU8Gu7gHVV2wtYHujwZTfKpKyc6K8+EcKuHN1yFZhrvUMdoGk1Pzlw==
X-Received: by 2002:a17:906:4705:: with SMTP id y5mr20857818ejq.119.1617484029872;
        Sat, 03 Apr 2021 14:07:09 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id gb4sm5890028ejc.122.2021.04.03.14.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 14:07:09 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] packagegroup-meta-oe: include glfw, icewm, geis only with x11 in DISTRO_FEATURES
Date: Sat,  3 Apr 2021 23:07:05 +0200
Message-Id: <20210403210706.1427733-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* and also opengl for glfw

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index eb6cb3592f..d5e5aa01cd 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -191,7 +191,7 @@ RDEPENDS_packagegroup-meta-oe-core = "\
     usleep \
     dbus-cxx \
 "
-RDEPENDS_packagegroup-meta-oe-core_append_libc-glibc = " glfw"
+RDEPENDS_packagegroup-meta-oe-core_append_libc-glibc = " ${@bb.utils.contains("DISTRO_FEATURES", "x11 opengl", "glfw", "", d)}"
 RDEPENDS_packagegroup-meta-oe-core_remove_riscv64 = "safec"
 RDEPENDS_packagegroup-meta-oe-core_remove_riscv32 = "safec"
 
@@ -354,7 +354,7 @@ RDEPENDS_packagegroup-meta-oe-extended ="\
      libuio \
      ${@bb.utils.contains("DISTRO_FEATURES", "x11", "libwmf", "", d)} \
      lprng \
-     icewm \
+     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "icewm", "", d)} \
      md5deep \
      indent \
      jansson \
@@ -711,7 +711,6 @@ RDEPENDS_packagegroup-meta-oe-support ="\
     ace-cloud-editor \
     frame \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis", "", d)} \
-    geis \
     grail \
     asio \
     augeas \
-- 
2.30.2

