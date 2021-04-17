Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.4474.1618670566081782688
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 07:42:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ufQ1hCkp;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id cu16so13522823pjb.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 07:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y2oQGFz/cCdOK54A8FuKNaxmc78ZdBdDzT+uxGOWdEg=;
        b=ufQ1hCkpapyGCFseko8rZRXBf/Wyc5sxjEV3if8kkuoKKYMHS6GFdIswHh4poX/ed9
         uCQ4N8jAd9yhoFTGhWVzycd08KxdUIFoASnuvECINDGyOCqCa7ojrwFCbRiSuypUSE3A
         OyZQXTbc0zP1uydL8+g5YOQPTorE2RSwvE6IhwaV69XEMXIiQ2Lu5ofc0nSsAZmCBHkG
         gw3pWgDgqgK/mBNBjYvoEZS+vXdPOdbEdSWoGGqSnA6pET70rSSAqTQ8N2am5LcktrBd
         6veHlYeukDmDsnZiPI+loFGQRSlMpybScHTOuqvW4kF2R+KdajaxHsDD4CFFmYsmgPzA
         4OeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y2oQGFz/cCdOK54A8FuKNaxmc78ZdBdDzT+uxGOWdEg=;
        b=bX5/JaODU9NCrkxmPWIcq8x+zNJKF+Fvfhpu5zqv1FAdoBiELhbBx9AoPW/jhlWehe
         5WvwvBupnaJYCGFsaGIXBH1tkJ7QLgjZ2FFYy/IqzXbXMVtSs3JzGX87KElkrGpo1jsU
         RN7TpkmwJwxwhV7VyXt9ZHrEOghPGiM7oPCl6CNlg74hA3Ft0OBlL0oEGfHv+c5pedKY
         jjVOHWq5DKeNq0AyhT6zosheDXHXMG7TmJ58CmfMpcUbKx2cN0w4hcAZR/m++3Bmws60
         6O98UlaaUlU7iZI6ZI5Hvg4z/uXHs8DFNmbnuVVXOGmVULbz+escSaVTGLaxSLpDowAm
         2k1w==
X-Gm-Message-State: AOAM5338q/yV/bWinBBvP/78EV9sCHbZ+eQi3TfWKtEYaVzd7zFS7EHr
	vVt4QBQb45WEyEambW3QIWtBnqASV1Ar9A==
X-Google-Smtp-Source: ABdhPJxNfp1eY28BciuoFDvSvDst4f6SU7+EgtQbH3S4ypYgCrKAbfOEVOK95YyCos/u2ha5nR1rlQ==
X-Received: by 2002:a17:90b:3b43:: with SMTP id ot3mr14899785pjb.100.1618670565339;
        Sat, 17 Apr 2021 07:42:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id d18sm8848584pjx.46.2021.04.17.07.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 07:42:44 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] gimp: Disable vector icon generation on mips/glibc too
Date: Sat, 17 Apr 2021 07:42:42 -0700
Message-Id: <20210417144242.2068422-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

it uses qemu during builds and ends up with multiple crashes

make[3]: *** [Makefile:2395: 24/media-optical.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-center.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-channel-blue.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-channel.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gtk-select-color.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-business-card.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-channel-gray.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/media-floppy.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/gimp-channel-alpha.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/dialog-information.svg] Segmentation fault (core dumped)
make[3]: *** [Makefile:2395: 24/document-print.svg] Segmentation fault (core dumped)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
index aa5112add6..a5e6990580 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.22.bb
@@ -53,7 +53,7 @@ EXTRA_OECONF = "--disable-python \
                 --disable-check-update \
                 --without-wmf"
 
-EXTRA_OECONF_append_libc-musl_mipsarch = " --disable-vector-icons"
+EXTRA_OECONF_append_mipsarch = " --disable-vector-icons"
 EXTRA_OECONF_append_libc-musl_riscv32 = " --disable-vector-icons"
 EXTRA_OECONF_append_arm = " --disable-vector-icons"
 
-- 
2.31.1

