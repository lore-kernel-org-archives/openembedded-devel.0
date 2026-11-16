Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33124.1794850379243482287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:32:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=dublvbje;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so13617195e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1794850377; x=1795455177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2p+FnuR7U72hMBU8VaJiphYS60mxL04OFqy7yqo3YYE=;
        b=dublvbjeudzeDyC4H/ROw8sf7v0ZJq0VzJbcxOSBpay78pyir8S4FozIRtnN5ybqsK
         hDBGtE5A0P0Ej2eJjEWrAYGFDMIWsH9OA4bv1Tj5990ME/yG0gNxit8/O0oRMEypkxPL
         AWGnb6gbaL1dQzZ3Wb5WU4ul1SB+rAs2gkpcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850377; x=1795455177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2p+FnuR7U72hMBU8VaJiphYS60mxL04OFqy7yqo3YYE=;
        b=KpIQ00c1OHdAXADN0KTqs9FOBVMNQSON+j/xo597yFFmtmEY5aYDXxxgAwf9idda8q
         VScmfDZxWxNgJihqhH/D3mOhRLejZbGErNQpFe+0ZbUyztI/iK2S0BTGmj4fpvSDwKup
         I0bPkUrSAyTUEIViWrogAnqUcowMV7rOdNfInkWSW2Amw3JIvmoMU8fuGrVu9PlbpVNA
         VWcf/K5RSYwvDn+93RddoP2y3M7EE4GVt4PcXgFWKy5pW9HYZlew/g5xOCAj55So5PN5
         EUB49Obvw1Emt40k8PuicPzO0P1DGC7rmkuwtBw44BSDJGUcGB4Yay6tjOBcnfMc7/+B
         mh7Q==
X-Gm-Message-State: APuU4Z/fQFiIN2Yq6hMJdDh21ZiyFUCEwyG8GRt0ohctuWxz1C4tkYED
	CGVBQn22tvmFA+cRVY7RRwgzpWWojB8ScBb/KJBO/oVtusN2ctCJpwjNeYxkPtioiyBfM/Jr7fI
	/XoF1
X-Gm-Gg: AYBFou3+xiEEFRBTqsFe5fY30alnPhoYuAERURyuhwcc4DtbV4G4Fi+dsa2NBC5dwv4
	R+gMv1OzqOxRNp9lq+0aQ3c6kCGvbENhcjkf+cU1tEv+FI69vCC1cL8HEWIHmoeNLQ0KFzZZzpZ
	EZ8dRwKhhH2o9hR2jrYmV0fKaDVOcM12iN8JCZlO0+88hvmmydcp/I2wOa+crHAgwQp49A1Edgl
	Wt2TqWpuxas3xZYOpbPX2/uI0sR/YnAU4/REP5z5pPCFySiyLsAD+y+Jm62+nIfxT9JZZxwJDvp
	6xAFO8twYWL/t/dblDLih/NSwgUVBlYcBegtyCqGFd1LoaMgXsjitm3oK2v+UVZ+hEYmUIZmm68
	jFlqTi5xe7ud2HvAKTCwWaXgyvTRGInypCjjirI6VRYQdHR8sMbXF3cXl0C4mp1aIAdqkNj+1Yb
	JUBMKZQ8Y/nlRdG8u/1f8m+YD+UU5pHvW2z/om+jyyHzUpPOEeel+0FKUcHYoGUu+uSBGtoY6+T
	fQf3colY3tw66eJyEJjY3mvmbZpvbueIPrQlKvGBGsAnR5n1/8JuBT4KXE6F+FeYy6B/uH08TmU
	7tZHMLhukGnzdJteMfBAdWOjljH9zHjizm0JOApgesE1qzDQSHzUt0hI2odQC5kW+14jkvUuiqY
	5+yRQtDDfFZfuFutluujrvGfz/4mLo/y8vivZ+C7Rama918OVcYiE0FJ917rvyCO5MCVlFGVYmV
	4=
X-Received: by 2002:a05:600c:3487:b0:4a4:f48e:78fa with SMTP id 5b1f17b1804b1-4bb55a4ea9dmr247126575e9.12.1794850377276;
        Mon, 16 Nov 2026 09:32:57 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb784231basm2988145e9.11.2026.11.16.09.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:32:56 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-dominate: Upgrade 2.9.1 -> 3.1.0
Date: Mon, 16 Nov 2026 19:32:52 +0200
Message-ID: <20261116173253.315326-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132455
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.1.0:

- Add reference to JavaScript functionality
- Update requires-python version to >=3.7
- Update tests for docstring dedenting in Python 3.13
- Replace get_event_loop() with get_running_loop() for asyncio
  compatibility
- Add support for Python 3.14, drop EOL 3.9
- docs: fix typo 'array-line' -> 'array-like' in README.md
- docs: fix 2 comment typos in dominate/dom_tag.py (thie -> the,
  presense -> presence)
