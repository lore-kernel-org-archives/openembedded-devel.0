Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web10.8130.1603764960212038821
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2020 19:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dHY7iSCf;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id j18so25268pfa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2020 19:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cPLeJRzlfdK/h/5+0gKRl4yPKCsZqbHovY6n/NyQZA4=;
        b=dHY7iSCfUAFFDld0qLngIJWWfiy9a52cg3v8GIXfuouSSnNH1WWHEWJBnnNQreuLx4
         13TI7BySFkMTIGJ+8Jy3o3Pn/54XQRcxuQK1GIfztw3iZcyi+i44w1McuTbSkwBKbMQk
         yltibCYJxPJirlmob4Od7Q/Q5dhqccBURFrubXIuIhWMlQ9Yl8CNHe/gLUrwj9eSZROI
         a8TSOlPxNaKeWKUkOGKx4TMzrI5QKyJOeGtKi0H/c+4N5U3b0lEmvK+GcXbph+ag1Jj0
         m5fWXVoKctxeIcoolVzM3D4cC4Lz0eJnoG2/XQ1S0EhBMWH5Miwz3KAipVDOSqMSHTmj
         ETew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cPLeJRzlfdK/h/5+0gKRl4yPKCsZqbHovY6n/NyQZA4=;
        b=mYKc4TMUklNr83jRDNTGg7Rf1T5ITemqosoIhYawlEz4Oc2kFkT5d+E/NuxranJwoE
         J2Ks0j3QZXQ3625RYsUGPTN3Kr7r59IEH9R8dFNz1BCEaXvGThJhCXIHO8V84rUfrcjz
         A3f2BUyj1gH2VQWssVUXFdxjgJPqkRXvbA+SZlZYLcYmbLKc19CW9UmvXcGaLLDdAvfZ
         d3z2vpvXH9nr/U4rXPuXc5pheMWy9nhVPHJam67qvK4R22J2cWFWCVWjjrx0UZmGUvlV
         O/6ZR0I+cbg6gcol0OCchALRUIhuyh/kuvA0FBs3wnex2tOlpHv51VM61HkBHB1hqzHP
         sQjA==
X-Gm-Message-State: AOAM533/VT308YNUVKxWlvva3YoBWhCxppGrrGD+2dOpw6ZxeZzpA8lu
	vbs+X1PC6nw4qAgrUTmRT17UPI8jGrWgnw==
X-Google-Smtp-Source: ABdhPJxJzd0lSUB2x0HerS6bFh/ZW/S8tkWRTr1W6+WSZWXKB+M5oBY+mTmSzizsK426OfPXPOHVag==
X-Received: by 2002:a63:5821:: with SMTP id m33mr15680934pgb.16.1603764959286;
        Mon, 26 Oct 2020 19:15:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id b1sm70406pjd.11.2020.10.26.19.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 19:15:58 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Do not use lld on riscv32
Date: Mon, 26 Oct 2020 19:15:56 -0700
Message-Id: <20201027021556.344254-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes errors like
|     riscv32-yoe-linux-ld.lld: error: init.c:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
|     riscv32-yoe-linux-ld.lld: error: testCCompiler.c:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 5127e11d81..9113fa67ad 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -55,6 +55,7 @@ EXTRA_OECMAKE += " \
     "
 EXTRA_OECMAKE_append_toolchain-clang = " -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib"
 LDFLAGS_append_toolchain-clang = " -fuse-ld=lld"
+LDFLAGS_remove_riscv32 = "-fuse-ld=lld"
 
 # There are endian issues when communicating with the x86 nifi on the the mips and the ppc machines.
 COMPATIBLE_MACHINE_mips = "(!.*mips).*"
-- 
2.29.1

