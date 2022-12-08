Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F2AC4708E
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 02:23:51 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.3359.1670466229390087556
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 18:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gD+VDwVN;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id q1so72190pgl.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Dec 2022 18:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7jffsTV0BSt9UZjQgQ/eeYQOnWC/A6iTAQ1GiCXGC4A=;
        b=gD+VDwVNRROJEH/VhDy1dXujnYQSoxD/Ec1eGf99iyZnacWNg/MDVw6YMb1C37F7Y5
         Yobf51dvSkNKtL77MkAKh4EXOkM+DB+k6/7lPjqjT4TdzSG33aRfZqmdbVzWdFPVXFef
         zKX2I6mjbiT3De0Rp/KdzqMibTbxe174v9dgwq9Nz1X8AZvFeoCVKuZI75I0o0iJLRxo
         BriRJtJd7iyHNTRYBBKDx43zOraXRVLbbTmOUUI6ks8acPcQE2hFdse98xc561n9GYeW
         Ys9SX7Qe7LPjjhiieo8j1G2FDMX4Qbof1zbuGCeAL9Or4+QDHZRmNxWwuCcAD/3yFBJ2
         5oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jffsTV0BSt9UZjQgQ/eeYQOnWC/A6iTAQ1GiCXGC4A=;
        b=T1QsC5PEIbK/eqRE0wv681Rz2ekxz/NyNTiRfoOGBTxbDyqKMSxxU+UlYmGBdDKIbM
         xdRdajAwyanrb5At8Hqdu8CMlDjAYXeuE0aVLG2lB3nNKMwQdK3rITo7hxn51dIoS7ii
         AAYWf87/g9DPVneHqaZXarvBWS5Kq1PJg/TTSheVCecMVSPeCgXDEBYq7sFLFe2SXTdB
         pRzRXJzPCguuus1/PonK+1O+5mcirjOMpGk2F1tmK6qxc9a8cE874PVJbnZ7WC8NLsum
         4z4QOua3bkm2aYVf5/lpzULLxuF8aCa8kbo2uzCyfLGml8ywOw32D/7JPhhV2khnJwdb
         iroA==
X-Gm-Message-State: ANoB5pmhiZpsJaz4v0lBOC/Od504xkYnIiz3Gzvnuf7+EMPqcWLrtMOV
	m0AGDTUsfKXn7ZNzUKScVNmsp/BnaHY=
X-Google-Smtp-Source: AA0mqf6n3Sby02pZf9srwwg9VE9FJZd/3h1/gXBGE6E4CwYfjy/S2i8NjVkUaLZsSWOJgLYJot0r1g==
X-Received: by 2002:a62:687:0:b0:56c:eaa5:465c with SMTP id 129-20020a620687000000b0056ceaa5465cmr1541371pfg.17.1670466228550;
        Wed, 07 Dec 2022 18:23:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7d9c])
        by smtp.gmail.com with ESMTPSA id b2-20020a62a102000000b005745635c5b5sm14127601pff.183.2022.12.07.18.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 18:23:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] perfetto: Do not pass TUNE_CCARGS to native/host compiler
Date: Wed,  7 Dec 2022 18:23:43 -0800
Message-Id: <20221208022343.2418869-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 02:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99983

TUNE_CCARGS are meant to be passed to target compilers only. This fixes
build failures seen on qemux6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 86ab18cacf..d1980a0097 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -100,12 +100,12 @@ do_configure () {
 
     # If using the clang toolchain: use the clang host-side binaries built by Bitbake
     if [ "${TOOLCHAIN}" = "clang" ]; then
-        BB_CLANGXX="${BUILD_CXX} ${BUILD_LDFLAGS} ${TUNE_CCARGS}"
-        BB_CLANG="${BUILD_CC} ${TUNE_CCARGS}"
+        BB_CLANGXX="${BUILD_CXX} ${BUILD_LDFLAGS}"
+        BB_CLANG="${BUILD_CC}"
         BB_LLVM_OBJCOPY="${RECIPE_SYSROOT_NATIVE}/usr/bin/llvm-objcopy"
         
-        HOST_CLANGXX="${STAGING_DIR_NATIVE}/usr/bin/clang++ -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc ${TUNE_CCARGS}"
-        HOST_CLANG="${STAGING_DIR_NATIVE}/usr/bin/clang ${TUNE_CCARGS}"
+        HOST_CLANGXX="${STAGING_DIR_NATIVE}/usr/bin/clang++ -stdlib=libc++ -rtlib=libgcc -unwindlib=libgcc"
+        HOST_CLANG="${STAGING_DIR_NATIVE}/usr/bin/clang"
         HOST_LLVM_OBJCOPY="${STAGING_DIR_NATIVE}/usr/bin/llvm-objcopy"
 
         cd gcc_like_host
-- 
2.38.1


