Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5171.1599046107205540645
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 04:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46718 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kDQwC-0000FC-VN; Wed, 02 Sep 2020 14:28:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-gevent: Upgrade 1.4.0 -> 20.6.2
Date: Wed,  2 Sep 2020 14:28:08 +0300
Message-Id: <20200902112808.18547-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200902112808.18547-1-leon.anavi@konsulko.com>
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.6.2:

- It is now possible to build and use the embedded libuv on a
  Cygwin platform.
- Bug fix: relax the version constraint for psutil on PyPy.
- The include directories used to compile the C extensions have
  been tweaked with the intent of making it easier to use older
  debug versions of Python.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...etup.py-do-not-query-for-include-dir.patch | 26 -------------------
 ...vent_1.4.0.bb => python3-gevent_20.6.2.bb} |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
 rename meta-python/recipes-devtools/python/{python3-gevent_1.4.0.bb => python3-gevent_20.6.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch b/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
deleted file mode 100644
index 7536b71a6..000000000
--- a/meta-python/recipes-devtools/python/python-gevent/0002-setup.py-do-not-query-for-include-dir.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a53ed6b2f967a5f95e69d51cad3f8c120d7df65b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 7 Feb 2019 15:21:15 +0100
-Subject: [PATCH] setup.py: do not query for include dir
-
-As this will return the native python directory erroneously.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/setup.py b/setup.py
-index 86d6c5a..5d22291 100755
---- a/setup.py
-+++ b/setup.py
-@@ -52,7 +52,7 @@ from _setupares import ARES
- # Get access to the greenlet header file.
- # The sysconfig dir is not enough if we're in a virtualenv
- # See https://github.com/pypa/pip/issues/4610
--include_dirs = [sysconfig.get_path("include")]
-+include_dirs = []
- venv_include_dir = os.path.join(sys.prefix, 'include', 'site',
-                                 'python' + sysconfig.get_python_version())
- venv_include_dir = os.path.abspath(venv_include_dir)
diff --git a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb b/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
index e42980d38..dbeb3a60c 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
@@ -18,11 +18,10 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-gevent:"
 
 SRC_URI_append = " \
     file://libev-conf.patch;patch=1;pnum=1 \
-    file://0002-setup.py-do-not-query-for-include-dir.patch \
 "
 
-SRC_URI[md5sum] = "6b9dd98917061803d9158e5258b8f412"
-SRC_URI[sha256sum] = "1eb7fa3b9bd9174dfe9c3b59b7a09b768ecd496debfc4976a9530a3e15c990d1"
+SRC_URI[md5sum] = "27b07fe9fdfff2d75e3d140e890489b1"
+SRC_URI[sha256sum] = "a23c2abf08e851c988723f6a2996d495f513a2c0dc70f9956af03af8debdb5d1"
 
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
-- 
2.17.1