- fix: handle out-of-range numeric HTML entities in unescape()
- Use normal index deletion for child nodes
- Keep copied async DOM contexts separate
- fix(tags): preserve inline link whitespace
- Preserve numeric zero attribute values
- Fix rendering standalone lazy nodes

Fetch the source from GitHub instead of PyPI, as the PyPI sdist
lacks dominate/community, which ptest-runner python3-dominate
needs to pass.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...1-pyproject.toml-Include-subpackages.patch | 35 ++++++++++++++++
 ...d7fdb171f80ed6ce97e6ca4409723975c47f.patch | 40 -------------------
 .../python/python3-dominate_2.9.1.bb          | 16 --------
 .../python/python3-dominate_3.1.0.bb          | 19 +++++++++
 4 files changed, 54 insertions(+), 56 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-dominate/0001-pyproject.toml-Include-subpackages.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dominate_3.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-dominate/0001-pyproject.toml-Include-subpackages.patch b/meta-python/recipes-devtools/python/python3-dominate/0001-pyproject.toml-Include-subpackages.patch
new file mode 100644
index 0000000000..0c364a9dd5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dominate/0001-pyproject.toml-Include-subpackages.patch
@@ -0,0 +1,35 @@
+From 3447817e6a7253d3e43af5fd6248f472cb46d6bf Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Mon, 16 Nov 2026 11:02:29 +0200
+Subject: [PATCH] pyproject.toml: Include subpackages
+
+Extend tool.setuptools with "dominate.community".
+
+Fixes the following error when running tests in Yocto/OpenEmbedded
+setup with ptest-runner python3-dominate:
+
+E   ModuleNotFoundError: No module named 'dominate.community'
+
+Upstream-Status: Pending [https://github.com/Knio/dominate/pull/246]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 2b1743f..f33862f 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -37,7 +37,7 @@ requires = ["setuptools>=75"]
+ build-backend = "setuptools.build_meta"
+ 
+ [tool.setuptools]
+-packages = ["dominate"]
++packages = ["dominate", "dominate.community"]
+ 
+ [tool.setuptools.package-data]
+ dominate = ["README.md"]
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch b/meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch
deleted file mode 100644
index e3d0d485ee..0000000000
--- a/meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 58f7d7fdb171f80ed6ce97e6ca4409723975c47f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
-Date: Sat, 3 Aug 2024 16:07:38 +0200
-Subject: [PATCH] Update tests for docstring dedenting in Python 3.13
-
-Update the `get_expected()` function to account for the fact that
-Python 3.13 automatically dedents all the docstrings, and therefore
-does not require explicitly removing the indent (which effectively
-removes too much indent).
-
-Fixes #199
-
-Upstream-Status: Submitted [https://github.com/Knio/dominate/pull/202]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test_svg.py | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/tests/test_svg.py b/tests/test_svg.py
-index e5bbec3..ea7d98f 100644
---- a/tests/test_svg.py
-+++ b/tests/test_svg.py
-@@ -1,3 +1,5 @@
-+import sys
-+
- import dominate.svg
- from dominate.tags import *
- from dominate.svg import *
-@@ -14,7 +16,10 @@ def base():
- 
- 
- def get_expected(func):
--  return func.__doc__.replace('\n  ', '\n').strip()
-+  doc = func.__doc__
-+  if sys.version_info < (3, 13):
-+      doc = doc.replace('\n  ', '\n')
-+  return doc.strip()
- 
- 
- def output_test(func):
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
deleted file mode 100644
index a0dd638087..0000000000
--- a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
-LICENSE = "LGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
-
-SRC_URI[sha256sum] = "558284687d9b8aae1904e3d6051ad132dd4a8c0cf551b37ea4e7e42a31d19dc4"
-
-inherit pypi ptest-python-pytest python_setuptools_build_meta
-
-SRC_URI += " \
-    file://58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch \
-"
-
-RDEPENDS:${PN} += "\
-    python3-numbers \
-    python3-threading \
-    "
diff --git a/meta-python/recipes-devtools/python/python3-dominate_3.1.0.bb b/meta-python/recipes-devtools/python/python3-dominate_3.1.0.bb
new file mode 100644
index 0000000000..d33c82a92d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dominate_3.1.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Dominate is a Python library for creating and manipulating HTML documents using an elegant DOM API."
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
+
+SRC_URI[sha256sum] = "926989c819db2fe91e590590a2902183685edd94829c8cfba5fd71af57c1a982"
+
+inherit ptest-python-pytest python_setuptools_build_meta
+
+SRC_URI = "\
+    git://github.com/Knio/dominate.git;protocol=https;branch=master;tag=${PV} \
+    file://0001-pyproject.toml-Include-subpackages.patch \
+"
+
+SRCREV = "33120ac155461cea04610c4dc5ad69e54ff66f68"
+
+RDEPENDS:${PN} += "\
+    python3-numbers \
+    python3-threading \
+    "
-- 
2.47.3

