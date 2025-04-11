Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE93FC369AB
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.14146.1744332131682478783
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Apr 2025 17:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CNt4auHR;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1406358b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Apr 2025 17:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744332130; x=1744936930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IYALoadFiLicczeUCU1OmOd7ouoB8E57XvzZOQPfZUg=;
        b=CNt4auHRaUKn4jKiY57H2U3MCcipn1N+bQFb2NHWLBmkHiz7ABV6PE+LHjm96g7Kad
         Y9StcqxMAN6jJTBbcUsz7g1yqXwbJeQIf0+LjrnlxEr40zJLVxoKh2MpN0uU2VD4oD0z
         mk/GJjAYb3NlJTMOtjUV36qbmCDXWU2e9NtDaqyaaye6NgI4qnGbSnVFULIxA2cmrKeg
         nPhdF6yzC8KSladmxaBxSDgwvLjf7XXwC61IOXkV5bINqzUV6wYGg5aW2kNHMb50pWpo
         NlEZ9mtyfDCwHxxnV/abL+YFXHzan718LWIhk1E0qgUcneE/G66wrC6NXZU5S6ffhpPh
         b2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332130; x=1744936930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYALoadFiLicczeUCU1OmOd7ouoB8E57XvzZOQPfZUg=;
        b=ixTEKsiKttNZH2xli8EP/cy+enR/UsDE8zng1yNqoey3kiF9Vu/A4DhN9/BTHfkTNl
         M02ZDReK6/h6kg3TSnU4QWsRj9W4Afl/tGz0qZyrcoa5WHHYBX1t15kOfOytSrjYq59s
         1BqfdrmhoyQ3lPcLjHEQlp9FMJfx8DH96jDrY3gVnsX+dpT8/jlkg9vLoNmWyZB9rVZM
         OkdotjU/gEZ+C9yjMLnUGQ23zyP/QzraAfzoEBrusNJO1A5UuiRl+b0lJbn3mPgZf2xE
         ryhzBjAwDMM4y1zq041wt/ApUVHHUL2ysr6tkep6MLePzpHnhxsN+PmnekYTW8U53zph
         FzEw==
X-Gm-Message-State: AOJu0YxlWX2gRCUI2VP9Em9etr1S914JazcgZktB5060Jvhov9J/+lOx
	OcBQPA4R/rT1lCvjTEdIwGylj9jdVMUJQY2RHwCYwScOlSewBSrW5zZL97Ej
X-Gm-Gg: ASbGncvEnbWAwJanenRj+TQHRxrWgC7QSHgP/5zHcimEQDrpUbSwEaU1DwiHc4eJouJ
	N+CvuL4chyaUFM6NTxIh1+kHYeCdzfbydjkwsASrkoGJ98e3W6GmmzX67KBvL5Sis2/EbCu2K/l
	coNskSJfZ2jSeOnleBYp36uqC2gA18gYJThaWAYgkS5J5AP3ZPzsZBs9HawWMwOHkpsXNlfGIp1
	oHLGxxCn35onf/EvOK3zps/YfgD5+ogjVXM8+XbjAGc0hVp794ZjLasK15B9DzKRGlhuDXIZOLq
	iPY7bgUvYrFHEcNNeYmFfAn77Ls/NZ0D
X-Google-Smtp-Source: AGHT+IGLl+wZoYufJFcsV0VaEdUNkFnosiT8fVQ2Oc/miLaLMw2TcRQRnxf2DmmeRUbihnszisXMtA==
X-Received: by 2002:a05:6a00:21c4:b0:736:ba49:97bb with SMTP id d2e1a72fcca58-73bd11a8470mr1049526b3a.5.1744332130425;
        Thu, 10 Apr 2025 17:42:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c6464sm226987b3a.64.2025.04.10.17.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:42:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [meta-python][PATCH 06/12] python3-matplotlib: Upgrade to 3.10.1
Date: Thu, 10 Apr 2025 17:41:55 -0700
Message-ID: <20250411004201.3826913-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250411004201.3826913-1-raj.khem@gmail.com>
References: <20250411004201.3826913-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Apr 2025 00:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116780

