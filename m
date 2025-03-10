Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896E7C282EC
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 13:31:27 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web11.37306.1741613485928121984
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 06:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SIvW4miC;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so3881835a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741613484; x=1742218284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/xM85zt00ByoIMrOOBMlxC+K1oKz1oISWBV9nhOnuhg=;
        b=SIvW4miCFrBYbJJWTxmEQvhSf7JUswUSaGNzTQHzl0TXPI0DOq8y7XFeRfUsGCVSbk
         eNIRhxmlt4QvbqN1KZd5hDLq8j37b2rzhWQZjXT0qpNZVu84EgEoBdHbOTIzePAIi5Bu
         CxV/VwaDwWPexN0KIAjsbibAKhSCgU3CkEnWgWh+O+4zFHQe4f5pY2DhnH4EiQXUcxRA
         mv7g4H45CuX2ZvAEI1XsuuIkv03yT1+IcWGvqiRYwJjH2ud9nont25oEtllTFtRUI9Mz
         VBxlDvERPXvx2w1aIYsAOYkEri+mwxBW1256MvxaGzcIFExkz3nzHgnNd1ryZx+bKpuv
         jvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741613484; x=1742218284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xM85zt00ByoIMrOOBMlxC+K1oKz1oISWBV9nhOnuhg=;
        b=BhkBDWFtIFFnGXgsSsuNuYoYk8n0kNnAmiHfAuoILXK49BrQRRsQShsdQP7wzOeA/G
         zxYQ5VYOmhXcMl4ZgIP4TwH5GFIKVietnaUfkHKkUOXEiJ0Qa7GFPQi3pzy7EHzV0L8+
         YaqDignZ5Yyv0SxweqaRqUp/zOGJ8jMzeAC8Bs4pxK2rPFxA8k4Y7YxXoeUK4skQzbaS
         qOuQJvkWBczcrHFl0F9hVL0of6icdY4TjH/sGZ6RrgykyJxiPV/QIZkTx4HkXobNtKZh
         tdkljSgXQBft4yHkvQkWz0fiUbCrDPEE6mi8q+7gdmFmOCEC5DmNynAAhR0J/o5zpoY7
         Bemw==
X-Gm-Message-State: AOJu0YzZLtQfsIPg3iVPC4mwUwWtfPvLvIWQuUM/TnjMhGXeNu92iv1L
	8L1R5vvStLmvOsagDUWIoYrlmmOlGAiPkM2Ql9qXVePszGVtu2FKfmRafA==
X-Gm-Gg: ASbGnctjn3P1ZJR+5R2R2Kk3YHhlnUNdyx4Moqf3MSJzzBSTgO6OghAgyVVEfulg/6I
	aW3LSH/cKeSD11gtjL1TY8hnMxb6BfiTCK8J1RWvShTINdqaxu1hjHypTU1PZ8JHsyZoxJc6Kvc
	UEo94qnfnS9Z5GDWK3qQ15lDy0yFRDQeX1RjLHhFhd6FBwOu/aLWXmRX/eSMkv/K0HBQ50VBj1w
	PGQu6rFKhTQbEGAtvNQ006mleshLU1TMltutC49EMS3OcZWhse6XeFfLJT5Fq4TbIvgIo01Gjzp
	wPZHNwJ0A6ZMX0fxJJLsS1S/Rt8ZvwgopXrF7lKqi11p7BbA8sP5/eTjrXVW
X-Google-Smtp-Source: AGHT+IE79zsMI661FDW9WYYYYFZB/PXkBteA7J7cRHwEYYmU6WSltNprTnmMqx9K3QzInFW9EGlClg==
X-Received: by 2002:a05:6402:845:b0:5e4:d2c2:b8e8 with SMTP id 4fb4d7f45d1cf-5e61508b46amr8624721a12.16.1741613478940;
        Mon, 10 Mar 2025 06:31:18 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5c733f39fsm7113671a12.11.2025.03.10.06.31.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 06:31:18 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v3] python3-pandas: compile against target version of numpy
Date: Mon, 10 Mar 2025 14:31:17 +0100
Message-ID: <20250310133117.1356742-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 13:31:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115834

