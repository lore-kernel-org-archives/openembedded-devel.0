Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.2902.1617102616269944730
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 04:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44720 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRCGD-0002f1-Pr; Tue, 30 Mar 2021 14:10:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-h5py: Upgrade 3.1.0 -> 3.2.1
Date: Tue, 30 Mar 2021 14:10:06 +0300
Message-Id: <20210330111007.2847-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210330111007.2847-1-leon.anavi@konsulko.com>
References: <20210330111007.2847-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

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
---
 .../python3-h5py/0001-setup.py-Fix-numpy-version.patch    | 8 ++++----
 .../0001-setup_build.py-avoid-absolute-path.patch         | 4 ++--
 .../{python3-h5py_3.1.0.bb => python3-h5py_3.2.1.bb}      | 3 ++-
 3 files changed, 8 insertions(+), 7 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.1.0.bb => python3-h5py_3.2.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
index 4881b023c..9b79cc539 100644
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
index d0c2ece19..0b8555734 100644
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
index 03ae4c9db..5faa0b808 100644
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

