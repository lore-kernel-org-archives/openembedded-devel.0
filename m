Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.9672.1597214241693058637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 23:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b1BzrBKV;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id l60so618773pjb.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Aug 2020 23:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NaN+DCpYcg+0pyBz+cCMikUMhJhN7fdgHTfVqmhKr/A=;
        b=b1BzrBKVLSg8kQJWdgfq0g9cNDXwH+LgFEg7M+/fJ+4oAHACqv6adCqNUzVquxSiVx
         n0HsaARsYl2tvAzDzd86DzjL7maSzpP0ns6SV5+Zj5ba1v2pq28XCVulHgqKEt+YpC7F
         vJ/TuJ2QRjEWy0BmWZqNuiw4nLZYSV++Eh9/KXdB3Ko6uOyL1j6IhszHNnkAOQTgSKdC
         LEMtaTcgSa4R1UwlA9m/Bbvv2q+eKEryzyqjur47wCU9vJ57PnfsKWWBWg4yH3bVrKm6
         47wfbgI3qRqb5JbRMil78RJSo3xijNMNW5g71YZVDHbUKXIlkin6UoKI4dxt2/zXdcMJ
         c5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NaN+DCpYcg+0pyBz+cCMikUMhJhN7fdgHTfVqmhKr/A=;
        b=UzHl6qWIvqpccgCR8kk0eAPqjs0KNE1l9yA/TbTybdmS2v9F+OVpldMWKk0ICquPkC
         kQ065XYKLIfgCXBa8baTJYnir0CvVCIvrjQ8a6YScTrTYgwwCtGH6ySeeW/YUS3NFIdd
         RwKvKp5RwWNgmhaWWUZfsTVqZL+2nxfEH2wN2VySBYnv7vfVdM+olSFhEDy//tXpfjqy
         3yrU3ytzlHvKRLKw3GIimQTvGTgBcf0xUoei9lA7mliDGQGhtYfD/WxJcTmIfy0x8KND
         0ITkltFOOgcMcPX5WxKG/IcGjE9JjZkWUhk9CB17Gr+bX9ujSws1a/nJbsyxPUZ0sBqe
         TsGA==
X-Gm-Message-State: AOAM530QkADC6BBk6O7YzKmBsp/DqZ14dEv2xs7jI+tSHguMAXsIiWj2
	X/OmvhSz6voo3R3Fu+xO6yDQ1Wt28f4=
X-Google-Smtp-Source: ABdhPJztF0a1SuKezxEQjFsWtkAcsB/MFXef4h+to1FH1AGVgDSuy+yL/YWu6S98be25cnOfwo5aMg==
X-Received: by 2002:a17:90a:448e:: with SMTP id t14mr4536923pjg.59.1597214240937;
        Tue, 11 Aug 2020 23:37:20 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id s67sm1187969pfs.117.2020.08.11.23.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:37:20 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 7/9] freeglut: Use -fcommon always
Date: Tue, 11 Aug 2020 23:37:09 -0700
Message-Id: <20200812063711.2758315-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063711.2758315-1-raj.khem@gmail.com>
References: <20200812063711.2758315-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This package does not compile with -fno-common yet

errors out like
| /mnt/b/yoe/master/build/tmp/work/armv7vet2hf-neon-yoe-linux-musleabi/freeglut/3.2.1-r0/recipe-sysroot-native/usr/bin/arm-yoe-linux-musleabi/arm-yoe-linux-musleabi-ld: CMakeFiles/freeglut.dir/src/fg_gl2.c.o:/usr/src/debug/freeglut/3.2.1-
r0/freeglut-3.2.1/src/fg_gl2.h:72: multiple definition of `fghBindBuffer'; CMakeFiles/freeglut.dir/src/fg_geometry.c.o:/usr/src/debug/freeglut/3.2.1-r0/freeglut-3.2.1/src/fg_gl2.h:72: first defined here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
index 851641c083..6ef9f74c70 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.2.1.bb
@@ -12,6 +12,9 @@ inherit cmake features_check
 # depends on virtual/libx11, virtual/libgl
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
+# Do not use -fno-common, check back when upgrading to new version it might not be needed
+CFLAGS += "-fcommon"
+
 PROVIDES += "mesa-glut"
 
 DEPENDS = "virtual/libx11 libxmu libxi virtual/libgl libglu libxrandr"
-- 
2.28.0

