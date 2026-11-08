Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2954.1794165989468229856
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Nov 2026 11:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: roosesweb@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso96884f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 11:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165988; x=1794770788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V589S+HEoEmkMx4s8zAepaGm+RlHp1H9TvNhP/BCi6o=;
        b=02ghi/ftRxUTFmPbiBJP9QbE3wXOQcUWxvy3EC5npK86B4EEPWCAi05s506DJSn9eR
         G9dlL3QutTPwGZqKInh55tbQDq2WHulkKyb3FidaEqblzI7TgxMyu5aAXNJtlDLxArPv
         UfRr8tvYinpgwP5j4NnCtewIsVWTBc50fcOuMg8Zx/IHl0rJkBQUPRGqbIWmsva9SX0H
         vtzha567hu8EpXV5mM8/Z5LdxHuIqmSP6nqJY4a8hk1wR2sM2siABBTUTrygTYOugF1e
         SVjBHtrGG+/w6xCjJrAhhMSZFMb9yD+u5y9eN1mQVndYdeJDjme1cePpYS3ihdMfHvC0
         Z25w==
X-Gm-Message-State: APuU4Z9c+wqalrwNBhWyUkWF5gWWXdm9KtChrPXB0LLeO0MEojiAQJqJ
	feB+anGQdDBttAyWJubMOdfwy74vat9bZIJfXPWjWqj8tgXUwPfOrzmqWHdXFw==
X-Gm-Gg: AYBFou0fgw3c5v7wZWln6lXBNf6HOl2W4FqsuUv9HYq8v3ouehpc7h4DnpD/IowgXuZ
	AitAZiU6n3EYIOLIudWLpTytyX4D9x6N+sD2iEiFlzzbcW/1eMSF09Wxkflr5+UXdxYu1OufFDE
	RQPMAb9M22Yf2rzjtu8Nb7z5T82pAyGIZ+5iLjpZe39+js3k18x7UBb82V3Y1yEb/ADYk1gMOAJ
	Q0yfSRSufgnsI60fU44i9YYo0v9/oqNaf5NpqT50/IgBzBJAHIC65giefldww5av/19OowyPCZx
	Lo/VpZt20rOylL4nDBK0YoB0au5G59T18fqIl8ZUfvQ1x1WSbxIvzDC+41V/udovcZNnfl2HAHy
	PZMmE8aRF970sF5AqokUoGL39BRzPiaKZ093rCHz0oQg60nSt+cUiyevio+3He6OMruDC1KzmqX
	1fKndHuZlHjoa7rjMEwCxDuCFqSgSdTzfVr27wd3uquinp711UAYWqu+BUckKlZqnssGVFUaCPD
	mLUTEjMROOgc7gjf8rCay5FIYzWAZH0gpJLsQPFmF5PKLZEFKTNPdNu0H6vs4O+ieFVXvM9hZFd
	Q8v2OknVNvw1kkCjb17P9KGrC6kwNQwDS3JiFQjdtA2ko4LUSIIYQnZh3OG91vbpPGulKc4yYRm
	TZaq2kBDMP8pO2w3qSyY7DdQZ55aBEGjTCYJF/qd7KxwzBWzMEnK1kJeMYNCqwicaYJviKzIxFl
	UEeTM=
X-Received: by 2002:a05:6000:4b0b:b0:48c:6fa4:fc89 with SMTP id ffacd0b85a97d-495829c1105mr4171854f8f.12.1794165987654;
        Sun, 08 Nov 2026 11:26:27 -0800 (PST)
Return-Path: <roosesweb@gmail.com>
Received: from mother.tail4535.ts.net ([2a02:810d:ae08:d00:e5a9:b4b9:ba2:5901])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e2bsm5808729f8f.8.2026.11.08.11.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 11:26:27 -0800 (PST)
From: "Thomas Roos" <roosesweb@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Thomas Roos <thomas@roosesweb.de>
Subject: [meta-python][PATCH 01/13] python3-propcache: upgrade 0.4.1 -> 0.5.4
Date: Sun,  8 Nov 2026 20:26:06 +0100
Message-ID: <20261108192623.1082770-2-thomas@roosesweb.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108192623.1082770-1-thomas@roosesweb.de>
References: <20261108192623.1082770-1-thomas@roosesweb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 08 Nov 2026 22:38:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132023
Content-Type: text/plain; charset="utf-8"

Needed together with the Cython 3.3.1 upgrade in OE-Core: 0.4.1, with the
backported "Update Cython to version 3.2.3" patch, requires
Cython ~= 3.2.0 and does not build with Cython 3.3. Home Assistant
2026.11 also pins propcache 0.5.4.

Drop both local patches:
- 0001-Update-Cython-to-version-3.2.3-184.patch backported the change
  from Cython ~= 3.1.0 to Cython ~= 3.2.0. 0.5.4 requires
  Cython >= 3.2.0 (packaging/pep517_backend/_backend.py), so the
  backport is not needed; it would even pin the build back to
  Cython ~= 3.2.0.
