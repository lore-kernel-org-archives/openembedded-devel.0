Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.5694.1618298666203562675
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Apr 2021 00:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q8b0fLiv;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id a85so10417413pfa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Apr 2021 00:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RrVIx/HUNI9Ig4Vwz0teklZB8m5R2ka2pPq0ma3MiLY=;
        b=Q8b0fLivRjWyEm3fRpiRU6RoyBPgFhF0lH5nL4epSALmHD/8CqHE+OkU0c/E2uv9DT
         o2AvlZb9/TUFfDUrL3M7lrMD2ShNg+fy8uDmeSa4zJHiuTtUyZvHgLZQKzivET+ui/+l
         jjl4Kmg1yctOn8oqDBa7MCcP5qbVpRHJviN3tLwXPo6tuIoLQfh4yqxMB7UHuvkarQ1F
         z363BDSpIw6ihLOguBaoPVtOJ1q5EZyxe25dv0+1goxIhJ2d+5t02i6upLeluvGODTwD
         N2NeppSjVDBxqh4r1DsyrWl0MngcuMpt+bveahSFSW9vlL1B3OvrPNMFuT1Hl/WGO21Z
         sYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RrVIx/HUNI9Ig4Vwz0teklZB8m5R2ka2pPq0ma3MiLY=;
        b=ub9P649kGWUvE3+Pxr4pHhc3AG2oV8rKQX50zw3l1bCLIAI2rBuCLMy8aTXh3fotp1
         98U6mwOouub1aTpM+zkzsO9XsKs/1YhuMSu7GV2e6l9ZQ9ILgyuFKwA223UYz9VcUduj
         dfgmItUQziBQk8uje3wunBGHAKhWGoZ4m5DTl2vkwAnxFuZEHW012oE7h/WeNP+yrmYV
         yPYURJt/5NpYxq4nOuC8LnQhRMdCKKgsxvqvqZ6b47YlDr6koVkT4MMT8Zgl7/3DB+o2
         WQa2T1Vyb0NjTyWD0l/7M2Y1OaCTdy/0AHNJ3QOckLDFHZ9BfKV0nE/9Ish6Ythl5373
         4JAw==
X-Gm-Message-State: AOAM533U1J6H6MKxBRaWYSCWsSa0QLhFTcPBAqxHzWkCjSo3gS1VW5QS
	0q9z4PopSyzG4SRVkdbJLXyCVQwBaigaHQ==
X-Google-Smtp-Source: ABdhPJwYEEA2wwINY9fG9Fv7felcPZp39PbahXea5XrxnBiWj24gjKP3Jxo5DKDW0LmcaBbaUB3xKw==
X-Received: by 2002:aa7:800a:0:b029:250:c8c5:64b3 with SMTP id j10-20020aa7800a0000b0290250c8c564b3mr1445157pfi.23.1618298665469;
        Tue, 13 Apr 2021 00:24:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id t24sm13697561pgi.30.2021.04.13.00.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 00:24:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>
Subject: [meta-oe][PATCH] tbb: Fix build with musl
Date: Tue, 13 Apr 2021 00:24:22 -0700
Message-Id: <20210413072422.2407953-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Need to link libucontext on musl
Additionally, mips also needs libatomic

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Naveen Saini <naveen.kumar.saini@intel.com>
---
 meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
index d0e2311402..5d11d0461c 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
@@ -6,6 +6,9 @@ DESCRIPTION = "Parallelism library for C++ - runtime files \
 HOMEPAGE = "https://software.intel.com/en-us/tbb"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=86d3f3a95c324c9479bd8986968f4327"
+
+DEPENDS_append_libc-musl = " libucontext"
+
 BRANCH = "onetbb_2021"
 SRCREV = "2dba2072869a189b9fdab3ffa431d3ea49059a19"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
@@ -33,3 +36,10 @@ EXTRA_OECMAKE += " \
 # ...
 # | make[1]: *** [concurrent_queue.o] Error 1
 ARM_INSTRUCTION_SET = "arm"
+
+ASNEEDED = ""
+
+LDFLAGS_append_libc-musl_mips = " -latomic"
+LDFLAGS_append_libc-musl_mipsel = " -latomic"
+
+LDFLAGS_append_libc-musl = " -lucontext"
-- 
2.31.1

