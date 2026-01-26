Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47897CF65E1
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 11:23:36 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17977.1769426605833289328
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 03:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=LAtkIxHG;
 spf=pass (domain: konsulko.com, ip: 209.85.128.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee974e230so39889905e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 03:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769426604; x=1770031404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSg3Qoe7HcA3NUoMNa3ecUwKV8xqqLB5nFD0OZPlkwY=;
        b=LAtkIxHGqT5mEuWYEXGLVo1ZwEELNKtbgXQIiIkPmuErXgwGhdn5n9BSIE5a8zqmwP
         +axpkKOvhKBRAx5q/aKuFXDQ8vH9cXS3M00VKW75mtZYXECSs9olHRSVGhkkxvje+ZNp
         QtcDfN2EuQCAcgzJiAmeAUzbcrFgz4DHiGEjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426604; x=1770031404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pSg3Qoe7HcA3NUoMNa3ecUwKV8xqqLB5nFD0OZPlkwY=;
        b=wEiV6jSzGXa+fgKDiUoNP9kvId9YuKg+xkHs3cY9fFZaYQhk/2HLz/AMGz187Xbccv
         uu8U1qLhK9grhOWrKVmYfzVf0WVxe4fhKpsCwLYfKvyzRYdNkZKf/kxZ7aNQ/J3Zr60G
         5YoXGZnx2HoPo3+/RMJxs83I0oYKHuzPsYbrM2Y/4xq4ro1mn4Kh2DXjcCkJP+hogZTZ
         idt40p3X2IvQWY3eF7OTXuyo0JiZjtP17JVMr88cICVel+Nj7auzfOMgPawOErph2ObJ
         FsdzSZyUyMTiRh2w2w/zFz3czJ6rkvcKG5q6vz1PBJDVfxzbinuBRlKaunrKRByFYBk+
         WLvw==
X-Gm-Message-State: AOJu0YwX6ENxVfpoMfMF+TZfkxFr29gUZ4V+a0nCKhZtS2RYXdLTAymD
	NR+0cngYhuAxLe9QW703FqBk96kSsr1qd17NL5TNmNmrTk4u2rxPhqWkQ1hm7P11gf3nDL/OXTe
	KsSih
X-Gm-Gg: AZuq6aKNjL3/LiV0JQvBic2IPLTM0TwBYcDLNx2fQNfdt03lJUcOCrMdN6ILFLOEqGq
	RhURo/49ZcGNPN0KvLRhRnNPzxIrSQlxW7FI4G5TuekWjRpBHxaYma6eGn34c6vYBIuvIcPEQU8
	hOXcF6Oo8oUo6vwRhH0drvkVOCy+Kj6lFKXyLptrlx8TabQqidbTjZH6/hFco2hZQ5CKfwaDDTP
	ileMdxG77DsmzeGNK124KmrYNJUex7D+9I5t6YGMdF4mA31dtedhiv+VlrkEhnfmuQN07sj9BkC
	2LOTqqxz+RmjNGCC5ZaTPa8Gij9yM/eEJSjMdcJkeFVx1DDEy2z9G3z4zzVz2lCBAGGUBKGyVZ0
	Qc58LHDawykjz3o2dWOzfdJF8BtHXkFrICs6GfvOIDQCxQyV/vNltFQOF3gsu2Dtb9HC7QLCFXV
	Hl6oFWV9royF6MyYszfSdoUJp2
X-Received: by 2002:a05:600c:8710:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-4805f65c091mr52777745e9.10.1769426603416;
        Mon, 26 Jan 2026 03:23:23 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm267390205e9.15.2026.01.26.03.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:23:23 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pandas: Upgrade 2.2.3 -> 3.0.0
Date: Mon, 26 Jan 2026 13:23:18 +0200
Message-ID: <20260126112318.3443568-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126112318.3443568-1-leon.anavi@konsulko.com>
References: <20260126112318.3443568-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 11:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123869

Upgrade to release 3.0.0:

- Dedicated string data type by default
- Consistent copy/view behaviour with Copy-on-Write (CoW) (a.k.a.
  getting rid of the SettingWithCopyWarning)
- New default resolution for datetime-like data
- Initial support for the new pd.col syntax

License-Update: Update license year to 2026

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ion-to-specify-numpy-header-location.patch | 30 ++++++++-----
 .../0001-fix-reproducibility-issue.patch      | 43 -------------------
 ...t.toml-don-t-pin-dependency-versions.patch | 32 --------------
 ...andas_2.2.3.bb => python3-pandas_3.0.0.bb} |  9 +---
 4 files changed, 21 insertions(+), 93 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-fix-reproducibility-issue.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
 rename meta-python/recipes-devtools/python/{python3-pandas_2.2.3.bb => python3-pandas_3.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
index e83576eb62..ed5eb767e9 100644
--- a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
@@ -1,4 +1,4 @@
-From 16dd09e6c79768a24f5a50ec5985e0b6fdf17f35 Mon Sep 17 00:00:00 2001
+From 65db03f03dbb61172c6eea8b34d11ea9eb0c6d77 Mon Sep 17 00:00:00 2001
 From: Gyorgy Sarvari <skandigraun@gmail.com>
 Date: Mon, 10 Mar 2025 13:52:11 +0100
 Subject: [PATCH] BLD: add option to specify numpy header location
@@ -19,24 +19,29 @@ include folder location, fall back to the value of this meson option.
 Upstream-Status: Submitted [https://github.com/pandas-dev/pandas/pull/61095]
 
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  meson.options      |  1 +
- pandas/meson.build | 13 ++++++++++---
- 2 files changed, 11 insertions(+), 3 deletions(-)
+ pandas/meson.build | 12 +++++++++---
+ 2 files changed, 10 insertions(+), 3 deletions(-)
  create mode 100644 meson.options
 
+diff --git a/meson.options b/meson.options
+new file mode 100644
+index 0000000..3d3a18d
 --- /dev/null
 +++ b/meson.options
 @@ -0,0 +1 @@
 +option('numpy_inc_dir', type : 'string', description : 'The absolute path to the numpy headers')
+diff --git a/pandas/meson.build b/pandas/meson.build
+index 840ac25..2c3423e 100644
 --- a/pandas/meson.build
 +++ b/pandas/meson.build
-@@ -3,17 +3,24 @@ incdir_numpy = run_command(py,
-     '-c',
-     '''
+@@ -4,17 +4,23 @@ incdir_numpy = run_command(
+         '-c',
+         '''
  import os
 -import numpy as np
-+
 +try:
 +    import numpy as np
 +    base_incdir = np.get_include()
@@ -53,9 +58,12 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 -    incdir = np.get_include()
 +    incdir = base_incdir
  print(incdir)
-      '''
-   ],
-+  env: {'NUMPY_INC_DIR': get_option('numpy_inc_dir')},
-   check: true
+      ''',
+     ],
++    env: {'NUMPY_INC_DIR': get_option('numpy_inc_dir')},
+     check: true,
  ).stdout().strip()
  
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-fix-reproducibility-issue.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-fix-reproducibility-issue.patch
deleted file mode 100644
index deadacafa9..0000000000
--- a/meta-python/recipes-devtools/python/python3-pandas/0001-fix-reproducibility-issue.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 80274cd3a0746ddc5421643dd40d47bdf3c6a68c Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 26 Sep 2025 15:47:53 +0800
-Subject: [PATCH] fix reproducibility issue
-
-The type of new_value is either `npy_timedelta' or `int64_t'
-In build/pandas/_libs/tslibs/timedeltas.cpython-313-x86_64-linux-gnu.so.p/pandas/_libs/tslibs/timedeltas.pyx.c
-..
-npy_timedelta __pyx_v_new_value;
-...
-
-In build/pandas/_libs/tslibs/timedeltas.cpython-313-x86_64-linux-gnu.so.p/pandas/_libs/tslibs/timedeltas.pyx.c
-...
-__pyx_t_5numpy_int64_t __pyx_v_new_value;
-...
-
-Explicitly define it as int64_t to assure the generated source is
-reproducibility between builds
-
-Upstream-Status: Submitted [https://github.com/pandas-dev/pandas/pull/62459]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- pandas/_libs/tslibs/timedeltas.pyx | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/pandas/_libs/tslibs/timedeltas.pyx b/pandas/_libs/tslibs/timedeltas.pyx
-index f6c69cf..34ac9e7 100644
---- a/pandas/_libs/tslibs/timedeltas.pyx
-+++ b/pandas/_libs/tslibs/timedeltas.pyx
-@@ -1820,6 +1820,9 @@ class Timedelta(_Timedelta):
- 
-         disallow_ambiguous_unit(unit)
- 
-+        cdef:
-+            int64_t new_value;
-+
-         # GH 30543 if pd.Timedelta already passed, return it
-         # check that only value is passed
-         if isinstance(value, _Timedelta):
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
deleted file mode 100644
index 950f25303f..0000000000
--- a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From d46b8720a6bccb345f6bdd7ee2f5c357e7eb227b Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <tgamblin@baylibre.com>
-Date: Mon, 12 Aug 2024 11:27:36 -0400
-Subject: [PATCH] pyproject.toml: don't pin dependency versions
-
-Pandas will fail to build if the exact versions aren't found, but newer
-ones actually work. Since newer versions of pandas are adjusting the
-requires section of pyproject toml further, just patch it for us.
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- pyproject.toml | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -2,10 +2,10 @@
- # Minimum requirements for the build system to execute.
- # See https://github.com/scipy/scipy/pull/12940 for the AIX issue.
- requires = [
--    "meson-python==0.13.1",
--    "meson==1.2.1",
-+    "meson-python>=0.13.1",
-+    "meson>=1.2.1",
-     "wheel",
--    "Cython~=3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
-+    "Cython>=3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
-     # Force numpy higher than 2.0, so that built wheels are compatible
-     # with both numpy 1 and 2
-     "numpy>=2.0",
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb b/meta-python/recipes-devtools/python/python3-pandas_3.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_3.0.0.bb
index 91333d129d..01f57b9aa9 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_3.0.0.bb
@@ -4,16 +4,11 @@ high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language."
 HOMEPAGE = "https://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
-
-SRC_URI += " \
-            file://0001-pyproject.toml-don-t-pin-dependency-versions.patch \
-            file://0001-fix-reproducibility-issue.patch \
-            "
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e98642e1210ade884e5254ab18d55b7d"
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
 
-SRC_URI[sha256sum] = "4f18ba62b61d7e192368b84517265a99b4d7ee8912f8708660fb4a366cc82667"
+SRC_URI[sha256sum] = "0facf7e87d38f721f0af46fe70d97373a37701b1c09f7ed7aeeb292ade5c050f"
 
 CVE_PRODUCT = "pandas"
 
-- 
2.47.3


