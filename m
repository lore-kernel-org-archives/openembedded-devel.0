Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAE1C47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 16:37:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.79480.1705941430676520024
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 08:37:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MhrfujIg;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40ea5654271so23314825e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 08:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705941429; x=1706546229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nwGpEycKM4KrbNpjBEaqtIJWFlz4oaEgczjo/vAknEQ=;
        b=MhrfujIgptaMUkqzp2IMNgvd/DETCxPC2PDUfIDoL9D2T61KISJ8PsKVOWPCSjTUMV
         avSiKD5AhbMZbbRZ0ft/bCNefaLGMtWrgyoSl6FhTjbvxMyCalZIYO4+cKYMYSMoWjJt
         PVbw++87gkh5juO3AFGDhBQ4lIrf5/FL+GTHOHcCxB2dPZz2T4x5K3bNJkTQC9hAebuX
         2D7dgkacsErjT0ePXCShPsLnr7CYbIxmtAArJuqAJSjUvQhI11yUmrqIavIYsO/sVHRT
         QIDE+HqzJ8nTvfP4xa4XQP/WRmubyjYZkMkOdUXISQiD7SQ9EbEd0q6WoTR1186IjYFN
         DYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705941429; x=1706546229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nwGpEycKM4KrbNpjBEaqtIJWFlz4oaEgczjo/vAknEQ=;
        b=ZSqIJVSvqOlVoxZRD96ErciYKOhkZmyQh4Qq3qX3iAX0hPwINoGduflcJKxB+A/lrs
         sqvXhKok/4kJQ06iXoGCeyzdBPz0/0FujVSDXav34twvTHtEhtbhvMOJbyoLx+iqN0RS
         nEN7Ep0fiFdwUXQSKJUJTLDNbqh3joiol1NBAqOpmGHzmI1rlZf5Uu0eQlbQgKuNo9e6
         wyUXdZhEQUy8FItgz0XFDeYse7oooefMQyzpUPrkRBh1KSw2esjX44YOIPIWJkEN9Gz6
         641hElN4tV52Ohqda8+ZiyJkv2HINHg5k6MGG6wRP2rCSunUGYjW5M1onbjN9gZTANfq
         BcXw==
X-Gm-Message-State: AOJu0Yxbqyk2u4hzYvBFi9hugDHVpUEN3DyBSTspb0uagh71gGZjSEgX
	TL2NKfmLdyaOkdPbBmjggs9gQKdnu3kRF4ZexCCzTeGOorXt5AYunQicV3Mu
X-Google-Smtp-Source: AGHT+IGge+EC1sS6ntD/7SMfZ1Aek9GrQyBhwhQm4xQ65aIIU5bdHd+Dca4QpZxzAtM/iJy/hEI3yw==
X-Received: by 2002:a05:600c:4448:b0:40e:b21d:6bed with SMTP id v8-20020a05600c444800b0040eb21d6bedmr397052wmn.96.1705941428683;
        Mon, 22 Jan 2024 08:37:08 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id jg1-20020a05600ca00100b0040d4e1393dcsm43037804wmb.20.2024.01.22.08.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 08:37:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alex@linutronix.de,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libtalloc, libtevent, libtdb, libldb: set PYTHONARCHDIR for waf to respect python libdir
Date: Mon, 22 Jan 2024 17:36:57 +0100
Message-ID: <20240122163657.2571699-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jan 2024 16:37:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108371

* fixes installed-vs-shipped when libdir in target is different than in
  native python e.g. with multilib enabled:

ERROR: QA Issue: libtdb: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.12/site-packages/tdb.so
  /usr/lib/python3.12/site-packages/_tdb_text.py
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libtdb: 2 installed and not shipped files. [installed-vs-shipped]

ERROR: QA Issue: libtalloc: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.12/site-packages/talloc.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libtalloc: 1 installed and not shipped files. [installed-vs-shipped]

ERROR: QA Issue: libtevent: Files/directories were installed but not shipped in any package:
  /usr/lib/python3.12/site-packages/_tevent.so
  /usr/lib/python3.12/site-packages/tevent.py
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-libtevent: 2 installed and not shipped files. [installed-vs-shipped]