python3-numpy headers are required by pandas to compile successfully.
By default, this recipe used python3-numpy-native for compilation,
which usually works. However in case the bitness of the build-host
differs from the target, then problems arise.

For example when compiling for 32-bit ARM on a x86-64 machine, the following
error appears when trying to import the module:

ValueError: Buffer dtype mismatch, expected 'const int64_t' but got 'long long'

When running a diff on all numpy headers across native and target,
only one header differs, _numpyconfig.h, in a significant way.
This header defines the sizes of different datatypes used by numpy,
and these sizes strongly depend on the arch bitness.

This change switches from python3-numpy-native dependency to python3-numpy to
ensure that the correct headers are used. Beside this also patch the meson script,
so it accepts an option (numpy_inc_dir) to specify the location of these headers,
since it is not able to query them from the class-target module

The PYTHONPATH variable is extended with the target's RECIPE_SYSROOT, because
numpy is specified as a dependency in meson, and it needs to find the module
to continue successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...ion-to-specify-numpy-header-location.patch | 66 +++++++++++++++++++
 .../python/python3-pandas_2.2.2.bb            |  9 ++-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch

diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
new file mode 100644
index 0000000000..87023a24ec
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
@@ -0,0 +1,66 @@
+From 16dd09e6c79768a24f5a50ec5985e0b6fdf17f35 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 10 Mar 2025 13:52:11 +0100
+Subject: [PATCH] BLD: add option to specify numpy header location
+
+In some cases the numpy module might not be usable during build-time,
+especially when cross-compiling. (E.g. when compiling for arm32 on a
+x86-64 machine, the arm32 module is not usable at build time).
+
+This makes meson fail, as it isn't able to figure out the location of
+numpy headers.
+
+To allow an alternative way to find these headers, introduce a meson
+build option, where the location of the numpy headers can be specified.
+
+In case numpy module cannot be loaded for some reason to query the
+include folder location, fall back to the value of this meson option.
+
+Upstream-Status: Submitted [https://github.com/pandas-dev/pandas/pull/61095]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ meson.options      |  1 +
+ pandas/meson.build | 13 ++++++++++---
+ 2 files changed, 11 insertions(+), 3 deletions(-)
+ create mode 100644 meson.options
+
+diff --git a/meson.options b/meson.options
+new file mode 100644
+index 0000000000..3d3a18d145
+--- /dev/null
++++ b/meson.options
+@@ -0,0 +1 @@
++option('numpy_inc_dir', type : 'string', description : 'The absolute path to the numpy headers')
+diff --git a/pandas/meson.build b/pandas/meson.build
+index 435103a..a08c77a 100644
+--- a/pandas/meson.build
++++ b/pandas/meson.build
+@@ -3,17 +3,24 @@ incdir_numpy = run_command(py,
+     '-c',
+     '''
+ import os
+-import numpy as np
++
++try:
++    import numpy as np
++    base_incdir = np.get_include()
++except Exception:
++    base_incdir = os.getenv('NUMPY_INC_DIR')
++
+ try:
+     # Check if include directory is inside the pandas dir
+     # e.g. a venv created inside the pandas dir
+     # If so, convert it to a relative path
+-    incdir = os.path.relpath(np.get_include())
++    incdir = os.path.relpath(base_incdir)
+ except Exception:
+-    incdir = np.get_include()
++    incdir = base_incdir
+ print(incdir)
+      '''
+   ],
++  env: {'NUMPY_INC_DIR': get_option('numpy_inc_dir')},
+   check: true
+ ).stdout().strip()
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
index c12a237653..ad9482e7dd 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
@@ -11,12 +11,14 @@ SRC_URI += " \
             file://0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch \
             "
 
+SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
+
 SRC_URI[sha256sum] = "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6c43093218de28b54"
 
 inherit pkgconfig pypi python_mesonpy cython
 
 DEPENDS += " \
-    python3-numpy-native \
+    python3-numpy \
     python3-versioneer-native \
 "
 
@@ -30,3 +32,8 @@ RDEPENDS:${PN} += " \
     python3-pytz \
     python3-profile \
 "
+
+PYTHONPATH:prepend:class-target = "${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}:"
+export PYTHONPATH
+
+EXTRA_OEMESON:append:class-target = " -Dnumpy_inc_dir=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include "

