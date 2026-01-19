Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F03FD29C2E
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 14:24:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36076.1768832634691291957
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 06:23:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jqqkZq/f;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4801bc32725so20650285e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 06:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768832633; x=1769437433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=miSLW5IxehFCGaMOvQ5/jH3ghkeEvcRZAKfOSfx9g8o=;
        b=jqqkZq/f/RfeEM6YPAinPW8LrJtvNRZIqT8xITjXTU5FgcaIjSTfPT6smDpuK0+Oh1
         43EGecp+ruNapwYpEFP69DIXZkEPWpvy9q7li7t7ABLR/kC/00WaTuhvqWUn52IaLJjj
         YI24EEJsBL+ThjtPzxdFNISMWlkpS2Vo8Yl8hICOrAry1nABOIB1tdsv5e9kIkAO4p95
         7dkFXEa2fgI4jQ9uNLn1wG4btMCuoY/1PB64LXla8M3IRhJcdiBiYwCS8NnmGmqiXHYn
         ZvmKsoVcK/luHfg0pW40mK/CxhIt4+/k9dcBPiaQCcMC4Qt+OEI3uSdSSGR2a1g1ZDYK
         V+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768832633; x=1769437433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=miSLW5IxehFCGaMOvQ5/jH3ghkeEvcRZAKfOSfx9g8o=;
        b=kGSN29ozXdSC6WDeqEKgy69/sBvydDeaWCvlrYnQnruxg+sRRIMtoNLzB9JknvaQK0
         +3zVlvYhnsK79MMi3EhC6IX16DHOiLWGDt2pF8RvtAdbHXrcC2wN6cZw6ipijRkKAgKG
         VcLncF61h8H5LZUO7fKhtE+g5AvmfbOmh684YrWa6omA3X0EnK2O+FkYVszX8Pz+GHvj
         m5nX2O6Yav3YFknBcz4CPE8C6TEfr+tfZCtC7hkLtYFqhNEldxlzApffwgrVYDAdvQfM
         lD6MwW05wq/T45ETuQOwvdWep9Z4CTRmiWxvp76H0fjfcoA3NgA0fxXvO5B0ohUz9Q7f
         7NFw==
X-Gm-Message-State: AOJu0Yxodc8vzZZuCOPupBhWfa60lmOMAqDiMK7Jog1IzGGKcHwfQOeW
	TJLZsW62u6x+6xqO2f/osoLyMDo0DBfpMwqK5wmWtEuy6xKg8EGH++b2JsQ4pA==
X-Gm-Gg: AY/fxX7LKJ2QE2raHqvX3lgFqy3U/98PgD6H72onzJvP6WfMHzhKpTtAZ2iWydKK1Kv
	U7sls8hxXXHnifgg7EGe+blX5v4JMFPgvcQ4tgWgoXEKmmoiPkPkj55QIrASCHHyxL4c30jHM3E
	fZl1vj6IUGfTtIksi94DutX1sbh9T4ebsymTaSvWfXc81GSzaQgOSv1+xzDDdHoc1J2hedqL+Ny
	2sYywvKSwgt3tERfo7qqKuBX2/be08Pymr8+fRDqJX2Ndm9X8nsGjtFbP2M2bBuQ0veRf5c3pQT
	80HF7jRv8XFMmXinjd3msY1UfTNfHgKxMyyvtJszxKdcqnVnzzOYGIzpc9fIh3Os9XlqUmHQ7Wx
	i79s/SKrMZ+HnktfT0qw4BY5/K8URroKIPcZUKBMpN48O1Zi9/vs0zqzJHVtbBwM3+t7fmWR/j7
	xcgkY2B62P
X-Received: by 2002:a05:600c:1c28:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-4801eb109e0mr136667345e9.28.1768832632628;
        Mon, 19 Jan 2026 06:23:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992c6f2sm23102532f8f.19.2026.01.19.06.23.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:23:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-django: (4.2.27) add back setuptools3 support
Date: Mon, 19 Jan 2026 15:23:51 +0100
Message-ID: <20260119142351.61244-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 14:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123640

