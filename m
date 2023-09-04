Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A860CC83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 12:57:03 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.46865.1693832217479656027
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 05:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=X8/IN5yO;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a56401b9aso745525b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 05:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693832217; x=1694437017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lC7GgYOh2Vif647MDgjEYjvoBOGAg8/1wqfB2iiCMnI=;
        b=X8/IN5yO1DMbG2xfgVVPfJpkvZiCvEwHy2XqNTk7HZwqrUL9eg8nHIcQamM9zvvEUw
         9Cpf2wkjI8zHdSV7Gezi+AWA0KXbf/K4m0vxCnqt5azDUepy5w3mM7CpzGrpFBsenv1+
         h+OT6jsNlQtciRdIJTL1T+X8TlJN2OvMYA2ciHeEPlSPIwMGOGtTvU9RgXODkpLXbk6B
         M19tlkH0eznurg4lPaXica08tRymBRDD2f3rnI5i2CW6xx9MzDip8fpyFwBVZH0o0lib
         jpbaRIjfTKwvCm3N4gvWMCfdEYklXW8QrcHCTYqJlMz17iqra3RkWemvmnYX3HtvzVhx
         Hmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693832217; x=1694437017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lC7GgYOh2Vif647MDgjEYjvoBOGAg8/1wqfB2iiCMnI=;
        b=d2f3PgZqOMoofZHpOEnXs+sYSeltW2Kx1iUvc98qcRkOjcFz9zHvE1v5A6k/juCCZH
         QTHRJCUfrmA/mVjU5SuEPEVVZnr17FfuXignQ8WOG8ewrOn3KMcbMr99Sq64DoHPLLub
         3VLh59YCClm0Ut+bSNHmcelzJzBODQEadLof+LyLWi5sDW/biuCmNN1FGq4SSVqALpL7
         o9tWFuXqrCv7EeU7To8Tn7ddROJIHmaUMrNzRBRJLd+nzninffQM6yv4+AMWV9kChkzN
         klE6KlNWeNlXLaQPLE9CgHPdU27wHJfcSChnM2XaBUHIWXUIV1OUOP8BVUjLVSG2po/D
         nJdg==
X-Gm-Message-State: AOJu0YySU6bEyB4GYCpXHJWY01y2/Fs6ny1lDF8tCsnGbEaVSOun4uBM
	3gv1QU30adMcZN6lEQi0CdnOGcYA0GbxVQ==
X-Google-Smtp-Source: AGHT+IE8xa+2JsCogHwgDqxUaJTEzunpJSVy1TksWUEhH4Hr78tzUnCaM0xGvrGrr7uQGkwL9KXIag==
X-Received: by 2002:a05:6a00:2384:b0:68a:6cf0:93ec with SMTP id f4-20020a056a00238400b0068a6cf093ecmr9361098pfc.24.1693832216636;
        Mon, 04 Sep 2023 05:56:56 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c3f:18be:6e26:cebe:deeb:ef24])
        by smtp.gmail.com with ESMTPSA id j12-20020aa7800c000000b0068842ebfd10sm7321901pfi.160.2023.09.04.05.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 05:56:56 -0700 (PDT)
From: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta-oe][dunfell][PATCH] meta-oe-components: Avoid usage of nobranch=1
Date: Mon,  4 Sep 2023 18:26:35 +0530
Message-Id: <20230904125635.78544-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 12:57:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104714

The usage of nobranch=1 in SRC_URI allows using unprotected branches.

This change updates the real branch name in place of nobranch=1 for these components.

Signed-off-by: Sourav Kumar Pramanik <pramanik.souravkumar@gmail.com>
---
 .../dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb   | 2 +-
 meta-oe/recipes-extended/zstd/zstd_1.4.5.bb                     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
index f55247d9e..604d989ed 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
@@ -22,7 +22,7 @@ SRCREV_FORMAT = "rwmem_inih"
 
 SRC_URI = " \
     git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master \
-    git://github.com/benhoyt/inih.git;protocol=https;name=inih;nobranch=1;destsuffix=git/ext/inih \
+    git://github.com/benhoyt/inih.git;protocol=https;name=inih;branch=master;destsuffix=git/ext/inih \
 "
 
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
index f8fa226f6..0c564c0d1 100644
--- a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
@@ -9,7 +9,7 @@ LICENSE = "BSD-3-Clause & GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
                     file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
 
-SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1;protocol=https \
+SRC_URI = "git://github.com/facebook/zstd.git;branch=dev;protocol=https \
            file://0001-Fix-legacy-build-after-2103.patch \
            "
 
-- 
2.25.1


