Return-Path: <awais.belal@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37C6C19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 09:33:17 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.7483.1741339989126098444
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Mar 2025 01:33:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Etsvvdss;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bcf9612f4so13438795e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 01:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741339987; x=1741944787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ozi6qS60RCql7xtarpLqvQo428b1UmYRaRKuEoMwGFI=;
        b=EtsvvdssQp18QOajgtVqzDbWfkuvynmK7Y9gbZoJAAsCtpjYYYPXwxjEnLxBXRGO1T
         GUSxzS6ntKm2fL9VCpUQalAHZSoykOWeTgkIfSZss3m4HzBRPEragBNbozMFBme4g1eT
         NqqwHceg7T5j/wLK9gXYsNzLXV5s6YvGnuh+UAocc2JbHqb1qyWCVlJGaei0zhdodzlf
         nL3lnd3cGZzhUu8WsbCWNC9vtZy6gNxFyl7PmlilPHvUo4D9EP0+tdSNXh+Ht+wyAkig
         rMK/rN4zpx8zvH7wJGLihu/ZFbbfAw8VmDayWc9Y4Q0tWAMyZPf68WGpuJib4rt1wAQ1
         1/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741339987; x=1741944787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ozi6qS60RCql7xtarpLqvQo428b1UmYRaRKuEoMwGFI=;
        b=YDFOpv3cbWpmeXFZAQM1OOObDgWyVWbXjZoXQXuCJDJfs1RdzTL5mgG3yGj+Gq80D9
         tArA/JDuF9hp16Ylw2Gti1XvrjudHNhgGSGPAMukbzLx20xi6Quz/KTXEIyPce0draww
         1uWXdU5kP7SUhLJRqGdOkj1E/JnKjWvxbDNgRfGQI91pu7l5FWOMrv5mFHn4e1hEQRTv
         ELU3WjU61s/OHj9gOKwKbtu1HlI75DNnIVLiX1gBOpEI4lQY/31mOsvAEjjtRCuIzOSi
         AAilSLmNpbfu6b2Utq9u4cdG8r/9xG6FWbYZDXf91lFebfxPT1b+7wNTKLuF9OSTS1q3
         JHSQ==
X-Gm-Message-State: AOJu0YzR9udVxWSFYxbWZHmG5gSntMmy+FCxHtoz5rUbKVBbgTYC5Us0
	WUxCGagmKnK9QkKi2ExFDwaud0Cq0gWydzhBQeTcsLxnuhQdjoaQUmFNUA==
X-Gm-Gg: ASbGncs5ebnbcc3XyMvQP3J7wWrwfpjN4zoxZAKxMj02gZ6tZWh8qStpzB6wv/RfYFm
	e+shCESji4xD5SfLzI/OI0ARvUZTRGAk4lJeb3Gs2IlcoeERbbPcko2+VSFlkjDnNSDNZM9uLw9
	JRG3+2zKtT5eVpn59HW/TicAGMfiHN+rJ2F0r7Fh6wPanXWlgWwbfv+TO4vf1BAIA/LfTjRPXl6
	jP1FCW1SBPcCWTP/7hGrw8Uiq6V/bxfIYeslRMk5Hk/0T7BRxzHaFGDEyj8dbblgLnQyNegodMa
	NYzPSbssHqAul8Pv831+A4YUq+OFeRDYJ2hogqHqJ4LceqM=
X-Google-Smtp-Source: AGHT+IG8mFrSgTsBM8KUnYu7dQojLQ18aXhSfIfW0hx1kJPxvJF2SzMg3mM/6b8vbwIzlCYxEFS0vg==
X-Received: by 2002:a05:600c:1d10:b0:439:a1f2:50a3 with SMTP id 5b1f17b1804b1-43c5a630678mr18468535e9.4.1741339986845;
        Fri, 07 Mar 2025 01:33:06 -0800 (PST)
Received: from elitebook.. ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c01952dsm4668359f8f.45.2025.03.07.01.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 01:33:06 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Awais Belal <awais.belal@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 1/2] mongodb: fix build with python 3.12
Date: Fri,  7 Mar 2025 14:32:54 +0500
Message-Id: <20250307093255.1110778-1-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 09:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115780

The moduleconfig.py build script uses the 'imp' module which
is deprecated in favor of 'importlib' in python 3.12. This fixes
the build issue by replacing the affected portion of the code
and the package now builds fine on hosts with python 3.12.

Signed-off-by: Awais Belal <awais.belal@gmail.com>
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
index ee5c77a85d..f7fd881713 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -36,6 +36,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
            file://0001-Fix-build-on-32bit.patch \
+           file://0001-moduleconfig.py-python-3.12-compatibility.patch \
            "
 SRC_URI:append:libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
@@ -145,5 +146,3 @@ SYSTEMD_SERVICE:${PN} = "mongod.service"
 FILES:${PN} += "${nonarch_libdir}/tmpfiles.d"
 
 RDEPENDS:${PN} += "tzdata-core"
-
-SKIP_RECIPE[mongodb] ?= "Needs porting to python 3.12"
-- 
2.34.1


