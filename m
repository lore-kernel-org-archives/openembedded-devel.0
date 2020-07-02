Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.3881.1593686916865258162
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 03:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35470 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqwle-0002lw-Vj; Thu, 02 Jul 2020 13:48:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-h5py: Upgrade 2.9.0 -> 2.10.0
Date: Thu,  2 Jul 2020 13:48:19 +0300
Message-Id: <20200702104819.14256-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702104819.14256-1-leon.anavi@konsulko.com>
References: <20200702104819.14256-1-leon.anavi@konsulko.com>
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

Inherit pypi. Use LICENSE for LIC_FILES_CHKSUM.

Upgrade to release 2.10.0, for details:
http://docs.h5py.org/en/stable/whatsnew/index.html

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-cross-compiling-support.patch           | 15 ++++++++-------
 ...hon3-h5py_2.9.0.bb => python3-h5py_2.10.0.bb} | 16 ++++++++--------
 2 files changed, 16 insertions(+), 15 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_2.9.0.bb => python3-h5py_2.10.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
index ff50c85a0..8c0b91432 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
@@ -1,4 +1,4 @@
-From 7e3b1745c1fef34683a0610381dd3308ad4d1ba9 Mon Sep 17 00:00:00 2001
+From 364fd0906efa349ea44a761820408dcf6b2b8726 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 29 Jan 2019 17:08:32 +0800
 Subject: [PATCH] cross compiling support
@@ -8,16 +8,17 @@ Remove useless dirs
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  setup_build.py     | 4 ----
  setup_configure.py | 2 +-
  2 files changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/setup_build.py b/setup_build.py
-index 85b321a..2c78e92 100644
+index c0e9a28c..ffd3bef7 100644
 --- a/setup_build.py
 +++ b/setup_build.py
-@@ -53,10 +53,6 @@ if sys.platform.startswith('win'):
+@@ -55,10 +55,6 @@ if sys.platform.startswith('win'):
          ('_HDF5USEDLL_', None),
          ('H5_BUILT_AS_DYNAMIC_LIB', None)
      ])
@@ -29,11 +30,11 @@ index 85b321a..2c78e92 100644
  class h5py_build_ext(build_ext):
  
 diff --git a/setup_configure.py b/setup_configure.py
-index a2de76a..197f2da 100644
+index 5576775e..75f4141e 100644
 --- a/setup_configure.py
 +++ b/setup_configure.py
-@@ -208,7 +208,7 @@ def autodetect_version(hdf5_dir=None):
-     else:
+@@ -206,7 +206,7 @@ def autodetect_version(hdf5_dir=None):
+         default_path = 'libhdf5.so'
          regexp = re.compile(r'^libhdf5.so')
  
 -    libdirs = ['/usr/local/lib', '/opt/local/lib']
@@ -42,5 +43,5 @@ index a2de76a..197f2da 100644
          if pkgconfig.exists("hdf5"):
              libdirs.extend(pkgconfig.parse("hdf5")['library_dirs'])
 -- 
-2.7.4
+2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
index 7822e463e..3904abbb4 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
@@ -1,17 +1,17 @@
-SUMMARY = "Provides both a high- and low-level interface to the HDF5 library from Python. "
+SUMMARY = "Provides both a high- and low-level interface to the HDF5 library from Python."
 HOMEPAGE = "https://www.h5py.org/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=107;endline=107;md5=795ecad0d261c998cc526c84a822dff6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI = "git://github.com/h5py/h5py.git \
+SRC_URI[md5sum] = "504b595237409ab766fbbe568e60a080"
+SRC_URI[sha256sum] = "84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6bf512d"
+
+SRC_URI_append = " \
            file://0001-cross-compiling-support.patch \
           "
-SRCREV ?= "8d96a14c3508de1bde77aec5db302e478dc5dbc4"
-
-inherit setuptools3
 
-S = "${WORKDIR}/git"
+inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
@@ -27,4 +27,4 @@ RDEPENDS_${PN} = "python3-numpy \
                   python3-six \
                  "
 
-export HDF5_VERSION="1.8.19"
+export HDF5_VERSION="1.8.21"
-- 
2.17.1

