Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FECC44516
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 13:04:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12947.1784293481046159240
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jul 2026 06:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oK8n1f36;
 spf=pass (domain: konsulko.com, ip: 209.85.128.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954afac04bso5180935e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 06:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784293479; x=1784898279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rKP+WBQieUbCQn+KZdjshJ+QrCbqwEPH9SI2j+IfGlA=;
        b=oK8n1f36Wb7jQ0viglklB/nN6VvXEVZKfwrbAAKWF98N0lmTYIL8MKqgZGEURBB34V
         tyUynhzaxV2hHtH//Eqnh7CEA65cLdBwwevQKxh58mapm2shBKXKXNy1k4fCe9AozfbU
         bzFfurxtFansl7mbnvMi+mg6nMRaCP9+lMjJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784293479; x=1784898279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rKP+WBQieUbCQn+KZdjshJ+QrCbqwEPH9SI2j+IfGlA=;
        b=L7dLkqX4GQtup9a2/lKj0Fz8SKbg2pfa16SqXavywc8gkMNSwjKB5tKJtZ/rg1BGQb
         b276zqTEzNWDAoqti2POv7m7HQ0FlHrJD8jIv0PLJFSOHRim9Bv8ebxpJTCDdjLmYSFi
         F854WxaCXTIdm8vx5b73IIatqu8NlN5Wlg4zTFgioSrHelFvtjGzZaBmd00S4yGCyIXZ
         rXxJRbJWjXe1hmDyX8ZoQpckCBzRM6xaOk0P16lfsLqwUQypyZVBYmmqNvPTtTn4Oh4a
         ItVGSpZ/5p5ITaO2PIYol0eUlWwFU9u4jNPxvRuOpDL67LXgzrk1dcIeOYfptvC5PVOe
         tT8w==
X-Gm-Message-State: AOJu0YwyBoHAq1rfyiq8/YcpNVT8YyNErGWrjpfvVHZBRTfO+1Raiul9
	3y77lh4tMdiJLBX6bo7VYDbtd9wkoSTRpl06K69H6vYfMt87WvxBtDxeNT1sdrmg4CH96rjse7W
	gi60B
X-Gm-Gg: AfdE7cmlm8Vj2TCnhf54AxY1QGe3qsToJliV3HaVUXtt5tyYX+J4JNQcuZVbMfO4QRp
	qyDcSPJgCaXoiL0gC1x7mO5vniV8kaXbKiPMmJBMF9fbYpxG/BpjOkVIcS7v8zymjUdKjQzsYub
	Pdbng8aBCu/TeBQ7KCDO11H+124EsOPop0QzGllwUoejcfnppA6ACSP7BpmUIImPynvNJe5qlHN
	GYZDAKUWFmpIZOCn2VCGcQZACQHLdH7VgNfe+U441J4OkMrOkE07365KQxvlBqnC96d0z0WtVrm
	ZNRzPrDl3BiJpvRv9rnYfHRVOWeXkkspJH84eRD9XuSQMXe6j7t3T75qYuDQF92kjrY90OYngyf
	fp2LLdc1ZVtUlnbqyYxxd2W4FF0gEgsQuxqPXhEPCUcWAW9K6RM4POlrp9cFQqdvsyK5+hflsOG
	3eUezGDBhUGunMFrc/6aUi6nvozZwDYQVOvGd/4OHCl20CwVvK3+JrmLJOuANu2nXkD2LQ0zbNw
	r+S5UPd4E0jd4fiMKGvWkIVj3l1GaA=
X-Received: by 2002:a05:600c:e549:20b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-4954a3f0e58mr21760245e9.16.1784293478679;
        Fri, 17 Jul 2026 06:04:38 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49500sm3592112f8f.2.2026.07.17.06.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:04:38 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-scikit-build-core: Upgrade 0.12.2 -> 1.0.3
Date: Fri, 17 Jul 2026 16:04:34 +0300
Message-ID: <20260717130435.849145-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jul 2026 13:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128249

Upgrade to release 1.0.3:

Fixes:

- Complete the setuptools SubCommand protocol
- Thread config_settings to the build command
- Keep source tree clean in strict editable mode

Documentation:

- Put uv first in installer tabs and add it to config-settings
- List choices for Literal options in the README table
- Touch up README options tables, setuptools docs
- Show the projects list as a card grid with language/binding badges
- Add high-star projects to the known projects list

CI and testing:

- Make linkcheck retry timeouts from slow hosts
- Forward -C config-settings in downstream editable install

Include a patch to rename directory name from ${module} __module__
to avoid error due to an unexpanded bitbake variable.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...-builder.py-Check-PYTHON_INCLUDE_DIR.patch |  15 ++-
 ...c-scikit_build_core-Don-t-use-module.patch | 107 ++++++++++++++++++
 ....bb => python3-scikit-build-core_1.0.3.bb} |   3 +-
 3 files changed, 118 insertions(+), 7 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-scikit-build-core/0001-src-scikit_build_core-Don-t-use-module.patch
 rename meta-python/recipes-devtools/python/{python3-scikit-build-core_0.12.2.bb => python3-scikit-build-core_1.0.3.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
index 6d52086aab..dec3f8b3ae 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch
@@ -1,4 +1,4 @@
-From 0aee90d953406414f09740a6ef851ed7e666dc9e Mon Sep 17 00:00:00 2001
+From 7aa7a9be9c1d7906b9d4e8f89c078887e8dc5bfc Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Mon, 27 Jan 2025 19:17:48 +0200
 Subject: [PATCH] builder.py: Check PYTHON_INCLUDE_DIR
@@ -15,15 +15,18 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/scikit_build_core/builder/builder.py b/src/scikit_build_core/builder/builder.py
-index d05065f..b01d621 100644
+index 4be0cca..0fc54f4 100644
 --- a/src/scikit_build_core/builder/builder.py
 +++ b/src/scikit_build_core/builder/builder.py
-@@ -228,7 +228,7 @@ class Builder:
-         python_sabi_library = (
-             get_python_library(self.config.env, abi3=True) if limited_api else None
-         )
+@@ -395,7 +395,7 @@ class Builder:
+             python_sabi_library = get_python_library(self.config.env, abi3t=True)
+         elif sabi == _SabiMode.ABI3:
+             python_sabi_library = get_python_library(self.config.env, abi3=True)
 -        python_include_dir = get_python_include_dir()
 +        python_include_dir = os.getenv("PYTHON_INCLUDE_DIR") or get_python_include_dir()
          numpy_include_dir = get_numpy_include_dir()
  
          # Warning for CPython 3.13.4 Windows bug
+-- 
+2.47.3
+
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-src-scikit_build_core-Don-t-use-module.patch b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-src-scikit_build_core-Don-t-use-module.patch
new file mode 100644
index 0000000000..c284a3175c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core/0001-src-scikit_build_core-Don-t-use-module.patch
@@ -0,0 +1,107 @@
+From 8223ad7e5606174ac0ff47068cd22776a499854c Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Fri, 17 Jul 2026 14:40:58 +0300
+Subject: [PATCH] src/scikit_build_core: Don't use ${module}
+
+Replace ${module} with __module__ and renmame the the placeholder
+directories to avoid the following bitbake error:
+
+ERROR: Directory name ${module} contains unexpanded bitbake variable.
+This may cause build failures and WORKDIR polution.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ src/scikit_build_core/init/__main__.py                | 11 +++++++++--
+ .../abi3/src/{${module} => __module__}/_core.c        |  0
+ .../abi3t/src/{${module} => __module__}/_core.c       |  0
+ .../templates/c/src/{${module} => __module__}/_core.c |  0
+ .../src/{${module} => __module__}/__init__.py.in      |  0
+ .../cython/src/{${module} => __module__}/_core.pyx    |  0
+ .../fortran/src/{${module} => __module__}/_core.f     |  0
+ .../nanobind/src/{${module} => __module__}/_core.cpp  |  0
+ .../pybind11/src/{${module} => __module__}/_core.cpp  |  0
+ .../swig/src/{${module} => __module__}/_core.c        |  0
+ .../swig/src/{${module} => __module__}/_core.i        |  0
+ 11 files changed, 9 insertions(+), 2 deletions(-)
+ rename src/scikit_build_core/resources/templates/abi3/src/{${module} => __module__}/_core.c (100%)
+ rename src/scikit_build_core/resources/templates/abi3t/src/{${module} => __module__}/_core.c (100%)
+ rename src/scikit_build_core/resources/templates/c/src/{${module} => __module__}/_core.c (100%)
+ rename src/scikit_build_core/resources/templates/common/src/{${module} => __module__}/__init__.py.in (100%)
+ rename src/scikit_build_core/resources/templates/cython/src/{${module} => __module__}/_core.pyx (100%)
+ rename src/scikit_build_core/resources/templates/fortran/src/{${module} => __module__}/_core.f (100%)
+ rename src/scikit_build_core/resources/templates/nanobind/src/{${module} => __module__}/_core.cpp (100%)
+ rename src/scikit_build_core/resources/templates/pybind11/src/{${module} => __module__}/_core.cpp (100%)
+ rename src/scikit_build_core/resources/templates/swig/src/{${module} => __module__}/_core.c (100%)
+ rename src/scikit_build_core/resources/templates/swig/src/{${module} => __module__}/_core.i (100%)
+
+diff --git a/src/scikit_build_core/init/__main__.py b/src/scikit_build_core/init/__main__.py
+index 1d213fe..36f4db5 100644
+--- a/src/scikit_build_core/init/__main__.py
++++ b/src/scikit_build_core/init/__main__.py
+@@ -103,12 +103,19 @@ def _generate(
+ 
+     written: list[Path] = []
+     for root in (resources / "templates" / "common", resources / "templates" / backend):
+-        # Walk the tree; path components are templated too (e.g. ``${module}``).
++        # Walk the tree and process the templated path components for
++        # __module__ that has replaced ${module} to avoid the following
++        # bitbake error:
++        # ${module} contains unexpanded bitbake variable.
++        # This may cause build failures and WORKDIR polution.
+         stack = [(root, Path())]
+         while stack:
+             node, rel = stack.pop()
+             for entry in node.iterdir():
+-                name = string.Template(entry.name).safe_substitute(substitutions)
++                if entry.name == "__module__":
++                    name = module
++                else:
++                    name = string.Template(entry.name).safe_substitute(substitutions)
+                 if entry.is_dir():
+                     stack.append((entry, rel / name))
+                     continue
+diff --git a/src/scikit_build_core/resources/templates/abi3/src/${module}/_core.c b/src/scikit_build_core/resources/templates/abi3/src/__module__/_core.c
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/abi3/src/${module}/_core.c
+rename to src/scikit_build_core/resources/templates/abi3/src/__module__/_core.c
+diff --git a/src/scikit_build_core/resources/templates/abi3t/src/${module}/_core.c b/src/scikit_build_core/resources/templates/abi3t/src/__module__/_core.c
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/abi3t/src/${module}/_core.c
+rename to src/scikit_build_core/resources/templates/abi3t/src/__module__/_core.c
+diff --git a/src/scikit_build_core/resources/templates/c/src/${module}/_core.c b/src/scikit_build_core/resources/templates/c/src/__module__/_core.c
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/c/src/${module}/_core.c
+rename to src/scikit_build_core/resources/templates/c/src/__module__/_core.c
+diff --git a/src/scikit_build_core/resources/templates/common/src/${module}/__init__.py.in b/src/scikit_build_core/resources/templates/common/src/__module__/__init__.py.in
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/common/src/${module}/__init__.py.in
+rename to src/scikit_build_core/resources/templates/common/src/__module__/__init__.py.in
+diff --git a/src/scikit_build_core/resources/templates/cython/src/${module}/_core.pyx b/src/scikit_build_core/resources/templates/cython/src/__module__/_core.pyx
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/cython/src/${module}/_core.pyx
+rename to src/scikit_build_core/resources/templates/cython/src/__module__/_core.pyx
+diff --git a/src/scikit_build_core/resources/templates/fortran/src/${module}/_core.f b/src/scikit_build_core/resources/templates/fortran/src/__module__/_core.f
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/fortran/src/${module}/_core.f
+rename to src/scikit_build_core/resources/templates/fortran/src/__module__/_core.f
+diff --git a/src/scikit_build_core/resources/templates/nanobind/src/${module}/_core.cpp b/src/scikit_build_core/resources/templates/nanobind/src/__module__/_core.cpp
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/nanobind/src/${module}/_core.cpp
+rename to src/scikit_build_core/resources/templates/nanobind/src/__module__/_core.cpp
+diff --git a/src/scikit_build_core/resources/templates/pybind11/src/${module}/_core.cpp b/src/scikit_build_core/resources/templates/pybind11/src/__module__/_core.cpp
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/pybind11/src/${module}/_core.cpp
+rename to src/scikit_build_core/resources/templates/pybind11/src/__module__/_core.cpp
+diff --git a/src/scikit_build_core/resources/templates/swig/src/${module}/_core.c b/src/scikit_build_core/resources/templates/swig/src/__module__/_core.c
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/swig/src/${module}/_core.c
+rename to src/scikit_build_core/resources/templates/swig/src/__module__/_core.c
+diff --git a/src/scikit_build_core/resources/templates/swig/src/${module}/_core.i b/src/scikit_build_core/resources/templates/swig/src/__module__/_core.i
+similarity index 100%
+rename from src/scikit_build_core/resources/templates/swig/src/${module}/_core.i
+rename to src/scikit_build_core/resources/templates/swig/src/__module__/_core.i
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.12.2.bb b/meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-scikit-build-core_0.12.2.bb
rename to meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3.bb
index d7f8aacd97..4a28b119b4 100644
--- a/meta-python/recipes-devtools/python/python3-scikit-build-core_0.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-scikit-build-core_1.0.3.bb
@@ -12,7 +12,8 @@ inherit pypi python_hatchling
 SRC_URI += " \
 	file://0001-builder.py-Check-PYTHON_INCLUDE_DIR.patch \
 	file://0001-Find-cmake-from-PATH-instead-of-CMAKE_BIN_DIR.patch \
+	file://0001-src-scikit_build_core-Don-t-use-module.patch \
 "
-SRC_URI[sha256sum] = "562e0bbc9de1a354c87825ccf732080268d6582a0200f648e8c4a2dcb1e3736d"
+SRC_URI[sha256sum] = "a4d7a05978ee37975c37743510c8991e2debce7ef83afb0a07c0c576fd4f16e8"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


