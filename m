Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556F5C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 04:22:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.7562.1677730920898613255
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 20:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bPR4yKia;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id u5so12900652plq.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 20:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5HBCGj+CYtmxoJfqOQMjkbefX+eGb5N00rsaP/aa4M=;
        b=bPR4yKiaBJgEMS/4LWfH/PocZe0Uj3g6aBO1yXhXozYlGJKkdaMlhHczwtIhfLYRT6
         3yymtRSDYKnsO87uj+k5ecU2ane7wead8/A1YxhHmwK0HwZ1uKdeTY33Ww8cigYhCJb/
         XC7EPILL/mvB9vLyLn6KXCYurJshTYRVPVRUJFcTmNU0duQsGXI/Ach5j/4sh1nUFvK1
         wME+tpRH9ImkoyVNmlRo0fQYjTQauMdJaOz94x+6UIer+/wA5jXSdIjlN7303nHrZzLA
         cC9G3dQ0q1mfliGEtJojl+obZbKuTiFFWt5Pl8R14fDJQNpEZFWXa9CPoynDEgTBhZYi
         bAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5HBCGj+CYtmxoJfqOQMjkbefX+eGb5N00rsaP/aa4M=;
        b=tqrFJjJHDr9iACRB3kD20ZoMwJiVGu7mFnxNk2zfPXZWAwKKuaR0EJeKv0mlFXIc51
         Ru0hu+3Jo3z+ToVeyf5Vzc21CfCS+qooR0V07yXVZzaj6dZI/AjGg9J9E71/F0Rf6Mg8
         HYFOLgn2b2n0d7C0IObzqiVCfNPse5wI97TJUGyd1b+ikqN7+WQkQZknH+iNE3CFjhs6
         EiUqpC0cIHd5XSoEv3MoCSXbBGa5LfjH2piv/JkRzGOUDDYN6WSdGVW0IfbNbYTsIqb/
         yrZ54JGcQYrbFNiGEBLHZ1XgpWtYA7zWGpFyjjs7BjQS19kA8VlVSoTgMWzp6+XAPsof
         +7hA==
X-Gm-Message-State: AO0yUKXoNDK0MT3FH7Z+U0O7SyCj8ArVPv8ddt0oxHUM5IEnrVykBdvj
	F/AxIhuEaD7SLpYwr2mn2s5HN/8tViM=
X-Google-Smtp-Source: AK7set/6927qiJdADIDxSg5C2bKPzydNpbzAxYwRyyTmrAEyRw0Xcomv2PaumUwLlVL+pMA2q5V4LA==
X-Received: by 2002:a17:902:e5cc:b0:19a:9864:2887 with SMTP id u12-20020a170902e5cc00b0019a98642887mr1167594plf.7.1677730920918;
        Wed, 01 Mar 2023 20:22:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id g3-20020a1709026b4300b00198e346c35dsm9223782plt.9.2023.03.01.20.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 20:22:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 3/3] python3-h5py: Upgrade to 3.8.0
Date: Wed,  1 Mar 2023 20:21:56 -0800
Message-Id: <20230302042156.1107335-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302042156.1107335-1-raj.khem@gmail.com>
References: <20230302042156.1107335-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 04:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101323

