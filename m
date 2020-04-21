Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.1537.1587482378110711994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Apr 2020 08:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Zm3YwT0r;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: andrea.adami@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id b11so16878242wrs.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2020 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tVpylpFYwx1lr2akgLq8zxi0ym6hOjPCjZ7Mff3rmbg=;
        b=Zm3YwT0rsPr8qS8E4UY9yO4I60eQ3BqYZaFKikIg+6V+HVHok0d10KV2vL8BZeBpyU
         h4kKnUVqrsaN/iRSI+ZdRS0iSj+rhJbvFZH8CwLrkUFoIzT8ftrIHh1VsLwXhvbPsa/g
         gZUwuhcxR4FBm/i0CblDwTNLRHvsLpXCJP1/9gObAwmc5CIIvUCvXTt4kWp0lkL2HgAO
         zIP1wjxVrh+w9o/Ej6glv2iiH2o4GX1Gjuju0TzKsXVNSViuEFtfrgtdRQCzjwVWrpG2
         z5Pt2Wktk/EqOliCFUxAkYa7NzXA1E1L7//uySN35Ns8Syz2aaiX0iPtzjTY+BXz4h5q
         7CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tVpylpFYwx1lr2akgLq8zxi0ym6hOjPCjZ7Mff3rmbg=;
        b=TiLp7OqtU6iGCPQIzRR2MCQYVdYBDfowZs0jiC8VNvA5UiCyTFHoxtE+CKb0bP/Vza
         ZWoyzbZFqXH8JZYKxEEcvM7FTQmtMXUbm12lUvaVpmGK2894yPT8pOCaYBITf2KBX8gH
         U7La76lB/tQYYXjHYKWoBscZpCqs0JoemOSzm4kgq/h9UY8RBf0T1CeJdkXmFto0wHjX
         ir4yLQwnWcOqkTRrriMfRd7j0DNGvDvC5UqeQT/9HJq/+Yftpzr7meysWt5/jsovdbCB
         z97PFRcDK7YY7tTBuczWgN8By8bs8lOH+O3oCEYHcF6hwYfZKHKkK0vjhIE4fqTKv71c
         ivHg==
X-Gm-Message-State: AGi0PuYvG2rwqv6ke7a6Keyx2stgn5CA/QZZpFOGVdXGyvUDTC6DWA2W
	844mrcwT3H4gvty9LP1eFV6DeDKn
X-Google-Smtp-Source: APiQypJXJTvC8gwWwW45nYWVFTFJDFR4giszflmKsvVAtjs39nTGrhSusY2zvh0fpmEhhsSYqOgeSw==
X-Received: by 2002:adf:e704:: with SMTP id c4mr23754451wrm.181.1587482376471;
        Tue, 21 Apr 2020 08:19:36 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host220-224-dynamic.250-95-r.retail.telecomitalia.it. [95.250.224.220])
        by smtp.googlemail.com with ESMTPSA id h5sm4407674wrp.97.2020.04.21.08.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 08:19:35 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] Remove LICENSE = "MIT" from images
Date: Tue, 21 Apr 2020 17:19:32 +0200
Message-Id: <20200421151932.13070-2-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421151932.13070-1-andrea.adami@gmail.com>
References: <20200421151932.13070-1-andrea.adami@gmail.com>

As in commit 9d55993
This is the default in the packagegroup and image classes.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-core/images/initramfs-debug-image.bb | 2 --
 meta-initramfs/recipes-core/images/meta-initramfs-image.bb  | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-initramfs/recipes-core/images/initramfs-debug-image.bb b/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
index be7350ade..c3dcd2b82 100644
--- a/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
+++ b/meta-initramfs/recipes-core/images/initramfs-debug-image.bb
@@ -11,8 +11,6 @@ IMAGE_FEATURES = ""
 export IMAGE_BASENAME = "initramfs-debug-image"
 IMAGE_LINGUAS = ""
 
-LICENSE = "MIT"
-
 IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 inherit core-image
 
diff --git a/meta-initramfs/recipes-core/images/meta-initramfs-image.bb b/meta-initramfs/recipes-core/images/meta-initramfs-image.bb
index 9d70d6d02..4c041eb5f 100644
--- a/meta-initramfs/recipes-core/images/meta-initramfs-image.bb
+++ b/meta-initramfs/recipes-core/images/meta-initramfs-image.bb
@@ -3,6 +3,4 @@ SUMMARY = "meta-initramfs build test image"
 IMAGE_INSTALL = "packagegroup-core-boot \
                  packagegroup-meta-initramfs"
 
-LICENSE = "MIT"
-
 inherit core-image
-- 
2.17.1

