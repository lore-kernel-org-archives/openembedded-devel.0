Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7.1794851757131304782
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hvnUaat3;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380b40319bdso866630eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851756; x=1795456556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93qLwwCVKdF0PBq4O8lv4f6YzuRzYLwT0h40/U+Gk6E=;
        b=hvnUaat3HujGxDbqQ8MdCmqOrQ0t8fPlHJliX801pJT+IxrPZqhYZqXaXKlasu9CqB
         tknee3bviOXzddasYo6IzQ6ukXZsTsYy64Q781mu2+F5G4RXiQDf+78VocsUQ89Uy9x8
         wpjzHq3cmw6pVgT3yJRDJblMkfYx88ls1UPtZjFyMn3w60jaIeVVqPNdBrtjtq7opn3Z
         jda2PdSZ8Pht0BOLAE7QELsp1R2xds+3Pmi+7v9kD2alG+iVIZsuv2d2pbwwnOKt/yQ6
         vUFicETGHfUoaveCPA/h48C6f7g39bu5Mq1wOOT/sFnucMypRxxaz4uVnYABWxI+l3im
         gg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851756; x=1795456556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=93qLwwCVKdF0PBq4O8lv4f6YzuRzYLwT0h40/U+Gk6E=;
        b=DJSw0GFs3ufJEjah41gGWOMc38pCPk+tp9swrY3WZhanNSHQwY6PHYKZZDU+Zj1Vw8
         QpGzNxhKSY95NfCCj0di9KNBxcHSMsA9Q8QS6PTgnjoac+gmEZRp7qQ6bNiTq1YSRnxI
         h2AALVovVDyXZzDpLIM+P7TsN4bkeTPaA3SebZI2GFegqJqt2TM9yr+FXySVpvXtBv1G
         rbsibceuCLhT2s6qYRCBwoPP8Bz+N+o6xAV/MSn5XL9GrQeynVr/7TVeB1SAOF1I+985
         UJFMfpThiWJnPCLwYSDfVZv4XPJiZxu/nByYBWnf+T1rIr/JHn12vSvxcfxTgYy+W5lv
         cWAg==
X-Gm-Message-State: APuU4Z+27wtrCIcjSvL8FCbzZZicIsT09EUsFNbIWrMg8AwEewc+JPGv
	BKdNUL9oNgqGFKiIUg8o6NV28D3F3OIBn4kEglGtemnRMnLSjiN41hpvlOMvIBFI
X-Gm-Gg: AZFdTZfo0qqHzOLSuD6E+gZn/eJXfawvD59SHJMlfxPL+1jnRZZfNZ0F/20910/0OIR
	N+90jV9dQOkeDA31TKemvpt4074gwXLEk/R+4jPZsUvNmqvR+YBSyC30EqyArgX0bYXNo8N/B6n
	xwn5UbTRNoCZ8VrAcK1IL/kYk39sZmxfVh2eq9HGCkHe5uWumTMLFjt9joezibSksTgUg0Wo5FL
	JSk+WM7FVMxt7zq91WoUKRgGf+PPD5NxjnblsdDNwHHJtNqARp/YVv8BrK6zcsCo+X0XHUR8ISb
	n8/EySW7sYsqtVxp8pM0STlsiYdcCleD4QBHecgLyLLtGoBjLCwu5Xms4UU2xbEJNx4zhAaCeR9
	egrI8q72HKVGk+ffrUG/KH3HVSgQ5jEILl1pafwIuespAZbznMR8xP0j5tCVtHYYXHzfSOuBM0c
	u23Z+BN0kFhvvgow1ORf65+FdgDVG7fCQKpC+tygmH2Sf0XOYCeVxXYYK6sIfv0ev82Wg8727Lo
	9XtQULUdEVdUQVDaL/pnlydJy8UE3DDF28jqzItEl/p3oWZt1KkS4ij/s/bbsu2mvBUbKjPeLk6
	qEmmKAzqyqZDgeFuvq8b55WRObDNj0S86uze9lZbPGjQEM/49lh4ruMcnsnK4lnP6mhESiGTRVk
	ECJQyFgW3oWj0wlVK/H7eQTyFu4jzeO9Yc3Mlhcnx2iD9FLUHrOwRGshV7qBfKLfXQkeyIuxx21
	F591EWgBJBw7wTa79k7D0QIU96FOYvNy9rj5WoX2nNMlewlP1r1PmLlQbqQT+QdJSKkgMC/u2Ap
	1pAgk+Coz2rl4QGBUWmpTjOtd3st7SDPOhoVv8js8uQm9sIa487ADPSvU+kas0PHmOtqCMXbbOH
	Xcw6
