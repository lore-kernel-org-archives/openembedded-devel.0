Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.2665.1624825347522570527
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Jun 2021 13:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bjw3JxZY;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id k6so12262865pfk.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Jun 2021 13:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4PA3G+/gVWjC4OF3R15JmB8eK/2KE93G5Z7TUKW3nhM=;
        b=bjw3JxZYflFUF3WHI9iZJDU4cLvcQcJzQu8gv+qyUsBNJ4nneiAw/OSFc9hsAf5Mqd
         F5qyOIU7Srs8MSdzGZhoD1lN81RlETSUxmN9V922mi2fOH+E/cYkHLtQ1rtc6A/nnoKP
         tMK92dvHmewsRGvs55HMNnHReb1KteRcKg9Pn9PoKqf1GtXcmK16s9yNJKVE768ORoIE
         +vgvih5QAsE2BzQcFVY4EgNLwb0PmcIQxEHm1BxNHxhQZmkpY9pkYOsIcE9M7gs7akgc
         gK4r7g7FnnWH4/DnfFONfQDnSJYRp9PAialzmjeBSKYP4kTSGYzBqzo9yAaFMSqkYMLm
         BDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4PA3G+/gVWjC4OF3R15JmB8eK/2KE93G5Z7TUKW3nhM=;
        b=K6O+7nUjDWy7SG9peTUaY7WjexmEoD3gYVg4Eq48pUatnSnQAQG4AL+UuJcutLehUv
         BVVMOvH1AXrqQSbvQZ+FTpKf305SQkMHdaA95Br6OG4hOM7tHmZNn/A8IDIK2W1GlGkU
         yZ7jjUkvxhJ9GJ2ejnBlgZMJG3tIZtrqTw4wAZ+7mVymSHC2IYdn+RLSIgzsHMPa4ZoF
         cPxl466G8zuV7qFQJeJurRUEIjIxzHqPq4sjqoHVuDa4KlJPRHzSDRIvBgYz3V66zchh
         f1u2GjSM+ncZrhfHTSBap7EtF16bFAbEEnnxCgqvB1UBXTvXN0Sh/HTdRWneMtsohEOW
         t3Zw==
X-Gm-Message-State: AOAM533SbQfBsal7gl3HHY0V4fVoM5njdB6IpUWIKquswjbbXjuPtpTd
	yqO9UdOq2vpcE9OX4lqsXDptE0YKP1CKFA==
X-Google-Smtp-Source: ABdhPJxalOM5O4IFFCuoBDPn6KHTRBuK/UOIP8hCltvnRvsmGB2LMcZFy8KbuHh2maWCXP1mAp1oxQ==
X-Received: by 2002:a63:6bc5:: with SMTP id g188mr2411455pgc.186.1624825346934;
        Sun, 27 Jun 2021 13:22:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:90a0:cfd2:ffe1:efef])
        by smtp.gmail.com with ESMTPSA id ay3sm3501192pjb.38.2021.06.27.13.22.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 13:22:26 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 09/20] initramfs-debug-image: support cases where machines override IMAGE_FSTYPES
Date: Sun, 27 Jun 2021 13:22:04 -0700
Message-Id: <5195f02b0d1b1ac91c3f2e1cc69c8ec9bc2ca2e0.1624825239.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1624825239.git.akuster808@gmail.com>
References: <cover.1624825239.git.akuster808@gmail.com>

From: Andrea Adami <andrea.adami@gmail.com>

As done for initramfs-kexecboot-image we need to use python to get the
desired value for IMAGE_FSTYPES.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 93e139c998857048182ed4169f04cfe350eab013)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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

