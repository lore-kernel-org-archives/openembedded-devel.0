Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1DCC433EF
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 19:47:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.13514.1651952852426128867
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 12:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H05ZuS4k;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id c11so10423553plg.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 May 2022 12:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C7twwADHxD8GTYaFD/S8axQukl4cK/mflE1fkHzY2Pc=;
        b=H05ZuS4k/mjk3OL9asm5ENnQXyjvgMuB9aGdI/v207U85VrUpROOlVM+bTFnJ7FmB1
         z7jPA3t16EwYxLV3i2UWf1SKPB88WSDB9HYLUPhtw5sWSR98AeAvL7yv2Bp+xumm6KJP
         MmKUwgISxf0ehxtTI+SOVEnk2t3Qh9UYoDqVgV4Z4gp1vQ327qWe+V3p7b0MVfwRdH7u
         2vjeFEcLHBjsEwCkdcS7LxLWDiuAZj2KN5oeVwDxRdD/KmNjmKafNKCxbDB/6nbU5hZj
         cDBuU3o6vLo7eK3JTZVLF7eCoDhLYnMSXdZzvph2XktoXBrs/BwyC9nMExRXZcI6WPS7
         DY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C7twwADHxD8GTYaFD/S8axQukl4cK/mflE1fkHzY2Pc=;
        b=BQV+SyHE9B2egW4/64mqY9tp/bT+DdCOGFiAxZsH51qQuFCPnZSLWz17TFhB7S4XRL
         deHnyvlT6cMmWULiCBA1BciSZ7Uu5rq/UBw/gqViLtoo+LSQrgXuSB6hDdgxQYj+oYGM
         cuhhALuCv9uZbznyBnTc6ImkUZdVp1Md9Dl7AN/vmiWc5dfnFh8yGseUTxQoyb95H/28
         RjpYETZ8raqqno1YwVhkIlRJJrCTIwMpELu+XHcK5l67m6yiVe2OL6zUBhgOOyr6gTwc
         EFAuXJx2Hc26WbZWerAb4QEwPGghob9CjCRSFK0PJDCvfTQ7cFk8XurqJTws9srJ9Mm6
         ccbw==
X-Gm-Message-State: AOAM532V4Otb5Zo4Qxr/CvCGxkb/5DAtfPWlDclz7eITY+PRr6/4C1mD
	8HUpS6giXSn04CBjlWfUNGYvz1cAQvNTrA==
X-Google-Smtp-Source: 
 ABdhPJzHDiEhX+RlRDdQH8oKk4PQFvqzVLZUV3GbY6Qf1uHtCotJeyI61bwuH/7O6YDVSnCXGm0sPw==
X-Received: by 2002:a17:90b:224f:b0:1dc:76e9:e963 with SMTP id
 hk15-20020a17090b224f00b001dc76e9e963mr10700407pjb.16.1651952851748;
        Sat, 07 May 2022 12:47:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 w10-20020a170902d70a00b0015e8d4eb1bdsm4025390ply.7.2022.05.07.12.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 12:47:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-filesystems][PATCH] zfs: Disable on riscv32
Date: Sat,  7 May 2022 12:47:29 -0700
Message-Id: <20220507194729.3409568-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 May 2022 19:47:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96980

Its not yet ported for this architecture

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
index 1752e03750..96e07cc454 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
@@ -54,3 +54,5 @@ FILES:${PN}-dev += "\
     ${prefix}/src/zfs-${PV}/* \
     ${prefix}/src/spl-${PV}/* \
     "
+# Not yet ported to rv32
+COMPATIBLE_HOST:riscv32 = "null"
-- 
2.36.0


