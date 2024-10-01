Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0056CF3187
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 21:15:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.93399.1727817301815300322
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Oct 2024 14:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G155MyTY;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42e7b7bef42so49391055e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727817300; x=1728422100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3H5zWmbM1Ln/q2g2jRotyPR7peJ4e03ZZ8wh90YOhxM=;
        b=G155MyTYNkTI+C3X4Mn1eDqeMZnUyGYmC+KKdJ+7u3rKRGTYDRVNGJz9dimqQnMMxs
         Bwt3ET8Ju7sckwu9xMlDybC0fSKP/BeipipoopBaj36IsnUv12gxeGtE/hSFIaYM+f+d
         XCKQs4b1rWf92Y/hbXcN5DOAuZEgACmDYlOXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727817300; x=1728422100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3H5zWmbM1Ln/q2g2jRotyPR7peJ4e03ZZ8wh90YOhxM=;
        b=qDI+71PQ27pJYgloU80CBhZvZmlQTGNjdOugJ8tDVZNicinOOWAUVjU6tGh3NWI64D
         KGI9vdb1hvNpyNAVnQsY8euDzwSrHftC4RnWQ/KW241Q5DLznPYUd+FYY/ArMeegUusA
         m39JMHSbRz8F0h8Y1Bwj2G2nCIUI9WQ4LTPFS/Zfagsb4RwjYcoFDxs9WKPjdTLLMHLn
         mH1ntt2XyNDu5Vi6IBNQ9vP+1k18Qcx0F6qJ6yJ38HOb/odEuGx8xrqwOX1G/PFRBWQB
         339+c+j8+ynyrVDcCyFMEeJLrrYygjj09XPD7BouWD/u6GrpyM7a9GB7hEbwlS6zJVyx
         M72w==
X-Gm-Message-State: AOJu0Yy54KZ8SshBK+hFppmggREUZ8o7cP5VQdOcC2nTfSJLL3uOSHYa
	/9h2SAXu95gwAuZUg44DWVQnzAsFy30SImg9rm1PzaSYjHZ1lkErLjlbfDa5gex3YWXfFOt6zC9
	S
X-Google-Smtp-Source: AGHT+IEEinsatJVo33mevZhotpaCwaIbDX3BiJU37qbUheZY/ioCHTPWXgVj3btsdBKu7oOHMsAX5A==
X-Received: by 2002:a05:600c:35d2:b0:42a:a6aa:4135 with SMTP id 5b1f17b1804b1-42f777c278dmr5175185e9.20.1727817299769;
        Tue, 01 Oct 2024 14:14:59 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.local (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d287sm12689340f8f.11.2024.10.01.14.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 14:14:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-initramfs][PATCH] non-repro-meta-initramfs: update known non-reproducible list
Date: Tue,  1 Oct 2024 23:14:43 +0200
Message-Id: <20241001211442.3188342-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 21:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112639

From: Yoann Congal <yoann.congal@smile.fr>

Remove packages seen reproducible in the last 3 completed tests:
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/43/steps/20/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/44/steps/20/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/155/builds/45/steps/20/logs/stdio

Effectively, the list is now empty. This marks meta-initramfs as
reproducible!

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../conf/include/non-repro-meta-initramfs.inc | 22 +------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta-initramfs/conf/include/non-repro-meta-initramfs.inc b/meta-initramfs/conf/include/non-repro-meta-initramfs.inc
index 8f01f5624b..c05f59d1a2 100755
--- a/meta-initramfs/conf/include/non-repro-meta-initramfs.inc
+++ b/meta-initramfs/conf/include/non-repro-meta-initramfs.inc
@@ -1,23 +1,3 @@
 # List of known non-reproducible package of the meta-initramfs layer
 # Please keep this list sorted
-KNOWN_NON_REPRO_META_INITRAMFS = " \
-    kexecboot-klibc \
-    kexecboot-klibc-dbg \
-    kexec-klibc \
-    kexec-tools-klibc-dbg \
-    mtdinfo-klibc \
-    ubiattach-klibc \
-    ubiblock-klibc \
-    ubicrc32-klibc \
-    ubidetach-klibc \
-    ubiformat-klibc \
-    ubimkvol-klibc \
-    ubinfo-klibc \
-    ubinize-klibc \
-    ubirename-klibc \
-    ubirmvol-klibc \
-    ubirsvol-klibc \
-    ubiupdatevol-klibc \
-    ubi-utils-klibc-dbg \
-    vmcore-dmesg-klibc \
-"
+KNOWN_NON_REPRO_META_INITRAMFS = ""