X-Received: by 2002:a05:693c:4006:b0:369:2f25:33a7 with SMTP id 5a478bee46e88-3796676adaamr10147974eec.15.1794851756427;
        Mon, 16 Nov 2026 09:55:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 084/105] python3-scikit-build-core: upgrade 1.0.3 -> 1.1.2
Date: Mon, 16 Nov 2026 09:53:36 -0800
Message-ID: <20261116175359.342679-84-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132539
Content-Type: text/plain; charset="utf-8"

Refresh patches; also rename the new ctypes template ${module}
directory.

Changes:
- Breaking (1.1.0): drop Python 3.8.
- 1.1.0: package-declared config-settings table
  (tool.scikit-build.config-setting), cmake.fresh, if.not overrides,
  `scikit-build settings list`, sdist.resolve-symlinks = "error".
- Fixes: free-threaded Python_FIND_ABI handling, cmake discovery
  (prefer cmake over cmake3), sdist ignore rules no longer cross
  submodule boundaries, deterministic editable __path__ order.
- 1.1.1-1.1.2: write sources directly to wheels (faster), ctypes
  backend for `scikit-build init`, {build_dir} key for
  editable.rebuild-dir.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e-from-PATH-instead-of-CMAKE_BIN_DIR.patch |  9 +---
 ...-builder.py-Check-PYTHON_INCLUDE_DIR.patch | 22 ++++-----
 ...c-scikit_build_core-Don-t-use-module.patch | 46 +++++++++++--------
 ....bb => python3-scikit-build-core_1.1.2.bb} |  2 +-
 4 files changed, 39 insertions(+), 40 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-scikit-build-core_1.0.3.bb => python3-scikit-build-core_1.1.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch
index 71319c0245..21ad6ef061 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch
@@ -21,11 +21,9 @@ Upstream-Status: Inappropriate [oe specific]
  src/scikit_build_core/program_search.py | 10 ----------
  1 file changed, 10 deletions(-)
 
-diff --git a/src/scikit_build_core/program_search.py b/src/scikit_build_core/program_search.py
-index 7995c14..f82cad3 100644
 --- a/src/scikit_build_core/program_search.py
 +++ b/src/scikit_build_core/program_search.py
-@@ -90,16 +90,6 @@ class Program(NamedTuple):
+@@ -119,16 +119,6 @@
  
  
  def _get_cmake_path(*, module: bool = True) -> Generator[Path, None, None]:
@@ -39,9 +37,6 @@ index 7995c14..f82cad3 100644
 -
 -            yield Path(CMAKE_BIN_DIR) / "cmake"
 -
-     candidates = ("cmake3", "cmake")
+     candidates = ("cmake", "cmake3")
      for candidate in candidates:
          cmake_path = shutil.which(candidate)
--- 
-2.51.1
-
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
index dec3f8b3ae..e7651fad12 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
@@ -11,22 +11,18 @@ Upstream-Status: Inappropriate [oe specific]
 Suggested-by: Stephan Kulow <stephan.kulow@siemens.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- src/scikit_build_core/builder/builder.py | 2 +-
