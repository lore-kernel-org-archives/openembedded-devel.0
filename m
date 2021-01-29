Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web08.4743.1611889509030974258
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 19:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 10T34phd029862
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 28 Jan 2021 19:05:02 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 19:04:49 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 28 Jan 2021 19:04:49 -0800
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-h5py: improve reproducibility
Date: Thu, 28 Jan 2021 19:04:49 -0800
Message-ID: <20210129030449.21879-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Prevent absolute path from ending up in the egg-info SOURCES.txt.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...1-setup_build.py-avoid-absolute-path.patch | 30 +++++++++++++++++++
 .../python/python3-h5py_2.10.0.bb             |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
new file mode 100644
index 000000000..da95ee7af
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -0,0 +1,30 @@
+From b5d5a7efc7aaa2be830731001ed17c5b71bcefb1 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 29 Jan 2021 02:33:06 +0000
+Subject: [PATCH] setup_build.py: avoid absolute path
+
+Prevent absolute path from ending up in the egg-info SOURCES.txt.
+
+Upstream-Status: Submitted [https://github.com/h5py/h5py/pull/1803]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ setup_build.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup_build.py b/setup_build.py
+index ffd3bef..fb196c0 100644
+--- a/setup_build.py
++++ b/setup_build.py
+@@ -20,7 +20,7 @@ import api_gen
+ 
+ 
+ def localpath(*args):
+-    return op.abspath(op.join(op.dirname(__file__), *args))
++    return op.join(*args)
+ 
+ 
+ MODULES =  ['defs','_errors','_objects','_proxy', 'h5fd', 'h5z',
+-- 
+2.29.2
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
index 3904abbb4..b812b323f 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6
 
 SRC_URI_append = " \
            file://0001-cross-compiling-support.patch \
+           file://0001-setup_build.py-avoid-absolute-path.patch \
           "
 
 inherit pypi setuptools3
-- 
2.17.1

