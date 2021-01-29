Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.9352.1611925840400052234
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 05:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56034 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l5TXq-0007LC-3o; Fri, 29 Jan 2021 15:10:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-pyzmq: Upgrade 21.0.2 -> 22.0.2
Date: Fri, 29 Jan 2021 15:10:28 +0200
Message-Id: <20210129131029.2163-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129131029.2163-1-leon.anavi@konsulko.com>
References: <20210129131029.2163-1-leon.anavi@konsulko.com>
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

Upgrade to release 22.0.2:

- Add workaround for bug in DLL loading for Windows wheels with
  conda Python >= 3.8
- Fix type of Frame.bytes for non-copying recvs with CFFI backend
  (regression in 21.0)
- Add manylinux wheels for pypy
- Some typing fixes
- Bump bundled libzmq to 4.3.4
- Strip unused symbols in manylinux wheels, resulting in
  dramatically smaller binaries. This matches behavior in v20 and
  earlier.
- Windows CPython wheels bundle public libzmq binary builds,
  instead of building libzmq as a Python Extension. This means
  they include libsodium for the first time.
- Our own implementation of bundling libzmq into pyzmq on Windows
  is removed, instead relying on delvewheel (or installations
  putting dlls on %PATH%) to bundle dependency dlls.
- The (new in 21.0) Windows wheels for PyPy likely require the
  Windows vcredist package. This may have always been the case,
  but the delvewheel approach doesn't seem to work.
- Windows + PyPy is now the only remaining case where a wheel has
  libzmq built as an Extension. All other builds ship libzmq built
  using its own tooling, which should result in better, more
  stable builds.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python-pyzmq/club-rpath-out.patch         | 12 +++++-------
 ...thon3-pyzmq_21.0.2.bb => python3-pyzmq_22.0.2.bb} |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_21.0.2.bb => python3-pyzmq_22.0.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
index d4e144a61..61aeaca5f 100644
--- a/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
+++ b/meta-python/recipes-devtools/python/python-pyzmq/club-rpath-out.patch
@@ -1,4 +1,4 @@
-From b394003d31a7187767b7d6cc7b871968d2674be9 Mon Sep 17 00:00:00 2001
+From efae4e08d13e0958d929ea524e21c0a210b31982 Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Fri, 22 Jan 2021 11:41:12 +0200
 Subject: [PATCH] setup.py: Adjust _add_rpath
@@ -8,15 +8,16 @@ Fix error: unrecognized command-line option '-R'
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+
 ---
  setup.py | 3 ---
  1 file changed, 3 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 22f582d..2d28655 100755
+index b634d94..7f6a2f1 100755
 --- a/setup.py
 +++ b/setup.py
-@@ -231,9 +231,6 @@ def _add_rpath(settings, path):
+@@ -235,9 +235,6 @@ def _add_rpath(settings, path):
      """
      if sys.platform == 'darwin':
          settings['extra_link_args'].extend(['-Wl,-rpath', '-Wl,%s' % path])
@@ -24,8 +25,5 @@ index 22f582d..2d28655 100755
 -        settings['runtime_library_dirs'].append(path)
 -
  
- def settings_from_prefix(prefix=None, bundle_libzmq_dylib=False):
+ def settings_from_prefix(prefix=None):
      """load appropriate library/include settings from ZMQ prefix"""
--- 
-2.17.1
-
diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
index 8bde98247..555f27cb4 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_22.0.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "zeromq"
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
 
 SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[sha256sum] = "098c13c6198913c2a0690235fa74d2e49161755f66b663beaec89651554cc79c"
+SRC_URI[sha256sum] = "d7b82a959e5e22d492f4f5a1e650e909a6c8c76ede178f538313ddb9d1e92963"
 
 inherit pypi pkgconfig setuptools3
 
-- 
2.17.1

