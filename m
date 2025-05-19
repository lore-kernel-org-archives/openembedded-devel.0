Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB1EC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 22:05:37 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.7305.1747692333460374751
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 15:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EnyyP5NI;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23229fdaff4so22472685ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 15:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747692333; x=1748297133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZeDGz3/Ysn+ExcXGKSWpGIGJWBuE5sotej8eQYph0Q=;
        b=EnyyP5NISnLU6g+rU7qAi1BIU9sJ1Ih/MsDAP7okoZQDCchGLqZ2mFFG+cx1o+u5ZZ
         eIneHEoibLhDqwrcsvoeuYS2LLspT7qP3X1RoWtiYTVZDk7kAyKXLq2j+h9ZzIb0F4KB
         UYVWO+Ync838daBw9F7WJptS7ou0tLz5ScZdLfAsxDom0BQU8bi6cu0Iez8bRXJzpnT8
         DFM2FuNlFbemGL7LU8JX/CJ0MHxJ8R5HFuy26nae2jicww7xCHXiagEAmJDxFieVCCS0
         3Wla0DDwnSkATfXy5IfI+QrZ65SCr8Nt2oLDfavx65ELaSVMIeryGZr+RttCizw9Q3n6
         U6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747692333; x=1748297133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZeDGz3/Ysn+ExcXGKSWpGIGJWBuE5sotej8eQYph0Q=;
        b=RcjSpFf4n/gjSOpIJ3D+1fi6Wp5ligXPm+gAUMQETHc5fsx+F+feCvHKN2zDSbDGyd
         7WOi5ZU1oBB+7SCkReTaiKOn+NY7Q10ya04RXOVVA5PwAD/cYhq4ygHcbTROzOMshOkd
         86CCeqJ4GWBVdH+FDCJpQ2KjOxGhO5pF8T+0ViyJSIOOw0+T98bSfwRP9MzYqb+mrJUc
         mx9mXNQQBlVUEbEFuXXvahyznsdJkPmVzX0GFvilBvN8B98VAENLNKIcdqRpUeIqkNUn
         ZKpdUYODLnMsPpaOWJ+Y+tmjNhNdvYPzZb0Vd2J7+/iSmzXGcj+ffiIwGXSg+NoD6Lz/
         jCzQ==
X-Gm-Message-State: AOJu0Yz0L3ZbLq8cAg3RHzBZPerO1z9nTTrFXTacQvAofmJ3oblfsWqI
	9OpR7GpZjCUi4QcB9ajAV1x8XPgomTzsU1qc5qlgxzfGL9Rfdi3uimgZPqID0MoC
X-Gm-Gg: ASbGncuIe3VAWmoQNm5r5ja6ypjg8Yc9SOo+oHFXYZpsp8KfCo3RxHwpUVkLxJQMRDS
	/0LzK9lBLaV3MGcE9dPDrRJJMjO5vKe8zXwCM2mPpz6t6bv8EWgbFXvJqNUwJnvJsracc4nUEP0
	EVsYdkURLPBkQekAt007YvA/iyzyvB5YVyAlmrIIHWVjmzKewqIdZHIrhs7XmUXPJPXw+uKfDPA
	5ltAHfWhHUB1egubynno/Hy8k2arerWVa2c7F61RqkwuHtAbdFzg67fOqhC3EGBNSS4c+7DTtW3
	F2HAL+hmJJPEEN2lDpR1+yWhQ47HAueBVdO83/M1T6s=
X-Google-Smtp-Source: AGHT+IHYEVGBXAf0u1JtWnfqxuSyWtdCOJTzmq3autf9YTzq+q8r3nliJkbkrs6kQx0OLrKKrawxcw==
X-Received: by 2002:a17:903:3295:b0:22e:7c8b:7e66 with SMTP id d9443c01a7336-231d43bdf7amr160331765ad.26.1747692332489;
        Mon, 19 May 2025 15:05:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365e5b51sm174810a91.32.2025.05.19.15.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:05:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-python][PATCH v2] python3-pandas: Upgrade to 2.2.3
Date: Mon, 19 May 2025 15:05:29 -0700
Message-ID: <20250519220529.1133843-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 22:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117481

Fixes build with cython >=3.1
Drop patch to pin numpy to 1.x
Edit out absolute paths from cython generated C files

