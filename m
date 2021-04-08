Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.225.1617899792461380134
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EGi9XLpm;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id i3so2787800oik.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Zx9XdBFIFA1k+gr04D8O0Azhrl+WSVDH66akv4v8NU8=;
        b=EGi9XLpmD1gxbYBMYIwheOeasxFm+RdChgLXz6vofvYyIME1sRHFchpOdsZmrbkaKQ
         QrqiwepEa9XdTtuS0rV6M2CX7VR8MFa4aqF3MarRDvjZkO59cgqOJ8yePHku6wcSQsOg
         jnf3xx/f7vLmRAYjiy/uTAzpYp8k4wu/0wLRnbn2Wwgvr8ryKMxm8WSbxJh2rGm+i88n
         qv9WUWuK9IrPhzbPt+8MHQWwOcjhf65Rumy5JOo46GJYIIvZsu7ZC936tmlIXH9YBl1y
         0Ldy1mBw7ltfmK8dbDH4lB4MdZRor5OiiVsajeIiLDYv33Y1maynE8q3NgP2NxvqpGrS
         kmCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Zx9XdBFIFA1k+gr04D8O0Azhrl+WSVDH66akv4v8NU8=;
        b=pNGtOYb76/YoFHkuazhodpfzpD+aylw880qOikpdBkz0ChTE87KDTDiWjJmKbI5T5P
         RczGF3us20axGBDTDSnhGsI5KaOlSATOCz7vw82RqepIIx24ItOTRRtsCU/GhbDm5poU
         7gvI0h2LCezouTe/dRzQUxYwbAwKmkb9r5+kFI06jX9JgbfPSK0m5qOLxCJz+QnZP+Gk
         L76I4U1IwPq2rq0sYJ0LIHP/vkArZkPHcu8EKNj+Gmo9NfzALnBJvzlydMhN9ryC7Ckr
         KSLY3wwTG/Pe1ErNYUEdZdBt/O2EGGXpAln/BAcZ9q7A9XVrNaAlx328KQSGEqM67etq
         EuiA==
X-Gm-Message-State: AOAM530awyhIBuZRc0JYNitJDcSLNf2Ko/qYHyrvoEOuwtVEmmEat1fZ
	VaPKf7M1rVqPdAnokW9JpjySo5pzod4=
X-Google-Smtp-Source: ABdhPJxvU9j8G6deClTwyf9cd26FaHk8cbATtITwtQNyotADAdKuLvU8G9qNrkksZYcxXUo76uTiWw==
X-Received: by 2002:a54:4492:: with SMTP id v18mr6804297oiv.49.1617899791686;
        Thu, 08 Apr 2021 09:36:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:31 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 20/64] python3-h5py: Upgrade 3.1.0 -> 3.2.1
Date: Thu,  8 Apr 2021 09:35:27 -0700
Message-Id: <53ef17a12a8af476d150bd3d273b8d839b8d3656.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 3.2.1:

- Added support to use the HDF5 ROS3 driver to access HDF5 files
  on S3
- Setting the config option default_file_mode to values other than
  'r' is deprecated. Pass the desired mode when opening a
  :class:`~.File` instead.
- :exc:`OSError` exceptions raised by h5py should now have a useful
  .errno attribute, where HDF5 provides this information.
  Subclasses such as :exc:`FileNotFoundError` should also be raised
  where appropriate.
- Fix reading data with a datatype of variable-length arrays of
  fixed length strings.
- Fix :meth:`.Dataset.read_direct` and :meth:`.Dataset.write_direct`
  when the source and destination have different shapes.
- Fix selecting data using integer indices in
  :meth:`.Dataset.read_direct` and :meth:`.Dataset.write_direct`.
- Fix exception handling in :meth:`.Group.visititems`.
- Issue a warning when File(..., swmr=True) is specified with any
  mode other than 'r', as the SWMR option is ignored in these cases.
- Fix NumPy 1.20 deprecation warnings concerning the use of None as
  shape, and the deprecated aliases np.float, np.int and np.bool.
- Fix :attr:`.File.driver` when the read-only S3 driver is
  available.

Add hdf5-native as a dependency to avoid:

error: libhdf5.so: cannot open shared object file: No such file or directory

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit f95812d0bc1bf25778566a44791257e5a113ab63)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python3-h5py/0001-setup.py-Fix-numpy-version.patch    | 8 ++++----
 .../0001-setup_build.py-avoid-absolute-path.patch         | 4 ++--
 .../{python3-h5py_3.1.0.bb => python3-h5py_3.2.1.bb}      | 3 ++-
 3 files changed, 8 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.1.0.bb => python3-h5py_3.2.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
index 4881b023c80..9b79cc5395b 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
@@ -1,4 +1,4 @@
-From e6c0d487fb5e6063305b8b3187896fbfe5720ed2 Mon Sep 17 00:00:00 2001
+From b1d4d171fd13624f3d8bb917f716b62494066501 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 22 Feb 2021 18:42:43 +0200
 Subject: [PATCH] setup.py: Fix numpy version
@@ -14,12 +14,12 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup.py b/setup.py
-index 7dbe583..6602c97 100755
+index 4b2890c..42ba21b 100755
 --- a/setup.py
 +++ b/setup.py
 @@ -49,7 +49,7 @@ SETUP_REQUIRES = [
-     f"Cython >=0.29; python_version<'3.8'",
-     f"Cython >=0.29.14; python_version>='3.8'",
+     "Cython >=0.29.14; python_version=='3.8'",
+     "Cython >=0.29.15; python_version>='3.9'",
  ] + [
 -    f"numpy =={np_min}; python_version{py_condition}"
 +    f"numpy >={np_min}; python_version{py_condition}"
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
index d0c2ece19bb..0b8555734a6 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -1,4 +1,4 @@
-From 1a46082d0889a784037952c4da0cde3822849032 Mon Sep 17 00:00:00 2001
+From 6f8cee826ef9309c174aa97cb6af2ba532ed9dba Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 28 Jan 2021 18:44:10 -0800
 Subject: [PATCH] setup_build.py: avoid absolute path
@@ -15,7 +15,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup_build.py b/setup_build.py
-index 3c7c7ad..d824bdd 100644
+index 78c6677..64db7f7 100644
 --- a/setup_build.py
 +++ b/setup_build.py
 @@ -21,7 +21,7 @@ from setup_configure import BuildConfig
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.2.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.2.1.bb
index 03ae4c9db40..5faa0b8080f 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.2.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "1e2516f190652beedcb8c7acfa1c6fa92d99b42331cbef5e5c7ec2d65b0fc3c2"
+SRC_URI[sha256sum] = "89474be911bfcdb34cbf0d98b8ec48b578c27a89fdb1ae4ee7513f1ef8d9249e"
 
 SRC_URI_append = " \
            file://0001-setup_build.py-avoid-absolute-path.patch \
@@ -19,6 +19,7 @@ DEPENDS = "python3-pkgconfig-native \
            python3-cython-native \
            python3-numpy-native \
            python3-six-native \
+           hdf5-native \
            python3 \
            hdf5 \
           "
-- 
2.17.1