* waflib has some fallback to query distutils when PYTHONARCHDIR isn't
  set in environment as in:
  https://gitlab.com/ita1024/waf/-/commit/84c26588fc3d479a1e79e1edacaa2cf052286c07

  but this still returns wrong value from
  print(get_python_lib(plat_specific=1, standard_lib=0, prefix='/usr'))
  e.g.
  /usr/lib/python3.12/site-packages
  matching native layout instead of:
  /usr/lib64/python3.12/site-packages

* python3targetconfig inherit breaks waflib as well as shown in config.log:
['libtdb/1.4.9/recipe-sysroot-native/usr/bin/python3-native/python3', '-c', "\ntry:\n\tfrom distutils.sysconfig import get_config_var, get_python_lib\nexcept ImportError:\n\tfrom sysconfig import get_config_var, get_path\n\tdef get_python_lib(*k, **kw):\n\t\tkeyword='platlib' if kw.get('plat_specific') else 'purelib'\n\t\tif 'prefix' in kw:\n\t\t\treturn get_path(keyword, vars={'installed_base': kw['prefix'], 'platbase': kw['prefix']})\n\t\treturn get_path(keyword)\n\nprint(repr(get_python_lib(standard_lib=0, prefix='/usr') or ''))"]
err: Traceback (most recent call last):
  File "<string>", line 12, in <module>
  File "<string>", line 9, in get_python_lib
  File "libtdb/1.4.9/recipe-sysroot-native/usr/lib/python3.12/sysconfig.py", line 636, in get_path
    return get_paths(scheme, vars, expand)[name]
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "libtdb/1.4.9/recipe-sysroot-native/usr/lib/python3.12/sysconfig.py", line 626, in get_paths
    return _expand_vars(scheme, vars)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "libtdb/1.4.9/recipe-sysroot-native/usr/lib/python3.12/sysconfig.py", line 270, in _expand_vars
    _extend_dict(vars, get_config_vars())
                       ^^^^^^^^^^^^^^^^^
  File "libtdb/1.4.9/recipe-sysroot-native/usr/lib/python3.12/sysconfig.py", line 728, in get_config_vars
    _init_config_vars()
  File "libtdb/1.4.9/recipe-sysroot-native/usr/lib/python3.12/sysconfig.py", line 670, in _init_config_vars
    _init_posix(_CONFIG_VARS)
  File "libtdb/1.4.9/recipe-sysroot-native/usr/lib/python3.12/sysconfig.py", line 536, in _init_posix
    _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ModuleNotFoundError: No module named '_sysconfigdata'

* setting PYTHONARCHDIR is simplest fix

* this also fixes libldb failure when it fails to find e.g. tevent after
  these installed-vs-shipped issues instealled it in wrong libdir:

Checking for system tevent (>=0.15.0)                                                           : yes
Traceback (most recent call last):
  File "lib32-libldb/2.8.0/ldb-2.8.0/third_party/waf/waflib/Scripting.py", line 159, in waf_entry_point
    run_commands()
  File "lib32-libldb/2.8.0/ldb-2.8.0/third_party/waf/waflib/Scripting.py", line 255, in run_commands
    ctx = run_command(cmd_name)
          ^^^^^^^^^^^^^^^^^^^^^
  File "lib32-libldb/2.8.0/ldb-2.8.0/third_party/waf/waflib/Scripting.py", line 239, in run_command
    ctx.execute()
  File "lib32-libldb/2.8.0/ldb-2.8.0/third_party/waf/waflib/Configure.py", line 159, in execute
    super(ConfigurationContext, self).execute()
  File "lib32-libldb/2.8.0/ldb-2.8.0/third_party/waf/waflib/Context.py", line 214, in execute
    self.recurse([os.path.dirname(g_module.root_path)])
  File "lib32-libldb/2.8.0/ldb-2.8.0/third_party/waf/waflib/Context.py", line 296, in recurse
    user_function(self)
  File "lib32-libldb/2.8.0/ldb-2.8.0/wscript", line 54, in configure
    conf.RECURSE('lib/tevent')
  File "lib32-libldb/2.8.0/ldb-2.8.0/buildtools/wafsamba/samba_utils.py", line 66, in fun
    return f(*k, **kw)
           ^^^^^^^^^^^
  File "lib32-libldb/2.8.0/ldb-2.8.0/buildtools/wafsamba/samba_utils.py", line 469, in RECURSE
    return ctx.recurse(relpath)
           ^^^^^^^^^^^^^^^^^^^^
  File "lib32-libldb/2.8.0/ldb-2.8.0/third_party/waf/waflib/Context.py", line 296, in recurse
    user_function(self)
  File "lib32-libldb/2.8.0/ldb-2.8.0/lib/tevent/wscript", line 51, in configure
    conf.CHECK_BUNDLED_SYSTEM_PYTHON('pytevent', 'tevent', minversion=VERSION):
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "lib32-libldb/2.8.0/ldb-2.8.0/buildtools/wafsamba/samba_utils.py", line 66, in fun
    return f(*k, **kw)
           ^^^^^^^^^^^
  File "lib32-libldb/2.8.0/ldb-2.8.0/buildtools/wafsamba/samba_bundled.py", line 270, in CHECK_BUNDLED_SYSTEM_PYTHON
    if not found and not conf.LIB_MAY_BE_BUNDLED(libname):
           ^^^^^
