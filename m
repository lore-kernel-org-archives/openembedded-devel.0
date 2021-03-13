Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.234.1615616023370726332
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 22:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JSZK4vM+;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id q5so4590372pgk.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Mar 2021 22:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y6miza6RODAVTZGBdkDmbtRJzBsmIHTJZIhzKJy5APs=;
        b=JSZK4vM+gCtxkcbQLhmk7J8l5nYEd7ROATvWPNs76zHHQTpsnaR/AieVN1wcoJbYd8
         aN3kqtya+s+QDutfgfYasAUXi50DGtVSZW2Z+22qaW62z81n/SP63tNBJHH908IXOI5m
         jWX4kUvVlQg9y5bbbq18k1SGAn9CP2G11v7irnf0k/fPT8oByVp4HpPPOHF2+g2pw+Il
         8wls6Y+goIBsIBofREwexLViuoGbA+4nqPMSfV4xnYXevpiQ5E8Rp613owd38Uinnt2P
         2DSl33T1FYo+Z/voocpMZgnvhdu/LDdpfkJKswzYMxc+yrQZpGKaU5HmahoXVV3fq5u6
         Y4pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y6miza6RODAVTZGBdkDmbtRJzBsmIHTJZIhzKJy5APs=;
        b=qc721qTPSkEPco82MIejJ2jDf8qL1MtBlSesSrzJyVwWRsnqlgDITLpZmak+zblB4A
         7VjGsE1BGZ6ZHSTUTI2ro1Iiy0BwYSxVa1jhpjwYFmeGBM8qFlgxEWB6zpKaqI1bxV1I
         eJmx9KvnhLYZ7soRvLjfQWcmnv0yavlwFR2IpBoDLCOd5g4Vp10tRcEJFlF6WSr+m4ah
         yRbQkxElab0Tw3B0CIiUP32mubIl4mLO4KnCriIm70nGLOfYyf85S19WGTlgfaik9MIY
         LSDiJLKobw2CH/E99s5d4hnjEjXH1qqAgVnmKpGZmEx93KmcZyvtDMLwiwe5QYqcYdSE
         4orQ==
X-Gm-Message-State: AOAM530wMHmbf+tpvU79ReXF3SHlCZzArWxIFQlJE5dkeIBmGbay+JCx
	VV5W+sVaLz8ptcPvkIsx7HKHzAmNn1qS9Q==
X-Google-Smtp-Source: ABdhPJxwsheP/ylbTf067TYA8jXnslhKsEtocPHNCJc9t1TUoJ0I6ovuAr4rNj+u3fYW1fh5jNwcdw==
X-Received: by 2002:a63:5525:: with SMTP id j37mr15136672pgb.191.1615616022732;
        Fri, 12 Mar 2021 22:13:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id 9sm6944908pgy.79.2021.03.12.22.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 22:13:42 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] ply: Disable on ppc64
Date: Fri, 12 Mar 2021 22:13:38 -0800
Message-Id: <20210313061338.2624068-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210313061338.2624068-1-raj.khem@gmail.com>
References: <20210313061338.2624068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Port does not exist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
 meta-oe/recipes-devtools/ply/ply_git.bb                    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 03c509a2f9..b5f50f2c4c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -300,8 +300,8 @@ RDEPENDS_packagegroup-meta-oe-devtools_remove_mipsarch = "concurrencykit lshw pl
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64 = "luajit nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_mips64el = "luajit nodejs"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc = "android-tools breakpad lshw luajit uftrace"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools lshw luajit uftrace"
-RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools lshw luajit uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64 = "android-tools lshw luajit ply uftrace"
+RDEPENDS_packagegroup-meta-oe-devtools_remove_powerpc64le = "android-tools lshw luajit ply uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv64 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_riscv32 = "breakpad concurrencykit heaptrack lshw ltrace luajit nodejs ply uftrace"
 RDEPENDS_packagegroup-meta-oe-devtools_remove_aarch64 = "${@bb.utils.contains("TUNE_FEATURES", "crypto", "", "abseil-cpp", d)} concurrencykit"
diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
index bf91c7b853..b1327efebf 100644
--- a/meta-oe/recipes-devtools/ply/ply_git.bb
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -14,4 +14,4 @@ S = "${WORKDIR}/git"
 
 inherit autotools-brokensep
 
-COMPATIBLE_HOST = "(x86_64.*|aarch64.*|arm.*|powerpc.*)-linux"
+COMPATIBLE_HOST = "(x86_64.*|aarch64.*|arm.*|powerpc)-linux"
-- 
2.30.2

