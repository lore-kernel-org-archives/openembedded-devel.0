Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1908.1795113495166776296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 10:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OvkcAfYx;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so108788b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 10:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795113494; x=1795718294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2g0IjJLLnWPQDYoyIr4qJqM6t31zYYKQTRXLoEtMRhk=;
        b=OvkcAfYx6jio/vBwjr8hTn7SwLpcqJamX2oPWoyj5kXpa23GjGEEBmDdxgG8uMP+nw
         PNdHp+EGwEwFd6/8rCMaGkXL8izP3ZoJVwzN03X0slSVOx/dgy/DQeqfbJp1zAdRwDDL
         yX3EF9F/pyHYvIegQrzodRuREaaTor9s4kwI0AYFFRC4i/dhL6pnyJNScaFHvu57ZC3F
         Wf5ZZM4fooia3Oxdsf9inYG2DckhEqWEIAhAstsPME3ZPjxiQ2ikX8IQo9qQeLT7glZv
         69sWOGEp+SjGf3ZSC5K1X6V0ptHsAbKbjxRDlE3UQE4qZ9TzddttPCM03KlalmQOKeHb
         +3Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795113494; x=1795718294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2g0IjJLLnWPQDYoyIr4qJqM6t31zYYKQTRXLoEtMRhk=;
        b=JHhTbA9i2OPWKgmolmk1OnNLngsyhRTxWf7csR5y8daXIcCt7Ra+T2H5BwA9Y6cLmR
         FQV7Zbg/ez468/CVuSYl6QPi6RXCEqESRGBuuq1qGbj3tVglFq7fkXF0eMCqa6cl6xjU
         oNAYD1RrF1riQ6x/tc0bs6OXnZ67KpyrB7W+TM6gp3gpYF1PmOTZMSE8sDu9Bz3uufFe
         shfO+Nb5pA1/mZ4lJz/5stGO20k0kRcnxu8vsu9kHvYuuwijyieWZCUP9tGGjhWTPAnq
         g3CYt3D6CMgNSyJd6CcUmuNYb7sGwCrBhNmqG1OGxT8OLUhFpvTft308DbDxJqg4j5jR
         jPFg==
X-Gm-Message-State: APuU4Z+Rjg3Sgk45Zr7F1UfYl7QDauzdA4H5XbDHCNElT6Nql5mEANxi
	gLGLd6UR6R16AVqorUSc41Iewj77tRMRTzv3OuyldmaVF/OM1MzmvsCVcPvNkw==
X-Gm-Gg: AYBFou0zLwrANPG0j069NlNT/YxAc8S/TPdPhzYnlQCjZ+zEGpfIVDZcryY4W8ZdFkV
	iKGUwJ70vcHGCGViD9BtWD6pSju2HRfXcJCzpczmJxTPZ/c3gsSIdott1pniFlfgY/c3W2wsvbA
	jB59PsLBzMeRVwjZmkNeikcbfxZ7OLO4algrBEWoq78UXirSLhq1rFtnN2Qas3Wvyc1U44PmB3I
	wx/jaeyzFEa4V8j96Wbyvl/hn8Qt+JfPiLKu6M9pMKdFssMBGT9dj5ZFs5+ucjgpdFEvKrGqySa
	oPVcX5AVoD1WjIPH7uI+rRsZRqLi6W2AQy1hMUj3wnmzeykUAEXGY6GzKCnECoxEvBWl8Iy+27l
	Yp0NN3GkbucAAlbdArv9ckNpcWYB0SMBI4AuPg7EnNhWsS0bCLUYrkLxygK6PlPwAfcHINfRI5N
	uL7Ija/Ks+vqfWrvi//rvL0KjNuAITuvju0lMN16icx0Q2hG5eaN26xIQH/R6nkHdc0x4dNadY2
	m3x7lI4pHDYm8EZEwga5y719ZxbXGDJFPSH7znbPzEzM4ONWKRXuRvVurQzb70066hCElbGSbQH
	u40hqeJBP0/AkQAemZ6eq4kyZuQfghbmiRFaVPhUAtZ0+JVNrtDnKyF+IV7DAA==
X-Received: by 2002:aa7:8893:0:b0:89f:9da8:1b66 with SMTP id d2e1a72fcca58-8c87c389aedmr472233b3a.33.1795113494503;
        Thu, 19 Nov 2026 10:38:14 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm294518b3a.21.2026.11.19.10.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:38:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Awais Belal <awais.belal@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 55/64] mongodb: fix build with python 3.12
Date: Fri, 20 Nov 2026 07:33:23 +1300
Message-ID: <b5382389cc9a22f49d766351567cd252cd4067a8.1795112941.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795112941.git.ankur.tyagi85@gmail.com>
References: <cover.1795112941.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 18:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132745
Content-Type: text/plain; charset="utf-8"

From: Awais Belal <awais.belal@gmail.com>

The moduleconfig.py build script uses the 'imp' module which
is deprecated in favor of 'importlib' in python 3.12. This fixes
the build issue by replacing the affected portion of the code
and the package now builds fine on hosts with python 3.12.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit edd1a1e284fdcb80cd48d411f235d47f23bc27ae)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
index 36bea146b4..8f28bc76c6 100644
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
