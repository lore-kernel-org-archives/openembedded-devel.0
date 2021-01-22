Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6838.1611310307933364815
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52170 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2tPr-0000CW-G7; Fri, 22 Jan 2021 12:11:47 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pyzmq: Upgrade 20.0.0 -> 21.0.1
Date: Fri, 22 Jan 2021 12:11:24 +0200
Message-Id: <20210122101126.25982-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122101126.25982-1-leon.anavi@konsulko.com>
References: <20210122101126.25982-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
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

Upgrade to release 21.0.1:

- drop support for Python 3.5. Python >= 3.6 is required
- mypy type stubs, which should improve static analysis of pyzmq,
  especially for dynamically defined attributes such as zmq
  constants. These are new! Let us know if you find any issues.
- support for zero-copy and sending bufferables with cffi backend.
  This is experimental! Please report issues.
- zero-copy support in CFFI backend (send(copy=False) now does
  something).
- Support sending any buffer-interface-providing objects in CFFI
  backend.
- Errors during teardown of asyncio Sockets
- Missing MSVCP140.dll in Python 3.9 wheels on Windows, causing
  vcruntime-redist package to be required to use the Python 3.9
  wheels for pyzmq 20.0
- pyzmq-21.0.1 only changes CI configuration for Windows wheels
  (built with VS2017 instead of VS2019), fixing compatibility with
  some older Windows on all Pythons and removing requirement of
  VC++ redistributable package on latest Windows and Python < 3.8.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-pyzmq/club-rpath-out.patch  | 24 ++++++++++++++++---
 ...yzmq_20.0.0.bb => python3-pyzmq_21.0.1.bb} |  2 +-
 2 files changed, 22 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_20.0.0.bb => python3-pyzmq_21.0.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
index 936f16585..d4e144a61 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
+++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
@@ -1,13 +1,31 @@
+From b394003d31a7187767b7d6cc7b871968d2674be9 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Fri, 22 Jan 2021 11:41:12 +0200
+Subject: [PATCH] setup.py: Adjust _add_rpath
+
+Fix error: unrecognized command-line option '-R'
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ setup.py | 3 ---
+ 1 file changed, 3 deletions(-)
+
 diff --git a/setup.py b/setup.py
-index d243eaa..98099bc 100755
+index 22f582d..2d28655 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -192,8 +192,6 @@ def _add_rpath(settings, path):
+@@ -231,9 +231,6 @@ def _add_rpath(settings, path):
      """
      if sys.platform == 'darwin':
-         settings['extra_link_args'].extend(['-Wl,-rpath','-Wl,%s' % path])
+         settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % path])
 -    else:
 -        settings['runtime_library_dirs'].append(path)
+-
  
  def settings_from_prefix(prefix=None, bundle_libzmq_dylib=False):
      """load appropriate library/include settings from ZMQ prefix"""
+-- 
+2.17.1
+
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
index a668eb11e..d6b741460 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_20.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "zeromq"
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
 
 SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[sha256sum] = "824ad5888331aadeac772bce27e1c2fbcab82fade92edbd234542c4e12f0dca9"
+SRC_URI[sha256sum] = "c3a630dd7716e8e127d43b22598e256a2d11a847b8cc3310350528960037fa06"
 
 inherit pypi pkgconfig setuptools3
 
-- 
2.17.1

