Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web09.19541.1604258400955532200
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2020 11:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AoxzzOyK;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id t14so8917156pgg.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2020 11:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4h5HRD8idGRPOioMiPeF2Q5eI7eNZFRwOBRdU+PD9Pg=;
        b=AoxzzOyKdn1ec2AUQWacngX12sg1IIvXEh8V7wNiY88FdLzer0KclOg4AZlUOm0B1G
         njB0mZck1112i5k/GJ5pTukhDN6p0HqiDFk7Jm0ivqeXoZiXaULDcacHifgZa5OAJ1jL
         soGbjmqhSto9ohw27K9UHKTjL1ZNBuuLZ5+Bmc0fTbe5ZOaUgIgbhbQVe8jr+0L2+u3b
         uKI5/sC+ztRzyGOM70ROkPbMRgmh8oMaOgFsx4i/BNYQpBIW629gHRcJ9fb+xRJjtisV
         ZG++mq4kx5uOVJB8jbvOimPBXuKfgUc3c4XzmYd9vyXVuyY80QAOpAzESh0azE3EJ2HS
         D7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4h5HRD8idGRPOioMiPeF2Q5eI7eNZFRwOBRdU+PD9Pg=;
        b=rEV9nIl3KsTMAdvMHEHgM/1bSpit0vBs1fm0YUEsENmvJW/5K77rID97ELzGpQ9YLp
         d47HNZ7/Tczl8pkL3nETQuCWhKRisDxqkzJ2JWSi9hTPLRCbmYaG917b2iLxmJD1fgOR
         Q89nzPZMW2l0wGE8Vhlfs1NnkAsznctm7bUcHM3T18hjz5mZw2ErJm9yKJEtmjkoDkI5
         D0/JcbVe6Oj4EDgrKhi+CLWchN2SoB4ygIIdsAPicZcVPE1gC+Yuumr5cSjxoOPJlHMz
         GzzHGqhS2WENUfavXNrTCKx9ot6kmgF+WHMgCTX0FW2/anpVmuKjpRFcUnlzi1CMi2bd
         XoNg==
X-Gm-Message-State: AOAM532L5B8AQdSEt8/AiaayQWlbD1ZZI6wdLC7nTZI+mAyuU2Uzgr0A
	ifhhRUjTTsLW1BVIVNFWmIi3lRu02geUjw==
X-Google-Smtp-Source: ABdhPJw+PKJPNQVF311LDyIE7XWhBg/+xp761avyfPvvN1fnzJzEn+a1sTwC7NvaoiMLt0+yNVWyBg==
X-Received: by 2002:a62:ee06:0:b029:164:20d:183b with SMTP id e6-20020a62ee060000b0290164020d183bmr18733592pfi.4.1604258400034;
        Sun, 01 Nov 2020 11:20:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4874])
        by smtp.gmail.com with ESMTPSA id g15sm10532341pgi.89.2020.11.01.11.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 11:19:59 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] minifi-cpp: Fix build with riscv64/clang
Date: Sun,  1 Nov 2020 11:19:57 -0800
Message-Id: <20201101191957.2112812-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not use lld linker on risc64, since it errors out
riscv64-yoe-linux-ld.lld: error: init.c:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
index 9b66c48e37..3815220cb3 100644
--- a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
+++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
@@ -58,7 +58,11 @@ EXTRA_OECMAKE += " \
     "
 EXTRA_OECMAKE_append_toolchain-clang = " -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib"
 LDFLAGS_append_toolchain-clang = " -fuse-ld=lld"
+
+# RV lld errors out:
+# riscv64-yoe-linux-ld.lld: error: init.c:(.text+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax
 LDFLAGS_remove_riscv32 = "-fuse-ld=lld"
+LDFLAGS_remove_riscv64 = "-fuse-ld=lld"
 
 # There are endian issues when communicating with the x86 nifi on the the mips and the ppc machines.
 COMPATIBLE_MACHINE_mips = "(!.*mips).*"
-- 
2.29.2