+ src/scikit_build_core/builder/builder.py |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/scikit_build_core/builder/builder.py b/src/scikit_build_core/builder/builder.py
-index 4be0cca..0fc54f4 100644
 --- a/src/scikit_build_core/builder/builder.py
 +++ b/src/scikit_build_core/builder/builder.py
-@@ -395,7 +395,7 @@ class Builder:
-             python_sabi_library = get_python_library(self.config.env, abi3t=True)
-         elif sabi == _SabiMode.ABI3:
-             python_sabi_library = get_python_library(self.config.env, abi3=True)
--        python_include_dir = get_python_include_dir()
-+        python_include_dir = os.getenv("PYTHON_INCLUDE_DIR") or get_python_include_dir()
-         numpy_include_dir = get_numpy_include_dir()
+@@ -402,7 +402,7 @@
+                 python_sabi_library = get_python_library(self.config.env, abi3t=True)
+             elif sabi == _SabiMode.ABI3:
+                 python_sabi_library = get_python_library(self.config.env, abi3=True)
+-            python_include_dir = get_python_include_dir()
++            python_include_dir = os.getenv("PYTHON_INCLUDE_DIR") or get_python_include_dir()
+             numpy_include_dir = get_numpy_include_dir()
  
-         # Warning for CPython 3.13.4 Windows bug
--- 
-2.47.3
-
+             # Classic Find Python
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-src-scikit_build_core-Don-t-use-module.patch b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-src-scikit_build_core-Don-t-use-module.patch
index c284a3175c..8f9e7382d1 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-src-scikit_build_core-Don-t-use-module.patch
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-src-scikit_build_core-Don-t-use-module.patch
@@ -13,22 +13,26 @@ Upstream-Status: Inappropriate [oe-specific]
 
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- src/scikit_build_core/init/__main__.py                | 11 +++++++++--
- .../abi3/src/{${module} => __module__}/_core.c        |  0
- .../abi3t/src/{${module} => __module__}/_core.c       |  0
- .../templates/c/src/{${module} => __module__}/_core.c |  0
- .../src/{${module} => __module__}/__init__.py.in      |  0
- .../cython/src/{${module} => __module__}/_core.pyx    |  0
- .../fortran/src/{${module} => __module__}/_core.f     |  0
- .../nanobind/src/{${module} => __module__}/_core.cpp  |  0
- .../pybind11/src/{${module} => __module__}/_core.cpp  |  0
- .../swig/src/{${module} => __module__}/_core.c        |  0
- .../swig/src/{${module} => __module__}/_core.i        |  0
- 11 files changed, 9 insertions(+), 2 deletions(-)
+ src/scikit_build_core/init/__main__.py                        | 11 +++++++++--
+ .../templates/abi3/src/{${module} => __module__}/_core.c      |  0
+ .../templates/abi3t/src/{${module} => __module__}/_core.c     |  0
+ .../templates/c/src/{${module} => __module__}/_core.c         |  0
+ .../common/src/{${module} => __module__}/__init__.py.in       |  0
+ .../ctypes/src/{${module} => __module__}/__init__.py.in       |  0
+ .../templates/ctypes/src/{${module} => __module__}/_core.c    |  0
+ .../templates/cython/src/{${module} => __module__}/_core.pyx  |  0
+ .../templates/fortran/src/{${module} => __module__}/_core.f   |  0
+ .../nanobind/src/{${module} => __module__}/_core.cpp          |  0
+ .../pybind11/src/{${module} => __module__}/_core.cpp          |  0
+ .../templates/swig/src/{${module} => __module__}/_core.c      |  0
+ .../templates/swig/src/{${module} => __module__}/_core.i      |  0
+ 13 files changed, 9 insertions(+), 2 deletions(-)
  rename src/scikit_build_core/resources/templates/abi3/src/{${module} => __module__}/_core.c (100%)
  rename src/scikit_build_core/resources/templates/abi3t/src/{${module} => __module__}/_core.c (100%)
  rename src/scikit_build_core/resources/templates/c/src/{${module} => __module__}/_core.c (100%)
  rename src/scikit_build_core/resources/templates/common/src/{${module} => __module__}/__init__.py.in (100%)
