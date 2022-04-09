Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50161C636FC
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:01 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.6680.1649513384737325270
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tf9sUw1x;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id k14so10265601pga.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 09 Apr 2022 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdq5cJvdbIZEf14eI8EmyRCjH4Lu7RZpTcAS8eMfsz4=;
        b=Tf9sUw1xuy17RuO1S3zpgCQSUjAED37/Ib1n03xByMd8N0rFxxiFFx4fE+3sxz3cBn
         KzxVXMG+tUbSugREHvBsa7E9Z72X4SXmYtP68iLrzrkxO75aUL5sQSesaUwUb46K848H
         VK2cYICCHq9hQfVmwdapP/X3zZZCFgBpIEnbIafit6NmpH5sk9qFhMHZeoVAFfmJVBqu
         a6HSMZrndBdMhCnkwTj7tmeSSd3ntsPB9ChgBDJnFbpvpD1b+N2ky7VjayZjvDbffVK6
         eWvQvcRDPbDzJgtimEwdfKBosLhu4Bhy3UJq7gf+a8QAW8ESdtFd3D7gh5L7+NlhCfp8
         LZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mdq5cJvdbIZEf14eI8EmyRCjH4Lu7RZpTcAS8eMfsz4=;
        b=SqV4eiO58eZ/Y+TTeRVV0IYxj6sDGtT7MqAvUWjjwT69zfCJ90lK6vsi7oYoU+H+a1
         SGzwCpSpggLRC21gBSWPUHLmWTmfF1KGUapfFQrZo5ZTXd4L/EL5rNjD+D7AcwULkgvB
         1WsjE12c9r1eezWKpS24apgbWDgtQrZG6ppYRt8b5jZG8h9vEC0ACl3qMVcADmSlJEXy
         CRoHMwbjrwkgqnkggjo0a7tsd/lAf6d/xt4hY7Xt0W6pBqjXjQNda0JxB1KFuHCAKRwg
         jmWi9n33gptXONV8DgwYJrMNaTYIKkby0c/dKpNaCldjrxrg2cHbhleHfvWmvuIUT8y5
         Fp9A==
X-Gm-Message-State: AOAM531F1m19YWImIi1R6bHpzfhWMRRiExNi+bzxW3R3Cocimp6da9L9
	4CM8bT99/60IgEIXxdlqprPbpLYJugyZ4w==
X-Google-Smtp-Source: 
 ABdhPJxmyi9x6xNSh4LHbBoAIO9aF4+r4OD0xmdbNYr++53UhKOH9PsFkgGOfs3PAoxrl87oQrsJCg==
X-Received: by 2002:a63:e30a:0:b0:385:fcae:d4a9 with SMTP id
 f10-20020a63e30a000000b00385fcaed4a9mr20122208pgh.85.1649513383945;
        Sat, 09 Apr 2022 07:09:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::94ca])
        by smtp.gmail.com with ESMTPSA id
 n24-20020aa79058000000b00505686a982asm8932169pfo.125.2022.04.09.07.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 07:09:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libcereal: Link in libatomic on rv32 for ptests
Date: Sat,  9 Apr 2022 07:09:41 -0700
Message-Id: <20220409140941.4180109-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96496

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index fb37de3c30..b76cd2eb60 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -27,6 +27,7 @@ S = "${WORKDIR}/git"
 inherit cmake pkgconfig ptest
 
 LIBATOMIC:mips:toolchain-clang = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
+LIBATOMIC:riscv32:toolchain-clang = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
 PACKAGECONFIG[with-tests] = "-DWITH_WERROR=OFF -DBUILD_TESTS=ON ${LIBATOMIC},,"
-- 
2.35.1