- 0001-build-wheel-in-place.patch hardcoded build_inplace=True in the
  in-tree build backend. 0.5.4 adds the build-inplace config setting
  for this, so the recipe passes "-C build-inplace=true" in
  PEP517_BUILD_OPTS instead.

AI-Generated: Claude Code, Claude Opus 5.5
Signed-off-by: Thomas Roos <thomas@roosesweb.de>
---
 ...1-Update-Cython-to-version-3.2.3-184.patch | 33 -------------------
 .../0001-build-wheel-in-place.patch           | 31 -----------------
 ...he_0.4.1.bb => python3-propcache_0.5.4.bb} |  8 ++---
 3 files changed, 3 insertions(+), 69 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-propcache/0001-Update-Cython-to-version-3.2.3-184.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-propcache/0001-build-wheel-in-place.patch
 rename meta-python/recipes-devtools/python/{python3-propcache_0.4.1.bb => python3-propcache_0.5.4.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-propcache/0001-Update-Cython-to-version-3.2.3-184.patch b/meta-python/recipes-devtools/python/python3-propcache/0001-Update-Cython-to-version-3.2.3-184.patch
deleted file mode 100644
index 26c4a2b20a..0000000000
--- a/meta-python/recipes-devtools/python/python3-propcache/0001-Update-Cython-to-version-3.2.3-184.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 049909ed3db8527aaae86a15d3c7998988ea77a0 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Mon, 29 Dec 2025 13:21:12 -0700
-Subject: [PATCH] Update Cython to version 3.2.3 (#184)
-
-Upstream-Status: Backport [https://github.com/aio-libs/propcache/pull/184]
-Co-authored-by: J. Nick Koston <nick@koston.org>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- packaging/pep517_backend/_backend.py | 2 +-
- requirements/cython.txt              | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
-index ce79c4e..e05a9dd 100644
---- a/packaging/pep517_backend/_backend.py
-+++ b/packaging/pep517_backend/_backend.py
-@@ -376,7 +376,7 @@ def get_requires_for_build_wheel(
-     if is_pure_python_build:
-         c_ext_build_deps = []
-     else:
--        c_ext_build_deps = ['Cython ~= 3.1.0']
-+        c_ext_build_deps = ['Cython ~= 3.2.0']
- 
-     return _setuptools_get_requires_for_build_wheel(
-         config_settings=config_settings,
-diff --git a/requirements/cython.txt b/requirements/cython.txt
-index 97dc5a1..209c15a 100644
---- a/requirements/cython.txt
-+++ b/requirements/cython.txt
-@@ -1 +1 @@
--cython==3.1.4
-+cython==3.2.3
diff --git a/meta-python/recipes-devtools/python/python3-propcache/0001-build-wheel-in-place.patch b/meta-python/recipes-devtools/python/python3-propcache/0001-build-wheel-in-place.patch
deleted file mode 100644
index 84f81da775..0000000000
--- a/meta-python/recipes-devtools/python/python3-propcache/0001-build-wheel-in-place.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 606843ad079d9d0dac1172533d42b5a2327b99ed Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 17 Sep 2025 15:41:09 +0800
-Subject: [PATCH] build wheel in place
-
-In order to make the generated library be reproducible, build wheel
-in source dir other than tmp dir (/tmp/xxxxxx), then yocto toolchain's
-option -fdebug-prefix-map could work as expected
-
-Upstream-Status: Pending
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- packaging/pep517_backend/_backend.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/packaging/pep517_backend/_backend.py b/packaging/pep517_backend/_backend.py
-index 61cad34..d5d839e 100644
---- a/packaging/pep517_backend/_backend.py
-+++ b/packaging/pep517_backend/_backend.py
-@@ -316,7 +316,7 @@ def build_wheel(
-     """
-     with maybe_prebuild_c_extensions(
-             line_trace_cython_when_unset=False,
--            build_inplace=False,
-+            build_inplace=True,
-             config_settings=config_settings,
-     ):
-         return _setuptools_build_wheel(
--- 
-2.34.1
-
diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb b/meta-python/recipes-devtools/python/python3-propcache_0.5.4.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
rename to meta-python/recipes-devtools/python/python3-propcache_0.5.4.bb
index 4f681613aa..a931791660 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.5.4.bb
@@ -3,14 +3,12 @@ HOMEPAGE = "https://github.com/aio-libs/propcache"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "f48107a8c637e80362555f37ecf49abe20370e557cc4ab374f04ec4423c97c3d"
+SRC_URI[sha256sum] = "ff6b113f50bc066a698db5d944d2c6dc7507168dd3341e255a8892fd0715a558"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
-SRC_URI += " \
-    file://0001-build-wheel-in-place.patch \
-    file://0001-Update-Cython-to-version-3.2.3-184.patch \
-"
+# Build the C extensions in the source tree instead of a temporary copy
+PEP517_BUILD_OPTS += "-C build-inplace=true"
 
 DEPENDS += " \
 	python3-expandvars-native \
-- 
2.56.0

