Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10134.1794999716143936896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=lE9XRdHB;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: awais.belal@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b001cd92bso429026f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999714; x=1795604514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5BXv9CQLoDzkliHTOi5il9msz4YPKJveXjizvcfWBc=;
        b=lE9XRdHBzx6/oXHLesDAYAQGuFuu0nZ43bD5Bao8IBoTfuyHDqlMw6KtrpCc0DVf42
         GnAYs4E3ipjgHQlFZu0UCeHl3XsY1a97DE23TcnfLIJLXFOGA1g4Qjx7makEaabYiM5L
         woMRZYKbFmEJycS46AvWj5QqZWGBzrDe0XJ9BSv5ilwBunbevS6Er1KQ1KsVdOkHvHC6
         T0O23R+6AhAMNy4pSYrb8eR+cL1ORSr74iW7vSzkllf8nElE8ArBt/dQrCAKTUcQdWlA
         MlXWgY2krLnhgClDySdmg6UiLwbRjAGGztFW3ANc9O/u4Ci4D8SPwTTQmGNeG1sS6R1h
         ML6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999714; x=1795604514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5BXv9CQLoDzkliHTOi5il9msz4YPKJveXjizvcfWBc=;
        b=Afna3r7brmbJ7r7uoyNWcgBmZ6IJq+FY164FioX0rNOay2uVOtuRsN47nVNL/qxWYz
         rKZS/LtPs7iPmkxcuvqbkb9MrHqtJiFzxC4Ms2Qc1iAVpRBFyVFtsIW2Wx9TE0iVXvbq
         yPtcIxOpHJ5KiiX6TbI+V9cijR9qRbHl8I4OMNNfALAaHaCG3fPqxSYScEwkhrniHdTl
         pDio8Y12Xj23X3y597Sv3eNtgCqNZiGHyrB6k1TGrsmgG/jq1cIuGgmlcKDPWiLHNNpp
         ccuxoZg5NJ+ifPJTVpTdUm6iOQ8mio/dvbFs/fsRMYb07APGb9cO0Jk90bJ65HvWTPK3
         F9Eg==
X-Gm-Message-State: APuU4Z9kU974/7NX+ohu/ooVuXw5FVJhndJqQfPfMWoaRuuOYCBAermZ
	FBUO+q0W0QnHsVcjY9tyLZTvYCBolh59M5Kq2fs1jWP3oVqIL0qRLv0r+uuljG3q
X-Gm-Gg: AYBFou3MhtjO06leoMPVm77ZIMc1yd9VonnT61G7Q8JG75my0sZqiSSJYtzrlLGhqAG
	XTveN1+8SRdsC16mPmhpG42h5I1gJW/ADzAOAYGvUNZQJDXE8SXoNjDKCDj+CigXo3LNjmU/j4Z
	gU8SmpS68DMVSJ1HNzUG6uvlsueCiUqFXYxrSugqMLfCysjfii5wTZXNCDIF3iqQNnWqdJTg4DA
	LmzouLrOtUhBiXbgVwPNfygtDhh0yJVCPFExI1zmwRyfIDhfZ6n2Njpljo2nOFt3h8Cj1+olIaJ
	amryzDDLYoNy2qOd9zONF5dNxOqlbg9Rvh84JdqTbxnOPrNZaqJUe0Zw18vcw3RfxD3+P35wngQ
	mSbNe8FOnhFTglrKqJTJOyWInd3ACmh8TwNlOEFxjuhLdZU2u6h62fKkE+hDOqQfnfkez76vYZw
	ZSr8zid3WzK/y9qS+BXexjLTTO4cmaFi0dh7/sdqe+ksZAoOgUf35d6S5k6EkWYprq/Zos03mV2
	b09TguXQ3bYTuXX7KxfQHXBaOH/EcsEVSjQHSE4kk3vnlqWwUWaos4nB9+uQndiX6dPzKAzk+pF
	ptDMueY3f8hJG7rf7Y+aAiqmyO5biAczwY1odF3aY6GCDHcXYXvIZp4b37z6HzPJ3Oiq092L5so
	=