+ rename src/scikit_build_core/resources/templates/ctypes/src/{${module} => __module__}/__init__.py.in (100%)
+ rename src/scikit_build_core/resources/templates/ctypes/src/{${module} => __module__}/_core.c (100%)
  rename src/scikit_build_core/resources/templates/cython/src/{${module} => __module__}/_core.pyx (100%)
  rename src/scikit_build_core/resources/templates/fortran/src/{${module} => __module__}/_core.f (100%)
  rename src/scikit_build_core/resources/templates/nanobind/src/{${module} => __module__}/_core.cpp (100%)
@@ -37,12 +41,11 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  rename src/scikit_build_core/resources/templates/swig/src/{${module} => __module__}/_core.i (100%)
 
 diff --git a/src/scikit_build_core/init/__main__.py b/src/scikit_build_core/init/__main__.py
-index 1d213fe..36f4db5 100644
 --- a/src/scikit_build_core/init/__main__.py
 +++ b/src/scikit_build_core/init/__main__.py
-@@ -103,12 +103,19 @@ def _generate(
- 
-     written: list[Path] = []
+@@ -104,12 +104,19 @@ def _generate(
+     # A backend file replaces a ``common`` file with the same path.
+     written: set[Path] = set()
      for root in (resources / "templates" / "common", resources / "templates" / backend):
 -        # Walk the tree; path components are templated too (e.g. ``${module}``).
 +        # Walk the tree and process the templated path components for
@@ -78,6 +81,14 @@ diff --git a/src/scikit_build_core/resources/templates/common/src/${module}/__in
 similarity index 100%
 rename from src/scikit_build_core/resources/templates/common/src/${module}/__init__.py.in
 rename to src/scikit_build_core/resources/templates/common/src/__module__/__init__.py.in
+diff --git a/src/scikit_build_core/resources/templates/ctypes/src/${module}/__init__.py.in b/src/scikit_build_core/resources/templates/ctypes/src/__module__/__init__.py.in
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/ctypes/src/${module}/__init__.py.in
+rename to src/scikit_build_core/resources/templates/ctypes/src/__module__/__init__.py.in
+diff --git a/src/scikit_build_core/resources/templates/ctypes/src/${module}/_core.c b/src/scikit_build_core/resources/templates/ctypes/src/__module__/_core.c
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/ctypes/src/${module}/_core.c
+rename to src/scikit_build_core/resources/templates/ctypes/src/__module__/_core.c
 diff --git a/src/scikit_build_core/resources/templates/cython/src/${module}/_core.pyx b/src/scikit_build_core/resources/templates/cython/src/__module__/_core.pyx
 similarity index 100%
 rename from src/scikit_build_core/resources/templates/cython/src/${module}/_core.pyx
@@ -102,6 +113,3 @@ diff --git a/src/scikit_build_core/resources/templates/swig/src/${module}/_core.
 similarity index 100%
 rename from src/scikit_build_core/resources/templates/swig/src/${module}/_core.i
 rename to src/scikit_build_core/resources/templates/swig/src/__module__/_core.i
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_1.1.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build-core_1.1.2.bb
index a3beddb07c..5e4e80d816 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_1.1.2.bb
@@ -11,6 +11,6 @@ SRC_URI += " \
 	file://0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch \
 	file://0001-src-scikit_build_core-Don-t-use-module.patch \
 "
-SRC_URI[sha256sum] = "a4d7a05978ee37975c37743510c8991e2debce7ef83afb0a07c0c576fd4f16e8"
+SRC_URI[sha256sum] = "7893709119c5ab1be75cd10442383132c9433b9f104dacef5185949efbea7974"
 
 BBCLASSEXTEND = "native nativesdk"
