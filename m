Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0C3C83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 11:08:26 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.8303.1753254997913052089
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jul 2025 00:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@munisense.com header.s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e header.b=Cvdyec7b;
 spf=pass (domain: munisense.com, ip: 209.85.208.42, mailfrom: gijs.peskens@munisense.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so12815068a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 00:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=munisense.com; s=c12e0d22-ac12-44f1-aa93-b49ab5265a0e; t=1753254995; x=1753859795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P+5+EkWlUu9ZkL4/tH5QJVTDvxLCGGZHK4s27uLwxN4=;
        b=Cvdyec7bo/70V5B36WesCySBkEWBvC8aimGnhOC0NtnGzBugIVwBkAssAgyI+EDiH5
         anLmyayi7C0WuUI1dewmbRMufNbcBUa9DSBPzFoNchzsBePfUPkshN7m7ThtSX8jhAWu
         BDlNO7gJGbKCQaNc7Czm41MnfLfBHuMG+qaW+jHH9+o8Sj8ORu3zxkJIMsE+VBPGOUEy
         uFY0QqCFTdgnGPFloXUZuRr62xquBtwxZYCTJHszGy0wO0JyIoiALVUI5QAa+5q6a5ty
         jXtNMi7Z+4TXhRKUFppcQU3Npq/OiEIvXICPY8Eju8NIi8MrfIwORrQ1hIUX/Jsy39DZ
         xURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753254995; x=1753859795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+5+EkWlUu9ZkL4/tH5QJVTDvxLCGGZHK4s27uLwxN4=;
        b=cIGGLJFLBBKg+niqcIb/Yn1e3ecGWMiEqJDrRjonyS8JNo7+n+NeCDrWwGwJEKJzER
         NVDaftqhuzH9EgGwIPNaKcPm4IIP37wCgndcwqWldTvLn4Hzp1dA13gF1Ki8h3MyPIgV
         YNzBVFueite3LCg8ulSIXnSen52WNo5wJMuClAFA7+F6PunYHFqZcOg5yCS+p/NYVk5E
         HYI95Ey+f2C7YBlh2tYzE82CFG1WMqGfqY9Xin4BpFIlvcdFo/6wJoEkZhzczETEYfkc
         4y8Xd39qL+ch7EjxmqMuV05GFhhTWZtDKE9hxcPpOQJjgdmNliHK/4dKqzchKc65IGVc
         jgIA==
X-Gm-Message-State: AOJu0Yxh77XQQpJX083Ij3u/Y1+f/EDTSBL3xJke5hnXj6XGKmeg7tg7
	6e5Hd4t4TNJ2ajBikgbGijhz9rfKjMpOwPRvrR6N3lEQEnwM+hl9rvsEj5lsDsEwiAUt5u4FhuJ
	8Dare
X-Gm-Gg: ASbGncu4rklBzuec4VNyYHMcBxfrq17Dnf6sgDoyj/WDdbEPrJ0sWM9JZIMTd2JOblS
	la2Qo2w44g+3b76sN/Pu3prmVYRGaNsys2R5gQUxtAO5+k8MTjkH7YpfT6alIxHo/g5y2L2qx58
	0kZhagFjuBPe22T0Ys/6oWa8ziljrhpyZyVlD6sbPUSzGjfWNZ85W9FNhCj84qrRH46B/KTMsXl
	wrFPSa4FTEalbNbq9yVEpIdgJLpxQbNQnsh+YltznV94RIyZPcxH8CcClVmMvXl36H4A3mCpzUX
	2tAUXiEgf5ubWZCIqCEGLwOFG8OwjUppSYBsG31XRNdTU/Sq8H198GiNqgHLAB/FQ1V5AHffhYI
	SxhI982MWrjrUuJDTNZFZuHjnQtYu3eI8VPT2jVdyRU3r8N2OsXqAeHaVEUWBSiT3VRwmMoC7dR
	H3kQulwCJOSS8wiF6KPhIg5sQ=
X-Google-Smtp-Source: AGHT+IFwOGI/eV0xAcBzxZWDqBsY8DGPzSkUcyMISJXl4bnzpVX5+GBV84QnEdddSsQZrMmNL4l3rw==
X-Received: by 2002:a05:6402:367:b0:5fc:9979:78f7 with SMTP id 4fb4d7f45d1cf-6149b44e5d1mr1173168a12.14.1753254542637;
        Wed, 23 Jul 2025 00:09:02 -0700 (PDT)
Received: from gijs-peskens-ThinkPad-E16-Gen-2.office.munisense.net ([2a00:1708:3ba6:500:3a9f:132d:ee6f:5a41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6133807166dsm3036213a12.58.2025.07.23.00.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 00:09:02 -0700 (PDT)
From: Gijs Peskens <gijs.peskens@munisense.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gijs Peskens <gijs@peskens.net>
Subject: [meta-oe][PATCH] php: fix removal of --with-zlib-dir configure option
Date: Wed, 23 Jul 2025 09:08:52 +0200
Message-ID: <20250723070852.381343-1-gijs.peskens@munisense.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Jul 2025 11:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118715

From: Gijs Peskens <gijs@peskens.net>

---
 meta-oe/recipes-devtools/php/php_8.4.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.10.bb b/meta-oe/recipes-devtools/php/php_8.4.10.bb
index 4d598949a..4ed5d1e4f 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.10.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.10.bb
@@ -110,7 +110,7 @@ PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_LIBDIR}/.. \
                           ,--without-sqlite3 --without-pdo-sqlite \
                           ,sqlite3"
 PACKAGECONFIG[valgrind] = "--with-valgrind=${STAGING_DIR_TARGET}/usr,--with-valgrind=no,valgrind"
-PACKAGECONFIG[zip] = "--with-zip --with-zlib-dir=${STAGING_EXECPREFIXDIR},,libzip"
+PACKAGECONFIG[zip] = "--with-zip,,libzip"
 
 export HOSTCC = "${BUILD_CC}"
 export PHP_NATIVE_DIR = "${STAGING_BINDIR_NATIVE}"
-- 
2.43.0


