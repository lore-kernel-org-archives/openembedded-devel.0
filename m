Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA78DC433F5
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 02:37:02 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.14762.1647743822289548022
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 19:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z3CMyOWm;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so5292180pjo.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Mar 2022 19:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0m/4+RZcQ7PD0CXhnJRfp0ipQIwLruz3ULdUq5R86Ms=;
        b=Z3CMyOWm4iOTlxVgkxty+LuPtjI64em9mgst686Ssn/vTgTiQMecqIg6FYX8oMJIqM
         Yu/klUNwkX5d/VqX6QnE6526nebAVRP8BAd6Wh4TSvpy3/hE1HoqYlbwfGZx+TSgAKVx
         jd2QJWHiZZ3WRlM8Vp72L1rLiTEs/CqGl2Ycm1en2KBIEweJLIOj20858NjI4NuXX6aS
         Tt8tWa41BW0CP5S607ORiO6FhCUSkkorDjSxOEOW6Al7LO3yN89tT+bAVs8nI30PF004
         fZ+d0BLyWQii6FjozHsZHkMyR4saoS2iEzdU0clYo7WbCcp03vL2gzBoWYmyo9HaE7yi
         x70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0m/4+RZcQ7PD0CXhnJRfp0ipQIwLruz3ULdUq5R86Ms=;
        b=ivYunNjsLI7kz4LIgKP0mEJazd1D9DDYNdBTXowA2OgaMQvAcMNWTSdyWlaRD+R1RT
         TGbkKb4EjImNFzlpr+hOGyweu1QFQGeQoDAsVKstekeo0842LOHsaydE4uoAdTFU1GHU
         xPzIjGOiiVQw3SiYsTKfRQQQfpbKVE4ve67D32wbrW3VqMMKrHVePQiI4CpeS/Wwp5LR
         04DP89K51fiA6nOv2l6c1RtttPItsrfQoPa1WS6YsHiYlOcubiML4JiUaIv5SjmAXnyA
         xqtHU6JFBh9EIEmA1ruGUY9SYFhgMEtaqk161A31Uuh0m0UumilE6fd+5bj22Xma6nHZ
         0xiQ==
X-Gm-Message-State: AOAM531ncxS8o7Wip+WFh9npWFg+Z0mLkqHKKWFStptMfe4yR88gNAJ3
	pCwzr1vYGigf1BnR4BiAKTyL/QqhTS5D3A==
X-Google-Smtp-Source: 
 ABdhPJxKDPUzqgM+rf1gHQI7aCVvFbvkKTXjdwcObtHtj5UPRJPkeDKsNm/pblBBBSdkFyhhQ5UDBQ==
X-Received: by 2002:a17:90b:4c8c:b0:1c6:f86d:a6f5 with SMTP id
 my12-20020a17090b4c8c00b001c6f86da6f5mr2254576pjb.15.1647743821343;
        Sat, 19 Mar 2022 19:37:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 z23-20020aa79597000000b004fa3634907csm10931696pfj.72.2022.03.19.19.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 19:37:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libbpf: Enable on ppc64
Date: Sat, 19 Mar 2022 19:36:58 -0700
Message-Id: <20220320023658.2372981-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 02:37:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96064

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb b/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
index 71eebdebea..067f58b79d 100644
--- a/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
+++ b/meta-oe/recipes-kernel/libbpf/libbpf_0.5.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/libbpf/libbpf.git;protocol=https;branch=master"
 SRCREV = "5579664205e42194e1921d69d0839f660c801a4d"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64).*-linux"
+COMPATIBLE_HOST = "(x86_64|i.86|aarch64|riscv64|powerpc64).*-linux"
 
 S = "${WORKDIR}/git/src"
 
-- 
2.35.1


