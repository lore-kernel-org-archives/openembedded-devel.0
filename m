Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10855.1612366712584656617
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l7KEg-0007tX-PL; Wed, 03 Feb 2021 17:38:31 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-h5py: Upgrade 2.10.0 -> 3.1.0
Date: Wed,  3 Feb 2021 17:38:22 +0200
Message-Id: <20210203153822.25077-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210203153822.25077-1-leon.anavi@konsulko.com>
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 3.1.0:

- Fix using bytes as names for :meth:`~Group.create_dataset` and
￼  :meth:`~Group.create_virtual_dataset`.
- Fix writing data as a list to a dataset with a sub-array data
  type.
- Preserve endianess in Cython dataset Reader
- If pytest is missing pytest-mpi then it will now fail
  immediately with a clear warning message
- Fix a test which was failing on big-endian systems

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-cross-compiling-support.patch        | 47 -------------------
 .../0001-setup.py-Fix-numpy-version.patch     | 30 ++++++++++++
 ...1-setup_build.py-avoid-absolute-path.patch | 13 ++---
 ...3-h5py_2.10.0.bb => python3-h5py_3.1.0.bb} |  5 +-
 4 files changed, 39 insertions(+), 56 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
 rename meta-python/recipes-devtools/python/{python3-h5py_2.10.0.bb => python3-h5py_3.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
deleted file mode 100644
index 8c0b91432..000000000
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 364fd0906efa349ea44a761820408dcf6b2b8726 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 29 Jan 2019 17:08:32 +0800
-Subject: [PATCH] cross compiling support
-
-Remove useless dirs
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- setup_build.py     | 4 ----
- setup_configure.py | 2 +-
- 2 files changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/setup_build.py b/setup_build.py
-index c0e9a28c..ffd3bef7 100644
---- a/setup_build.py
-+++ b/setup_build.py
-@@ -55,10 +55,6 @@ if sys.platform.startswith('win'):
-         ('_HDF5USEDLL_', None),
-         ('H5_BUILT_AS_DYNAMIC_LIB', None)
-     ])
--else:
--    FALLBACK_PATHS['include_dirs'].extend(['/opt/local/include', '/usr/local/include'])
--    FALLBACK_PATHS['library_dirs'].extend(['/opt/local/lib', '/usr/local/lib'])
--
- 
- class h5py_build_ext(build_ext):
- 
-diff --git a/setup_configure.py b/setup_configure.py
-index 5576775e..75f4141e 100644
---- a/setup_configure.py
-+++ b/setup_configure.py
-@@ -206,7 +206,7 @@ def autodetect_version(hdf5_dir=None):
-         default_path = 'libhdf5.so'
-         regexp = re.compile(r'^libhdf5.so')
- 
--    libdirs = ['/usr/local/lib', '/opt/local/lib']
-+    libdirs = []
-     try:
-         if pkgconfig.exists("hdf5"):
-             libdirs.extend(pkgconfig.parse("hdf5")['library_dirs'])
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
new file mode 100644
index 000000000..57037a91a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup.py-Fix-numpy-version.patch
@@ -0,0 +1,30 @@
+From 7c88e3762c2381a507dc86b90152216abe79a804 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Wed, 3 Feb 2021 17:23:29 +0200
+Subject: [PATCH] setup.py: Fix numpy version
+
+Fix numpy version to ensure bitbake will find the pip package.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7dbe5835..8fc15bc8 100755
+--- a/setup.py
++++ b/setup.py
+@@ -30,7 +30,7 @@ NUMPY_MIN_VERSIONS = [
+     ('1.12',   "=='3.6'"),
+     ('1.14.5', "=='3.7'"),
+     ('1.17.5', "=='3.8'"),
+-    ('1.19.3', ">='3.9'"),
++    ('1.19.5', ">='3.9'"),
+ ]
+ 
+ # these are required to use h5py
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
index da95ee7af..05c126e54 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -1,6 +1,6 @@
-From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
+From 86a2c95941a3854fda763037a16b5b22ec6f15e9 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Fri, 29 Jan 2021 02:33:06 +0000
+Date: Thu, 28 Jan 2021 18:44:10 -0800
 Subject: [PATCH] setup_build.py: avoid absolute path
 
 Prevent absolute path from ending up in the egg-info SOURCES.txt.
@@ -8,15 +8,16 @@ Prevent absolute path from ending up in the egg-info SOURCES.txt.
 Upstream-Status: Submitted [https://github.com/h5py/h5py/pull/1803]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  setup_build.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup_build.py b/setup_build.py
-index ffd3bef..fb196c0 100644
+index 3c7c7adb..d824bdda 100644
 --- a/setup_build.py
 +++ b/setup_build.py
-@@ -20,7 +20,7 @@ import api_gen
+@@ -21,7 +21,7 @@ from setup_configure import BuildConfig
  
  
  def localpath(*args):
@@ -24,7 +25,7 @@ index ffd3bef..fb196c0 100644
 +    return op.join(*args)
  
  
- MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
+ MODULES = ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
 -- 
-2.29.2
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
index b812b323f..03ae4c9db 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.1.0.bb
@@ -4,12 +4,11 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[md5sum] = "504b595237409ab766fbbe568e60a080"
-SRC_URI[sha256sum] = "84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6bf512d"
+SRC_URI[sha256sum] = "1e2516f190652beedcb8c7acfa1c6fa92d99b42331cbef5e5c7ec2d65b0fc3c2"
 
 SRC_URI_append = " \
-           file://0001-cross-compiling-support.patch \
            file://0001-setup_build.py-avoid-absolute-path.patch \
+           file://0001-setup.py-Fix-numpy-version.patch \
           "
 
 inherit pypi setuptools3
-- 
2.17.1

