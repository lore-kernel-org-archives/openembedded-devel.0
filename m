Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D92A5C7EE29
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 23:23:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.6881.1684797778385812103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 May 2023 16:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ekjsWJ7M;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64d18d772bdso5991768b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 16:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684797778; x=1687389778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAAOkKMRyC6ehrRwDz0Z4H92d54ZwAH3hacDsy5tWgo=;
        b=ekjsWJ7MsGy1daKyqc/TR7P+Mo2l2krvTleMl0ShDVIBOzyrUfV2WpQD4CmVnUbN3M
         yGGu3Oe0AGuZ1cjIuXG2JDjArqXQJPUn3C8wb2p1YSn8O0a/6EQnGYAxzziqN9BwR6zV
         +tK2xuc2BWScVfuNuz5xq+ufOkuR29HYJLag4tvUygHVOkjRj97VSufXiEsWhJSFG74E
         sTUch3CFMGSmEQmXH4pV64HlYXEErny5BNPL+IAJpxg4xunGUs451Z6+g7D6hRlzjJNl
         abjh6q3EZyUTa4RZBKygJwl43HfHM4H0PVtCoXefK3d+4HUMTmx/Gqn1vIne2Ow8zG/t
         088A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684797778; x=1687389778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAAOkKMRyC6ehrRwDz0Z4H92d54ZwAH3hacDsy5tWgo=;
        b=X+YAv8jIaJjbpr3JfQIWuNN1lqkXZTB1s5iOXQdIwcvC7jflbIpzckLHrdWarUS9zd
         jwtFxrSFLqLkdLffoa1EpEcc3UsOlmjNfp0nu6HtfurHOkhp8xf/pcu3HtEaICWgY39f
         kA6Rbid+JRFXeJPJCaZ88bx+CAh0IIOkKQg27pi5oWqxgoJLAd7Ojf0hfLcHto9jAIwE
         wFbMD9JTKqw004IvSyRz89sIeMYnzZHZmqaEUNzYUmEva4ZtOuxrx0IBj0yuZ5p5VwnC
         lrMaZ0jjcpPHOodcUxT+1/X1N03tCpfenuepPNi39elc+IWkNXVFFyAueKYWIJZg+Ho4
         wAVg==
X-Gm-Message-State: AC+VfDxAOH93LnQu6ess/iuqMmWOU9Q+PJR2mDsfM22hEGozg8Ur86eQ
	h4M18hIAHbA52hHVZE5RB9bwyDIvEls=
X-Google-Smtp-Source: ACHHUZ48KeXt5hQ1yqnmOwKFRtdZDLaDdSOFTCWP8RbTIXo99MrXAZxrc2eWm9r1Dx6INKw6cCm3Fw==
X-Received: by 2002:a05:6a20:3d91:b0:106:76e8:940a with SMTP id s17-20020a056a203d9100b0010676e8940amr12540122pzi.61.1684797777566;
        Mon, 22 May 2023 16:22:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id x22-20020aa793b6000000b006439df7ed5fsm4621267pff.6.2023.05.22.16.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 16:22:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 5/5] aom: Pass nasm flags via toochain.cmake
Date: Mon, 22 May 2023 16:22:52 -0700
Message-Id: <20230522232252.3475281-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522232252.3475281-1-raj.khem@gmail.com>
References: <20230522232252.3475281-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 May 2023 23:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102715

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb
index 8f4913450b..571698d9f4 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb
@@ -7,17 +7,19 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5 \
                    "
 SRCREV = "7ade96172b95adc91a5d85bf80c90989cd543ee8"
 SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https;branch=main"
-
 S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig
 
 DEPENDS = " nasm-native"
 
-EXTRA_OECMAKE = " -DBUILD_SHARED_LIBS=1 -DENABLE_TESTS=0 \
-                  -DAOM_AS_FLAGS=--reproducible \
-                  -DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl \
+EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=1 -DENABLE_TESTS=0 \
+                 -DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl \
                 "
 CMAKE_VERBOSE = "VERBOSE=1"
 CFLAGS:append:libc-musl = " -D_GNU_SOURCE"
 EXTRA_OECMAKE:append:arm = " ${@bb.utils.contains("TUNE_FEATURES","neon","-DENABLE_NEON=ON","-DENABLE_NEON=OFF",d)}"
+
+do_generate_toolchain_file:append() {
+    echo "set(AOM_AS_FLAGS --debug-prefix-map ${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR})" >> ${WORKDIR}/toolchain.cmake
+}
-- 
2.40.1


