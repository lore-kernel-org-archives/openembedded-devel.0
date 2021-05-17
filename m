Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.17382.1621248728981968108
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 03:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=HpYEX3be;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f42.google.com with SMTP id o6-20020a05600c4fc6b029015ec06d5269so3336095wmq.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 03:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsoYmQrxH7hrzIxxpA2BqDizdumbLE43aX07EwZ89Dk=;
        b=HpYEX3bexd6Pb5UK1VMPEIYmNc6XzZAz/sUsE+mQH5ZsUtVFyM5A8JdkMH7LD880Qv
         S3VXkGlyRX1qm+bMrezpexxChS1YisX0GBzAlNy8wHKIpx/wywTK+ujFf8oAt6iJ4kZB
         7RdPZvOuXws/HmTlJP8cpJe8vwKBWmmNDu+EdfEvaUP3jumTGXmGGAGPgAmH9ehYhxUb
         xgXPHnY2fpG3gwEYGogJJ4x1NWWifYzngtQzZ2My2+IduDmPk0OP/Ok/MR2qDdeLLmpp
         F+gJgWdeC3Rp1YjvQ1i9rh4HKJlxVvYQToGKpXoC+XzU07oOLdyTiiO8UWJa1yMeFfle
         GRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DsoYmQrxH7hrzIxxpA2BqDizdumbLE43aX07EwZ89Dk=;
        b=qDDAkrtjFYEe5AXn0IjAaH87pMn+zoCo9nQ//n4BhJPgC23azNqXpa0ou79dYuxylR
         upo8qJYq6uQFajxmc8qn58EOyZe5hoHQ7PmUzpdW0GjL+JAxjmnsRmI2MMWWnEh2RWmB
         GK3ugHRHvEXDx8JKIOAOlEkSOKH4VpJfyBXIr5fRlwv3x0bpaiVWuUkwae7A0n+G7UtC
         NDz5Mod4UI1n5qSub/7iMWe+L9N3nKVX2j0nG2fjjgccaVcvsTFpsH5d3yb6iCvaAHWD
         VxjDC8ZJEwHNm/kh4Na85aMK0zIIvOoR527M2GfGOF8hzEkCmijBittZn2kIjaCLCTit
         F1QQ==
X-Gm-Message-State: AOAM531vlSfBswuj1CZsvPRlIDbdYT0DqgcLFXJuZc+IuhMErW8j/Y9o
	ipYehtUQ2O+Idsa9gjE+zlTmhQ==
X-Google-Smtp-Source: ABdhPJznfmAiwrFcjuBL3d23Nqwu4CZUu89jq5odMi3CKB8tyU3oOY0TV9c+ELuomT6c129BCeMNuw==
X-Received: by 2002:a1c:2743:: with SMTP id n64mr22311572wmn.76.1621248727416;
        Mon, 17 May 2021 03:52:07 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id c7sm7688852wrs.23.2021.05.17.03.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:52:07 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH v2] python3-pycocotools: new package
Date: Mon, 17 May 2021 12:52:02 +0200
Message-Id: <20210517105202.13756-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a recipe for building pycocotools - a Python wrapper for cocapi.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
v1 -> v2:
- use virtual/crypt instead of libxcrypt to fix a build error with musl

 .../packagegroups/packagegroup-meta-python.bb        |  1 +
 .../python/python3-pycocotools_2.0.2.bb              | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index b9ab42130..828c7fea5 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -289,6 +289,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pybind11-json \
     python3-pybluez \
     python3-pychromecast \
+    python3-pycocotools \
     python3-pycodestyle \
     python3-pyconnman \
     python3-pycparser \
diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
new file mode 100644
index 000000000..ef2a7c589
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
@@ -0,0 +1,12 @@
+SUMMARY = "COCO is a large image dataset designed for object detection, segmentation, \
+           person keypoints detection, stuff segmentation, and caption generation."
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb539683cf245df8b6ce782d78f647"
+
+inherit setuptools3 pypi
+
+SRC_URI[md5sum] = "33858f23c8b99ce8116b70c32f6b6dd9"
+SRC_URI[sha256sum] = "24717a12799b4471c2e54aa210d642e6cd4028826a1d49fcc2b0e3497e041f1a"
+
+DEPENDS = "python3-cython-native python3-numpy-native virtual/crypt"
+RDEPENDS_${PN} = "python3-matplotlib python3-pillow python3-profile"
-- 
2.30.1