The upstream project has switched to build_meta build backend with
version 4.2.21, and when the recipe was update to 4.2.26, the build
backend was changed in the layer also.

Even though the recipe compilation didn't fail, it didn't install the required
files (it pretty much produced empty folders), because the build backend
required a much newer setuptools version than the one provided by oe-core,
it errored out silently. This problem may be hidden by other layers that
ship a newer version of setuptools, like the kirkstone-rust branch in
meta-lts-mixins layer.

To be able to install the recipe (without adding extra layers), this patch
partially reverts the build backend change from upstream, and adds back
setuptools build support.

Ptest summary after this patch:
Ran 16377 tests in 353.124s
OK (skipped=1287, expected failures=5)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-add-back-setuptools-support.patch    | 179 ++++++++++++++++++
 .../python/python3-django_4.2.27.bb           |   5 +-
 2 files changed, 182 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.27/0001-add-back-setuptools-support.patch

diff --git a/meta-python/recipes-devtools/python/python3-django-4.2.27/0001-add-back-setuptools-support.patch b/meta-python/recipes-devtools/python/python3-django-4.2.27/0001-add-back-setuptools-support.patch
new file mode 100644
index 0000000000..907f705e11
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django-4.2.27/0001-add-back-setuptools-support.patch
@@ -0,0 +1,179 @@
+From 737b87cc374dc0e66fb7dd218848e1a3a0359a6a Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 19 Jan 2026 14:58:27 +0100
+Subject: [PATCH] add back setuptools support
+
+Starting 4.2.21 the project started to use setuptools build_mets
+build backend, however it requires a much newer setuptools3 package than
+the one provided by oe-core in the Kirkstone branch, and it fails to
+install any files.
+
+This patch reverts partially the commit [1] that added support for
+build_meta backend, and adds back the setuptools support.
+
+[1]: https://github.com/django/django/commit/afe52d89c4f42870622a4bb161ab5f4d4913aac5
+Upstream-Status: Inappropriate [OE-specific, too old Setuptools recipe]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ extras/Makefile |  9 +++++++
+ setup.cfg       | 71 +++++++++++++++++++++++++++++++++++++++++++++++--
+ setup.py        | 54 +++++++++++++++++++++++++++++++++++++
+ 3 files changed, 132 insertions(+), 2 deletions(-)
+ create mode 100644 extras/Makefile
+ create mode 100644 setup.py
+
+diff --git a/extras/Makefile b/extras/Makefile
+new file mode 100644
+index 0000000..66efd0d
+--- /dev/null
++++ b/extras/Makefile
+@@ -0,0 +1,9 @@
++all: sdist bdist_wheel
++
++sdist:
++	python setup.py sdist
++
++bdist_wheel:
++	python setup.py bdist_wheel
++
++.PHONY : sdist bdist_wheel
+diff --git a/setup.cfg b/setup.cfg
+index 8bfd5a1..8b0d399 100644
+--- a/setup.cfg
++++ b/setup.cfg
+@@ -1,4 +1,71 @@
+-[egg_info]
++[metadata]
++name = Django
++version = attr: django.__version__
++url = https://www.djangoproject.com/
++author = Django Software Foundation
++author_email = foundation@djangoproject.com
++description = A high-level Python web framework that encourages rapid development and clean, pragmatic design.
++long_description = file: README.rst
++license = BSD-3-Clause
++classifiers =
++    Development Status :: 5 - Production/Stable
++    Environment :: Web Environment
++    Framework :: Django
++    Intended Audience :: Developers
++    License :: OSI Approved :: BSD License
++    Operating System :: OS Independent
++    Programming Language :: Python
++    Programming Language :: Python :: 3
++    Programming Language :: Python :: 3 :: Only
++    Programming Language :: Python :: 3.8
++    Programming Language :: Python :: 3.9
++    Programming Language :: Python :: 3.10
++    Programming Language :: Python :: 3.11
++    Programming Language :: Python :: 3.12
++    Topic :: Internet :: WWW/HTTP
++    Topic :: Internet :: WWW/HTTP :: Dynamic Content
++    Topic :: Internet :: WWW/HTTP :: WSGI
++    Topic :: Software Development :: Libraries :: Application Frameworks
++    Topic :: Software Development :: Libraries :: Python Modules
++project_urls =
++    Documentation = https://docs.djangoproject.com/
++    Release notes = https://docs.djangoproject.com/en/stable/releases/
++    Funding = https://www.djangoproject.com/fundraising/
++    Source = https://github.com/django/django
++    Tracker = https://code.djangoproject.com/
++
++[options]
++python_requires = >=3.8
++packages = find:
++include_package_data = true
++zip_safe = false
++install_requires =
++    asgiref >= 3.6.0, < 4
++    backports.zoneinfo; python_version<"3.9"
++    sqlparse >= 0.3.1
++    tzdata; sys_platform == 'win32'
++
++[options.entry_points]
++console_scripts =
++    django-admin = django.core.management:execute_from_command_line
++
++[options.extras_require]
++argon2 = argon2-cffi >= 19.1.0
++bcrypt = bcrypt
++
++[flake8]
++exclude = build,.git,.tox,./tests/.env
++extend-ignore = E203
++max-line-length = 88
++per-file-ignores =
++    django/core/cache/backends/filebased.py:W601
++    django/core/cache/backends/base.py:W601
++    django/core/cache/backends/redis.py:W601
++    tests/cache/tests.py:W601
++
++[isort]
++profile = black
++default_section = THIRDPARTY
++known_first_party = django[egg_info]
+ tag_build = 
+ tag_date = 0
+-
+diff --git a/setup.py b/setup.py
+new file mode 100644
+index 0000000..f0e82b7
+--- /dev/null
++++ b/setup.py
+@@ -0,0 +1,55 @@
++import os
++import site
++import sys
++from distutils.sysconfig import get_python_lib
++
++from setuptools import setup
++
++# Allow editable install into user site directory.
++# See https://github.com/pypa/pip/issues/7953.
++site.ENABLE_USER_SITE = "--user" in sys.argv[1:]
++
++# Warn if we are installing over top of an existing installation. This can
++# cause issues where files that were deleted from a more recent Django are
++# still present in site-packages. See #18115.
++overlay_warning = False
++if "install" in sys.argv:
++    lib_paths = [get_python_lib()]
++    if lib_paths[0].startswith("/usr/lib/"):
++        # We have to try also with an explicit prefix of /usr/local in order to
++        # catch Debian's custom user site-packages directory.
++        lib_paths.append(get_python_lib(prefix="/usr/local"))
++    for lib_path in lib_paths:
++        existing_path = os.path.abspath(os.path.join(lib_path, "django"))
++        if os.path.exists(existing_path):
++            # We note the need for the warning here, but present it after the
++            # command is run, so it's more likely to be seen.
++            overlay_warning = True
++            break
++
++
++setup()
++
++
++if overlay_warning:
++    sys.stderr.write(
++        """
++
++========
++WARNING!
++========
++
++You have just installed Django over top of an existing
++installation, without removing it first. Because of this,
++your install may now include extraneous files from a
++previous version that have since been removed from
++Django. This is known to cause a variety of problems. You
++should manually remove the
++
++%(existing_path)s
++
++directory and re-install Django.
++
++"""
++        % {"existing_path": existing_path}
++    )
diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
index 32fd235937..fba21cd75f 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.27.bb
@@ -1,7 +1,8 @@
 require python-django.inc
-#From 4.2.22 onwards setuptools configuration migrated to pyproject.toml
-inherit pypi python_setuptools_build_meta
 
+inherit pypi setuptools3
+
+SRC_URI += "file://0001-add-back-setuptools-support.patch"
 SRC_URI[sha256sum] = "b865fbe0f4a3d1ee36594c5efa42b20db3c8bbb10dff0736face1c6e4bda5b92"
 
 RDEPENDS:${PN} += "\

