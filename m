Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F08C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 16:29:18 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.12891.1664900956459969668
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 09:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BW0tuR8q;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id s206so13134870pgs.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Ip8x0GcYkC7/uq7SFSduPqCPmeZiJmH6w5W4iYWZIKw=;
        b=BW0tuR8qC2DGvYYAfdo7bdJY+N6h1hOzPPXdZLq6yJRvAd5Cb46EcGMMbXedudZ/Bp
         XRRy19bMlXyd0wvMaCXqsrjEbayBhzwoNmNKgpLW/+WxwOCKeTjpII6X7Cy1te8J7ALf
         CERHZFOCda23mfhYd3nUrMYphXjRNI6fytfMOuubOlntafCGB8403WFaG7hT81Woylxy
         7Q0Y9S8rvpiFsic8sTNE0OCV1oEH5p/R4YHIAAvvB4s+JuKcFIEGUc+fZunx+YsLqnHm
         NpZHO8KwDBtKn2sP1cbsGsA1fgcOrouPXmaCTopc5koy+PpGk0oxlSkD2qZd64Nw6FfM
         jRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Ip8x0GcYkC7/uq7SFSduPqCPmeZiJmH6w5W4iYWZIKw=;
        b=jx1ottJQG4EMzoKpx1JdG5CQj59gQs27JZqihA/12h0Hi22wkpDyrl+foU6sSvrdwv
         3PV5U2faeOWnrGAfxhf2w8+jXzipJUo13mkGSZ5git/pzg5det0saKqOCmP3nrO9kAIp
         Gr4Yn/oHa+r25oFj2DDuqUBsAJn1YairHBWtUOvkE9M+GCA0kNsm+ebAdJJlRU2roJ2o
         r6hioIb+G7DKuHUqWdFbVOsjQpHmj/4trjBO5ZVu5Sa5MUkM7hJ+gp0vp08NmSkSp8k4
         FdJdME4PCFEBf5oGDEZsUb5R9C726CAOVlWZCJC+2Uoq3lyCZl0sM8x0JDZCVjGtNBkB
         vMtg==
X-Gm-Message-State: ACrzQf3000A79xpt5JVuJQMo7nWfCCoZzhLpWruzTC5734qD9U41UH/V
	P7BczSpWA674YjqburXUBj4b5/XuDa01Og==
X-Google-Smtp-Source: 
 AMsMyM76sF4Vhypq5gxIglUdYdv7T7LYHwIyHRZNE8OH9jUo/BAV4uyiws9KxeNYQOjrBX+GBo/BYQ==
X-Received: by 2002:a05:6a00:1a44:b0:52a:ecd5:bbef with SMTP id
 h4-20020a056a001a4400b0052aecd5bbefmr27918700pfv.28.1664900955604;
        Tue, 04 Oct 2022 09:29:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::dee7])
        by smtp.gmail.com with ESMTPSA id
 z32-20020a630a60000000b00439baadf1dbsm8682377pgk.41.2022.10.04.09.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 09:29:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] open62541: Disable lto on riscv/clang
Date: Tue,  4 Oct 2022 09:29:13 -0700
Message-Id: <20221004162913.1817415-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 16:29:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99059

clang errors out linking lto objects
riscv64-yoe-linux-musl-ld: /tmp/lto-llvm-d497c5.o: can't link soft-float modules with double-float modules

This is something needs to be addressed in clang for riscv
as of now disable lto for rv32/rv64 when using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/opcua/open62541_1.3.3.bb           | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.3.3.bb b/meta-networking/recipes-protocols/opcua/open62541_1.3.3.bb
index 317697262c..5af856ad34 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.3.3.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.3.3.bb
@@ -36,3 +36,12 @@ PACKAGECONFIG[amalgamation] = "-DUA_ENABLE_AMALGAMATION=ON, -DUA_ENABLE_AMALGAMA
 PACKAGECONFIG[encryption] = "-DUA_ENABLE_ENCRYPTION=ON, -DUA_ENABLE_ENCRYPTION=OFF, mbedtls"
 PACKAGECONFIG[pubsub] = "-DUA_ENABLE_PUBSUB=ON, -DUA_ENABLE_PUBSUB=OFF"
 PACKAGECONFIG[pubsub-eth] = "-DUA_ENABLE_PUBSUB_ETH_UADP=ON, -DUA_ENABLE_PUBSUB_ETH_UADP=OFF"
+
+do_configure:prepend:toolchain-clang:riscv64() {
+    sed -i -e 's/set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)/set(CMAKE_INTERPROCEDURAL_OPTIMIZATION OFF)/' ${S}/CMakeLists.txt
+}
+
+do_configure:prepend:toolchain-clang:riscv32() {
+    sed -i -e 's/set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)/set(CMAKE_INTERPROCEDURAL_OPTIMIZATION OFF)/' ${S}/CMakeLists.txt
+}
+
-- 
2.37.3


