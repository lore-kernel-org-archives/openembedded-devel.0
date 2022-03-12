Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37733C4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 08:44:37 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.3138.1647074676528526475
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:44:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iPvzcwA5;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id e3so10044141pjm.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Mar 2022 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MRuYESZ/MiCZ3gCyihH30jVTkKloRzJeVmtS+uiygB4=;
        b=iPvzcwA5MgHapDJohwiYoyEYs1Gn8P9OF6Zq2U61O0borHFqGQ29XFtp+w7zYmFQEX
         Wv5KVijs23Pv68s3fRyy2PkAmgX9RqygQ0lpbvDPcNk+qSRjlLbpX6br6/nWhFT76jYY
         hhxJiFpeXy2GK/HUS4EhGD8dqamfFDbHDQURtXsktEDVRiVIcuFj3Qos6jDHTqGV2xnz
         +G06XciOENXvBEEzeLrf17ZFa1msZ8Y/8A4nVW45qvSIMObANQUhBrnaoGbWELIcBMYQ
         9zRkAx5Z0cEdlDiO9DGQnA9whk2bHzqGb8j0FBk/HJy5cQFTqkYTkon786yZyEnVx0Hp
         9jZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MRuYESZ/MiCZ3gCyihH30jVTkKloRzJeVmtS+uiygB4=;
        b=lST1okjCUS9RItzWu3989uzfe3PQ6VaVZ5J2ATG/6D30j5P8Jpee60RvLlte+CBAvQ
         bwGOQF738hDLLrIGIWPM6th15vrCH9LoCfUoTpeiPGaFK6FFLUtC+8qACs9joZ9pBegh
         T+WMoAqAjC2W9QqaPpl+dAkhhHdF0Y59lazFQscxO8uZm+GnFGcKOEoy9KLC3UqX3akH
         le+fproSZvV+/iNcln0OR5yIVjpgLN7ttg+y1o0lL+/2csLfu7b6KnZBD2ZPzrc5dvi4
         CXCvLPfXUjAFW7kzchkIokomnMjRBMISDftNmpLqL7cJs1W1OFWmtG4RVQ3FcbSpVdXf
         cBcw==
X-Gm-Message-State: AOAM533eneV4HVg5dpP+1dxP9fkdI8Wa8h6zhIEldmh5lamvxcBmbLMa
	1hTMoXwndjdtFN9Ei022tzb4TZcv2/JfnQ==
X-Google-Smtp-Source: 
 ABdhPJzGxBC5Oll9o9B/1lRSDJhhWzhC4hVdr8dHvLKeSUojpJ5XqbP3jIo6MQp97zW4FOGpM/Srfg==
X-Received: by 2002:a17:90b:1e0a:b0:1bf:4d44:ce17 with SMTP id
 pg10-20020a17090b1e0a00b001bf4d44ce17mr26087947pjb.140.1647074675858;
        Sat, 12 Mar 2022 00:44:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm12803499pfa.77.2022.03.12.00.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 00:44:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] rocksdb: Use new atomic builtins on powerpc as
 well
Date: Sat, 12 Mar 2022 00:44:31 -0800
Message-Id: <20220312084431.1123151-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220312084431.1123151-1-raj.khem@gmail.com>
References: <20220312084431.1123151-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Mar 2022 08:44:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95961

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
index 9e138d97e1..205ae1dfc9 100644
--- a/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
+++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_6.20.3.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
 
 SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
 SRC_URI:append:mips = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
+SRC_URI:append:powerpc = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
 SRC_URI:remove:toolchain-clang:riscv32 = "file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
 
 S = "${WORKDIR}/git"
-- 
2.35.1