UnboundLocalError: cannot access local variable 'found' where it is not associated with a value

and then it needs PYTHONARCHDIR as well to fix:

ERROR: libldb-2.8.0-r0 do_package: QA Issue: libldb: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/python3.12
  /usr/lib/python3.12/site-packages
  /usr/lib/python3.12/site-packages/_ldb_text.py
  /usr/lib/python3.12/site-packages/ldb.so
  /usr/lib/python3.12/site-packages/.debug
  /usr/lib/python3.12/site-packages/.debug/ldb.so
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libldb: 7 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-networking/recipes-support/libldb/libldb_2.8.0.bb        | 1 +
 meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb  | 1 +
 meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb        | 1 +
 meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb b/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
index ec56eb0205..58d683eab4 100644
--- a/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
+++ b/meta-networking/recipes-support/libldb/libldb_2.8.0.bb
@@ -7,6 +7,7 @@ DEPENDS += "libtdb libtalloc libtevent popt cmocka"
 RDEPENDS:pyldb += "python3"
 
 export PYTHONHASHSEED="1"
+export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
 SRC_URI = "http://samba.org/ftp/ldb/ldb-${PV}.tar.gz \
            file://0001-do-not-import-target-module-while-cross-compile.patch \
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb
index bf7fbc8649..92da03e1a1 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://talloc.h;beginline=3;endline=27;md5=a301712782cad6dd6
                     "
 
 export PYTHONHASHSEED="1"
+export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
 SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://0001-talloc-Add-configure-options-for-packages.patch \
diff --git a/meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb b/meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb
index 248b72967d..9367600351 100644
--- a/meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb
+++ b/meta-networking/recipes-support/libtdb/libtdb_1.4.9.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://tools/tdbdump.c;endline=18;md5=b59cd45aa8624578126a8c
                     file://include/tdb.h;endline=27;md5=f5bb544641d3081821bcc1dd58310be6"
 
 export PYTHONHASHSEED="1"
+export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
 SRC_URI = "https://samba.org/ftp/tdb/tdb-${PV}.tar.gz \
            file://0001-tdb-Add-configure-options-for-packages.patch \
diff --git a/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb b/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
index 0158f8bc74..67f36083bf 100644
--- a/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
+++ b/meta-networking/recipes-support/libtevent/libtevent_0.16.0.bb
@@ -7,6 +7,7 @@ DEPENDS += "libtalloc libtirpc cmocka"
 RDEPENDS:python3-tevent = "python3"
 
 export PYTHONHASHSEED="1"
+export PYTHONARCHDIR = "${PYTHON_SITEPACKAGES_DIR}"
 
 SRC_URI = "https://samba.org/ftp/tevent/tevent-${PV}.tar.gz \
            file://0001-Add-configure-options-for-packages.patch \
-- 
2.43.0