Drop unused patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-fix-wrong-file-driver-version.patch  | 53 -------------------
 .../0001-setup.py-Fix-numpy-version.patch     | 28 ----------
 ...n3-h5py_3.7.0.bb => python3-h5py_3.8.0.bb} |  9 ++--
 3 files changed, 3 insertions(+), 87 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-driver-version.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
 rename meta-python/recipes-devtools/python/{python3-h5py_3.7.0.bb => python3-h5py_3.8.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-driver-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-driver-version.patch
deleted file mode 100644
index 2692acde75..0000000000
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-driver-version.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 5b0b1d0b941ba338d449f9261bdf4cb2b679d048 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 20 Sep 2022 02:53:11 -0700
-Subject: [PATCH] fix wrong file driver version
-
-Due to commit [1] applied in hdf5 (1.13.2), import hdf5 failed
-
-|>>> import h5py
-|Traceback (most recent call last):
-|  File "<stdin>", line 1, in <module>
-|  File "/usr/lib/python3.10/site-packages/h5py/__init__.py", line 56, in <module>
-|    from . import h5a, h5d, h5ds, h5f, h5fd, h5g, h5r, h5s, h5t, h5p, h5z, h5pl
-|  File "h5py/h5fd.pyx", line 220, in init h5py.h5fd
-|RuntimeError: Wrong file driver version # (wrong file driver version #)
-
-Initial driver version to fix the error
-
-[1] https://github.com/HDFGroup/hdf5/commit/42b767fc67ad1e13735e3cee2077f2e108f9463e
-
-Upstream-Status: Submitted  [https://github.com/h5py/h5py/pull/2153]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- h5py/api_types_hdf5.pxd | 1 +
- h5py/h5fd.pyx           | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/h5py/api_types_hdf5.pxd b/h5py/api_types_hdf5.pxd
-index 6977f1a7..312fdaa0 100644
---- a/h5py/api_types_hdf5.pxd
-+++ b/h5py/api_types_hdf5.pxd
-@@ -237,6 +237,7 @@ cdef extern from "hdf5.h":
- 
-   # Class information for each file driver
-   ctypedef struct H5FD_class_t:
-+    unsigned version;
-     const char *name
-     haddr_t maxaddr
-     H5F_close_degree_t fc_degree
-diff --git a/h5py/h5fd.pyx b/h5py/h5fd.pyx
-index 04aff077..d41953d0 100644
---- a/h5py/h5fd.pyx
-+++ b/h5py/h5fd.pyx
-@@ -191,6 +191,7 @@ cdef herr_t H5FD_fileobj_flush(H5FD_fileobj_t *f, hid_t dxpl, hbool_t closing) e
- cdef H5FD_class_t info
- memset(&info, 0, sizeof(info))
- 
-+info.version = 0x01
- info.name = 'fileobj'
- info.maxaddr = libc.stdint.SIZE_MAX - 1
- info.fc_degree = H5F_CLOSE_WEAK
--- 
-2.37.1
-
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
deleted file mode 100644
index 9b79cc5395..0000000000
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b1d4d171fd13624f3d8bb917f716b62494066501 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Mon, 22 Feb 2021 18:42:43 +0200
-Subject: [PATCH] setup.py: Fix numpy version
-
-Fix numpy version to ensure bitbake will find the pip package.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
-
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 4b2890c..42ba21b 100755
---- a/setup.py
-+++ b/setup.py
-@@ -49,7 +49,7 @@ SETUP_REQUIRES = [
-     "Cython >=0.29.14; python_version=='3.8'",
-     "Cython >=0.29.15; python_version>='3.9'",
- ] + [
--    f"numpy =={np_min}; python_version{py_condition}"
-+    f"numpy >={np_min}; python_version{py_condition}"
-     for np_min, py_condition in NUMPY_MIN_VERSIONS
- ]
- 
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.8.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.8.0.bb
index ce4f05dbed..75a41e29dc 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.8.0.bb
@@ -4,12 +4,9 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "3fcf37884383c5da64846ab510190720027dca0768def34dd8dcb659dbe5cbf3"
+SRC_URI[sha256sum] = "6fead82f0c4000cf38d53f9c030780d81bfa0220218aee13b90b7701c937d95f"
 
-SRC_URI:append = " \
-           file://0001-setup_build.py-avoid-absolute-path.patch \
-           file://0001-fix-wrong-file-driver-version.patch \
-          "
+SRC_URI += "file://0001-setup_build.py-avoid-absolute-path.patch"
 
 inherit pkgconfig pypi setuptools3
 
@@ -29,4 +26,4 @@ RDEPENDS:${PN} = "python3-numpy \
                   python3-json \
                  "
 
-export HDF5_VERSION="1.13.2"
+export HDF5_VERSION="1.14.0"
-- 
2.39.2


