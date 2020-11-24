Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web08.45406.1606179121050810572
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 16:52:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JTvXDdc4;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id w4so15856073pgg.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 16:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f3KdA6CivuN/1cyPrkHNhOa24NABg2tSM1PP6xInC7s=;
        b=JTvXDdc4/5bIRD1zEqQws41sghKjUKB0rHt96vveYJ3WNeiJKRa7lVX455Yq4l/9fv
         d0QhUUop9POYKkXSIpqU1DlAQj2n81CEIW3w1wwJN3F2/otCLANRsRHOaw0NS6qLEjDN
         IQLfMojXjeC8onfJBPOV/U/wPhYnUDd7Wh5mJhwom3Ar6T00Vn4ZFnCvXuc2Xd8gHxP/
         YTszWclNu+fjWwyeqn1TVmCg0UCDoAAZeA1sGeBFO3/PDRj5PsNOvBx43P6TShSj8Oe1
         gWIdmAI2QQN8sVZvMY4CBEpfPfU0921ryjq1Qvog2dLFiY5AllWUO08GaCYK2aaqmrAD
         9B4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f3KdA6CivuN/1cyPrkHNhOa24NABg2tSM1PP6xInC7s=;
        b=G3UkTVXlEHPLw7PBCe1Xo1z8+6PPyGfqnZ7NoJWXRefqQYSK6SF6KLsyZPWMGZPyAK
         JE1SWhjF8vKX26uZWJ4YLBOTv7kLj0+ocO+l6a2O1KOOUXQwDqlD/ukO/QiR++jWcG3+
         LvDM9TGg7XKEpbTknE3fqe7x2yOZqI2OOjJ9pPmfSvZPEfT2tk/hgRTroQnnI+ibB/Em
         AOJMMl2kCgxOlpubr5kINt0KyZ4TSRgwPw32HsVGpA6cDa5jCmZPmeYdx0kkCK1PjBI6
         wptqNQQ5ULIvm7C3gOk1QTOOopWU6PFS06xpQ7802BI/r1434KqN27fUicPJ4p+o5+iY
         bBEg==
X-Gm-Message-State: AOAM532vlKDOaPusOWorbAUufI3ry5ceqMFT2cIe5VihfOQU5hYTegJ/
	3A78k0QBfEv8jrdvZu0WDFGLs04XHioxpA==
X-Google-Smtp-Source: ABdhPJzvSr4jbvQJjFor7L4pFsI0S4f7Vrw+3yeyRcq4K1gGpndcxFS4z5sNhoa4OPQVBZPTyjIk3g==
X-Received: by 2002:a62:1455:0:b029:18b:83a2:768b with SMTP id 82-20020a6214550000b029018b83a2768bmr1819472pfu.3.1606179120159;
        Mon, 23 Nov 2020 16:52:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::ed1a])
        by smtp.gmail.com with ESMTPSA id h16sm12758120pfo.185.2020.11.23.16.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 16:51:59 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Exclude heaptrack for rv32/rv64
Date: Mon, 23 Nov 2020 16:51:56 -0800
Message-Id: <20201124005156.2021452-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Sinan Kaya <okaya@kernel.org>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 3f476d0518..ccbd01aaf0 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -283,7 +283,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     xerces-c-samples \
     xmlrpc-c \
     yasm \
-    json-schema-validator \    
+    json-schema-validator \
 "
 RDEPENDS_packagegroup-meta-oe-devtools_append_x86 = " cpuid msr-tools pmtools"
 RDEPENDS_packagegroup-meta-oe-devtools_append_x86-64 = " cpuid msr-tools pcimem pmtools"
@@ -299,8 +299,8 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "luajit nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad lshw luajit uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools lshw luajit uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools lshw luajit uftrace"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad concurrencykit lshw ltrace luajit nodejs ply uftrace"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad concurrencykit lshw ltrace luajit nodejs ply uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 = "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp", d)} concurrencykit"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_x86-64 = "${@bb.utils.contains("TUNE_FEATURES", "corei7", "", "abseil-cpp", d)}"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_x86 = "ply"
@@ -951,4 +951,3 @@ RDEPENDS_packagegroup-meta-oe-fortran-packages = "\
 # rsyslog conflicts with syslog-ng so its not included here
 
 EXCLUDE_FROM_WORLD = "1"
-
-- 
2.29.2

