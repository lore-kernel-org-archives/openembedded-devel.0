Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AC4E936F6
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 02:35:11 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.6998.1696473310975202470
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 19:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=loumv/WE;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6934202b8bdso398474b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 19:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696473310; x=1697078110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbCiybS7hIE3vMgsGqg9T3TQAmvR26wJ2qQb8LVvzgw=;
        b=loumv/WEzAPc3sHXnmqVmt1fvxnSiGp6r2x/06YpPJtdsHc0Kfq2tpoahHcAktGOD4
         7jkTq1jH4CVr6LzF46A4BPi9o/+yHEJ0n9N1jdA4b6LdZ1pQRkKUnaBuI/dUnnHRuGq/
         /jvd0iXFOg4TjMpcawn75igddbPAVUgUf48uvfGWRVMIFod7HIVOrkBu5hcCWyuqOY18
         0UoM0p9GC554FMjkYH51AfJLpr+giD8d0cFI6qbl/XAuhRqJu1pXATdxh1hgx6vby+TV
         U8sSS1OyjrIjg+EnPzk3giQKHUY7mV9VBs+Qx9o3UXPPn2z+o2nwH3X8HEG73bnjY4Dt
         5rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696473310; x=1697078110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbCiybS7hIE3vMgsGqg9T3TQAmvR26wJ2qQb8LVvzgw=;
        b=Mg/boB7nBqyCkIHKvQNH+r1ur8HvZWtUQTlfldwy3BbChCO56zC/spQyxj2+UsvQW5
         4hEJedw73eyrND5FK2Oe7MBq78k7PjfaDlA25XSEPZ3fTiUdjePPCnfj6ZTsGw16ELc7
         l2QEv4g+o5wf2RXzVt7tpUuV/9zw0+6DyZk+xj3yng+oRV0CGk3M4nxKdBZ22JHXB4XU
         ZzEEL3syks7F4RRBe5tJv/V/hmt8yalVfEA8sCBnK5RX6sv0Fw3MLbJkhxYDjHhJOUwe
         wfKWg3OdpUHW3ggMpE5H37YQpBWwegH4sts0wlZHYjhm6yRgndzTyklHXqBX94ABQCm5
         O1Zg==
X-Gm-Message-State: AOJu0YxJmYKcZpcTHHNf+5LDitEcjLCNufC1cSK70+K21vfhUkyc6nhS
	BC5beXEfbMfK+VQn0+WRC6aV24euG1tbRA==
X-Google-Smtp-Source: AGHT+IFeKrwAshygRw5L2zsEmkISELwmFm8vkzXhD7FSkra/t+SCmGSc3tVZSGroDvNx0aTfiWCdQA==
X-Received: by 2002:a05:6a21:66c7:b0:157:609f:6012 with SMTP id ze7-20020a056a2166c700b00157609f6012mr3735211pzb.61.1696473310126;
        Wed, 04 Oct 2023 19:35:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id i8-20020aa787c8000000b0068fe76cdc62sm235680pfo.93.2023.10.04.19.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 19:35:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-openembedded][PATCH 2/4] images: Delete layer specific base images
Date: Wed,  4 Oct 2023 19:35:03 -0700
Message-ID: <20231005023505.1072671-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231005023505.1072671-1-raj.khem@gmail.com>
References: <20231005023505.1072671-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 02:35:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105350

These were essentially duplicates of core-image-minimal, however
core-image-base is a better baseline for upper layers, so switched the
consumers of these images to use core-image-base

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../images/meta-filesystems-image-base.bb                  | 7 -------
 .../images/meta-multimedia-image-base.bb                   | 7 -------
 .../recipes-core/images/meta-networking-image-base.bb      | 7 -------
 meta-oe/recipes-core/images/meta-oe-image-base.bb          | 7 -------
 meta-perl/recipes-core/images/meta-perl-base.bb            | 7 -------
 meta-python/recipes-core/images/meta-python-image-base.bb  | 7 -------
 .../recipes-core/images/meta-webserver-image-base.bb       | 7 -------
 7 files changed, 49 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/images/meta-filesystems-image-base.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
 delete mode 100644 meta-networking/recipes-core/images/meta-networking-image-base.bb
 delete mode 100644 meta-oe/recipes-core/images/meta-oe-image-base.bb
 delete mode 100644 meta-perl/recipes-core/images/meta-perl-base.bb
 delete mode 100644 meta-python/recipes-core/images/meta-python-image-base.bb
 delete mode 100644 meta-webserver/recipes-core/images/meta-webserver-image-base.bb

diff --git a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-base.bb b/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-base.bb
deleted file mode 100644
index c89b1e1362..0000000000
--- a/meta-filesystems/recipes-filesystems/images/meta-filesystems-image-base.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "meta-filesystems build test image"
-
-IMAGE_INSTALL = "packagegroup-core-boot"
-
-LICENSE = "MIT"
-
-inherit core-image
diff --git a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb b/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
deleted file mode 100644
index 249f989a4b..0000000000
--- a/meta-multimedia/recipes-multimedia/images/meta-multimedia-image-base.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "meta-multimedia build test image"
-
-IMAGE_INSTALL = "packagegroup-core-boot"
-
-LICENSE = "MIT"
-
-inherit core-image
diff --git a/meta-networking/recipes-core/images/meta-networking-image-base.bb b/meta-networking/recipes-core/images/meta-networking-image-base.bb
deleted file mode 100644
index eaf1409537..0000000000
--- a/meta-networking/recipes-core/images/meta-networking-image-base.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "meta-networking build test image"
-
-IMAGE_INSTALL = "packagegroup-core-boot"
-
-LICENSE = "MIT"
-
-inherit core-image
diff --git a/meta-oe/recipes-core/images/meta-oe-image-base.bb b/meta-oe/recipes-core/images/meta-oe-image-base.bb
deleted file mode 100644
index df92f16705..0000000000
--- a/meta-oe/recipes-core/images/meta-oe-image-base.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "meta-oe build test image"
-
-IMAGE_INSTALL = "packagegroup-core-boot"
-
-LICENSE = "MIT"
-
-inherit core-image
diff --git a/meta-perl/recipes-core/images/meta-perl-base.bb b/meta-perl/recipes-core/images/meta-perl-base.bb
deleted file mode 100644
index 2af10b218c..0000000000
--- a/meta-perl/recipes-core/images/meta-perl-base.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "meta-perl build test image"
-
-IMAGE_INSTALL = "packagegroup-core-boot"
-
-LICENSE = "MIT"
-
-inherit core-image
diff --git a/meta-python/recipes-core/images/meta-python-image-base.bb b/meta-python/recipes-core/images/meta-python-image-base.bb
deleted file mode 100644
index 81081e61b2..0000000000
--- a/meta-python/recipes-core/images/meta-python-image-base.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "meta-python build test image"
-
-IMAGE_INSTALL = "packagegroup-core-boot"
-
-LICENSE = "MIT"
-
-inherit core-image
diff --git a/meta-webserver/recipes-core/images/meta-webserver-image-base.bb b/meta-webserver/recipes-core/images/meta-webserver-image-base.bb
deleted file mode 100644
index a4ce10f674..0000000000
--- a/meta-webserver/recipes-core/images/meta-webserver-image-base.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "meta-webserver build test image"
-
-IMAGE_INSTALL = "packagegroup-core-boot"
-
-LICENSE = "MIT"
-
-inherit core-image
-- 
2.42.0


