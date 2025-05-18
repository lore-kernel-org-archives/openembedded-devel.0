Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58CBC3ABDD
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 17:33:16 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.34326.1747589592621359817
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 May 2025 10:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GWZxrZHe;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742caef5896so261491b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 10:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747589592; x=1748194392; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=opbjN+gkfgtlirG9nckK3EEpcZI0OTur7664sVJte+U=;
        b=GWZxrZHe9hh711SoiPSG9ct7hEeYcwKW1bRaktb3Kf4UzjFKw1MtweLINAnCsTJfXk
         4AReiZS64Qj/d5RiPK6GPQrYVumg98QZODfMXYD+wcfo4N6FZX43gn/yzk5xkys7RjZa
         FINhfYdyIBNrfTt9vvW1UYPC4z4v72KhMNMjjo9EfyOa1zZ7I03/tCSzITjeEE8Dro60
         RkgzW8PmdMA44TH5eponWjqht6BtObWXmhXpiJEe3ftrK3NjQiXoQtbaT36w+jpulhJW
         n3Xiik69vfpIxj4vXAG1sGjrsJbDQuUQI3af08Mw/AXhudsb/NEh8mlxm6I591DXEgeB
         KFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747589592; x=1748194392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opbjN+gkfgtlirG9nckK3EEpcZI0OTur7664sVJte+U=;
        b=Tup6ao2PPt0X18zSpv/OVA8MnxBSdadRQNkG/cNkRDyi8v5W0kS62X7DfubYawdYBH
         QOEnzMYfzNxQH41DltsMD0+QV96NmlfJ76dNYxiUWgAhjRwNh5T3/ZPaWF/rzsiXg1VN
         lAhQCrURl/ur+eypd6Z6E6xoMWOfLiYsoyLJnCEX81RUfLSqWQqRoZEwv7t9DCdiUtAT
         cs+k/emWq1nTz2ETUNFxX8Hb3OcsRhUt3IoeyZ6Dp9SRlOnr0hf3U5hHRdWLsG8HA8zg
         tyxHWzYbjfebEM/7rA+9HF0rt9ohBMR8TyvLwFnEgqVGl3cdfiOc2k9Dy502aNxu5wKZ
         CjCQ==
X-Gm-Message-State: AOJu0Yz2QalzPBEzlg3zl4/Tp6XFbh9MOAd8Hy3yZKwwiOa4pcBe5Jw9
	uJVvhmEUnOe1FOa8X0rbU9x6BNshAclXBxW2CxrnkewQHe1ViaeKCljYV05No7zv
X-Gm-Gg: ASbGncuX5X4KmT3t1XtfJFeGweFUHPn7MHyHfb0l/k30mIv1Iir8qHYaR1Xcgn+CCWd
	S0zycP/4q1Dp4AzlwEd139iENcO8eRbXGYdWtS5eCJFSENx8gVW71HhjzG3Wvyl/fF0NvcPdxH0
	DkOE0RLjcSfMgG2uwxFbFEyyHCjb2WhRE49tFS7OiAtMLSF26ysgXq+uw3twS/jvlYyjEOsDqQS
	VA6By0VNyGgJ6eAhQSGvdqMa5V7XdkgDhN4Y9Hvq2DnyBK4xTQMjBsCBO1EorknRRYLddllhlGb
	NPvQ1ovIJfQBNXia7OJksF8RfRRjm3zRUnzB7qbnIKc=
X-Google-Smtp-Source: AGHT+IE8cDuZ4VoLtkuo2QWI9t+6vX8uJXZb7Hjum0f0Nnm+GX9r30n6yB5D2hCSHiuf8UzPB63m9Q==
X-Received: by 2002:a05:6a00:4614:b0:740:b3d9:551 with SMTP id d2e1a72fcca58-742a98c8aebmr13939849b3a.22.1747589591659;
        Sun, 18 May 2025 10:33:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970bb2fsm4890177b3a.53.2025.05.18.10.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 10:33:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/4] python3-pandas: Upgrade to 2.2.3
Date: Sun, 18 May 2025 10:33:06 -0700
Message-ID: <20250518173309.3600728-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 May 2025 17:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117456

Fixes build with cython >=3.1
Drop patch to pin numpy to 1.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ion-to-specify-numpy-header-location.patch |  5 ----
 ...Downgrade-numpy-version-needs-to-1.x.patch | 27 -------------------
 ...t.toml-don-t-pin-dependency-versions.patch | 11 +++-----
 ...andas_2.2.2.bb => python3-pandas_2.2.3.bb} |  3 +--
 4 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pandas/0001-pyproject.toml-Downgrade-numpy-version-needs-to-1.x.patch
 rename meta-python/recipes-devtools/python/{python3-pandas_2.2.2.bb => python3-pandas_2.2.3.bb} (87%)

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
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pandas_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_2.2.3.bb
index b956f5ca2f..3e41e4aa6f 100644
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
 

