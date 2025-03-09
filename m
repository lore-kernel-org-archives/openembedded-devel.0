Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D03AC28B28
	for <webhook@archiver.kernel.org>; Sun,  9 Mar 2025 19:43:12 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.21984.1741549386693189170
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Mar 2025 12:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WdAK7JS8;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-391211ea598so2005286f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Mar 2025 12:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741549385; x=1742154185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/o3w5ElP/nYhKyqhvP8J6twmlGzxCT+k0fyCs9SOi1M=;
        b=WdAK7JS8IfEVjdO/WsT8Kfg1UsON4IPQgB0WMPz3nfwKX/ZGnt1B1vMgsHnq4MIpe+
         LkzJsNol0kiwbj/aCEbjGz1siwh8LuAGljld4muydjRcZuDT28RIVGZSQqP5HMgzNPVh
         GxdZMnurEgQ+c93RxfTl+wJwyIlTBHCwSxYfIyW931iXkHvNsnmiU6Hdek34IbHKaUfQ
         Q2XZgGd3oyNzMYpsMnAdbtX0piNdergyPiOkWj4HlcNP8oVaehHkKs95vPuw4emOuhD3
         BLJNPdHqv3NngPq7vS1E807auo9SkGcmaDEM+sVRRscFWWBnDDmEcvmb3+yR9yBp0IQR
         CDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741549385; x=1742154185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/o3w5ElP/nYhKyqhvP8J6twmlGzxCT+k0fyCs9SOi1M=;
        b=fPEpS3h5hiXDMVonsx6Xf9kXjPFmfrUeKWVFb5T0Vza5H4/i29r+y6CWCSPUAOYVVH
         1mHFyZ8UVkzz35gLUp/VnyVxxAAO2UgkK28gW4iq5kWaNpwbXHSADswZKhs0yqrxCX/q
         3S3q+LPL8pnkgDv2T2BZJwH9vT2G0zDEoy1C01HDUCbCn6s1nx52CwygtRyM2iwTKjpq
         CAwuR+46GdRJzLSI1CXLlzgkJLcDDXi9cVqRriOmQYR9Xoy73W8xMIKKwIw027rfxo9D
         tVzHoShjSSCc8cGKh0bhOCdz6sb7a0fM8zBfT3un/LzSF22/lIb6oiYzV4PgvDX1+y3B
         EcuA==
X-Gm-Message-State: AOJu0Yw0jIteX70Kxrwhy/1UQjw3BmCH/3SZDFMgXEEBVRfL+FuN+r/1
	v+QdnbtQXYg5/DnWQ8uNjBqu4HfTvy35Jm7crsdEh7oDthu0Skni2mUORA==
X-Gm-Gg: ASbGncsM07wc7HYegyBvXfobZqz87a2MtEgKci88MX1KosUxkSAfekd/GIxjG3p9B+4
	pgFT5FHT+dn7LOZUFsStiUw/JCBYeuthK844AAAKV4Of9/rFUGeOEebNbIEVCQJwkCHtnkq2Z/M
	SvtMpRZuOdwpAGUKTRkB7hbi4NFonbq+d0oJox3Cca+5RFPNEmlEcZoCD9YZfIs6CBM3faT/5Jc
	fKTrGP8RavDLL8bQnyXhVzL8lwZq/Wc6h0dtiIdP2iTE+ZRi1AhOTO0xnEMwUPULsJYmJ/HZ0f+
	RrC2N9DbMVxsdQTzBo6FCS35ER5HANiTlklb+trkHrnqqTo8kCgjCQAZqIsR
X-Google-Smtp-Source: AGHT+IGgq5LC8UG+C1hbSkTx7sdP2aSMqZXxT/acah6VkbZmC/EB1o1Bj19fUnHYn/kp5XdFFztr2g==
X-Received: by 2002:a05:6000:402b:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-39132db746amr6489565f8f.49.1741549384687;
        Sun, 09 Mar 2025 12:43:04 -0700 (PDT)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce3d5a0e2sm70322355e9.12.2025.03.09.12.43.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 12:43:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pandas: compile against target version of numpy
Date: Sun,  9 Mar 2025 20:43:02 +0100
Message-ID: <20250309194302.451216-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Mar 2025 19:43:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115816

python3-numpy headers are required by pandas to compile successfully.
By default, this recipe used python3-numpy-native for compilation,
which usually works. However in case the bitness of the build-host
differs from the target, then problems arise.

