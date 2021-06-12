Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.11501.1623538450462764241
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jun 2021 15:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T2XP9mJv;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: andrea.adami@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id t3so41488184edc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jun 2021 15:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8N4bY2Fj/dKP9k5te+tJjBmz5N+amHpZJX65BWd/waQ=;
        b=T2XP9mJvhLEsbUQpfDX7/fHT45vz4WMUNFPBdXdanTRd1w3UA6yQo4dqTWgetItQW1
         PjXAjpdarzt3VzTfolz/Jy2uruo0IZvjizk2+tdGJwbHNoNLQf0ZdKVrC2uule9Npxa5
         CbPYfooiOxWM4zOOsrmQRJhZb1ne/7YhrbXIDiGJHTgZt0lPagfRDKRYahPUx7q6KF2X
         8QX5DpUt236DO9yeyXdzd/vBz86px8RuPnFBn/smD2CfD7VEjqtSkfbrlBDUWGTK2QsF
         odbVRG1qJPLVF/d6z3fZCGYxIwkWlxLRy0kmx5NfUvkkv/gusll5guVKgN5RLzV9UExh
         +T2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8N4bY2Fj/dKP9k5te+tJjBmz5N+amHpZJX65BWd/waQ=;
        b=nADFSt4ulpSOKB3QY+9PGsXguyT/+ypbeXpf4yZSEeWD1PDfVgutibhUkdXOVeptzN
         /WDlzC+6bSudR5yHsCgkh+ciOc3RssSFRj4IhzUV/qw9Uc1zYivuucYdrywCUjlMl6zJ
         YN4fE4mpAF3NVC5IrzYLcVCb5NyRm5VQmTLJmkldjoHViDhJxmy9XmWDwtR79SMayxbf
         McoFjwuBuYhJRj9/lN8Duq2qlHQCzePc8SoaoHCa/ezbnCgS6HfqsXgaB9zhqEshuZHQ
         fNcr2hHS8u8HtSTWMCBElkboLLll1MUkCrDZx89E+ye6fvESHAYV9HI4plC7X8bjg763
         vraA==
X-Gm-Message-State: AOAM533Pa/F31hHtHNfSb+TCBLnmz7FHTn/xasiIfQvf2pWYFSHJpySA
	3asWfQ5/y2RDJ3WA2119qwApNIHTMaY03/gb
X-Google-Smtp-Source: ABdhPJz3qbwvhJcQF4IMoDd/5J7sBEb631faOeHP/nulrj2S6gcKt+sj+eimrKWsCt9mywBRSFiPAQ==
X-Received: by 2002:a05:6402:10cc:: with SMTP id p12mr10347708edu.328.1623538449098;
        Sat, 12 Jun 2021 15:54:09 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host-87-0-253-36.retail.telecomitalia.it. [87.0.253.36])
        by smtp.gmail.com with ESMTPSA id h22sm4526132edv.0.2021.06.12.15.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 15:54:08 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] initramfs-debug-image: support cases where machines override IMAGE_FSTYPES
Date: Sun, 13 Jun 2021 00:53:59 +0200
Message-Id: <20210612225359.25688-2-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210612225359.25688-1-andrea.adami@gmail.com>
References: <20210612225359.25688-1-andrea.adami@gmail.com>

As done for initramfs-kexecboot-image we need to use python to get the
desired value for IMAGE_FSTYPES.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-core/images/initramfs-debug-image.bb           | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-core/images/initramfs-debug-image.bb b/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
index c3dcd2b821..601056b7e5 100644
--- a/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
+++ b/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
@@ -11,7 +11,12 @@ IMAGE_FEATURES = ""
 export IMAGE_BASENAME = "initramfs-debug-image"
 IMAGE_LINGUAS = ""
 
-IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+# Some BSPs use IMAGE_FSTYPES_<machine override> which would override
+# an assignment to IMAGE_FSTYPES so we need anon python
+python () {
+    d.setVar("IMAGE_FSTYPES", d.getVar("INITRAMFS_FSTYPES"))
+}
+
 inherit core-image
 
 IMAGE_ROOTFS_SIZE = "8192"
-- 
2.17.1