Cc: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix absolute paths in PN-src

 ...ion-to-specify-numpy-header-location.patch |  5 ----
 ...Downgrade-numpy-version-needs-to-1.x.patch | 27 -------------------
 ...t.toml-don-t-pin-dependency-versions.patch | 11 +++-----
 ...andas_2.2.2.bb => python3-pandas_2.2.3.bb} |  9 +++++--
 4 files changed, 10 insertions(+), 42 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch
 rename meta-python/recipes-devtools/python/{python3-pandas_2.2.2.bb => python3-pandas_2.2.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
index 87023a24ec..e83576eb62 100644
--- a/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-BLD-add-option-to-specify-numpy-header-location.patch
@@ -25,15 +25,10 @@ Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
  2 files changed, 11 insertions(+), 3 deletions(-)
  create mode 100644 meson.options
 
-diff --git a/meson.options b/meson.options
-new file mode 100644
-index 0000000000..3d3a18d145
 --- /dev/null
 +++ b/meson.options
 @@ -0,0 +1 @@
 +option('numpy_inc_dir', type : 'string', description : 'The absolute path to the numpy headers')
-diff --git a/pandas/meson.build b/pandas/meson.build
-index 435103a..a08c77a 100644
 --- a/pandas/meson.build
 +++ b/pandas/meson.build
 @@ -3,17 +3,24 @@ incdir_numpy = run_command(py,
diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch
deleted file mode 100644
index b0ef8ce00c..0000000000
--- a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From d81d95274d84ac51fc02e0fa91affc7f3cbefccb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 24 Aug 2024 10:21:43 -0700
-Subject: [PATCH] pyproject.toml: Downgrade numpy version needs to 1.x
-
-Drop it when numpy is upgraded to 2.x or newer in core
-
-Upstream-Status: Inappropriate [OE workaround]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pyproject.toml b/pyproject.toml
-index 5158d60..d3daa78 100644
---- a/pyproject.toml
-+++ b/pyproject.toml
-@@ -8,7 +8,7 @@ requires = [
-     "Cython>=3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
-     # Force numpy higher than 2.0rc1, so that built wheels are compatible
-     # with both numpy 1 and 2
--    "numpy>=2.0.0rc1",
-+    "numpy>=1.24.0",
-     "versioneer[toml]"
- ]
- 
diff --git a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
index f60f43a5b0..950f25303f 100644
--- a/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
+++ b/meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-don-t-pin-dependency-versions.patch
@@ -14,8 +14,6 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  pyproject.toml | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
-diff --git a/pyproject.toml b/pyproject.toml
-index db9f055799..5158d60f59 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -2,10 +2,10 @@
@@ -27,11 +25,8 @@ index db9f055799..5158d60f59 100644
 +    "meson-python>=0.13.1",
 +    "meson>=1.2.1",
      "wheel",
--    "Cython==3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
+-    "Cython~=3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
 +    "Cython>=3.0.5",  # Note: sync with setup.py, environment.yml and asv.conf.json
-     # Force numpy higher than 2.0rc1, so that built wheels are compatible
+     # Force numpy higher than 2.0, so that built wheels are compatible
      # with both numpy 1 and 2
-     "numpy>=2.0.0rc1",
--- 
-2.39.2
-
+     "numpy>=2.0",
diff --git a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
index b956f5ca2f..c7e3ec8fec 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
@@ -8,12 +8,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb819092901ddb13a7d0a4f5e05f098a"
 
 SRC_URI += " \
             file://0001-pyproject.toml-don-t-pin-dependency-versions.patch \
-            file://0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch \
             "
 
 SRC_URI:append:class-target = " file://0001-BLD-add-option-to-specify-numpy-header-location.patch "
 
-SRC_URI[sha256sum] = "9e79019aba43cb4fda9e4d983f8e88ca0373adbb697ae9c6c43093218de28b54"
+SRC_URI[sha256sum] = "4f18ba62b61d7e192368b84517265a99b4d7ee8912f8708660fb4a366cc82667"
 
 inherit pkgconfig pypi python_mesonpy cython
 
@@ -36,4 +35,10 @@ RDEPENDS:${PN} += " \
 PYTHONPATH:prepend:class-target = "${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}:"
 export PYTHONPATH
 
+do_compile:append() {
+    # Fix absolute paths in generated files
+    find ${B} -name "*.c" -o -name "*.cpp" | xargs -r \
+        sed -i 's|${WORKDIR}/pandas-${PV}/|${TARGET_DBGSRC_DIR}/|g'
+}
+
 EXTRA_OEMESON:append:class-target = " -Dnumpy_inc_dir=${RECIPE_SYSROOT}${PYTHON_SITEPACKAGES_DIR}/numpy/_core/include "

