Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F22CD1292
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 19:43:13 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.117914.1712605386661156476
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 12:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VKuwSF2A;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso6452551a12.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 12:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712605384; x=1713210184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G70jDEYsEB842l6jjz/aWst0PJj73/G6vtTf95sNwO0=;
        b=VKuwSF2AyYqf88/C5jejZULwIKC/8OnhWWMSZko7z2FWZpW5gBkp8HzgGQUtSbRHuQ
         8yQ6w2QOqI6Eqe4LpQyjSI6X90NbiFERuRITDIo5JucZ6VYzC9sykyF7hLkpnXnIqxbA
         ADnn0Nzghshu/H/cy9hYyVd4d9cNTilIzHof/RoyV0GMtICLuBlkFg1SiLAd55OvXkKh
         Esugq4zYTFsQEJxC3FY+2lrQcyjuNO1NqFUsEeXGP4k7cpjK0W6/JP6EDqQ5xTnFCJGX
         lgESAPJ0fQZpp81FoUTBjGAPQOlr0UoShCi2JlYdwDHP1guNbpLkRavT/zSFX+IawWyW
         oDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712605384; x=1713210184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G70jDEYsEB842l6jjz/aWst0PJj73/G6vtTf95sNwO0=;
        b=ZOU70zgnx/IszssGzUuHelxSnn55Zw7UErYqWpbqzvFz02NOfGVsM46AoY7EqGoaLZ
         rzGCgkKNddvTiWJqiPe/3x6qh7J0+gvdUAHVy7Dh4fyQh4a8/3uUthYOcGiSrM8JAZX/
         mwakIvqFGDdfloqSJ+YnJ3ZCF9t788d1RXcSTNNCCbkKOm8X6+iLTtcu532z16jc+ys9
         iYKMJY0FeOY4ptKFA3XiEbeV3TFW6cMoLujPbAf0G8GOy23CICHWHSA3/C4P010ITta0
         TxvRq4FAn5kkEkAdSSCU2BoxRFX6YMaC9Iakw5IpK8ncvhMx9sFvToSSaGiV2J0RrFyM
         EEOw==
X-Gm-Message-State: AOJu0YycdGWFNff/7K5iQqejHB/TnJP9kcM9071qED8UnHEAGkHfQr/j
	b06wk/Cgbk5NRq3B+ufqi37PkdlFx4slKRhsDkCP4DsYxylfuadABeNEbrGKs7M=
X-Google-Smtp-Source: AGHT+IEkif1Met0EIbxzCTOvtKx+CSe061Q3/F91Cv6I4sauIwQSRY07qCZM3xI9iWac8AeVoWa0dQ==
X-Received: by 2002:a50:c04c:0:b0:56d:c40d:b921 with SMTP id u12-20020a50c04c000000b0056dc40db921mr6571853edd.20.1712605384134;
        Mon, 08 Apr 2024 12:43:04 -0700 (PDT)
Received: from control-center.home (58-175-98-95.ftth.glasoperator.nl. [95.98.175.58])
        by smtp.gmail.com with ESMTPSA id p9-20020a056402074900b0056e584a79dbsm2026496edy.81.2024.04.08.12.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 12:43:03 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH v3] python3-chromecast: upgrade 13.1.0 -> 14.0.0
Date: Mon,  8 Apr 2024 19:31:41 +0000
Message-Id: <20240408193140.1689872-1-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 19:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109873

The python package has enabled to option to build it via python_setuptools_build_meta. Therefore the recipe is updated accordingly.
Also cleaned up the list of runtime dependencies which according to the package should no longer be needed.

The difference between v2 and v3 is the addition of the upstream status in the included patch.

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 ...ewer-version-of-wheel-and-setuptools.patch | 22 +++++++++++++++++++
 .../python/python3-pychromecast_13.1.0.bb     | 20 -----------------
 .../python/python3-pychromecast_14.0.0.bb     | 17 ++++++++++++++
 3 files changed, 39 insertions(+), 20 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
new file mode 100644
index 000000000..8825615de
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Allow-newer-version-of-wheel-and-setuptools.patch
@@ -0,0 +1,22 @@
+From e82caffe51b37c211f7f0cd60002fbc6b4e48d03 Mon Sep 17 00:00:00 2001
+From: Tom Geelen <t.f.g.geelen@gmail.com>
+Date: Sun, 7 Apr 2024 22:39:35 +0000
+Subject: [PATCH] Allow newer version of wheel and setuptools
+
+Upstream-Status: Pending
+Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 0f19c71..d0ecf11 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools~=65.6", "wheel~=0.37.1"]
++requires = ["setuptools>=65.6", "wheel>=0.37.1"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
deleted file mode 100644
index 30add4d2f..000000000
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.1.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Library for Python 3.6+ to communicate with the Google Chromecast."
-HOMEPAGE = "https://github.com/balloob/pychromecast"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
-
-SRC_URI[sha256sum] = "08e61a8b54bd2119d3c9ab1ec0136d3d8563aa97e0a3b57841588b9be60c2676"
-
-PYPI_PACKAGE = "PyChromecast"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-logging \
-    python3-zeroconf \
-    python3-json \
-    python3-requests \
-    python3-protobuf \
-    python3-compression \
-    python3-casttube \
-"
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb
new file mode 100644
index 000000000..be5a3a97e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Library for Python 3.6+ to communicate with the Google Chromecast."
+HOMEPAGE = "https://github.com/balloob/pychromecast"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
+
+SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
+SRC_URI[sha256sum] = "dc4f8b052e760a978da9b2568b79020cb79af608a026465f07544cffe43973cf"
+
+PYPI_PACKAGE = "PyChromecast"
+
+inherit pypi python_setuptools_build_meta
+
+RDEPENDS:${PN} += "\
+    python3-zeroconf (>=0.131.0) \
+    python3-protobuf (>=4.25.2) \
+    python3-casttube (>=0.2.1) \
+"
-- 
2.34.1


