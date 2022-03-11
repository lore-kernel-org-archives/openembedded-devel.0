Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC45C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 19:20:25 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.9399.1647026424151316313
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 11:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E/WkjH32;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id h5so7086664plf.7
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Mar 2022 11:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4gBy1hoEkrSiRZ9tS3z2veZeQgJoDL5kwRPIM1DVjsA=;
        b=E/WkjH32jXBlQZMoAcqkDTkrUj3wWSm6mEp5Esi4QzAnPBhno2RndaK/Z8ddUGDlVi
         cEjiMNZqfN9f/6D6a6X2uF2UjdXayJaORxM6b3gXkCYGYpsNnjGL1V3EnjL+JuTto/oi
         ztjuPrOy63HbCQoRX/sdE1intRyCV34RhnvLb29flrxWFCOg6B1yePRWa8CUPD65LuEr
         XJfSjqHth7mk8yt6KNg5RTWvwPmU84wywLdUKsnDeswkrgLT9j7ukRPmayfmpcM9xzSq
         HKjabDkEbFBIIxIx32TYW12kNWC4+Adj7Vm4BMgSzyUE9ec3LEs8CMvgyHB2wsTBmW7R
         iagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4gBy1hoEkrSiRZ9tS3z2veZeQgJoDL5kwRPIM1DVjsA=;
        b=gldhFyPdju5i3ibeh4NQ2YTtoKvgAwnKFr2afkbXNWUpfhrT06GyNBlUwyjE0h7ejT
         LFGSFDlCLEuvogbDlwWbHxDem61nb7P1SCFjQukomEiBeqPMTJAFVSIE19H4UQLw7JFW
         9Qpb/HZ3e+/q/Y+/KzdHzotGDTJYBN8W1a7Yjet/RxoGBbCpmCYxG0FL095nHRG/GFvv
         v7jhAfaJvsEllEbxGaVHlGOLWloQ7b5eoUsMk8MGXDcKKLjj7WFvGK3t02mwWqON4L8e
         7TNa1QwiEGS+kfJjy13KCoRK3C6XpyCpQJMA+L7XegTS7xRgfGEIiA/W/MSzMVutu6s9
         agPQ==
X-Gm-Message-State: AOAM533zLbtYZG3hjhQogru5A4EzKAIdlx7D80SJlmwfv4yE0LwzftK6
	i/YClMFOlqxYsIEcRxyQ9vbn/JA5xkgGPQ==
X-Google-Smtp-Source: 
 ABdhPJxgKnWH4lnUCbmIUbzjz93sUPOg9f3sHLH3/rpEOahYvVSN7kK80hZVEu9ezu1DFGK0zn7Yew==
X-Received: by 2002:a17:902:d2ce:b0:150:19a9:d171 with SMTP id
 n14-20020a170902d2ce00b0015019a9d171mr11698449plc.155.1647026423337;
        Fri, 11 Mar 2022 11:20:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 q4-20020a056a00150400b004f78d4821a0sm3431581pfu.204.2022.03.11.11.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 11:20:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcereal: Link libatomics on mips for ptests
Date: Fri, 11 Mar 2022 11:20:20 -0800
Message-Id: <20220311192020.1908488-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 19:20:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95957

clang/mips emits calls to atomic builtins which it expects from C
runtime perhaps but compiler-rt does not provide them so link in
libatomics

Fixes
atomic.cpp:(.text._ZN6cereal12Inpu
tArchiveINS_16JSONInputArchiveELj0EE7processIRNSt3__16atomicIdEEEEvOT_[_ZN6cereal12InputArchiveINS_16JSONInputArchiveELj0EE7processIRNSt3__16atomicIdEEEEvOT_]+0x10c): undefined reference to `__atomic_store_8'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 250ea97f40..fb37de3c30 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -26,9 +26,10 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig ptest
 
-PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
-PACKAGECONFIG[with-tests] = "-DWITH_WERROR=OFF -DBUILD_TESTS=ON,,"
+LIBATOMIC:mips:toolchain-clang = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
+PACKAGECONFIG[with-tests] = "-DWITH_WERROR=OFF -DBUILD_TESTS=ON ${LIBATOMIC},,"
 EXTRA_OECMAKE = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '', '-DJUST_INSTALL_CEREAL=ON', d)} \
                  ${@['','-DSKIP_PORTABILITY_TEST=ON'][d.getVar('SITEINFO_BITS') != '32']}"
 
-- 
2.35.1