For example when compiling for 32-bit ARM on a x86-64 machine, the following
error appears when trying to import the module:

ValueError: Buffer dtype mismatch, expected 'const int64_t' but got 'long long'

When running a diff on all numpy headers across native and target,
only one header differs, but that one in a significant way:

--- ./_numpyconfig.h    2025-03-07 08:08:58.949476926 +0100
+++ <ARM32_FOLDER>/_numpyconfig.h    2025-03-07 08:09:10.811983538 +0100
@@ -2,16 +2,16 @@

 #define NPY_SIZEOF_SHORT 2
 #define NPY_SIZEOF_INT 4
-#define NPY_SIZEOF_LONG 8
+#define NPY_SIZEOF_LONG 4
 #define NPY_SIZEOF_FLOAT 4
 #define NPY_SIZEOF_COMPLEX_FLOAT 8
 #define NPY_SIZEOF_DOUBLE 8
 #define NPY_SIZEOF_COMPLEX_DOUBLE 16
-#define NPY_SIZEOF_LONGDOUBLE 16
-#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
-#define NPY_SIZEOF_PY_INTPTR_T 8
-#define NPY_SIZEOF_INTP 8
-#define NPY_SIZEOF_UINTP 8
+#define NPY_SIZEOF_LONGDOUBLE 8
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 16
+#define NPY_SIZEOF_PY_INTPTR_T 4
+#define NPY_SIZEOF_INTP 4
+#define NPY_SIZEOF_UINTP 4
 #define NPY_SIZEOF_WCHAR_T 4
 #define NPY_SIZEOF_OFF_T 8
 #define NPY_SIZEOF_PY_LONG_LONG 8

This change switches from python3-numpy-native dependency to python3-numpy to
ensure that the correct headers are used. Beside this also patch the meson script,
so it accepts an option (numpy_inc_dir) to specify the location of these headers,
since it is not able to query them from the class-target module

The PYTHONPATH variable is extended with the target's RECIPE_SYSROOT, because
numpy is specified as a dependency in meson, and it needs to find the module
to continue successfully.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...fy-numpy-header-path-as-meson-option.patch | 52 +++++++++++++++++++
 .../python/python3-pandas_2.2.2.bb            |  9 +++-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-specify-numpy-header-path-as-meson-option.patch

diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-specify-numpy-header-path-as-meson-option.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-specify-numpy-header-path-as-meson-option.patch
new file mode 100644
index 0000000000..039f116ff1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-specify-numpy-header-path-as-meson-option.patch
@@ -0,0 +1,52 @@
+From 46b3c3ee68f271acbc178260939ca8423f9244a5 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 9 Mar 2025 19:57:26 +0100
+Subject: [PATCH] specify numpy header path as meson option
+
+In case pandas is compiled against the class-target version of numpy, it is
+not possible to import the module, due to target-compiled binary files - 
+it just fails with an error. However this also means that meson isn't
+able to query the include folder location, so the compilation fails.
+
+To avoid this, the new "numpy_inc_dir" meson option allows specifying the
+location of the required headers.
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.options      | 1 +
+ pandas/meson.build | 6 +++---
+ 2 files changed, 4 insertions(+), 3 deletions(-)
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
+index 435103a954..32ad04bd8e 100644
+--- a/pandas/meson.build
++++ b/pandas/meson.build
+@@ -3,17 +3,17 @@ incdir_numpy = run_command(py,
+     '-c',
+     '''
+ import os
+-import numpy as np
+ try:
+     # Check if include directory is inside the pandas dir
+     # e.g. a venv created inside the pandas dir
+     # If so, convert it to a relative path
+-    incdir = os.path.relpath(np.get_include())
++    incdir = os.path.relpath(os.getenv('NUMPY_INC_DIR'))
+ except Exception:
+-    incdir = np.get_include()
++    incdir = os.getenv('NUMPY_INC_DIR')
+ print(incdir)
+      '''
+   ],
++  env: {'NUMPY_INC_DIR': get_option('numpy_inc_dir')},
+   check: true
+ ).stdout().strip()
+ 
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
index c12a237653..5676d98cd0 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
@@ -11,12 +11,14 @@ SRC_URI += " \
             file://0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch \
             "
 
+SRC_URI:append:class-target = " file://0001-specify-numpy-header-path-as-meson-option.patch "
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