- Adjust for move to meson build system.
- Use system freetype and qhull
- Add ptest insfrastructure, they do not pass yet
- Add a patch to fix build on 32bit machines

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...-width-height-to-match-definitions-i.patch | 45 +++++++++++
 ...external-dependency-tarballs-via-mes.patch | 47 ++++++++++++
 .../matplotlib-disable-download.patch         | 75 -------------------
 .../python/python3-matplotlib/run-ptest       |  3 +
 .../python/python3-matplotlib_3.10.1.bb       | 49 ++++++++++++
 .../python/python3-matplotlib_3.7.2.bb        | 70 -----------------
 6 files changed, 144 insertions(+), 145 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib/0001-Change-types-for-width-height-to-match-definitions-i.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib/0001-Do-not-download-external-dependency-tarballs-via-mes.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/0001-Change-types-for-width-height-to-match-definitions-i.patch b/meta-python/recipes-devtools/python/python3-matplotlib/0001-Change-types-for-width-height-to-match-definitions-i.patch
new file mode 100644
index 0000000000..bf73bf9a22
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/0001-Change-types-for-width-height-to-match-definitions-i.patch
@@ -0,0 +1,45 @@
+From b19715aeafcf8440466553d01717924add1eabf4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Apr 2025 23:17:12 -0700
+Subject: [PATCH] Change types for width/height to match definitions in
+ BufferRegion
+
+This is found with clang
+
+Fixes
+../matplotlib-3.10.1/src/_backend_agg_wrapper.cpp:253:17: error: non-constant-expression cannot be narrowed from type 'unsigned int' to 'int' in initializer list [-Wc++11-narrowing]
+
+Upstream-Status: Submitted [https://github.com/matplotlib/matplotlib/pull/29894]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/_backend_agg.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/_backend_agg.h b/src/_backend_agg.h
+index 0e33d38dfd..dcbd7e1496 100644
+--- a/src/_backend_agg.h
++++ b/src/_backend_agg.h
+@@ -131,12 +131,12 @@ class RendererAgg
+ 
+     virtual ~RendererAgg();
+ 
+-    unsigned int get_width()
++    int get_width()
+     {
+         return width;
+     }
+ 
+-    unsigned int get_height()
++    int get_height()
+     {
+         return height;
+     }
+@@ -206,7 +206,7 @@ class RendererAgg
+     void restore_region(BufferRegion &reg);
+     void restore_region(BufferRegion &region, int xx1, int yy1, int xx2, int yy2, int x, int y);
+ 
+-    unsigned int width, height;
++    int width, height;
+     double dpi;
+     size_t NUMBYTES; // the number of bytes in buffer
+ 
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/0001-Do-not-download-external-dependency-tarballs-via-mes.patch b/meta-python/recipes-devtools/python/python3-matplotlib/0001-Do-not-download-external-dependency-tarballs-via-mes.patch
new file mode 100644
index 0000000000..144bfac185
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/0001-Do-not-download-external-dependency-tarballs-via-mes.patch
@@ -0,0 +1,47 @@
+From a6b0bc129de493f57bf79005c48a8d4ca0df68c2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Apr 2025 17:34:55 -0700
+Subject: [PATCH] Do not download external dependency tarballs via meson
+
+They are fetched by bitbake fetcher already
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ subprojects/freetype-2.6.1.wrap | 7 +------
+ subprojects/qhull.wrap          | 9 ++-------
+ 2 files changed, 3 insertions(+), 13 deletions(-)
+
+diff --git a/subprojects/freetype-2.6.1.wrap b/subprojects/freetype-2.6.1.wrap
+index 763362b..74ecb13 100644
+--- a/subprojects/freetype-2.6.1.wrap
++++ b/subprojects/freetype-2.6.1.wrap
+@@ -1,10 +1,5 @@
+ [wrap-file]
+-source_url = https://download.savannah.gnu.org/releases/freetype/freetype-old/freetype-2.6.1.tar.gz
+-source_fallback_url = https://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz
+-source_filename = freetype-2.6.1.tar.gz
+-source_hash = 0a3c7dfbda6da1e8fce29232e8e96d987ababbbf71ebc8c75659e4132c367014
+-
+-patch_directory = freetype-2.6.1-meson
++directory = freetype-2.6.1
+ 
+ [provide]
+ freetype-2.6.1 = freetype_dep
+diff --git a/subprojects/qhull.wrap b/subprojects/qhull.wrap
+index c52b07d..30b6904 100644
+--- a/subprojects/qhull.wrap
++++ b/subprojects/qhull.wrap
+@@ -1,9 +1,4 @@
+ [wrap-file]
+-# Also bump the cache key in `.circleci/config.yml`.
+-# Also update the docs in `docs/devel/dependencies.rst`.
+-directory = qhull-8.0.2
+-source_url = https://github.com/qhull/qhull/archive/v8.0.2/qhull-8.0.2.tar.gz
+-source_filename = qhull-8.0.2.tgz
+-source_hash = 8774e9a12c70b0180b95d6b0b563c5aa4bea8d5960c15e18ae3b6d2521d64f8b
++directory = qhull-2020.2
+ 
+-patch_directory = qhull-8.0.2
++patch_directory = qhull-2020.2
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch b/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
deleted file mode 100644
index aea8f62ea7..0000000000
--- a/meta-python/recipes-devtools/python/python3-matplotlib/matplotlib-disable-download.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Disable automatic downloading of components!
-
-Upstream-Status: Inappropriate [disable feature]
-
-Signed-off-by: Mark Hatle <mark.hatle@xilinx.com>
-
-Update patch to fit on 3.7.2.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
-
-diff --git a/setup.py b/setup.py
-index 0bea13fa6f..f39d8fc871 100644
---- a/setup.py
-+++ b/setup.py
-@@ -327,13 +327,7 @@ setup(  # Finally, pass this all along to setuptools to do the heavy lifting.
-         "pillow>=6.2.0",
-         "pyparsing>=2.3.1,<3.1",
-         "python-dateutil>=2.7",
--    ] + (
--        # Installing from a git checkout that is not producing a wheel.
--        ["setuptools_scm>=7"] if (
--            Path(__file__).with_name(".git").exists() and
--            os.environ.get("CIBUILDWHEEL", "0") != "1"
--        ) else []
--    ),
-+    ],
-     extras_require={
-         ':python_version<"3.10"': [
-             "importlib-resources>=3.2.0",
-diff --git a/setupext.py b/setupext.py
-index a898d642d6..474172ff8f 100644
---- a/setupext.py
-+++ b/setupext.py
-@@ -66,40 +66,7 @@ def get_from_cache_or_download(url, sha):
-     BytesIO
-         The file loaded into memory.
-     """
--    cache_dir = _get_xdg_cache_dir()
--
--    if cache_dir is not None:  # Try to read from cache.
--        try:
--            data = (cache_dir / sha).read_bytes()
--        except IOError:
--            pass
--        else:
--            if _get_hash(data) == sha:
--                return BytesIO(data)
--
--    # jQueryUI's website blocks direct downloads from urllib.request's
--    # default User-Agent, but not (for example) wget; so I don't feel too
--    # bad passing in an empty User-Agent.
--    with urllib.request.urlopen(
--            urllib.request.Request(url, headers={"User-Agent": ""}),
--            context=_get_ssl_context()) as req:
--        data = req.read()
--
--    file_sha = _get_hash(data)
--    if file_sha != sha:
--        raise Exception(
--            f"The downloaded file does not match the expected sha.  {url} was "
--            f"expected to have {sha} but it had {file_sha}")
--
--    if cache_dir is not None:  # Try to cache the downloaded file.
--        try:
--            cache_dir.mkdir(parents=True, exist_ok=True)
--            with open(cache_dir / sha, "xb") as fout:
--                fout.write(data)
--        except IOError:
--            pass
--
--    return BytesIO(data)
-+    raise IOError(f"Automatic downloading is disabled.")
- 
- 
- def get_and_extract_tarball(urls, sha, dirname):
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib/run-ptest b/meta-python/recipes-devtools/python/python3-matplotlib/run-ptest
new file mode 100644
index 0000000000..e99c96b342
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest --automake --pyargs matplotlib
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb
new file mode 100644
index 0000000000..d6523e7770
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.10.1.bb
@@ -0,0 +1,49 @@
+SUMMARY = "matplotlib: plotting with Python"
+DESCRIPTION = "\
+Matplotlib is a Python 2D plotting library which produces \
+publication-quality figures in a variety of hardcopy formats \
+and interactive environments across platforms."
+HOMEPAGE = "https://github.com/matplotlib/matplotlib"
+SECTION = "devel/python"
+LICENSE = "PSF-2.0"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
+"
+
+DEPENDS = "\
+    freetype \
+    libpng \
+    python3-pybind11 \
+    qhull \
+"
+
+SRC_URI += "file://run-ptest \
+            file://0001-Do-not-download-external-dependency-tarballs-via-mes.patch \
+            file://0001-Change-types-for-width-height-to-match-definitions-i.patch \
+            "
+SRC_URI[sha256sum] = "e8d2d0e3881b129268585bf4765ad3ee73a4591d77b9a18c214ac7e3a79fb2ba"
+
+inherit pypi pkgconfig python3targetconfig meson ptest-python-pytest
+
+EXTRA_OEMESON += "-Dsystem-freetype=true -Dsystem-qhull=true"
+
+# LTO with clang needs lld
+LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"
+
+FILES:${PN}-ptest += "${PYTHON_SITEPACKAGES_DIR}/matplotlib/tests"
+FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/"
+
+RDEPENDS:${PN} = "\
+    freetype \
+    libpng \
+    python3-numpy \
+    python3-pyparsing \
+    python3-cycler \
+    python3-dateutil \
+    python3-kiwisolver \
+    python3-pytz \
+    python3-pillow \
+    python3-packaging \
+"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
deleted file mode 100644
index 72c369100a..0000000000
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.7.2.bb
+++ /dev/null
@@ -1,70 +0,0 @@
-SUMMARY = "matplotlib: plotting with Python"
-DESCRIPTION = "\
-Matplotlib is a Python 2D plotting library which produces \
-publication-quality figures in a variety of hardcopy formats \
-and interactive environments across platforms."
-HOMEPAGE = "https://github.com/matplotlib/matplotlib"
-SECTION = "devel/python"
-LICENSE = "PSF-2.0"
-LIC_FILES_CHKSUM = "\
-    file://setup.py;beginline=293;endline=293;md5=20e7ab4d2b2b1395a0e4ab800181eb96 \
-    file://LICENSE/LICENSE;md5=afec61498aa5f0c45936687da9a53d74 \
-"
-
-DEPENDS = "\
-    freetype \
-    libpng \
-    python3-numpy-native \
-    python3-pip-native \
-    python3-dateutil-native \
-    python3-pytz-native \
-    python3-certifi-native \
-    python3-setuptools-scm-native \
-    python3-pybind11-native \
-"
-SRC_URI[sha256sum] = "a8cdb91dddb04436bd2f098b8fdf4b81352e68cf4d2c6756fcc414791076569b"
-
-inherit pypi setuptools3 pkgconfig
-
-# Stop the component from attempting to download when it detects a missing
-# dependency
-SRC_URI += "file://matplotlib-disable-download.patch \
-"
-
-# This python module requires a full copy of freetype-2.6.1
-SRC_URI += "https://downloads.sourceforge.net/project/freetype/freetype2/2.6.1/freetype-2.6.1.tar.gz;name=freetype;subdir=matplotlib-${PV}/build"
-SRC_URI[freetype.sha256sum] = "0a3c7dfbda6da1e8fce29232e8e96d987ababbbf71ebc8c75659e4132c367014"
-
-# This python module requires a full copy of 'qhull-2020'
-SRC_URI += "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz;name=qhull;subdir=matplotlib-${PV}/build"
-SRC_URI[qhull.sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e"
-
-# LTO with clang needs lld
-LDFLAGS:append:toolchain-clang = " -fuse-ld=lld"
-LDFLAGS:remove:toolchain-clang:mips = "-fuse-ld=lld"
-LDFLAGS:remove:toolchain-clang:riscv64 = "-fuse-ld=lld"
-LDFLAGS:remove:toolchain-clang:riscv32 = "-fuse-ld=lld"
-RDEPENDS:${PN} = "\
-    freetype \
-    libpng \
-    python3-numpy \
-    python3-pyparsing \
-    python3-cycler \
-    python3-dateutil \
-    python3-kiwisolver \
-    python3-pytz \
-    python3-pillow \
-    python3-packaging \
-"
-
-ENABLELTO:toolchain-clang:riscv64 = "echo enable_lto = False >> ${S}/mplsetup.cfg"
-ENABLELTO:toolchain-clang:riscv32 = "echo enable_lto = False >> ${S}/mplsetup.cfg"
-ENABLELTO:toolchain-clang:mips = "echo enable_lto = False >> ${S}/mplsetup.cfg"
-
-do_compile:prepend() {
-    echo [libs] > ${S}/mplsetup.cfg
-    echo system_freetype = True >> ${S}/mplsetup.cfg
-    ${ENABLELTO}
-}
-
-BBCLASSEXTEND = "native"

