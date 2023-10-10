Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF83CD8CB1
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 18:52:43 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.2395.1696963961978992690
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 11:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M1jTvOxr;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68fb85afef4so4528386b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 11:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696963961; x=1697568761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZ/oC6HpvBXcozH9t1uxKiwFDB7ODyJoogEol/f5MXE=;
        b=M1jTvOxr3BfiyVBagaQZY/y5V6K5woLUTruptWY1B309IuIQySAQDTm+wp8sxg4dRr
         6PCOmesGqgSpi4f32W46EbP1L5fgRpBcF79sqwzYc8X+EdPVy0M+qBaamreWWEuRPr3n
         9NVD/LkkYH8eC5WLlhafLsEv608ZeXsmAS6O4HfW+fnQMFAoSRbmiGn+ADmy2ZgYXG9r
         Vc+OvMcVlidOlpefbWCLKKZjCOr3JcLZge8uM0wJsyiFF7vKWrAnC2o5j+UHWZY54+8l
         xWlz2zHU1sTBkDdrWDpRcETZ0G+k58NpQ7t/sSzu1qgjhd05Lz9ruaJL0OPIcUr6TzkA
         KMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696963961; x=1697568761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZ/oC6HpvBXcozH9t1uxKiwFDB7ODyJoogEol/f5MXE=;
        b=aDqNbwi2Km8OcnOWle1n2wHy5ZUSC34I+ywJK37ts0bnq9idwnu3smygRk8JGswnMc
         y8xDE1RcAxLWsA5Vk3rp3GG/kV7G+8LUrjmhe7DL6iwVD9eo/fsB70HM+0A2IJauP3sa
         c5stfdvv0LVKYKyhn4qTMXf/FyeuzFUjoOCUZa71g05vbKamuc6VwsbjjYczBhrSxpCx
         ppq/vl5P06OJp/HD/qI9TQBYaGt0H/QDm6pi0uM492be4+DgO/PnSN+oQwYsfmqgmFtD
         BuNBPG+RusA4sNi0nsNOlYoOzZOaD9UEp6W6e2xiQ3cODsPFqjYENplmreclEulhrDjq
         7WFg==
X-Gm-Message-State: AOJu0YzwVnYvGv6vU+Sp1pG8OiNzLnZI1Se41PInhhotmRiTyncumWWC
	f41ha8bxy61pwTI1naQcTd/65sZ/m7VSnw==
X-Google-Smtp-Source: AGHT+IH0//PXK7LdO2xuAHMeF4jRdOPU1vTb+hJiuOH3tPI+M/6gAeK2UZ+SWc6o0HardttbrjGmwQ==
X-Received: by 2002:aa7:88ce:0:b0:690:b8b1:7b9e with SMTP id k14-20020aa788ce000000b00690b8b17b9emr16249897pff.0.1696963960959;
        Tue, 10 Oct 2023 11:52:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id a21-20020a62e215000000b0069353ac3d3esm8534886pfi.38.2023.10.10.11.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 11:52:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] kernel-selftest: Copy the .config from kernel build
Date: Tue, 10 Oct 2023 11:52:37 -0700
Message-ID: <20231010185238.2842132-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 18:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105414

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index e4eba5f954..2e5680d775 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -83,7 +83,7 @@ either install it and add it to HOSTTOOLS, or add clang-native from meta-clang t
     fi
     fi
     mkdir -p ${S}/include/config ${S}/bits
-    touch ${S}/include/config/auto.conf
+    install -Dm 0644 ${STAGING_KERNEL_BUILDDIR}/.config ${S}/include/config/auto.conf
     if [ "${SITEINFO_BITS}" != "32" ]; then
         for f in long-double endianness floatn struct_rwlock; do
             cp ${RECIPE_SYSROOT}${includedir}/bits/$f-64.h ${S}/bits/$f-32.h
-- 
2.42.0


