Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FA5C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 20:44:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.389.1650392428432988171
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XqwBPVCP;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id x80so444845pfc.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 11:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EFqwrL33k8nhWso2aKhack2LySMsN08v8gIuTMNnPvU=;
        b=XqwBPVCPrhYGz7YIW2sq9eWk18UN2ic0UIFdwgK8L9hjmE0LAF98NVknZQbNITvLm8
         +lYgrEijXMTtPPuI8BZ5pRlLmrx6HVBrO8K/7tBjWZEB1TNG7va7BJa5kA/8AUvsP2it
         ABtwlVXEG2lue9NAWEU4YUVlGFsZr7EhBfqG3ULOAaSPosgfbdhilWwD21swEXHiSJqJ
         mAzLHvmpA+irT+zo0HojXphIH4BamKuSXlvBToUXNW+zaxtyHEGQbR/ApKygIFeQDexv
         GMRQtJm/RHtMHti+lPOcGRM+YkCemxwBD5ZU/PkmVSxrbpKJefszZHNE1BJVqg0bmfeu
         0xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EFqwrL33k8nhWso2aKhack2LySMsN08v8gIuTMNnPvU=;
        b=R31K9hb9/3IYImW422XdQk0NvbkNK2Zv+oXHbAtfD13Tbp44lpf/YvF5RXisfuLFBg
         smuxjDuDBhiiLohNFpCFTXOAsCl+J9aEX1HqWfgX5OM/49vezJ6HdP23XiiLjI2YazGc
         ydz+j1iRBfO2Y/IsyhL+sFjoWKVULrj8eRszZ128V5a6A/prqYCmv4BqB+mR4HepmspH
         maP7GntsnhR1IwujM8SkmwUQOcvyxGFiTL1CkbzDQKevGprHifVBQ9OYHThB1eMmCc1P
         FTZrbakVaXoLysNQEfuDl5Mwcigv9PbozMHX8skNy+FqPSxxrA0AC9Rz15b267VSD/sW
         Sjhw==
X-Gm-Message-State: AOAM530BN2Gi5ov6dZQ75oFNBCYLctY4vNu0tEKARwrpgKb/VqJ7v80O
	C0QQoWg4JYhtS7w7s3P3+luIVh28+y9L2A==
X-Google-Smtp-Source: 
 ABdhPJz+WTrKcC+LwcXxLC+UGQEGS5p+kBL+n4clZxchT3dRcjzFoGte0yd8e8jczNvalil6WouqlA==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr5162117pfk.47.1650392427703;
        Tue, 19 Apr 2022 11:20:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 19-20020aa79113000000b00505d5d15d80sm17170699pfh.14.2022.04.19.11.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:20:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] mozjs-91: Use system icu
Date: Tue, 19 Apr 2022 11:20:23 -0700
Message-Id: <20220419182025.1368634-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 20:44:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96699

vendored icu fails to build with gcc12

Fixes
icu/source/common/stringtriebuilder.cpp:388: more undefined references to `std::type_info::operator==(std::type_info const&) const' follow
collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb
index dd02ed94cb..f047e5e960 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.4.0.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/firefox-${@d.getVar("PV").replace("esr", "")}"
 
 inherit pkgconfig perlnative python3native rust
 
-DEPENDS += "zlib cargo-native python3"
+DEPENDS += "zlib cargo-native python3 icu"
 
 B = "${WORKDIR}/build"
 
@@ -50,6 +50,7 @@ do_configure() {
         --host=${BUILD_SYS} \
         --prefix=${prefix} \
         --libdir=${libdir} \
+        --with-system-icu \
         --disable-jemalloc \
         ${JIT}
 
-- 
2.36.0


