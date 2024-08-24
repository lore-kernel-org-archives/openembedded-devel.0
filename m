Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170E2C52D6F
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 17:12:57 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.16959.1724519570346614670
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Aug 2024 10:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OQbXoNEK;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fec34f94abso29118525ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 10:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724519569; x=1725124369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4PHNzQ+RVOaCQB609G2b7kkbc41FHZl8Qi3brSKOpKg=;
        b=OQbXoNEKa6r/IINjnKzJC6CeGxfD3jdoAHcf+LiGettgQhw9aFbOgG4t9ros9RcLNB
         rhPZ2sUOP4Hopz3uSWcrCx1pgEamJg/DntgKFI7vsiOlsrZVsR5NDEfeN5UQagpE8Mbz
         O0mnWIIksgLrKoh/2oI18hMYZ02gLhO66JZdIVvYGeGl4K41ZuxFIfMzhXBxn0hJbTsB
         DnSt/nI2A/u3OXEMPNkYxuhljNDwXnI9uNch5yeTwqXKbIsMmyJuOJy4bEkPF2DmLMCV
         +ukWWHNbryalDN7bbA/EWfF5r9xJyqwVIPHW8BBDibA236lJwNMv8uMWjIKQbNeKHqMd
         yc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724519569; x=1725124369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PHNzQ+RVOaCQB609G2b7kkbc41FHZl8Qi3brSKOpKg=;
        b=TRD0YWI5IjLFZdc1OW5D9Qb7tkz1wG52FZzJf6CPVZHwWQ4G5+0XjO1PY4LEeBZ/vS
         MYBlk0vADdjDVsfNDCQleNP4LSjszZYO0EmQ6RiQAjRmmuDDv5tpc92/fPPaEflou+Cm
         h2b5zH2BHcNLoTXKR0sNt8opnK8Dwu/XiIT1TjpUKV+PxvXIxrir8rO3AwfZa7X5pSdR
         XC+wfMXytmZ51TrAAFyLRLTyf5jlgcbOTHZBQvRgVNXILi2aqJeC1uXSNNh6bDSp62KL
         vlV5ueqZDA68WtJvctrhpyMDP6+6s9T0/PfAjh/H33opojek8IgDtjRjHe1p1h+SNjZ3
         PVYQ==
X-Gm-Message-State: AOJu0YwskBqDDQfv6uxGaIyf+puecmXo2fUGnrfdBg9P2yMYkJbM+aKA
	Y8lJeyEPjIplbbcN3kvS8G/cy02KJKMsaOPPaUWGkZeejmjkWvthQawIKw==
X-Google-Smtp-Source: AGHT+IEzkKdowLgpkUo8iIJCOX3CQeeH2/GDeWbgQ26M/sYm/+CjI9vILlQ3StoY5A3wUmCq9uHKOQ==
X-Received: by 2002:a17:902:ec8e:b0:201:f6e6:c7cf with SMTP id d9443c01a7336-2039e4ef0c1mr70429005ad.45.1724519569180;
        Sat, 24 Aug 2024 10:12:49 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::77e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038560dfd1sm44250405ad.206.2024.08.24.10.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 10:12:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pycocotools: Downgrade numpy version needed to 1.x
Date: Sat, 24 Aug 2024 10:12:45 -0700
Message-ID: <20240824171246.1359812-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 17:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111919

This is needed for it to build with PEP-517 backend, older backend
ignored the version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-downgrade-numpy-version-to-1.26.4.patch | 26 +++++++++++++++++++
 .../python/python3-pycocotools_2.0.8.bb       |  2 ++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycocotools/0001-downgrade-numpy-version-to-1.26.4.patch

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools/0001-downgrade-numpy-version-to-1.26.4.patch b/meta-python/recipes-devtools/python/python3-pycocotools/0001-downgrade-numpy-version-to-1.26.4.patch
new file mode 100644
index 0000000000..cd3e462ddf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycocotools/0001-downgrade-numpy-version-to-1.26.4.patch
@@ -0,0 +1,26 @@
+From 7222a8b9b6e05b89116ca14644aa8db79eecd3c6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 24 Aug 2024 00:19:23 -0700
+Subject: [PATCH] downgrade numpy version to 1.26.4+
+
+We can drop it when OE-core upgrades numpy to 2.x
+
+Upstream-Status: Inappropriate [OE workaround]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 1bfbd91..cbee520 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,7 +1,7 @@
+ [build-system]
+ requires = [
+     "cython>=0.27.3",
+-    "numpy>=2.0.0rc1",
++    "numpy>=1.26.4",
+     "setuptools>=43.0.0",
+     "wheel",
+ ]
diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
index 47c750104e..7226f0fb81 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.8.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb5
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://0001-downgrade-numpy-version-to-1.26.4.patch"
+
 SRC_URI[sha256sum] = "8f2bcedb786ba26c367a3680f9c4eb5b2ad9dccb2b34eaeb205e0a021e1dfb8d"
 
 DEPENDS = "python3-cython-native python3-numpy-native virtual/crypt"

