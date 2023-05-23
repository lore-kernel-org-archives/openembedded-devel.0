Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64579C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 22:06:43 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.16583.1684879600702000485
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 May 2023 15:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KMdDlQin;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ae763f9a94so1434155ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 15:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684879600; x=1687471600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUW8q0+bVKuMLGWiKHWkHuAejp2CVfzxKnsvDMYrS7E=;
        b=KMdDlQinzU3zQwbs4vHuymigK9DLP0wZhhb1sBOitF5kVQzm6hoxOMGkpfHd8OoDBO
         eFhlSpSoRXqAGDMqZ9CVX6G5tT+DJoxnxQzFiQfh27VTV0xZuQ8cv6RhmAdzDRE2RAdI
         LAPTnrPZZ2EhLSY70QB8YT5QpQReYPFWcmoiaiuRZB0iA218mRPN5q7i77gaMbR3NKCG
         VBabbVKK9dyoGIxych0Mja5KKjHXRf0JInSWxzot2iU5CkN6x43uO/vpQJcMZjDJjU3A
         EK6GyXkH6xDXi8tP8t6q6QZl2Y3uyh90Wb9vTHfx5TNr/K/WAd9UDObj9vaNuEVoptwF
         Y0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684879600; x=1687471600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUW8q0+bVKuMLGWiKHWkHuAejp2CVfzxKnsvDMYrS7E=;
        b=ZYBMQ7QgGxtwfVgQstS92WiWU2JymTuSSsBw8IBiPfVNamzSoQHUOD+p7j9G2XxEaB
         W7gCDv6q8/CVRnujDK+Y4j7m9T6rOvts8YGr7gX/Gv2PNyv+D8e8llf2jx7NRBF4oPB+
         ikdW3od/6yFuAlRvWsvJ8TMHM54j176VeY3URWQJUwxdlPTXe8ddB4eRjmpdzHiBsxA8
         +wpx/thLOcOmNq+y4uQ6PTYRNmmIpRmZZ4AvNHe4v8AKrt5c1TdSklKXvGIVKBX9Ci3Z
         SKXxCDRm2jWjNxHxEPW44NDCQhEdvT0yhUPQ+UGTKtKdgqfLeSYNyyFdAfq42KDlChOD
         YRdw==
X-Gm-Message-State: AC+VfDyLi3e3OsvU0TjFKmwUXCnonkN6D3YwQ9aPYjV5madkPlzMJ51a
	JevYgngYuFYRW0LYsDmL6TO8RlYVhYs=
X-Google-Smtp-Source: ACHHUZ63ckUi8a0sXZvSffFaXIno7D2I56rmusbyYldGthzPRRZrrXPuVWsFCl65UKD68kcOsiMANQ==
X-Received: by 2002:a17:902:b118:b0:1ae:5fe0:dded with SMTP id q24-20020a170902b11800b001ae5fe0ddedmr14319839plr.7.1684879599829;
        Tue, 23 May 2023 15:06:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902d34c00b001aaea39043dsm7238191plk.41.2023.05.23.15.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 15:06:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH v2 2/3] aom: Pass nasm flags via toochain.cmake
Date: Tue, 23 May 2023 15:06:36 -0700
Message-Id: <20230523220637.946337-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523220637.946337-1-raj.khem@gmail.com>
References: <20230523220637.946337-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 May 2023 22:06:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102747

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb b/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb
index ff7f0d0902..45dd487f30 100644
--- a/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb
+++ b/meta-multimedia/recipes-multimedia/aom/aom_3.6.1.bb
@@ -15,10 +15,13 @@ inherit cmake pkgconfig
 
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


