Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C556C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 11:52:43 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13544.1668685953517254652
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Nov 2022 03:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=opDdprJH;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id io19so1384193plb.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 03:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+P9iHY7950vi45zGKSiLm1EqLWrZ+vi+Tlaxz2tE0Bk=;
        b=opDdprJHaMpmmk6649rWQmz6xdIuRJ+gFgV45/denZMDJZNBvL8LYiJSw/p11tyG6l
         cWh0SSgNp2RsEdkxlq39HPd1stS2QuRrwlYIJD1iPBPJBWc3RVzlwXNltWS0nuNw8mK9
         qY0REbX6L9vTaPMzTQaELLU1ZQb0mM3mg3g5OeiCPgawB2NUcgUz55v7YFN2e1frnChH
         rpqJZPXlLAALqJZ8R6KP5fT2aJevx72mACaCzE2ykWdWQEpNYioRnDMuMypprDfWDnRy
         DxMZN/duY/io9SuymWt7Wc5JukEvpLe9FQAVfto+eIeCbAkTkrlgoxsrOVDV6Zo98epx
         KbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+P9iHY7950vi45zGKSiLm1EqLWrZ+vi+Tlaxz2tE0Bk=;
        b=DkG2T8mDU5aqS8etjEpjM/nP2xbzj0VjbBJuZQ7TQ7An3d9Rs7HcSQ84lrSU8YxB7g
         EwGpJEGMEp73hnWOarhIXvC0+gqD/efMD6sYnchAb4FZSyhEtZ6zXs9n/W5oRF+dmX8H
         xgnACTcbOti+kRayo/UploJHC3b+J73aICkWXmSy2nst/WflBuD4Gh5dE/DS0RKPoArD
         LwA10QqTGc521iqcyu63XTjXfHVC0hX3WrYfkR7XestyjF0iIQfoxOnEF7c7xkSN27Ef
         kDomFyhK9w4o1l03aZQCkUDP3NKHfAG5xokdQpikvslrZ5hCTjms0efXbISordBlN4Y3
         tOag==
X-Gm-Message-State: ANoB5plV7uITyFkoyeQKiOBmKhwXdCWloeveKKseNCPEafgPhteCLjL0
	NTSRWvYj8gaVJU4ftuY42H102diZ4y/lNQ==
X-Google-Smtp-Source: AA0mqf7VEPmt/8DP268MVig2ntBxoyKxn8ewJDcgKDXXNLroFnJibuun8cuWigdADoz7i53s2tbHBg==
X-Received: by 2002:a17:902:b58f:b0:17f:7f42:aa25 with SMTP id a15-20020a170902b58f00b0017f7f42aa25mr2489821pls.51.1668685951561;
        Thu, 17 Nov 2022 03:52:31 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:549b:ad0b:ffb0:ec99:c7ad])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902c94600b00172e19c5f8bsm1132927pla.168.2022.11.17.03.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 03:52:29 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	bindudaniel1996@gmail.com
Cc: Ivan.Stepic@bmw.de,
	nisha.m.parrakat@bmw.de,
	Bhabu Bindu <bhabu.bindu@kpit.com>
Subject: [oe][meta-oe][dunfell][PATCH] flatbuffers: adapt for cross-compilation environments
Date: Thu, 17 Nov 2022 17:21:19 +0530
Message-Id: <20221117115119.11222-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Nov 2022 11:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99604

From: Ivan Stepic <Ivan.Stepic@bmw.de>

Flatbuffers contains a library and a schema compiler. The package
contains cmake files to discover the libraries and the compiler tool.
Currently, all of these cmake files are installed into the target
sysroot. However, the compiler utility isn't installed into the sysroot
(as it is not runnable on the build machine).

When an application that depends on flatbuffers gets built, it uses
flatbuffers' exported cmake targets to configure the project. One of the
exported targets is FlatcTarget.cmake which expects to see flatc binary
in /usr/bin of the sysroot. Since binaries for target don't end up in
target sysroot, cmake configuration fails.

This patch addresses this problem of flatbuffers' build infrastructure
in cross-compiling environments. By removing FlatcTarget.cmake for
target builds from the sysroot we essentially skip this step of
flatbuffers' configuration.

Signed-off-by: Ivan Stepic <Ivan.Stepic@bmw.de>
Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
index 859d6a0b0..c4f3594f3 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_1.12.0.bb
@@ -24,12 +24,17 @@ BUILD_CXXFLAGS += "-std=c++11 -fPIC"
 # BUILD_TYPE=Release is required, otherwise flatc is not installed
 EXTRA_OECMAKE += "\
     -DCMAKE_BUILD_TYPE=Release \
-    -DFLATBUFFERS_BUILD_TESTS=OFF \    
+    -DFLATBUFFERS_BUILD_TESTS=OFF \
     -DFLATBUFFERS_BUILD_SHAREDLIB=ON \
 "
 
 inherit cmake
 
+rm_flatc_cmaketarget_for_target() {
+    rm -f "${SYSROOT_DESTDIR}/${libdir}/cmake/flatbuffers/FlatcTargets.cmake"
+}
+SYSROOT_PREPROCESS_FUNCS:class-target += "rm_flatc_cmaketarget_for_target"
+
 S = "${WORKDIR}/git"
 
 FILES_${PN}-compiler = "${bindir}"
-- 
2.17.1


