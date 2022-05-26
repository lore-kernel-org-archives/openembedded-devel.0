Return-Path: <omkarpatil10.93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408E7C433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 09:46:12 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.17731.1653558364005716735
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 02:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PKeLJYLG;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: omkarpatil10.93@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id h186so926044pgc.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=r3pdAUG2oV5P8Z180rAoJWzhJwkS3p/n5uC4Ub9rOKg=;
        b=PKeLJYLGfy9UQRHonIZwKy5MvWfExVajJFh2t5JaV1S1ngRi7I2pJpObXtz4noSTRK
         4Gw0lamN1U3QUYPsHz7EMYw1BeKZq0fHaIlsm+V0Mj3jOYJozej37+2AY9bT7ilxNIFX
         +3t2VgqEddHc1iTXEMY4XcJfQVLkVxyzulxp0R3Xr7hGqVNpEixbjyFvOzBzZX5+9onY
         TmAOuQQwNdceLmuBuvqZqCznpIU+T5hfTHWYqEg8BM+auLSttzShrsNi26/sqHCbXSTd
         S3OB6UODA/VW+3bPNE342ZbwpFrcSoLM7996MZAC079TxRUQsygiCnDId7x3Yzu2PeW1
         DvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=r3pdAUG2oV5P8Z180rAoJWzhJwkS3p/n5uC4Ub9rOKg=;
        b=mNvYk/UfzaKsPEf0fY8KMQBwdWWe6UVYnimWByWxEjKHMmA9H4RleqtZayX/moeEr+
         h1LF/7jChMmJR0Mj0gAeeaLRWzePfK2MBMPzKHmlPvzxE4mAwurwKrzfrDm8nfzcUv7W
         lMhIwsCi9AERoaDzJrTD3Wcm9Mhl9ff6q6x9v0qYnqnLSp5dWAB7mt6gtcEeXL+tynSj
         +4UL4zIuq3h1IjSqjO2BSNqigdh54qfBhAkC3/4bkYwpuxLr/4WmWPGe/TiWMyd4TjAs
         1CvW/IRLUB6CbLVY1/CaaS/AJTZzPKIfO2wGwxmMJQW/0rxX+FzhH1z4AQtVzLBBuOLW
         JKRA==
X-Gm-Message-State: AOAM530OSpXnEm+T1Z9f65ryh4tNDJcfE+Rx5+X4+DlyZ4sGPLLostrW
	uzHu2txqJdYhuQrm26+TGFizIJQZtWdWtQ==
X-Google-Smtp-Source: 
 ABdhPJzZdxnUe3B+Z0i4CKk9tRi2EaRWB2Yq7UVAFhvr53A47MKYDk7h+nffHdlxhaub6ckE4ZYZbA==
X-Received: by 2002:a63:d508:0:b0:3f5:e6b5:20f with SMTP id
 c8-20020a63d508000000b003f5e6b5020fmr32284849pgg.520.1653558363306;
        Thu, 26 May 2022 02:46:03 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:2101:95b4:acdb:cf08:7a5c:1177])
        by smtp.gmail.com with ESMTPSA id
 cd21-20020a056a00421500b0050dc7628175sm952953pfb.79.2022.05.26.02.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 02:46:02 -0700 (PDT)
From: Omkar Patil <omkarpatil10.93@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	omkarpatil10.93@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Omkar Patil <omkar.patil@kpit.com>
Subject: [oe][meta-filesystems][dunfell][PATCH] fuse: Set CVE_PRODUCT
Date: Thu, 26 May 2022 15:14:31 +0530
Message-Id: <20220526094431.19582-1-omkarpatil10.93@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 May 2022 09:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97277

From: Omkar Patil <omkar.patil@kpit.com>

set CVE_PRODUCT to avoid wrongly reported CVEs

Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
Signed-off-by: Omkar Patil <omkarpatil10.93@gmail.com>
---
 meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb | 3 +++
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb  | 6 ++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
index 24b17fc93..b15bcd228 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.9.2.bb
@@ -22,6 +22,9 @@ UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>3(\.\d+)+).tar.xz"
 
 inherit meson pkgconfig
 
+# set vendor along with fuse to fix wrongly reported CVEs
+CVE_PRODUCT = "fuse_project:fuse"
+
 DEPENDS = "udev"
 
 PACKAGES =+ "fuse3-utils"
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 49682b3cd..cfd9650c9 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -19,10 +19,8 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
 SRC_URI[md5sum] = "8000410aadc9231fd48495f7642f3312"
 SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
 
-# CVE-2019-14860 is a REDHAT specific issue and was addressed for REDHAT Fuse products on Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
-# REDHAT has also released the fix and updated their security advisories after significant releases.
-CVE_PRODUCT = "fuse"
-CVE_CHECK_WHITELIST += "CVE-2019-14860"
+# set vendor along with fuse to fix wrongly reported CVEs
+CVE_PRODUCT = "fuse_project:fuse"
 
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
-- 
2.17.1


