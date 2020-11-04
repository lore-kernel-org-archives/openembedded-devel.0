Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web10.16336.1604512606525467511
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 09:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WLnWZ8yE;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id 10so17927392pfp.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2020 09:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8w1zaF2Bi3r578ZRmZtCmhj8hfvrmGZb2xJIVgrOP/U=;
        b=WLnWZ8yEN8useNlQh+JqfAL1fWyvM6D/mhgEJIKpjBccXAGXSAU9L8NamrfV8qsxW9
         w9TxdZ9+ydHPFi/GzNx8dyb6QJPvJwJXPBKTDUqz8vsHHWX3cgBSdSPcaw1LUetXbaze
         QSS98vs8Obt/na8V9ccvRnaDa3HaF1T4U5oN4ly59YezndNP7rdev0W+tjY4FILAR0mg
         xTvI77HFS7fWd2NuMnVOuWN5BeW4hPjCBNPFAxyjfEeLBgwjc99g1MRprXeEeR9+32qz
         yG6WeYmA4tm3NR4+dw883b/BcoVA8dRaNxTaIfw5p5RhJPHOfMKH3iIZZFeawWyNV6C+
         iy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8w1zaF2Bi3r578ZRmZtCmhj8hfvrmGZb2xJIVgrOP/U=;
        b=MV9Q59slnkw5lhBe5yU26aQ5w4YPctRmHVHdbugGRCfpn7mmFc9bVwf68J25VslF00
         K0OuSpf9LyJM4xKltpigTQR90Byt7BJB5z/1wRlm+dyChPhqdmVCSrdglJDH/xXHjGjc
         oTy/EU8UqJcihdebHUfFrKhwXW9KX5i66+Klkvd6VJr1hurUjZT21V56pei6MlJ84Lj1
         f8uy+fD/1HVxeQRd1HW7ZZ9zIvu3EC9yOXQzYktIVUNX2fIU7/1Xe/i/g9pZf6vPeTWE
         Cupd9vIxkYgPN7UOtm/6S8EUr31yn9IWT46ZONUDXQSDAyoazuZrBcIq96JCJNSp+pks
         vNWA==
X-Gm-Message-State: AOAM532Md4YNsmiuBsdCggGjA5gsek2U0AQHpgab6lNELffIVC2kpFU5
	nfOhOD9gIG8wviYgofB4tsBBeH7qloTTgA==
X-Google-Smtp-Source: ABdhPJzxeOCedHgBUBnPXr8P7374CqPXoC7JDhovjWVW6oF2SAjIWK9SAXOXguD2k8OBwmIjwOsE/w==
X-Received: by 2002:a17:90a:5416:: with SMTP id z22mr5209187pjh.235.1604512605693;
        Wed, 04 Nov 2020 09:56:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id g16sm2945517pgm.38.2020.11.04.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 09:56:45 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] kernel-selftest: Disable vm packageconfig for riscv
Date: Wed,  4 Nov 2020 09:56:42 -0800
Message-Id: <20201104175642.191043-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it now needs libhugetlbfs which is not ported to riscv yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 2b5ebcc271..7c36dfc605 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -27,6 +27,10 @@ PACKAGECONFIG_remove_arm = "bpf vm"
 # vm tests need libhugetlbfs starting 5.8+ (https://lkml.org/lkml/2020/4/22/1654)
 PACKAGECONFIG_remove_qemumips = "bpf vm"
 
+# riscv does not support libhugetlbfs yet
+PACKAGECONFIG_remove_riscv64 = "vm"
+PACKAGECONFIG_remove_riscv32 = "vm"
+
 PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
 PACKAGECONFIG[firmware] = ",,libcap, bash"
 PACKAGECONFIG[vm] = ",,libcap libhugetlbfs,libgcc bash"
-- 
2.29.2