X-Received: by 2002:a05:600c:4685:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb7da5a6e3mr38653515e9.33.1794999714055;
        Wed, 18 Nov 2026 03:01:54 -0800 (PST)
Return-Path: <awais.belal@gmail.com>
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57f6f9sm23139885e9.2.2026.11.18.03.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:01:53 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Awais Belal <awais.belal@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Awais B <awais.b@rufilla.com>
Subject: [meta-oe][wrynose][PATCH 1/7] mongodb: fix build with python 3.12
Date: Wed, 18 Nov 2026 16:01:14 +0500
Message-Id: <20261118110120.3913031-2-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118110120.3913031-1-awais.belal@gmail.com>
References: <20261118110120.3913031-1-awais.belal@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132638
Content-Type: text/plain; charset="utf-8"

The moduleconfig.py build script uses the 'imp' module which
is deprecated in favor of 'importlib' in python 3.12. This fixes
the build issue by replacing the affected portion of the code
and the package now builds fine on hosts with python 3.12.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b14547d10254c50f729cc3f7c844c6f31f10ba68)
Signed-off-by: Awais B <awais.b@rufilla.com>
---
 ...econfig.py-python-3.12-compatibility.patch | 57 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  3 +-
 2 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
new file mode 100644
index 0000000000..51926b9d2e
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
@@ -0,0 +1,57 @@
+From 37580777bc5294d606584f3731d9f5f5425bb587 Mon Sep 17 00:00:00 2001
+From: Awais B <awais.b@rufilla.com>
+Date: Tue, 4 Mar 2025 11:27:10 +0000
+Subject: [PATCH] moduleconfig.py: python 3.12 compatibility
+
+The imp module was deprecated in python 3.4 and is dropped
+with python 3.12. We now need to use importlib for the
+purpose of manipulating/loading modules.
+
+Upstream-Status: Pending
+Signed-off-by: Awais B <awais.b@rufilla.com>
+---
+ buildscripts/moduleconfig.py | 21 ++++++++++++++-------
+ 1 file changed, 14 insertions(+), 7 deletions(-)
+
+diff --git a/buildscripts/moduleconfig.py b/buildscripts/moduleconfig.py
+index b4d0bba0490..69dd91ab30d 100644
+--- a/buildscripts/moduleconfig.py
++++ b/buildscripts/moduleconfig.py
+@@ -27,7 +27,8 @@ MongoDB SConscript files do.
+ __all__ = ('discover_modules', 'discover_module_directories', 'configure_modules',
+            'register_module_test')  # pylint: disable=undefined-all-variable
+ 
+-import imp
++import importlib
++import sys
+ import inspect
+ import os
+ 
+@@ -71,12 +72,18 @@ def discover_modules(module_root, allowed_modules):
+             print("adding module: %s" % (name))
+             fp = open(build_py, "r")
+             try:
+-                module = imp.load_module("module_" + name, fp, build_py,
+-                                         (".py", "r", imp.PY_SOURCE))
+-                if getattr(module, "name", None) is None:
+-                    module.name = name
+-                found_modules.append(module)
+-                found_module_names.append(name)
++                module_name = "module_" + name
++                module_spec = importlib.util.spec_from_file_location(module_name, build_py)
++
++                if module_spec is not None:
++                    module = importlib.util.module_from_spec(module_spec)
++                    sys.modules[module_name] = module
++                    module_spec.loader.exec_module(module)
++
++                    if not hasattr(module, "name"):
++                        module.name = name
++                    found_modules.append(module)
++                    found_module_names.append(name)
+             finally:
+                 fp.close()
+         except (FileNotFoundError, IOError):
+-- 
+2.34.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 23515d9fa8..0f4a5c4423 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            file://0001-Fix-build-on-32bit.patch \
+           file://0001-moduleconfig.py-python-3.12-compatibility.patch \
            "
 SRC_URI:append:libc-musl = "\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
@@ -140,5 +141,3 @@ SYSTEMD_SERVICE:${PN} = "mongod.service"
 FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
 
 RDEPENDS:${PN} += "tzdata-core"
-
-SKIP_RECIPE[mongodb] ?= "Needs porting to python 3.12"
-- 
2.34.1

